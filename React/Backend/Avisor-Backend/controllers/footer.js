const sql = require('mssql')
const { dbConnection } = require('../database/config')
const { response } = require('express')

/** 
 * CU1.7
 * Obtener los datos que se muestran en el header
 * 
 * @param {Request} req 
 * @param {Response} res 
 * @returns 
 */
const getDatosFooter = async(req, res = response) => {
    const { ClaUbicacion,Idioma } = {...req.query }    
    const IdWorkCenter = req.IdWorkCenter

    try{

        const result = await dbConnection.request()
            .input('pnClaUbicacion', sql.Int, ClaUbicacion)
            .input('psIdWorkCenter', sql.VarChar, IdWorkCenter)
            .input('psIdioma',sql.VarChar,Idioma)
            .output('psErrorKey',sql.VarChar)
            .output('psErrorMsg',sql.VarChar)
            .execute('AswSch.ASW_CU1_Pag7_DatosFooter_Sel');

        if(result.output.psErrorKey == "SUCCESS"){
            res.status(200).json({
                msg: result.output.psErrorKey,
                footer: result.recordset
        });
        }else{
            res.status(400).json({
                key: result.output.psErrorKey,
                msg: result.output.psErrorMsg
            })
        }

    }catch (error) {
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


module.exports = { getDatosFooter }