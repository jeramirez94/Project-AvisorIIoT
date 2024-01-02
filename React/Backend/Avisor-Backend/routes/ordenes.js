/*
    Rutas de ordenes
    host + /api/produccion/ordenes
*/
const { Router } = require("express");
const OrdenesCtl = require('../controllers/ordenes');
const { validarJWT } = require("../middlewares/validar-jwt");
const { getIdWorkCenter } = require("../middlewares/cookies");
const {session,existeSesion} = require("../middlewares/ironSession");

const {permisos} =  require("../middlewares/permisos");

const router = Router();

//validacion del token en todas las rutas
router.use(session)
router.use(existeSesion)

//obtener el workcenter a travez de las cookies
router.use(getIdWorkCenter);
router.use(permisos);
//obtener ordenes
router.get('/', OrdenesCtl.getOrdenes);

//iniciar ordenes
router.put('/iniciar/:id', OrdenesCtl.iniciarOrden);

router.get('/ObtenerOrdenActiva',OrdenesCtl.getOrdenActiva)

router.get('/ObtenerOrdenesIdWorkCenter',OrdenesCtl.getOrdenesIdWorkCenter)

router.put('/DividirOpm',OrdenesCtl.dividirOpm)

module.exports = router;