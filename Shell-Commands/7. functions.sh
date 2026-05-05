Install_Nginx() {
    echo "Installing Nginx" 
    sudo dnf install -y nginx > /tmp/file 2>&1 | tee -a 
    sudo systemctl start nginx > /tmp/file 2>&1 | tee -a
}

Install_Nginx
