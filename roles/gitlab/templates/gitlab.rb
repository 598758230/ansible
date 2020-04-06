#配置如下
external_url '{{gitlab_external_url}}'
gitlab_rails['time_zone'] ='Asia/Shanghai'   # 设置时区
#邮箱配置
gitlab_rails['gitlab_email_enabled'] = true
gitlab_rails['gitlab_email_from'] = 'lz.admin@icerno.com'
gitlab_rails['gitlab_email_display_name'] = 'admin'
gitlab_rails['gitlab_email_reply_to'] = 'lz.admin@icerno.com'

gitlab_rails['smtp_enable'] = true
gitlab_rails['smtp_address'] = "smtp.qiye.163.com"
gitlab_rails['smtp_port'] = 25
gitlab_rails['smtp_user_name'] = "lz.admin@icerno.com"
gitlab_rails['smtp_password'] = "lz.Admin!"
gitlab_rails['smtp_domain'] = "lz.admin@icerno.com"
gitlab_rails['smtp_authentication'] = "login"
#LDAP配置
gitlab_rails['ldap_enabled'] = true
gitlab_rails['ldap_servers'] = {
'main' => {
  'label' => 'LDAP',                        # 显示在登录页面上的名称
  'host' =>  '{{gitlab_ldap_host}}',              # LDAP服务地址
  'port' => 389,                            # LDAP服务端口，如果LDAP基于SSL在端口通常为636
  'uid' => 'uid',                           # LDAP中用户名对应的属性。
  'encryption' => 'plain',                  # "start_tls" or "simple_tls" or "plain"
  'verify_certificates' => true,            # 如果使用SSL，则设为true
  'bind_dn' => 'cn=admin,dc=icerno,dc=com', # 同步用户信息的账户格式为'domain\username'
  'password' => 'admin',                    # 同步用户信息的账户密码
  'active_directory' => true,               # 如果是 Active Directory LDAP server 则设为true
  'base' => 'ou=users,dc=icerno,dc=com'     # 搜索LDAP用户是的BaseDN
  #'group_base' => 'OU=Global Groups,OU=GitLab INT,DC=GitLab,DC=org',
  #'admin_group' => 'Global Admins'
  }
}
