FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /backend

# Copy everything
COPY . ./
# Restore as distinct layers
RUN dotnet restore
# Build and publish a release
RUN dotnet publish -c Release -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0
RUN apt-get update -y
RUN apt-get install -y iputils-ping curl
WORKDIR /backend
EXPOSE 8080
COPY --from=build /backend/out .
ENTRYPOINT ["dotnet", "DotNet.Docker.dll"]