#!/bin/bash

docker run -v ./example/src:/src -v ./example/out:/out -e APPLICATIONS_SYMLINK=1 $(docker build -q .) MyVolume /src /out/with_symlink.dmg

docker run -v ./example/src:/src -v ./example/out:/out $(docker build -q .) MyVolume /src /out/without_symlink.dmg