# build stage 
FROM microsoft/dotnet:2.0-sdk-nanoserver AS builder 
WORKDIR /src 
COPY ConsoleHelloApp1/ . 
RUN dotnet restore; dotnet publish 
# final image stage 
FROM microsoft/dotnet:2.0-runtime-nanoserver 
WORKDIR /dotnetapp 
COPY --from=builder /src/bin/Release/netcoreapp2.0/publish . 
CMD ["dotnet", "ConsoleHelloApp1.dll"] 
