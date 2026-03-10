#!/bin/bash
       
     verde='\033[0;32m'
     amarelo='\033[1;33m'
     vermelho='\033[0;31m'
     azul='\033[0;36m'
     sem_cor='\033[0m'


echo -e "${amarelo}Monitoramento linux-Automation ${sem_cor}"


     cpu_load=$(awk '{print $1}' /proc/loadavg)
     ram_total=$(grep MemTotal /proc/meminfo | awk '{print $2}')
     ram_free=$(grep MemAvailable /proc/meminfo  | awk '{print $2}')
     ram_usage=$(((ram_total - ram_free) / 1024))
     ram_usage=$(echo $ram_usage | sed 's/-//')
     ram_total_mb=$((ram_total / 1024 ))

if (( $(echo "$cpu_load >= 2.0" | bc -l) )) || [ $ram_usage -gt 1400 ]; then
     cor_ram=$vermelho

echo -e "${vermelho}ALERTA: O sistema está  operando em carga alta!${sem_cor} "

else
   cor_status=$verde
echo -e "${verde}Sistema operando normalmente. :)${sem_cor}"
fi
    disck_total=$(df -h / | awk 'NR==2 {print $2}')
   disk_usage=$(df -h / | awk 'NR==2 {print $5}')

echo -e "Carga da CPU: ${verde}${cpu_load}${sem_cor}"
echo -e "Memoria RAM  total: ${azul}${ram_total_mb} MB${sem_cor}"
echo -e "Memoria RAM em uso: ${amarelo}${ram_usage} MB${sem_cor}"
echo -e "Uso total do disco: ${azul}${disck_total}${sem_cor}"
echo -e "Uso de disco atual:${amarelo}${disk_usage}${sem_cor}"











