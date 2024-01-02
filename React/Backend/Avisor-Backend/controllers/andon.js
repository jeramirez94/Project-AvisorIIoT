const sql = require('mssql');
const mqtt = require('mqtt');
const { dbConnection } = require('../database/config')
const { response } = require('express')
const { generarJWT } = require("../helpers/jwt");
const config = require('../config')

const SUCCESS = "SUCCESS"

/** 
 * API para publicar mensajes en broker MQTT 
 * y comunicar con torretas
 * 
 * @param {Request} req 
 * @param {Response} res 
 * @returns 
 */
const sendAndon = async(req, res) => {

    let {payload,IdWorkCenter} = req.body
    IdWorkCenter = IdWorkCenter.replace('F-','K') 
    const mqttTopic = config.env.MQTT_Topic.replace("%",IdWorkCenter.toString())

    try{
        const mqttClient = mqtt.connect(config.env.MQTT_Srv);


        mqttClient.on("connect", () => {
            mqttClient.subscribe(mqttTopic, (err) =>{
                if(!err){
                    mqttClient.publish(mqttTopic, payload.toString())
                    res.status(200).json(
                        {key: "success",
                        msg: "OK"}
                    );
                    mqttClient.end()
                }else{
                    res.status(400).json(
                        {key: "UnknownError",
                        msg: err.toString()}
                    )
                }
            });
        });
        
    }
    catch(error){
        //unknown error
        if (error.code == "EREQUEST"){
            res.status(500).json({
                key: 'UnknownError',
                msg: 'Report error to administrator.',
                details: `${error.originalError.info.procName} - ${error.toString()}`,
                error
            })
        }
        //todos los demas errores
        else{
            res.status(500).json({
                key: 'UnknownError',
                msg: 'Report error to administrator.',
                details: error.toString(),
                error
            })
        }
    }
}

module.exports = { sendAndon }