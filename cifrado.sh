

cifrado: 
openssl enc -aes-256-cbc -salt -in password.txt -out password.enc
o
openssl enc -aes-256-cbc -salt -pbkdf2 -in passwork.txt -out password.enc

------------------------------------------------------
sh
[awx@dbcontainer ~]$ cat desc.sh
#!/bin/bash

export DB_PASSWORD="1595"


#eer la contraseña descifrada
PASSWORD=$(openssl enc -d -aes-256-cbc -pbkdf2 -in /home/awx/password.enc -pass pass:$DB_PASSWORD)

# Usar la contraseña
echo "La contraseña es: $PASSWORD"

# Aquí podrías usar $PASSWORD para conectarte o para lo que necesites

[awx@dbcontainer ~]$


