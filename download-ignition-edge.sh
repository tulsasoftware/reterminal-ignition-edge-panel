#!/bin/bash
echo "downloading and installing ignition edge..."

echo "creating folder structures..."
sudo mkdir /opt/ignitionedge/
cd /opt/ignitionedge/
arch=$(getconf LONG_BIT)

echo "detected $arch bit operating system"
case $arch in
  32) 
  echo "case 32"
  fileid="1qjCmGOrj9Z5yw5i1Z_HtyZbPKAjF37XK"
  filename="Ignition-Edge-linux-armhf-32-8.1.33.zip"
  curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
  curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}
  
  echo "extracting the package..."
  sudo unzip "./${filename}"
  
  echo "setting file permissions..."
  sudo chmod +x ignition.sh ignition-gateway ignition-util.sh
  
  echo "note: it is suggested to configure ignition edge to launch on startup..."
  echo "(/opt/ignitionedge/ignition.sh start)"
  
  #remove the unextracted blob
  echo "cleaning up temporary files..."
  rm "./${filename}"
  ;;
  
  #assume 64 bit if not 32 bit
  *) 
  echo "case 64" 
  fileid="1uvjl82zgeki73uSmqNHy8DThNIcT68uw"
  filename="ignition-edge-linux-aarch64.zip"
  curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
  curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}
  
  echo "extracting the package..."
  sudo unzip "./${filename}"
  
  echo "setting file permissions..."
  sudo chmod +x ignition.sh ignition-gateway ignition-util.sh
  
  echo "note: it is suggested to configure ignition edge to launch on startup..."
  echo "(/opt/ignitionedge/ignition.sh start)"
  
  #remove the unextracted blob
  echo "cleaning up temporary files..."
  rm "./${filename}"
  ;;
esac

echo "installation complete."
