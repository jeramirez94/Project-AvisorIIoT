import React, { useEffect } from 'react';
import { useConfigContext } from '../utils/config';
import { fetchData } from '../utils/fetch';

function HeartbeatSender() {
  const [config, setConfig] = useConfigContext();

  const sendHeartbeat = async (hideSpinner) => {
    try {
      await fetchData(config.Api + 'heartbeat', '', 'POST', { Idioma: config.Idioma }, hideSpinner, null);
    } catch (error) {
      console.error('Fallo Heartbeat', error);
    }
  }

  useEffect(() => {
    sendHeartbeat(true);

    const interval = setInterval(() => {
      sendHeartbeat(true);
    }, 6000 * 5);

    return () => clearInterval(interval);
  }, []);

  return null; 
}

export default HeartbeatSender;