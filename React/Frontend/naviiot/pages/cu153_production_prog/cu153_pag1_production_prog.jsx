import { useState, useEffect } from 'react';
import styles from './cu153_pag1_production_prog.module.css';
import { useConfigContext } from "../../utils/config"
import { fetchData } from '@/utils/fetch'
import ModalError from '@/components/modal'
import { useTranslation } from 'react-i18next'
import { useHeaderContext } from '../../utils/headerCtx';
import { useRouter } from 'next/router';

export default function CU153_pag1_opm({ SelectedIdWorkCenter }) {

    //hook de nextjs para el manejo de enrutamiento, podemos acceder a las varialbes por route.query.[parametro]
    const router = useRouter();

    const [data, setData] = useState([]);
    const [opmSelec, setOpmSelec] = useState({});
    const [errorMsg, setErrorMsg] = useState(null);
    const [isOpen, setIsOpen] = useState(true);
    const [inicioModal, setInicioModal] = useState(false);
    const [exitoModal, setExitoModal] = useState(false);
    const [respuestaOpm, setRespuestaOpm] = useState({});
    const [isLoaded, setIsLoaded] = useState(false);
    const [status, setStatus] = useState(200);
    const [config, setConfig] = useConfigContext();
    const { t } = useTranslation('cu153_pp');

    const CUPag = {CU:153,Pag:1}

    /**
     * Titulo de pagina
     */
    const { header, setHeader } = useHeaderContext();

    
    useEffect(() =>{
        setHeader({...header,Titulo:t('pageTitle')}) 
        buscar(false);
        const interval = setInterval(() => {
            buscar(true);
        }, 30000);
        return () => clearInterval(interval);


    }, [SelectedIdWorkCenter]);

    const buscar = (hideSpinner) => {
        fetchData(config.Api + "produccion/ordenes", "?ClaUbicacion=" + config.ClaUbicacion + "&IncluirTodo=0&Idioma=" + config.Idioma, 'GET', null, hideSpinner,CUPag)
            .then(async (res) => {
                let codeStatus = res.status
                let data = await res.json()
                switch (codeStatus) {
                    case 200:
                        setData(data.orders);
                        break;
                    case 500:
                        setErrorMsg(data.msg + " \n " + JSON.stringify(data.error))
                        setStatus(codeStatus)
                        break;
                    case 401: 
                        router.push("/login")
                        break;
                    case 403:
                        router.push("/accessDenied");
                        break;
                    case 400:
                    default:
                        setErrorMsg(data.msg)
                        setStatus(codeStatus)
                        break;
                }

                setIsLoaded(true)
            }).catch((error) => {
                setErrorMsg("Report error to administrator." + "\n" + error.toString())
                setStatus(null)
            })
    }

    //ClaUbicacion, NombrePcMod, Idioma//
    async function handleClick(NombreOpm, IdMicroProg) {
        
        await fetchData(config.Api + "produccion/ordenes/iniciar/", IdMicroProg + "?ClaUbicacion=" + config.ClaUbicacion + "&Idioma=" + config.Idioma, 'PUT',null,null,CUPag)
            .then(async (res) => {
                let codeStatus = res.status
                let data = await res.json()
                switch (codeStatus) {
                    case 200:
                        setInicioModal(false)
                        setRespuestaOpm({ opmNombre: NombreOpm })
                        setExitoModal(true)
                        break;
                    case 500:
                        setExitoModal(false)
                        setInicioModal(false)
                        setErrorMsg(data.msg + " \n " + JSON.stringify(data.error))
                        setStatus(codeStatus)
                        break;
                    case 401: 
                        router.push("/login")
                        break;
                    case 400:
                    default:
                        setExitoModal(false)
                        setInicioModal(false)
                        setErrorMsg(data.msg)
                        setStatus(codeStatus)
                        break;
                }

            }).catch((error) => {
                setErrorMsg("Report error to administrator." + "\n" + error.toString())
                setStatus(null)
            })

        await fetchData(config.Api + "produccion/ordenes", "?ClaUbicacion=" + config.ClaUbicacion + "&IncluirTodo=0&Idioma=" + config.Idioma, 'GET',null,null,CUPag)
            .then(async (res) => {
                let codeStatus = res.status
                let data = await res.json()
                switch (codeStatus) {
                    case 200:
                        setData(data.orders);
                        setIsLoaded(true)
                        break;
                    case 500:
                        setErrorMsg(data.msg + " \n " + JSON.stringify(data.error))
                        setStatus(codeStatus)
                        break;
                    case 401: 
                        router.push("/login")
                        break;
                    case 403:
                        router.push("/accessDenied");
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
    const AbrirModalIniciarOrden = (Nomopm, IdWorkCenter, IdMicroProg, NomArticulo) => {
        setExitoModal(false)
        setInicioModal(true)
        setOpmSelec({ NombreOpm: Nomopm, IdWorkCenter: IdWorkCenter, IdMicroProg: IdMicroProg, NomArticulo: NomArticulo })
    }

    const MdlIniciarOpm = () => {
        if (opmSelec != {}) {
            return (
                <>
                    <div className="modal d-block bg-dark bg-opacity-80" id="inicioModal" tabIndex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div className="modal-dialog">
                            <div className="modal-content text-center">
                                <div className="modal-header">
                                    <h5 className="modal-title" id="exampleModalLabel">{t('modalInicioTitulo')}:</h5>
                                    <button type="button" className="btn-close" onClick={() => setInicioModal(false)} aria-label="Close"></button>
                                </div>
                                <div className="modal-body">
                                    <p>       {opmSelec.IdWorkCenter} {t('ttOPM')}: {opmSelec.NombreOpm}  {t('with')}  {opmSelec.NomArticulo}   </p>
                                </div>
                                <div className="modal-footer">
                                    <button type="button" className="btn btn-secondary global_btn_secondary" onClick={() => setInicioModal(false)}>{t('modalInicioCancelar')}</button>
                                    <button type="button" id="segundamodal" className="btn btn-primary global_btn_primary" onClick={() => { handleClick(opmSelec.NombreOpm, opmSelec.IdMicroProg) }}>{t('modalInicioIniciar')}</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </>
            )
        }

    }

    const MdlExitoOpm = () => {

        return (
            <>
                <div className="modal d-block bg-dark bg-opacity-80" id="exitoModal" tabIndex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div className="modal-dialog">
                        <div className="modal-content text-center">
                            <div className="modal-header">
                                <h5 className="modal-title" id="exampleModalLabel">{t('modalExitoTitulo')}</h5>
                                <button type="button" className="btn-close" onClick={() => { setExitoModal(false) }} aria-label="Close"></button>
                            </div>
                            <div className="modal-body">
                                <p>{t('modalExitoMensaje')}</p>
                            </div>
                            <div className="modal-footer">
                                <button type="button" className="btn btn-primary global_btn_primary" onClick={() => { setExitoModal(false) }}>{t('modalExitoAceptar')}</button>
                            </div>
                        </div>
                    </div>
                </div>
            </>
        )
    }

    if (status == 200 && isLoaded) {
        return (
            <>
                {data.map((data, index) => (
                    <div key={index} className={`container-fluid ${styles.contenedoropm}`}>
                        <div className='row'>
                            <div className='col-10 col-sm-9'>
                                <div className={`row`}>
                                    <div className={`col`}>{t('Order')}: {data.Nomopm}</div>
                                    <div className={`col ${data.ClaEstatus === 2 ? styles.status : ""}`}>{data.NomEstatus}</div>
                                </div>
                                <div className={`row`}>
                                    <div className={`col`}> {data.NomArticulo}</div>
                                </div>
                            </div>
                            <div className='col-2 col-sm-3 mt-1'>
                                {data && (data.ClaEstatus === 1 || data.ClaEstatus === 5) && 
                                <button type="button" id='primeramodal' onClick={() => (AbrirModalIniciarOrden(data.Nomopm, data.IdWorkCenter, data.IdMicroProg, data.NomArticulo))} className={`btn global_btn_primary ${styles.botonStart}`}> 
                                    {t('Start')}
                                </button>}
                            </div>
                        </div>

                        <div className={`row`}>
                            <div className={`col`}> {parseInt(data.CantidadProgramadaUds)} {data.NomUnidad} </div>
                            <div className={`col`}> {parseInt(data.CantidadProducida) - (data.CantidadPNC)} {t('Done')}</div>
                            <div className={`col`}> {parseInt(data.CantidadProgramadaUds) - (data.CantidadProducida) + (data.CantidadPNC)} {t('toDo')}</div>
                            <div className={`col ${styles.barraProgreso}`}><progress id="file" max="100" value={(data.CantidadProducida) * 100 / (data.CantidadProgramadaUds)}> 70% </progress></div>
                        </div>
                    </div>
                ))}
                {inicioModal && MdlIniciarOpm()}
                {exitoModal && MdlExitoOpm()}
            </>)
    } else if (status != 200) {
        return (
            <>

                <ModalError status={status} setStatus={setStatus} Text_modalbody={errorMsg} />

            </>
        )
    }


}