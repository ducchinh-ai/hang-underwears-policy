#!/bin/bash

# Hang Underwears Ubuntu Theme Installation Script
# Script cài đặt theme Hang Underwears cho Ubuntu

set -e

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

# Check if running on Ubuntu
check_ubuntu() {
    if ! command -v lsb_release &> /dev/null; then
        print_error "Không thể xác định hệ điều hành / Cannot determine OS"
        exit 1
    fi
    
    if [[ $(lsb_release -si) != "Ubuntu" ]]; then
        print_warning "Script này được thiết kế cho Ubuntu / This script is designed for Ubuntu"
        read -p "Bạn có muốn tiếp tục? / Do you want to continue? (y/N): " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            exit 1
        fi
    fi
}

# Check if GNOME is running
check_gnome() {
    if [[ "$XDG_CURRENT_DESKTOP" != *"GNOME"* ]]; then
        print_warning "GNOME Desktop không được phát hiện / GNOME Desktop not detected"
        print_warning "Theme có thể không hoạt động đúng / Theme might not work properly"
        read -p "Bạn có muốn tiếp tục? / Do you want to continue? (y/N): " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            exit 1
        fi
    fi
}

# Install required packages
install_dependencies() {
    print_status "Cài đặt các gói cần thiết / Installing required packages..."
    
    # Update package list
    sudo apt update
    
    # Install GNOME Tweaks if not installed
    if ! command -v gnome-tweaks &> /dev/null; then
        print_status "Cài đặt GNOME Tweaks / Installing GNOME Tweaks..."
        sudo apt install -y gnome-tweaks
    else
        print_success "GNOME Tweaks đã được cài đặt / GNOME Tweaks is already installed"
    fi
    
    # Install git if not installed
    if ! command -v git &> /dev/null; then
        print_status "Cài đặt Git / Installing Git..."
        sudo apt install -y git
    else
        print_success "Git đã được cài đặt / Git is already installed"
    fi
}

# Create theme directories
create_directories() {
    print_status "Tạo thư mục theme / Creating theme directories..."
    
    mkdir -p ~/.themes
    mkdir -p ~/.icons
    mkdir -p ~/.local/share/backgrounds
    
    print_success "Đã tạo thư mục / Directories created"
}

# Download and install theme
install_theme() {
    print_status "Tải và cài đặt theme / Downloading and installing theme..."
    
    # Create temporary directory
    TEMP_DIR=$(mktemp -d)
    cd "$TEMP_DIR"
    
    # Clone repository
    print_status "Tải mã nguồn / Downloading source code..."
    git clone https://github.com/ducchinh-ai/hang-underwears-policy.git
    cd hang-underwears-policy
    
    # Create basic theme structure if directories don't exist
    if [[ ! -d "themes" ]]; then
        print_status "Tạo cấu trúc theme cơ bản / Creating basic theme structure..."
        mkdir -p themes/Hang-Underwears-Theme
        mkdir -p icons/Hang-Underwears-Icons
        
        # Create a simple theme index file
        cat > themes/Hang-Underwears-Theme/index.theme << EOF
[Desktop Entry]
Type=X-GNOME-Metatheme
Name=Hang Underwears Theme
Comment=A beautiful theme for Hang Underwears application
Encoding=UTF-8

[X-GNOME-Metatheme]
GtkTheme=Hang-Underwears-Theme
MetacityTheme=Hang-Underwears-Theme
IconTheme=Hang-Underwears-Icons
CursorTheme=default
ButtonLayout=close,minimize,maximize:
EOF
        
        # Create basic icon theme index
        cat > icons/Hang-Underwears-Icons/index.theme << EOF
[Icon Theme]
Name=Hang Underwears Icons
Comment=Icon theme for Hang Underwears application
Inherits=Adwaita
Directories=scalable/apps

[scalable/apps]
Size=48
Context=Applications
Type=Scalable
MinSize=16
MaxSize=512
EOF
        
        print_success "Đã tạo cấu trúc theme / Theme structure created"
    fi
    
    # Copy theme files if they exist
    if [[ -d "themes" ]]; then
        print_status "Sao chép file theme / Copying theme files..."
        cp -r themes/* ~/.themes/
        print_success "Đã sao chép theme / Theme files copied"
    fi
    
    if [[ -d "icons" ]]; then
        print_status "Sao chép file biểu tượng / Copying icon files..."
        cp -r icons/* ~/.icons/
        print_success "Đã sao chép biểu tượng / Icon files copied"
    fi
    
    # Clean up
    cd ~
    rm -rf "$TEMP_DIR"
}

# Show completion message
show_completion() {
    print_success "Cài đặt hoàn tất! / Installation completed!"
    echo
    print_status "Để áp dụng theme / To apply the theme:"
    echo "1. Mở GNOME Tweaks / Open GNOME Tweaks"
    echo "2. Chuyển đến tab 'Appearance' / Go to 'Appearance' tab"
    echo "3. Chọn theme 'Hang-Underwears-Theme' / Select 'Hang-Underwears-Theme'"
    echo
    print_status "Hoặc chạy lệnh / Or run command:"
    echo "gnome-tweaks"
}

# Main function
main() {
    echo "========================================"
    echo "Hang Underwears Ubuntu Theme Installer"
    echo "========================================"
    echo
    
    check_ubuntu
    check_gnome
    install_dependencies
    create_directories
    install_theme
    show_completion
}

# Run main function
main "$@"