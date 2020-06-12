#!/bin/bash

echo "---------------------------------------------------------------"
echo "Desenvolvido por Gabriel 'CoGUMm' Vilar"
echo "E-mail: gabriel@cogumm.net"
echo "Website: http://cogumm.net"
echo "NÃO ME RESPONSABILIZO POR MAUS DANOS À MÁQUINA COM ESTE SCRIPT,\nFAVOR UTILIZÁ-LO SE APENAS TIVER CERTEZA DO QUE ESTEJA FAZENDO."
echo "---------------------------------------------------------------"


while [ true ]; do
	echo "yarn ou npm"
    read package
	
    case "$package" in
		"yarn" )
			if [ which -a yarn ]
            then
                echo "YARN instalado!"
                echo " "
            else
                echo "Instalando o Yarn aguarde..."
                curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
                echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
                sudo apt update && sudo apt install yarn
            fi

            bash package/yarn.sh

            return
		;;
		"npm" )
            if [ which -a npm ]
            then
                echo "NPM instalado!"
            else
                echo "Instalando NPM aguarde..."
                nvm install v12.18.0
            fi

            bash package/npm.sh
            return
		;;
	esac
done

  





