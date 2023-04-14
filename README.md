# Config 🧰

## Under construction 🛠

There are possibly a lot of issues, so please be patient.

## Run everything 🏃

Run the following command to install and set up all the packages and configurations listed in the Makefile.

```make
make
```

To just install the look and feel of the system, run the following command.

```make
make looks
```

## Usage 🐁

The Makefile has several targets that can be executed individually.

- `zsh` installs and sets up the zsh shell, oh-my-zsh, fzf, and zsh-autosuggestions.
- `directory` creates several directories in the home directory.
- `autokey` installs Autokey, a desktop automation utility.
- `ulauncher` installs Ulauncher, a fast application launcher.
- `kitty` installs Kitty, a terminal emulator.
- `neofeth` installs Neofetch, a system information tool.
- `background` installs and sets up a GPU video wallpaper.
- `themes` installs and sets up several themes and icons.

To execute a target, use the following command:

```make
make <target>
```

## Customization 💖

You can modify the Makefile to add or remove packages and configurations to suit your needs.
Contributing

## Contributing 🫂

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
