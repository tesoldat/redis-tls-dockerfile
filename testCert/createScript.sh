openssl req -x509 -new -nodes -sha256 -utf8 -days 3650 -newkey rsa:2048 -keyout key.pem -out crt.pem -config ssl.conf
