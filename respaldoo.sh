#!/bin/bash

#crea el directorio de respaldo local si no existe
mkdir -p /var/respaldos
echo "directorio creado"

#Crea el respaldo de manera local.
for dir in /home/*; do
    if [ -d "$dir" ]; then
        rsync -av --delete "$dir/" /var/respaldos/"$(basename "$dir")/"
    fi 
done

# Respaldo de archivos de la carpeta /home/usuario1 de manera remota

REMOTE_IP="192.168.0.100"
REMOTE_DIR="/var/respaldosUsuario1"
LOCAL_DIR="/home/usuario1"

# Crea el directorio remoto si no existe
ssh "$REMOTE_IP" "mkdir -p $REMOTE_DIR"
echo "directorio ssh creado con exito"

#Realizar el respaldo con compresión
rsync -avz --delete "$LOCAL_DIR/" "$REMOTE_IP:$REMOTE_DIR/"


