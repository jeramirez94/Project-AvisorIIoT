const jwt = require('jsonwebtoken');

const validarJWT = (req, res, next) => {

    // const token = req.header('x-token');

    // if (!token) {
    //     return res.status(401).json({
    //         ok: false,
    //         msg: 'No hay token en la peticion'
    //     });
    // }

    // try {
    //     const { idUsuario, nombreUsuario } = jwt.verify(
    //         token,
    //         config.env.JWT_SEED
    //     );

        req.ClaUsuario = 0 //idUsuario;
    //     req.nombreUsuario = nombreUsuario;


    // } catch (error) {
    //     return res.status(401).json({
    //         ok: false,
    //         msg: 'Token no valido'
    //     });
    // }

    next();

}

module.exports = { validarJWT }