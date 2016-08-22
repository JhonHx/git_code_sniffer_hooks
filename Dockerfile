FROM 	php:5.6.24-cli

RUN		apt-get update && \
		apt-get install -y git npm python-setuptools cowsay && \
		easy_install pip

RUN		docker-php-ext-install zip

RUN		mkdir ~/bin/ && \
		cd ~/bin/ && \
		git clone https://github.com/qycloud/git_code_sniffer_hooks.git

RUN		curl -s https://getcomposer.org/installer | php -- --install-dir=$HOME/bin && \
		chmod +x ~/bin/composer.phar && \
		cd ~/bin/git_code_sniffer_hooks/ && \
		~/bin/composer.phar install

RUN		cd ~/bin/git_code_sniffer_hooks/ && \
		npm install

RUN     pip install -r ~/bin/git_code_sniffer_hooks/requirements.txt

#sh -c "cd .. && sudo docker build git_code_sniffer_hooks"