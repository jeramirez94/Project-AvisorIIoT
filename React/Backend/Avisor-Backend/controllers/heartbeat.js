const sql = require('mssql')
const { dbConnection } = require('../database/config')
const { response } = require('express')
const { generarJWT } = require("../helpers/jwt");
const config = require('../config')

const SUCCESS = "SUCCESS"



const sendHeartbeat = async(req, res = response) => {

    const IdWorkCenter = req.IdWorkCenter
    const IpAddress = req.ip
    const {Idioma} = req.body
    const {ClaVariableHeartbeat} = config.app

    try{
        const result = await dbConnection.request()
                .input('PsIdioma', sql.VarChar, Idioma)
                .input('PsIdWorkCenter', sql.VarChar, IdWorkCenter)
                .input('PsIpAddress', sql.VarChar, IpAddress)
                .input('PnClaVariable',sql.Int,ClaVariableHeartbeat)
                .output('PsErrorKey', sql.VarChar)
                .output('PsErrorMsg', sql.VarChar)
                .execute('[AswSch].[ASW_CU1_Pag7_HeartBeat_IU]');


        if (result.output.PsErrorKey == "SUCCESS") {
            res.status(200).json({
                    msg: result.output.PsErrorKey,
                    result: result.recordset
                })
        }else{
            //Bad Request
            res.status(400).json({
                key: result.output.PsErrorKey,
                msg: result.output.PsErrorMsg
            })

        }

	
    }
    catch (error) {
        //error de sql server
        if (error.code == "EREQUEST"){
            res.status(500).json({
                key: 'UnknownError',
                msg: 'Report error to administrator',
                details: `${error.originalError.info.procName} - ${error.toString()}`,
                error
            })
        }
        //todos los demas errores
        else{
            res.status(500).json({
                key: 'UnknownError',
                msg: 'Report error to administrator',
                details: error.toString(),
                error
            })
        }

    }


}


module.exports = {sendHeartbeat}