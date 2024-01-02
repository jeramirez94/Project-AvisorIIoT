const sql = require('mssql')
const { dbConnection } = require('../database/config')

const SUCCESS = "SUCCESS"


/** 
 * CU169.1
 * Obtener los datos que se muestran en el header
 * 
 * @param {Request} req 
 * @param {Response} res 
 * @returns 
 */
const getDatosHeader = async(req, res = response) => {
    const { ClaUbicacion,Idioma } = {...req.query }    
    const IdWorkCenter = req.IdWorkCenter

    try{

        const result = await dbConnection.request()
            .input('pnClaUbicacion', sql.Int, ClaUbicacion)
            .input('psIdWorkCenter', sql.VarChar, IdWorkCenter)
            .input('psIdioma',sql.VarChar,Idioma)
            .output('psErrorKey',sql.VarChar)
            .output('psErrorMsg',sql.VarChar)
            .execute('AswSch.ASW_CU169_Pag1_DatosHeader_Sel');

        if(result.output.psErrorKey === SUCCESS){
            res.status(200).json(
                result.recordset
            );
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


module.exports = {
    getDatosHeader
}