www4
====

Test build of a container-based wagtail setup with basic blogging and real database backend.

Plans
-----

- two-factor authentication for all users
- basic blogging, with streamig blocks making up articles
- streaming blocks include rich text, code, images etc.
- secrets in repository via git-secrets (no use to anybody but me, because *I* have the private key :P)
- prod-settings are also secrets
- dev-settings only used on localhost on my laptop
- setup files to run this on a generic host with systemd and docker, documentation about how to run this under apache2 and maybe nginx, with full SSL support.

Development
-----------

- will push regularily to my private gitlab server because of quite nice CI support, good luck finding that one (and you won't be able to read anything there without an account)
- if you're reading this on github, what is here should work but is probably a bit outdated.

License
-------

- just like wagtail itself, I'm using the BSD license.
