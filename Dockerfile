# Sample Dockerfile

# Indicates that the windowsservercore image will be used as the base image.
FROM mcr.microsoft.com/windows/servercore:ltsc2019

# Metadata indicating an image maintainer.
LABEL maintainer="jshelton@contoso.com"

# Uses dism.exe to install the IIS role.
RUN dism.exe /online /enable-feature /all /featurename:iis-webserver /NoRestart

# Creates an HTML file and adds content to this file.
#RUN echo "Hello World - Dockerfile" > c:\inetpub\wwwroot\index.html

COPY build build

COPY GnuWin32 GnuWin32

COPY ["NI-DAQ", "C:/Program Files (x86)/National Instruments/NI-DAQ"]

RUN setx path "%path%;c:\gnuwin32\bin\;C:\build\17.0\arm\sysroots\i686-nilrtsdk-mingw32\usr\libexec\arm-nilrt-linux-gnueabi\gcc\arm-nilrt-linux-gnueabi\4.9.2;C:\build\17.0\x64\sysroots\i686-nilrtsdk-mingw32\usr\libexec\x86_64-nilrt-linux\gcc\x86_64-nilrt-linux\4.9.2;d:\GnuWin32\bin;C:\build\17.0\x64\sysroots\i686-nilrtsdk-mingw32\usr\bin\x86_64-nilrt-linux;"

# Sets a command or process that will run each time a container is run from the new image.
#CMD [ "cmd" ]

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
