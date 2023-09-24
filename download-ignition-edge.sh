#!/bin/bash
echo "downloading and installing ignition edge..."
echo "creating folder structures..."
sudo mkdir /opt/ignitionedge/
cd /opt/ignitionedge/

echo "downloading ignition edge... this is gonna take a while..."
#download the ignition edge panel 8.12 from a public google drive folder
fileid="1uvjl82zgeki73uSmqNHy8DThNIcT68uw"
filename="ignition-edge-linux-aarch64.zip"
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}

echo "extracting the package..."
sudo unzip ./ignition-edge-linux-aarch64.zip

echo "setting file permissions..."
sudo chmod +x ignition.sh ignition-gateway ignition-util.sh

echo "note: it is suggested to configure ignition edge to launch on startup..."
echo "(/opt/ignitionedge/ignition.sh start)"

#remove the unextracted blob
echo "cleaning up temporary files..."
rm ./ignition-edge-linux-aarch64.zip

echo "installation complete."