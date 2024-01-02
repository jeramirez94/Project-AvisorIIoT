/**
 * 
 * @param {*} name nombre del cookie del que quieres obtener el valor
 * @returns valor del cookie
 */
export const getCookieValue = (name) => {
    const cookies = document.cookie.split(';');
    
    for (let i = 0; i < cookies.length; i++) {
      const cookie = cookies[i].trim();
      if (cookie.startsWith(`${name}=`)) {
        return cookie.substring(name.length + 1);
      }
    }
    return undefined;
  };