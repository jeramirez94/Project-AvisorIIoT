import { useEffect, useState } from "react";
import styles from './modal.module.css'
import { fetchData } from '@/utils/fetch';
import { useTranslation } from 'react-i18next' 

//Modales para notificaciones

//Modal para errores
export default function ModalError({isOpen, setIsOpen, status, setStatus, Text_modalbody}){
    const {t}=useTranslation('modal');
    return(
        <div className='modal d-block bg-dark bg-opacity-80' tabIndex="4" onClick={() => {setStatus(200)}}>
            <div className="modal-dialog modal-dialog-centered" role="document">
                <div className="modal-content text-center">
                    <div className="modal-header">
                        <h5 className="modal-title">Error</h5>
                        <button type="button" className="btn-close" onClick={() => { setStatus(200)}} aria-label="Close">
                        </button>
                    </div>
                <div className="modal-body">
                    <p>{Text_modalbody}</p>
                </div>
                    <div className="modal-footer d-flex justify-content-center">
                        <button type="button" className="btn btn-primary btn-lg mx-5 global_btn_primary" onClick={() => {setStatus(200)}}>{t('Close')}</button>
                    </div>
                </div>
            </div>
        </div>
    )
}

//Modal para spinner de loading
export function ModalSpinner(){
    const {t}=useTranslation('modal');
    return(
        <div id="spinner" className={`modal d-block bg-dark bg-opacity-80 position-absolute`} tabIndex="3">
            <div className={`modal-dialog ${styles.loading} modal-dialog-centered`} role="document">
                <div className="modal-content text-center">
                    <div className="modal-header">
                        <h5 className="modal-title">{t('Loading')}...</h5>
                    </div>
                <div className="modal-body">
                    <div className="clearfix">
                        <div className={`spinner-border float-right ${styles.spinner}`} role="status">
                        </div>
                    </div>
                </div>
                    <div className="modal-footer d-flex justify-content-center">
                    </div>
                </div>
            </div>
        </div>
    )
}
