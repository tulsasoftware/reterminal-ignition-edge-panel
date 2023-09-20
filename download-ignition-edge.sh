#!/bin/bash
fileid="1uvjl82zgeki73uSmqNHy8DThNIcT68uw"
filename="ignition-edge-linux-aarch64.zip"
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}