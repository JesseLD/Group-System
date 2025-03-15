#!/bin/bash

echo "Digite o nome do modulo: "
read moduleName

# Copia o diretório BaseModule para o novo módulo
cp -r BaseModule "$moduleName"

# Transforma a primeira letra em minúscula
lowercase_moduleName=$(echo "$moduleName" | awk '{print tolower(substr($0,1,1)) substr($0,2)}')

cd "$moduleName"

# Renomeia arquivos que contém BaseModule no nome
for file in ./*.php; do
  new_file=$(echo "$file" | sed "s/BaseModule/$moduleName/")
  mv "$file" "$new_file"
done

# Substitui o texto BaseModule pelo novo nome do módulo e baseModule pelo nome com a primeira letra minúscula nos arquivos PHP
sed -i "s/BaseModule/$moduleName/g" ./*.php
sed -i "s/baseModule/$lowercase_moduleName/g" ./*.php

cd ..

# echo "Pressione qualquer tecla para continuar..."
# read

echo "Done!"
