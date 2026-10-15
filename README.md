## Neovim Setup

This repository manages Neovim configuration using [GNU Stow](https://www.gnu.org/software/stow/).

The configuration is stored in `nvim/.config/nvim/`, mirroring its destination at `~/.config/nvim/`.

### Installation

Install GNU Stow:

```bash
sudo apt install stow
```

From the repository root, create the symbolic links:

```bash
stow -v -t ~ nvim
```

- `-v`: verbose output.
- `-t ~`: sets the home directory as the target.
- `nvim`: selects the Neovim configuration package.

### Maintenance

Edit files directly in `nvim/.config/nvim/`. Changes are automatically reflected in Neovim through symbolic links.

To remove the links:

```bash
stow -v -D -t ~ nvim
```
