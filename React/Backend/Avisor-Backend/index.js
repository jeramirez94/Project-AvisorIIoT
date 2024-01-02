const express = require('express'); 
const cors = require('cors')
const config = require('./config')
const { dbConnect } = require('./database/config');

//crear servidor 
const app = express();

//Actualización: se agregan restricciones de seguridad para 
//permitir solo entradas del cliente local por el puerto 300 
app.use(cors({
            origin: config.env.CORS_ORIGIN.split(' '),
            credentials: true 
            }
            )
        );


//Base de datos
dbConnect();

//Directorio publico --para montar la app react
app.use(express.static('public'))

//middleware para parsear el body
app.use(express.json());
//Rutas
app.use('/api/auth', require('./routes/auth'));
app.use('/api/produccion/ordenes', require('./routes/ordenes'));
app.use('/api/maquinas', require('./routes/maquinas'));
app.use('/api/produccion', require('./routes/produccion'));
app.use('/api/turnos', require('./routes/turnos'));
app.use('/api/header', require('./routes/header'));
app.use('/api/footer', require('./routes/footer'));
app.use('/api/paros', require('./routes/paros'));
app.use('/api/andon', require('./routes/andon'));
app.use('/api/heartbeat',require('./routes/heartbeat'))

//Abrir puerto
app.listen(config.env.PORT, () => {
    console.log(`Sevidor corriendo en puerto: ${config.env.PORT}`);
})