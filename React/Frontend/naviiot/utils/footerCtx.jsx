import { createContext, useContext, useState } from "react";


const FooterContext = createContext();
/**
 * Proveedor de contexto para configuraciones globales
 * 
 */
export function FooterProvider({children}){
    const [footer, setFooter] = useState({
        NombreUsuario:'', 
        Turno:''
    });
    return (
        <FooterContext.Provider value={[footer, setFooter]}>{children}</FooterContext.Provider>
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
export function useFooterContext(){
    return useContext(FooterContext)
}