cp rabbitmq_erlang.repo /etc/yum.repos.d/rabbitmq_erlang.repo

dnf install -y erlang

cp rabbitmq_rabbitmq-server.repo /etc/yum.repos.d/rabbitmq_rabbitmq-server.repo

dnf install -y rabbitmq-server

# 5. Enable and start service
systemctl enable rabbitmq-server
systemctl start rabbitmq-server

systemctl status rabbitmq-server