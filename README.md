<h3 align="center">
 <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/misc/transparent.png" height="30" width="0px"/>
 NixOS and Nix Darwin Config for <a href="https://github.com/eripa">eripa</a>
 <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/misc/transparent.png" height="30" width="0px"/>
</h3>

<p align="center">
 <a href="https://github.com/eripa/config/stargazers"><img src="https://img.shields.io/github/stars/eripa/config?colorA=363a4f&colorB=b7bdf8&style=for-the-badge"></a>
 <a href="https://github.com/eripa/config/commits"><img src="https://img.shields.io/github/last-commit/eripa/config?colorA=363a4f&colorB=f5a97f&style=for-the-badge"></a>
  <a href="https://nixos.wiki/wiki/Flakes" target="_blank">
 <img alt="Nix Flakes Ready" src="https://img.shields.io/static/v1?logo=nixos&logoColor=d8dee9&label=Nix%20Flakes&labelColor=5e81ac&message=Ready&color=d8dee9&style=for-the-badge">
</a>
<a href="https://github.com/snowfallorg/lib" target="_blank">
 <img alt="Built With Snowfall" src="https://img.shields.io/static/v1?logoColor=d8dee9&label=Built%20With&labelColor=5e81ac&message=Snowfall&color=d8dee9&style=for-the-badge">
</a>
</p>

<p>
<!--
	This paragraph is not empty, it contains an em space (UTF-8 8195) on the next line in order
	to create a gap in the page.
-->
  
</p>

Personal Nix config for each of my machines.

> ✨ Go even farther beyond.

## Install

### Clone repo

```shell
git clone https://github.com/eripa/config.git ~/dev/config
```

### Automatic

```shell
cd ~/dev/config && sudo nixos-rebuild switch --flake . # linux
```

## Credits

- [github:jakehamilton/config](https://github.com/jakehamilton/config)
- [github:squirmy/nixos-config](https://github.com/squirmy/nixos-config)

## Screenshots

![clean](./assets/clean.png)

![busy](./assets/busy.png)

![firefox](./assets/firefox.png)

## Overlays

See the following example for how to apply overlays from this flake.

```nix
{
	description = "";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/release-22.05";
		unstable.url = "github:nixos/nixpkgs";

		snowfall-lib = {
			url = "github:snowfallorg/lib";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		horizon = {
			url = "github:jakehamilton/config";
			inputs.nixpkgs.follows = "nixpkgs";
			inputs.unstable.follows = "unstable";
		};
	};

	outputs = inputs:
		inputs.snowfall-lib.mkFlake {
			inherit inputs;

			src = ./.;

			overlays = with inputs; [
				# Get all of the packages from this flake by using the main overlay.
				horizon.overlays.default

				# Individual overlays can be accessed from
				# `horizon.overlays.<name>`.

				# These overlays pull packages from nixos-unstable or other sources.
				horizon.overlays.bibata-cursors
				horizon.overlays.chromium
				horizon.overlays.comma
				horizon.overlays.default
				horizon.overlays.deploy-rs
				horizon.overlays.discord
				horizon.overlays.firefox
				horizon.overlays.flyctl
				horizon.overlays.freetube
				horizon.overlays.gamescope
				horizon.overlays.gnome
				horizon.overlays.kubecolor
				horizon.overlays.linux
				horizon.overlays.lutris
				horizon.overlays.nordic
				horizon.overlays.obs
				horizon.overlays.pocketcasts
				horizon.overlays.prismlauncher
				horizon.overlays.tmux
				horizon.overlays.top-bar-organizer
				horizon.overlays.yt-music

				# Individual overlays for each package in this flake
				# are available for convenience.
				horizon.overlays."package/at"
				horizon.overlays."package/bibata-cursors"
				horizon.overlays."package/cowsay-plus"
				horizon.overlays."package/doukutsu-rs"
				horizon.overlays."package/firefox-nordic-theme"
				horizon.overlays."package/frappe-books"
				horizon.overlays."package/hey"
				horizon.overlays."package/infrared"
				horizon.overlays."package/kalidoface"
				horizon.overlays."package/list-iommu"
				horizon.overlays."package/nix-get-protonup"
				horizon.overlays."package/nix-update-index"
				horizon.overlays."package/nixos-option"
				horizon.overlays."package/nixos-revision"
				horizon.overlays."package/steam"
				horizon.overlays."package/titan"
				horizon.overlays."package/twitter"
				horizon.overlays."package/wallpapers"
				horizon.overlays."package/xdg-open-with-portal"
			];
		};
}
```
