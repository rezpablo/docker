#!/bin/bash

set -e

echo '=====>'
BAK_NAME=$1
DB_NAME=$2
CLEANUP_DB=$3

echo ${BAK_NAME}
echo ${DB_NAME}
echo ${CLEANUP_DB}

echo '########## ESTA OPERAÇÃO IRÁ DEMORAR... Tenha paciência!'
echo 'INICIO: ' `date`

close_all_connections() {
sqlcmd -S 10.3.0.49 -U 'sa' -P $SA_PASSWORD << EOF        
USE master
go
ALTER DATABASE ${DB_NAME}
SET OFFLINE WITH ROLLBACK IMMEDIATE
GO
EOF
}

restore_database() {
sqlcmd -S 10.3.0.49 -U 'sa' -P $SA_PASSWORD << EOF
USE master
RESTORE DATABASE [$DB_NAME] FROM  DISK = N'C:\var\opt\mssql\data\dumps\\${BAK_NAME}' WITH  FILE = 1,  MOVE N'prow_onehealth' TO N'C:\var\opt\mssql\data\\${DB_NAME}.mdf',  MOVE N'prow_onehealth_log' TO N'C:\var\opt\mssql\data\\${DB_NAME}.ldf',  NOUNLOAD,  REPLACE,  STATS = 5
GO
EOF        
}

cleanup_db() {
sqlcmd -S 10.3.0.49 -U 'sa' -P $SA_PASSWORD << EOF
USE $DB_NAME

-- Enter cleanup 

EOF

}

close_all_connections
restore_database

# Clean database
if [ ${CLEANUP_DB} = true ]; then 
	echo 'restore DB'
#	cleanup_db
else 
	echo 'Dont restore DB'
fi

echo 'OPERACAO FINALIZADA:' $(date)
echo 'FIM, aguarde até o container ser finalizado'

exit 0
