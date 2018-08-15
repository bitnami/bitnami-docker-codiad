FROM bitnami/oraclelinux-extras:7-r70
LABEL maintainer "Bitnami <containers@bitnami.com>"

# Install required system packages and dependencies
RUN install_packages bzip2-libs cyrus-sasl-lib expat freetds freetype glibc gmp gnutls keyutils-libs krb5-libs libcom_err libcurl libffi libgcc libgcrypt libgpg-error libicu libidn libjpeg-turbo libmcrypt libpng libselinux libssh2 libstdc++ libtasn1 libtidy libxml2 libxslt ncurses-libs nettle nspr nss nss-softokn-freebl nss-util openldap openssl-libs p11-kit pcre postgresql-libs readline sqlite xz-libs zlib
RUN bitnami-pkg install git-2.18.0-1 --checksum e09020e93542133c5f61daaa5a47bdcb94ec5303dd336ae05fa561729786284c
RUN bitnami-pkg unpack apache-2.4.34-1 --checksum d06af72741b365147c39bb30ca9e1df1501d97c3c6a44b200e64c3c4eb7878f6
RUN bitnami-pkg unpack php-7.1.20-1 --checksum 453099c5c33e2d3f011ab61b7dc27e68e77063a80e6ce166a2ef26f73434ef62
RUN bitnami-pkg install libphp-7.1.20-1 --checksum 70d768e0a0435fd175c1b3116432d5b3d2ff6a14bd078f5216dc756ec629e69f
RUN bitnami-pkg unpack codiad-2.8.4-2 --checksum 842c6dda062a8e5131ac0a807134e8585570b11e302992609a0dfafc9aef4ba2

COPY rootfs /
ENV APACHE_HTTPS_PORT_NUMBER="443" \
    APACHE_HTTP_PORT_NUMBER="80" \
    BITNAMI_APP_NAME="codiad" \
    BITNAMI_IMAGE_VERSION="2.8.4-ol-7-r41" \
    CODIAD_HOST="127.0.0.1" \
    CODIAD_PASSWORD="bitnami" \
    CODIAD_PROJECT_NAME="Sample Project" \
    CODIAD_PROJECT_PATH="sampleProject" \
    CODIAD_THEME="default" \
    CODIAD_USERNAME="user" \
    PATH="/opt/bitnami/git/bin:/opt/bitnami/apache/bin:/opt/bitnami/php/bin:/opt/bitnami/php/sbin:$PATH"

EXPOSE 80 443

ENTRYPOINT ["/app-entrypoint.sh"]
CMD ["nami","start","--foreground","apache"]
