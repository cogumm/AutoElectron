#!/bin/bash
clear

# Prompt para o usuário pedindo o nome para o diretório do projeto
echo "Qual será o nome do projeto? "
# Guarda o nome digitado pelo usuário na variável
read name
# Cria e entra no diretório com o nome do projeto
mkdir $name && cd $name

echo "Criando os diretórios base do projeto."
mkdir src
cd src/
mkdir assets
cd assets/ 
mkdir css
mkdir img
mkdir js
cd ../../

echo "Cria o diretório onde ficarão os arquivos públicos."
mkdir public

# Cria o arquivo de estilo vazio
touch style.css
# Move o arquivo "style.css" para a pasta css
mv style.css src/assets/css

echo "Clona o repositório com a versão básica do Electron"
git clone https://github.com/electron/electron-quick-start

echo "Move todo o conteúdo da pasta do repositório para o diretório criado."
mv electron-quick-start/* ./

echo "Apaga o diretório do repositório e alguns arquivos."
cp ../package/.gitignore .gitignore
rm -rf electron-quick-start/
rm -rf ./package-lock.json
rm -rf ./LICENSE.md

echo "Movendo o arquivo main.js para src/"
mv main.js src/

echo "Movendo o arquivo index.html para public/"
mv index.html public/


echo "Instalando as dependências do projeto utilizando o YARN."
yarn

clear
echo "----------------------------------------"
echo "Projeto criado com sucesso de nome $name"
echo "----------------------------------------"
exit 0