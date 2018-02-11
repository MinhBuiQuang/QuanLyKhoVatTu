using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Security.Cryptography;
using Microsoft.Win32;
using System.Text.RegularExpressions;

namespace DesignClasses
{
    public class Utilities
    {
        public static string sqlRptAbs = string.Empty;
        public static string titleRptAbs = string.Empty;
        public static string sqlRptDept = string.Empty;
        public static float Policy = 1;
        public static string userName = string.Empty;
        public static string passWord = string.Empty;
        public static string dbName = string.Empty;


        public static string Encrypt(string plainText,
                                    string passPhrase,
                                    string saltValue,
                                    string hashAlgorithm,
                                    int passwordIterations,
                                    string initVector,
                                    int keySize)
        {
            // Convert strings into byte arrays.
            // Let us assume that strings only contain ASCII codes.
            // If strings include Unicode characters, use Unicode, UTF7, or UTF8 
            // encoding.
            byte[] initVectorBytes = Encoding.ASCII.GetBytes(initVector);
            byte[] saltValueBytes = Encoding.ASCII.GetBytes(saltValue);

            // Convert our plaintext into a byte array.
            // Let us assume that plaintext contains UTF8-encoded characters.
            byte[] plainTextBytes = Encoding.UTF8.GetBytes(plainText);

            // First, we must create a password, from which the key will be derived.
            // This password will be generated from the specified passphrase and 
            // salt value. The password will be created using the specified hash 
            // algorithm. Password creation can be done in several iterations.
            PasswordDeriveBytes password = new PasswordDeriveBytes(
                                                            passPhrase,
                                                            saltValueBytes,
                                                            hashAlgorithm,
                                                            passwordIterations);

            // Use the password to generate pseudo-random bytes for the encryption
            // key. Specify the size of the key in bytes (instead of bits).
            byte[] keyBytes = password.GetBytes(keySize / 8);

            // Create uninitialized Rijndael encryption object.
            RijndaelManaged symmetricKey = new RijndaelManaged();

            // It is reasonable to set encryption mode to Cipher Block Chaining
            // (CBC). Use default options for other symmetric key parameters.
            symmetricKey.Mode = CipherMode.CBC;

            // Generate encryptor from the existing key bytes and initialization 
            // vector. Key size will be defined based on the number of the key 
            // bytes.
            ICryptoTransform encryptor = symmetricKey.CreateEncryptor(
                                                             keyBytes,
                                                             initVectorBytes);

            // Define memory stream which will be used to hold encrypted data.
            MemoryStream memoryStream = new MemoryStream();

            // Define cryptographic stream (always use Write mode for encryption).
            CryptoStream cryptoStream = new CryptoStream(memoryStream,
                                                         encryptor,
                                                         CryptoStreamMode.Write);
            // Start encrypting.
            cryptoStream.Write(plainTextBytes, 0, plainTextBytes.Length);

            // Finish encrypting.
            cryptoStream.FlushFinalBlock();

            // Convert our encrypted data from a memory stream into a byte array.
            byte[] cipherTextBytes = memoryStream.ToArray();

            // Close both streams.
            memoryStream.Close();
            cryptoStream.Close();

            // Convert encrypted data into a base64-encoded string.
            string cipherText = Convert.ToBase64String(cipherTextBytes);

            // Return encrypted string.
            return cipherText;
        }

        public static string Decrypt(string cipherText,
                                     string passPhrase,
                                     string saltValue,
                                     string hashAlgorithm,
                                     int passwordIterations,
                                     string initVector,
                                     int keySize)
        {
            // Convert strings defining encryption key characteristics into byte
            // arrays. Let us assume that strings only contain ASCII codes.
            // If strings include Unicode characters, use Unicode, UTF7, or UTF8
            // encoding.
            byte[] initVectorBytes = Encoding.ASCII.GetBytes(initVector);
            byte[] saltValueBytes = Encoding.ASCII.GetBytes(saltValue);

            // Convert our ciphertext into a byte array.
            byte[] cipherTextBytes = Convert.FromBase64String(cipherText);

            // First, we must create a password, from which the key will be 
            // derived. This password will be generated from the specified 
            // passphrase and salt value. The password will be created using
            // the specified hash algorithm. Password creation can be done in
            // several iterations.
            PasswordDeriveBytes password = new PasswordDeriveBytes(
                                                            passPhrase,
                                                            saltValueBytes,
                                                            hashAlgorithm,
                                                            passwordIterations);

            // Use the password to generate pseudo-random bytes for the encryption
            // key. Specify the size of the key in bytes (instead of bits).
            byte[] keyBytes = password.GetBytes(keySize / 8);

            // Create uninitialized Rijndael encryption object.
            RijndaelManaged symmetricKey = new RijndaelManaged();

            // It is reasonable to set encryption mode to Cipher Block Chaining
            // (CBC). Use default options for other symmetric key parameters.
            symmetricKey.Mode = CipherMode.CBC;

            // Generate decryptor from the existing key bytes and initialization 
            // vector. Key size will be defined based on the number of the key 
            // bytes.
            ICryptoTransform decryptor = symmetricKey.CreateDecryptor(
                                                             keyBytes,
                                                             initVectorBytes);

            // Define memory stream which will be used to hold encrypted data.
            MemoryStream memoryStream = new MemoryStream(cipherTextBytes);

            // Define cryptographic stream (always use Read mode for encryption).
            CryptoStream cryptoStream = new CryptoStream(memoryStream,
                                                          decryptor,
                                                          CryptoStreamMode.Read);

            // Since at this point we don't know what the size of decrypted data
            // will be, allocate the buffer long enough to hold ciphertext;
            // plaintext is never longer than ciphertext.
            byte[] plainTextBytes = new byte[cipherTextBytes.Length];

            // Start decrypting.
            int decryptedByteCount = cryptoStream.Read(plainTextBytes,
                                                       0,
                                                       plainTextBytes.Length);

            // Close both streams.
            memoryStream.Close();
            cryptoStream.Close();

            // Convert decrypted data into a string. 
            // Let us assume that the original plaintext string was UTF8-encoded.
            string plainText = Encoding.UTF8.GetString(plainTextBytes,
                                                       0,
                                                       decryptedByteCount);

            // Return decrypted string.   
            return plainText;
        }

        public static string Encrypt(string plainText)
        {
            return Encrypt(plainText, "Pas5pr@se", "s@1tValue", "SHA1", 2, "@1B2c3D4e5F6g7H8", 256);
        }

        public static string Decrypt(string cipherText)
        {
            return Decrypt(cipherText, "Pas5pr@se", "s@1tValue", "SHA1", 2, "@1B2c3D4e5F6g7H8", 256);
        }

        private static string GetOracleHomePath(String OracleHomeRegistryKey)
        {
            RegistryKey rgkLM = Registry.LocalMachine;
            RegistryKey rgkOracleHome = rgkLM.OpenSubKey(@"SOFTWARE\ORACLE\" + OracleHomeRegistryKey);

            if (!rgkOracleHome.Equals(""))
                return rgkOracleHome.GetValue("ORACLE_HOME").ToString();
            return "";
        }

        private static string GetTNSNAMESORAFilePath(String OracleHomeRegistryKey)
        {
            string oracleHomePath = GetOracleHomePath(OracleHomeRegistryKey);
            string tnsNamesOraFilePath = "";
            if (!oracleHomePath.Equals(""))
            {
                tnsNamesOraFilePath = oracleHomePath + @"\NETWORK\ADMIN\TNSNAMES.ORA";
                if (!(System.IO.File.Exists(tnsNamesOraFilePath)))
                {
                    tnsNamesOraFilePath = oracleHomePath + @"\NET80\ADMIN\TNSNAMES.ORA";
                }
            }
            return tnsNamesOraFilePath;
        }

        public static List<string> GetOracleHomes()
        {
            List<string> oracleHomes = new List<string>();
            RegistryKey rgkLM = Registry.LocalMachine;
            RegistryKey rgkAllHome = rgkLM.OpenSubKey(@"SOFTWARE\ORACLE");
            if (rgkAllHome != null)
            {
                foreach (string subkey in rgkAllHome.GetSubKeyNames())
                {
                    if (subkey.StartsWith("KEY_"))
                        oracleHomes.Add(subkey.Remove(0, 4));
                }
            }
            return oracleHomes;
        }

        public static List<string> LoadTNSNames(string OracleHomeRegistryKey)
        {
            List<string> DBNamesCollection = new List<string>();
            string RegExPattern = @"[\n][\s]*[^\(][a-zA-Z0-9_.]+[\s]*=[\s]*\(";
            string strTNSNAMESORAFilePath = GetTNSNAMESORAFilePath(OracleHomeRegistryKey);

            if (!strTNSNAMESORAFilePath.Equals(""))
            {
                //check out that file does physically exists
                System.IO.FileInfo fiTNS = new System.IO.FileInfo(strTNSNAMESORAFilePath);
                if (fiTNS.Exists)
                {
                    if (fiTNS.Length > 0)
                    {
                        //read tnsnames.ora file
                        int iCount;
                        for (iCount = 0; iCount < Regex.Matches(System.IO.File.ReadAllText(fiTNS.FullName), RegExPattern).Count; iCount++)
                        {
                            DBNamesCollection.Add(Regex.Matches(System.IO.File.ReadAllText(fiTNS.FullName), RegExPattern)[iCount].Value.Trim().Substring(0, Regex.Matches(System.IO.File.ReadAllText(fiTNS.FullName), RegExPattern)[iCount].Value.Trim().IndexOf(" ")));
                        }
                    }
                }
            }
            return DBNamesCollection;
        }

        public static void WriteReg(string regPath, string keyName, string value)
        {
            RegistryKey key = Registry.CurrentUser.OpenSubKey(regPath, true);
            if (key == null)
            {
                key = Registry.CurrentUser.CreateSubKey(regPath);
            }
            key.SetValue(keyName, value);
        }

        public static string ReadReg(string regPath, string keyName)
        {
            RegistryKey key = Registry.CurrentUser.OpenSubKey(regPath);
            if (key == null)
            {
                return "";
            }
            else
            {
                try
                {
                    return key.GetValue(keyName).ToString();
                }
                catch
                {
                    return "";
                }
            }
        }

    }

}
