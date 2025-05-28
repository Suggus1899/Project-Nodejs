const express = require('express');
const router = express.Router();

const loginModel = require("../models/login");

router.post('/envio', function (req, res, next) {
    const { login, password } = req.body;
    if (!login || !password) {
        return res.status(400).send("No hay datos del Usuario"); 
    }

    loginModel
        .validar(login, password)
        .then((resultados) => {
            if (resultados && resultados.length > 0) { 
                req.session.loggedin = true;
                req.session.login = login;
                res.redirect("/welcome");
            } else {
                res.status(401).send('Usuario y/o Contraseña Incorrecta'); 
            }
        })
        .catch(err => {
            console.error("Error Validando Usuario:", err);
            res.status(500).send("Error Validando Usuario"); 
        });
});

module.exports = router;