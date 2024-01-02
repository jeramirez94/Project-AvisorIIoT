const ironSession = require("iron-session/express").ironSession;
const config = require('../config')
const sql = require('mssql')
const {dbConnection} = require('../database/config')



/**
 * Middleware para manejo de sesion
 * este agrega al request el objeto session (req.session) 
 * si ese objeto no esta definido significa que no hay sesion valida. 
 * la libreria se encarga de revisar que el valor del cookie sea valido 
 */
const session = async (req,res,next)=>{
    const {ClaUbicacion} = req.body
    const IdWorkCenter = req.IdWorkCenter

    let ttl  = 0;
    try{

    
        //VENCIMIENTO POR MINUTOS
        if(config.app.vencimientoToken > 0){
            ttl = config.app.vencimientoToken * 1000;
        }

        if(config.app.vencimientoTurno ===1 ){
            const result = await dbConnection.request()
            .input('PnClaUbicacion', sql.Int, ClaUbicacion)
            .input('PsIdWorkCenter', sql.VarChar, IdWorkCenter)
            .query('SELECT FechaAdm, ClaTurno, InicioTurno, FinTurno, MinutosFinTurno FROM ASWSch.AswDatosTurnoActual(@PnClaUbicacion, @PsIdWorkCenter)')


            if(result.recordset && result.recordset.length > 0){
                ttl = result.recordset[0].MinutosFinTurno * 60
            }

        }

        ironSession({
            cookieName: config.app.sessionCookieName,
            password: config.env.JWT_SEED,
            ttl,
            cookieOptions: {
            secure: process.env.NODE_ENV === "production"
            },
        })(req,res,next)

    }
    catch(error){
        console.error(error)
        res.status(500).json({
            key: 'ErrorKey',
            msg: 'Report error to administrator',
            error
        })
    }

};

const existeSesion = (req,res,next) =>{
    if(config.app.autenticacion === "OFF"){
        req.ClaUsuario = 0
        req.ClaUsuarioMod = 0 
        next()
    }else{
        if(!req.session || !req.session.user){
            res.status(401).json(
                {key: "AUTH_REQUIRED",
                msg: "You must log in"}
            )
        }else{
            req.ClaUsuario = req.session.user.IdUsuario
            req.ClaUsuarioMod = req.session.user.IdUsuario
            next()
        }
    }
    

}




module.exports  = {session,existeSesion};