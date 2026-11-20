# maro-terminal

Personal, portable terminal dotfiles for Linux, Ubuntu on WSL, and Windows Terminal.

## Features

- Zsh prompt with username, current directory, and Git branch.
- No noisy error/success glyph in the prompt.
- Colored file listings with GNU `ls` / `LS_COLORS`.
- Zsh syntax highlighting for recognized commands, unknown command tokens, option-shaped tokens, quoting, redirections, and shell syntax.
- Command-history autosuggestions when the optional package is installed.
- Zsh completion system, with additional command definitions when `zsh-completions` is installed.
- Reusable Catppuccin Mocha Windows Terminal color scheme.

## Requirements

Install Zsh, Git, and GNU coreutils. Optional packages add richer interactive features.

### Ubuntu / Debian / WSL

```bash
sudo apt update
sudo apt install zsh git coreutils zsh-autosuggestions zsh-syntax-highlighting zsh-completions
```

### Fedora

```bash
sudo dnf install zsh git coreutils zsh-autosuggestions zsh-syntax-highlighting zsh-completions
```

### Arch Linux

```bash
sudo pacman -S zsh git coreutils zsh-autosuggestions zsh-syntax-highlighting zsh-completions
```

Package names and plugin paths can vary across distributions. The plugin loader checks common paths; the base prompt and aliases still work if optional packages are absent.

## Install

```bash
git clone https://github.com/YOUR_GITHUB_USERNAME/maro-terminal.git
cd maro-terminal
chmod +x install.sh uninstall.sh
./install.sh
exec zsh
```

The installer backs up an existing `~/.zshrc`, copies the repository configuration to `~/.config/maro-terminal/`, and appends one marked source line. It does not replace the rest of your `.zshrc`.

## What highlighting can and cannot do

`zsh-syntax-highlighting` colors shell syntax as you type. It can identify command names, unknown command tokens, common option-shaped tokens, quoting, redirections, and other syntax. It does **not** reliably validate every option against every command's actual option parser. For example, whether `git --made-up-option` is a valid Git option is best checked by Git itself.

Command-specific completions provide the next layer: press `TAB` after a command or option to see available completions. `zsh-completions` adds definitions for many commands, but coverage depends on installed completion definitions and the command.

URLs typed at the prompt are not automatically made into clickable terminal hyperlinks by a color theme. Clickable links in terminal output require the program producing the output and the terminal emulator to support OSC 8 hyperlinks. This repository does not claim to enable clickable links globally.

`LS_COLORS` controls filename colors in `ls`; it does not control syntax highlighting while typing commands.

## Windows Terminal

Windows Terminal controls the window's palette, font, tabs, and background. Zsh controls the prompt and command-line highlighting inside WSL.

Add the object in `windows-terminal/catppuccin-mocha.json` to the top-level `schemes` array in your Windows Terminal `settings.json`, then set `"colorScheme": "Catppuccin Mocha"` on the Ubuntu profile. Keep machine-specific profile GUIDs and keybindings in each machine's own settings file.

## Update on an installed machine

```bash
cd ~/maro-terminal
git pull
cp -R zsh/. ~/.config/maro-terminal/
exec zsh
```

## Uninstall

```bash
./uninstall.sh
```

This removes the marked integration and installed configuration. It preserves timestamped `.zshrc` backups and does not alter Windows Terminal settings.

## Customize

- `zsh/prompt.zsh`: prompt layout.
- `zsh/colors.zsh`: filename colors.
- `zsh/aliases.zsh`: listing aliases.
- `zsh/plugins.zsh`: completion, autosuggestions, and syntax-highlighting styles.

## License

MIT. See [LICENSE](LICENSE).
