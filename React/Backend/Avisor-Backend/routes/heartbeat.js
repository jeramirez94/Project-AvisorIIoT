const { Router } = require("express");
const heartbeatController = require('../controllers/heartbeat');
const { getIdWorkCenter,getIdWorkCenterDefault } = require("../middlewares/cookies");

const router = Router();

router.use(getIdWorkCenterDefault);


router.post('/',heartbeatController.sendHeartbeat)

module.exports = router;