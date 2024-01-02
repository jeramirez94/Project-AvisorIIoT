/*
    Rutas de turnos
    host + /api/turnos
*/
const { Router } = require("express");
const { getTurnos, getTurnosExternos, setTurnoExterno } = require('../controllers/turnos');
const { validarJWT } = require("../middlewares/validar-jwt");
const { getIdWorkCenter, getIdWorkCenterDefault } = require("../middlewares/cookies");
const {session,existeSesion} = require("../middlewares/ironSession");

const router = Router();

//obtener el workcenter a travez de las cookies
router.use(getIdWorkCenter);
router.use(getIdWorkCenterDefault);

//obtener los turnos externos para reporte de produccion y paros
router.get('/config/', getTurnosExternos);



//validacion del token en todas las rutas
router.use(session)
router.use(existeSesion)
router.post('/config/', setTurnoExterno);
//obtener la produccion de la maquina actual en el turno actual y anteriores.
router.get('/', getTurnos);

//registrar el turno externo seleccionado para reporte de produccion y paros



module.exports = router;