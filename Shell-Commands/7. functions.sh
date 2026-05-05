Install_Nginx() {
    echo "Installing Nginx" 
    sudo dnf install -y nginx  /tmp/file 2>&1 | tee -a /tmp/file
    sudo systemctl start nginx  /tmp/file 2>&1 | tee -a /tmp/file
}

Install_Nginx
