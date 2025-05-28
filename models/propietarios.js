const conexion = require("../conexion")
module.exports = {
    insertar(propietario, cedula, fundo, municipio, entidad_federal, num_reg, year, num_folios, num_libros, uso_hierro, id_ruta_foto_persona, id_ruta_design_hierro, id_ruta_firma_estatal, id_ruta_sello_institucion) {
        return new Promise((resolve, reject) => {
            const sql = `INSERT INTO registro_carnet_hierro (propietario, cedula, fundo, municipio, entidad_federal, num_reg, year, num_folios, num_libros, uso_hierro, id_ruta_foto_persona, id_ruta_design_hierro, id_ruta_firma_estatal, id_ruta_sello_institucion) 
                         VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;
            conexion.query(sql, [propietario, cedula, fundo, municipio, entidad_federal, num_reg, year, num_folios, num_libros, uso_hierro, id_ruta_foto_persona, id_ruta_design_hierro, id_ruta_firma_estatal, id_ruta_sello_institucion], (err, result) => {
                if (err) reject(err);
                else resolve(result.insertId);
            });
        });
    },
    obtener() {
        return new Promise((resolve, reject) => {
            conexion.query(`select id, propietario, cedula, fundo, municipio, entidad_federal, num_reg, year, num_folios, num_libros, uso_hierro from registro_carnet_hierro`,
                (err, resultados) => {
                    if (err) reject(err);
                    else resolve(resultados);
                });
        });
    },
    obtenerPorId(id) {
        return new Promise((resolve, reject) => {
            conexion.query(`select id, propietario, cedula, fundo, municipio, entidad_federal, num_reg, year, num_folios, num_libros, uso_hierro, id_ruta_foto_persona, id_ruta_design_hierro, id_ruta_firma_estatal, id_ruta_sello_institucion from registro_carnet_hierro where id = ?`,
                [id],
                (err, resultados) => {
                    if (err) reject(err);
                    else resolve(resultados[0]);
                });
        });
    },
    actualizar(params) {
        return new Promise((resolve, reject) => {
            const sql = `UPDATE registro_carnet_hierro SET propietario=?, cedula=?, fundo=?, municipio=?, entidad_federal=?, num_reg=?, year=?, num_folios=?, num_libros=?, uso_hierro=?, 
                         id_ruta_foto_persona=COALESCE(?, id_ruta_foto_persona), 
                         id_ruta_design_hierro=COALESCE(?, id_ruta_design_hierro), 
                         id_ruta_firma_estatal=COALESCE(?, id_ruta_firma_estatal), 
                         id_ruta_sello_institucion=COALESCE(?, id_ruta_sello_institucion) 
                         WHERE id=?`;
            conexion.query(sql, params, (err, result) => {
                if (err) reject(err);
                else resolve(result.affectedRows);
            });
        });
    },

    eliminar(id) {
        return new Promise((resolve, reject) => {
            conexion.query(`delete from registro_carnet_hierro
            where id = ?`,
                [id],
                (err) => {
                    if (err) reject(err);
                    else resolve();
                });
        });
    },
}