import { useState, useEffect } from 'react';
import styles from './cu151_pag2_visualizacion_ord_prog.module.css';
import {useConfigContext} from "../../utils/config"
import { fetchData } from '@/utils/fetch'
import ModalError from '@/components/modal'
import { useTranslation } from 'react-i18next'
import { useHeaderContext } from "../../utils/headerCtx"
import { useRouter } from 'next/router';
//import useFetch from '@/utils/useFetch'

//EL CU CORRECTO ES EL 151.2
export default function CU153_pag1_opm({SelectedIdWorkCenter}){

    //hook de nextjs para el manejo de enrutamiento, podemos acceder a las varialbes por route.query.[parametro]
    const router = useRouter();

    const [data, setData] = useState(null);
    const [errorMsg, setErrorMsg] = useState(null);
    const [config, setConfig ] = useConfigContext();
    const [isOpen, setIsOpen] = useState(true);
    const [isLoaded, setIsLoaded] = useState(false);
    const [status, setStatus] = useState(200);
    const { t } = useTranslation('cu151_ov');

    const CUPag = {CU:151,Pag:2}
    
    
    // const {res,loading,err,statusCode} = useFetch(  SelectedIdWorkCenter
    //                                                 ,`${config.Api}produccion/ordenes/ObtenerOrdenActiva?ClaUbicacion=${config.ClaUbicacion}&Idioma=${config.Idioma}`
    //                                                 ,'GET'
    //                                                 ,null
    //                                                 ,30000
    //                                                 ,false
    //                                             )
    /**
     * Titulo de pagina
     */
    const { header, setHeader } = useHeaderContext();

    // useEffect(() => {
    //     setHeader({...header,Titulo:t('pageTitle')})
    //     if (res || err) {
    //         if (data) {
    //             setIsLoaded(true)
    //         }

    //         if (err) {
    //             setErrorMsg(err.msg + " \n " + JSON.stringify(err.error))
    //             setStatus(statusCode)
    //         } else {
    //             if (res) {
    //                 switch (statusCode) {
    //                     case 200:
    //                         setData(res.result);
    //                         setIsLoaded(true);
    //                         setStatus(statusCode);
    //                         break;
                        // case 401: 
                        // router.push("/login")
                        // break;

    //                     case 400:
    //                     default:
    //                         setErrorMsg(res.msg)
    //                         setStatus(statusCode)
    //                         break;

    //                 }
    //             }
    //         }

    //     }
    //     // return () => {
    //     //     console.log('Efecto de limpieza ejecutado al desmontar el componente');
    //     //   };
    // }, [SelectedIdWorkCenter,res, statusCode, err]);


    useEffect(() =>{ 
        setHeader({...header,Titulo:t('pageTitle')})
        buscar(false);
        const interval = setInterval(() => {
            buscar(true);
        }, 30000);
        return () => {
            clearInterval(interval)
        };

    },[SelectedIdWorkCenter]);    

    const buscar = (hideSpinner) => {
        fetchData(config.Api+"produccion/ordenes/ObtenerOrdenActiva","?ClaUbicacion="+config.ClaUbicacion+"&Idioma="+config.Idioma,'GET',null,hideSpinner,CUPag)
        .then(async(res) => {
            let codeStatus = res.status
            let data = await res.json()
            switch (codeStatus) {
                case 200:
                    setData(data.result);  
            		setIsLoaded(true)          
                    break;
                case 500:
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
                    setErrorMsg(data.msg)
                    setStatus(codeStatus)
                    break;
            }       
        }).catch((error) => {
            setErrorMsg("Report error to administrator."+"\n" + error.toString())
            setStatus(null)
        });        
    }
    
    if(status == 200 && isLoaded){
        return(
            <> 
                <div className={styles.contenedorinfoopm} >
                        <div>
                        <div  className={styles.contenedorheaderopm} >
                        <div className={styles.nombreOpm}> OPM: {data.Nomopm}</div>
                            <div className={styles.unidadesrestantes}> {t('Produced')}: {(data.CantidadProducida) - (data.CantidadPNC)}/{data.CantidadProgramadaUds}</div>
                        <div className={styles.barraprogreso}><progress id="file" max="100" value={((data.CantidadProducida)-(data.CantidadPNC))*100/(data.CantidadProgramadaUds)}> 70% </progress></div>   
                        </div>
                        <div className={styles.articuloopm}> {t('Item')}:  {data.NomArticulo} </div>
                        </div>
                    <div className={styles.caracteristicasprincipalesO}>
                    <div className={styles.caracteristicasprincipales}>
                    <table className="table">
                                 <thead className="table-dark">
                                    <tr>
                                        <><th> {t('mainFeature')}</th>
                                            <th>{t('Description')}</th></>
                                     </tr>
                                    </thead>
                            {data.Caracteristicas.map((info, index) => (
                                <tbody key={index}>
                                    <tr>{ info && (info.EsPrincipal === 1 ) &&
                                            <>
                                                <td>{config.Idioma=="Spanish" ? info.NomCaracteristica:info.NomCaracteristicaIngles}</td>
                                                <td>{config.Idioma=="Spanish" ? info.NomValorCaract:info.NomValorCaractIngles}</td>
                                            </>
                                     }</tr>
                                </tbody>
                                ))}
                    </table>
                     </div>
                    </div>
                    {/* <div className={styles.caracteristicastodas}>
                    <table className="table">
                            <thead className="table-dark">
                                    <tr>
                                        <th> General Feature</th>
                                        <th>Description</th>
                                    </tr>
                            </thead>
                            {data.Caracteristicas.map((info, index) => (
                                <tbody key={index}>
                                    <tr>{ info && (info.EsPrincipal === 0 ) &&
                                        <><td>{info.NomCaracteristicaIngles}</td>
                                        <td>{info.NomValorCaractIngles}</td></>
                                    }</tr>
                                </tbody>
                                ))}
                    </table>
                    </div> */}
                </div> 

            </>)
    } 
    else if(status != 200){
        return(
            <>
                
                    <ModalError status={status} setStatus={setStatus} Text_modalbody={errorMsg}/>
                
            </>
        )
    }
    
}