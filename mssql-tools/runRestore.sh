#!/bin/bash

# Dialog com opcoes de arquivos bak, defina coretamente o diretorio dos dumps
FILE=$(dialog --stdout --title "Please choose a file" --fselect /opt/dumps/ 20 160)
BACKUP_NAME=$(echo ${FILE} | awk -F"/" '{print $NF}')

if [ -z "${BACKUP_NAME}" ]; then
	echo '###########################################'
	FILE=$(find /opt/dumps -type f -printf "%C@ %p\\n" | sort -r | grep PROD_ | awk 'NR==1 {print $2}')
	BACKUP_NAME=$(echo ${FILE} | awk -F"/" '{print $NF}')
	echo 'NENHUM BACKUP FOI ESCOLHIDO, O BACKUP UTILIZADO SERA: '${BACKUP_NAME}
	echo 'WARNING - Caso queira cancelar pressione ctrl + c'
fi

CLEANUP_DB=$(echo ${BACKUP_NAME} | grep PROD_YOUKNOW)

if [ -z "${CLEANUP_DB}" ]; then
	CLEANUP_DB=false
	echo 'Nao sera executado script de limpeza da base'
else
	CLEANUP_DB=true
	echo 'Sera executado script de limpeza da base de dados para desenvolvimento'
fi


echo '############################################'
echo 'Nome do backup: ' $BACKUP_NAME
echo '############################################'

## Set nome do banco a ser restaurado
echo 'Qual o nome da base a ser restaurada?'
read DB_NAME
echo 'Nome do DB: ' $DB_NAME

## Chama o script executa o backup
docker run -it --rm -v /home/$USER/mssql-server/mssql-tools/scripts:/scripts rezpablo/mssql-tools sh scripts/restoreDb.sh $BACKUP_NAME $DB_NAME $CLEANUP_DB
