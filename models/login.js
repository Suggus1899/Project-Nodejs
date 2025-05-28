const conexion = require("../conexion")
module.exports = {

    validar(login, password) {
        return new Promise((resolve, reject) => {
           sql = conexion.query(`select usuario, contraseña from login where (usuario = ? and contraseña = ?)`,
                [login, password],
                (err, resultados) => {
                    //console.log(sql);
                    if (err) reject(err);
                    else
                    resolve(resultados);
                });
        });
    },

}
