# Hang Underwears - Ubuntu Theme Installation Guide

## Hướng dẫn cài đặt theme cho Ubuntu (Vietnamese)

### Yêu cầu hệ thống
- Ubuntu 18.04 hoặc cao hơn
- GNOME Desktop Environment
- Quyền sudo

### Cài đặt theme tự động
1. Tải script cài đặt:
```bash
wget https://raw.githubusercontent.com/ducchinh-ai/hang-underwears-policy/main/install-theme.sh
chmod +x install-theme.sh
```

2. Chạy script cài đặt:
```bash
./install-theme.sh
```

### Cài đặt theme thủ công

#### Bước 1: Cài đặt GNOME Tweaks
```bash
sudo apt update
sudo apt install gnome-tweaks
```

#### Bước 2: Tạo thư mục theme
```bash
mkdir -p ~/.themes
mkdir -p ~/.icons
```

#### Bước 3: Tải và cài đặt theme
```bash
# Tải theme Hang Underwears
git clone https://github.com/ducchinh-ai/hang-underwears-policy.git
cd hang-underwears-policy

# Copy theme files
cp -r themes/* ~/.themes/
cp -r icons/* ~/.icons/
```

#### Bước 4: Áp dụng theme
1. Mở GNOME Tweaks
2. Chuyển đến tab "Appearance"
3. Chọn theme "Hang-Underwears" từ dropdown

### Gỡ cài đặt
```bash
rm -rf ~/.themes/Hang-Underwears
rm -rf ~/.icons/Hang-Underwears
```

---

## Ubuntu Theme Installation Guide (English)

### System Requirements
- Ubuntu 18.04 or higher
- GNOME Desktop Environment
- sudo privileges

### Automatic Installation
1. Download installation script:
```bash
wget https://raw.githubusercontent.com/ducchinh-ai/hang-underwears-policy/main/install-theme.sh
chmod +x install-theme.sh
```

2. Run installation script:
```bash
./install-theme.sh
```

### Manual Installation

#### Step 1: Install GNOME Tweaks
```bash
sudo apt update
sudo apt install gnome-tweaks
```

#### Step 2: Create theme directories
```bash
mkdir -p ~/.themes
mkdir -p ~/.icons
```

#### Step 3: Download and install theme
```bash
# Download Hang Underwears theme
git clone https://github.com/ducchinh-ai/hang-underwears-policy.git
cd hang-underwears-policy

# Copy theme files
cp -r themes/* ~/.themes/
cp -r icons/* ~/.icons/
```

#### Step 4: Apply theme
1. Open GNOME Tweaks
2. Go to "Appearance" tab
3. Select "Hang-Underwears" theme from dropdown

### Uninstallation
```bash
rm -rf ~/.themes/Hang-Underwears
rm -rf ~/.icons/Hang-Underwears
```

## Cấu trúc thư mục / Directory Structure
```
hang-underwears-policy/
├── README.md                           # Hướng dẫn / Documentation
├── install-theme.sh                    # Script cài đặt / Installation script
├── uninstall-theme.sh                  # Script gỡ cài đặt / Uninstall script
├── theme-config.conf                   # File cấu hình / Configuration file
├── hang-underwears-theme-manager.desktop # Desktop entry
├── themes/                             # Thư mục theme / Theme directory
│   └── Hang-Underwears-Theme/
│       ├── index.theme
│       └── gtk-3.0/
│           └── gtk.css
├── icons/                              # Thư mục biểu tượng / Icons directory
│   └── Hang-Underwears-Icons/
│       ├── index.theme
│       └── scalable/
│           └── apps/
│               └── hang-underwears.svg
├── privacy.html                        # Chính sách bảo mật / Privacy policy
└── terms.html                          # Điều khoản / Terms of service
```

## Tùy chỉnh / Customization
Bạn có thể tùy chỉnh theme bằng cách chỉnh sửa file `theme-config.conf` trước khi cài đặt.
You can customize the theme by editing the `theme-config.conf` file before installation.

## Khắc phục sự cố / Troubleshooting
- Nếu theme không xuất hiện trong GNOME Tweaks, hãy logout và login lại
- If theme doesn't appear in GNOME Tweaks, logout and login again
- Đảm bảo bạn đang sử dụng GNOME Desktop Environment
- Make sure you're using GNOME Desktop Environment

## Support
For support, contact: d.d.chinh5003@gmail.com

## License
This theme is provided as-is for personal use.