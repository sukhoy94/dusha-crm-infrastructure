#!/bin/sh

# Tworzenie katalogu na certyfikaty
mkdir -p /ssl

# Generowanie certyfikatu SSL
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /ssl/nginx-selfsigned.key \
  -out /ssl/nginx-selfsigned.crt \
  -subj "/C=PL/ST=Lubelskie/L=Lublin/O=Fundacja Dusha/OU=Dev/CN=localhost"
