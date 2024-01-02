import Head from "next/head";
import Header from './header'
import Menu from './menu'
import Footer from './footer'
import { useState } from "react"
import styles from './layout.module.css'
import { useConfigContext } from "./../utils/config"
import TituloPagina from './TituloPagina'


export default function Layout({children,setSelectedWorkCenter,SelectedIdWorkCenter}){

    const [ComboMaquinaCargado, setComboMaquinaCargado] = useState(false);
    const [config, setConfig] = useConfigContext()
    const iconoApp = "/assets/img/" + config.Ubicacion + "_logo_color.png"

    return (
        <>
            <Head>
                <title>Avisor</title>
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <link rel="icon" href={iconoApp}></link>
            </Head>
            {config.OrientacionMenu == "Vertical" ?
                <div className="d-flex flex-column min-vh-100">
                    <Header setSelectedWorkCenter={setSelectedWorkCenter} setComboMaquinaCargado={setComboMaquinaCargado}></Header>
                    <div className={`d-flex flex-grow-1 ${styles.mainVertical}`}>
                        <Menu />
                        <div className={`container-fluid ${styles.contentVertical}`}>
                            <TituloPagina></TituloPagina>
                            {ComboMaquinaCargado ? children : null}
                        </div>
                    </div>
                    <Footer SelectedIdWorkCenter={SelectedIdWorkCenter} />
                </div>
                :
                <div className="d-flex flex-column min-vh-100">
                    <Header setSelectedWorkCenter={setSelectedWorkCenter} setComboMaquinaCargado={setComboMaquinaCargado}></Header>
                    <div className={`${styles.mainHorizontal} d-flex-column flex-grow-1`}>
                        <div className='container-fluid'>
                            <TituloPagina />
                        </div>
                        <div className={`container-fluid`}>
                            {ComboMaquinaCargado ? children : null}
                        </div>
                    </div>
                    <Footer />
                </div>
            }
        </>
    )
}