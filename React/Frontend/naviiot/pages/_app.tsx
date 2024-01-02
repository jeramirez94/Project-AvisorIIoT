import '@/styles/MC.css'
import type { AppProps } from 'next/app'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-icons/font/bootstrap-icons.css'
import "react-datepicker/dist/react-datepicker.css";
import Layout from '../components/layout'
import Head from "next/head";
import { I18nProvider } from '../utils/i18n';
import { useEffect, useState } from "react";
import { ConfigProvider } from '../utils/config'
import { HeaderProvider } from '../utils/headerCtx'
import { FooterProvider } from '../utils/footerCtx'
import { fetchData } from '@/utils/fetch';
import HeartbeatSender from '../utils/heartbeat'
export default function App({ Component, pageProps }: AppProps) {

  const [SelectedIdWorkCenter, setSelectedWorkCenter] = useState('');

  useEffect(() => {
    require("bootstrap/dist/js/bootstrap.bundle.min.js");

  }, []);


  return (
    <>
      <ConfigProvider>
        <HeartbeatSender/>
        <HeaderProvider>
          <Head>
            <meta name="viewport" content="width=device-width, initial-scale=1" />
          </Head>
          <I18nProvider>
            <FooterProvider>
              <Layout setSelectedWorkCenter={setSelectedWorkCenter} SelectedIdWorkCenter={SelectedIdWorkCenter}>
                <Component {...pageProps} SelectedIdWorkCenter={SelectedIdWorkCenter} />
              </Layout>
            </FooterProvider>
          </I18nProvider>
        </HeaderProvider>
      </ConfigProvider>


    </>
  )


}
