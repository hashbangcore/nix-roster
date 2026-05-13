# nix-roster

Nix flake para [Roster](https://git.bugsy.cz/beval/roster), un cliente HTTP moderno para GNOME para pruebas de APIs REST.

[English](./README.md)

## Características

- Enviar solicitudes HTTP (GET, POST, PUT, DELETE)
- Configurar cabeceras y cuerpo de solicitudes
- Ver cabeceras y cuerpo de respuestas con resaltado de sintaxis
- Historial de solicitudes persistente
- Organizar solicitudes en proyectos
- Variables de entorno con almacenamiento seguro de credenciales
- Scripts de preprocesamiento y posprocesamiento en JavaScript
- Exportar solicitudes (cURL y más)
- Interfaz nativa GNOME

## Instalación

Requiere Nix con soporte de flakes habilitado.

### Ejecutar directamente
```bash
nix run github:hashbangcore/nix-roster
```

### Instalar en perfil
```bash
nix profile add github:hashbangcore/nix-roster
```

### Compilar paquete
```bash
nix build github:hashbangcore/nix-roster
```

### Shell con roster disponible
```bash
nix shell github:hashbangcore/nix-roster#roster
```

## Upstream

- **Repositorio**: https://git.bugsy.cz/beval/roster
- **Flathub**: https://flathub.org/en/apps/cz.bugsy.roster
