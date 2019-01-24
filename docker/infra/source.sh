#!/bin/sh
echo $ONE_PASSWORD_PASSWORD | op signin my.1password.com ${ONE_PASSWORD_USER} ${ONE_PASSWORD_SECRET_KEY} | awk 'NR<=1' >> ~/.bashrc

. ~/.bashrc

echo $OP_SESSION_my
