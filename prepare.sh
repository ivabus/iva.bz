#!/bin/bash
set -e

git clone https://github.com/ivabus/urouter
cd urouter
curl -fsSL -o dotfiles https://raw.githubusercontent.com/ivabus/dotfiles/main/init
curl -fsSL -o nix https://raw.githubusercontent.com/ivabus/dotfiles/main/init_nix
curl -fsSL -o suse https://raw.githubusercontent.com/ivabus/asahi-opensuse/main/installer/bootstrap.sh
curl -fsSL -o env https://raw.githubusercontent.com/ivabus/dotfiles/main/init_env

cat >> alias.json <<EOF
[
	{
		"uri": "d",
		"alias": "dotfiles"
	},
	{
		"uri": "s",
		"alias": "suse"
	},
	{
		"uri": "e",
		"alias": "env"
	},
	{
		"uri": "nix",
		"alias": "nix"
	}
]
EOF

echo prepared
