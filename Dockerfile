FROM mcr.microsoft.com/dotnet/sdk:6.0 as build
WORKDIR /app
COPY . .
RUN dotnet restore
RUN dotnet publish -o /app/published-app

FROM mcr.microsoft.com/dotnet/aspnet:6.0 as runtime
WORKDIR /app
COPY --from=build /app/published-app /app
ENTRYPOINT [ "dotnet", "/app/EngieApi.dll" ]
