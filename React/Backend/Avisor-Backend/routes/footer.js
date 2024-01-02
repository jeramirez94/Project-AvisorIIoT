const { Router } = require("express");
const {getDatosFooter} = require('../controllers/footer');
const { getIdWorkCenter } = require("../middlewares/cookies");

const router = Router();

//obtener el workcenter a travez de las cookies
router.use(getIdWorkCenter);

router.get('/', getDatosFooter);


module.exports = router;
