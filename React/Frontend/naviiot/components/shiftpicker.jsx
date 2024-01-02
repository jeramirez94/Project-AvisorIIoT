import { useState, useEffect } from "react";
import { fetchData } from '@/utils/fetch';
import { useConfigContext } from '@/utils/config';
import { useFooterContext } from '@/utils/footerCtx';
import  styles  from './shiftpicker.module.css'
import usericon from '@/assets/img/usericon.png'
import ModalError from '@/components/modal'
export default function ShiftPicker({selectedOptions, setSelectedOptions, openViews,setOpenViews}){
    //se crear constantes de estado con valor null por default
    //para almacenar datos que devuelve el backend
    const [turnos, setTurnos] = useState(null);
    const [status, setStatus] = useState(200);
    const [loaded, setLoaded] = useState(false);
    const [footer, setFooter] = useFooterContext();
    const [errorMsg, setErrorMsg] = useState(null);
    //crear constante con las configuraciones.
    const [config, setConfig] = useConfigContext();
    

    async function handleClickConfigShift(selectedShift){
        fetchData(config.Api + "turnos/config", "?ClaUbicacion=" + config.ClaUbicacion + "&Idioma=" + config.Idioma+"&ClaTurnoExterno="+selectedShift, 'POST','', false)
        .then(async (res) => {
            let codeStatus = res.status
            let data = await res.json()
            switch (codeStatus) {
                case 200:
                    setOpenViews({'otherUsers': false, 'shiftSelector': false, 'confirm': true})
                    setStatus(codeStatus)
                    break;
                case 500:
                    setErrorMsg(data.msg + " \n " + JSON.stringify(data.error))
                    setStatus(codeStatus)
                    break;
                case 401: 
                    setErrorMsg(data.msg)
                    setStatus(codeStatus)
                    break;
                case 400:
                default:
                    setErrorMsg(data.msg)
                    setStatus(codeStatus)
                    break;
            }
        }).catch((error) => {
            setErrorMsg("Report error to administrator." + "\n" + error.toString())
            setStatus(null)
        })
    }
    useEffect(() =>{
        status == 200 && errorMsg != null && turnos == null ? setOpenViews({'otherUsers': false, 'shiftSelector': false, 'confirm': false}) : status
        status == 200 && turnos != null ? setOpenViews({'otherUsers': false, 'shiftSelector': true, 'confirm': false}) : status
       
    }, [status]);

    useEffect(() =>{
        fetchData(config.Api + "turnos/config", "?ClaUbicacion=" + config.ClaUbicacion + "&Idioma=" + config.Idioma, 'GET', null, false)
        .then(async (res) => {
            let codeStatus = res.status
            let data = await res.json()
            switch (codeStatus) {
                case 200:
                    setTurnos(data.turnos);
                    break;
                case 500:
                    setErrorMsg(data.msg + " \n " + JSON.stringify(data.error))
                    setStatus(codeStatus)
                    break;
                case 401: 
                    setErrorMsg(data.msg)
                    setStatus(codeStatus)
                    break;
                case 400:
                default:
                    
                    setErrorMsg(data.msg)
                    setStatus(codeStatus)
                    break;
            }
            setLoaded(true);
        }).catch((error) => {
            setErrorMsg("Report error to administrator." + "\n" + error.toString())
            setStatus(null)
            setLoaded(true);
        })
        
    }, []);
    if(status == 200 && loaded && turnos != null){
        
        return(
            <div>
                 <div className='modal d-block bg-dark bg-opacity-80' tabIndex="1" >
                    <div className="modal-dialog modal-dialog-centered" role="document">
                        <div className="modal-content text-center">
                            <div className="modal-header">
                                <h5 className="modal-title">Select your shift </h5>
                                <button type="button" className="btn-close" onClick={() => {setOpenViews({'otherUsers': false, 'shiftSelector': false, 'confirm': false})}} aria-label="Close">
                                </button>
                            </div>
                        <div className={`modal-body`}>
                            <div className="row d-flex">
                                {Object.keys(turnos).map((i) => (
                                    <div key={i} className={`col-sm-6 mt-3 mb-3 `} role="button">
                                        <div className={`card ${styles.cardStyle} `} onClick={() => {setSelectedOptions({"username": selectedOptions["username"],"idusuario": selectedOptions["idusuario"],"loginusername": selectedOptions["loginusername"], 'idshift': turnos[i]["ClaTurno"], "shiftname": turnos[i]["NomTurno"]}), setFooter({NombreUsuario: footer.NombreUsuario, Turno: turnos[i]["NomTurno"]}), handleClickConfigShift(turnos[i]["ClaTurno"])}}>
                                            <div className="card-body text-center">
                                                <span id={turnos[i]["ClaTurno"]} className="m-auto">{turnos[i]["NomTurno"]}</span>
                                            </div>
                                        </div>
                                    </div>
                                                                

                                ))}
                            </div>
                        </div>
                            <div className="modal-footer d-flex justify-content-center">
                                
                                <button type="button" className="btn btn-primary btn-lg mx-2 global_btn_primary" onClick={() => {setOpenViews({'otherUsers': false, 'shiftSelector': false, 'confirm': false})}}>Cancel</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        )
    }else if(loaded && status != 200){
        return(<>
            <ModalError status={status} setStatus={setStatus} Text_modalbody={errorMsg}/>
            
           </>)
        
             
    }
    
}