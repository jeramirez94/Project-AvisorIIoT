const sql = require('mssql');
const config = require('../config');
const {dbConnection} = require('../database/config');
const {getCookies} = require('../helpers/cookies')


const permisos = async (req,res,next)=>{

    //Se usa esta variable para saber si la peticion es para autorizar un flujo
    const {EsSolicitaAutorizacion} = req
    //Id del usuario que va a autorizar
    const {IdUsuarioAutorizador} = req.body;

    let ClaUbicacion,Idioma;
    let CU,Pag

    if(req.method === 'GET'){
         ({ClaUbicacion,Idioma,CU,Pag} = req.query)
    }else{
         ({ClaUbicacion,Idioma,CU,Pag} = req.body)

         ClaUbicacion = ClaUbicacion ? ClaUbicacion : req.query.ClaUbicacion;

         Idioma = Idioma ? Idioma : req.query.Idioma;

         CU =  CU ? CU : req.query.CU;

         Pag = Pag ? Pag : req.query.Pag;

    }

    if(config.app.permisosWti === 1){
        

        const IdUsuario =  EsSolicitaAutorizacion ? IdUsuarioAutorizador : req.session.user.IdUsuario;
       
        try {
            const result = await dbConnection.request()
                .input('PnClaUbicacion', sql.Int, ClaUbicacion)
                .input('PnIdUsuario', sql.Int, IdUsuario)
                .input('PnCU', sql.Int, CU)
                .input('PnPag', sql.Int, Pag)
                .input('PsIdioma', sql.VarChar, Idioma)
                .output('psErrorKey', sql.VarChar)
                .output('psErrorMsg', sql.VarChar)
                .execute('AswSch.ASW_CU1_Pag3_PermisosObjetoUsuario');

            if (result.output.psErrorKey == "SUCCESS") {

                    req.permisos = result.recordset[0]

                    if(req.permisos.Acceso){
                        next();
                    }else{
                        const {Authorized}  = getCookies(req,res);
                        if(Authorized){
                            next();
                        }else{
                            res.status(403).json({key:'DENIED',msg:'Access denied'});
                        }
                        
                    }
                    
                    
            }else{
                //Bad Request
                if(result.output.psErrorKey == "UNCONF_PERMS"){
                    res.status(403).json({
                        key: result.output.psErrorKey,
                        msg: result.output.psErrorMsg
                    });
                }else{
                    res.status(400).json({
                        key: result.output.psErrorKey,
                        msg: result.output.psErrorMsg
                    })
                }
                
    
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



    }else{
        next();
    }
}

module.exports = {permisos}