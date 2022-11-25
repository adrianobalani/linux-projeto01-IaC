#!/bin/bash


echo "Criando usuários do sistema:"

for((i=10;i<=13;i++))
do
	echo "Criando Usuário: Guest${i}"
    useradd guest${i} -c "Usuário convidado" -s /bin/bash -m -p $(openssl passwd -crypt Mudar123)
	passwd guest${i} -e
    echo
    echo "Usuário Guest${i} criado!"
    
done

echo "Concluido!!!"

