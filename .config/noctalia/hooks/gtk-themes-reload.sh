#!/usr/bin/env bash

current=$(gsettings get org.gnome.desktop.interface color-scheme)

gsettings set org.gnome.desktop.interface gtk-theme ""

if [[ "$current" == "'prefer-dark'" ]]; then
    gsettings set org.gnome.desktop.interface color-scheme prefer-light
    gsettings set org.gnome.desktop.interface color-scheme prefer-dark
    gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3-dark
else
    gsettings set org.gnome.desktop.interface color-scheme prefer-dark
    gsettings set org.gnome.desktop.interface color-scheme prefer-light
    gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3-light
fi