import styles from './machinecombo.module.css'
import { useEffect, useState } from 'react'
import { useConfigContext } from '@/utils/config'
//import Select from 'react-select'
import { getCookieValue } from '@/utils/tools'
import Select from '@/components/select'

//función asincrona para enviar la solicitud http y recibir la respuesta
async function fetchData(url, query, metodo, body) {
    //se realiza la llamada a la API con parametros en la propiedad Query por metodo GET.
    return await fetch(url + query, {
        method: metodo,
        credentials: "include"
    }).then((res) => res.json())
}


export default function MachineCombo({ actualizaWorkCenter, setComboMaquinaCargado, isHeader }) {
    //crear constante con las configuraciones.
    const [config, setConfig] = useConfigContext();
    //Se declara constante en estado null para almacenar la respuesta
    //obtenida de la llamada a la API.
    const [response, setResponse] = useState(null)
    const [selMachine, setSelMachine] = useState(null);
    let data = [];


    const ajustaCombo = {
        control: (base) => ({
            ...base,
            height: 25,
            minHeight: 25,
        }),
        dropdownIndicator: (base) => ({
            ...base,
            paddingTop: 0,
            paddingBottom: 0,
        }),
        clearIndicator: (base) => ({
            ...base,
            paddingTop: 0,
            paddingBottom: 0,
        }),
        valueContainer: (base) => ({
            ...base,
            paddingTop: 0,
            paddingBottom: 0,
        }),
    }

    //función manejadora del evento de cambio de valor del elemento react-select
    // async function handleChange(e) {
    //     fetchData(config.Api + "maquinas/setMaquinas", "?cookieNombre=IdWorkCenter&cookieValor=" + e.value, 'POST')

    //     actualizaWorkCenter(e.value)
    // }
    //Hook
    useEffect(() => {
        //Iniciar llamada a la API por metodo GET y almacenar respuesta
        //en variable response
        if(isHeader){
            fetchData(config.Api + "maquinas/setMaquinas", "?cookieNombre=maquinasPreferidas&cookieValor=FF-01,FF-02,FF-03,FF-04,FF-05,FF-06", "POST", '')
            .then(() => {
                fetchData(config.Api + "maquinas", "?ClaUbicacion=" + config.ClaUbicacion + "&Idioma=" + config.Idioma + "&pnTipo=0&pnModoSel=0&pnBajasSn=0", "GET", '')
                    .then((res) => {
                        setResponse(res.maquinas)

                        //actualizaWorkCenter()
                        setSelMachine(getCookieValue("IdWorkCenter"))
                        setComboMaquinaCargado(true);
                    })
            })
        }else{

            fetchData(config.Api + "maquinas", "?ClaUbicacion=" + config.ClaUbicacion + "&Idioma=" + config.Idioma + "&pnTipo=0&pnModoSel=0&pnBajasSn=0", "GET", '')
                    .then((res) => {
                        setResponse(res.maquinas)

                        //actualizaWorkCenter()
                        setSelMachine(getCookieValue("IdWorkCenter"))
                        setComboMaquinaCargado(true);
                    })
        }
    }, [])

    useEffect(() => {
        if(selMachine){
            if(isHeader){
                fetchData(config.Api + "maquinas/setMaquinas", "?cookieNombre=IdWorkCenter&cookieValor=" + selMachine, 'POST')
            }
            actualizaWorkCenter(selMachine)
        }
    
    }, [selMachine])

    //condicional para evitar el renderizado previo a la respuesta de la llamada a la API.
    if (response != null) {
        Object.keys(response).map((i) => (

            data.push({ value: response[i].IdWorkCenter, text: response[i].NomWorkCenter })

        ))

        return (
            <>

                <Select ArrOptions={data}
                    KeySelected={selMachine}
                    setValue={setSelMachine}
                    mode={1}
                    isHeader={isHeader}
                />


            </>

        )
    } else {
        return null
    }




}