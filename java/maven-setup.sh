#!/bin/bash
#!/bin/bash
if [ "$EUID" -ne 0 ]; then
  echo "-> run as root"
  exit 1
fi

apt update
apt install -y maven
mvn -version
echo "-> maven successfully installed"
