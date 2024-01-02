/*
    Rutas de autenticacion
    host + /api/auth
*/
const { Router } = require('express');
const { check } = require('express-validator');
const { loginUsuario, getSesion, deleteSesion, getUsuarios,validaSolicitudAutorizacion } = require('../controllers/auth');
const { validarCampos } = require('../middlewares/validar-campos');
const { validarJWT } = require('../middlewares/validar-jwt');
const {session,existeSesion,generaAutorizacion} = require("../middlewares/ironSession")
const { getIdWorkCenter,getIdWorkCenterDefault } = require("../middlewares/cookies");
const {permisos} =  require("../middlewares/permisos");
const {ValidaCredenciales} = require ("../middlewares/auth");


const router = Router();


router.use(getIdWorkCenter);
router.use(getIdWorkCenterDefault)
router.use(session)

router.post('/', loginUsuario);
router.get('/', getUsuarios);


//valido la sesion con el middleware
router.use(existeSesion)
router.get('/sesion', getSesion);
router.delete('/sesion', deleteSesion);

router.post('/SolicitaAutorizacion'
    ,(req,res,next)=>{
        req.EsSolicitaAutorizacion = true; 
        next();
    }
    ,ValidaCredenciales
    ,permisos
    ,validaSolicitudAutorizacion
    )

module.exports = router;