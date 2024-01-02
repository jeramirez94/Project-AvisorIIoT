const sql = require('mssql')
const { dbConnection } = require('../database/config')
/** 
 * CU151.3
 * Devolver la produccion de la maquina actual en el turno actual y anteriores.
 * 
 * @param {Request} req 
 * @param {Response} res 
 * @returns 
 */
const getParos = async(req, res = response) => {
    //se declaran variables para almacenar el los parametros en la propiedad query de la solicitud http
    let { ClaUbicacion, FechaAdmScada, ClaTurno, MostrarJustificados, MostrarMicroParos,Idioma } = {...req.query }  
    const IdWorkCenter = req.IdWorkCenter

    try {
            //Se envia la solicitud al servidor SQL para ejecutar el proceso definido.
            const result = await dbConnection.request()
                .input('pnClaUbicacion', sql.Int, ClaUbicacion)
                .input('psIdWorkCenter', sql.VarChar, IdWorkCenter)
                .input('ptFechaAdmScada', sql.DateTime, FechaAdmScada)
                .input('pnClaTurno', sql.Int, ClaTurno)
                .input('pnMostrarJustificados', sql.Int, MostrarJustificados)
                .input('pnMostrarMicroParos', sql.Int, MostrarMicroParos)
                .input('psIdioma', sql.VarChar, Idioma)
                .output('psErrorKey', sql.VarChar)
                .output('psErrorMsg', sql.VarChar)
                .execute('[AswSch].[ASW_CU204_Pag5_BitacoraParos_Sel]');
            //Respuesta exitosa por parte del servidor SQL
            if (result.output.psErrorKey == "SUCCESS") {
                res.status(200).json({
                        msg: result.output.psErrorKey,
                        paros: result.recordset
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
const getCatalogoParos = async(req, res = response) => {
    //se declaran variables para almacenar el los parametros en la propiedad query de la solicitud http
    let { ClaUbicacion, Idioma,pnTipo,pnModoSel,pnBajasSn } = {...req.query }

    try {
            //Se enviar la solicitud al servidor SQL para ejecutar el proceso definido.
            const result = await dbConnection.request()
                .input('pnClaUbicacion', sql.Int, ClaUbicacion)
                .input('psValor', sql.VarChar, '')
                .input('psIdioma', sql.VarChar, Idioma)
                .input('pnTipo',sql.VarChar, pnTipo)
                .input('pnModoSel',sql.VarChar, pnModoSel)
                .input('pnBajasSn', sql.VarChar, pnBajasSn)
                .output('psErrorKey', sql.VarChar)
                .output('psErrorMsg', sql.VarChar)
                .execute('[AswSch].[ASWTipoParoCmb]');
            //Respuesta exitosa por parte del servidor SQL
            if (result.output.psErrorKey == "SUCCESS") {
                res.status(200).json({
                        msg: result.output.psErrorKey,
                        catalogoparos: result.recordset
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
 * 
 * Atualizar registros de la bitacora de paros.
 * 
 * @param {Request} req 
 * @param {Response} res 
 * @returns
 */
const justificarParos = async(req, res = response) => {
    //se declaran variables para almacenar el los parametros en la propiedad query de la solicitud http
    let { ClaUbicacion, Idioma, IdList, ClaTurno, FechaAdmScada, ClaTipoParo, ClaSeccionParo} = {...req.query } 
    const IdWorkCenter = req.IdWorkCenter
    const IdUsuario = req.ClaUsuario === undefined ? 0 : req.ClaUsuario 
    try {
            //Se enviar la solicitud al servidor SQL para ejecutar el proceso definido.
            const result = await dbConnection.request()
                .input('pnClaUbicacion', sql.Int, ClaUbicacion)
                .input('psIdWorkCenter', sql.VarChar, IdWorkCenter)
                .input('psIdList', sql.VarChar, IdList)
                .input('pnClaUsuarioMod', sql.Int, IdUsuario)
                .input('pnClaTurno', sql.Int, ClaTurno)
                .input('ptFechaAdmScada', sql.DateTime, FechaAdmScada)
                .input('pnClaTipoParo', sql.Int, ClaTipoParo)
                .input('pnClaSeccionParo', sql.Int, ClaSeccionParo)
                .input('psIdioma', sql.VarChar, Idioma)
                .output('psErrorKey', sql.VarChar)
                .output('psErrorMsg', sql.VarChar)
                .execute('[AswSch].[ASW_CU204_Pag6_JustificarParo_U]');
            //Respuesta exitosa por parte del servidor SQL
            if (result.output.psErrorKey == "SUCCESS") {
                res.status(200).json({
                        key: result.output.psErrorKey,
                        msg: result.output.psErrorMsg
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
 * 
 * Obtener el catalogo de tipos de paro.
 * 
 * @param {Request} req 
 * @param {Response} res 
 * @returns
 */
const getTiposParo = async(req, res = response) => {
    //se declaran variables para almacenar el los parametros en la propiedad query de la solicitud http
    let { ClaUbicacion, Idioma } = {...req.query }

    try {
            //Se enviar la solicitud al servidor SQL para ejecutar el proceso definido.
            const result = await dbConnection.request()
                .input('pnClaUbicacion', sql.Int, ClaUbicacion)
                .input('psIdioma', sql.VarChar, Idioma)
                .output('psErrorKey', sql.VarChar)
                .output('psErrorMsg', sql.VarChar)
                .execute('[AswSch].[ASW_CU204_Pag5_TipoParo_Sel]');
            //Respuesta exitosa por parte del servidor SQL
            if (result.output.psErrorKey == "SUCCESS") {
                res.status(200).json({
                        msg: result.output.psErrorKey,
                        tiposParo: result.recordset
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
 * 
 * Obtener el catalogo de tipos de paro.
 * 
 * @param {Request} req 
 * @param {Response} res 
 * @returns
 */
const getTiposParoJustificaciones = async(req, res = response) => {
    //se declaran variables para almacenar el los parametros en la propiedad query de la solicitud http
    let { ClaTipoParo,ClaGpoParo, Idioma } = {...req.query }
    try {
            //Se enviar la solicitud al servidor SQL para ejecutar el proceso definido.
            const result = await dbConnection.request()
                .input('pnClaTipoParo', sql.Int, ClaTipoParo)
                .input('pnClaGpoParo', sql.Int,ClaGpoParo)
                .input('psIdioma', sql.VarChar, Idioma)
                .output('psErrorKey', sql.VarChar)
                .output('psErrorMsg', sql.VarChar)
                .execute('[AswSch].[ASW_CU204_Pag5_ObtenerTipoParoJustificacion_Sel]');
            //Respuesta exitosa por parte del servidor SQL
            if (result.output.psErrorKey == "SUCCESS") {
                res.status(200).json({
                        msg: result.output.psErrorKey,
                        tiposParoJustificaciones: result.recordset
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
 * 
 * Obtener las justificaciones favoritas.
 * 
 * @param {Request} req 
 * @param {Response} res 
 * @returns
 */
const getJustificacionesFavoritas = async(req, res = response) => {
    //se declaran variables para almacenar el los parametros en la propiedad query de la solicitud http
    let { ClaUbicacion, Idioma } = {...req.query }

    try {
            //Se enviar la solicitud al servidor SQL para ejecutar el proceso definido.
            const result = await dbConnection.request()
                .input('pnClaUbicacion', sql.Int, ClaUbicacion)
                .input('psIdioma', sql.VarChar, Idioma)
                .output('psErrorKey', sql.VarChar)
                .output('psErrorMsg', sql.VarChar)
                .execute('[AswSch].[ASW_CU204_Pag5_SeccionParoFavoritas_Sel]');
            //Respuesta exitosa por parte del servidor SQL
            if (result.output.psErrorKey == "SUCCESS") {
                res.status(200).json({
                        msg: result.output.psErrorKey,
                        secciones: result.recordset
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

module.exports = { getParos, getCatalogoParos, justificarParos, getTiposParo, getTiposParoJustificaciones, getJustificacionesFavoritas }