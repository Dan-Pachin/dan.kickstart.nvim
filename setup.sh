#!/bin/bash

# Neovim Configuration Setup Script for Ubuntu
# This script automates the installation of Neovim and this configuration
# Usage: ./setup.sh

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
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

# Function to check if running as root
check_root() {
    if [[ $EUID -eq 0 ]]; then
        print_error "This script should not be run as root"
        exit 1
    fi
}

# Function to update system packages
update_system() {
    print_status "Updating system packages..."
    sudo apt update
    print_success "System packages updated"
}

# Function to install basic dependencies
install_basic_deps() {
    print_status "Installing basic dependencies..."
    sudo apt install -y \
        software-properties-common \
        curl \
        wget \
        git \
        build-essential \
        make \
        gcc \
        unzip
    print_success "Basic dependencies installed"
}

# Function to install Neovim
install_neovim() {
    print_status "Installing Neovim..."
    
    # Add Neovim PPA
    sudo add-apt-repository ppa:neovim-ppa/stable -y
    sudo apt update
    
    # Install Neovim
    sudo apt install -y neovim
    
    # Verify installation
    if command_exists nvim; then
        NVIM_VERSION=$(nvim --version | head -n1)
        print_success "Neovim installed: $NVIM_VERSION"
    else
        print_error "Failed to install Neovim"
        exit 1
    fi
}

# Function to install Node.js
install_nodejs() {
    print_status "Installing Node.js..."
    
    # Install Node.js LTS from NodeSource
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt-get install -y nodejs
    
    # Verify installation
    if command_exists node && command_exists npm; then
        NODE_VERSION=$(node --version)
        NPM_VERSION=$(npm --version)
        print_success "Node.js installed: $NODE_VERSION (npm: $NPM_VERSION)"
    else
        print_error "Failed to install Node.js"
        exit 1
    fi
}

# Function to install Python 3
install_python() {
    print_status "Installing Python 3..."
    
    sudo apt install -y python3 python3-pip python3-venv
    
    # Verify installation
    if command_exists python3 && command_exists pip3; then
        PYTHON_VERSION=$(python3 --version)
        PIP_VERSION=$(pip3 --version | cut -d' ' -f2)
        print_success "Python 3 installed: $PYTHON_VERSION (pip: $PIP_VERSION)"
    else
        print_error "Failed to install Python 3"
        exit 1
    fi
}

# Function to install Go
install_go() {
    print_status "Installing Go..."
    
    # Install Go from package manager
    sudo apt install -y golang-go
    
    # Add Go to PATH if not already there
    if ! grep -q "/usr/lib/go/bin" ~/.bashrc; then
        echo 'export PATH=$PATH:/usr/lib/go/bin' >> ~/.bashrc
    fi
    
    # Source bashrc for current session
    export PATH=$PATH:/usr/lib/go/bin
    
    # Verify installation
    if command_exists go; then
        GO_VERSION=$(go version)
        print_success "Go installed: $GO_VERSION"
    else
        print_error "Failed to install Go"
        exit 1
    fi
}

# Function to backup existing Neovim config
backup_existing_config() {
    if [ -d ~/.config/nvim ]; then
        BACKUP_DIR=~/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)
        print_warning "Existing Neovim config found. Backing up to: $BACKUP_DIR"
        mv ~/.config/nvim "$BACKUP_DIR"
        print_success "Existing config backed up"
    fi
}

# Function to clone and setup configuration
setup_neovim_config() {
    print_status "Setting up Neovim configuration..."
    
    # Get the repository URL from git remote (if we're in a git repo)
    if [ -d .git ]; then
        REPO_URL=$(git remote get-url origin)
        print_status "Detected repository: $REPO_URL"
        
        # Clone to ~/.config/nvim
        git clone "$REPO_URL" ~/.config/nvim
        print_success "Configuration cloned to ~/.config/nvim"
    else
        print_error "Not in a git repository. Please run this script from the cloned repository directory."
        exit 1
    fi
}

# Function to create test files
create_test_files() {
    print_status "Creating test files..."
    
    # Create test directory
    mkdir -p ~/neovim-test
    
    # Python test file
    cat > ~/neovim-test/test.py << 'EOF'
def hello():
    """A simple test function."""
    name = "Neovim"
    print(f"Hello, {name}!")
    return name

if __name__ == "__main__":
    result = hello()
    print(f"Function returned: {result}")
EOF

    # Go test file
    cat > ~/neovim-test/test.go << 'EOF'
package main

import "fmt"

func main() {
    fmt.Println("Hello from Go!")
}
EOF

    # TypeScript test file
    cat > ~/neovim-test/test.ts << 'EOF'
function hello(name: string): string {
    return `Hello, ${name}!`;
}

const result = hello("TypeScript");
console.log(result);
EOF

    print_success "Test files created in ~/neovim-test/"
}

# Function to provide final instructions
show_final_instructions() {
    echo
    print_success "Setup completed successfully!"
    echo
    echo -e "${BLUE}Next steps:${NC}"
    echo "1. Start Neovim: ${GREEN}nvim${NC}"
    echo "2. Wait for plugins to install (may take 2-3 minutes)"
    echo "3. Run: ${GREEN}:Lazy sync${NC} (if plugins don't install automatically)"
    echo "4. Run: ${GREEN}:Mason${NC} to verify tools are installed"
    echo "5. Test with: ${GREEN}nvim ~/neovim-test/test.py${NC}"
    echo
    echo -e "${BLUE}Key shortcuts to remember:${NC}"
    echo "- ${GREEN}<leader>f${NC} (space+f): Format code"
    echo "- ${GREEN}<leader>e${NC} (space+e): Toggle file explorer"
    echo "- ${GREEN}<leader>sf${NC} (space+s+f): Search files"
    echo "- ${GREEN}grd${NC}: Go to definition"
    echo "- ${GREEN}grr${NC}: Find references"
    echo
    echo -e "${BLUE}Supported languages:${NC}"
    echo "- Lua (with stylua formatting)"
    echo "- Go (with gofumpt/golines formatting)"
    echo "- Python (with black/isort formatting)"
    echo "- TypeScript/JavaScript (with prettier formatting)"
    echo
    echo -e "${YELLOW}Note: First startup may take a few minutes to install all plugins and tools.${NC}"
    echo -e "${YELLOW}Subsequent startups will be much faster.${NC}"
    echo
}

# Main execution
main() {
    echo -e "${BLUE}================================${NC}"
    echo -e "${BLUE}  Neovim Configuration Setup   ${NC}"
    echo -e "${BLUE}================================${NC}"
    echo
    
    # Check if running as root
    check_root
    
    # Check if we're in a git repository
    if [ ! -d .git ]; then
        print_error "This script must be run from within the cloned repository directory"
        print_error "Please clone your repository first, then run this script from that directory"
        exit 1
    fi
    
    # Update system
    update_system
    
    # Install dependencies
    install_basic_deps
    install_neovim
    install_nodejs
    install_python
    install_go
    
    # Setup configuration
    backup_existing_config
    setup_neovim_config
    
    # Create test files
    create_test_files
    
    # Show final instructions
    show_final_instructions
}

# Run main function
main "$@"
