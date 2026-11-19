#!/bin/bash

if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed. Please install Homebrew first."
    exit 1
fi

if ! command -v cargo &> /dev/null; then
    echo "Cargo is not installed. Please install Rust and Cargo first."
    exit 1
fi

if ! command -v cargo-binstall &> /dev/null; then
    echo "cargo-binstall is not installed. Installing cargo-binstall..."
    brew install cargo-binstall
fi

cargo binstall zellij
