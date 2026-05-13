# nix-roster

Nix flake for [Roster](https://git.bugsy.cz/beval/roster), a modern GNOME HTTP client for REST API testing.

[Español](./README-es.md)

## Features

- Send HTTP requests (GET, POST, PUT, DELETE)
- Configure custom headers and request bodies
- View response headers and bodies with syntax highlighting
- Track request history with persistence
- Organize requests into projects
- Environment variables with secure credential storage
- JavaScript preprocessing and postprocessing scripts
- Export requests (cURL and more)
- GNOME-native UI

## Installation

Requires Nix with flake support enabled.

### Run directly
```bash
nix run github:hashbangcore/nix-roster
```

### Install to profile
```bash
nix profile add github:hashbangcore/nix-roster
```

### Build package
```bash
nix build github:hashbangcore/nix-roster
```

### Shell with roster available
```bash
nix shell github:hashbangcore/nix-roster#roster
```

## Upstream

- **Repository**: https://git.bugsy.cz/beval/roster
- **Flathub**: https://flathub.org/en/apps/cz.bugsy.roster
