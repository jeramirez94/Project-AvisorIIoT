
import styles from './header.module.css'
import MachineCombo from './machinecombo'
export default function Header(){
    return (
        <>
        <div className={`container-fluid ${styles.texto_blanco} mc_bg_azul `}>
        
            <div className='row'>
               <div className='col-3'>
               <div className="row">
                    <span>Product</span>
                </div>
                <div className="row">
                    <span>FK ST 842-6-500</span>
                </div>
               </div>
               <div className='col-2'>
                    <div className="row">
                        <span>Scheduled</span>
                    </div>
                    <div className="row">
                        <span>100</span>
                    </div>
               </div>
               <div className='col-2'>
                    <div className="row">
                        <span>Produced</span>
                    </div>
                    <div className="row">
                        <span>37</span>
                    </div>
               </div>
               <div className='col-2'>
                    <div className="row">
                        <span>Shift</span>
                    </div>
                    <div className="row">
                        <span>A</span>
                    </div>
               </div>
               <div className='col-3'>
                    <div className="row">
                        <span>Machine</span>
                    </div>
                    <div className="row">
                        <MachineCombo />
                    </div>
               </div>

            </div>
           
           
     
        <div className={`row ${styles.tituloPagina}`} style={{background:"white"}}>
            <div className="col-12">
            </div>
        </div>
        </div>
        </>

    )
}