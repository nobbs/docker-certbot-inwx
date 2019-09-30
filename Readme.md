# Certbot + DNS-INWX-Plugin docker image

![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/nobbs2a/certbot-inwx)
![Docker Pulls](https://img.shields.io/docker/pulls/nobbs2a/certbot-inwx)
![Docker Stars](https://img.shields.io/docker/stars/nobbs2a/certbot-inwx)  

A docker image providing [certbot] together with the [certbot-dns-inwx] authenticator plugin. 
This combo allows the use of Let's Encrypt [DNS challenges (dns-01)][dns-challenge] with domains managed by the nameservers of InterNetworX, short [inwx].

The image is based on the latest official [Python 3](https://hub.docker.com/_/python) base image and installs the latest stable version of [certbot] and [certbot-dns-inwx] from [pypi].

[pypi]: https://pypi.org/
[certbot]: https://github.com/certbot/certbot
[certbot-dns-inwx]: https://github.com/oGGy990/certbot-dns-inwx/
[inwx]: https://www.inwx.com
[dns-challenge]: https://letsencrypt.org/docs/challenge-types/#dns-01-challenge