Install_Nginx() {
    echo "Installing Nginx" 
    sudo dnf install -y nginx 
    sudo systemctl start nginx 
}

Install_Nginx
