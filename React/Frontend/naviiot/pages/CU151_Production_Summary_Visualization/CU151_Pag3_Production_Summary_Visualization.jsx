import { useEffect, useState } from 'react'
import ShiftGrid from '@/components/shiftgrid'
import { useConfigContext } from '/utils/config'
import { fetchData } from '@/utils/fetch'
import { useRouter } from "next/router"
import Image from 'next/image'
import search from '@/assets/img/search.png'
import previous from '@/assets/img/previous.png'
import next from '@/assets/img/next.png'
import ModalError from '@/components/modal'
import Link from 'next/link';
import { useTranslation } from 'react-i18next'
import { useHeaderContext } from '../../utils/headerCtx'
import InputFecha from '@/components/InputFecha'


export default function CU151_Pag3_Production_Summary_Visualization({ SelectedIdWorkCenter }) {

    //hook de nextjs para el manejo de enrutamiento, podemos acceder a las varialbes por route.query.[parametro]
    const router = useRouter();

    const [date, setDate] = useState(router.query.Fecha || new Date());
    const [turno, setTurno] = useState(router.query.ClaTurno || 0);
    const [errorMsg, setErrorMsg] = useState(null);
    const [isOpen, setIsOpen] = useState(true);
    const [isLoaded, setIsLoaded] = useState(false);
    const [status, setStatus] = useState(200);
    const [production, setProduction] = useState([]);
    const [turnos, setTurnos] = useState([]);
    const [active, setActive] = useState(0);
    const { t } = useTranslation('cu151_psv');

    const CUPag = {CU:151,Pag:3}

    /**
     * Titulo de pagina
     */
    const { header, setHeader } = useHeaderContext();

    const ParametrosConsutla = `?ClaTurno=${turno}&Fecha=${date}&EsRedireccion=1`;

    //variables de configuraciones
    const [config, setConfig] = useConfigContext();
    var dateFormatted = new Date(date)
    //constante para almacenar el estado actual
    //de la navegación del turno en el cliente.
    const activeOperations = {
        "previous": active <= 0 && turnos != null ? turnos.length - 1 : parseInt(active) - 1,
        "next": active >= turnos.length - 1 && turnos != null ? 0 : parseInt(active) + 1
    }
    //constante para navegar entre fechas a la par de los turnos transcurridos.
    const dateOperations = {
        "previous": active == 0 ? new Date(dateFormatted.setDate(dateFormatted.getDate() - 1)) : new Date(date),
        "next": active == turnos.length - 1 ? new Date(dateFormatted.setDate(dateFormatted.getDate() + 1)) : new Date(date)
    }

    //manejador de click
    const searchClick = async (hideSpinner) => {
        fetchData(config.Api + "produccion", "?ClaUbicacion=" + config.ClaUbicacion + "&Idioma=" + config.Idioma + "&ClaTurno=" + turno + "&FechaAdmScada=" + date, 'GET', null, hideSpinner,CUPag)
            .then(async (res) => {
                let codeStatus = res.status
                let data = await res.json()
                switch (codeStatus) {
                    case 200:
                        setProduction(data.production);
                        setIsLoaded(true)
                        break;
                    case 500:
                        setProduction([]);
                        setErrorMsg(data.msg + " \n " + JSON.stringify(data.error))
                        setStatus(codeStatus)
                        break;
                    case 403:
                        router.push("/accessDenied");
                        break;
                    case 401: 
                        router.push("/login")
                        break;
                    case 400:
                    default:
                        setProduction([]);
                        setErrorMsg(data.msg)
                        setStatus(codeStatus)
                        break;
                }
            }).catch((error) => {
                setErrorMsg("Report error to administrator." + "\n" + error.toString())
                setStatus(null)
            })

    }
    //Manejador de click para los iconos de navegación.
    const handleClickShifts = async (operation) => {
        //almacenar turno seleccionado
        setDate(dateOperations[operation]);
        fetchData(config.Api + "produccion", "?ClaUbicacion=" + config.ClaUbicacion + "&Idioma=" + config.Idioma + "&ClaTurno=" + turnos[activeOperations[operation]].ClaTurno + "&FechaAdmScada=" + (dateOperations[operation]), 'GET',null,null,CUPag)
            .then(async (res) => {
                let codeStatus = res.status
                let data = await res.json()
                switch (codeStatus) {
                    case 200:
                        setProduction(data.production);
                        setIsLoaded(true)
                        break;
                    case 500:
                        setProduction([]);
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
                        setProduction([]);
                        setErrorMsg(data.msg)
                        setStatus(codeStatus)
                        break;
                }
            }).catch((error) => {
                setErrorMsg("Report error to administrator." + "\n" + error.toString())
                setStatus(null)
            })
        setActive(activeOperations[operation]);
        setTurno(turnos[activeOperations[operation]].ClaTurno);
    }

    //Hook de estado para obtener el turno actual y el resto de turnos activos.data-date-format="MM DD YYYY" 
    useEffect(() => {
        setHeader({...header,Titulo:t('pageTitle')})
        buscar(false);
        cargarTurnos(false);
        const interval = setInterval(() => {
            buscar(true);
            cargarTurnos(true);
        }, 30000);
        return () => clearInterval(interval);
        //todo: interval no funciona porque no toma las variables del useState y siempre trae la fecha actual
        // const interval = setInterval(() => {
        //     searchClick(true);
        // }, 3000);
        // return () => clearInterval(interval);
    }, [SelectedIdWorkCenter,turno,date]);

    const buscar = (hideSpinner) => {
        fetchData(config.Api + "produccion", "?ClaUbicacion=" + config.ClaUbicacion + "&Idioma=" + config.Idioma + "&ClaTurno=" + turno + "&FechaAdmScada=" +date, 'GET', null, hideSpinner,CUPag)
                .then(async (res) => {
                    let codeStatus = res.status
                    let data = await res.json()
                    switch (codeStatus) {
                        case 200:
                            setProduction(data.production);    
                            break;
                        case 500:
                            setProduction([]);
                            setErrorMsg(data.msg+ " \n " +JSON.stringify(data.error))
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
                            setProduction([]);
                            setErrorMsg(data.msg)
                            setStatus(codeStatus)
                            break;
                    }
                }).catch((error) => {
                    setErrorMsg("Report error to administrator."+"\n" + error.toString())
                    setStatus(null)
                })
    }

    const cargarTurnos = (hideSpinner) => {
        fetchData(config.Api + "turnos", "?ClaUbicacion=" + config.ClaUbicacion + "&Idioma=" + config.Idioma + "&FechaAdmScada=" + new Date().getFullYear() + "-" + ("00" + (new Date().getMonth() + 1)).slice(-2) + "-" + ("00" + new Date().getDate()).slice(-2), 'GET', null, hideSpinner ? hideSpinner : isLoaded)
            .then(async (res) => {
                let codeStatus = res.status
                let data = await res.json()
                switch (codeStatus) {
                    case 200:
                        setTurnos(data.turnos)
                        var indiceTurnoActual = turno == 0 ? data.turnos.findIndex((item) => item.EsActual == 1) : data.turnos.findIndex((item) => item.ClaTurno == turno)
                        setActive(indiceTurnoActual)

                            setIsLoaded(true)       
                            break;
                        case 500:
                            setErrorMsg(data.msg+ " \n " +JSON.stringify(data.error))
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
                }).catch((error) => {
                    setErrorMsg("Report error to administrator."+"\n" + error.toString())
                    setStatus(null)
                })
    }

    //Control para renderizar hasta obtener la respuesta de la API.
    if (status == 200 && isLoaded) {
        return (
            <>
                <div className={`row`}>

                    <div className='col-4 d-flex justify-content-center align-items-center'>
                        <label className='date mt-auto mb-auto p-2'>{t('Date')}: </label>
                        <InputFecha className='date' setDate={setDate} date={new Date(date)}/>
                    </div>
                    <div className='col-4 d-flex'>
                        <label className='shift mt-auto mb-auto p-2'>{t('Shift')}: </label>
                        <ShiftGrid turno={turno} setTurno={setTurno} active={active === undefined ? 0 : active} setActive={setActive} turnos={turnos} setTurnos={setTurnos} date={date} setDate={setDate} />
                    </div>
                    <div className='col-4 d-flex'>
                        <Image className='previousShift mt-auto mb-auto p-2' alt="previousImage" src={previous} width={50} height={50} onClick={async (e) => { await handleClickShifts("previous") }} />
                        <Image className='nextShift mt-auto mb-auto p-2' alt="nextImage" src={next} width={50} height={50} onClick={async (e) => { await handleClickShifts("next") }} />
                        <Image className='searchItem mt-auto mb-auto p-2' alt="searchImage" src={search} width={50} height={50} onClick={(e) => searchClick(false)} />
                    </div>
                </div>
                <div className={`row`}>
                    <table className="table">
                        <thead>
                            <tr>
                                <th className="col">{t('PO')}</th>
                                <th className="col d-none d-lg-table-cell d-xl-none-table-cell">
                                    {t('Product')}</th>
                                <th className="col">{t('Balance')}</th>
                                <th className="col">{t('totalScrap')}</th>
                                <th className="col">{t('productionShift')}</th>
                                <th className="col">{t('scrapShift')}</th>
                                <th className="col">{t('Details')}</th>
                            </tr>
                        </thead>
                        <tbody>
                            {Object.keys(production).map((i) => (

                                <tr key={i}>
                                    <td>{production[i]["PO"]}</td>
                                    <td className='d-none d-lg-table-cell d-xl-none-table-cell'>
                                        {production[i]["Product"]}</td>
                                    <td>{production[i]["Balance"]}</td>
                                    <td>{production[i]["Total Scrap"]}</td>
                                    <td>{production[i]["Production Shift"]}</td>
                                    <td>{production[i]["Scrap Shift"]}</td>
                                    <td>
                                        <Link className="a_primary" href={`/CU171_Pag1_Bitacora_Produccion/CU171_Pag1_Production_Detail${ParametrosConsutla}`}>
                                            <button className={`btn btn-lg global_btn_primary`} type='button'>
                                                <span>{t('View')}</span>
                                            </button>
                                        </Link>
                                    </td>
                                </tr>

                            ))}
                        </tbody>

                    </table>
                </div>
                <div className={`row`}>

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