Install_Nginx() {
    echo "Installing Nginx" 
    sudo dnf install -y nginx > /dev/null 2>&1 
    sudo systemctl start nginx > /dev/null 2>&1
}

Install_Nginx
