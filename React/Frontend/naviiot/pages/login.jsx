
import { useState, useEffect } from 'react';
import { useConfigContext } from "@/utils/config"
import { fetchData } from '@/utils/fetch'
import { useTranslation } from 'react-i18next'
import ModalError from '@/components/modal'
import { useRouter } from 'next/router';
import Image from 'next/image'
import usericon from '@/assets/img/usericon.png'
import clock from '@/assets/img/clock.png'
import styles from '@/pages/CU1_Pag2_Login/CU1_Pag2_login.module.css'
import { useFooterContext } from '@/utils/footerCtx';
import ShiftPicker from '../components/shiftpicker';
import TextInput from '../components/textinput'
import MachineCombo from '@/components/machinecombo'
import { getCookieValue } from '@/utils/tools'
import { useHeaderContext } from "@/utils/headerCtx"

export default function CU1_Pag2_logout() {

    const router = useRouter();

    const [config, setConfig] = useConfigContext();
    const [footer, setFooter] = useFooterContext();
    const [errorMsg, setErrorMsg] = useState();
    const [status, setStatus] = useState(200);
    const [users, setUsers] = useState(null);
    const [usersFiltered, setUsersFiltered] = useState(null);
    const [loaded, setLoaded] = useState(false);
    const [openViews, setOpenViews] = useState({ 'otherUsers': false, 'shiftSelector': false, 'confirm': false, 'defaultMachine': true });
    const [selectedOptions, setSelectedOptions] = useState(null);
    const [userSearchInput, setUserSearchInput] = useState(null);
    const [UsertText, setUserText] = useState("");
    const [IdWorkCenterSeleccionadoModal, setIdWorkCenterSeleccionadoModal] = useState('');
    const [ComboMaquinaCargadoModal, setComboMaquinaCargadoModal] = useState(false);
    const [DefaultMachine, setDefaultMachine] = useState(null)
    const { header, setHeader } = useHeaderContext()



    const actualizaWorkCenterModal = (IdWorkCenter) => {
        if (IdWorkCenter) {
            setIdWorkCenterSeleccionadoModal(IdWorkCenter)
        }
    }


    const checkSession = async () => {

        fetchData(
            config.Api + "auth/sesion",
            "",
            'GET',
            null,
            true
        ).then(async (res) => {
            let codeStatus = res.status
            let data = res.json()
            switch (codeStatus) {
                case 200:
                    setStatus(codeStatus)
                    setFooter({ NombreUsuario: selectedOptions.username, Turno: selectedOptions.shiftname })
                    setOpenViews({ 'otherUsers': false, 'shiftSelector': false, 'confirm': false })
                    router.push('/cu153_production_prog/cu153_pag1_production_prog');
                    break;
                case 500:
                    setErrorMsg(data.msg + " \n " + JSON.stringify(data.error))
                    setStatus(codeStatus)
                    break;
                case 401:
                    //do nothing
                    break;
                case 400:
                default:
                    setErrorMsg(data.msg)
                    setStatus(codeStatus)
                    break;
            }
        }).catch((error) => {
            setErrorMsg("Report error to administrator." + "\n" + error.toString())
            setStatus(null)
        });
    }

    const handleClickLogin = () => {

        let codeStatus = 0;
        const body = JSON.stringify({
            ClaUbicacion: config.ClaUbicacion
            , IdUsuario: selectedOptions.idusuario
            , Pwd: ""
            , Idioma: "English"
        })
        fetchData(`${config.Api}auth`, "", 'POST', body, false)
            .then(async (res) => {
                codeStatus = res.status;
                return res.json();
            })
            .then(async (data) => {
                switch (codeStatus) {
                    case 200:
                        setStatus(codeStatus)
                        checkSession()
                        break;
                    case 500:
                        setErrorMsg(data.msg + " \n " + JSON.stringify(data.error))
                        setStatus(codeStatus)
                        break;
                    case 401:
                        //do nothing
                        break;
                    case 400:
                    default:
                        setErrorMsg(data.msg)
                        setStatus(codeStatus)
                        break;
                }
            })
            .catch((error) => {
                setErrorMsg("Report error to administrator." + "\n" + error.toString())
                setStatus(null)
            })


    }

    const confirmLogIn = () => {
        return (
            <div className='modal d-block bg-dark bg-opacity-80' tabIndex="1" >
                <div className="modal-dialog modal-dialog-centered" role="document">
                    <div className="modal-content text-center">
                        <div className="modal-header">
                            <h5 className="modal-title"> Confirmation </h5>
                            <button type="button" className="btn-close" onClick={() => { setOpenViews({ 'otherUsers': false, 'shiftSelector': true, 'confirm': false }) }} aria-label="Close">
                            </button>
                        </div>
                        <div className={`modal-body`}>
                            <div className="row d-flex">
                                <div className={`col-sm-12 mt-3 mb-3  `}>
                                    <div className={`card global_card_style`}>
                                        <div className="card-body text-center">
                                            <div className='row d-flex'>
                                                <div className='col-6 m-auto'>
                                                    <Image className={`usericon`} alt="usr" src={usericon} width={80} height={80} />

                                                </div>
                                                <div className='col-6 text-center m-auto'>
                                                    <span id={selectedOptions.idusername} className="m-auto">{selectedOptions.username}</span>
                                                </div>
                                            </div>
                                            <div className='row d-flex mt-5'>
                                                <div className='col-6 m-auto'>
                                                    <Image className={`clockicon`} alt="clock" src={clock} width={80} height={80} />
                                                </div>
                                                <div className='col-6 m-auto'>
                                                    <span id={selectedOptions.idshift} className="m-auto">{selectedOptions.shiftname}</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div className="modal-footer d-flex justify-content-center">

                            <button type="button" className="btn btn-primary btn-lg mx-2 global_btn_primary" onClick={() => { setOpenViews({ 'otherUsers': false, 'shiftSelector': true, 'confirm': false }) }}>Cancel</button>
                            <button type="button" className="btn btn-primary btn-lg mx-2 global_btn_primary" onClick={() => { handleClickLogin() }}>OK</button>
                        </div>
                    </div>
                </div>
            </div>
        )


    }

    const handleChangeSearchUser = (e) => {
        console.log(e.target.value)
        var usersFilteredByInput = users.filter(row => row.NombreUsuario.includes(e.target.value.toUpperCase()))
        setUsers(e.target.value != '' ? usersFilteredByInput : userSearchInput)
    }

    const SearchUserTextInput = (text) => {
        if (!users || users.length === 0) {
            return
        }
        var usersFilteredByInput = userSearchInput.filter(row => row.NombreUsuario.includes(text.toUpperCase()));

        setUsers(text ? usersFilteredByInput : userSearchInput);
    }

    const modalOtherUsers = () => {

        return (


            <div className='modal d-block bg-dark bg-opacity-80' tabIndex="1" >
                <div className="modal-dialog modal-dialog-centered" role="document">
                    <div className="modal-content text-center">
                        <div className="modal-header">
                            <h5 className="modal-title"> Other users </h5>
                            <button type="button" className="btn-close" onClick={() => { setOpenViews({ 'otherUsers': false, 'shiftSelector': false, 'confirm': false }) }} aria-label="Close">
                            </button>
                        </div>
                        <div className={`modal-body ${styles.modalBodyStyle}`}>
                            <div className='row'>
                                {/* <input type='text' className='form-input' onChange={(e) => handleChangeSearchUser(e)} placeholder='Search your user'></input> */}
                                <TextInput typeInput={'Text'} inputValue={UsertText} setInputValue={setUserText} placeHolder="Search your user" ></TextInput>
                            </div>
                            <div className="row d-flex">
                                {Object.keys(users).map((i) => (
                                    <div key={i} className={`col-sm-6 mt-3 mb-3  `}>
                                        <div className={`card global_card_style`} onClick={(e) => { setSelectedOptions({ "username": users[i]["NombreUsuario"], "idusuario": users[i]["IdUsuario"], "loginusername": users[i]["LoginUserName"] }), setOpenViews({ 'otherUsers': false, 'shiftSelector': true, 'confirm': false }) }}>
                                            <div className="card-body text-center">
                                                <div className='row'>
                                                    <div className='col-12'>
                                                        <Image className={`usericon`} alt="usr" src={usericon} width={80} height={80} />
                                                    </div>
                                                </div>
                                                <div className='row'>
                                                    <span id={users[i]["IdUsuario"]} className="m-auto">{users[i]["NombreUsuario"]}</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                ))}

                            </div>
                        </div>
                        <div className="modal-footer d-flex justify-content-center">

                            <button type="button" className="btn btn-primary btn-lg mx-2 global_btn_primary" onClick={() => { setOpenViews({ 'otherUsers': false, 'shiftSelector': false, 'confirm': false }) }}>Cancel</button>
                        </div>
                    </div>
                </div>
            </div>)

    }

    const modalDefaultMachine = () => {

        return (


            <div className='modal d-block bg-dark bg-opacity-80' tabIndex="1" >
                <div className="modal-dialog modal-dialog-centered" role="document">
                    <div className="modal-content text-center">
                        <div className="modal-header">
                            <h5 className="modal-title"> Default Machine </h5>
                        </div>
                        <div className={`modal-body`}>
                            <div className='container'>
                                <div className='row'>
                                    <span>Select Default Machine:</span>
                                </div>
                                <div className="row">
                                    <MachineCombo actualizaWorkCenter={actualizaWorkCenterModal} setComboMaquinaCargado={setComboMaquinaCargadoModal} isHeader={false} />
                                </div>
                            </div>
                        </div>
                        <div className="modal-footer d-flex justify-content-center">
                            <button type="button" className="btn btn-primary btn-lg mx-2 global_btn_primary" onClick={() => { handleDefaultMachine() }}>Confirm</button>
                        </div>
                    </div>
                </div>
            </div>)

    }

    const handleDefaultMachine = () => {
        setOpenViews({ 'otherUsers': false, 'shiftSelector': false, 'confirm': false, 'defaultMachine': false })
        setDefaultMachine(IdWorkCenterSeleccionadoModal)
        fetchData(config.Api + "maquinas/setMaquinas", "?cookieNombre=IdWorkCenterDefault&cookieValor=" + IdWorkCenterSeleccionadoModal, 'POST')
            .then(
                fetchData(config.Api + "maquinas/setMaquinas", "?cookieNombre=IdWorkCenter&cookieValor=" + IdWorkCenterSeleccionadoModal, 'POST')
                    .then(

                )
            )
        
          

    }

    const handleChangeDefaultMachineClick = () => {
        setOpenViews({ 'otherUsers': false, 'shiftSelector': false, 'confirm': false, 'defaultMachine': true })
    }


    useEffect(() => {
        checkSession();
        let defaultMachineCookie = getCookieValue("IdWorkCenterDefault")
        if (defaultMachineCookie) {
            setOpenViews({ 'otherUsers': false, 'shiftSelector': false, 'confirm': false, 'defaultMachine': false })
            setDefaultMachine(defaultMachineCookie)
        }
        fetchData(config.Api + "auth/", "?ClaUbicacion=" + config.ClaUbicacion + "&Idioma=" + config.Idioma, 'GET', null, false)
            .then(async (res) => {
                let codeStatus = res.status
                let data = await res.json()
                switch (codeStatus) {
                    case 200:
                        setUsers(data.usuarios);
                        setUserSearchInput(data.usuarios);
                        var usersFlltd = data.usuarios.filter((row, index) => {

                            return index <= 2

                        })
                        let lastUser = data.usuarios.filter(row => row.NombreUsuario == footer.NombreUsuario)
                        lastUser.length > 0 ? usersFlltd.splice(-1, 1) : lastUser
                        lastUser.length > 0 ? usersFlltd.unshift({ IdUsuario: lastUser[0].IdUsuario, NombreUsuario: lastUser[0].NombreUsuario, LoginUserName: lastUser[0].LoginUserName }) : lastUser

                        setUsersFiltered(usersFlltd)
                        break;
                    case 500:
                        setErrorMsg(data.msg + " \n " + JSON.stringify(data.error))
                        setStatus(codeStatus)
                        break;
                    case 401:
                        setErrorMsg(data.msg)
                        setStatus(codeStatus)
                        break;
                    case 400:
                    default:
                        setErrorMsg(data.msg)
                        setStatus(codeStatus)
                        break;
                }
                setLoaded(true);
            }).catch((error) => {
                setErrorMsg("Report error to administrator." + "\n" + error.toString())
                setStatus(null)
            })



        /*fetchData(config.Api + "turnos/config", "?ClaUbicacion=" + config.ClaUbicacion + "&Idioma=" + config.Idioma, 'GET', null, false)
        .then(async (res) => {
            let codeStatus = res.status
            let data = await res.json()
            switch (codeStatus) {
                case 200:
                    setTurnos(data.turnos);
                    break;
                case 500:
                    setErrorMsg(data.msg + " \n " + JSON.stringify(data.error))
                    setStatus(codeStatus)
                    break;
                case 401: 
                    setErrorMsg(data.msg)
                    setStatus(codeStatus)
                    break;
                case 400:
                default:
                    setErrorMsg(data.msg)
                    setStatus(codeStatus)
                    break;
            }
            
        }).catch((error) => {
            setErrorMsg("Report error to administrator." + "\n" + error.toString())
            setStatus(null)
        })*/
    }, []);


    useEffect(() => {
        SearchUserTextInput(UsertText)
    }, [UsertText])

    useEffect(() => {
        if (selectedOptions) {
            let codeStatus = 0;
            const body = JSON.stringify({
                ClaUbicacion: config.ClaUbicacion
                , IdUsuario: selectedOptions.idusuario
                , Pwd: ""
                , Idioma: "English"
            })
            fetchData(`${config.Api}auth`, "", 'POST', body, false)
                .then(async (res) => {
                    codeStatus = res.status;
                    return res.json();
                })
                .then(async (data) => {
                    switch (codeStatus) {
                        case 200:
                            setStatus(codeStatus)

                            break;
                        case 500:
                            setErrorMsg(data.msg + " \n " + JSON.stringify(data.error))
                            setStatus(codeStatus)
                            break;
                        case 401:
                            //do nothing
                            break;
                        case 400:
                        default:
                            setErrorMsg(data.msg)
                            setStatus(codeStatus)
                            break;
                    }
                })
                .catch((error) => {
                    setErrorMsg("Report error to administrator." + "\n" + error.toString())
                    setStatus(null)
                })
        }

    }, [selectedOptions])

    if (status != 200) {
        return (
            <>
                <ModalError status={status} setStatus={setStatus} Text_modalbody={errorMsg} />
            </>
        )
    } else if (loaded) {

        return (
            <>

                <div className='modal d-block bg-dark bg-opacity-80' tabIndex="1" >
                    <div className="modal-dialog modal-dialog-centered" role="document">
                        <div className="modal-content text-center">
                            <div className="modal-header">
                                <div className='container-fluid'>
                                    <div className='row'>
                                        <div className='col-8'>
                                            <h5 className="modal-title"> Login</h5>
                                            <h5 className='modal-title'> Machine: {DefaultMachine} </h5>
                                        </div>
                                        <div className='col-4'>
                                            <button className='btn btn-sm global_btn_primary' onClick={() => { handleChangeDefaultMachineClick() }}>Change Machine</button>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div className={`modal-body`}>
                                <div className="row d-flex">
                                    {Object.keys(usersFiltered).map((i) => (
                                        <div key={i} className={`col-sm-6 mt-3 mb-3  `}>
                                            <div className={`card global_card_style`} onClick={(e) => { setSelectedOptions({ "username": usersFiltered[i]["NombreUsuario"], "idusuario": usersFiltered[i]["IdUsuario"], "loginusername": usersFiltered[i]["LoginUserName"] }), setOpenViews({ 'otherUsers': false, 'shiftSelector': true, 'confirm': false }) }}>
                                                <div className="card-body text-center">
                                                    <div className='row'>
                                                        <div className='col-12'>
                                                            <Image className={`usericon`} alt="usr" src={usericon} width={80} height={80} />
                                                        </div>
                                                    </div>
                                                    <div className='row'>
                                                        <span id={usersFiltered[i]["IdUsuario"]} className="m-auto">{usersFiltered[i]["NombreUsuario"]}</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                    ))}
                                    <div key={users.lenght} className={`col-sm-6 mt-3 mb-3  `}>
                                        <div className={`card global_card_style`} onClick={() => setOpenViews({ 'otherUsers': true, 'shiftSelector': false, 'confirm': false })}>
                                            <div className="card-body text-center">
                                                <div className='row'>
                                                    <div className='col-12'>
                                                        <Image className={`usericon`} alt="usr" src={usericon} width={80} height={80} />
                                                    </div>
                                                </div>
                                                <br></br>
                                                <div className='row'>
                                                    <span id='other' className="m-auto">Other</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div className="modal-footer d-flex justify-content-center">

                            </div>
                        </div>
                    </div>
                </div>
                {openViews.defaultMachine && modalDefaultMachine()}
                {openViews.otherUsers && modalOtherUsers()}
                {openViews.shiftSelector && <ShiftPicker selectedOptions={selectedOptions} setSelectedOptions={setSelectedOptions} openViews={openViews} setOpenViews={setOpenViews} />}
                {openViews.confirm && confirmLogIn()}
            </>
        )
    }

}