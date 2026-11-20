# maro-terminal

Personal, portable terminal dotfiles for Linux, Ubuntu on WSL, and Windows Terminal.

The repository keeps shell configuration separate from terminal-emulator settings:
- `zsh/` contains the prompt, filename colors, aliases, and optional plugin loading.
- `windows-terminal/` contains a reusable Catppuccin Mocha color-scheme object.
- `install.sh` backs up the existing `.zshrc`, installs the configuration, and adds one source line.
- `uninstall.sh` removes the integration without replacing the rest of your `.zshrc`.

## What it provides

- Prompt with username, current directory, Git branch, and failed-command indicator.
- Colored `ls`, `ll`, and `la` output with directories grouped first.
- Distinct colors for common source, config, documentation, archive, and image extensions.
- Optional Zsh autosuggestions and syntax highlighting when their files are installed.
- Works with ordinary Linux Zsh installations; Oh My Zsh is not required.

## Requirements

- Linux or WSL distribution
- `zsh`
- GNU `ls` and `dircolors` (usually supplied by `coreutils`)
- Git (for Git branch information)

Optional:
- `zsh-autosuggestions`
- `zsh-syntax-highlighting`

### Ubuntu / Debian

```bash
sudo apt update
sudo apt install zsh git coreutils zsh-autosuggestions zsh-syntax-highlighting
```

### Fedora

```bash
sudo dnf install zsh git coreutils zsh-autosuggestions zsh-syntax-highlighting
```

### Arch Linux

```bash
sudo pacman -S zsh git coreutils zsh-autosuggestions zsh-syntax-highlighting
```

Package names and plugin file locations can vary by distribution. The plugin loader checks common locations and simply skips plugins it cannot find.

## Install

Clone the repository, then run:

```bash
git clone https://github.com/YOUR_GITHUB_USERNAME/maro-terminal.git
cd maro-terminal
chmod +x install.sh uninstall.sh
./install.sh
```

Restart Zsh or run:

```bash
exec zsh
```

The installer:
1. Backs up your current `~/.zshrc` to a timestamped file.
2. Copies this repository's `zsh/` configuration to `~/.config/maro-terminal/`.
3. Adds a clearly marked source block to `~/.zshrc`, only if it is not already present.

It does not replace your `.zshrc` or remove your Oh My Zsh configuration.

## Windows Terminal

Windows Terminal controls the terminal window's colors and font. Zsh controls the prompt and filename colors. They are separate layers.

1. Open Windows Terminal settings with `Ctrl+,`.
2. Open the JSON settings file.
3. Copy the object in `windows-terminal/catppuccin-mocha.json` into the top-level `schemes` array.
4. In the Ubuntu profile, set:

```json
"colorScheme": "Catppuccin Mocha"
```

5. Save and open a new Ubuntu tab.

Do not replace your entire Windows Terminal `settings.json` with this repository's scheme object. Keep your own profile GUIDs, keybindings, and other machine-specific settings.

For a consistent font, install Cascadia Code or a Nerd Font on Windows, then set the Ubuntu profile's font face in Windows Terminal settings.

## Uninstall

From the cloned repository:

```bash
./uninstall.sh
```

This removes the marked source block from `~/.zshrc` and removes `~/.config/maro-terminal/`. It does not delete your timestamped `.zshrc` backups or change your Windows Terminal settings.

## Customize

Edit the files under `zsh/`:
- `prompt.zsh`: prompt layout and Git branch display.
- `colors.zsh`: filename color rules.
- `aliases.zsh`: `ls`, `ll`, and `la`.
- `plugins.zsh`: optional plugin loading.

After editing, run:

```bash
cp -r zsh/. ~/.config/maro-terminal/
exec zsh
```

## Portability notes

The Zsh configuration is intended for Linux distributions and WSL. Windows Terminal is a Windows terminal emulator and can host WSL, PowerShell, and Command Prompt, but it does not make Zsh configuration apply to PowerShell or CMD. Native PowerShell needs its own profile configuration.

## License

MIT. See [LICENSE](LICENSE).
