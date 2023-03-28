I properly generated certificates from Letsencrypt
using acme-client with filenames like 
domain1.com:443.crt 
domain1.com:443.key 
domain1.com:443.pem

.. and so for second domain2.com 
what should be recognized
by relayd as certificates for particular domain according
to man page in tls keypairs description

This setup works only in case when I create symlinks to
key and pem file using my ipv4 and ipv6 addresses as
symlink names. In this way I can't use 2 or more domains
with one IP address

Otherwise relayd returns error
cannot load certificates for relay https2:443
so I assume it can not find files with certificates

This should be some stupid mistake :)

relayd.conf

ip4="46.23.90.103"
ip6="2a03:6000:6f62:628::103"
table <local> { 127.0.0.1 }

http protocol https
{
  tls keypair domain1.com:443
  tls keypair domain2.com:443

  return error
  pass
}

relay https {
  listen on $ip4 port 443 tls
  listen on $ip6 port 443 tls
  protocol https
  forward to <local> port 8080
}
