#!/bin/bash
DOMAIN=$2
echo "$DOMAIN"
help() {
    cat <<EOF
******************************************
                    menu                        
******************************************
1. init(create key and crt)
2. create csr from key and crt
3. create new crt <domain> (need key and csr)
******************************************
EOF
}
case "$1" in
1)
    echo "init(create key and crt)"
    openssl req -x509 -new -nodes -sha256 -utf8 -days 3650 -newkey rsa:2048 -keyout key.pem -out cert.pem -config ssl.conf
    echo "-----------------------------------------------------"
    echo "done."
    ;;
2)
    echo "create csr from key and crt"
   openssl x509 -x509toreq -in cert.pem -out CSR.csr -signkey key.pem
    echo "-----------------------------------------------------"
    echo "done."
    ;;
3)
    if [ -z "$DOMAIN" ]; then
      echo "expect input <domain>"
      help
    else
      echo "create new crt $DOMAIN"
      openssl x509 -signkey key.pem -in CSR.csr -req -days 365 -out ${DOMAIN}.pem
    fi
    echo "-----------------------------------------------------"
    echo "done."
    ;;
*)
    help
    exit 1
    ;;
esac




