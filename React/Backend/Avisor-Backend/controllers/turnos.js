const sql = require('mssql')
const { dbConnection } = require('../database/config')
const { response } = require('express')
/** 
 *
 * 151.3. Obtener los turnos activos actualmente.
 * 
 * @param {Request} req 
 * @param {Response} res 
 * @returns 
 */
const getTurnos = async(req, res = response) => {
    //se declaran variables para almacenar el los parametros en la propiedad query de la solicitud http
    let { ClaUbicacion , Idioma, FechaAdmScada } = {...req.query }  
    const IdWorkCenter = req.IdWorkCenter
    try {
            //Se enviar la solicitud al servidor SQL para ejecutar el proceso definido.
            const result = await dbConnection.request()
                .input('pnClaUbicacion', sql.Int, ClaUbicacion)
                .input('psIdWorkCenter', sql.VarChar,  IdWorkCenter)
                .input('ptFechaAdmScada', sql.DateTime, FechaAdmScada)
                .input('psIdioma', sql.VarChar, Idioma)
                .output('psErrorKey', sql.VarChar)
                .output('psErrorMsg', sql.VarChar)
                .execute('[AswSch].[ASW_CU151_Pag3_ObtenerTurnos_Sel]');
            //Respuesta exitosa por parte del servidor SQL
            if (result.output.psErrorKey == "SUCCESS") {
                res.status(200).json({
                    msg: result.output.psErrorKey,
                    turnos: result.recordset
                })
            }else{
                //Bad Request
                res.status(400).json({
                    key: result.output.psErrorKey,
                    msg: result.output.psErrorMsg
                })

            }
                

    } catch (error) {
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

/** 
 * CU5.1
 * Obtener lista de turnos externos segun la hora actual
 * 
 * @param {Request} req 
 * @param {Response} res 
 * @returns 
 */
const getTurnosExternos = async(req, res) => {
    //se declaran variables para almacenar el los parametros en la propiedad query de la solicitud http
    let { ClaUbicacion, Idioma} = {...req.query }  

    try {
            //Se enviar la solicitud al servidor SQL para ejecutar el proceso definido.
            const result = await dbConnection.request()
                .input('pnClaUbicacion', sql.Int, ClaUbicacion)
                .input('psIdioma', sql.VarChar, Idioma)
                .output('psErrorKey', sql.VarChar)
                .output('psErrorMsg', sql.VarChar)
                .execute('[AswSch].[ASW_CU5_Pag1_TurnoExterno_Sel]');
            //Respuesta exitosa por parte del servidor SQL
            if (result.output.psErrorKey == "SUCCESS") {
                res.status(200).json({
                        msg: result.output.psErrorKey,
                        turnos: result.recordset
                    })
            }else{
                //Bad Request
                res.status(400).json({
                    key: result.output.psErrorKey,
                    msg: result.output.psErrorMsg
                })
    
            }

    } catch (error) {
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

/** 
 * CU5.1
 * Obtener lista de turnos externos segun la hora actual
 * 
 * @param {Request} req 
 * @param {Response} res 
 * @returns 
 */
const setTurnoExterno = async(req, res) => {
    //se declaran variables para almacenar el los parametros en la propiedad query de la solicitud http
    let { ClaUbicacion, Idioma, ClaTurnoExterno} = {...req.query }  
    const IdWorkCenter =  req.IdWorkCenterDefault == undefined ? 'FF-01' : req.IdWorkCenterDefault
    const ClaUsuarioMod =  req.ClaUsuarioMod == undefined ? 0 : req.ClaUsuarioMod
    const NombrePcMod = `Estacion ${IdWorkCenter}`
    const IdUsuario = (!req.ClaUsuario) ? 0 : req.ClaUsuario

    try {
            //Se enviar la solicitud al servidor SQL para ejecutar el proceso definido.
            const result = await dbConnection.request()
                .input('pnClaUbicacion', sql.Int, ClaUbicacion)
                .input('psIdWorkCenter', sql.VarChar, IdWorkCenter)
                .input('pnIdUsuario',sql.Int,IdUsuario)
                .input('pnClaTurnoExterno', sql.Int, ClaTurnoExterno)
                .input('ptFechaAdm', sql.DateTime, null)
                .input('pnClaTurno', sql.Int, 0)
                .input('psNombrePcMod', sql.VarChar, NombrePcMod)
                .input('pnClaUsuarioMod', sql.Int, ClaUsuarioMod)
                .input('pnDebug', sql.Int, 0)
                .input('psIdioma', sql.VarChar, Idioma)
                .output('psErrorKey', sql.VarChar)
                .output('psErrorMsg', sql.VarChar)
                .execute('[AswSch].[ASW_CU5_Pag1_LogTurnoExterno_IU]');
            //Respuesta exitosa por parte del servidor SQL
            if (result.output.psErrorKey == "SUCCESS") {
                res.status(200).json({
                        msg: result.output.psErrorKey,
                        turnos: result.recordset
                    })
            }else{
                //Bad Request
                res.status(400).json({
                    key: result.output.psErrorKey,
                    msg: result.output.psErrorMsg
                })
    
            }

    } catch (error) {
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


module.exports = { getTurnos, getTurnosExternos, setTurnoExterno };