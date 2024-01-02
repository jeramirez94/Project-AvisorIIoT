import i18n from 'i18next';
import { initReactI18next } from 'react-i18next';
import { useConfigContext } from './config';
import { useEffect } from 'react';

i18n
  .use(initReactI18next)
  .init({
    fallbackLng: 'en',
    interpolation: {
      escapeValue: false,
    },
    resources: {
      en: {
        menu: require('../public/locales/en/menu.json'),
        header: require('../public/locales/en/header.json'),
        select: require('../public/locales/en/select.json'),
        cu151_ov: require('../public/locales/en/cu151_ov.json'),
        cu153_pp: require('../public/locales/en/cu153_pp.json'),
        cu151_psv: require('../public/locales/en/cu151_psv.json'),
        cu171_bp: require('../public/locales/en/cu171_bp.json'),
        modal: require('../public/locales/en/modal.json'),
        cu204_bp: require('../public/locales/en/cu204_bp.json'),
        cu155_sopm: require('../public/locales/en/cu155_sopm.json'),
        deniedAccess:require('../public/locales/en/accessDenied.json'),
        autorizacion:require('../public/locales/en/autorizacion.json')
      },
      es: {
        menu: require('../public/locales/es/menu.json'),
        header: require('../public/locales/es/header.json'),
        select: require('../public/locales/es/select.json'),
        cu151_ov: require('../public/locales/es/cu151_ov.json'),
        cu153_pp: require('../public/locales/es/cu153_pp.json'),
        cu151_psv: require('../public/locales/es/cu151_psv.json'),
        cu171_bp: require('../public/locales/es/cu171_bp.json'),
        modal: require('../public/locales/es/modal.json'),
        cu204_bp: require('../public/locales/es/cu204_bp.json'),
        cu155_sopm: require('../public/locales/es/cu155_sopm.json'),
        deniedAccess:require('../public/locales/es/accessDenied.json'),
        autorizacion:require('../public/locales/es/autorizacion.json')
      },
    },
  });

function I18nProvider({ children }) {
  const [config] = useConfigContext();

  const lang = config.Idioma==='Spanish' ? 'es':'en'  

  useEffect(() => {
    i18n.changeLanguage(lang);
  }, []);

  return <>{children}</>;
}

export default i18n;
export { I18nProvider };
