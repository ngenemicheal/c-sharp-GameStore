FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src

COPY GameStore.Api/GameStore.Api.csproj GameStore.Api/
RUN dotnet restore GameStore.Api/GameStore.Api.csproj

COPY . .
WORKDIR /src/GameStore.Api
RUN dotnet publish -c Release -o /app/publish /p:UseAppHost=false

FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS final
WORKDIR /app

COPY --from=build /app/publish .
ENV ASPNETCORE_URLS=http://+:8080
EXPOSE 8080

ENTRYPOINT ["dotnet", "GameStore.Api.dll"]