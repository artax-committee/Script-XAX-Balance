#!/bin/bash

#
#      ****** WARNING ******"
#
# This is a bash script. A malicious or wrongly coded script may do really nasty things to your system.
# Never ever run any script unless you either fully understand all its lines or it has been
# validated by somebody you trust.
#

#     *** VERY IMPORTANT***
# Modify the variable PATH_TO_BINARIES according to the place you have xax.cli, ending it in "/".
# If xax.cli is in yout PATH (for example /usr/local/bin) leave the variable empty like this:
# PATH_TO_BINARIES=
#
# You may need to install bc:
#     apt install bc
#

PATH_TO_BINARIES=/root/



BALANCE=$(${PATH_TO_BINARIES}xax-cli getwalletinfo | grep '"balance"' | cut -d ' ' -f 4 | cut -d ',' -f 1)
IMMATURE_BALANCE=$(${PATH_TO_BINARIES}xax-cli getwalletinfo | grep '"immature_balance"' | cut -d ' ' -f 4 | cut -d ',' -f 1)
STAKE=$(${PATH_TO_BINARIES}xax-cli getwalletinfo | grep '"stake"' | cut -d ' ' -f 4 | cut -d ',' -f 1)

echo ""
echo "Balance: $BALANCE"
echo "Immature balance: $IMMATURE_BALANCE"
echo "Stake: $STAKE"
echo ""
echo "Total balance (balance + immature balance + stake): $(echo "$BALANCE+$IMMATURE_BALANCE+$STAKE" | bc)"
echo ""
