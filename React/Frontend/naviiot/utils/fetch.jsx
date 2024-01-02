import {ModalSpinner} from '../components/modal'
import ReactDOM from "react-dom";
import ReactDOMServer from "react-dom/server";
//función asyncrona para enviar solicitud HTTP a backend
/**
 * 
 * @param {string} url La URL de la API
 * @param {*} query La cadena de consulta (parametros) para la URL.
 * @param {*} metodo El método HTTP para la llamada (GET, POST, etc.).
 * @param {*} body  Parametros para request tipo POST
 * @returns 
 */
export async function fetchData(url, query, metodo, body, apagarSpinner,CuPag=null){
    //se convierte el componente modal spinner a texto para lograr agregar al cuerpo del documento
    let pageContainer = document.body
    let spinnerAdd = ReactDOMServer.renderToStaticMarkup(<ModalSpinner/>);
    apagarSpinner != true ? pageContainer.insertAdjacentHTML('beforeend',spinnerAdd) : metodo

    if(CuPag){
        if(metodo === 'GET'){
            query = query+`&CU=${CuPag.CU}&Pag=${CuPag.Pag}`
        }else{
            if(body){
                switch (typeof body){
                    case 'object':
                            body.CU = CuPag.CU;
                            body.Pag = CuPag.Pag;
                            
                        break;
                    case 'string': 
                            body=JSON.parse(body)
                            body.CU = CuPag.CU;
                            body.Pag = CuPag.Pag;
                        break;
                        

                }
            }else{
                body= CuPag
            }
          
        }

        console.log(url+query,metodo)
    }
    

    //se realiza la llamada a la API con parametros en la propiedad Query por metodo GET.
    return await fetch(url+query, {
        
        method: metodo,
        credentials: "include",
        headers: {
            'Content-Type': 'application/json'
        },
        body: (body && typeof body === 'object') ? JSON.stringify(body):body,
     })
     .finally(() => {
        if(apagarSpinner != true){
            let spinnerRemove = document.getElementById('spinner')
            pageContainer.removeChild(spinnerRemove) 
        }
        
    })
     
     
}