function testssl-report() { 
$HOME/Repos/testssl.sh/testssl.sh -p -e -f --color 0 --openssl /usr/bin/openssl --mapping no-openssl "$1" | sed -r 's/^ x[0-9a-f]{2,}[ ]{3,}([^ ]*).*/\1/' | sed -r 's/^-{90}/-------------/' | sed 's/Hexcode.*/Cipher Suites/'
}

