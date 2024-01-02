import { useState, useEffect } from 'react';
import { useConfigContext } from "../../utils/config"
import { fetchData } from '@/utils/fetch'
import { useTranslation } from 'react-i18next'
import ModalError from '@/components/modal'
import { useRouter } from 'next/router';


export default function CU1_Pag2_logout(){

    const router = useRouter();
    
    const [config, setConfig] = useConfigContext();
    const [errorMsg, setErrorMsg] = useState(null);
    const [status, setStatus] = useState(200);

    useEffect(() => {
        // Verificar si el usuario ya tiene una sesión activa al cargar la página
        deleteSession();
      }, []);
    
      const deleteSession = async () => {
        
            fetchData(
                config.Api+"auth/sesion",
                "",
                'DELETE',
                null,
                true
            ).then(async(res) => {
                let codeStatus = res.status
                let data = await res.json()
                if (codeStatus == 200) {
                    router.push('/login'); 
                }else{
                    throw Error(data.msg);
                }   

            }).catch((error) => {
                setStatus(null);
                setErrorMsg(error.toString())
                console.error(error.toString());
            }); 
         
      };
    
    if(status != 200){
        return(
            <>
                    <ModalError status={status} setStatus={setStatus} Text_modalbody={errorMsg}/>
            </>
        )
    }else{
        return(
            <>
            Loggin out {errorMsg}
            </>
        )
    }
}