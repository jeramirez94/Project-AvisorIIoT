
require('dotenv').config();
var config = {}

/**
 * Configuraciones que deberian de venir de variables de entorno
 */
config.env = {}
config.env.PORT = process.env.PORT || 3350
config.env.CORS_ORIGIN = process.env.CORS_ORIGIN
config.env.ASW_BD_SERVER = process.env.ASW_BD_SERVER
config.env.ASW_BD_PORT = process.env.ASW_BD_PORT
config.env.ASW_BD_DATABASE = process.env.ASW_BD_DATABASE
config.env.ASW_BD_USER = process.env.ASW_BD_USER
config.env.ASW_BD_PASSWORD = process.env.ASW_BD_PASSWORD
config.env.JWT_SEED = process.env.JWT_SEED
config.env.MQTT_Srv = process.env.MQTT_Srv
config.env.MQTT_Topic = process.env.MQTT_Topic

/**
 * Configuracion de opciones de la app
 */
config.app = {}

/**
 * ON - Requiere usuario y contraseña
 * USER_ONLY - Requiere usuario
 * OFF - No hay login, el usuairo es anonimo
 */
config.app.autenticacion = "USER_ONLY"

/**
 * 0 - no limitado por minutos
 * n+ - numero entero positivo indica los minutos de vencimiento, el formato es numero+”m” (2m, 60m, etc)
 * 
 * vencimientoToken y vencimientoTurno no pueden ser ambas 0
 */
config.app.vencimientoToken = 0

/**
 * 0 - no se considera el remanente del turno para el vencimiento
 * 1 - el tiempo del vencimiento se calcula con la hora del fin del turno – hora actual (hora de generación del token) en unidades de minutos.
 * 
 * vencimientoToken y vencimientoTurno no pueden ser ambas 0
 */
config.app.vencimientoTurno = 1

/**
 * integrar permisos wt
 * 0 - no se validan permisos 
 * 1- se validan permisos
 */
config.app.permisosWti = 1

/**
 * Nombre del cookie de sesion 
 * Debe coincidir con el que se use en la app nextjs
 */
config.app.sessionCookieName = "AvisorSession"

/**
 *  Variable estatus workcenter para heartbeat 
 */
config.app.ClaVariableHeartbeat = 8


module.exports = config;