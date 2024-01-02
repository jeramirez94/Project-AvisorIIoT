import styles from './footer.module.css'
import { useEffect, useState } from "react";
import { useConfigContext } from '@/utils/config'
import Menu from './menu';
import BotonMenu from './BotonMenu';
import { useFooterContext } from '@/utils/footerCtx';
import { fetchData } from '@/utils/fetch'

export default function Footer({SelectedIdWorkCenter}) {
    const [config, setConfig] = useConfigContext();
    const [footer, setFooter] = useFooterContext();
    useEffect(() => {
        fetchData(`${config.Api}footer`
        , `?ClaUbicacion=${config.ClaUbicacion}&Idioma=${config.Idioma}`
        , "GET"
        , null
        , true)
        .then((res) => {
            let codeStatus = res.status
            switch (codeStatus) {
                case 200:
                    res.json().then((data) => {setFooter(data.footer.shift())});
                    break;
                case 500:
                    console.error(`Error obteniendo datos del footer: ${data.msg} \n ${JSON.stringify(data.error)}`);                  
                    break;
                case 400:
                default:
                    console.error(`Error obteniendo datos del footer: ${data.msg}`);     
                    break;
            }
        }
        )
        .catch((error) => {
            console.error(`Error obteniendo datos del footer ${error.toString()}`)
        })
    }, [SelectedIdWorkCenter])

    return (
        <>
            {config.OrientacionMenu == "Vertical" ?
                <footer id='footer' className={`global_bg_primary ${styles.footer}`}>
                    <div className='container-fluid'>
                        <div className='row pt-2 pb-2 justify-content-between'>
                            <div className='col-5 col-md-4 col-xl-3'>
                                <div className='row'>
                                    <div className='col-4 col-md-3 col-lg-2 d-flex justify-content-center align-items-center'>
                                        <i className={`${styles.svgIcon} bi bi-person-circle`}></i>
                                    </div>
                                    <div className='col-8 d-flex justify-content-start align-items-center px-0'>
                                        <span className={`${styles.nombreUsuario}`}>{footer.NombreUsuario}</span>
                                    </div>
                                </div>
                            </div>
                            <div className='col-5 col-md-4 col-xl-3 d-flex justify-content-end'>
                                <div className='row justify-content-end'>
                                    <div id='icono' className='col-5 d-flex justify-content-end align-items-center'>
                                        <i className={`${styles.svgIcon} bi bi-clock`}></i>
                                    </div>
                                    <div id='turno' className='col-7 d-flex align-items-center justify-content-start'>
                                        <span className={`${styles.nombreUsuario}`}>{footer.Turno}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </footer>
                :
                <footer id="footer" className={`global_bg_primary ${styles.footer}`}>
                    <div className='container-fluid'>
                        {config.MenuColapsable == "ON" ?
                            <div className={`row p-0`}>
                                <div className={`${styles.footerToggler} p-0`}>
                                    <BotonMenu Target={"#footerContent"} />
                                </div>
                            </div> : null
                        }
                        <div id="footerContent" className='row collapse show'>
                            <div className='col-8  col-md-9 col-xxl-10'>
                                <Menu />
                            </div>
                            <div className='col-4 col-md-3 col-xxl-2'>
                                <div className='row'>
                                    <div className='row  pt-1'>
                                        <div className='col-4 d-flex justify-content-center align-items-center'>
                                            <i className={`${styles.svgIcon} bi bi-person-circle`}></i>
                                        </div>
                                        <div className='col-8 d-flex justify-content-start align-items-center'>
                                            <span className={`${styles.nombreUsuario}`}>{footer.NombreUsuario}</span>
                                        </div>
                                    </div>
                                    {/* <div className='row pb-1 pt-3'>
                                        <div className='col-4 d-flex justify-content-center align-items-center'>
                                            <i className={`${styles.svgIcon} bi bi-clock`}></i>
                                        </div>
                                        <div className='col-8 d-flex justify-content-start align-items-center'>
                                            <span className={`${styles.hora}`}>HORA</span>
                                        </div>
                                    </div> */}
                                </div>
                            </div>
                        </div>
                    </div>
                </footer>
            }

        </>
    )
}