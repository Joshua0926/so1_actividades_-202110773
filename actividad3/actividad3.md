Actividad 3

Explicación

Primero, crea un script llamado saludo.sh que realizará la tarea especificada. Puedes ubicarlo en /usr/local/bin/ por ejemplo:

#!/bin/bash
while true
do
    echo "Hola, la fecha actual es: $(date)"
    sleep 1
done

Guardar este script como saludo.sh en /usr/local/bin/ y asegúrate de darle permisos de ejecución:
sudo chmod +x /usr/local/bin/saludo.sh

Crear el systemd unit
Crear un archivo de unidad systemd para el servicio. Puedes llamarlo saludo.service y ubicarlo en /etc/systemd/system/:

[Unit]
Description=Saludo Service
After=network.target

[Service]
Type=simple
ExecStart=/usr/local/bin/saludo.sh
Restart=always

[Install]
WantedBy=multi-user.target

Habilitar y iniciar el servicio
Habilitar el servicio para que se inicie automáticamente al arrancar el sistema:
sudo systemctl enable saludo.service

Iniciar el servicio:
sudo systemctl start saludo.service

Verificar el estado del servicio:
sudo systemctl status saludo.service

Verificar los logs del servicio:
sudo journalctl -u saludo.service