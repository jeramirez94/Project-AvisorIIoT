const sql = require('mssql')
const { dbConnection } = require('../database/config')
const { response } = require('express')
const { generarJWT } = require("../helpers/jwt");
const config = require('../config')

const SUCCESS = "SUCCESS"

/** 
 * Loging
 * 
 * @param {Request} req 
 * @param {Response} res 
 * @returns 
 */
const loginUsuario = async(req, res) => {

    const {IdUsuario,Pwd,ClaUbicacion,Idioma} = req.body
    
    const TipoAutenticacion = config.app.autenticacion  
    const IdWorkCenter =  req.IdWorkCenterDefault == undefined ? 'FF-01' : req.IdWorkCenterDefault
    const ClaUsuarioMod =  req.ClaUsuarioMod == undefined ? 0 : req.ClaUsuarioMod
    const NombrePcMod = `Estacion ${IdWorkCenter}`
    
    console.log(Idioma+' - '+ClaUbicacion+' - '+ NombrePcMod + ' - ' + IdUsuario + ' + ' + Pwd + ' + ' )

    try{
        const result = await dbConnection.request()
                        .input('PnClaUbicacion', sql.Int, ClaUbicacion)
                        .input('PsPwd',sql.VarChar,Pwd)
                        .input('psIdWorkCenter', sql.VarChar, IdWorkCenter)
                        .input('pnClaUsuarioMod', sql.Int, ClaUsuarioMod)
                        .input('psNombrePcMod', sql.VarChar, NombrePcMod)
                        .input('PnIdUsuario',sql.Int,IdUsuario)
                        .input('PsAutenticacion',sql.VarChar,TipoAutenticacion)
                        .input('psIdioma',sql.VarChar,Idioma)
                        .input('PnDebug', sql.Int, 0)
                        .output('psErrorKey', sql.VarChar)
                        .output('psErrorMsg', sql.VarChar)
                        .execute('AswSch.ASW_CU1_Pag2_LoginUsuario_Sel');

        if(result.output.psErrorKey === SUCCESS){

            if(result.recordset && result.recordset.length > 0){
               
                if(result.recordset[0].Autenticado === 1){
                    req.session.user = { IdUsuario: result.recordset[0].IdUsuario,
                                         NomUsuario: result.recordset[0].NomUsuario
                                        }
                    await req.session.save();

                    res.status(200).json(
                        {key: result.output.psErrorKey,
                        IdUsuario: result.recordset[0].IdUsuario,
                        NomUsuario: result.recordset[0].NomUsuario}
                    );
                    return;
                }
                
            }
            //si llega hasta aqui no hubo error en el sp pero tampoco devolvio datos
            //invalidar cookie si es que había uno
            req.session.destroy()

            res.status(400).json(
                {key: "UnknownError",
                msg: "Login process error. Report error to administrator."}
            )
             
        }else{
            //invalidar cookie si es que había uno
            req.session.destroy()

            res.status(400).json(
                {key: result.output.psErrorKey,
                msg: result.output.psErrorMsg}
            )
        }
        
    }
    catch(error){
        //invalidar cookie si es que había uno
        req.session.destroy()
        //error de sql server
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

/** 
 * Revalidacion del token en cada peticion 
 * 
 * @param {Request} req 
 * @param {Response} res 
 * @returns 
 */
const revalidarToken = async(req, res) => {

    const idUsuario = req.idUsuario;
    const nombreUsuario = req.nombreUsuario;

    //Generar un nuevo token y retornarlo en esta peticion
    const token = await generarJWT(idUsuario, nombreUsuario);

    res.json({
        token
    });
}

/** 
 * CU1.2
 * Obtener lista de usuarios 
 * 
 * @param {Request} req 
 * @param {Response} res 
 * @returns 
 */
const getUsuarios = async(req, res) => {
    //se declaran variables para almacenar el los parametros en la propiedad query de la solicitud http
    let { ClaUbicacion, Idioma} = {...req.query }  
    const IdWorkCenter =  req.IdWorkCenter == undefined ? 'FF-01' : req.IdWorkCenter
    const ClaUsuarioMod =  req.ClaUsuarioMod == undefined ? 0 : req.ClaUsuarioMod
    const NombrePcMod = `Estacion ${IdWorkCenter}`

    try {
            //Se enviar la solicitud al servidor SQL para ejecutar el proceso definido.
            const result = await dbConnection.request()
                .input('pnClaUbicacion', sql.Int, ClaUbicacion)
                .input('psIdioma', sql.VarChar, Idioma)
                .output('psErrorKey', sql.VarChar)
                .output('psErrorMsg', sql.VarChar)
                .execute('[AswSch].[ASW_CU1_Pag2_Usuario_Sel]');
            //Respuesta exitosa por parte del servidor SQL
            if (result.output.psErrorKey == "SUCCESS") {
                res.status(200).json({
                        msg: result.output.psErrorKey,
                        usuarios: result.recordset
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
 * CU1.2
 * Obtener sesion activa
 * 
 * @param {Request} req 
 * @param {Response} res 
 * @returns 
 */
const getSesion = async(req, res) => {
    try {  
        if(config.app.autenticacion === "OFF"){             
            res.status(200).json({
                key: "SUCCESS",
                sesion: {
                    user: {
                        IdUsuario: 0,
                        NomUsuario: ""
                    }
                }
            });
        }
        else{         
            res.status(200).json(
                {key: "SUCCESS",
                sesion: req.session}
            )
        }

    } catch (error) {
        res.status(500).json({
            key: 'UnknownError',
            msg: 'Report error to administrator',
            details: error.toString(),
            error
        })
        

    }

}


/** 
 * CU1.2
 * Eliminar sesion activa
 * 
 * @param {Request} req 
 * @param {Response} res 
 * @returns 
 */
const deleteSesion = async(req, res) => {
    try {  
        req.session.destroy()
        res.status(200).json({
            key:SUCCESS,
            msg: 'Session destroyed'
        });

    } catch (error) {
        res.status(500).json({
            key: 'UnknownError',
            msg: 'Report error to administrator',
            details: error.toString(),
            error
        })
        

    }

}

const validaSolicitudAutorizacion =  (req,res,next) =>{


    if(req.permisos){
        if(req.permisos.Permiso7){

            const opcionesCookie={
                httpOnly:true,
                path:'/',
                expires:  new Date(Date.now() + 5 * 60 * 1000)
            }
            res.cookie('Authorized',1,opcionesCookie);

           return res.status(200).json({
                key:SUCCESS,
                msg: 'Authorization granted'
            });
        }
    }
    // en caso de que exista el cookie
    //y no tenga permiso, elimnar el cookie o mandar a false
    res.cookie('Authorized', '', { expires: new Date(0) });

    return res.status(403).json({
                key:'Not authorized',
                msg: 'Not authorized'
    });
  


    
}

module.exports = { loginUsuario, getSesion, deleteSesion, getUsuarios,validaSolicitudAutorizacion }