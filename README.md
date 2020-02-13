# everything_is_fine_api
An API with Sinatra where everything is fine

## To enable SSL
Using this command on /src: 
```
openssl req -x509 -out localhost.crt -keyout localhost.key \
  -newkey rsa:2048 -nodes -sha256 \
  -subj '/CN=localhost' -extensions EXT -config <( \
   printf "[dn]\nCN=localhost\n[req]\ndistinguished_name = dn\n[EXT]\nsubjectAltName=DNS:localhost\nkeyUsage=digitalSignature\nextendedKeyUsage=serverAuth")
```
You create your certificates for localhost to run with ssl.

If you don't want/need SSL you can just comment the two `set:` regarding SSL in `src/api.rb`

You can also choose to use a domain with dots in it, like www.localhost, by adding it to /etc/hosts as an alias to 127.0.0.1. This subtly changes how browsers handle cookie storage.
