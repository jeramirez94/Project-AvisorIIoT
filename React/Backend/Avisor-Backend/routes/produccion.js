/*
    Rutas de produccion
    host + /api/produccion
*/
const { Router } = require("express");
const { getResumenProduction,getBitProduction, evaluateUnits, eliminarUnidades, agregarUnidades } = require('../controllers/produccion');
const { validarJWT } = require("../middlewares/validar-jwt");
const { getIdWorkCenter } = require("../middlewares/cookies");
const {session,existeSesion} = require("../middlewares/ironSession");
const {permisos} = require("../middlewares/permisos")

const router = Router();

//validacion del token en todas las rutas
router.use(session)
router.use(existeSesion)

//obtener el workcenter a travez de las cookies
router.use(getIdWorkCenter);

//Validar permiso acceso y obtener permisos
router.use(permisos);

//obtener la produccion de la maquina actual en el turno actual y anteriores.

router.get('/', getResumenProduction);
router.get('/detalle', getBitProduction);
router.put('/evaluar', evaluateUnits);
router.delete('/eliminarUnidades',eliminarUnidades)
router.post('/agregarUnidades',agregarUnidades)

module.exports = router;