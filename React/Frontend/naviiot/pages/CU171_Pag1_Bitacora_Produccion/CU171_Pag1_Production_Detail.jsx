import { useEffect, useState } from "react";
import Tabla from '@/components/Tabla';
import styles from './CU171_Pag1_Production_Detail.module.css';
import ShiftGrid from '@/components/shiftgrid';
import { fetchData } from '@/utils/fetch';
import { useConfigContext } from '/utils/config';
import { ModalPNC, ModalError, ModalOrders, ModalAdd, ModalDelete } from "../../components/modal";
import {useRouter} from "next/router"
import Image from 'next/image';
import Link from 'next/link';
import AddProduct from '@/assets/img/addProduct.png';
import Reduce from '@/assets/img/reduce.png';
import search from '@/assets/img/search.png';
import previous from '@/assets/img/previous.png';
import good from '@/assets/img/good.png';
import reject from '@/assets/img/reject.png';
import add from '@/assets/img/add.png';
import eliminar from '@/assets/img/eliminar.png';
import order from '@/assets/img/order.png';
import next from '@/assets/img/next.png';
import { useTranslation } from 'react-i18next';
import { useHeaderContext } from "../../utils/headerCtx";
import InputFecha from '@/components/InputFecha';

export default function CU171_Pag1_Production_Detail({SelectedIdWorkCenter}){

    const CUPag = {CU:171,Pag:1}
    //hook de nextjs para el manejo de enrutamiento, podemos acceder a las varialbes por route.query.[parametro]
    const router = useRouter();

    //variables para manejar el funcionamiento de los datos

    const [date, setDate] = useState(router.query.Fecha || new Date());
    const [turno, setTurno] = useState(router.query.ClaTurno || 0);
    const [errorMsg, setErrorMsg] = useState(null);
    const [openModals, setOpenModals] = useState({"error": true,"orders": false, "pnc": false, "add": false, "delete": false, "selectProduct": false})
    const [isLoaded, setIsLoaded] = useState(false);
    const [isOpen, setIsOpen] = useState(true);
    const [production, setProduction] = useState([]);
    const [productionFiltered, setProductionFiltered] = useState([]);
    const [status, setStatus] = useState(200);
    const [turnos, setTurnos] = useState([]);
    const [addOrDelete, setAddOrDelete] = useState(0);
    const [selectedOrder, setSelectedOrder] = useState({IdOrder: 'All', NomOrder: 'All'});
    const [modalBodyMsg, setModalBody] = useState([])
    const [active, setActive] = useState(0);
    const [disableButton, setDisableButton] = useState(true)
    const [ordenes, setOrdenes] = useState([]);
    const [config, setConfig] = useConfigContext();
    const [selectData, setSelectedData] = useState([])
    const [EsPNC, setEsPNC] = useState(0);
    const { t } = useTranslation('cu171_bp');
    /**
     * Titulo de pagina
     */
    const { header, setHeader } = useHeaderContext();
   
    const ParametrosConsutla = `?ClaTurno=${turno}&Fecha=${date}`;
    
    const [EsRedireccion] = useState(router.query.EsRedireccion ||0);



    let selectedData = [];


    var dateFormatted = new Date(date)
    //constante para almacenar el estado actual
    //de la navegación del turno en el cliente.
    const ModalError = ({isOpen, setIsOpen, status, setStatus, Text_modalbody}) => {

        return(
            <div className='modal d-block bg-dark bg-opacity-80' tabIndex="1" onClick={() => {setStatus(200), setOpenModals({"orders": false, "pnc": false, "add": false, "delete": false, "selectProduct": false})}}>
                <div className="modal-dialog" role="document">
                    <div className="modal-content text-center">
                        <div className="modal-header">
                            <h5 className="modal-title">Error</h5>
                            <button type="button" className="btn-close" onClick={() => { setStatus(200), setOpenModals({"orders": false, "pnc": false, "add": false, "delete": false, "selectProduct": false})}} aria-label="Close">
                            </button>
                        </div>
                    <div className="modal-body">
                        <p>{Text_modalbody}</p>
                    </div>
                        <div className="modal-footer d-flex justify-content-center">
                            <button type="button" className="btn btn-primary btn-lg mx-5 global_btn_primary" onClick={() => {setStatus(200), setOpenModals({"orders": false, "pnc": false, "add": false, "delete": false, "selectProduct": false})}}>{t('Close')}</button>
                        </div>
                    </div>
                </div>
            </div>
        )
    }
    
    //Modal para confirmación de evaluación de PNC
    const ModalPNC =({openModals, setOpenModals, url, selectData, setSelectedData, production, setErrorMsg, errorMsg, setProduction, productionFiltered, setProductionFiltered,  host, status, setStatus ,EsPNC, Text_modaltitle, Text_modalbody}) =>{
        
        return(
            <div className='modal d-block bg-dark bg-opacity-80' tabIndex="1">
                <div className="modal-dialog" role="document">
                    <div className="modal-content text-center">
                        <div className="modal-header">
                            <h5 id="modalTitle" className="modal-title">{Text_modaltitle}</h5>
                            <button type="button"  className="btn-close" onClick={() => {setOpenModals({"orders": false, "pnc": false, "add": false, "delete": false, "selectProduct": false})}} aria-label="Close">
                            </button>
                        </div>
                    <div className="modal-body">
                        <p id="modalBody" >{Text_modalbody}</p>
                    </div>
                        <div className="modal-footer d-flex justify-content-center">
                            <button type="button" id="btnClose" className="btn btn-primary btn-lg mx-5 global_btn_secondary" onClick={() => {setOpenModals({"orders": false, "pnc": false, "add": false, "delete": false, "selectProduct": false}),setStatus(200)}}>{t('Cancel')}</button>
                            <button type="button" id="btnAccept" className="btn btn-primary btn-lg mx-5 global_btn_primary" onClick={() => 
                                {fetchData(host,url,'PUT',null,null,CUPag)
                                    .then(async(res) => {
                                        let codeStatus = res.status
                                        let data = await res.json()
                                        
                                        switch (codeStatus) {
                                            case 200:                        
                                                var indexProductionFiltered = null
                                                var indexProduction = null
                                                selectData.forEach(function(IdRegistro) {
                                                    indexProduction = production.findIndex(row =>  row.IdRegistro === IdRegistro),
                                                    indexProductionFiltered = productionFiltered.findIndex(row =>  row.IdRegistro === IdRegistro),
                                                    production[indexProduction].Status = EsPNC == 0 ? 'Good' : 'Rejected'
                                                    productionFiltered[indexProductionFiltered].Status = EsPNC == 0 ? 'Good' : 'Rejected'
                                                })
                                                setProduction(production)
                                                setProductionFiltered(productionFiltered)
                                                
                                                setOpenModals({"orders": false, "pnc": false, "add": false,"delete": false, "selectProduct": false})         
                                                break;
                                            case 500:
                                                setErrorMsg(data.msg+ " \n " +JSON.stringify(data.error))
                                                selectData.splice(0)
                                                setOpenModals({"orders": false, "pnc": false, "add": false, "delete": false, "selectProduct": false})
                                                setStatus(codeStatus)                    
                                                break;
                                            case 401: 
                                                router.push("/login")
                                                break;
                                            case 400:
                                            default:
                                                setErrorMsg(data.msg)
                                                selectData.splice(0)
                                                setOpenModals({"orders": false, "pnc": false, "add": false, "delete": false, "selectProduct": false})
                                                setStatus(codeStatus)
                                                break;
                                        }
                                    }).catch((error) => {
                                        setSelectedData([])
					selectData.splice(0)
                                        setErrorMsg("Report error to administrator."+"\n" + error.toString())
                                        setStatus(null)
                                    })}}>Ok</button>
                        </div>
                    </div>
                </div>
                
            </div>
        )
    }
    
    //Modal para mostrar todas las ordenes
    //y filtrar por una o por todas.
    const ModalOrders = ({openModals, selectedOrder, setSelectedOrder, setOpenModals, url, ordenes, setOrdenes, selectData, setSelectedData,  production, productionFiltered, setProductionFiltered, status, setStatus , Text_modaltitle, Text_modalbody}) => {
    //const [ordenesState, setOrdenesState] = useState(data) 
        return(
            <div className='modal d-block bg-dark bg-opacity-80' tabIndex="1">
                <div className="modal-dialog" role="document">
                    <div className="modal-content">
                        <div className="modal-header">
                            <h5 className="modal-title">{Text_modaltitle}</h5>
                            <button type="button" className="btn-close" onClick={() => {setOpenModals({"orders": false, "pnc": false, "add": false, "delete": false, "selectProduct": false})}} aria-label="Close">
                            </button>
                        </div>
                    <div className="modal-body">
                            <table className={`table border border-5 mt-5`}>
                                <thead>
                                    <tr className="text-left">
                                        <th className="col">
                                            <span>{t('Orders')}</span>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody className="text-center">
                                    <tr style={{backgroundColor: selectedOrder.IdOrder == "All" ? '#172d46': 'white' , color: selectedOrder.IdOrder == "All" ? 'white': 'black'}} key={0}>
                                        <td>
                                            <span role="button" onClick={() => {setSelectedOrder({IdOrder: 'All', NomOrder: 'All'}),setProductionFiltered(production), setOpenModals({"orders": false, "pnc": false, "add": false, "delete": false, "selectProduct": false}),setSelectedData([])}}>
                                                All
                                            </span>
                                        </td>
                                    </tr>
                                    
                                    {Object.keys(ordenes).map((i) => (
                                            
                                        <tr style={{backgroundColor: selectedOrder.IdOrder == ordenes[i]["IdOrder"] ? '#172d46': 'white' , color: selectedOrder.IdOrder == ordenes[i]["IdOrder"] ? 'white': 'black'}} onClick={() => {setProductionFiltered(production.filter(row => row.IdOrder == ordenes[i]["IdOrder"])), setSelectedOrder({'IdOrder': ordenes[i]["IdOrder"], 'NomOrder': ordenes[i]["NomOrder"]}) ,setOpenModals({"orders": false, "pnc": false, "add": false, "delete": false, "selectProduct": false}), setSelectedData([])}} key={ordenes[i]["IdOrder"]}>
                                            <td>
                                                <span >{ordenes[i]["NomOrder"] +' '+ ordenes[i]["Item"]}</span>
                                            </td>
                                        </tr>
                                    
                                    ))}
                                </tbody>
                            </table>
                    </div>
                        <div className="modal-footer d-flex justify-content-center">
                            <button type="button" className="btn btn-primary btn-lg mx-5 global_btn_secondary" onClick={() => {setOpenModals({"orders": false, "pnc": false, "add": false, "delete": false, "selectProduct": false})}}>{t('Cancel')}</button>
                        </div>
                    </div>
                </div>
            </div>
        )
    }
    
    const ModalAdd = () =>{
        const[quantity, setQuantity] = useState('0')
        const[addToOrder, setAddToOrder] = useState({"Item": null, "NomOpm": null, "IdOrden": null})
        const[codeStatusRes, setCodeStatus] = useState(200);
        const[goodOrReject, setGoodOrReject] = useState(0);
        const[loadProductQuantity, setLoadProductQuantity] = useState(false)
        const handleClickAddReduceProduct = (e, operation) => {
            var inputQuantity = document.getElementById('productQuantity');
            const operations = {"add": parseInt(quantity) + 1, "reduce": quantity == 0 ? 0 : parseInt(quantity) -1 }
            setQuantity(operations[operation])
            inputQuantity.value = operations[operation]
        }
    
        const sendAddProduct = () => {
    
            
    
            return(
                <div className='modal d-block bg-dark bg-opacity-80' tabIndex="1">
                    <div className="modal-dialog" role="document">
                        <div className="modal-content">
                            <div className="modal-header">
                                <h2 className="modal-title">{t('selectQuantity')}</h2>
                                <button type="button" className="btn-close" onClick={() => setLoadProductQuantity(false)} aria-label="Close">
                                </button>
                            </div>
                        <div className="modal-body justify-content-center">
                            <div className="row justify-content-center">
                                <h4 className="title text-center">{addToOrder.NomOpm+""+addToOrder.Item}</h4>
                            </div>
                            <div className="row justify-content-center mt-5">
                                <div className="col-4 d-flex justify-content-center">
                                    <Image className={`searchItem`} onClick={(e) => handleClickAddReduceProduct(e, 'reduce')} alt="reduce" src={Reduce} width={60} height={60}/>
                                </div>
                                <div className="col-4 d-flex justify-content-center">
                                    <input id={'productQuantity'} defaultValue={quantity} type="number" className={`form-control text-center ${styles.numberNav}`} onChange={(e) => setQuantity(e.target.value)} onKeyDown={(e) => {["e", "E", "+",".", "-"].includes(e.key) && e.preventDefault()}}></input>
                                </div>
                                <div className="col-4 d-flex justify-content-center">
                                    <Image className={`searchItem`} alt="add" src={AddProduct} width={60} height={60} onClick={(e) => handleClickAddReduceProduct(e, 'add')}/>
                                </div>
                            </div>
                            <div className="row justify-content-center mt-5">
                                <div className='col d-flex justify-content-center'>
                                    <button value={0} className={`${goodOrReject === 0 ? "active" : undefined} shift btn btn-outline-dark ${styles.buttons}`} onClick={(e) => {setGoodOrReject(0)}}>{t('Good')}</button>
                                </div>
                                <div className='col d-flex justify-content-center'>
                                    <button value={1} className={`${goodOrReject === 1 ? "active" : undefined} shift btn  btn-outline-dark ${styles.buttons}`} onClick={(e) => {setGoodOrReject(1)}}>{t('Rejected')}</button>
                                </div>
                            </div>
                        </div>
                            <div className="modal-footer d-flex justify-content-center">
                                <button type="button" className="btn btn-primary btn-lg mx-5 global_btn_secondary" onClick={() => setLoadProductQuantity(false)}>{t('Cancel')}</button>
                                {quantity > 0 && <button type="button" className="btn btn-primary btn-lg mx-5 global_btn_primary" onClick={() => {
                                    fetchData(config.Api+"produccion/agregarUnidades",'','POST',
                                    JSON.stringify({
                                        ClaUbicacion: config.ClaUbicacion,
                                        Idioma: config.Idioma,
                                        Cantidad: quantity,
                                        IdOrden: addToOrder.IdOrden,
                                        ClaTurno: turno,
                                        FechaAdm: date,
                                        EsPNC: goodOrReject                                  
                                    
                                    }),
                                    null,
                                    CUPag
                                    )
                                    .then(async(res) => {
                                        let codeStatus = res.status
                                        let data = await res.json()
                                        switch (codeStatus) {
                                            case 200:   
                                                setLoadProductQuantity(null)
                                                selectData.splice(0)
                                                setOpenModals({"orders": false, "pnc": false, "add": false, "delete": false, "selectProduct": false})
                                                setProductionFiltered(data.result)                     
                                                break;
                                            case 500:
                                                setLoadProductQuantity(false)
                                                setStatus(codeStatus)
                                                selectData.splice(0)
                                                setOpenModals({"orders": false, "pnc": false, "add": false, "delete": false, "selectProduct": false})
                                                setErrorMsg(data.msg+ " \n " +JSON.stringify(data.error))                
                                                break;
                                                
                                            case 401: 
                                                router.push("/login")
                                                break;
                                            case 400:
                                            default:
                                                setLoadProductQuantity(false)
                                                setStatus(codeStatus)
                                                selectData.splice(0)
                                                setOpenModals({"orders": false, "pnc": false, "add": false, "delete": false, "selectProduct": false})
                                                setErrorMsg(data.msg)
                                                break;
                                        }
                                    }).catch((error) => {
                                        setErrorMsg("Report error to administrator."+"\n" + error.toString())
                                        setStatus(null)
                                        selectData.splice(0)
                                        setOpenModals({"orders": false, "pnc": false, "add": false, "delete": false, "selectProduct": false})
                                        setLoadProductQuantity(false)
                                    })
                                }}>{t('Add')}</button>}
                            </div>
                            </div>
                    </div>
                </div>
            )
        }
    
        return(
            <div id='selectOrder' className='modal d-block bg-dark bg-opacity-80' tabIndex="1">
                <div className="modal-dialog" role="document">
                    <div className="modal-content">
                        <div className="modal-header">
                            <h5 className="modal-title">{t('selectOrder')}</h5>
                            <button type="button" className="btn-close" onClick={() => {setOpenModals({"orders": false, "pnc": false, "add": false, "delete": false, "selectProduct": false})}} aria-label="Close">
    
                            </button>
                        </div>
                    <div className="modal-body">
                            <table className={`table border border-5 mt-5`}>
                                <thead>
                                    <tr className="text-left">
                                        <th className="col">
                                            <span>{t('Code')}</span>
                                        </th>
                                        <th className="col">
                                            <span>{t('Item')}</span>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody className="text-left">
                                    {Object.keys(ordenes).map((i) => (
                                            
                                        <tr onClick={() => {setLoadProductQuantity(true), setAddToOrder({"Item": ordenes[i]["Item"] ,"NomOpm":ordenes[i]["NomOrder"], "IdOrden": ordenes[i]["IdOrder"]})}} key={ordenes[i]["IdOrder"]}>
                                            <td>
                                                <span role="button" >{ordenes[i]["NomOrder"]}</span>
                                            </td>
                                            <td>
                                                <span role="button">{ordenes[i]["Item"]}</span>
                                            </td>
                                        </tr>
                                    
                                    ))}
                                </tbody>
                            </table>
                    </div>
                        <div className="modal-footer d-flex justify-content-center">
                            <button type="button" className="btn btn-primary btn-lg mx-5 global_btn_secondary" onClick={() => {setOpenModals({"orders": false, "pnc": false, "add": false, "delete": false, "selectProduct": false})}}>{t('Cancel')}</button>
                        </div>
                    </div>
                </div>
                {loadProductQuantity  && sendAddProduct()}
            </div>
        )
    }
    
    const ModalDelete = ({openModals, setOpenModals, url, selectData, setSelectedData, production, setErrorMsg, errorMsg, setProduction, productionFiltered, setProductionFiltered, host, status, setStatus ,EsPNC, Text_modaltitle, Text_modalbody}) =>{
        
        
        const[codeStatusRes, setCodeStatus] = useState(200);
       
    
        return(
            <div className='modal d-block bg-dark bg-opacity-80' tabIndex="1">
                <div className="modal-dialog" role="document">
                    <div className="modal-content text-center">
                        <div className="modal-header">
                            <h5 id="modalTitle" className="modal-title">{Text_modaltitle}</h5>
                            <button type="button"  className="btn-close" onClick={() => {setOpenModals({"orders": false, "pnc": false, "add": false, "delete": false, "selectProduct": false})}} aria-label="Close">
                            </button>
                        </div>
                    <div className="modal-body">
                        <p id="modalBody" >{Text_modalbody}</p>
                    </div>
                        <div className="modal-footer d-flex justify-content-center">
                            <button type="button" id="btnClose" className="btn btn-primary btn-lg mx-5 global_btn_secondary" onClick={() => {setOpenModals({"orders": false, "pnc": false, "add": false, "delete": false, "selectProduct": false}),setStatus(200)}}>{t('Cancel')}</button>
                            <button type="button" id="btnAccept" className="btn btn-primary btn-lg mx-5 global_btn_primary" onClick={() => 
                                {fetchData(host,url,'DELETE')
                                    .then(async(res) => {
                                        let codeStatus = res.status
                                        let data = await res.json()
                                        switch (codeStatus) {
                                            case 200:
                                                var indexProductionFiltered = null
                                                var indexProduction = null
                                                selectData.forEach(function(IdRegistro) {
                                                    indexProduction = production.findIndex(row =>  row.IdRegistro === IdRegistro),
                                                    indexProductionFiltered = productionFiltered.findIndex(row =>  row.IdRegistro === IdRegistro),
                                                    indexProduction != -1  ? production.splice(indexProduction,1) : 'Skip',
                                                    indexProductionFiltered != -1  ? productionFiltered.splice(indexProductionFiltered,1) : 'Skip'
                                                })
                                                setProductionFiltered(productionFiltered)
                                                setProduction(production)
                                                selectData.splice(0)
                                                setOpenModals({"orders": false, "pnc": false, "add": false, "delete": false, "selectProduct": false})
                                                setStatus(codeStatus)                                                                        
                                                break;
                                            case 500:
                                                setErrorMsg(data.msg+ " \n " +JSON.stringify(data.error))
                                                selectData.splice(0)    
                                                setOpenModals({"orders": false, "pnc": false, "add": false, "delete": false, "selectProduct": false})
                                                setStatus(codeStatus)           
                                                break;
                                            case 401: 
                                                router.push("/login")
                                                break;
                                            case 400:
                                            default:
                                                setErrorMsg(data.msg)
                                                selectData.splice(0)
                                                setOpenModals({"orders": false, "pnc": false, "add": false, "delete": false, "selectProduct": false})
                                                setStatus(codeStatus)
                                                break;
                                        }
                                        
                                    }).catch((error) => {
                                        setErrorMsg("Report error to administrator."+"\n" + error.toString())
                                        selectData.splice(0)
                                        setOpenModals({"orders": false, "pnc": false, "add": false, "delete": false, "selectProduct": false})
                                        setStatus(null)
                                    })}}>Ok</button>
                                    
                                    
                        </div>
                    </div>
                </div>
            </div>
        )
    }

    const activeOperations = {
        "previous": active <= 0 && turnos != null ? turnos.length - 1 : parseInt(active) - 1,
        "next": active >= turnos.length - 1  && turnos != null ? 0 : parseInt(active) + 1
    }
    //constante para navegar entre fechas a la par de los turnos transcurridos.
    const dateOperations = {
        "previous": active == 0 ? new Date(dateFormatted.setDate(dateFormatted.getDate() - 1)) : new Date(date) ,
        "next": active == turnos.length - 1  ?  new Date(dateFormatted.setDate(dateFormatted.getDate() + 1)) : new Date(date)
    }

    //metodo para filtrar datos desde otro caso de uso
    //caso practico para resumen de producción
    function filterData(shift, fechaAdmScada, Order){
        setProductionFiltered(production.filter(row => row.NomOrder = Order))
        setTurno(shift)
        setDate(fechaAdmScada)
    }
    //Handle manejador del evento click
    function handleClick(e){
        
        fetchData(config.Api+"produccion/detalle","?ClaUbicacion="+config.ClaUbicacion+"&ClaTurno="+turno+"&Idioma="+config.Idioma+"&FechaAdmScada="+date,'GET',null,null,CUPag)
            .then(async(res) => {
                let codeStatus = res.status
                let data = await res.json()

                switch (codeStatus) {
                    case 200:    
                        let orders = data.production.filter(
                            (obj, index) =>
                            data.production.findIndex((item) => item.IdOrder === obj.IdOrder) === index
                        );
                        setSelectedOrder({IdOrder: 'All', NomOrder: 'All'})
                        setOrdenes(orders)
                        setProduction(data.production)
                        selectData.splice(0)
                        setProductionFiltered(data.production)                    
                        break;
                    case 500:
                        setErrorMsg(data.msg+ " \n " +JSON.stringify(data.error))
                        selectData.splice(0)  
                        setStatus(codeStatus)              
                        break;
                    case 401: 
                        router.push("/login")
                        break;
                    case 403:
                        router.push("/accessDenied");
                        break;
                    case 400:
                    default:
                        setErrorMsg(data.msg)
                        selectData.splice(0)
                        setStatus(codeStatus)
                        break;
                }
            }).catch((error) => {
                setErrorMsg("Report error to administrator."+"\n" + error.toString())
                selectData.splice(0)
                setStatus(null)
            }) 
        

    }

//selector para activar los checkbox del documento
    async function handleClickCheckBox(e, data){
        
        //variable para almacenar todos los elementos de tipo checbox
        
        var checkBoxes = document.getElementsByClassName('form-check-input')
        
        if(disableButton){
            data.forEach(rowData => selectData.push(rowData.IdRegistro));
            setDisableButton(false)
            for(var x = 0; x < checkBoxes.length; x++){
                checkBoxes[x].checked = true
            }
        }else{
            setSelectedData([])
            setDisableButton(true)
            for(var x = 0; x < checkBoxes.length; x++){
                checkBoxes[x].checked = false
            }
            
        }
    }

    //Manejador de click para los iconos de navegación.
    const handleClickShifts = async(operation) => {
        //almacenar turno seleccionado
        setDate(dateOperations[operation]);
        fetchData(config.Api+"produccion/detalle","?ClaUbicacion="+config.ClaUbicacion+"&ClaTurno="+turnos[activeOperations[operation]].ClaTurno+"&Idioma="+config.Idioma+"&FechaAdmScada="+(dateOperations[operation]),'GET',null,null,CUPag)
            .then(async(res) => {
                let codeStatus = res.status
                let data = await res.json()

                switch (codeStatus) {
                    case 200: 
                        let orders = data.production.filter(
                            (obj, index) =>
                            data.production.findIndex((item) => item.IdOrder === obj.IdOrder) === index
                        );
                        
                        setOrdenes(orders)
                        setSelectedOrder({IdOrder: 'All', NomOrder: 'All'})
                        setProduction(data.production)
                        selectData.splice(0)
                        setProductionFiltered(data.production)                       
                        break;
                    case 500:
                        setErrorMsg(data.msg+ " \n " +JSON.stringify(data.error))
                        selectData.splice(0)   
                        setStatus(codeStatus)             
                        break;
                    case 401: 
                        router.push("/login")
                        break;
                    case 403:
                        router.push("/accessDenied");
                        break;
                    case 400:
                    default:
                        setErrorMsg(data.msg)
                        selectData.splice(0)
                        setStatus(codeStatus)
                        break;
                }
            }).catch((error) => {
                setErrorMsg("Report error to administrator."+"\n" + error.toString())
                selectData.splice(0)
                setStatus(null)
            })
        setActive(activeOperations[operation]);
        setTurno(turnos[activeOperations[operation]].ClaTurno);
    }

    //Manejador de recarga al enviar datos
    async function handleReload(){
        var checkBoxAll = document.getElementById('All')
        if(selectData.length == 0 && isLoaded){
            setDisableButton(true)
            checkBoxAll.checked = false
            var checkBoxes = document.getElementsByClassName('form-check-input')
            for(var x = 0; x < checkBoxes.length; x++){
                checkBoxes[x].checked = false
            }
            
        }
        
        
    }

    
    //Obtener los elementos HTML por ID
    function getElement(id){
        var elementObj = document.getElementById(id)
        return elementObj.checked
    }
    function setCheckElement(id, value){
        var elementObj = document.getElementById(id)
        return elementObj.checked = value
        
    }

    setHeader({...header,Titulo:t('pageTitle')})

    //Hooke manejador de eventos
    useEffect(() => {
        
        cargarInfo();
        const interval = setInterval(() => {
            cargarInfo(true);
        }, 30000);
        return () => clearInterval(interval);
        //Llamar al metodo de backend para obtener las ordenes
        //setTimeout(() => {
            //llamar al metodo del backend para obtener el detalle de la producción
           
            
        //}, 3000)
            
    },[SelectedIdWorkCenter,turno,date])

    useEffect(() => {
        handleReload()
        
     },[selectData])

     const cargarInfo = (hideSpinner) => {
        fetchData(config.Api+"produccion/detalle","?ClaUbicacion="+config.ClaUbicacion+"&ClaTurno="+turno+"&Idioma="+config.Idioma+"&FechaAdmScada="+date,'GET',null,hideSpinner ? hideSpinner: !isLoaded,CUPag)
        .then(async(res) => {
            let codeStatus = res.status
            let data = await res.json()

            switch (codeStatus) {
                case 200:    
                    let orders = data.production.filter(
                        (obj, index) =>
                        data.production.findIndex((item) => item.IdOrder === obj.IdOrder) === index
                    );
                    
                    setOrdenes(orders)
                    selectData.splice(0)
                    setProduction(data.production)
                    setProductionFiltered(data.production)                    
                    break;
                case 500:
                    setErrorMsg(data.msg+ " \n " +JSON.stringify(data.error))
                    selectData.splice(0)
                    setStatus(codeStatus)               
                    break;
                case 401: 
                    router.push("/login")
                    break;
                case 403:
                    router.push("/accessDenied");
                    break;
                case 400:
                default:
                    setErrorMsg(data.msg)
                    selectData.splice(0)
                    setStatus(codeStatus)
                    break;
            }

        }).catch((error) => {
            setErrorMsg("Report error to administrator."+"\n" + error.toString())
            selectData.splice(0)
            setStatus(null)
        })
        //llamar al método de backend para obtener los turnos, el turno actual y la fecha adm scada actual
        if(turnos.length == 0){
            fetchData(config.Api+"turnos","?ClaUbicacion="+config.ClaUbicacion+"&Idioma="+config.Idioma+"&FechaAdmScada="+new Date().getFullYear() + "-" +("00" + (new Date().getMonth() + 1)).slice(-2) + "-" +("00" +new Date().getDate()).slice(-2),'GET',null,hideSpinner ? hideSpinner : isLoaded)
            .then(async(res) => {
                let codeStatus = res.status
                let data = await res.json()

                switch (codeStatus) {
                    case 200:    
                        setTurnos(data.turnos)
                        var indiceTurnoActual = turno == 0 ? data.turnos.findIndex((item) => item.EsActual == 1) : data.turnos.findIndex((item) => item.ClaTurno == turno)
                        setActive(indiceTurnoActual)
                        if(!turno || !date){
                            setTurno(data.turnos[indiceTurnoActual].ClaTurno)
                                setDate(new Date(data.turnos[0].FechaAdministrativa+' 00:00:00'))
                        }
                        selectData.splice(0)
                        setIsLoaded(true)                    
                        break;
                    case 500:
                        setErrorMsg(data.msg+ " \n " +JSON.stringify(data.error))
                        selectData.splice(0)
                        setStatus(codeStatus)              
                        break;
                    case 401: 
                        router.push("/login")
                        break;
                    case 400:
                    default:
                        setErrorMsg(data.msg)
                        selectData.splice(0)
                        setStatus(codeStatus)
                        break;
                }

            }).catch((error) => {
                setErrorMsg("Report error to administrator."+"\n" + error.toString())
                selectData.splice(0)
                setStatus(null)
                setSelectedData([])
            })
        }else if(isLoaded){
            setSelectedOrder({IdOrder: 'All', NomOrder: 'All'})
            var checkBoxAll = document.getElementById('All')
            checkBoxAll.checked =  false
        }
     }
   
if(status == 200 && isLoaded){
    
    return(

        <>
            <div className="row">
                
                { //Si viene de una redireccion mostrar boton de return
                EsRedireccion ? 
                    <Link className="btn btn-outline-dark col-2 ms-3" href={`/CU151_Production_Summary_Visualization/CU151_Pag3_Production_Summary_Visualization${ParametrosConsutla}`}>{t('Return')}</Link>
                :   
                    null

                } 
            </div>
            <div className="row">
                <div className={`col-3 d-flex justify-content-center align-items-center`}>
                    <InputFecha className='date' setDate={setDate} date={new Date(date)}/>
                </div>
                <div className="col-9 d-flex justify-content-center">
                    <ShiftGrid turno={turno} setTurno={setTurno} active={active === undefined ? 0 : active} setActive={setActive} turnos={turnos} setTurnos={setTurnos} date={date} setDate={setDate}/>
                    <Image className={`previousShift m-auto p-0 ${styles.navitems}`} alt="previousImage" src={previous} width={50} height={50} onClick={async(e) => {await handleClickShifts("previous")}}/>
                    <Image className={`nextShift m-auto p-0 ${styles.navitems}`} alt="nextImage" src={next} width={50} height={50} onClick={async(e) => {await handleClickShifts("next")}}/>
                    <Image className={`searchItem m-auto p-0  ${styles.navitems}`} alt="searchImage" src={search} width={50} height={50} onClick={(e) => handleClick()}/>
                
                </div>
                

            </div>
            <div className="row">
                <div className="col-3 d-flex flex-row mt-5">
                    <button type="button" className={`btn border-primary global_btn_primary ${styles.button}`} onClick={() => setOpenModals({"orders": true, "pnc": false, "add": false, "delete": false, "selectProduct": false})}><Image className={`p-1`} alt="orders" src={order} width={26} height={26}/> {selectedOrder.NomOrder}</button>
                </div>
                <div className="col-9 d-flex flex-row-reverse mt-5">
                    <button type="button" className={`btn btn-primary global_btn_primary ${styles.button}`} onClick={() => {setOpenModals({"orders": false, "pnc": false, "add": true,  "delete": false,"selectProduct": false}), setModalBody(t('Set')+" "+selectData.length+" unit/s as good production?"), setAddOrDelete(0)}}> <Image className={`searchItem m-auto p-1`} alt="add" src={add} width={26} height={26}/>{t('Add')}</button>
                
                    { production.length > 0 &&
                        
                        <>
                            <button type="button" hidden={disableButton} className={`btn btn-primary global_btn_primary ${styles.button}`} onClick={() => {setOpenModals({"orders": false, "pnc": false, "add": false, "delete": true, "selectProduct": false}), setModalBody(t('Delete')+" "+selectData.length+" "+t('unit/s')+"?"), setAddOrDelete(1)}}><Image className={`searchItem m-auto p-1`} alt="delete" src={eliminar} width={26} height={26}/>{t('Delete')}</button>
                    
                            <button type="button" hidden={disableButton} className={`btn btn-primary global_btn_primary ${styles.button}`} onClick={() => {setOpenModals({"orders": false, "pnc": true, "add": false, "delete": false, "selectProduct": false}), setModalBody(t('Set')+" "+selectData.length+" "+t('unitAsGoodProduccion')+"?"), setEsPNC(0)}}><Image className={`searchItem m-auto p-1`} alt="good" src={good} width={26} height={26}/>{t('Good')}</button>
                    
                            <button type="button" hidden={disableButton} className={`btn btn-primary global_btn_primary ${styles.button}`} onClick={() => {setOpenModals({"orders": false, "pnc": true, "add": false, "delete": false, "selectProduct": false}), setModalBody(t('Set')+" "+selectData.length+" "+t('unitAsRejectedProduction')+"?"), setEsPNC(1)}}><Image className={`searchItem m-auto p-1`} alt="reject" src={reject} width={26} height={26}/>{t('Reject')}</button>
                        </>
                    }
                </div>
            </div>
            
                    <div className={`${styles.table}`}>
			<Tabla
                        	datos={Object.values(productionFiltered)}
                        	columnas={[
                            	{ Select: t("select") },
                            	{ 'Unit#': t("unit#") },
                            	{ NomOrder: t("Order") },
                            	{ Item: t("Item") },
                            	{ Date: t("Date") },
                            	{ Duration: t("Duration") },
                            	{ Status: t("Status") },
                        	]}
                        	selectData={selectData}
                        	setSelectedData={setSelectedData}
                        	disableButton={disableButton}
                        	setDisableButton={setDisableButton}
                    	/>
                        /*<table className={`table text-center`}>
                            <thead  className={`${styles.tableHeader}`}>
                                    <tr key={0}>
                                        <th className="col justify-content-center">
                                            <input id='All' type="checkbox" className={`form-check-input ${styles.checkbox}`} onClick={(e) => {handleClickCheckBox(e, productionFiltered)}}></input>
                                        </th>
                                        <th className="col">
                                            <span>{t('unit#')}</span>
                                        </th>
                                        <th className="col">
                                            <span>{t('Order')}</span>
                                        </th>
                                        <th className="col d-none d-lg-table-cell d-xl-none-table-cell">
                                            <span>{t('Item')}</span>
                                        </th>
                                        <th className="col">
                                            <span>{t('Date')}</span>
                                        </th>
                                        <th className="col">
                                            <span>{t('Duration')}</span>
                                        </th>
                                        <th className="col">
                                            <span>{t('Status')}</span>
                                        </th>
                                    </tr>
                            </thead>
                            <tbody className={`${styles.tableBody}`}>
                                    
                                    {Object.keys(productionFiltered).map((i) => (
                                        
                                        <tr key={productionFiltered[i]["IdRegistro"]}>
                                            <td>
                                                <input id={productionFiltered[i]["IdRegistro"]} onChange={(e) => {getElement(productionFiltered[i]["IdRegistro"]) == true ? selectData.push(productionFiltered[i]["IdRegistro"]) : selectData.splice(selectData.findIndex((row) => row == productionFiltered[i]["IdRegistro"]),1), selectData.length == 0 ? setDisableButton(true) : setDisableButton(false), setCheckElement('All',selectData.length == 0 ? false : true)}} type="checkbox"  className={`form-check-input ${styles.checkbox}`}></input>
                                            </td>
                                            <td>
                                                <p>{productionFiltered[i]["Unit#"] == null || productionFiltered[i]["Unit#"] == '' ? 'Pendiente' : productionFiltered[i]["Unit#"]}</p>
                                            </td>
                                            <td>
                                                <p>{productionFiltered[i]["NomOrder"] == null || productionFiltered[i]["NomOrder"] == '' ? 'Pendiente'  : productionFiltered[i]["NomOrder"]}</p>
                                            </td>
                                            <td className="d-none d-lg-table-cell d-xl-none-table-cell">
                                                <p>{productionFiltered[i]["Item"] == null || productionFiltered[i]["Item"] == '' ? 'Pendiente' : productionFiltered[i]["Item"]}</p>
                                            </td>
                                            <td>
                                                <p>{productionFiltered[i]["Date"] == null || productionFiltered[i]["Date"] == '' ? 'Pendiente' : productionFiltered[i]["Date"]}</p>
                                            </td>
                                            <td>
                                                <p>{productionFiltered[i]["Duration"] == null || productionFiltered[i]["Duration"] == '' ? '0s' : productionFiltered[i]["Duration"]}</p>
                                            </td>
                                            <td>
                                                <p>{productionFiltered[i]["Status"] == null || productionFiltered[i]["Status"] == '' ? 'Good' : productionFiltered[i]["Status"]}</p>
                                            </td>
                                        </tr>
                                
                                    ))}
                            </tbody>
                        </table>*/
                    </div>
            
            {openModals["orders"] && <ModalOrders ordenes={ordenes} setOrdenes={setOrdenes} selectedOrder={selectedOrder} setSelectedOrder={setSelectedOrder} data={ordenes} selectData={selectData} setSelectedData={setSelectedData} production={production} productionFiltered={productionFiltered} setProductionFiltered={setProductionFiltered} openModals={openModals} setOpenModals={setOpenModals} Text_modaltitle={t('selectOrder')} />}
            {openModals["pnc"] && <ModalPNC selectData={selectData} setSelectedData={setSelectedData} EsPNC={EsPNC} production={production} stauts={status} setStatus={setStatus} setErrorMsg={setErrorMsg} errorMsg={errorMsg} productionFiltered={productionFiltered} setProductionFiltered={setProductionFiltered} setProduction={setProduction} host={config.Api+"produccion/evaluar"} url={"?ClaUbicacion="+config.ClaUbicacion+"&ClaTurno="+turno+"&EsPNC="+EsPNC+"&IdList="+selectData.toString()+"&Idioma="+config.Idioma+"&FechaAdmScada="+date} openModals={openModals} setOpenModals={setOpenModals} Text_modaltitle={t('Confirmation')} Text_modalbody={modalBodyMsg} />}
            {openModals["add"] && <ModalAdd />}
            {openModals["delete"] && <ModalDelete selectData={selectData} setSelectedData={setSelectedData} EsPNC={EsPNC} production={production} stauts={status} setStatus={setStatus} setErrorMsg={setErrorMsg} errorMsg={errorMsg} productionFiltered={productionFiltered} setProductionFiltered={setProductionFiltered}  setProduction={setProduction} host={config.Api+"produccion/eliminarUnidades"} url={"?ClaUbicacion="+config.ClaUbicacion+"&Unidades="+selectData.toString()+"&Idioma="+config.Idioma} openModals={openModals} setOpenModals={setOpenModals} Text_modaltitle={t('Confirmation')} Text_modalbody={modalBodyMsg} />}       
        </>

    )
}else if(status != 200){
    return(
        <>
            
                <ModalError status={status} setStatus={setStatus} Text_modalbody={errorMsg}/>
                
        </>
    )
}

}