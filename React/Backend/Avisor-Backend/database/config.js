const sql = require('mssql')
const config = require('../config')

/**
 * trustServerCertificate: true
 * By default the SQL Server Setup program creates a self-signed X.509 certificate and assigns it to the instance. You have three choices: 
 * 1. use TrustServerCertificate=True as Dan Guzman mentioned; 
 * 2. log on to the Windows server running the SQL instance, export the public key of its X.509 certificate to a file and import that into your client computer's Trusted Certificates/Roots store; 
 * 3. Get a (trusted) X.509 certificate from a CA (or your organisation) and assign it to the SQL instance via SQL Server Configuration Manager.
 */
const dbconfig = {
    user: config.env.ASW_BD_USER,
    password: config.env.ASW_BD_PASSWORD,
    server: config.env.ASW_BD_SERVER, // You can use 'localhost\\instance' to connect to named instance
    database: config.env.ASW_BD_DATABASE,
    options: {
        //trustedConnection: true,
        encrypt: false,
        // enableArithAbort: true,
        trustServerCertificate: true

    }
}

const dbConnection = new sql.ConnectionPool(dbconfig);


const dbConnect = async() => {
    try {
        await dbConnection.connect()
            //resolve(pool)
        console.log('DB Online');

    } catch (err) {
        //si es un error de conexion reintenta cada 5 minutos
        let conectionErrors =['ETIMEOUT','ENOTOPEN','EINSTLOOKUP','ECONNCLOSED','ESOCKET'];
        if(err.code &&  conectionErrors.indexOf(err.code)>-1){
            setTimeout(() => {
                console.log('Trying to establish a connection to DB');
                dbConnect();
            }, 5*60*1000);
        }
        console.error(`Conection to DB failed. ${err.toString()}`);
        //throw new Error('Error al inicializar la BD')
    }
}


module.exports = {
    dbConnection,
    dbConnect
}