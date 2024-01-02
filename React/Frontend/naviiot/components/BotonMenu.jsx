import styles from './BotonMenu.module.css'
import { useConfigContext } from '@/utils/config'

export default function BotonMenu({ Target }) {
    const [config, setConfig] = useConfigContext()

    let btnTarget = config.MenuColapsable=="ON" ? Target:''

    return (
        <button className={`btn btn-outline-light ${styles.botonMenu} d-flex justify-content-center align-items-center`} type="button" data-bs-toggle="collapse" data-bs-target={btnTarget} aria-controls={btnTarget} aria-expanded="false" aria-label="Toggle navigation">
            <i className={`${styles.iconoMenu} bi bi-list`}></i>
        </button>
    )
}