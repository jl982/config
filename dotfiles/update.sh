#!/bin/sh

DIR="$( cd "$( dirname "$0" )" && pwd )"

cp ~/.bashrc $DIR
cp ~/.screenrc $DIR
cp ~/.vimrc $DIR

cp -r ~/.i3 $DIR
