const sql = require('mssql')
const { dbConnection } = require('../database/config')
const { response } = require('express')
/** 
 * CU151.3
 * Devolver la produccion de la maquina actual en el turno actual y anteriores.
 * 
 * @param {Request} req 
 * @param {Response} res 
 * @returns 
 */
const getResumenProduction = async(req, res = response) => {
    //se declaran variables para almacenar el los parametros en la propiedad query de la solicitud http
    let { ClaUbicacion, Idioma, ClaTurno, FechaAdmScada} = {...req.query }  
    const IdWorkCenter = req.IdWorkCenter

    try {
            //Se enviar la solicitud al servidor SQL para ejecutar el proceso definido.
            const result = await dbConnection.request()
                .input('pnClaUbicacion', sql.Int, ClaUbicacion)
                .input('psIdioma', sql.VarChar, Idioma)
                .input('psIdWorkCenter', sql.VarChar, IdWorkCenter)
                .input('pnClaTurno', sql.Int, ClaTurno)
                .input('ptFechaAdmScada', sql.DateTime, FechaAdmScada)
                .output('psErrorKey', sql.VarChar)
                .output('psErrorMsg', sql.VarChar)
                .execute('[AswSch].[ASW_CU151_Pag3_ResumenProduccion_Sel]');
            //Respuesta exitosa por parte del servidor SQL
            if (result.output.psErrorKey == "SUCCESS") {
                res.status(200).json({
                        msg: result.output.psErrorKey,
                        production: result.recordset
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
 * CU171.1
 * Devolver la produccion de la maquina actual.
 * 
 * @param {Request} req 
 * @param {Response} res 
 * @returns
 */
const getBitProduction = async(req, res = response) => {
    //se declaran variables para almacenar el los parametros en la propiedad query de la solicitud http
    let { ClaUbicacion, Idioma, ClaTurno, FechaAdmScada} = {...req.query }  
    const IdWorkCenter = req.IdWorkCenter

    try {
            //Se enviar la solicitud al servidor SQL para ejecutar el proceso definido.
            const result = await dbConnection.request()
                .input('pnClaUbicacion', sql.Int, ClaUbicacion)
                .input('psIdioma', sql.VarChar, Idioma)
                .input('psIdWorkCenter', sql.VarChar, IdWorkCenter)
                .input('pnClaTurno', sql.Int, ClaTurno)
                .input('ptFechaAdmScada', sql.DateTime, FechaAdmScada)
                .output('psErrorKey', sql.VarChar)
                .output('psErrorMsg', sql.VarChar)
                .execute('[AswSch].[ASW_CU171_Pag1_ObtenerBitacoraProduccion_Sel]');
            //Respuesta exitosa por parte del servidor SQL
            if (result.output.psErrorKey == "SUCCESS") {
                res.status(200).json({
                        msg: result.output.psErrorKey,
                        production: result.recordset
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
 * CU171.1
 * Actualizar las unidades en la bitacora de producción.
 * 
 * @param {Request} req 
 * @param {Response} res 
 * @returns
 */
const evaluateUnits = async(req, res = response) => {
    //se declaran variables para almacenar el los parametros en la propiedad query de la solicitud http
    let { ClaUbicacion, Idioma, ClaTurno, FechaAdmScada, IdList, EsPNC} = {...req.query }  
    const IdWorkCenter = req.IdWorkCenter
    const IdUsuario = req.ClaUsuario
    try {
            //Se enviar la solicitud al servidor SQL para ejecutar el proceso definido.
            const result = await dbConnection.request()
                .input('pnClaUbicacion', sql.Int, ClaUbicacion)
                .input('psIdioma', sql.VarChar, Idioma)
                .input('psIdWorkCenter', sql.VarChar, IdWorkCenter)
                .input('psIdList', sql.VarChar, IdList)
                .input('pnClaTurno', sql.Int, ClaTurno)
                .input('pnEsPNC', sql.Int, EsPNC)
                .input('pnClaUsuarioMod', sql.Int, IdUsuario)
                .input('ptFechaAdmScada', sql.DateTime, FechaAdmScada)
                .output('psErrorKey', sql.VarChar)
                .output('psErrorMsg', sql.VarChar)
                .execute('[AswSch].[ASW_CU171_Pag1_EvaluarUnidadBitacoraProduccion_U]');
            //Respuesta exitosa por parte del servidor SQL
            if (result.output.psErrorKey == "SUCCESS") {
                res.status(200).json({
                        msg: result.output.psErrorKey,
                        production: result.recordset
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
 * CU171.1 Eliminar unidad
 * 
 * 
 * @param {Request} req 
 * @param {Response} res 
 * @returns 
 */
const eliminarUnidades = async(req, res = response) => {
    //se declaran variables para almacenar el los parametros en la propiedad query de la solicitud http
    
    //UNIDADES ES UNA LISTA DE IDS SEPARADOS POR COMAS
    let { ClaUbicacion, Idioma, Unidades} = {...req.query }  

    const IdWorkCenter = req.IdWorkCenter

    const PsNombrePCMod = "Estacion " + IdWorkCenter
    const IdUsuario = req.ClaUsuario

    try{
        const result = await dbConnection.request()
                .input('pnClaUbicacion', sql.Int, ClaUbicacion)
                .input('psIdioma', sql.VarChar, Idioma)
                .input('psIdWorkCenter', sql.VarChar, IdWorkCenter)
                .input('PsIdUnidades', sql.VarChar, Unidades)
                .input('PsNombrePCMod', sql.VarChar, PsNombrePCMod)
                .input('PnClaUsuarioMod', sql.Int, IdUsuario)
                .output('psErrorKey', sql.VarChar)
                .output('psErrorMsg', sql.VarChar)
                .execute('[AswSch].[ASW_CU171_Pag1_EliminarUnidad_Del]');


        if (result.output.psErrorKey == "SUCCESS") {
            res.status(200).json({
                    msg: result.output.psErrorKey,
                    result: result.recordset
                })
        }else{
            //Bad Request
            res.status(400).json({
                key: result.output.psErrorKey,
                msg: result.output.psErrorMsg
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


const agregarUnidades = async(req, res = response) => {
    //LOS PARAMETROS SE RECIBEN DEL BODY
    let { ClaUbicacion, 
        Idioma, 
        Cantidad,
        IdOrden,
        ClaTurno,
        FechaAdm,
        EsPNC} = {...req.body }  

    const IdWorkCenter = req.IdWorkCenter

    const PsNombrePCMod = "Estacion " + IdWorkCenter
    const IdUsuario = req.ClaUsuario

    try{
        const result = await dbConnection.request()
                .input('pnClaUbicacion', sql.Int, ClaUbicacion)
                .input('psIdioma', sql.VarChar, Idioma)
                .input('psIdWorkCenter', sql.VarChar, IdWorkCenter)
                .input('PnCantidad', sql.Int, Cantidad)
                .input('PnIdOrden', sql.BigInt, IdOrden)
                .input('PnClaTurno', sql.BigInt, ClaTurno)
                .input('PtFechaAdm',sql.Date,FechaAdm)
                .input('PnEsPNC',sql.TinyInt,EsPNC)
                .input('PsNombrePCMod', sql.VarChar, PsNombrePCMod)
                .input('PnClaUsuarioMod', sql.Int, IdUsuario)
                .output('psErrorKey', sql.VarChar)
                .output('psErrorMsg', sql.VarChar)
                .execute('[AswSch].[ASW_CU202_Pag1_BitProduccionManual_I]');


        if (result.output.psErrorKey == "SUCCESS") {
            res.status(200).json({
                    msg: result.output.psErrorKey,
                    result: result.recordset
                })
        }else{
            //Bad Request
            res.status(400).json({
                key: result.output.psErrorKey,
                msg: result.output.psErrorMsg
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




module.exports = { getResumenProduction,getBitProduction, evaluateUnits, eliminarUnidades, agregarUnidades}
