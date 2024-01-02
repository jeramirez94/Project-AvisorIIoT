import {useState,useEffect} from 'react'
import { useRouter } from 'next/router';
import {ModalSpinner} from '../components/modal'
import ReactDOMServer from "react-dom/server";

/**
 * 
 * @param {object} SelectedIdWorkCenter 
 * @param {string} url 
 * @param {string} metodo 
 * @param {string} body 
 * @param {int} interval 
 * @param {boolean} apagarSpinner 
 * @returns 
 */
export default function useFetch(SelectedIdWorkCenter, url,metodo,body = null,interval = null,apagarSpinner) {

    const [res,setRes] = useState(null);
    const [err,setErr] = useState(null);
    const [loading,setLoading] = useState(false);
    const [statusCode,setStatusCode] = useState(null);
    const [StApagarSpinner,setStApagarSpinner] = useState(apagarSpinner);
    const router = useRouter();
    
    useEffect(()=>{
        /*
        si cambia la maquina seleccionada prendo el spinner, 
        al hacer eso se activa el useEffect y repite la busqueda
        */        
        setStApagarSpinner(false);

    },[SelectedIdWorkCenter]);
    
    useEffect(()=>{
        let intervalId ;

        const request = () =>{

            let pageContainer = document.body
            let spinnerAdd = ReactDOMServer.renderToStaticMarkup(<ModalSpinner/>);
            StApagarSpinner != true ? pageContainer.insertAdjacentHTML('beforeend',spinnerAdd) : metodo

            setLoading(true);
            setErr(null);
            fetch(url, {
                method: metodo,
                credentials: "include",
                headers: {
                    'Content-Type': 'application/json'
                },
                body: body,
            })
            .then(async (res)=>{
                setStatusCode(res.status);
                if(res.ok){
                    //SOLO ENTRA CUANDO EL CODIGO ESTA ENTRE 200 - 299
                    setRes(await res.json());
                    
                }else{

                    switch(res.status){
                        case 500:
                            setErr(await res.json())
                            break;
                        case 401: 
                            router.push("/login")
                            break;
                        default:
                            setRes(await res.json());
                            break;

                            
                    }
                    
                }
                
            })
            .catch(err => {
                setErr(err)
            })
            .finally(()=>{
                setLoading(false);
                if(StApagarSpinner != true){
                    let spinnerRemove = document.getElementById('spinner')
                    pageContainer.removeChild(spinnerRemove) 
                }
            })
        }

        //requset inicial
        request();
        //request por inteval
        if (interval) {
            //se apaga el spinner
            setStApagarSpinner(true);
            intervalId = setInterval(request, interval); 
        }
      
        return () => {
            clearInterval(intervalId); 
        };

    },[url,StApagarSpinner]);

    return {res,loading,err,statusCode}

}