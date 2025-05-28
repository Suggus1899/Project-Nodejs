const express = require('express');
const router = express.Router();
const propietariosModel = require('../models/propietarios');
const upload = require('../middleware/multer');
const fs = require('fs');
const path = require('path');
let pixelmatch;
(async () => {
  pixelmatch = (await import("pixelmatch")).default;
})();
const { PNG } = require('pngjs');

router.get('/', function (req, res, next) {
    propietariosModel
        .obtener()
        .then(propietarios => {
            res.render("propietarios/ver", {
                propietarios: propietarios,
            });
        })
        .catch(err => {
            return res.status(500).send("Error obteniendo propietarios");
        });
});

router.get('/carnet/:id', function (req, res, next) {
    propietariosModel
        .obtenerPorId(req.params.id)
        .then(propietarios => {
            if (propietarios) {
                res.render("propietarios/carnet", {
                    propietarios: propietarios,
                });
            } else {
                return res.status(500).send("No existe Cliente con ese id");
            }
        })
        .catch(err => {
            return res.status(500).send("Error obteniendo Cliente");
        });
});

router.get('/agregar', function (req, res, next) {
    res.render("propietarios/agregar");
});

router.post('/insertar', upload.fields([
    { name: 'id_ruta_foto_persona', maxCount: 1 },
    { name: 'id_ruta_design_hierro', maxCount: 1 },
    { name: 'id_ruta_firma_estatal', maxCount: 1 },
    { name: 'id_ruta_sello_institucion', maxCount: 1 }
]), function (req, res, next) {
    const { propietario, cedula, fundo, municipio, entidad_federal, num_reg, year, num_folios, num_libros, uso_hierro } = req.body;

    if (!cedula || !propietario || !fundo || !municipio || !entidad_federal || !num_reg || !year || !num_folios || !num_libros || !uso_hierro) {
        return res.status(500).send("No hay datos del cliente");
    }

    const files = req.files;
    const id_ruta_foto_persona = files['id_ruta_foto_persona'] ? `${files['id_ruta_foto_persona'][0].filename}` : null;
    const id_ruta_design_hierro = files['id_ruta_design_hierro'] ? `${files['id_ruta_design_hierro'][0].filename}` : null;
    const id_ruta_firma_estatal = files['id_ruta_firma_estatal'] ? `${files['id_ruta_firma_estatal'][0].filename}` : null;
    const id_ruta_sello_institucion = files['id_ruta_sello_institucion'] ? `${files['id_ruta_sello_institucion'][0].filename}` : null;

    ;

    if (id_ruta_design_hierro) {
        const uploadsDir = path.join(__dirname, '../public/uploads');
        try {
            const img1Path = path.join(uploadsDir, id_ruta_design_hierro);
            console.log(`Reading image: ${img1Path}`);
            const img1 = PNG.sync.read(fs.readFileSync(img1Path));
            const { width, height } = img1;
            const diff = new PNG({ width, height });

            let imagesAreSimilar = false;
            const filesInDir = fs.readdirSync(uploadsDir);

            for (let i = 0; i < filesInDir.length; i++) {
                const img2Path = path.join(uploadsDir, filesInDir[i]);
                if (
                    img2Path !== img1Path &&
                    path.extname(img2Path).toLowerCase() === '.png' &&
                    path.basename(img2Path).startsWith('id_ruta_design_hierro')
                ) {
                    console.log(`Comparing with image: ${img2Path}`);
                    const img2 = PNG.sync.read(fs.readFileSync(img2Path));

                    const numDiffPixels = pixelmatch(
                        img1.data,
                        img2.data,
                        diff.data,
                        width,
                        height,
                        { threshold: 0.1 }
                    );
                    const designHierroImages = filesInDir.filter(file => 
                        file.startsWith('id_ruta_design_hierro') && path.extname(file).toLowerCase() === '.png'
                    );
                    // Si no hay imágenes con las cuales comparar, permitir la subida
                    if (designHierroImages.length === 0) {
                        imagesAreSimilar = true;
                    }

                    if (numDiffPixels < width * height * 0.1) {
                        imagesAreSimilar = true;
                        break;
                    }
                }
            }

            if (imagesAreSimilar) {
                return res.status(400).send("Las imágenes son demasiado parecidas.");
            }
        } catch (error) {
            console.error(`Error processing image: ${error.message}`);
            return res.status(500).send("Error procesando la imagen. Asegúrate de que el archivo sea un PNG válido.");
        }
    }

    propietariosModel
        .insertar(propietario, cedula, fundo, municipio, entidad_federal, num_reg, year, num_folios, num_libros, uso_hierro, id_ruta_foto_persona, id_ruta_design_hierro, id_ruta_firma_estatal, id_ruta_sello_institucion)
        .then(idClienteInsertado => {
            res.redirect("/propietarios");
        })
        .catch(err => {
            return res.status(500).send("Error Registrando Cliente");
        });
});


router.get('/eliminar/:id', function (req, res, next) {
    propietariosModel
        .eliminar(req.params.id)
        .then(() => {
            res.redirect("/propietarios");
        })
        .catch(err => {
            return res.status(500).send("Error eliminando");
        });
});
router.get('/editar/:id', function (req, res, next) {
    propietariosModel
        .obtenerPorId(req.params.id)
        .then(propietarios => {
            if (propietarios) {
                res.render("propietarios/editar", {
                    propietarios: propietarios,
                });
            } else {
                return res.status(500).send("No existe Cliente con ese id");
            }
        })
        .catch(err => {
            return res.status(500).send("Error obteniendo Cliente");
        });
});
router.post('/actualizar', upload.fields([
    { name: 'id_ruta_foto_persona', maxCount: 1 },
    { name: 'id_ruta_design_hierro', maxCount: 1 },
    { name: 'id_ruta_firma_estatal', maxCount: 1 },
    { name: 'id_ruta_sello_institucion', maxCount: 1 }
]), function (req, res, next) {
    const { id, propietario, cedula, fundo, municipio, entidad_federal, num_reg, year, num_folios, num_libros, uso_hierro } = req.body;

    if (!id || !cedula || !propietario || !fundo || !municipio || !entidad_federal || !num_reg || !year || !num_folios || !num_libros || !uso_hierro) {
        return res.status(500).send("No hay datos del cliente");
    }

    const files = req.files;
    const id_ruta_foto_persona = files['id_ruta_foto_persona'] ? `${files['id_ruta_foto_persona'][0].filename}` : null;
    const id_ruta_design_hierro = files['id_ruta_design_hierro'] ? `${files['id_ruta_design_hierro'][0].filename}` : null;
    const id_ruta_firma_estatal = files['id_ruta_firma_estatal'] ? `${files['id_ruta_firma_estatal'][0].filename}` : null;
    const id_ruta_sello_institucion = files['id_ruta_sello_institucion'] ? `${files['id_ruta_sello_institucion'][0].filename}` : null;

    // Verificar y actualizar cada archivo si se ha proporcionado
    let updateQuery = `UPDATE registro_carnet_hierro SET propietario=?, cedula=?, fundo=?, municipio=?, entidad_federal=?, num_reg=?, year=?, num_folios=?, num_libros=?, uso_hierro=?`;
    const updateParams = [propietario, cedula, fundo, municipio, entidad_federal, num_reg, year, num_folios, num_libros, uso_hierro];

    if (id_ruta_foto_persona) {
        updateQuery += `, id_ruta_foto_persona=?`;
        updateParams.push(id_ruta_foto_persona);
    }
    if (id_ruta_design_hierro) {
        updateQuery += `, id_ruta_design_hierro=?`;
        updateParams.push(id_ruta_design_hierro);
    }
    if (id_ruta_firma_estatal) {
        updateQuery += `, id_ruta_firma_estatal=?`;
        updateParams.push(id_ruta_firma_estatal);
    }
    if (id_ruta_sello_institucion) {
        updateQuery += `, id_ruta_sello_institucion=?`;
        updateParams.push(id_ruta_sello_institucion);
    }

    updateQuery += ` WHERE id=?`;
    updateParams.push(id);

    propietariosModel
        .actualizar(updateParams)
        .then(() => {
            res.redirect("/propietarios");
        })
        .catch(err => {
            return res.status(500).send("Error actualizando cliente");
        });
});

module.exports = router;
