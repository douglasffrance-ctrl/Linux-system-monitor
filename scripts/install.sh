#!/bin/bash

echo "Aplicação do linux-automation no sistema"

sudo cp ../src/exporter.sh /usr/local/bin/dlinux

sudo chmod +x /usr/local/bin/dlinux

echo "Instalação concluida!"

echo "Agora voce pode digitar apenas 'dlinux' em qualquer pasta."
