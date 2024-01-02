import ShiftPicker from "@/components/shiftpicker";
import { useState, useEffect } from "react";
import { useFooterContext } from '@/utils/footerCtx';
import { useRouter } from 'next/router';

export default function CU1_Pag2_Shift_Configuration(){
    const router = useRouter();
    const [footer, setFooter] = useFooterContext();
    const [openViews,setOpenViews] = useState({'otherUsers':false, 'shiftSelector': true, 'confirm': false});
    const [selectedOptions, setSelectedOptions] = useState({"username": footer.NombreUsuario,"idusuario": null,"loginusername": null, 'idshift': null, "shiftname": footer.Turno});

    useEffect(() =>{
        if(openViews.shiftSelector == false){
            router.push('/cu153_production_prog/cu153_pag1_production_prog')
        }
        
    }, [openViews]);


    return(
        <>
        {openViews.shiftSelector && <ShiftPicker selectedOptions={selectedOptions} setSelectedOptions={setSelectedOptions} openViews={openViews} setOpenViews={setOpenViews}/>}
        
        </>
        )
}