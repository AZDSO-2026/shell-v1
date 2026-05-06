dnf install -y valkey

sed -i 's/^bind .*/bind 0.0.0.0/' /etc/valkey/valkey.conf
sed -i 's/^protected-mode .*/protected-mode no/' /etc/valkey/valkey.conf

systemctl enable valkey
systemctl start valkey
systemctl restart valkey