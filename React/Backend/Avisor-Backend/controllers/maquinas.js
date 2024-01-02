const sql = require('mssql')
const { dbConnection } = require('../database/config')
const { response } = require('express')
const { getCookies, setCookie } = require('../helpers/cookies')
/** 
 * CU162.1
 * Obtener todas las maquinas por ubicación y las maquinas preferidas.
 * 
 * @param {Request} req 
 * @param {Response} res 
 * @returns 
 */
const getMaquinas = async(req, res = response) => {
    
    //se declara e inicializa la constante para almacenar las cookies consultada (maquinas preferidas)
    let cookieRespuesta = await getCookies(req,res);
    
    //se declaran variables para almacenar el los parametros en la propiedad query de la solicitud http
    let { ClaUbicacion, Idioma,pnTipo,pnModoSel,pnBajasSn } = {...req.query }
    try {
            //se gener un control de dependiendo de la respuesta de la cookie en el caso de obtener undefined
            cookieRespuesta["IdWorkCenter"] ??= '';
            cookieRespuesta["maquinasPreferidas"] ??= '';
            //Se enviar la solicitud al servidor SQL para ejecutar el proceso definido.
            const result = await dbConnection.request()
                .input('pnClaUbicacion', sql.Int, ClaUbicacion)
                .input('psValor', sql.VarChar, '')
                .input('psMaquinasPreferidas', sql.VarChar, cookieRespuesta["maquinasPreferidas"])
                .input('psIdioma', sql.VarChar, Idioma)
                .input('pnTipo',sql.VarChar, pnTipo)
                .input('pnModoSel',sql.VarChar, pnModoSel)
                .input('pnBajasSn', sql.VarChar, pnBajasSn)
                .input('psIdWorkCenterActual', sql.VarChar, cookieRespuesta["IdWorkCenter"])
                .output('psErrorKey', sql.VarChar)
                .output('psErrorMsg', sql.VarChar)
                .execute('AswSch.ASWMaquinasCmb');
            //Respuesta exitosa por parte del servidor SQL
            if (result.output.psErrorKey == "SUCCESS") {
                    res.cookie('IdWorkCenter',result.recordset[0].IdWorkCenter);

                    res.status(200).json({
                        maquinas: result.recordset
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
 * CU162.1
 * Metodo para crear y/o modificar las maquinas oreferidad y el IdWorkCenter
 * 
 * @param {Request} req 
 * @param {Response} res 
 * @returns 
 */
const setMaquinas = async(req, res = response) => {
    setCookie(req, res);
}


module.exports = { getMaquinas, setMaquinas };