import {useState,useEffect,useRef} from 'react'
import { useTranslation } from 'react-i18next';
import TextInput from './textinput'
export default function Select({ArrOptions,KeySelected,setValue,mode,isHeader=true,isMachineCombo=true,PlaceHolder=null}) {
    
   
    if (!ArrOptions || !ArrOptions.length || !ArrOptions[0].hasOwnProperty("value") || !ArrOptions[0].hasOwnProperty("text")) {
        throw new Error("ArrOptions is null or doesn't have the expected structure");
    }

    const { t } = useTranslation('select');
    const [options,setOptions] = useState(ArrOptions)
    const [selected,setSelected] = useState(searchSelected(KeySelected))
    
    const [isModalVisible,setIsModalVisible] = useState(false);

    const [searchInputValue,setSearchInputValue] = useState("");

    const searchInputRef = useRef(null);
    
    useEffect(()=>{
        if(searchInputRef.current){
            searchInputRef.current.focus()
        }

    })

    useEffect(()=>{
        if(!isHeader&&!isMachineCombo){
            setSelected(searchSelected(KeySelected))
            setOptions(ArrOptions)
        }
    },[ArrOptions,KeySelected,selected])

    useEffect(()=>{
        searchOptionsText(searchInputValue)
    },[searchInputValue])

    let selectComponent = null;

    /**
     * 
     * @param {*} selected 
     * @returns if selected option exists then returns that element of the array 
     * otherwise returns the first element of the array
     */
    function searchSelected (selected) {
        const selectedOption = ArrOptions.filter(option => option.value == selected)[0]

        if(!selectedOption){
            return options[0]
        }else{
            return selectedOption
        }

    }



    const OpenModalHandler = ()=>{
        setIsModalVisible(true)
    }

    const CloseModalHandler = () => {
        //indicar que el modal ya no esta visible 
        setIsModalVisible(false);
        
        //reestablecer las opciones originales
        setOptions(ArrOptions);
        
        //borrar input cuando se cierra
        setSearchInputValue("")
    }

    const CardClickHandler = (selected)=>{
        //modificar estado propio
        setSelected(ArrOptions.filter(option => option.value === selected)[0]);

        //notificar cambio de estado al padre
        setValue(selected) 
        //Cerrar modal despues de seleccionar
        CloseModalHandler();
    }

    const SelectButton = ({selected})=>{
        return (
            isHeader ? (
                <button type='button' 
                    className="btn btn-light text-nowrap  btn-lg fs-6 p-2"
                    onClick={()=>{OpenModalHandler()}}><strong>{selected.text}</strong>

                </button>
            ) : (
                <button type='button' 
                    className="btn btn-lg global_btn_primary fs-6 ms-2"
                    onClick={()=>{OpenModalHandler()}}>
                        <strong>{ (selected.text && KeySelected) ? selected.text : "Select Option"}</strong>
                </button>
            )
        )
    }

    /**
     * 
     * @param {*} options  
     * @returns list of cards for the given options with listener attached
     */
    const OptionsView = ({options})=>{
        return(
            options.map(option => {
                return(
                    
                        <div className={`card border-dark mb-3 ${ (option.value === selected.value) ? "global_bg_secondary" : "" }`} key={option.value} onClick={()=>{CardClickHandler(option.value)}}>
                            <div className="card-body text-center ">
                                <span className="global_txt_primary h3 text-center" >{option.text}</span>
                            </div>
                        </div>
                    
                )
            })
        )
    } 

    /**
     * 
     * @param {*} event  
     * process the search input and sets the options to the ones that match the input
     */
    const searchOptions = (event)=>{
        setSearchInputValue(event.target.value)
        const filterOption = ArrOptions.filter(
                option => {
                   return option.text.toUpperCase().includes(event.target.value.toUpperCase())
                    
                })

        if(filterOption){
            setOptions(filterOption)
        }else{
            setOptions([{value:null,text:t("NoResults")}])
        }
        searchInputRef.current.focus()
    }

    const searchOptionsText = (text)=>{
        setSearchInputValue(text)

        if(!ArrOptions || ArrOptions.length === 0){
            return
        }

        const filterOption = ArrOptions.filter(
                option => {
                   return option.text.toUpperCase().includes(text.toUpperCase())
                    
                })

        if(filterOption){
            setOptions(filterOption)
        }else{
            setOptions([{value:null,text:t("NoResults")}])
        }
        //searchInputRef.current.focus()
    }
    
    const SelectModal = ({options})=>{
        return (
            isModalVisible
              ? (
                <div className="modal d-block bg-dark bg-opacity-25" id="selectModal" tabIndex="-1">
                  <div className="modal-dialog  modal-dialog-scrollable">
                    <div className="modal-content text-center">
                    <div className="modal-header">
                        {/* <input ref={searchInputRef} className='form-control' value={searchInputValue} onChange={searchOptions}></input> */}
                        <TextInput typeInput={'Text'} inputValue={searchInputValue} setInputValue={setSearchInputValue} placeHolder = "Search" ></TextInput>
                    </div>
                      <div className="modal-body">
                        <OptionsView options={options} />
                      </div>
                      <div className="modal-footer">
                        <button type="button" className="btn btn-secondary global_btn_primary" onClick={()=>{CloseModalHandler()}}>{t("Cancel")}</button>
                      </div>
                    </div>
                  </div>
                </div>
              )
              : null
          );
    }

    
    //DETERMINAR QUE TIPO DE COMPONENTE VAMOS A RETORNAR

    switch (mode) {
        case 1: 
            selectComponent = <>
                                <SelectButton selected={selected}/>
                                <SelectModal options={options} />
                              </>
            break;
        case 2: 
            selectComponent = <>
                                <OptionsView options={options}></OptionsView>
                              </>  
            break;
        default: 
            throw new Error(`Param Mode = ${mode} not valid`);
        
    }
    
    return selectComponent


   
}

