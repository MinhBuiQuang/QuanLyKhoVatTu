module.exports = function () {
    return {
        "database": {
            "server": "127.0.0.1",
            "database": "QuanLyKho",
            "user": "sa",
            "password": "123456",
            "port": 1433,
            "options": {
                "encrypt": true
            },
            "pool": {
                "max": 10,
                "min": 0,
                "idleTimeoutMillis": 30000
            }
        }
    }
};