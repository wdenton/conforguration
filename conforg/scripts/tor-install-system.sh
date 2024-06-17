#!/bin/bash
unset TOR_VERSION
declare -a TOR_VERSION=( '0.4.8.12' )
cd /usr/local/src/tor/
curl --location --remote-name https://dist.torproject.org/tor-${TOR_VERSION}.tar.gz
tar --extract --verbose --gunzip --file tor-${TOR_VERSION}.tar.gz
cd tor-${TOR_VERSION}
./configure && make && sudo make install
echo "Now run ~/conforg/scripts/tor-run.sh"
