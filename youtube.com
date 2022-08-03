#!/usr/bin/env bash

# author: fenix <suporte@fenixijui.com>
# describe: pega dados do yotube
# version: 0.1
# license: MIT Licence

function youtube(){
	echo 'Esta funcionando!'
}
youtube
