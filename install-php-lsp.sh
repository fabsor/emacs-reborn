#!/bin/bash

pushd php-language-server
composer install
composer run-script --working-dir=vendor/felixfbecker/language-server parse-stubs
popd

