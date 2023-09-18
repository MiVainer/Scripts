#!/bin/bash
set -euo pipefail

### Настройки

# Имя бакета, куда будут заливаться бекапы
S3_BUCKET='mipostgresql'

# Endpoint URL
S3_ENDPOINT='https://ib.bizmrg.com'

# Путь к директории где будут создаваться архивы.
# Эта папка будет синхронизироваться с S3,
# поэтому при удалении там файлов - они пропадут и в хранилище.
# Путь должен быть БЕЗ слеша на конце!
SYNC_DIR='/home/ubuntu/backups/postgresql'

# Создаем директорию для синхронизации, если она ещё не существует
mkdir -p "${SYNC_DIR}"

# Префикс создаваемых архивов
ARCHIVE_PREFIX="dump_`date +%d-%m-%Y"_"%H_%M_%S`.sql"

# создаём дамп моей БД из контейнера (первый postgres это имя контейнера)
docker exec -t postgres pg_dumpall -c -U mivainer > ${SYNC_DIR}/${ARCHIVE_PREFIX}

# Синхронизируем папку с S3 хранилищем.
# Стоит обратить внимание на аргумент `--delete` – он означает,
# что если в исходной директории (SYNC_DIR) нет файла, который есть в S3,
# то он удалится в хранилище.
/usr/local/bin/aws s3 sync --delete "${SYNC_DIR}" "s3://${S3_BUCKET}" --endpoint-url="${S3_ENDPOINT}"


