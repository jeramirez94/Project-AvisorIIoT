const sql = require('mssql')
const { dbConnection } = require('../database/config')

const SUCCESS = "SUCCESS"
   
/** 
 * CU151.1
 * Obtener las ordenes de producción del plan actual y la orden de producción actual.
 * 
 * @param {Request} req 
 * @param {Response} res 
 * @returns 
 */
const getOrdenes = async(req, res = response) => {
    let { ClaUbicacion, IncluirTodo, Idioma } = {...req.query }    
    const IdWorkCenter = req.IdWorkCenter

    try {
        const result = await dbConnection.request()
            .input('pnClaUbicacion', sql.Int, ClaUbicacion)
            .input('psIdWorkCenter', sql.VarChar, IdWorkCenter)
            .input('pnIncluirTodo', sql.Int, IncluirTodo)
            .execute('AswSch.Asw_CU151_Pag1_MicroProgramaSel');

        res.status(200).json({
            msg: 'SUCCESS',
            orders: result.recordset
        });

    } catch (error) {
        res.status(500).json({
            key: 'ErrorKey',
            msg: 'Report error to administrator',
            error
        })

    }
}

/** 
 * CU151.2 Obtener orden en progreso
 * 
 * 
 * @param {Request} req 
 * @param {Response} res 
 * @returns 
 */
const getOrdenActiva = async(req, res = response) => {
    let { ClaUbicacion,Idioma } = {...req.query }  
    const IdWorkCenter = req.IdWorkCenter
    

    try {
        const result = await dbConnection.request()
            .input('pnClaUbicacion', sql.Int, ClaUbicacion)
            .input('psIdWorkCenter', sql.VarChar, IdWorkCenter)
            .input('psIdioma',sql.VarChar,Idioma)
            .output('psErrorKey',sql.VarChar)
            .output('psErrorMsg',sql.VarChar)
            .execute('AswSch.ASW_CU151_Pag2_OrdenEnProgreso_Sel');

        if(result.output.psErrorKey === SUCCESS){
            
            const caracteristicas =  await dbConnection.request()
            .input('pnClaUbicacion', sql.Int, ClaUbicacion)
            .input('pnClaArticulo', sql.Int, result.recordset[0].ClaArticulo)
            .input('psIdioma',sql.VarChar,Idioma)
            .output('psErrorKey',sql.VarChar)
            .output('psErrorMsg',sql.VarChar)
            .execute('AswSch.ASW_CU151_Pag2_CaracteristicasProducto_Sel'); 
            
            if(caracteristicas.output.psErrorKey === SUCCESS)
            {
                result.recordset[0].Caracteristicas = caracteristicas.recordset
                res.status(200).json({
                    msg: result.output.psErrorKey,
                    result: result.recordset[0]
                });
            }
            
            
            
        }else{
            res.status(400).json({
                key: result.output.psErrorKey,
                msg: result.output.psErrorMsg
            })
        }
    } catch (error) {
        res.status(500).json({
            key: 'ErrorKey',
            msg: 'Report error to administrator',
            error
        })

    }
}

/** 
 * CU153.1
 * Iniciar una orden de produccion y terminar la actual.
 * 
 * @param {Request} req 
 * @param {Response} res 
 * @returns 
 */
const iniciarOrden = async(req, res) => {
    let { ClaUbicacion, NombrePcMod, Idioma } = {...req.query }
    const IdWorkCenter = req.IdWorkCenter
    let IdMicroProg = req.params.id
    const ClaUsuarioMod = req.ClaUsuarioMod == undefined ? 0 : req.ClaUsuarioMod

    try {
        const result = await dbConnection.request()
            .input('pnClaUbicacion', sql.Int, ClaUbicacion)
            .input('psIdWorkCenter', sql.VarChar, IdWorkCenter)
            .input('pnIdMicroProg', sql.Int, IdMicroProg)
            .input('psNombrePcMod', sql.VarChar, NombrePcMod)
            .input('pnClaUsuarioMod', sql.Int, ClaUsuarioMod)
            .input('psIdioma', sql.VarChar, Idioma)
            .output('psErrorKey', sql.VarChar)
            .output('psErrorMsg', sql.VarChar)
            .execute('AswSch.Asw_CU153_Pag1_IniciarOrden_Proc');
        if (result.output.psErrorKey == "SUCCESS") {
                res.status(200).json({
                    msg: result.output.psErrorKey,
                    result: result.recordset,
                })
        }else{
            //Bad Request
            res.status(400).json({
                key: result.output.psErrorKey,
                msg: result.output.psErrorMsg.replace('{{ClaveWorkCenter}}',IdWorkCenter)
            })

        }

    } catch (error) {
        console.error(error)
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
 * CU155
 * Obtener las ordenes de producción del plan actual y la orden de producción actual
 * Utilizando el IdWorkCenter mediante query
 * 
 * @param {Request} req 
 * @param {Response} res 
 * @returns 
 */
const getOrdenesIdWorkCenter = async(req, res = response) => {
    let { ClaUbicacion, IncluirTodo, Idioma, IdWorkCenter } = {...req.query }    

    try {
        const result = await dbConnection.request()
            .input('pnClaUbicacion', sql.Int, ClaUbicacion)
            .input('psIdWorkCenter', sql.VarChar, IdWorkCenter)
            .input('pnIncluirTodo', sql.Int, IncluirTodo)
            .execute('AswSch.Asw_CU151_Pag1_MicroProgramaSel');

        res.status(200).json({
            msg: 'SUCCESS',
            orders: result.recordset
        });

    } catch (error) {
        res.status(500).json({
            key: 'ErrorKey',
            msg: 'Report error to administrator',
            error
        })

    }
}

/** 
 * CU155
 * Division de OPM
 * 
 * @param {Request} req 
 * @param {Response} res 
 * @returns 
 */
const dividirOpm = async(req, res) => {
    let { ClaUbicacion,Idioma,IdMicroprog,IdWorkCenterDestino,CantidadAProducir, Comentarios,NombrePc } = {...req.query }
    const ClaUsuarioMod = req.ClaUsuarioMod == undefined ? 0 : req.ClaUsuarioMod

    try {
        const result = await dbConnection.request()
            .input('pnClaUbicacion', sql.Int, ClaUbicacion)
            .input('pnIdMicroprog', sql.Int, IdMicroprog)
            .input('psIdWorkCenterDestino', sql.VarChar, IdWorkCenterDestino)
            .input('pnCantidadAProducir', sql.Int,CantidadAProducir)
            .input('psComentarios', sql.VarChar, Comentarios)
            .input('pnClaUsuario', sql.Int, ClaUsuarioMod)
            .input('psNombrePc', sql.VarChar, NombrePc)
            .input('psIdioma', sql.VarChar, Idioma)
            .output('psErrorKey', sql.VarChar)
            .output('psErrorMsg', sql.VarChar)
            .execute('AswSch.ASW_CU155_Pag2_SplitOpm_IU');      
        
        if (result.output.psErrorKey == "SUCCESS") {
                res.status(200).json({
                    msg: result.output.psErrorKey,
                    result: result.recordset
                })
        }else{
            //Bad Request
            res.status(400).json({
                key: result.output.psErrorKey,
                msg: result.output.psErrorMsg.replace('{{ClaveWorkCenter}}',IdWorkCenterDestino)
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


module.exports = {
    getOrdenes,
    getOrdenActiva,
    iniciarOrden,
    getOrdenesIdWorkCenter,
    dividirOpm
}