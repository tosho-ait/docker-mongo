# docker-mongo

Mod of the official mongo docker image that does not keep the data dir in a volume. This makes it possible to commit and after that push/pull mongo images together with the data directory.

The image also has authentication enabled as described in http://blog.bejanalex.com/2017/03/running-mongodb-in-a-docker-container-with-authentication/
