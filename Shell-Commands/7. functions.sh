Install_Nginx() {
    echo "Installing Nginx" 
    sudo dnf install -y nginx 2>&1 | tee -a /tmp/file
    sudo systemctl start nginx 2>&1 | tee -a /tmp/file
}

Install_Nginx
