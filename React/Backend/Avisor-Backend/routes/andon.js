/*
    Rutas de comunicación torretas Andon
    host + /api/andon
*/

const { sendAndon } = require('../controllers/andon');
const { Router } = require('express');
const { check } = require('express-validator');
const { validarCampos } = require('../middlewares/validar-campos');
const { validarJWT } = require('../middlewares/validar-jwt');
const {session,existeSesion} = require("../middlewares/ironSession")
const { getIdWorkCenter } = require("../middlewares/cookies");

const router = Router();


//router.use(getIdWorkCenter);
//router.use(session)

router.post('/', sendAndon);


//valido la sesion con el middleware
//router.use(existeSesion)

module.exports = router;