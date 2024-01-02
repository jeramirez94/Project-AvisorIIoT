import { createContext, useContext, useState } from "react";


interface Iheader {
    Titulo:string;
    Producto:string;
    Cumplimiento:string;
    Velocidad:string;
    Estado: number;
    IdWorkCenter?:string;
}

const Context = createContext<{ header: Iheader}>({
    header: { Titulo: "-", Producto: "-", Cumplimiento: "-", Velocidad: "-" ,Estado:0,IdWorkCenter:''}
  });


export function HeaderProvider({children}:any){
    
    const [header, setHeader] = useState<Iheader>({ Titulo:"-"
                                          ,Producto:"-"
                                          ,Cumplimiento:"-"
                                          ,Velocidad:"-"
                                          ,Estado:0
                                          ,IdWorkCenter:''
                                        });

    const actualizaHeader = (nuevoHeader: Iheader) =>{
        if(
             nuevoHeader.Titulo       !== header.Titulo ||
             nuevoHeader.Producto     !== header.Producto ||
             nuevoHeader.Cumplimiento !== header.Cumplimiento ||
             nuevoHeader.Velocidad    !== header.Velocidad ||
             nuevoHeader.Estado       !== header.Estado ||
             nuevoHeader.IdWorkCenter !== header.IdWorkCenter 
        ){
            setHeader(nuevoHeader)
        }
    }

    return (
        <Context.Provider value={{header, setHeader:actualizaHeader}}>{children}</Context.Provider>
    );
}

/**
 * Hook  para acceder al contexto del encabezado.
 * El contexto del encabezado incluye las siguientes propiedades:
 * 
 * - Titulo: string
 * - Producto: string
 * - Cumplimiento: string
 * - Velocidad: string
 * - Estado: number
 * - IdWorkCenter: string (opcional)
 * 
 * * @example
 * // Uso del hook en un componente funcional
 * const MyComponent = () => {
 *    const { header, setHeader } = useHeaderContext();
 *    
 *    // ... lógica del componente que utiliza el contexto del encabezado ...
 *    
 *    return (
 *        // JSX del componente
 *    );
 * }
 */
export function useHeaderContext(){
    return useContext(Context)
}

