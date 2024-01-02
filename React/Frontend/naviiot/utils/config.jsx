import { createContext, useContext, useState } from "react";


const Context = createContext();
/**
 * Proveedor de contexto para configuraciones globales
 * 
 */
export function ConfigProvider({children}){
    const [config, setConfig] = useState({
        ClaUbicacion:65,
        /**
         * Spanish
         * English
         */
        Idioma:"English",
        Api:"http://localhost:3350/api/", 
        /**
         * Horizontal
         * Vertical
         */
        OrientacionMenu:"Vertical",
        /**
         * ON
         * OFF
         */
        MenuColapsable:"ON",
        /**
         * ON - Requiere usuario y contraseña
         * USER_ONLY - Requiere usuario
         * OFF - No hay login, el usuairo es anonimo
         */
        Autenticacion: "USER_ONLY",
        /**
         * Indica si al loggerase se solicita el turno al que se asocia la produccion
         */
        CapturaTurno: "ON",
        /**
         * Nombre y id del perfil de operador
         */
        Operador: {Perfil:"Operator", Id:3500000},
        /**
         * Nombre y id del perfil de supervisor
         */
        Supervisor: {Perfil:"Supervisor", Id:3500001},
        /**
         * Ubicacion del proyecto:
         * Houston
         * Summit
         */
        Ubicacion: "Houston"
    });
    return (
        <Context.Provider value={[config, setConfig]}>{children}</Context.Provider>
    );
}

/**
 * Hook  para acceder al contexto de configuracion global.
 * El contexto incluye las siguientes propiedades:
 * 
 * - ClaUbicacion: 
 * - Idioma: 
 * - Api: 
 * 
 * * @example
 * // Uso del hook en un componente funcional
 * const MyComponent = () => {
 *    const { config, setConfig } = useConfigContext();
 *    
 *    // ... lógica del componente que utiliza el contexto ..
 *    
 *    return (
 *        // JSX del componente
 *    );
 * }
 */
export function useConfigContext(){
    return useContext(Context)
}