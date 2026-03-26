#ln -snf /usr/share/zoneinfo/Africa/Nairobi /etc/localtime
#apt update
#DEBIAN_FRONTEND=noninteractive apt install tzdata -y
#date

#!/bin/bash
set -e  # Остановка при ошибке

echo "=== Pre-build start: $(date) ==="

# 1. Timezone Москва
apt update -qq
DEBIAN_FRONTEND=noninteractive apt install tzdata -yqq
ln -snf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
export TZ=Europe/Moscow
date  # Проверка: Thu Mar 26 14:27:00 MSK 2026

# 2. Обновление Zapret (pull/clone свежую версию)
echo "Updating Zapret..."
mkdir -p user/zapret
cd user/zapret
if [ -d .git ]; then
    git pull origin master --ff-only || git reset --hard origin/master
else
    git clone https://github.com/bol-van/zapret.git .
fi
echo "Zapret latest: $(git log -1 --oneline | head -1)"
git status -s  # Показать изменения

# 3. Опционально: Entware/OPKG (если нужно)
# sed -i 's/# CONFIG_ENTWARE is not set/CONFIG_ENTWARE=y/' "trunk/configs/RT-N56U/config"

# 4. Логирование для отладки
echo "Pre-build: Zapret ready in user/zapret/" > pre-build.log
ls -la | head -10 >> pre-build.log

echo "=== Pre-build end: $(date) ==="
