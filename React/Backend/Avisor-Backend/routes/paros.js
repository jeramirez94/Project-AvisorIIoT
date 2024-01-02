/*
    Rutas de paros
    host + /api/produccion/paros
*/
const { Router } = require("express");
const ParosController = require('../controllers/paros');
const { getIdWorkCenter } = require("../middlewares/cookies");


const router = Router();

//obtener el workcenter a travez de las cookies
router.use(getIdWorkCenter);

//obtener paros
router.get('/', ParosController.getParos);

//obtener catalogo paros
router.get('/catalogo', ParosController.getCatalogoParos);

//enviar justificacion de paros
router.put('/JustificarParos', ParosController.justificarParos);

router.get('/TiposParo', ParosController.getTiposParo);

router.get('/TiposParoJustificaciones',ParosController.getTiposParoJustificaciones)

router.get('/JustificacionesFavoritas',ParosController.getJustificacionesFavoritas)


module.exports = router;