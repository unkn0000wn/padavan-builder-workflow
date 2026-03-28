echo "=== Pre-build start: $(date) ==="
# 1. Timezone Москва
ln -snf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
apt update
DEBIAN_FRONTEND=noninteractive apt install tzdata -y
export TZ=Europe/Moscow
date  # Проверка: Thu Mar 26 14:27:00 MSK 2026

