import { useEffect, useState } from "react"
import { fetchData } from '@/utils/fetch'
import { useConfigContext } from "../../utils/config"
import { useTranslation } from 'react-i18next'
import { useHeaderContext } from '../../utils/headerCtx'
import styles from './CU204_Pag5_BitacoraParos.module.css'
import ModalError from '@/components/modal'
import Select from '@/components/select'

export default function CU204_Pag5_BitacoraParos({ SelectedIdWorkCenter }) {

    const [status, setStatus] = useState(200)
    const [isLoaded, setIsLoaded] = useState(false)
    const [config, setConfig] = useConfigContext()
    const [bitacoraParos, setBitacoraParos] = useState([])
    const [errorMsg, setErrorMsg] = useState(null)
    const { header, setHeader } = useHeaderContext()
    const { t } = useTranslation('cu204_bp')
    const [parosSeleccionados, setParosSeleccionados] = useState([])
    const [botonJustificacion, setBotonJustificacion] = useState(false)
    const [showMicroParos, setShowMicroParos] = useState(0)
    const [showParosJustificados, setShowParosJustificados] = useState(0)
    const [showMicroParosAnt, setShowMicroParosAnt] = useState(0)
    const [showParosJustificadosAnt, setShowParosJustificadosAnt] = useState(0)
    const [ModalJustificacionParos, setModalJustificacionParos] = useState(false)
    const [tiposParo, setTiposParo] = useState({})
    const [tipoParoSel, setTipoParoSel] = useState('')
    const [tiposParoJustificaciones, setTiposParoJustificaciones] = useState({})
    const [tipoParoJustificacionSel, setTipoParoJustificacionSel] = useState('')
    const [claTurno, setClaTurno] = useState('')
    const [existeParoActual, setExisteParoActual] = useState(false)
    const [CarouselSeccion,setCarouselSeccion]=useState(false)
    const [dataCarousel, setDataCarousel] = useState({})

    

    useEffect(() => {
        setHeader({ ...header, Titulo: t('pageTitle') })
    }, []);

    useEffect(() => {
        if (SelectedIdWorkCenter) {
            buscarParos(false)
            buscarTiposParo(true)
            buscarJustificacionesFavoritas(true)
        }
    }, [SelectedIdWorkCenter])

    useEffect(() => {
        if (showMicroParos != showMicroParosAnt) {
            buscarParos(false)
        }
    }, [showMicroParos]);

    useEffect(() => {
        if (showParosJustificados != showParosJustificadosAnt) {
            buscarParos(false)
        }
    }, [showParosJustificados]);

    useEffect(() => {
        if (tipoParoSel != '') {
            const ArrayTipoParoSel = tipoParoSel.split(":")
            let claTipoParo = ArrayTipoParoSel[0]
            let claGpoParo = ArrayTipoParoSel[1]
            
            buscarTiposParoJustificaciones(claTipoParo, claGpoParo, false)
            
        } else {
            let data = []
            data.push({ value: '', text: 'Select downtime type' })
            setTiposParoJustificaciones(data)
        }
    }, [tipoParoSel])

    const buscarParos = async (hideSpinner) => {
        await fetchData(config.Api + "paros", "?ClaUbicacion=" + config.ClaUbicacion + "&ClaTurno=0&Idioma=" + config.Idioma + "&MostrarJustificados=" + showParosJustificados + "&MostrarMicroParos=" + showMicroParos + "&FechaAdmScada=" + new Date().getFullYear() + "-" + ("00" + (new Date().getMonth() + 1)).slice(-2) + "-" + ("00" + new Date().getDate()).slice(-2) + " 00:00:00", 'GET', null, hideSpinner)
            .then(async (res) => {
                let codeStatus = res.status
                let data = await res.json()
                if (codeStatus != 200) {
                    setErrorMsg(data.msg)
                    setStatus(codeStatus)
                } else {
                    setStatus(200)
                    setBitacoraParos(data.paros)
                    const hasEmptyFechaFinParo = data.paros.some(item => item.FechaFinParo === '' || !item.FechaFinParo)
                    setExisteParoActual(hasEmptyFechaFinParo)
                    if (data.paros.length > 0) {
                        setClaTurno(data.paros[0].ClaTurno)
                    }
                    setIsLoaded(true)
                }
            }).catch((error) => {
                setErrorMsg(error)
                setStatus(null)
            })
    }

    const buscarTiposParo = async (hideSpinner) => {
        await fetchData(config.Api + "paros/TiposParo", "?ClaUbicacion=" + config.ClaUbicacion + "&Idioma=" + config.Idioma, "GET", null, hideSpinner)
            .then(async (res) => {
                let codeStatus = res.status
                let response = await res.json()
                let data = []
                if (codeStatus != 200) {
                    setErrorMsg(response.msg)
                    setStatus(codeStatus)
                } else {
                    setStatus(200)
                    response.tiposParo.map((tipoParo, index) => (

                        data.push({ value: tipoParo.ClaTipoParo + ":" + tipoParo.ClaGpoParo, text: tipoParo.NomTipoParo })

                    ))
                    setTiposParo(data)
                    //setTipoParoSel(data[0].value)
                }
            }).catch((error) => {
                setErrorMsg(error)
                setStatus(null)
            })
    }

    const buscarTiposParoJustificaciones = async (ClaTipoParo, ClaGpoParo, hideSpinner) => {
        await fetchData(config.Api + "paros/TiposParoJustificaciones", "?ClaTipoParo=" + ClaTipoParo + "&ClaGpoParo=" + ClaGpoParo + "&Idioma=" + config.Idioma, "GET", null, hideSpinner)
            .then(async (res) => {
                let codeStatus = res.status
                let response = await res.json()
                let data = []
                if (codeStatus != 200) {
                    setErrorMsg(response.msg)
                    setStatus(codeStatus)
                } else {
                    setStatus(200)
                    response.tiposParoJustificaciones.map((justificacion,index) => (

                        data.push({ value: justificacion.ClaSeccionParo, text: justificacion.NomSeccionParo })

                    ))
                    
                    setTiposParoJustificaciones(data);
                    //setTipoParoJustificacionSel(data[0].value);
                    
                }
            }).catch((error) => {
                setErrorMsg(error)
                setStatus(null)
            })
    }

    const justificarParos = async (claTipoParo, tipoParoJustificacion) => {
        let ClaSeccionParo = ''
        let ClaTipoParo = ''
        if (!claTipoParo && !tipoParoJustificacion) {
            const ArrayTipoParoSel = tipoParoSel.split(":")
            ClaTipoParo = ArrayTipoParoSel[0]
            let claGpoParo = ArrayTipoParoSel[1]
            ClaSeccionParo = tipoParoJustificacionSel
        } else {
            ClaTipoParo = claTipoParo
            ClaSeccionParo = tipoParoJustificacion
        }

        await fetchData(config.Api + "paros/JustificarParos", "?ClaUbicacion=" + config.ClaUbicacion + "&Idioma=" + config.Idioma + "&IdList=" + parosSeleccionados + "&ClaTurno=" + claTurno + "&FechaAdmScada=" + new Date() + "&ClaTipoParo=" + ClaTipoParo + "&ClaSeccionParo=" + ClaSeccionParo, 'PUT', null, false)
            .then(async (res) => {
                let codeStatus = res.status
                let data = await res.json()
                switch (codeStatus) {
                    case 200:
                        setModalJustificacionParos(false)
                        uncheckBoxes()
                        buscarParos(false)
                        break;
                    case 500:
                        //setModalConfirmacion(false)
                        setErrorMsg(data.msg + " \n " + JSON.stringify(data.error))
                        setStatus(codeStatus)
                        break;
                    case 401:
                        router.push("/login")
                        break;
                    case 400:
                    default:
                        //setModalConfirmacion(false)
                        setErrorMsg(data.msg)
                        setStatus(codeStatus)
                        break;
                }

            }).catch((error) => {
                setErrorMsg("Report error to administrator." + "\n" + error.toString())
                setStatus(null)
            })

    }

    const handleCheckboxChange = (idCheckBox, Paro) => {

        if (idCheckBox === 'All') {
            let parosCheckBoxes = document.getElementsByClassName('input-paros')
            if (!botonJustificacion) {
                bitacoraParos.forEach(rowData => parosSeleccionados.push(rowData.IdRegistroParo));
                setBotonJustificacion(true)
                setCarouselSeccion(true)
                for (let x = 0; x < parosCheckBoxes.length; x++) {
                    parosCheckBoxes[x].checked = true
                }
            } else {
                setParosSeleccionados([])
                setBotonJustificacion(false)
                setCarouselSeccion(false)
                for (let x = 0; x < parosCheckBoxes.length; x++) {
                    parosCheckBoxes[x].checked = false
                }

            }

        } else if (idCheckBox === 'showMicroParos') {
            if (showMicroParos === 0) {
                setShowMicroParos(1)
                setShowMicroParosAnt(0)
            } else {
                setShowMicroParos(0)
                setShowMicroParosAnt(1)
            }
        } else if (idCheckBox === 'showParosJustificados') {
            if (showParosJustificados === 0) {
                setShowParosJustificados(1)
                setShowParosJustificadosAnt(0)
            } else {
                setShowParosJustificados(0)
                setShowParosJustificadosAnt(1)
            }
        } else {
            if (getElementChecked(Paro.IdRegistroParo)) {
                parosSeleccionados.push(Paro.IdRegistroParo);
            } else {
                let indexToRemove = parosSeleccionados.findIndex((row) => row === Paro.IdRegistroParo);
                parosSeleccionados.splice(indexToRemove, 1);
            }

            if (parosSeleccionados.length === 0) {
                setBotonJustificacion(false);
                setCarouselSeccion(false)
            } else {
                setBotonJustificacion(true);
                setCarouselSeccion(true)
            }

            setCheckElement('All', parosSeleccionados.length === 0 ? false : true);
        }
    }

    const getElementChecked = (id) => {
        let elementObj = document.getElementById(id)
        return elementObj.checked
    }

    const setCheckElement = (id, value) => {
        let elementObj = document.getElementById(id)
        return elementObj.checked = value
    }

    const ModalJustificacionParo = () => {
        if (parosSeleccionados.length !== 0) {
            return (
                <>
                    <div className="modal d-block bg-dark bg-opacity-80" id="ModalJustificacionParos" tabIndex="-1" aria-labelledby="" aria-hidden="true">
                        <div className="modal-dialog">
                            <div className="modal-content">
                                <div className="modal-header">
                                    <h5 className="modal-title" id="">{t('modalJustificacionParosTitulo')}:</h5>
                                    <button type="button" className="btn-close" onClick={() => setModalJustificacionParos(false)} aria-label="Close"></button>
                                </div>
                                <div className="modal-body">
                                    <div className="container-fluid">
                                        <div className="row">
                                            <span>{t('Type')}:</span>
                                        </div>
                                        <div className="row">
                                            <Select ArrOptions={tiposParo} KeySelected={tipoParoSel} setValue={setTipoParoSel} mode={1} isHeader={false} isMachineCombo={false} />
                                        </div>

                                        <div className="row text-left">
                                            <span>{t('Justification')}:</span>
                                        </div>
                                        <div className="row">
                                            {tiposParo &&
                                                <Select ArrOptions={tiposParoJustificaciones} KeySelected={tipoParoJustificacionSel} setValue={setTipoParoJustificacionSel} mode={1} isHeader={false} isMachineCombo={false} />
                                            }
                                        </div>
                                    </div>
                                </div>
                                <div className="modal-footer">
                                    <button type="button" className="btn btn-lg global_btn_secondary" onClick={() => setModalJustificacionParos(false)}>{t('Cancel')}</button>
                                    <button type="button" id="segundamodal" className="btn btn-lg global_btn_primary" onClick={() => { justificarParos() }}>{t('Confirm')}</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </>
            )
        }

    }


    const openModalJustificacionParos = () => {
        if (parosSeleccionados.length !== 0) {
            setModalJustificacionParos(true)
            setTipoParoSel("")
            setTipoParoJustificacionSel(0)
        } else {
            setModalJustificacionParos(false)
        }
    }

    const uncheckBoxes = () => {
        let parosCheckBoxes = document.getElementsByClassName('input-paros')
        setParosSeleccionados([])
        setBotonJustificacion(false)
        setCarouselSeccion(false)
        for (let x = 0; x < parosCheckBoxes.length; x++) {
            parosCheckBoxes[x].checked = false
        }
    }

    const justificarParosFavoritos = (value) => {
        if (parosSeleccionados.length !== 0) {
            justificarParos(0, value)
        }
    }

    const buscarJustificacionesFavoritas = async (hideSpinner) => {
        await fetchData(config.Api + "paros/JustificacionesFavoritas", "?ClaUbicacion=" + config.ClaUbicacion + "&Idioma=" + config.Idioma, "GET", null, hideSpinner)
            .then(async (res) => {
                let codeStatus = res.status
                let response = await res.json()
                if (codeStatus != 200) {
                    setErrorMsg(response.msg)
                    setStatus(codeStatus)
                } else {
                    setStatus(200)
                    setDataCarousel(response.secciones)
                }
            }).catch((error) => {
                setErrorMsg(error)
                setStatus(null)
            })
    }

    if (status == 200 && isLoaded) {

        return (
            <>
                <div className={`container-fluid ${styles.contenedorPagina}`}>
                    <div className={`container-fluid`}>
                        <div className={`row mt-2 mb-2`}>
                            <div className="col-9 d-flex justify-content-center align-items-center">
                                {
                                    CarouselSeccion &&
                                    <div id="corouselJustificacionesParo" className="carousel slide w-100 h-100">
                                        <div className="carousel-inner h-100">
                                            {dataCarousel.map((seccion, index) => (
                                                <div className={`carousel-item h-100 ${index === 0 ? 'active' : ''}`} key={seccion.ClaSeccionParo}>
                                                    <div className="row h-100">
                                                        <button className="btn btn-lg global_btn_primary" onClick={()=>{justificarParosFavoritos(seccion.ClaSeccionParo)}}>{seccion.NomSeccionParo}</button>
                                                    </div>
                                                </div>
                                            ))}
                                        </div>
                                        <button className="carousel-control-prev" type="button" data-bs-target="#corouselJustificacionesParo" data-bs-slide="prev">
                                            <span className="carousel-control-prev-icon" aria-hidden="true"></span>
                                            <span className="visually-hidden">Previous</span>
                                        </button>
                                        <button className="carousel-control-next" type="button" data-bs-target="#corouselJustificacionesParo" data-bs-slide="next">
                                            <span className="carousel-control-next-icon" aria-hidden="true"></span>
                                            <span className="visually-hidden">Next</span>
                                        </button>
                                    </div>
                                   
                                }

                            </div>
                            <div className="col-3">
                                <div className="row">
                                    {botonJustificacion &&
                                        <button type="button" className="btn btn-lg global_btn_primary d-flex flex-column justify-content-center align-items-center px-2" onClick={() => { openModalJustificacionParos() }}>
                                            <i className="bi bi-plus-circle"></i>
                                            <span>{t('Justify')}</span>
                                        </button>
                                    }

                                </div>
                            </div>
                        </div>
                        <div className="row">
                            <div className="col">
                                <div className="row text-center">
                                    <span>{t('showJustificados')}: </span>
                                </div>
                                <div className="row d-flex-column justify-content-center align-items-center">
                                    <input id='showParosJustificados' type="checkbox" value="" className={`form-check-input ${styles.checkHeader}`} onChange={() => { handleCheckboxChange('showParosJustificados', null) }}></input>
                                </div>
                            </div>
                            <div className="col">
                                <div className="row text-center">
                                    <span>{t('showMicroParos')}: </span>
                                </div>
                                <div className="row d-flex-column justify-content-center align-items-center">
                                    <input id='showMicroParos' type="checkbox" value="" className={`form-check-input ${styles.checkHeader}`} onChange={() => { handleCheckboxChange('showMicroParos', null) }}></input>
                                </div>
                            </div>
                            <div className="col">
                                <div className="row text-center">
                                    <span>{t('selectAll')}: </span>
                                </div>
                                <div className="row d-flex-column justify-content-center align-items-center">
                                    <input id='All' type="checkbox" value="" className={`form-check-input input-paros  ${styles.checkHeader}`} onChange={() => { handleCheckboxChange('All', bitacoraParos) }}></input>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div className={`container-fluid`}>
                        {bitacoraParos.map((paro, index) => (
                            <div key={index} className={`row ${styles.contenedorParo}`}>
                                <div className='col-10 col-sm-9'>
                                    <div className={`row`}>
                                        <div className={`col`}>
                                            {t('Machine')}: <b>{paro.IdWorkCenterParo}</b>
                                        </div>
                                    </div>
                                    <div className={`row`}>

                                        {
                                            !paro.FechaFinParo && paro.Justificacion === '' &&
                                            <b><span>{t('actualDowntime')}</span></b>
                                        }
                                        {
                                            paro.FechaFinParo && paro.Justificacion === '' &&
                                            <b><span>{t('pendingJustification')}</span></b>
                                        }
                                        {
                                            paro.Justificacion !== '' &&
                                            <span>{t('Justification')}: <b>{paro.Justificacion}</b></span>
                                        }

                                    </div>
                                    <div className={`row`}>
                                        <div className="col-3">
                                            <span>{t('Start')}: </span>
                                            <b>{paro.FechaInicioParo}</b>
                                        </div>
                                        <div className="col-3">
                                            <span>{t('End')}: </span>
                                            <b>{paro.FechaFinParo}</b>
                                        </div>
                                        <div className="col-6">
                                            <span>{t('Duration')}: </span>
                                            <b>{paro.DuracionParo}</b>
                                        </div>
                                    </div>
                                </div>
                                <div className='col-2 col-sm-3 d-flex justify-content-center align-items-center '>
                                    {paro &&
                                        <input id={paro.IdRegistroParo} onChange={() => { handleCheckboxChange(paro.IdRegistroParo, paro, bitacoraParos) }} type="checkbox" className={`form-check-input input-paros ${styles.inputParos}`}></input>
                                    }

                                </div>
                            </div>
                        ))}
                    </div>
                    {ModalJustificacionParos && ModalJustificacionParo()}
                </div>
            </>

        )
    } else if (status != 200) {
        return (
            <>

                <ModalError status={status} setStatus={setStatus} Text_modalbody={errorMsg} />

            </>
        )
    }
}