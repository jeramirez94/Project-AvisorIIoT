
import styles from './header.module.css'
import MachineCombo from './machinecombo'
import { useHeaderContext } from "../utils/headerCtx"
import { useEffect, useState } from "react";
import { useConfigContext } from '@/utils/config'
import { fetchData } from '@/utils/fetch'
import { useTranslation } from 'react-i18next';
import BotonMenu from './BotonMenu'
import Image from 'next/image';
import { StringifyOptions } from 'querystring';
/**
 * El header tendra 4 columnas por fila
 * pueden agregarse filas 
 */
export default function Header({ setSelectedWorkCenter, setComboMaquinaCargado }) {
    const { header, setHeader } = useHeaderContext();
    const [config, setConfig] = useConfigContext();
    const [headerInterval, setHeaderInterval] = useState<NodeJS.Timeout | null>(null);
    const [ready, setReady] = useState(false);
    const intervalTime = 30000;
    const Logo = `/assets/img/${config.Ubicacion}_logo.png`

    /**
     * Constante para el uso de multi-lenguaje
     */
    const { t } = useTranslation('header');
    useEffect(() => {

        if (!ready) {
            return
        }
        //ejecutar primera vez  y luego se pone el interval para repertir x veces 
        FetchData(config, header)
            .then((res) => {
                setHeader(res)
            }).catch((err) => {
                console.log("Header:Carga Inicial, no se pudieron obtener los datos del header")
            })

        if (headerInterval) {
            clearInterval(headerInterval)
        }

        const newInterval = setInterval(() => {
            FetchData(config, header)
                .then((res) => {
                    setHeader(res)
                })
                .catch((err) => {
                    console.log("Header:Interval, no se pudieron obtener los datos del header")
                })
        }, intervalTime)

        setHeaderInterval(newInterval)

        return (() => {
            if (headerInterval) {
                clearInterval(headerInterval)
            }
        })

    }, [header])

    const actualizaWorkCenter = (IdWorkCenter) => {
        if (IdWorkCenter) {
            setReady(true);
            setHeader({ ...header, IdWorkCenter: IdWorkCenter })
            setSelectedWorkCenter(IdWorkCenter)
        }

    }

    return (
        <>
            {config.OrientacionMenu == "Vertical" ?
                <header className={`global_bg_primary ${styles.header}`}>
                    <div className='container-fluid'>
                        <div className='row'>
                            <div className='col-3 col-sm-4 col-md-4 col-lg-3 col-xl-3 col-xxl-3 d-flex justify-content-center align-items-center  px-1 px-sm-3'>
                                <div className='col-6 col-sm-3'>
                                    <BotonMenu Target={"#navMenu"} />
                                </div>
                                <div className='col-6 col-sm-3 d-flex justify-content-center align-items-center'>
                                    <Image className={``} alt="Logo" src={Logo} width={55} height={55} />
                                </div>
                                <div className='col-6 ps-1 d-none d-sm-block'>
                                    <h1>Avisor</h1>
                                </div>

                            </div>
                            <div className='col-9 col-sm-8 col-md-8 col-lg-9 col-xl-9 col-xxl-9'>
                                <div className='row'>
                                    <ElementoHeader Etiqueta={t('Machine')} ColSize="col-4 col-lg-3 col-xl-2" Contenido={<MachineCombo actualizaWorkCenter={actualizaWorkCenter} setComboMaquinaCargado={setComboMaquinaCargado} isHeader={true}/>} />
                                    <ElementoHeader Etiqueta='' ColSize={"col-2"} Contenido={<StatusBadge Estado={header.Estado} EstadoR={t('Running')} EstadoS={t('Stopped')} />} />
                                </div>
                                <div className='row'>
                                    <ElementoHeader Etiqueta={t('Product')} ColSize={"col-6"} Contenido={<>{header.Producto}</>} />
                                    <ElementoHeader Etiqueta={t('Compliance')} ColSize={"col-3"} Contenido={<>{header.Cumplimiento}</>} />
                                    <ElementoHeader Etiqueta={t('Speed')} ColSize={"col-3"} Contenido={<>{header.Velocidad}</>} />

                                </div>
                            </div>
                        </div>
                    </div>
                </header>
                :
                <header className={`global_bg_primary ${styles.header}`}>
                    <div className='container-fluid'>
                        <div className='row'>
                            <div className='col-3 col-sm-4 col-md-3 col-lg-3 col-xl-3 col-xxl-2 d-flex justify-content-center align-items-center'>
                                <div className='col-4 d-flex justify-content-center align-items-center'>
                                    <Image className={``} alt="Logo" src={Logo} width={55} height={55} />
                                </div>
                                <div className='col-8 ps-1'>
                                    <h1>Avisor</h1>
                                </div>

                            </div>
                            <div className='col-9 col-sm-8 col-md-9 col-lg-9 col-xl-9 col-xxl-10'>
                                <div className='row'>
                                    <ElementoHeader Etiqueta={t('Machine')} ColSize="col-4 col-lg-3 col-xl-2" Contenido={<MachineCombo actualizaWorkCenter={actualizaWorkCenter} setComboMaquinaCargado={setComboMaquinaCargado} isHeader={true}/>} />
                                    <ElementoHeader Etiqueta='' ColSize={"col-2"} Contenido={<StatusBadge Estado={header.Estado} EstadoR={t('Running')} EstadoS={t('Stopped')} />} />
                                </div>
                                <div className='row'>
                                    <ElementoHeader Etiqueta={t('Product')} ColSize={"col-6"} Contenido={<>{header.Producto}</>} />
                                    <ElementoHeader Etiqueta={t('Compliance')} ColSize={"col-3"} Contenido={<>{header.Cumplimiento}</>} />
                                    <ElementoHeader Etiqueta={t('Speed')} ColSize={"col-3"} Contenido={<>{header.Velocidad}</>} />

                                </div>
                            </div>
                        </div>
                    </div>
                </header>
            }
        </>
    )
}

interface ElementoHeaderProps {
    Etiqueta?: any;
    Contenido?: React.ReactElement;
    ColSize?: string;
}

const ElementoHeader = ({ Etiqueta, Contenido, ColSize }: ElementoHeaderProps) => {

    return (
        <div className={`${ColSize}`}>
            {Etiqueta ?
                <div className="row">
                    <span className="p-0">{Etiqueta}</span>
                </div>

                :
                <div className="row">
                    <span className="p-0"><>&nbsp;</></span>
                </div>

            }
            <div className="row">
                {Contenido}
            </div>
        </div>
    )
}

interface StatusBadgeProps {
    Estado: number,
    EstadoR: string,
    EstadoS: string
}
const StatusBadge = ({ Estado, EstadoR, EstadoS }: StatusBadgeProps) => {

    return (

        <>
            {Estado === 1 ?
                <span className='badge text-bg-success pb-2 ms-2'>{EstadoR}</span>
                :
                <span className='badge text-bg-danger pb-2 ms-2'>{EstadoS}</span>
            }
        </>

    )
}

async function FetchData(config: any, header: any) {
    //TODO: obtener IdWorkCenter? 

    const datosHeader = await fetchData(`${config.Api}header`
        , `?ClaUbicacion=${config.ClaUbicacion}&Idioma=${config.Idioma}`
        , "GET"
        , null
        , true)
        .then((res) => {
            return res.json()
        }
        )
        .catch(() => {
            console.error("Error obteniendo datos del header")
        })



    const nuevoHeader = datosHeader.length > 0 ?
        {
            Producto: datosHeader[0].ProductoActual,
            Estado: datosHeader[0].Estado,
            Velocidad: datosHeader[0].Velocidad,
            Cumplimiento: datosHeader[0].Cumplimiento
        }
        :
        {}



    return { ...header, ...nuevoHeader }




}