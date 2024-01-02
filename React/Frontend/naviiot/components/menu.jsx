import React,{ Suspense, useEffect, useState } from 'react'
import {useConfigContext} from "./../utils/config"
import Image from "next/image"
import Link from "next/link"
import styles from "./menu.module.css"
import { useTranslation } from 'react-i18next'
import imgCurrOrder from '@/assets/img/IconoA1.png'
import imgProdProgram from '@/assets/img/IconoProd.png'
import imgProdSummVisualization from '@/assets/img/IconoOpm.png'
import imgLogout from '@/assets/img/Logout.png'
import imgShiftConfiguration from '@/assets/img/ShiftConfiguration.png'

export default function Menu() {
    const [config, setConfig ] = useConfigContext()
    /**
     * Constante para el uso de multi-lenguaje
     */
    const { t } = useTranslation('menu');

    //Orientacion del menu
    let menuClass= config.OrientacionMenu=="Vertical" ? styles.menuVertical: styles.menuHorizontal
    let linkMenuTarget = config.MenuColapsable === "ON" ? (config.OrientacionMenu === "Vertical" ? '#navMenu' : '#footerContent') : '';

    return (
        <>
            <nav id="navMenu" className={`text-center global_bg_primary collapse show ${menuClass}`}>
                <ul className={`navbar-nav  p-0 ${styles.listaMenu}`}>
                    {/* <li className="nav-item">
                    <Link className="nav-link" 
                    href="/">
                        Home
                    </Link>
                </li> */}
                    <li className={`nav-item ${styles.itemListaMenu}`} >
                        <Link className="nav-link"
                            href="/cu151_pag2_visualizacion_ord_prog/cu151_pag2_visualizacion_ord_prog">
                            <button className={`btn btn-outline-light ${styles.botonLink}`} type='button' data-bs-toggle='collapse' data-bs-target={linkMenuTarget} aria-controls='navMenu' aria-expanded='false' aria-label='Toggle navigation'>
                                <Image src={imgCurrOrder} priority="true" alt="PP" className={`img-fluid ${styles.imagenBotonLink}`} />
                                <span className={`${styles.spanBotonLink}`}>{t('currentOrder')}</span>
                            </button>
                        </Link>
                    </li>
                    <li className={`nav-item ${styles.itemListaMenu}`}>
                        <Link className="nav-link"
                            href="/cu153_production_prog/cu153_pag1_production_prog">
                            <button className={`btn btn-outline-light ${styles.botonLink}`} type='button' data-bs-toggle='collapse' data-bs-target={linkMenuTarget} aria-controls='navMenu' aria-expanded='false' aria-label='Toggle navigation'>
                                <Image src={imgProdProgram} alt="PP" className={`img-fluid ${styles.imagenBotonLink}`} />
                                <span>{t('productionProgram')}</span>
                            </button>
                        </Link>
                    </li>
                    <li className={`nav-item ${styles.itemListaMenu}`}>
                        <Link className="nav-link"
                            href="/CU151_Production_Summary_Visualization/CU151_Pag3_Production_Summary_Visualization">
                            <button className={`btn btn-outline-light ${styles.botonLink}`} type='button' data-bs-toggle='collapse' data-bs-target={linkMenuTarget} aria-controls='navMenu' aria-expanded='false' aria-label='Toggle navigation'>
                                <Image src={imgProdSummVisualization} alt="PP" className={`img-fluid ${styles.imagenBotonLink}`} />
                                <span>{t('productionSummary')}</span>
                            </button>
                        </Link>
                    </li>
                    <li className={`nav-item ${styles.itemListaMenu}`}>
                        <Link className="nav-link"
                            href="/CU171_Pag1_Bitacora_Produccion/CU171_Pag1_Production_Detail">
                            <button className={`btn btn-outline-light ${styles.botonLink}`} type='button' data-bs-toggle='collapse' data-bs-target={linkMenuTarget} aria-controls='navMenu' aria-expanded='false' aria-label='Toggle navigation'>
                                <Image src={imgProdSummVisualization} alt="PP" className={`img-fluid ${styles.imagenBotonLink}`} />
                                <span>{t('productionDetail')}</span>
                            </button>
                        </Link>
                    </li>
                    <li className={`nav-item ${styles.itemListaMenu}`}>
                        <Link className="nav-link"
                            href="/CU155_Pag2_SplitOpm/CU155_Pag2_SplitOpm">
                            <button className={`btn btn-outline-light ${styles.botonLink}`} type='button' data-bs-toggle='collapse' data-bs-target={linkMenuTarget} aria-controls='navMenu' aria-expanded='false' aria-label='Toggle navigation'>
                                <Image src={imgProdSummVisualization} alt="SPO" className={`img-fluid ${styles.imagenBotonLink}`} />
                                <span>{t('splitProductionOrder')}</span>
                            </button>
                        </Link>
                    </li>
					<li className={`nav-item ${styles.itemListaMenu}`}>
                        <Link className="nav-link"

                            href="/CU204_Pag5_BitacoraParos/CU204_Pag5_BitacoraParos">
                            <button className={`btn btn-outline-light ${styles.botonLink}`} type='button' data-bs-toggle='collapse' data-bs-target={linkMenuTarget} aria-controls='navMenu' aria-expanded='false' aria-label='Toggle navigation'>
                                <Image src={imgProdSummVisualization} alt="PP" className={`img-fluid ${styles.imagenBotonLink}`} />
                                <span>{t('Downtimes')}</span>
                            </button>
                        </Link>
                    </li>
                    <li className={`nav-item ${styles.itemListaMenu}`}>
                        <Link className="nav-link"
                            href="/CU1_Pag2_Login/CU1_Pag2_shift_configuration">
                            <button className={`btn btn-outline-light ${styles.botonLink}`} type='button' data-bs-toggle='collapse' data-bs-target={linkMenuTarget} aria-controls='navMenu' aria-expanded='false' aria-label='Toggle navigation'>
                                <Image src={imgShiftConfiguration} alt="PP" className={`img-fluid ${styles.imagenBotonLink}`} />
                                <span>{t('shiftConfiguration')}</span>
                            </button>
                        </Link>
                    </li>
                    <li className={`nav-item ${styles.itemListaMenu}`}>
                        <Link className="nav-link"
                            href="/CU1_Pag2_Login/CU1_Pag2_logout">
                            <button className={`btn btn-outline-light ${styles.botonLink}`} type='button' data-bs-toggle='collapse' data-bs-target={linkMenuTarget} aria-controls='navMenu' aria-expanded='false' aria-label='Toggle navigation'>
                                <Image src={imgLogout} alt="PP" className={`img-fluid ${styles.imagenBotonLink}`} />
                                <span>{t('logout')}</span>
                            </button>
                        </Link>
                    </li>
                </ul>
            </nav>
        </>

    )
}