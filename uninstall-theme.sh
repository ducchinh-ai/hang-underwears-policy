#!/bin/bash

# Hang Underwears Ubuntu Theme Uninstallation Script
# Script gỡ cài đặt theme Hang Underwears cho Ubuntu

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

# Confirm uninstallation
confirm_uninstall() {
    echo "========================================"
    echo "Hang Underwears Theme Uninstaller"
    echo "========================================"
    echo
    print_warning "Bạn có chắc chắn muốn gỡ cài đặt theme Hang Underwears?"
    print_warning "Are you sure you want to uninstall Hang Underwears theme?"
    echo
    read -p "Nhập 'yes' để xác nhận / Type 'yes' to confirm: " -r
    
    if [[ $REPLY != "yes" ]]; then
        print_status "Hủy gỡ cài đặt / Uninstallation cancelled"
        exit 0
    fi
}

# Remove theme files
remove_theme_files() {
    print_status "Gỡ theme files / Removing theme files..."
    
    # Remove theme directory
    if [[ -d ~/.themes/Hang-Underwears-Theme ]]; then
        rm -rf ~/.themes/Hang-Underwears-Theme
        print_success "Đã xóa theme directory / Theme directory removed"
    else
        print_warning "Theme directory không tồn tại / Theme directory not found"
    fi
    
    # Remove icon directory
    if [[ -d ~/.icons/Hang-Underwears-Icons ]]; then
        rm -rf ~/.icons/Hang-Underwears-Icons
        print_success "Đã xóa icon directory / Icon directory removed"
    else
        print_warning "Icon directory không tồn tại / Icon directory not found"
    fi
}

# Reset to default theme
reset_theme() {
    print_status "Đặt lại theme mặc định / Resetting to default theme..."
    
    # Try to reset GNOME theme using gsettings
    if command -v gsettings &> /dev/null; then
        gsettings reset org.gnome.desktop.interface gtk-theme 2>/dev/null || true
        gsettings reset org.gnome.desktop.interface icon-theme 2>/dev/null || true
        gsettings reset org.gnome.desktop.wm.preferences theme 2>/dev/null || true
        print_success "Đã đặt lại theme / Theme reset complete"
    else
        print_warning "gsettings không có sẵn / gsettings not available"
        print_status "Vui lòng đặt lại theme thủ công qua GNOME Tweaks"
        print_status "Please reset theme manually via GNOME Tweaks"
    fi
}

# Show completion message
show_completion() {
    print_success "Gỡ cài đặt hoàn tất! / Uninstallation completed!"
    echo
    print_status "Theme Hang Underwears đã được gỡ khỏi hệ thống"
    print_status "Hang Underwears theme has been removed from your system"
    echo
    print_status "Nếu bạn vẫn thấy theme trong GNOME Tweaks:"
    print_status "If you still see the theme in GNOME Tweaks:"
    echo "1. Đóng và mở lại GNOME Tweaks / Close and reopen GNOME Tweaks"
    echo "2. Hoặc logout và login lại / Or logout and login again"
}

# Main function
main() {
    confirm_uninstall
    remove_theme_files
    reset_theme
    show_completion
}

# Run main function
main "$@"