/usr/bin/expect <<EOF
  set timeout -1
  spawn docker exec -it redis6379 bash
  expect "*#"
  send "redis-cli -a {{redis.password}} --cluster create {{redis_cluster_hosts}} --cluster-replicas 1 \n"
  expect "Can I set the above configuration? (type 'yes' to accept): "
  send "yes\n"
  expect "*#"
  send "exit\n"
  expect eof
EOF
