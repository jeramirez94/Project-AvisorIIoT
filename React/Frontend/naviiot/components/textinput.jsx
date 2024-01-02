import Image from 'next/image'
import show from '@/assets/img/show.png'
import hide from '@/assets/img/hide.png'
import clear from '@/assets/img/clear.png'
import confirm from '@/assets/img/confirm.png'
import { useRef, useEffect, useState } from "react"
import KioskBoard from "kioskboard"
import styles from './textinput.module.css'

export default function TextInput({ typeInput, inputValue, setInputValue,placeHolder=null }) {

  const [showPassword, setShowPassword] = useState(false);
  const keyboardRef = useRef(null);
  const numpadRef = useRef(null);
  
  useEffect(() => {
    if (keyboardRef.current) {
      KioskBoard.run(keyboardRef.current, {
        language: "en",
        theme: "light",
        keysArrayOfObjects: [
          {
            "0": "1",
            "1": "2",
            "2": "3",
            "3": "4",
            "4": "5",
            "5": "6",
            "6": "7",
            "7": "8",
            "8": "9",
            "9": "0"
          },
          {
            "0": "Q",
            "1": "W",
            "2": "E",
            "3": "R",
            "4": "T",
            "5": "Y",
            "6": "U",
            "7": "I",
            "8": "O",
            "9": "P"
          },
          {
            "0": "A",
            "1": "S",
            "2": "D",
            "3": "F",
            "4": "G",
            "5": "H",
            "6": "J",
            "7": "K",
            "8": "L"
          },
          {
            "0": "Z",
            "1": "X",
            "2": "C",
            "3": "V",
            "4": "B",
            "5": "N",
            "6": "M"
          }
        ],
        keysEnterText: 'OK',
        keysFontWeight: 'normal',
        keysFontWeight: '500',
        keysEnterCallback: handleKeysEnterCallback
      });
    }
  }, [keyboardRef]);

  useEffect(() => {
    if (numpadRef.current) {
      KioskBoard.run(numpadRef.current, {
        theme: "light",
        keysArrayOfObjects: [
          {
            "0": "7",
            "1": "8",
            "2": "9"
          },
          {
            "0": "4",
            "1": "5",
            "2": "6"
          },
          {
            "0": "1",
            "1": "2",
            "2": "3"
          },
          {
            "0": "0",
            "1": "."
          }
        ],
        keysEnterText: 'OK',
        keysEnterCallback: handleKeysEnterCallback
      });
    }
  }, [numpadRef]);

  

  const handleKeysEnterCallback = () => {
    if(typeInput == "Number" ){
      if(keyboardRef.current){
        setInputValue(numpadRef.current.value)
      }
    }else{
      
      if(keyboardRef.current){
        setInputValue(keyboardRef.current.value)
      }
      
    }
    // typeInput == "Number" ?
    //   setInputValue(numpadRef.current.value)
    //   :
    //   setInputValue(keyboardRef.current.value) 
  }

  const togglePasswordVisibility = () => {
    setInputValue(keyboardRef.current.value)
    setShowPassword((prevShowPassword) => !prevShowPassword)
  };

  const handleClearInput = () => {
    {
      typeInput == "Number" ?
        numpadRef.current.value = ""
        :
        keyboardRef.current.value = ""
    }
    setInputValue("")
  };

  const handleSendInputValue = () => {
    {
      typeInput == "Number" ?
        setInputValue(numpadRef.current.value)
        :
        setInputValue(keyboardRef.current.value)
    }
  }

  return (
    <div className='container-fluid'>
      <div className='row align-items-center d-flex'>
        <div className='col-6'>
          {typeInput == "Number" ? (
            <input
              className={`js-kioskboard-input ${styles.numberInput}`}
              ref={numpadRef}
              type="Number"
              data-kioskboard-type="numpad"
              placeholder=""
              value={inputValue}
              onChange={() => {

              }}
            />
          ) : typeInput == "Text" ? (
            <input
              className={`inputFromKey`}
              ref={keyboardRef}
              type={typeInput}
              data-kioskboard-type="keyboard"
              data-kioskboard-specialcharacters="true" 
              placeholder= {placeHolder ? placeHolder :  "Text"}
              value={inputValue}
              onChange={() => {

              }}
            />
          ) : typeInput == "Password" ? (
            <input
              className={`inputFromKey`}
              ref={keyboardRef}
              type={showPassword ? "text" : "password"}
              data-kioskboard-type="keyboard"
              placeholder="Password"
              value={inputValue}
              onChange={() => {

              }}
            />
          ) : typeInput == "TextSpecial" ? (
            <input
              className={`inputFromKey`}
              ref={keyboardRef}
              type={typeInput}
              data-kioskboard-type="keyboard"
              placeholder= {placeHolder ? placeHolder :  "Text"}
              value={inputValue}
              onChange={() => {

              }}
            />
          ) : (null)}
        </div>

        <div className='col-6'>
          {typeInput == "Password" ? (
            <div className='row'>
              <div className='col-4'>
                <Image
                  className='password-icon mt-auto mb-auto p-1'
                  alt="password-icon"
                  src={showPassword ? hide : show}
                  width={50}
                  height={50}
                  onClick={togglePasswordVisibility}
                />
              </div>
              <div className='col-4'>
                <Image
                  className='clearicon mt-auto mb-auto p-2'
                  alt="clearicon"
                  src={clear}
                  width={50}
                  height={50}
                  onClick={handleClearInput}
                />
              </div>
              <div className='col-4'>
                <Image
                  className='confirmicon mt-auto mb-auto p-2'
                  alt="confirmicon"
                  src={confirm}
                  width={50}
                  height={50}
                  onClick={handleSendInputValue} />
              </div>
            </div>
          ) : (
            <div className='row'>
              <div className='col-6'>
                <Image
                  className='clearicon mt-auto mb-auto p-2'
                  alt="clearicon"
                  src={clear}
                  width={50}
                  height={50}
                  onClick={handleClearInput}
                />
              </div>
              <div className='col-6'>
                <Image
                  className='confirmicon mt-auto mb-auto p-2'
                  alt="confirmicon"
                  src={confirm}
                  width={50}
                  height={50}
                  onClick={handleSendInputValue} />
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  )

}