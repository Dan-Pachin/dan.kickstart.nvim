#!/bin/bash

# Fix Mason Dependencies Script
# This script installs all required dependencies for Mason tools

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to install system dependencies
install_system_deps() {
    print_status "Installing system dependencies..."
    
    sudo apt update
    sudo apt install -y \
        build-essential \
        curl \
        wget \
        git \
        unzip \
        ca-certificates \
        gnupg \
        lsb-release \
        software-properties-common
    
    print_success "System dependencies installed"
}

# Function to install Go
install_go() {
    if command_exists go; then
        print_status "Go already installed: $(go version)"
        return
    fi
    
    print_status "Installing Go..."
    sudo apt install -y golang-go
    
    # Add Go to PATH
    if ! grep -q "/usr/lib/go/bin" ~/.bashrc; then
        echo 'export PATH=$PATH:/usr/lib/go/bin' >> ~/.bashrc
    fi
    
    export PATH=$PATH:/usr/lib/go/bin
    
    if command_exists go; then
        print_success "Go installed: $(go version)"
    else
        print_error "Failed to install Go"
        exit 1
    fi
}

# Function to install Node.js
install_nodejs() {
    if command_exists node && command_exists npm; then
        print_status "Node.js already installed: $(node --version)"
        return
    fi
    
    print_status "Installing Node.js..."
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt-get install -y nodejs
    
    if command_exists node && command_exists npm; then
        print_success "Node.js installed: $(node --version) (npm: $(npm --version))"
    else
        print_error "Failed to install Node.js"
        exit 1
    fi
}

# Function to install Python 3
install_python() {
    if command_exists python3 && command_exists pip3; then
        print_status "Python 3 already installed: $(python3 --version)"
        return
    fi
    
    print_status "Installing Python 3..."
    sudo apt install -y python3 python3-pip python3-venv
    
    if command_exists python3 && command_exists pip3; then
        print_success "Python 3 installed: $(python3 --version) (pip: $(pip3 --version | cut -d' ' -f2))"
    else
        print_error "Failed to install Python 3"
        exit 1
    fi
}

# Function to install Rust
install_rust() {
    if command_exists cargo; then
        print_status "Rust already installed: $(cargo --version)"
        return
    fi
    
    print_status "Installing Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source ~/.cargo/env
    
    if command_exists cargo; then
        print_success "Rust installed: $(cargo --version)"
    else
        print_error "Failed to install Rust"
        exit 1
    fi
}

# Function to install tools manually
install_tools_manually() {
    print_status "Installing tools manually..."
    
    # Install gopls
    if ! command_exists gopls; then
        print_status "Installing gopls..."
        go install golang.org/x/tools/gopls@latest
        print_success "gopls installed"
    else
        print_status "gopls already installed"
    fi
    
    # Install gofumpt
    if ! command_exists gofumpt; then
        print_status "Installing gofumpt..."
        go install mvdan.cc/gofumpt@latest
        print_success "gofumpt installed"
    else
        print_status "gofumpt already installed"
    fi
    
    # Install pyright
    if ! command_exists pyright; then
        print_status "Installing pyright..."
        npm install -g pyright
        print_success "pyright installed"
    else
        print_status "pyright already installed"
    fi
    
    # Install typescript-language-server
    if ! command_exists typescript-language-server; then
        print_status "Installing typescript-language-server..."
        npm install -g typescript-language-server
        print_success "typescript-language-server installed"
    else
        print_status "typescript-language-server already installed"
    fi
    
    # Install stylua
    if ! command_exists stylua; then
        print_status "Installing stylua..."
        cargo install stylua
        print_success "stylua installed"
    else
        print_status "stylua already installed"
    fi
}

# Function to provide final instructions
show_final_instructions() {
    echo
    print_success "Dependencies installed successfully!"
    echo
    echo -e "${BLUE}Next steps:${NC}"
    echo "1. Restart your terminal or run: ${GREEN}source ~/.bashrc${NC}"
    echo "2. Start Neovim: ${GREEN}nvim${NC}"
    echo "3. Run: ${GREEN}:Mason${NC} to verify tools are available"
    echo "4. Run: ${GREEN}:MasonInstallAll${NC} to install remaining tools"
    echo
    echo -e "${BLUE}If Mason still fails, the tools are now installed manually and should work.${NC}"
    echo
}

# Main execution
main() {
    echo -e "${BLUE}================================${NC}"
    echo -e "${BLUE}  Fix Mason Dependencies        ${NC}"
    echo -e "${BLUE}================================${NC}"
    echo
    
    # Install dependencies
    install_system_deps
    install_go
    install_nodejs
    install_python
    install_rust
    
    # Install tools manually
    install_tools_manually
    
    # Show final instructions
    show_final_instructions
}

# Run main function
main "$@"
