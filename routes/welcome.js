const express = require('express');
const router = express.Router();

router.get('/', function (req, res, next) {
    res.render("welcome");
});

module.exports = router; 