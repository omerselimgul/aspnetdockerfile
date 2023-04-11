#ubuntu 22.04 with 
# FROM mcr.microsoft.com/dotnet/sdk:6.0.407-jammy-amd64 
# WORKDIR /api
# COPY /test .
# EXPOSE 5192
# RUN dotnet dev-certs https 
# RUN -E dotnet dev-certs https -ep /usr/local/share/ca-certificates/aspnet/https.crt --format PEM
# CMD [ "dotnet","run" ]

# FROM mcr.microsoft.com/dotnet/sdk:6.0.407-jammy-amd64 
# WORKDIR /app
# COPY /test .
# RUN dotnet restore
# RUN dotnet publish test.csproj -c Release -o out
# WORKDIR out
# # ENV ASPNETCORE_URLS="http://*:5555"
# ENTRYPOINT ["dotnet", "test.dll"]


FROM mcr.microsoft.com/dotnet/sdk:6.0-focal AS build
WORKDIR /app
COPY /api .
RUN dotnet restore 
RUN dotnet publish api.csproj -c Release -o . 

FROM mcr.microsoft.com/dotnet/aspnet:6.0-focal 
WORKDIR /app
COPY --from=build /app .
ENV ASPNETCORE_URLS="http://*:5000"
EXPOSE 5000
ENTRYPOINT ["dotnet", "api.dll"]


