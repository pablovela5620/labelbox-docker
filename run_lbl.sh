#!/usr/bin/env
docker run --name label-box --rm -it -v "$PWD/scripts:/Labelbox/scripts/my_scripts:rw" pablovela5620/labelbox-docker bash
