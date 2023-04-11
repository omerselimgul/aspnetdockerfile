# sdk package image in ubuntu image
FROM mcr.microsoft.com/dotnet/sdk:6.0-focal AS build
# creating new directory 
WORKDIR /app
# project files copied to new directory
COPY /api .
# project debug 
RUN dotnet restore
# publish the project 
RUN dotnet publish api.csproj -c Release -o . 

# dotnet run time env in ubuntu image
FROM mcr.microsoft.com/dotnet/aspnet:6.0-focal 
# create new directory
WORKDIR /app
# copy the publish file
COPY --from=build /app .
# run project in 5000 port
ENV ASPNETCORE_URLS="http://*:5000"
# Expose 5000
EXPOSE 5000
ENTRYPOINT ["dotnet", "api.dll"]


