#!/bin/bash

red=$'\e[0;31m'
grn=$'\e[0;32m'
blu=$'\e[0;34m'
mag=$'\e[0;35m'
cyn=$'\e[0;36m'
white=$'\e[0m'

if [ "$1" = "" ]; then
    printf "Please specify a project name and technology:\n"
    printf "    $cyn create$white$grn <project-name> <technology-flag>$white\n"
    printf "\n"
    printf "Run$cyn create --help$white to see a list of options.\n"
    exit
fi

function printTechnologyFlags {
    printf "Technology Flags:\n"
    printf "    --react         Create a basic React project.\n"
    printf "    --react-ts      Create a React + TypeScript project.\n"
    printf "    --svelte        Create a basic Svelte project.\n"
    printf "    --svelte-ts     Create a Svelte + TypeScript project.\n"
    printf "    --web           Create a basic vanilla website project.\n"
    printf "    --node          Create a Node + Express project.\n"
    printf "    --python        Create a Python Poetry project.\n"
    printf "    --go            Create a basic Golang project.\n"
    printf "    --rust          Create a basic Rust project.\n"
    printf "    --electron      Create a basic Electron project.\n"
}

if [ "$1" = "--help" ]; then
    printf "\n"
    printf "Usage:$cyn create$white$grn <project-name> <technology-flag>$white\n"
    printf "\n"
    printf "Both$grn <project-name>$white and$grn <technology-flag>$white are required.\n"
    printf "\n"
    printTechnologyFlags
    exit
fi

export TEMPLATEPATH=~/Documents/programming/bin/templates

# ------ Project Set Up Functions ------ #

function initNpm {
    printf "📥$grn Initializing NPM$white\n"
    npm init -y
}

function installPrettier {
    printf "📥$grn Installing Prettier$white\n"
    npm install prettier --save-dev
    printf "📝$grn Setting Up Prettier Config Files$white\n"
    cp "$TEMPLATEPATH/prettier/.prettierrc" .
    cp "$TEMPLATEPATH/prettier/.prettierignore" .
    printf "\n"
}

function setUpReact {
    npx create-react-app $1 --use-npm
    cd $1
    printf "\n"
    installPrettier
    printf "🎊$grn React Project Created!$white\n"
    printf "\n"
}

function setUpReactTypeScript {
    npx create-react-app $1 --template typescript --use-npm
    cd $1
    printf "\n"
    installPrettier
    printf "🎊$grn React + TypeScript Project Created!$white\n"
    printf "\n"
}

function setUpSvetle {
    npx degit sveltejs/template $1
    cd $1
    printf "📥$grn Installing Dependencies$white\n"
    npm install
    printf "\n"
    printf "🎊$grn Svelte Project Created!$white\n"
    printf "\n"
}

function setUpSvetleTypeScript {
    npx degit sveltejs/template $1
    cd $1
    node scripts/setupTypeScript.js
    printf "📥$grn Installing Dependencies$white\n"
    npm install
    printf "\n"
    printf "🎊$grn Svelte + TypeScript Project Created!$white\n"
    printf "\n"
}

function setUpVanillaWeb {
    mkdir $1
    cd $1
    printf "📝$grn Setting Up Vanilla Web Template$white\n"
    cp "$TEMPLATEPATH/README.md" .
    mkdir src
    cp "$TEMPLATEPATH/web/index.html" ./src
    cp "$TEMPLATEPATH/web/styles.css" ./src
    cp "$TEMPLATEPATH/web/main.js" ./src
    mkdir src/assets
    cp "$TEMPLATEPATH/web/favicon.ico" ./src/assets
    cp "$TEMPLATEPATH/web/seo-og.jpg" ./src/assets
    cp "$TEMPLATEPATH/web/seo-twitter.jpg" ./src/assets
    printf "\n"
    initNpm
    installPrettier
    printf "🎊$grn Vanilla Web Project Created!$white\n"
    printf "\n"
}

function setUpNode {
    mkdir $1
    cd $1
    initNpm
    npm install express
    npm install nodemon --save-dev
    cp "$TEMPLATEPATH/node/index.js" .
    mkdir handlers
    mkdir middleware
    mkdir models
    installPrettier
    printf "🎊$grn Node.js Project Created!$white\n"
    printf "\n"
}

function setUpPython {
    poetry new --src $1
    cd $1
    rm -rf README.rst
    cp "$TEMPLATEPATH/README.md" .
    pyenv local 3.8.2
    printf "✅$grn Using Python Version 3.8.2$white\n"
    printf "📥$grn Installing Dependencies$white\n"
    poetry install
    printf "\n"
    printf "🎊$grn Python Project Created!$white\n"
    printf "\n"
}

function setUpGo {
    mkdir $1
    cd $1
    printf "📝$grn Setting Up Go Template$white\n"
    cp "$TEMPLATEPATH/go/main.go" .
    cp "$TEMPLATEPATH/README.md" .
    mkdir handlers
    mkdir middleware
    mkdir models
    printf "\n"
    printf "🎊$grn Go Project Created!$white\n"
    printf "\n"
}

function setUpRust {
    cargo new $1
    cd $1
    printf "\n"
    printf "🎊$grn Rust Project Created!$white\n"
    printf "\n"
}

function setUpElectron {
    npx create-electron-app $1
    cd $1
    installPrettier
    printf "🎊$grn Electron Project Created!$white\n"
    printf "\n"
}

# ------ Create Project Or Project Folder ------ #

if [ "$2" = "--react" ]; then
    setUpReact $1
elif [ "$2" = "--react-ts" ]; then 
    setUpReactTypeScript $1
elif [ "$2" = "--svelte" ]; then 
    setUpSvetle $1
elif [ "$2" = "--svelte-ts" ]; then 
    setUpSvetleTypeScript $1
elif [ "$2" = "--web" ]; then
    setUpVanillaWeb $1
elif [ "$2" = "--node" ]; then
    setUpNode $1
elif [ "$2" = "--python" ]; then
    setUpPython $1
elif [ "$2" = "--go" ]; then
    setUpGo $1
elif [ "$2" = "--rust" ]; then 
    setUpRust $1
elif [ "$2" = "--electron" ]; then
    setUpElectron $1
else
    printf "❗️$red Seems like you provided an unrecognized technology flag.$white\n"
    printf "\n"
    printTechnologyFlags
    exit
fi

# ------ Open Project ------ #

printf "📤$grn Opening project in VS Code...$white\n"
code .