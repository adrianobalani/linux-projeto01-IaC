#!/bin/bash

if [ "$(id -u)" != "0" ]; then

		echo "Voce deve executar este script como root! "
		exit 0
fi

echo "Limpando configurações anteriores"

array = ( adm ven publico sec )

for i in "${array[@]}"
do
	if [ -d /$i ]; then
	
			echo "Limpando $i"
			rm -Rf $i
			echo "Criando $i"
			mkdir /$i
			
		else
		
			echo "Criando $i"
			mkdir /$i
			
	fi
	
done

echo "Criando grupos de usuários..."

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Grupos criados!"
echo
echo
echo "Criando usuários..."

users_adm = ( carlos maria joao)
users_ven = ( roberto sebastiana debora)
users_sec = ( josefina amanda rogerio )

for i in "${users_adm[@]}"
do
	echo "Criando o usuário: $i no grupo GRP_ADM"
	useradd $i -m -s /bin/bash -p $(openssl passwd -crypt Mudar123) -G GRP_ADM
	echo "Usuário $i criado!"
done

for i in "${users_ven[@]}"
do
	echo "Criando o usuário: $i no grupo GRP_VEN"
	useradd $i -m -s /bin/bash -p $(openssl passwd -crypt Mudar123) -G GRP_VEN
	echo "Usuário $i criado!"
done


for i in "${users_sec[@]}"
do
	echo "Criando o usuário: $i no grupo GRP_sec"
	useradd $i -m -s /bin/bash -p $(openssl passwd -crypt Mudar123) -G GRP_SEC
	echo "Usuário $i criado!"
done


echo "Aplicando permissões dos diretórios:"

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico
echo
echo "Permissões aplicadas"
echo
echo
echo "Fim!!!"





























