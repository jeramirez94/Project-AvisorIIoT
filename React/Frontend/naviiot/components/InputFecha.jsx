//import styles from './InputFecha.module.css'
import { forwardRef } from 'react'
import { registerLocale, setDefaultLocale } from  "react-datepicker";
import es from 'date-fns/locale/es';
import en from 'date-fns/locale/en-GB';
import { useConfigContext } from '@/utils/config'
import DatePicker from 'react-datepicker'


export default function InputFecha({ setDate, date }) {
    const [config, setConfig] = useConfigContext()
    registerLocale('es', es)
    registerLocale('en', en)
    const idiomaFecha = config.Idioma=='English'?en:es
    const formatoFecha = config.Idioma=='English'?'MM-dd-yyy':'dd-MM-yyy'
    const DatePickerContainer = forwardRef(({ value, onClick }, ref) => (
        <button className="btn global_btn_primary" onClick={onClick} ref={ref}>
            {value}
        </button>
    ));
    return (
        <DatePicker
            selected={date}
            onChange={(date) => setDate(date)}
            customInput={<DatePickerContainer />}
            showMonthDropdown
            showYearDropdown
            withPortal
            dropdownMode="select"
            locale={idiomaFecha}
            dateFormat={formatoFecha}
        />
    )
}