#!/bin/bash

export TEMPLATEPATH=~/Documents/programming/bin/templates

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
    printf "    --fast-el       Create a FAST Element + TypeScript project.\n"
    printf "    --fast-fo       Create a FAST Foundation + TypeScript project.\n"
    printf "    --fast-ds       Create a FAST Design System + TypeScript project.\n"
    printf "    --web           Create a basic vanilla website project.\n"
    printf "    --web-ts        Create a basic vanilla TypeScript website project.\n"
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

# ------ Project Setup Functions ------ #

function initGit {
    git init
    cp "$TEMPLATEPATH/git/.gitignore" .
}

function initNpm {
    npm init -y
}

function npmAddScript {
    npx npm-add-script -k "$1" -v "$2" --force
}

function installPrettier {
    npm install prettier --save-dev
    cp "$TEMPLATEPATH/prettier/.prettierrc" .
    cp "$TEMPLATEPATH/prettier/.prettierignore" .
}

function createReadme {
    echo $1 >> README.md
}

function printSuccessMessage {
    printf "\n"
    printf "Created $1 at $(pwd)/$1\n"
    printf "Inside that directory, you can run several commands:\n"
    printf "\n"
    printf "    $cyn npm start$white\n"
    printf "        Starts the development server.\n"
    printf "\n"
    printf "    $cyn npm run build$white\n"
    printf "        Bundles the app into static files for production.\n"
    printf "\n"
    printf "You can begin by typing:\n"
    printf "\n"
    printf "    $cyn cd $1$white\n"
    printf "    $cyn npm start$white\n"
    printf "\n"
    printf "Have fun!\n"
}

# ---- React Setup Functions ----

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

# ---- Svelte Setup Functions ----

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

# ---- FAST Setup Functions ----

function setUpFASTElement {
    mkdir $1
    cd $1
    initGit
    initNpm
    npmAddScript "start" "webpack serve"
    npmAddScript "build" "webpack --mode=production"
    npm install --save @microsoft/fast-element lodash-es
    npm install --save-dev clean-webpack-plugin ts-loader typescript webpack webpack-cli webpack-dev-server
    installPrettier
    createReadme "# Template FAST Element Project"
    cp -R "$TEMPLATEPATH/fast/element/src" .
    cp "$TEMPLATEPATH/fast/element/index.html" .
    cp "$TEMPLATEPATH/fast/tsconfig.json" .
    cp "$TEMPLATEPATH/fast/webpack.config.js" .
    printf "🎊$grn FAST Element Project Created!$white\n"
    printSuccessMessage $1
}

function setUpFASTFoundation {
    mkdir $1
    cd $1
    initGit
    initNpm
    npmAddScript "start" "webpack serve"
    npmAddScript "build" "webpack --mode=production"
    npm install --save @microsoft/fast-element @microsoft/fast-foundation lodash-es
    npm install --save-dev clean-webpack-plugin ts-loader typescript webpack webpack-cli webpack-dev-server
    installPrettier
    createReadme "# Template FAST Foundation Project"
    cp -R "$TEMPLATEPATH/fast/foundation/src" .
    cp "$TEMPLATEPATH/fast/foundation/index.html" .
    cp "$TEMPLATEPATH/fast/tsconfig.json" .
    cp "$TEMPLATEPATH/fast/webpack.config.js" .
    printf "🎊$grn FAST Foundation Project Created!$white\n"
    printSuccessMessage $1
}

function setUpFASTDesignSystem {
    mkdir $1
    cd $1
    initGit
    initNpm
    npmAddScript "start" "webpack serve"
    npmAddScript "build" "webpack --mode=production"
    npm install --save @microsoft/fast-element @microsoft/fast-foundation lodash-es
    npm install --save-dev clean-webpack-plugin ts-loader typescript webpack webpack-cli webpack-dev-server
    installPrettier
    createReadme "# Template FAST Design System Project"
    cp -R "$TEMPLATEPATH/fast/design-system/src" .
    cp "$TEMPLATEPATH/fast/design-system/index.html" .
    cp "$TEMPLATEPATH/fast/tsconfig.json" .
    cp "$TEMPLATEPATH/fast/webpack.config.js" .
    printf "🎊$grn FAST Design System Project Created!$white\n"
    printSuccessMessage $1
}

# ---- Vanilla Web Setup Function ----

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

# ---- Vanilla TypeScript Web Setup Function ----

function setUpVanillaTypeScriptWeb {
    mkdir $1
    cd $1
    printf "📝$grn Setting Up Vanilla TypeScript Web Template$white\n"
    cp "$TEMPLATEPATH/README.md" .
    cp "$TEMPLATEPATH/web-ts/snowpack.config.js" .
    mkdir src
    cp "$TEMPLATEPATH/web-ts/index.html" ./src
    cp "$TEMPLATEPATH/web-ts/styles.css" ./src
    cp "$TEMPLATEPATH/web-ts/main.ts" ./src
    mkdir src/assets
    cp "$TEMPLATEPATH/web-ts/favicon.ico" ./src/assets
    cp "$TEMPLATEPATH/web-ts/seo-og.jpg" ./src/assets
    cp "$TEMPLATEPATH/web-ts/seo-twitter.jpg" ./src/assets
    printf "\n"
    initNpm
    npm install --save-dev snowpack
    npmAddScript "start" "snowpack dev"
    npmAddScript "build" "snowpack build"
    installPrettier
    printf "🎊$grn Vanilla TypeScript Web Project Created!$white\n"
    printf "\n"
}

# ---- Node Setup Function ----

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

# ---- Python Setup Function ----

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

# ---- Golang Setup Function ----

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

# ---- Rust Setup Function ----

function setUpRust {
    cargo new $1
    cd $1
    printf "\n"
    printf "🎊$grn Rust Project Created!$white\n"
    printf "\n"
}

# ---- Electron Setup Function ----

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
elif [ "$2" = "--fast-el" ]; then 
    setUpFASTElement $1
elif [ "$2" = "--fast-fo" ]; then 
    setUpFASTFoundation $1
elif [ "$2" = "--fast-ds" ]; then 
    setUpFASTDesignSystem $1
elif [ "$2" = "--web" ]; then
    setUpVanillaWeb $1
elif [ "$2" = "--web-ts" ]; then
    setUpVanillaTypeScriptWeb $1
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