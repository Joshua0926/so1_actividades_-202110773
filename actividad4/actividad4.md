# Actividad 4

## Chat básico con Named Pipes en Linux

1. Crea una named pipe para los dos chats:

```bash
mkfifo chat1
mkfifo chat2
```

2. Crear dos scripts:

```sh
#!/bin/bash

while true; do
    # Leer mensaje del participante B
    read -r message < chat1
    echo "chat 2: $message"

    # Escribir mensaje
    echo -n "chat2: "
    read message
    echo "$message" > chat1
done
``` 

```sh
#!/bin/bash

while true; do
    # Leer mensaje del participante A
    read -r message < chat2
    echo "chat1: $message"

    # Escribir mensaje
    echo -n "chat 2: "
    read message
    echo "$message" > chat2
done
```

### Ejecución

Terminal 1 ejecutar:

```sh
./chat1.sh
```

Terminal 2 ejecutar:

```sh
./chat2.sh
```
