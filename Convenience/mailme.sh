#!/bin/bash
mail -s "$*" "you@email.com" <<EOF
Consider yourself notified
-CHTC
EOF
