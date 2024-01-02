/*
    Rutas de maquinas
    host + /api/maquinas
*/
const { Router } = require("express");
const { getMaquinas, setMaquinas } = require('../controllers/maquinas');
const { validarJWT } = require("../middlewares/validar-jwt");

const router = Router();

//validacion del token en todas las rutas
router.use(validarJWT);
//Almacenar cookie de maquina 
router.post('/setMaquinas',setMaquinas);
//obtener todas las maquinas por ubicación y las preferidas
router.get('/', getMaquinas);


module.exports = router;