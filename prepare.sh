#!/bin/bash
set -e

git clone https://github.com/ivabus/urouter
cd urouter
curl -fsSL -o d https://raw.githubusercontent.com/ivabus/ivabus-dotfiles/main/init
curl -fsSL -o s https://raw.githubusercontent.com/ivabus/asahi-opensuse/main/installer/bootstrap.sh

cat >> alias.json <<EOF
[
	{
		"uri": "d",
		"alias": "d"
	},
	{
		"uri": "s",
		"alias": "s"
	}
]
EOF

echo prepared