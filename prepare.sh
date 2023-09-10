#!/bin/bash
set -e

# Pick only release version
TAG=0.2.0
git clone https://github.com/ivabus/urouter -b $TAG
cd urouter

# Download routable files
curl -fsSL -o dotfiles https://raw.githubusercontent.com/ivabus/dotfiles/main/init
curl -fsSL -o nix https://raw.githubusercontent.com/ivabus/dotfiles/main/init_nix
curl -fsSL -o env https://raw.githubusercontent.com/ivabus/dotfiles/main/init_env

# Setup routing
cat >> alias.json <<EOF
[
	{
		"uri": "/",
		"alias": "https://ivabus.dev",
		"is_url": true
	},
	{
		"uri": "/",
		"alias": "dotfiles",
		"curl_only": true
	},
	{
		"uri": "d",
		"alias": "dotfiles"
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
