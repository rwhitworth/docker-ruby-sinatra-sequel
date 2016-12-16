#!/usr/bin/env bash

docker run -it --rm -v `pwd`/scripts:/opt/scripts ruby-web:latest /opt/scripts/run.rb
