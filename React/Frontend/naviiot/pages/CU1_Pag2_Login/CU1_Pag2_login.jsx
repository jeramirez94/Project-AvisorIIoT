import { useState, useEffect } from 'react';
import { useConfigContext } from "../../utils/config"
import { fetchData } from '@/utils/fetch'
import { useTranslation } from 'react-i18next'
import ModalError from '@/components/modal'
import ShiftPicker from '@/components/shiftpicker';
import { useRouter } from 'next/router';
import Image from 'next/image'
import userIcon from '@/assets/img/usericon.png'

export default function CU1_Pag2_login(){

    const router = useRouter();
    
    const [config, setConfig] = useConfigContext();
    const [errorMsg, setErrorMsg] = useState(null);
    const [status, setStatus] = useState(200);

    /*useEffect(() => {
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

                if (codeStatus == 200) {
                    router.push('/login'); 
                }else{
                    throw Error(data.msg)
                }   

            }).catch((error) => {
                setStatus(null);
                setErrorMsg(error.toString())
                console.error(error.toString());
            }); 
         
      };*/
    
    if(status != 200){
        return(
            <>
                <ModalError status={status} setStatus={setStatus} Text_modalbody={errorMsg}/>
            </>
        )
    }else{
        return(
            <>
                <div>
                    <div className='modal d-block bg-dark bg-opacity-80' tabIndex="1" onClick={() => {setStatus(200)}}>
                        <div className="modal-dialog modal-dialog-centered" role="document">
                            <div className="modal-content text-center">
                                <div className="modal-header">
                                    <h5 className="modal-title">Select your shift </h5>
                                    <button type="button" className="btn-close" onClick={() => { setStatus(200)}} aria-label="Close">
                                    </button>
                                </div>
                            <div className={`modal-body`}>
                                <div className="row d-flex">
                                    {Object.keys(turnos).map((i) => (
                                        <div key={i} className={`col-sm-6 mt-3 mb-3  `}>
                                            <div className={`card ${styles.cardStyle}`}>
                                                <div className="card-body text-center">
                                                    <span id={turnos[i]["ClaTurno"]} className="m-auto">{turnos[i]["NomTurno"]}</span>
                                                </div>
                                            </div>
                                        </div>
                                                                    

                                    ))}
                                </div>
                            </div>
                                <div className="modal-footer d-flex justify-content-center">
                                    
                                    <button type="button" className="btn btn-primary btn-lg mx-2 global_btn_primary" onClick={() => {setStatus(200)}}>Cancel</button>
                                    <button type="button" className="btn btn-primary btn-lg mx-2 global_btn_primary" onClick={() => {setStatus(200)}}>OK</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <ShiftPicker/>
            </>
        )
    }
}