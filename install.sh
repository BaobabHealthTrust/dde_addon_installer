#!/usr/bin/env bash

target=$1

ruby setup.rb $target uninstall

ruby setup.rb $target install
