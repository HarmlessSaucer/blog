FROM nixos/nix:latest AS build
ENV NIX_CONFIG="experimental-features = nix-command flakes"
WORKDIR /src
COPY . .
RUN nix build .#website -o /result

FROM nginx:alpine
COPY --from=build /result /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
