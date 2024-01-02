import { useState, useEffect } from 'react';
import { fetchData } from '@/utils/fetch'
import ModalError from '@/components/modal'
import { useConfigContext } from "../utils/config"
import { useRouter } from 'next/router'
import TextInput from './textinput'
import { useTranslation } from 'react-i18next';
import Select from './select'

export default function Autorizacion({ CUPag,setEsAutorizado }) {

    const router = useRouter()
    const [config, setConfig] = useConfigContext()
    const [errorMsg, setErrorMsg] = useState();
    const [status, setStatus] = useState(200);
    const { t } = useTranslation('autorizacion');
    const [users, setUsers] = useState([]);
    const [loaded, setLoaded] = useState(false);
    const [InputPass,setInputPass] = useState("");

    const [IdUsuarioAutorizador, setIdUsuarioAutorizador] = useState(null);

    useEffect(()=>{
        ObtenerUsuarios();
    },[])

    const ObtenerUsuarios = () => {
        fetchData(config.Api + "auth/", "?ClaUbicacion=" + config.ClaUbicacion + "&Idioma=" + config.Idioma, 'GET', null, true)
            .then(async (res) => {
                let codeStatus = res.status
                let data = await res.json()
    
                switch (codeStatus) {
                    case 200:
                        
                        setUsers(data.usuarios.map(user => {
                            return { text: user.NombreUsuario, value: user.IdUsuario }
                        })
                        );
                                          
                        break;
                    case 500:
                        setErrorMsg(data.msg + " \n " + JSON.stringify(data.error))
                        setStatus(codeStatus)
                        break;
                    case 401: 
                        router.push("/login")
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
            })
    }

    const solicitarAutorizacion = ()=>{
        const params = {  IdUsuarioAutorizador: IdUsuarioAutorizador
                        , Pwd: InputPass
                        , ClaUbicacion: config.ClaUbicacion
                        , Idioma: config.Idioma
                    }

        fetchData(config.Api + "auth/SolicitaAutorizacion"
                 ,'' //QUERY PARAMS
                 ,'POST' //METODO
                 ,params //BODY PARAMS
                 ,true //APAGAR SPINNER
                 ,CUPag //OBJ CUPAG
                 )
        .then(async (res) => {
            let codeStatus = res.status
            let data = await res.json()

            switch (codeStatus) {
                case 200:
                        setEsAutorizado(true)
                    break;
                case 500:
                        setErrorMsg(data.msg + " \n " + JSON.stringify(data.error))
                        setStatus(codeStatus)
                    break;
                case 401: 
                        router.push("/login")
                    break;
                case 403: 
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

    if (status !== 200) {
        //EN CASO DE ERROR MOSTRAR MODAL DE ERROR
        return (
            <ModalError status={status} setStatus={setStatus} Text_modalbody={errorMsg}/>
        )
    }else if(loaded){

        return (
            <>
                <div className="container">
                    <div className = "row mt-5 justify-content-center">
                        <div className ="col-9">
                            <div className = "row">
                                <label className="form-label" >{t('AuthorizingUser')}</label>
                            </div>
                            <div className = "row">
                                <Select ArrOptions={users} 
                                        setValue={setIdUsuarioAutorizador} 
                                        KeySelected = {IdUsuarioAutorizador}
                                        mode={1} 
                                        isHeader={false} 
                                        isMachineCombo={false}
                                        PlaceHolder = {t('SelectAuthorizingUser')} 
                                />
                            </div>
                        </div>
                    </div>
                    <div className = "row mt-5 justify-content-center">
                        
                        <div className ="col-9">
                            <div className = "row">
                                <label className="form-label" >{t('Password')}</label>
                            </div>
                            <div className = "row">
                                <TextInput typeInput={'Password'} 
                                    inputValue={InputPass} 
                                    setInputValue={setInputPass} 
                                />

                                
                            </div>

                        </div>
                        
                        
                    </div>
                    <div className = "row mt-5 justify-content-center">
                        <div className ="col-9 text-end">
                            <button type="button" className="btn btn-lg global_bg_secondary" onClick = {()=>{solicitarAutorizacion()}}>{t('Authorized')}</button>
                        </div>
                    </div>
                </div>
                

                

            </>
            

        )
    }
                
            
          


}

