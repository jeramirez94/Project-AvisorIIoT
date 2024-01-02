const { Router } = require("express");
const HeaderCtl = require('../controllers/header');
const { validarJWT } = require("../middlewares/validar-jwt");
const { getIdWorkCenter } = require("../middlewares/cookies");

const router = Router();

//obtener el workcenter a travez de las cookies
router.use(getIdWorkCenter);

router.get('/', HeaderCtl.getDatosHeader);


module.exports = router;
