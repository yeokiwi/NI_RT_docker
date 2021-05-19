# NI_RT_docker

NI RT compiler using gnuwin32 make utility

Steps to run the containers

1. Install Docker Desktop
2. Switch to windows containers
3. Download NI-DAQ and Shared directory
4. Download gnuwin32
5. Pull the dockerfile and execute the dockerfile  "docker build -t nibuild ."
6. Wait for the docker image to be built

Alternatively, download the nibuild.tar from ykw

1. then "docker load -i nibuild.tar"

Execute the build by the following commands:

docker run --rm -v c:\ni:c:\ni -w C:\ni\fg\workspace\fg\release\ --name nibuild nibuild make
