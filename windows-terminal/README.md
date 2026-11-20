# Windows Terminal

`catppuccin-mocha.json` is a reusable color-scheme object, not a complete Windows Terminal settings file.

Add its contents as one object inside the top-level `schemes` array in your Windows Terminal `settings.json`. Then add `"colorScheme": "Catppuccin Mocha"` to the profile you want to style (for example, Ubuntu).

Keep each machine's existing profile GUIDs, command lines, keybindings, and other settings. Windows Terminal settings are Windows-specific; the Zsh files in `../zsh/` provide the prompt and Linux filename colors inside WSL.
