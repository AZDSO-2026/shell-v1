install_package() {
  dnf install $1 -y
}

create_user() {
  useradd $1
}

download_code() {
  curl -o /tmp/app.zip $1
}

install_package nginx
create_user dotmart
download_code https://example.com/app.zip