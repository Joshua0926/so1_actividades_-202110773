
# Definir la Variable
GITHUB_USER="Joshua0926"

# Hacer la consulta a la API de GitHub
API_URL="https://api.github.com/users/$GITHUB_USER"
DATA=$(curl -s "$API_URL")

# Extraer JSON con los datos 
USER_ID=$(echo "$DATA" | jq -r '.id')
CREATED_AT=$(echo "$DATA" | jq -r '.created_at')

# Imprimir el mensaje
echo "Hola $GITHUB_USER. User ID: $USER_ID. Cuenta fue creada el: $CREATED_AT."

# Crear un directorio de la fecha en /tmp
DATE_DIR="/tmp/$(date +'%Y%m%d')"
mkdir -p "$DATE_DIR"

# Crear un archivo de log en el directorio de fecha creado
LOG_FILE="$DATE_DIR/saludos.log"
echo "Hola $GITHUB_USER. User ID: $USER_ID. Cuenta fue creada el: $CREATED_AT." >> "$LOG_FILE"

# Mensaje de confirmación
echo "Datos guardados en $LOG_FILE."

# Configurar crontab para ejecutar el script cada 5 minutos
(crontab -l ; echo "*/5 * * * * /home/joshua/script.sh") | crontab -

