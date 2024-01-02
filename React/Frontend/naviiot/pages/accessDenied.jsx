import React from 'react';
import { useTranslation } from 'react-i18next'
import { useHeaderContext } from '../utils/headerCtx';
const DeniedAccess = () => {

    const { t } = useTranslation('deniedAccess');
    const { header, setHeader } = useHeaderContext();

    setHeader({...header,Titulo:t('pageTitle')})
  return (
    <div>
      <h1>{t('deniedAccess')}</h1>
    </div>
  );
};

export default DeniedAccess;