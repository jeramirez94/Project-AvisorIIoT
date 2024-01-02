const sql = require('mssql');
const config = require('../config');
const {dbConnection} = require('../database/config');

const SUCCESS = "SUCCESS"

const ValidaCredenciales = async (req,res,next)=>{

     //Se usa esta variable para saber si la peticion es para autorizar un flujo
     const {EsSolicitaAutorizacion} = req
     //Id del usuario que va a autorizar
     const {IdUsuarioAutorizador} = req.body;

     const {IdUsuario,Pwd,ClaUbicacion,Idioma} = req.body
    
     const TipoAutenticacion = "ON"
     const IdWorkCenter =  req.IdWorkCenter == undefined ? 'FF-01' : req.IdWorkCenter
     const ClaUsuarioMod =  req.ClaUsuarioMod == undefined ? 0 : req.ClaUsuarioMod
     const NombrePcMod = `Estacion ${IdWorkCenter}`


     try{
        const result = await dbConnection.request()
                        .input('PnClaUbicacion', sql.Int, ClaUbicacion)
                        .input('PsPwd',sql.VarChar,Pwd)
                        .input('psIdWorkCenter', sql.VarChar, IdWorkCenter)
                        .input('pnClaUsuarioMod', sql.Int, ClaUsuarioMod)
                        .input('psNombrePcMod', sql.VarChar, NombrePcMod)
                        .input('PnIdUsuario',sql.Int,EsSolicitaAutorizacion ? IdUsuarioAutorizador : IdUsuario)
                        .input('PsAutenticacion',sql.VarChar,TipoAutenticacion)
                        .input('psIdioma',sql.VarChar,Idioma)
                        .input('PnDebug', sql.Int, 0)
                        .output('psErrorKey', sql.VarChar)
                        .output('psErrorMsg', sql.VarChar)
                        .execute('AswSch.ASW_CU1_Pag2_LoginUsuario_Sel');

        if(result.output.psErrorKey === SUCCESS){

            if(result.recordset && result.recordset.length > 0){
               
                if(result.recordset[0].Autenticado === 1){
                    next()
                }
                
            }
             
        }else{
            res.cookie('Authorized', '', { expires: new Date(0) });
            res.status(400).json(
                {key: result.output.psErrorKey,
                msg: result.output.psErrorMsg}
            )
        }
        
    }
    catch(error){
        res.cookie('Authorized', '', { expires: new Date(0) });
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

module.exports = {ValidaCredenciales}
