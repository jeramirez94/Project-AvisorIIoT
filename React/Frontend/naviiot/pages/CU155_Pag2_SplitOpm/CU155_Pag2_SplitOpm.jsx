import { useState, useEffect } from 'react'
import styles from './CU155_Pag2_SplitOpm.module.css'
import { useConfigContext } from "../../utils/config"
import { fetchData } from '@/utils/fetch'
import ModalError from '@/components/modal'
import { useTranslation } from 'react-i18next'
import { useHeaderContext } from '../../utils/headerCtx'
import { useRouter } from 'next/router'
import MachineCombo from './../../components/machinecombo'
import { getCookieValue } from '@/utils/tools'
import TextInput from '../../components/textinput'
import Autorizacion from '../../components/autorizacion'

export default function CU155_Pag2_SplitOpm() {

    //hook de nextjs para el manejo de enrutamiento, podemos acceder a las varialbes por route.query.[parametro]
    const router = useRouter()

    const [data, setData] = useState([])
    const [errorMsg, setErrorMsg] = useState(null)
    const [isLoaded, setIsLoaded] = useState(false)
    const [status, setStatus] = useState(200)
    const [config, setConfig] = useConfigContext()
    const { t } = useTranslation('cu155_sopm')

    const [IdWorkCenterSeleccionado, setIdWorkCenterSeleccionado] = useState('')
    const [ComboMaquinaCargado, setComboMaquinaCargado] = useState(false)
    const [modalDivOpm, setModalDivOpm] = useState(false)
    const [opmDiv, setOpmDiv] = useState({})
    const [IdWorkCenterSeleccionadoModal, setIdWorkCenterSeleccionadoModal] = useState('')
    const [ComboMaquinaCargadoModal, setComboMaquinaCargadoModal] = useState(false)
    const [quantityOpmDivide, setQuantityOpmDivide] = useState('')
    const [modalConfirmacion, setModalConfirmacion] = useState(false)

    const [esAutorizado,setEsAutorizado] = useState(false);

    const CUPag = {CU:155, Pag:2}

    const actualizaWorkCenter = (IdWorkCenter) => {
        if (IdWorkCenter) {
            setIdWorkCenterSeleccionado(IdWorkCenter)
        }
    }

    const actualizaWorkCenterModal = (IdWorkCenter) => {
        if (IdWorkCenter) {
            setIdWorkCenterSeleccionadoModal(IdWorkCenter)
        }
    }

    /**
     * Titulo de pagina
     */
    const { header, setHeader } = useHeaderContext();

    useEffect(() => {
        setHeader({ ...header, Titulo: t('pageTitle') })
        setIdWorkCenterSeleccionado(getCookieValue("IdWorkCenter"))
    }, []);

    useEffect(() => {
        if (IdWorkCenterSeleccionado != '' && esAutorizado) {
            buscar(false)
            const interval = setInterval(() => {
                buscar(true)
            }, 30000);
            return () => clearInterval(interval);
        }
    }, [IdWorkCenterSeleccionado,esAutorizado]);

    const buscar = async (hideSpinner) => {
        await fetchData(config.Api + "produccion/ordenes/ObtenerOrdenesIdWorkCenter", "?ClaUbicacion=" + config.ClaUbicacion + "&IncluirTodo=0&Idioma=" + config.Idioma + "&IdWorkCenter=" + IdWorkCenterSeleccionado, 'GET', null, hideSpinner,CUPag)
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
                        //router.push("/accessDenied");
                        setEsAutorizado(false);      
                        break
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

    const ModalDividirOpm = () => {
        if (opmDiv != {}) {
            return (
                <>
                    <div className="modal d-block bg-dark bg-opacity-75" id="modalDivOpm" tabIndex="-1" aria-labelledby="" aria-hidden="true">
                        <div className="modal-dialog  modal-lg">
                            <div className="modal-content">
                                <div className="modal-header">
                                    <h5 className="modal-title" id="">{t('modalDivOpmTitulo')}:</h5>
                                    <button type="button" className="btn-close" onClick={() => setModalDivOpm(false)} aria-label="Close"></button>
                                </div>
                                <div className="modal-body">
                                    <div className='row'>
                                        <div className='row'>
                                            <span>Origin:</span>
                                        </div>
                                        <div className='row ms-2 mt-2'>
                                            <div className='col'>
                                                <span>{t('Machine')}: </span>
                                                <b>{opmDiv.IdWorkCenter}</b>
                                            </div>
                                            <div className='col'>
                                                <span>{t('Order')}: </span>
                                                <b>{opmDiv.Nomopm}</b>
                                            </div>
                                        </div>
                                        <div className='row ms-2 mt-2'>
                                            <div className='col'>
                                                <span>{t('Product')}: </span>
                                                <b>{opmDiv.NomArticulo}</b>
                                            </div>
                                        </div>
                                        <div className='row ms-2 mt-2'>
                                            <div className='col'>
                                                <span>ROL: </span>
                                                <b>{opmDiv.CantidadProgramadaUds}</b>
                                            </div>
                                            <div className='col'>
                                                <span>{t('Done')}: </span>
                                                <b>{opmDiv.Done}</b>
                                            </div>
                                            <div className='col'>
                                                <span>{t('toDo')}: </span>
                                                <b>{opmDiv.ToDo}</b>
                                            </div>
                                        </div>
                                    </div>
                                    <div className='row mt-3 mb-3'>
                                        <div className='row'>
                                            <div className='col'>
                                                <span>{t('Destination')}:</span>
                                            </div>
                                        </div>
                                        <div className='row ms-2 mt-2'>
                                            <div className='col'>
                                                <span>{t('Machine')}:</span>
                                            </div>
                                            <div className='col'>
                                                <span>{t('Quantity')}:</span>
                                            </div>
                                        </div>
                                        <div className='row ms-2 mt-2'>
                                            <div className='col'>
                                                <div className='row'>
                                                    <MachineCombo actualizaWorkCenter={actualizaWorkCenterModal} setComboMaquinaCargado={setComboMaquinaCargadoModal} isHeader={false} />
                                                </div>
                                            </div>
                                            <div className='col'>
                                                <TextInput typeInput={'Number'} inputValue={quantityOpmDivide} setInputValue={setQuantityOpmDivide}></TextInput>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div className="modal-footer justify-content-center">
                                    <div className='row'>
                                        <div className='col'>
                                            <button type="button" className="btn btn-lg global_btn_secondary" onClick={() => setModalDivOpm(false)}>{t('Cancel')}</button>
                                        </div>
                                        <div className='col'>
                                            <button type="button" className="btn btn-lg global_btn_primary" onClick={() => { confirmarDivisionOpm(IdWorkCenterSeleccionadoModal) }}>{t('Save')}</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </>
            )
        }

    }

    const AbrirModalDividirOpm = (IdWorkCenter, Nomopm, NomArticulo, CantidadProgramadaUds, Done, ToDo, IdMicroProg) => {
        setModalDivOpm(true)
        setQuantityOpmDivide('')
        setOpmDiv({ IdWorkCenter: IdWorkCenter, Nomopm: Nomopm, NomArticulo: NomArticulo, CantidadProgramadaUds: CantidadProgramadaUds, Done: Done, ToDo: ToDo, IdMicroProg: IdMicroProg })
    }

    const divideOpm = async () => {
        await fetchData(config.Api + "produccion/ordenes/DividirOpm", "?ClaUbicacion=" + config.ClaUbicacion + "&Idioma=" + config.Idioma + "&IdMicroprog=" + opmDiv.IdMicroProg + "&IdWorkCenterDestino=" + opmDiv.IdWorkCenterDestino + "&CantidadAProducir=" + quantityOpmDivide, 'PUT', null, false,CUPag)
            .then(async (res) => {
                let codeStatus = res.status
                let data = await res.json()
                switch (codeStatus) {
                    case 200:
                        setModalConfirmacion(false)
                        buscar(false)
                        break;
                    case 500:
                        setModalConfirmacion(false)
                        setErrorMsg(data.msg + " \n " + JSON.stringify(data.error))
                        setStatus(codeStatus)
                        break;
                    case 401:
                        router.push("/login")
                        break;
                    case 400:
                    default:
                        setModalConfirmacion(false)
                        setErrorMsg(data.msg)
                        setStatus(codeStatus)
                        break;
                }

            }).catch((error) => {
                setErrorMsg("Report error to administrator." + "\n" + error.toString())
                setStatus(null)
            })

    }

    const ModalConfirmacion = () => {
        return (
            <>
                <div className="modal d-block bg-dark bg-opacity-75" id="modalConfirmacion" tabIndex="-1" aria-labelledby="" aria-hidden="true">
                    <div className="modal-dialog  modal-lg">
                        <div className="modal-content">
                            <div className="modal-header">
                                <h5 className="modal-title" id="">{t('Confirm')}:</h5>
                                <button type="button" className="btn-close" onClick={() => setModalConfirmacion(false)} aria-label="Close"></button>
                            </div>
                            <div className="modal-body">
                                <div className='row'>
                                    <p>{t('Send')} {quantityOpmDivide} {t('To')} {opmDiv.IdWorkCenterDestino}?</p>
                                </div>
                            </div>
                            <div className="modal-footer justify-content-center">
                                <div className='row'>
                                    <div className='col'>
                                        <button type="button" className="btn btn-lg global_btn_secondary" onClick={() => {
                                            setModalConfirmacion(false)
                                            setModalDivOpm(true)
                                        }}>{t('Cancel')}</button>
                                    </div>
                                    <div className='col'>
                                        <button type="button" className="btn btn-lg global_btn_primary" onClick={() => { divideOpm() }}>{t('Confirm')}</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </>
        )
    }

    const confirmarDivisionOpm = (IdWorkCenterDestino) => {
        setOpmDiv({ ...opmDiv, IdWorkCenterDestino: IdWorkCenterDestino})
        setModalDivOpm(false)
        setModalConfirmacion(true)
    }

    if(!esAutorizado){
        return (
            <Autorizacion CUPag = {CUPag} setEsAutorizado={setEsAutorizado} ></Autorizacion>
        )
    }
    if (status == 200 && isLoaded) {

        return (

            <>
                <div className='container-fluid'>
                    <div className='row mt-2'>
                        <div className='col-6'>
                            <div className='row'>
                                {ComboMaquinaCargado &&
                                    <span>{t('Origin')}:</span>
                                }
                                <MachineCombo actualizaWorkCenter={actualizaWorkCenter} setComboMaquinaCargado={setComboMaquinaCargado} isHeader={false}/>
                            </div>
                        </div>
                    </div>
                </div>
                {data.map((data, index) => (
                    <div key={index} className={`container-fluid ${styles.contenedoropm}`}>
                        <div className='row'>
                            <div className='col-10 col-sm-9'>
                                <div className={`row`}>
                                    <div className={`col`}>{t('Machine')}: {data.IdWorkCenter}</div>
                                    <div className={`col`}>{t('Order')}: {data.Nomopm}</div>
                                    <div className={`col ${data.ClaEstatus === 2 ? styles.status : ""}`}>{data.NomEstatus}</div>
                                </div>
                                <div className={`row`}>
                                    <div className={`col`}> {data.NomArticulo}</div>
                                </div>
                                <div className={`row`}>
                                    <div className={`col`}> {parseInt(data.CantidadProgramadaUds)} {data.NomUnidad} </div>
                                    <div className={`col`}> {parseInt(data.CantidadProducida) - (data.CantidadPNC)} {t('Done')}</div>
                                    <div className={`col`}> {parseInt(data.CantidadProgramadaUds) - (data.CantidadProducida) + (data.CantidadPNC)} {t('toDo')}</div>
                                </div>
                            </div>
                            <div className='col-2 col-sm-3 mt-2 mb-2'>
                                {data &&
                                    <button type="button" id='' onClick={() => (AbrirModalDividirOpm(data.IdWorkCenter, data.Nomopm, data.NomArticulo, parseInt(data.CantidadProgramadaUds), parseInt(data.CantidadProducida) - (data.CantidadPNC), parseInt(data.CantidadProgramadaUds) - (data.CantidadProducida) + (data.CantidadPNC), data.IdMicroProg))} className={`btn global_btn_secondary ${styles.botonSplit}`}>
                                        {t('Split')}
                                    </button>}
                            </div>

                        </div>
                    </div>
                ))}
                {modalDivOpm && ModalDividirOpm()}
                {modalConfirmacion && ModalConfirmacion()}
            </>)
    } else if (status != 200) {

            return (
                <>
    
                    <ModalError status={status} setStatus={setStatus} Text_modalbody={errorMsg} />
    
                </>
            )
        
    }
}