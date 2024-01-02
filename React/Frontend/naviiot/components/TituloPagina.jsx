import { useHeaderContext } from "../utils/headerCtx"
import styles from './TituloPagina.module.css'

export default function TituloPagina(){
    const { header } = useHeaderContext();
    return (
        <div className={`row global_bg_secondary`}>
            <div className="col-1 d-flex justify-content-center align-items-center">
                <i className={`bi bi-arrow-left-circle ${styles.iconoBackButton}`}></i>
            </div>
            <div className={`col-11 d-flex align-items-center`}>
                {header.Titulo}
            </div>
        </div>

    )
}