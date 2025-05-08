#!/bin/bash

# 1. Remove current Neovim installation (if any)
echo "Removing current Neovim installation..."
sudo apt remove --purge neovim -y

# 2. Add the stable PPA for Neovim
echo "Adding Neovim stable PPA..."
sudo add-apt-repository ppa:neovim-ppa/stable -y
sudo apt update

# 3. Check if Neovim 10 is available in the stable PPA
echo "Checking available Neovim versions..."
NEOVIM_VERSION=$(apt-cache show neovim | grep Version | head -n 1 | cut -d' ' -f2)

# If Neovim 10 is available in the PPA, install it
if [[ "$NEOVIM_VERSION" == "0.10"* ]]; then
    echo "Installing Neovim 10..."
    sudo apt install neovim -y
else
    # If Neovim 10 isn't available in the PPA, build it from source
    echo "Neovim 10 not found in the PPA, building from source..."

    # Install build dependencies
    echo "Installing build dependencies..."
    sudo apt install -y ninja-build gettext cmake unzip curl
    sudo apt install -y libtool libtool-bin autoconf automake cmake g++ pkg-config unzip

    # Clone the Neovim repository and checkout Neovim 0.10 (Neovim 10)
    echo "Cloning Neovim repository..."
    git clone https://github.com/neovim/neovim.git
    cd neovim
    git checkout v0.10.0  # Replace with exact tag for Neovim 10

    # Build Neovim from source
    echo "Building Neovim 10 from source..."
    make CMAKE_BUILD_TYPE=Release
    sudo make install

    # Go back to the home directory
    cd ..
fi

# 4. Verify the installed Neovim version
echo "Verifying the installed version of Neovim..."
nvim --version

