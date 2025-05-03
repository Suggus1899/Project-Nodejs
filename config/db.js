const mysql = require('mysql2');

// Configurar conexión con MySQL
const connection = mysql.createConnection({
    host: 'localhost', 
    user: 'root',      
    password: '',      
    database: 'Cnodejs' 
});

// Conectar a la base de datos
connection.connect(err => {
    if (err) {
        console.error('Error al conectar a MySQL:', err);
        return;
    }
    console.log(' Conexión exitosa a MySQL ');
});

// Exportar conexión para usar en otros archivos
module.exports = connection;