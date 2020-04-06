/usr/bin/expect <<EOF 
  set timeout -1
  spawn docker exec -it {{mongo_process_name}} bash
  expect "*/#"
  send "mongo\n"
  expect ">*"
  send "use admin;\n"
  expect ">*"
  send "db.createUser(\{\"user\":\"{{mongo_init_user}}\",\"pwd\":\"{{mongo_init_password}}\",\"roles\":\[\{\"role\":\"root\",\"db\":\"admin\"\}\]\});\n"
  send "exit\n"
  expect "*/#"
  send "exit\n"
  expect eof
EOF
