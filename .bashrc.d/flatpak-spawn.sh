#!/bin/bash -e

host() {
    flatpak-spawn --host $@
}
