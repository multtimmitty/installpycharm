#!/usr/bin/bash

tput civis
echo -e "Iniciando..."; sleep 1
mkdir "$HOME/pycharm"
echo -e "Descargando Pycharm..."; sleep 1
`wget https://download.jetbrains.com/python/pycharm-community-2021.3.tar.gz -P "$HOME/pycharm/" > /dev/null 2>&1` 
if [[ -f "${HOME}/pycharm/pycharm-community-2021.3.tar.gz" ]]; then
    echo -e "Descomprimiendo archivo (tar.gz)"
    tar xvf "$HOME/pycharm/pycharm-community-2021.3.tar.gz" -C "$HOME/pycharm" > /dev/null 2>&1
    if [[ $? -eq 0 ]]; then
        echo -e "Descomprimido exitosamente..."; sleep 1
        echo -e "Creando Alias de Pycharm...."; sleep 1
        `echo "alias pycharm='sh /home/linux/pycharm/pycharm-community-2021.2.3/bin/pycharm.sh > /dev/null 2>&1 &'" >> "$HOME/.bashrc"`
        if [[ $? -eq 0 ]]; then
           echo -e "Recargando el Archivo (.bashrc)"
           `source $HOME/.bashrc`
           if [[ $? -eq 0 ]]; then
              echo -e "Pycharm Instalado Correctamente ya puedes ejecutar (pycharm)...!"
           else
            echo -e "Recarga el archivo (.bashrc)"
           fi
        else
          echo -e "Error Al Instalar Pycharm"
        fi
    else
       echo -e "Error Al Descomprimir..."
    fi
else
 echo -e "El Archivo No Existe, Verifica el problema"
fi
tput cnorm
