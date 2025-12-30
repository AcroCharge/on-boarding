#!/bin/bash

# AcroCharge AWS Azure SSO CLI Setup Script
# Based on: https://acrocharge.atlassian.net/wiki/spaces/NANO/pages/164266065/AWS+Azure+SSO+for+CLI+access

set -e  # Exit on error

echo "================================================"
echo "AcroCharge AWS Azure SSO CLI Setup"
echo "================================================"
echo ""

# Color codes for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
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
    echo -e "${BLUE}ℹ $1${NC}"
}

# Step 1: Install npm
echo "Step 1: Checking npm installation..."
if command -v npm &> /dev/null; then
    print_success "npm is already installed (version: $(npm --version))"
else
    print_warning "npm not found. Installing npm..."
    brew install npm
    print_success "npm installed successfully"
fi

echo ""
echo "================================================"
echo "Step 2: Installing aws-azure-login"
echo "================================================"
echo ""

# Check if aws-azure-login is already installed
if command -v aws-azure-login &> /dev/null; then
    print_success "aws-azure-login is already installed"
    read -p "Do you want to reinstall/update it? (y/n): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Skipping aws-azure-login installation"
    else
        sudo npm install -g aws-azure-login --unsafe-perm
        sudo chmod -R go+rx $(npm root -g)
        print_success "aws-azure-login updated successfully"
    fi
else
    print_warning "Installing aws-azure-login globally..."
    sudo npm install -g aws-azure-login --unsafe-perm
    sudo chmod -R go+rx $(npm root -g)
    print_success "aws-azure-login installed successfully"
fi

echo ""
echo "================================================"
echo "Step 3: AWS Account Configuration"
echo "================================================"
echo ""

print_info "AWS Account Configuration Information"
echo ""
print_warning "For Application IDs and Tenant IDs, please refer to:"
echo "https://acrocharge.atlassian.net/wiki/spaces/NANO/pages/164266065/AWS+Azure+SSO+for+CLI+access"
echo ""
print_info "Available AWS Accounts:"
echo "  - Development (Access: All)"
echo "  - Staging (Access: All)"
echo "  - Production (Access: Devops and Devs)"
echo "  - Root, Monitoring, Management (Access: Devops Only)"
echo "  - Data (Access: Data-Ops Only)"
echo "  - Global-e, BestBuy (Client-specific access)"
echo ""

# Configuration helper function
configure_profile() {
    local profile_name=$1
    
    print_info "Configuring profile: $profile_name"
    echo ""
    print_warning "You will need the following information from the Confluence page:"
    echo "  - Azure Tenant ID (find in the documentation table)"
    echo "  - Azure App ID URI (find the Application ID for $profile_name in the table)"
    echo ""
    print_info "When prompted during configuration:"
    echo "  - Default Username: <your Azure username>"
    echo "  - Stay logged in: true"
    echo "  - Default Role ARN: leave blank"
    echo "  - Default Session Duration Hours: 1"
    echo ""
    
    aws-azure-login --configure --profile "$profile_name"
    
    # Add profile to azure_profiles file
    if ! grep -q "^${profile_name}$" ~/.aws/azure_profiles 2>/dev/null; then
        echo "$profile_name" >> ~/.aws/azure_profiles
        print_success "Added $profile_name to ~/.aws/azure_profiles"
    fi
}

# Interactive configuration
read -p "Do you want to configure AWS profiles now? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo ""
    echo "Common profiles to configure:"
    echo "  1. development - Development environment (Access: All)"
    echo "  2. staging - Staging environment (Access: All)"
    echo "  3. production - Production environment (Access: Devops and Devs)"
    echo ""
    
    # Configure Development
    read -p "Configure Development profile? (y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        configure_profile "development"
    fi
    
    # Configure Staging
    read -p "Configure Staging profile? (y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        configure_profile "staging"
    fi
    
    # Configure Production
    read -p "Configure Production profile? (y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        configure_profile "production"
    fi
    
    # Custom profile
    echo ""
    read -p "Configure additional custom profile? (y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        read -p "Enter profile name (e.g., data, monitoring): " custom_profile
        configure_profile "$custom_profile"
    fi
fi

echo ""
echo "================================================"
echo "Step 4: First Login"
echo "================================================"
echo ""

print_info "To login to a profile, use:"
echo "  aws-azure-login --profile <profile-name>"
echo ""
print_info "For GUI login (if you have 2FA configured):"
echo "  aws-azure-login --profile <profile-name> --mode gui"
echo ""
print_info "For subsequent logins without prompts:"
echo "  aws-azure-login --profile <profile-name> --no-prompt"
echo ""

# Perform first login if profiles were configured
if [ -f ~/.aws/azure_profiles ] && [ -s ~/.aws/azure_profiles ]; then
    read -p "Do you want to perform first login now? (y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        first_profile=$(head -n 1 ~/.aws/azure_profiles)
        print_info "Logging in to profile: $first_profile"
        echo ""
        read -p "Use GUI mode for 2FA? (y/n): " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            aws-azure-login --profile "$first_profile" --mode gui
        else
            aws-azure-login --profile "$first_profile"
        fi
        print_success "Login successful!"
    fi
fi

echo ""
echo "================================================"
echo "Step 5: Automated Session Renewal (Optional)"
echo "================================================"
echo ""

print_info "You can automate AWS session renewal using crontab"
print_warning "This will refresh credentials every 15 minutes"
echo ""

read -p "Do you want to set up automated session renewal? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    # Create crontab entry
    CRON_CMD='*/15 * * * * for profile in $(cat ~/.aws/azure_profiles); do aws-azure-login --profile $profile --no-prompt; done'
    PATH_CMD='PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/homebrew/bin'
    
    # Check if crontab exists
    if crontab -l &> /dev/null; then
        # Check if the entry already exists
        if crontab -l | grep -q "aws-azure-login"; then
            print_warning "Crontab entry for aws-azure-login already exists"
        else
            (crontab -l 2>/dev/null; echo "$PATH_CMD"; echo "$CRON_CMD") | crontab -
            print_success "Crontab entry added successfully"
        fi
    else
        (echo "$PATH_CMD"; echo "$CRON_CMD") | crontab -
        print_success "Crontab created and entry added successfully"
    fi
    
    print_info "Your sessions will now auto-refresh every 15 minutes"
fi

echo ""
echo "================================================"
echo "Kubernetes/Lens Connection Commands"
echo "================================================"
echo ""

print_info "After logging in, connect to Kubernetes clusters using kubectl commands."
print_warning "For the exact kubectl commands with cluster ARNs, please refer to:"
echo "https://acrocharge.atlassian.net/wiki/spaces/NANO/pages/164266065/AWS+Azure+SSO+for+CLI+access"
echo ""
print_info "General format:"
echo "  aws eks update-kubeconfig --name <cluster-name> --region us-east-1 --profile <profile-name>"
echo "  kubectl config use-context <cluster-arn>"
echo ""
print_info "Available clusters:"
echo "  - development-eks-2"
echo "  - staging-eks-2"
echo "  - production-eks-3 (current)"
echo "  - production-eks-2 (deprecated)"
echo ""

echo "================================================"
echo "Additional Recommended Tools"
echo "================================================"
echo ""

print_info "Consider installing these tools for easier AWS/K8s management:"
echo ""
echo "1. kubectx - Tool for switching Kubernetes context"
echo "   brew install kubectx"
echo "   GitHub: https://github.com/ahmetb/kubectx"
echo ""
echo "2. awsx - Tool for switching AWS profile"
echo "   GitHub: https://github.com/neofinancial/awsx"
echo ""

echo "================================================"
echo "Setup Complete!"
echo "================================================"
echo ""

print_success "AWS Azure SSO CLI setup completed successfully!"
echo ""
print_info "Quick reference:"
echo "  - Login: aws-azure-login --profile <profile-name>"
echo "  - Login (no prompt): aws-azure-login --profile <profile-name> --no-prompt"
echo "  - Configure new profile: aws-azure-login --configure --profile <profile-name>"
echo "  - Profiles list: cat ~/.aws/azure_profiles"
echo ""
print_info "Documentation: https://acrocharge.atlassian.net/wiki/spaces/NANO/pages/164266065"
echo ""

