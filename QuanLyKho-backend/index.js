const db = require('./db')
setTimeout(() => {
    setupServer()
}, 1000);
let setupServer = () => {

    let app = require('express')();
    let server = require('http').Server(app);
    let io = require('socket.io')(server);
    const fs = require('fs');
    server.listen(6969);
    const helper = require('./helper');
    const jwt = require('jsonwebtoken');
    const crypto = require('crypto');
    let bodyParser = require('body-parser');
    app.use(bodyParser.json());       // to support JSON-encoded bodies
    app.use(bodyParser.urlencoded({     // to support URL-encoded bodies
        extended: true
    }));
    io.on('connection',(client)=>{
        console.log("connect")
    })
    // app.use(function (req, res, next) {
    //     let token = req.headers["token"];
    //     if (token) {
    //         return next();
    //     } else {
    //         res.status(403).send("Token not provided");
    //     }
    // });
    const SHAKEY = "ai231']ơ][ươ;ơ;ơ;ưsjdljas$%^";

    app.post('/login', (req, res) => {
        let obj = req.body;
        helper.login(obj.username, obj.password, (err, result) => {
            if (result) {
                res.status(200).send({token: getToken(result)})
            } else {
                res.status(403).send({})
            }
        });

    });
    helper.hanghoa()
    app.get('/',(req,res)=>{
        console.log("hi")
        res.sendFile(__dirname + '/index.html');
    });
    app.get('/user', (req, res) => {
        let token = req.headers["token"];
        let user = verifyToken(token)
        res.status(user ? 200 : 403).send(user)
    });
    let verifyToken = (token) => {
        try {
            let decode = jwt.verify(token, SHAKEY);
            return decode.user
        } catch (ex) {
            return null;
        }
    }
    let getToken = (user) => {
        return jwt.sign({user}, SHAKEY);
    }
    let md5 = (string = "") => {
        return crypto.createHash('md5').update(string).digest('hex');
    }
}
