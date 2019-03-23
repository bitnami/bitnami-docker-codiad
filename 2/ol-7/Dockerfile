FROM bitnami/oraclelinux-extras:7-r298
LABEL maintainer "Bitnami <containers@bitnami.com>"

# Install required system packages and dependencies
RUN install_packages bzip2-libs cyrus-sasl-lib expat freetds freetype glibc gmp gnutls keyutils-libs krb5-libs libcom_err libcurl libffi libgcc libgcrypt libgpg-error libicu libidn libjpeg-turbo libmcrypt libmemcached libnghttp2 libpng libselinux libssh2 libstdc++ libtasn1 libtidy libxml2 libxslt ncurses-libs nettle nspr nss nss-softokn-freebl nss-util openldap openssl-libs p11-kit pcre postgresql-libs readline sqlite xz-libs zlib
RUN bitnami-pkg install git-2.21.0-0 --checksum 8dc7078aeaa3c3bf7010f3adbdb2f7ec9c3737c7eb6c7c1b2f547350c42fcfa5
RUN bitnami-pkg unpack apache-2.4.38-2 --checksum bf099fdd01c4f5ec72a41dcbccbb04af1a75627f8e5e5112a2d5f62f4cbc4203
RUN bitnami-pkg unpack php-7.1.27-0 --checksum df9cfdf30d8f0cfda05287c0837fbed19a1083fb296b4d82124764113db0b1ac
RUN bitnami-pkg unpack libphp-7.1.27-0 --checksum 96e104d4595616662738955e4416ba8c6f8e87be3038252a88cf63efdf0a4bf7
RUN bitnami-pkg unpack codiad-2.8.4-20 --checksum 7ae821983c8b8228262e9d50517273ac3085d58239ae7ed1931990ddb668ccf9
RUN mkdir -p /opt/bitnami/apache/tmp && chmod g+rwX /opt/bitnami/apache/tmp
RUN ln -sf /dev/stdout /opt/bitnami/apache/logs/access_log
RUN ln -sf /dev/stderr /opt/bitnami/apache/logs/error_log

COPY rootfs /
ENV APACHE_HTTPS_PORT_NUMBER="443" \
    APACHE_HTTP_PORT_NUMBER="80" \
    BITNAMI_APP_NAME="codiad" \
    BITNAMI_IMAGE_VERSION="2.8.4-ol-7-r205" \
    CODIAD_HOST="127.0.0.1" \
    CODIAD_PASSWORD="bitnami" \
    CODIAD_PROJECT_NAME="Sample Project" \
    CODIAD_PROJECT_PATH="sampleProject" \
    CODIAD_THEME="default" \
    CODIAD_USERNAME="user" \
    PATH="/opt/bitnami/git/bin:/opt/bitnami/apache/bin:/opt/bitnami/php/bin:/opt/bitnami/php/sbin:$PATH"

EXPOSE 80 443

ENTRYPOINT [ "/app-entrypoint.sh" ]
CMD [ "httpd", "-f", "/bitnami/apache/conf/httpd.conf", "-DFOREGROUND" ]
