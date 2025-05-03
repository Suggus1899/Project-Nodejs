const express = require('express');
const router = express.Router();

// Ruta principal
router.get('/', (req, res) => {
    res.render('index', { mensaje: '¡Bienvenido a mi aplicación Express!' });
});

// Ruta "Acerca de"
router.get('/about', (req, res) => {
    res.render('about', { mensaje: 'Más sobre nosotros.' });
});

// Ruta "Contacto"
router.get('/contact', (req, res) => {
    res.render('contact', { mensaje: 'Contáctanos aquí.' });
});

module.exports = router;