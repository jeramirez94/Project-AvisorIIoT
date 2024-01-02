//Metodo para obtener cookies (si no existe arroja error en consola)
const getIdWorkCenter = (req, res, next) => {
   try{
       
       //Se declara e inicializa variable para separar las cookies
       let stringSplitted = (req.headers.cookie || '').split(/[;]/);
       //encuentra la cookie para el IdWorkCenter
       let cookieIdWorkCenter = stringSplitted.find((element)=> element.split(/[=]/)[0].replace(' ', '') === 'IdWorkCenter')
       //si encontro el cookie y lo asigno al request
       if(cookieIdWorkCenter){
            req.IdWorkCenter = cookieIdWorkCenter.split(/[=]/)[1]; 
            next();
       }else{
            res.status(400).json({
                key: 'WORKCENTER_COOKIE_NOT_FOUND',
                msg: 'Machine was not found, check you have selected a machine.',
                
            })
        }
    }catch(error){
        console.error(error)
        res.status(500).json({
            key: 'ErrorKey',
            msg: 'Report error to administrator',
            error
        })
    }
}

const getIdWorkCenterDefault = (req, res, next) => {
    try{
        
        //Se declara e inicializa variable para separar las cookies
        let stringSplitted = (req.headers.cookie || '').split(/[;]/);
        //encuentra la cookie para el IdWorkCenter
        let cookieIdWorkCenter = stringSplitted.find((element)=> element.split(/[=]/)[0].replace(' ', '') === 'IdWorkCenterDefault')
        //si encontro el cookie y lo asigno al request
        if(cookieIdWorkCenter){
             req.IdWorkCenter = cookieIdWorkCenter.split(/[=]/)[1]; 
             next();
        }else{
            const opcionesCookie={
                path:'/',
                expires: new Date('9999-12-31')
            }
            res.cookie("IdWorkCenterDefault",0,opcionesCookie);
            next();

         }
     }catch(error){
         console.error(error)
         res.status(500).json({
             key: 'ErrorKey',
             msg: 'Report error to administrator',
             error
         })
     }
}

module.exports = { getIdWorkCenter, getIdWorkCenterDefault }