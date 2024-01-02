const jwt = require('jsonwebtoken');
const config = require('../config')

const generarJWT = (idUsuario, nombreUsuario) => {
    return new Promise((resolve, reject) => {
        const payload = { idUsuario, nombreUsuario };

        jwt.sign(payload, config.env.JWT_SEED, {
            expiresIn: '2h'
        }, (err, token) => {
            if (err) {
                console.log(err);
                reject('No se pudo generar el token');
            }

            resolve(token);

        })
    });

}

module.exports = { generarJWT }