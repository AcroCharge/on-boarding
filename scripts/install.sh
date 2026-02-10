#!/bin/bash

# AcroCharge Onboarding Installation Script
# This script automates the installation of required development tools

set -e  # Exit on error

echo "================================================"
echo "AcroCharge Development Environment Setup"
echo "================================================"
echo ""

# Color codes for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to print success messages
print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

# Function to print warning messages
print_warning() {
    echo -e "${YELLOW}⚠ $1${NC}"
}

# Function to print error messages
print_error() {
    echo -e "${RED}✗ $1${NC}"
}

# Function to print info messages
print_info() {
    echo -e "${YELLOW}ℹ $1${NC}"
}

# Check if Homebrew is installed
echo "Checking for Homebrew..."
if command -v brew &> /dev/null; then
    print_success "Homebrew is already installed"
else
    print_warning "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    print_success "Homebrew installed successfully"
fi

echo ""
echo "Updating Homebrew..."
brew update
print_success "Homebrew updated"

echo ""
echo "================================================"
echo "Installing Development Tools"
echo "================================================"
echo ""

# Install Docker
echo "Installing Docker..."
if command -v docker &> /dev/null; then
    print_success "Docker is already installed"
else
    brew install --cask docker
    print_success "Docker installed successfully"
fi

# Install PNPM
echo ""
echo "Installing PNPM..."
if command -v pnpm &> /dev/null; then
    print_success "PNPM is already installed"
else
    brew install pnpm
    print_success "PNPM installed successfully"
fi

# Install Node 20.19 (using nvm for version management)
echo ""
echo "Installing Node.js 20.19..."
if command -v node &> /dev/null; then
    CURRENT_NODE_VERSION=$(node --version)
    print_warning "Node.js is already installed (version: $CURRENT_NODE_VERSION)"
    print_info "Required version: v20.19.x"
    print_info "Consider using nvm to manage Node versions: https://github.com/nvm-sh/nvm"
else
    # Check if nvm is installed
    if command -v nvm &> /dev/null; then
        nvm install 20.19
        nvm use 20.19
        print_success "Node.js 20.19 installed via nvm"
    else
        brew install node@20
        print_success "Node.js 20 installed via brew"
        print_warning "For exact version 20.19, consider using nvm"
    fi
fi

# Install OpenAPI Generator
echo ""
echo "Installing OpenAPI Generator..."
if command -v openapi-generator &> /dev/null; then
    print_success "OpenAPI Generator is already installed"
else
    brew install openapi-generator
    print_success "OpenAPI Generator installed successfully"
fi

# Install kubectl
echo ""
echo "Installing kubectl..."
if command -v kubectl &> /dev/null; then
    print_success "kubectl is already installed"
else
    brew install kubectl
    print_success "kubectl installed successfully"
fi

# Install MongoDB Compass
echo ""
echo "Installing MongoDB Compass..."
if brew list --cask mongodb-compass &> /dev/null; then
    print_success "MongoDB Compass is already installed"
else
    brew install --cask mongodb-compass
    print_success "MongoDB Compass installed successfully"
fi

# Install Lens
echo ""
echo "Installing Lens..."
if brew list --cask lens &> /dev/null; then
    print_success "Lens is already installed"
else
    brew install --cask lens
    print_success "Lens installed successfully"
fi

echo ""
echo "================================================"
echo "Manual Installation Required"
echo "================================================"
echo ""

print_info "The following tools require manual installation or configuration:"
echo ""
echo "1. Harmony VPN Agent"
echo "   Download: https://support.perimeter81.com/docs/downloading-the-agent"
echo "   After installation, request configuration from IT"
echo ""
echo "2. Vanta"
echo "   Follow instructions: https://docs.google.com/document/u/1/d/1MgeUVfOOIiSQeMsrYM97zCAuxwKGIxFkWJWYFufhdng/edit#"
echo ""
echo "3. Code Editor (Choose one):"
echo "   - Visual Studio Code: https://code.visualstudio.com/Download"
echo "   - Cursor: https://cursor.com/download"
echo "   - Claude: https://claude.com/download"
echo "   - WebStorm: https://www.jetbrains.com/webstorm/download/"
echo ""

echo "================================================"
echo "Installation Complete!"
echo "================================================"
echo ""
print_success "All automated installations completed successfully"
print_info "Please complete the manual installations listed above"
echo ""
echo "Next steps:"
echo "1. Restart your terminal to ensure all tools are in PATH"
echo "2. Complete manual installations"
echo "3. Request VPN configuration from IT"
echo "4. Clone the necessary repositories"
echo ""
