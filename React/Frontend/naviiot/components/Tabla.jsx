import React from 'react';
/*import styles from './tabla.css'*/
import { Table, Thead, Tbody, Tr, Th, Td } from 'react-super-responsive-table';
import 'react-super-responsive-table/dist/SuperResponsiveTableStyle.css';
import Link from 'next/link';
import styles from './Tabla.module.css'

const Tabla = ({ datos, columnas, parametrosConsulta,disableButton,setDisableButton,selectData,setSelectedData}) => {
  
  async function handleClickCheckBox(e, data) {

    //variable para almacenar todos los elementos de tipo checbox
    
    var checkBoxes = document.getElementsByClassName('form-check-input')
    if (disableButton) {
        data.forEach(rowData => selectData.push(rowData.IdRegistro));
        setDisableButton(false)
        for (var x = 0; x < checkBoxes.length; x++) {
            checkBoxes[x].checked = true
        }
    } else {
        setSelectedData([])
        setDisableButton(true)
        for (var x = 0; x < checkBoxes.length; x++) {
            checkBoxes[x].checked = false
        }

    }
} 

function getElement(id) {
  var elementObj = document.getElementById(id)
  return elementObj.checked
}
function setCheckElement(id, value) {
  var elementObj = document.getElementById(id)
  return elementObj.checked = value

}


  return (
    <Table className="table">
      <Thead>
      
        <Tr style={{ position: 'sticky', top: 0, backgroundColor: '#f5f5f5', zIndex: 1 }}>
          {columnas.map((columna) => (
            <Th key={columna}>
              {
                Object.keys(columna).map(col => {
                  const input =  <input
                  id="All"
                  type="checkbox"
                  className={`form-check-input ${styles.checkbox}`}
                  onClick={(e) => handleClickCheckBox(e, datos)}
                />
                  return col == "Select" ? input : columna[col]
                })

              
              }
              {/* {columna === 'Select' ? (
                <input
                  id="All"
                  type="checkbox"
                  className="form-check-input"
                  onClick={(e) => handleClickCheckBox(e, datos)}
                />
              ) : (
                columna === 'NomOrder' ? 'Order' :
                columna
              )} */}
            </Th>
          ))}
        </Tr>
      </Thead>
      <Tbody>
        {datos.map((dato, index) => {
          
          return(
            <Tr key={index}>
              {
                columnas.map(columna => {
                  return (Object.keys(columna).map(key =>{
                    const input = <input
                                  id={dato['IdRegistro']} /* si le pongo idOrden sí respeta en la tabla que estaba creada sin la librería*/
                                  type="checkbox"
                                  className={`form-check-input ${styles.checkbox}`}
                                  onChange={(e) => {
                                    getElement(dato["IdRegistro"]) == true 
                                                        ? selectData.push(dato["IdRegistro"]) 
                                                        : selectData.splice(selectData.findIndex((row) => row == dato["IdRegistro"]), 1)
                                                        
                                                        selectData.length == 0 ? setDisableButton(true) : setDisableButton(false)
                                                        
                                                        setCheckElement('All', selectData.length == 0 ? false : true);
                                  }}
                                  />
                    return (
                      <Td key={columna}>{key === "Select" ?  input : dato[key]}</Td>
                    )
                  }))
                })
              }
            {/*columnas.map((columna) => {
                if (columna === 'Details') {
                  return (
                    <Td key={columna}>
                      <Link
                        className="a_primary"
                        href={`/CU171_Pag1_Bitacora_Produccion/CU171_Pag1_Production_Detail${parametrosConsulta}`}
                      >
                        View
                      </Link>
                    </Td>
                  );
                } else if (columna === 'Select') {
                  return (
                    <Td key={columna}>
                      <input
                        id={dato['IdRegistro']} /* si le pongo idOrden sí respeta en la tabla que estaba creada sin la librería
                        type="checkbox"
                        className="form-check-input"
                        onChange={(e) => {
                          handleClickCheckBox(e, [dato]);
                        }}
                      />
                    </Td>
                  );
                } else {
                  return <Td key={columna}>{dato[columna]}</Td>;
                }
              })*/}
            </Tr>
          )
        }
        )}
      </Tbody>
    </Table>
  );
};

export default Tabla;


/*

import React from 'react';
import { Table, Thead, Tbody, Tr, Th, Td } from 'react-super-responsive-table';
import 'react-super-responsive-table/dist/SuperResponsiveTableStyle.css';
import Link from 'next/link';

const Tabla = ({ datos, columnas, parametrosConsulta, handleClickCheckBox }) => {
  
  return (
    <Table className="table">
      <Thead>
        <Tr>
          {Object.keys(datos[0]).map((key) => (
            <Th key={key}>
              {key === 'Select' ? (
                <input
                  id="All"
                  type="checkbox"
                  className="form-check-input"
                  onClick={(e) => handleClickCheckBox(e, datos)}
                />
              ) : (
                key === 'ORDER' ? 'NomOrder' : key
              )}
            </Th>
          ))}
        </Tr>
      </Thead>
      <Tbody>
        {datos.map((dato, index) => (
          <Tr key={index}>
            {Object.keys(dato).map((key) => {
              if (key === 'Details') {
                return (
                  <Td key={key}>
                    <Link
                      className="a_primary"
                      href={`/CU171_Pag1_Bitacora_Produccion/CU171_Pag1_Production_Detail${parametrosConsulta}`}
                    >
                      View
                    </Link>
                  </Td>
                );
              } else if (key === 'Select') {
                return (
                  <Td key={key}>
                    <input
                      id={dato['IdRegistro']}
                      type="checkbox"
                      className="form-check-input"
                      onChange={(e) => {
                        handleClickCheckBox(e, [dato]);
                      }}
                    />
                  </Td>
                );
              } else {
                return <Td key={key}>{dato[key]}</Td>;
              }
            })}
          </Tr>
        ))}
      </Tbody>
    </Table>
  );
};

export default Tabla;
*/