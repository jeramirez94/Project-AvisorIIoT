import { useState, useEffect } from "react";
import { fetchData } from '@/utils/fetch';
import { useConfigContext } from '@/utils/config';
import Image from 'next/image'

export default function ShiftGrid({turno, setTurno, active, setActive, turnos, setTurnos, date, setDate}){
    
    //crear constante con las configuraciones.
    const [config, setConfig] = useConfigContext();
   
    return(
        <div className='row'>
            {Object.keys(turnos).map((i) => (
                    
                <div key={i} className='col d-flex'>
                    <button id={i} value={turnos[i].ClaTurno} className={`${active.toString() === i ? "active" : undefined} shift mt-auto mb-auto p-2 btn btn-outline-dark`} onClick={(e) => {setTurno(e.target.value), setActive(e.target.id)}}>{turnos[i].NomTurno}</button>
                </div>

            ))}
        </div>
    )
}