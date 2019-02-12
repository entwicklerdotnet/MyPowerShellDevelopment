FROM microsoft/dotnet:nanoserver-core
MAINTAINER Andreas Rohrbach <andreas.rohrbach@bechtle.com>
EXPOSE 5000
WORKDIR c:\\dotnetapp
COPY dotnetapp . 
CMD ["dotnet", "PiWebApp.dll", "--server.urls", "http://0.0.0.0:5000"]