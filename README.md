# Lilah's Modpacks

## Modpacks
Just the one 😇 (for now!)
 - [cuties pack 💗](./cuties/README.md)

## Setup

### Client
0. We recommend the following environment setup.
   - [Prism Launcher](https://prismlauncher.org/) and its Wiki for [installing Java](https://prismlauncher.org/wiki/getting-started/installing-java/).
   - JDKs: Either [Microsoft OpenJDK](https://www.microsoft.com/openjdk) or [Eclipse Temurin](https://adoptium.net/temurin/releases/). Installation via [winget](https://aka.ms/winget-cli) package manager:
     ```pwsh
     winget install Microsoft.OpenJDK.21
     ```
1. Download your modpack in `.mrpack` format from the [Releases Page](https://github.com/delilahw/modpacks/releases).
2. Open Prism Launcher, select _Add Instance_.
3. In the dialog's sidebar, select _Import from zip_.
4. Browse for the `.mrpack` file or paste in the download link to it.
5. Press _OK_ to proceed with the installation.

### Servers
Using [itzg/docker-minecraft-server](https://github.com/itzg/docker-minecraft-server), declare the modpack in your container's environment variables.
```yml
services:
  server:
    image: itzg/minecraft-server:java21-alpine
    environment:
      TYPE: FABRIC
      MOD_PLATFORM: MODRINTH
      # You can specify the modpack as a HTTP URL or a local file.
      MODRINTH_MODPACK: /modpacks/cutes-0.1.0.mrpack
      MODRINTH_MODPACK: https://blob.example.com/modpacks/cutes-0.1.0.mrpack
    volumes:
      - ./modpacks:/modpacks:ro
```

## Acknowledgments
This project's CI configuration extends [mc-modpack-kit](https://github.com/jh-devv/mc-modpack-kit), which is licensed under the Creative Commons Zero v1.0 Universal License.

[![The mc-modpack-kit logo](https://github.com/jh-devv/mc-modpack-kit/assets/122896463/003f8682-7e4f-4797-bdc8-2610a5d505de)](https://github.com/jh-devv/mc-modpack-kit)
