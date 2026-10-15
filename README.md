## Dotfiles Management

This repository uses [GNU Stow](https://www.gnu.org/software/stow/) to manage application configurations through symbolic links.

### Neovim

The configuration is stored in `nvim/.config/nvim/` and linked to `~/.config/nvim/`.

Deploy the configuration from the repository root:

```bash
stow -v -t ~ nvim
```

### Starship

The Starship configuration is stored in `starship/.config/starship/starship.toml`.

Deploy it using:

```bash
stow -v -t ~ starship/
```

This creates a symbolic link at `~/.config/starship/starship.toml`.

### General Usage

Run Stow commands from the repository root.

- `-v`: display the operations performed.
- `-t ~`: use the home directory as the target.
- `-D`: remove the package's symbolic links.

Deploy both packages:

```bash
stow -v -t ~ nvim starship
```

Remove the Starship links:

```bash
stow -v -D -t ~ starship
```

Configuration changes made in the repository are reflected through the symbolic links.

