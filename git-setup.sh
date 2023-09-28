#!/bin/bash
# verify git instalation
if ! command -v git &> /dev/null; then
    echo "-> installing git..."
    # verify OS
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        if [ "$ID" == "ubuntu" ] || [ "$ID" == "debian" ]; then
            sudo apt update
            sudo apt install -y git
        elif [ "$ID" == "centos" ] || [ "$ID" == "rhel" ]; then
            sudo yum install -y git
        else
            echo "-> operating system not recognized. Install Git manually and run this script again."
            exit 1
        fi
    else
        echo "failed to install git, try again or install manually"
        exit 1
    fi
    if ! command -v git &> /dev/null; then
        echo "-> failed to install git, try again or install manually"
        exit 1
    fi
    echo "-> git successfully installed"
fi