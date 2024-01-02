//Metodo para crear y/o modificar cookies
const setCookie = (req, res) =>{

    //se crea / modifica la cookie 
    try{
        const opcionesCookie={
            path:'/',
            expires: new Date('9999-12-31')
        }
        res.cookie(req.query.cookieNombre,req.query.cookieValor,opcionesCookie);
        res.status(200).json({
            aviso: "Cookie creada con éxito"
        })
    }
    catch(e){
        
        res.status(500).json({
            key: 'SET_COOKIE_ERROR',
            msg: 'Error al crear cookie. Revisar los parametros enviados',
            error
        })
    }

}
//Metodo para obtener cookies (si no existe arroja error en consola)
const getCookies = (req, res) => {
     //Se declara e inicializa variable de tipo JSON para almacenar la respuesta que se devolvera al termino de la función.
     let jsonResponse = {};
    try{
        //Se declara e inicializa variable para separar las cookies
        let stringSplitted = req.headers.cookie.split(/[;]/);
        //se declara e inicializa variable para almacenar temporalmente las cookies que se procesaran en el mapeo.
        let singleCookieArray = [];
        //Se construye el mapeo del objeto 'stringSplitted' con las cookies que se desean extraer.
        //y se modifica la estructura de Array a Json
        stringSplitted.forEach((element) => {
            //Se separan las cookies por nombre y valor
            singleCookieArray = element.split(/[=]/)
            //Se almacenan en formato de JSON las cookies extraida
            jsonResponse[singleCookieArray[0].replace(' ', '')] = decodeURIComponent(singleCookieArray[1])
            
        });
        
        if(stringSplitted.length == 0){
            jsonResponse["estadoCookie"] = "COOKIES DO NOT EXISTS";
        }else{
            jsonResponse["estadoCookie"] = "OK";
        }
    }catch(error){
        jsonResponse["estadoCookie"] = "COOKIES DO NOT EXISTS";
    }
    //se devuelve las cookies
    return jsonResponse;
}

module.exports = { setCookie , getCookies }