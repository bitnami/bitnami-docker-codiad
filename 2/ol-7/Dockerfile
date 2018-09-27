FROM bitnami/oraclelinux-extras:7-r119
LABEL maintainer "Bitnami <containers@bitnami.com>"

# Install required system packages and dependencies
RUN install_packages bzip2-libs cyrus-sasl-lib expat freetds freetype glibc gmp gnutls keyutils-libs krb5-libs libcom_err libcurl libffi libgcc libgcrypt libgpg-error libicu libidn libjpeg-turbo libmcrypt libpng libselinux libssh2 libstdc++ libtasn1 libtidy libxml2 libxslt ncurses-libs nettle nspr nss nss-softokn-freebl nss-util openldap openssl-libs p11-kit pcre postgresql-libs readline sqlite xz-libs zlib
RUN bitnami-pkg install git-2.19.0-0 --checksum 3ef1679e21948e6a40ab47411362f9c49bcd9b5d22b8567c6bfc6cb757d78d28
RUN bitnami-pkg unpack apache-2.4.35-0 --checksum 5d3d1836c2ff00e299779b9f5ad90f65e599655b6a96908c579966d206bb4396
RUN bitnami-pkg unpack php-7.1.22-1 --checksum d454d26b6288af034ee7af734bd3775f591c70345772c9b1c731c44ab60c5be7
RUN bitnami-pkg install libphp-7.1.22-1 --checksum 42018a53bcaf3217a061e58c9db5a2f31c8b92ee646fd7cf9ce0b78c421d2091
RUN bitnami-pkg unpack codiad-2.8.4-2 --checksum 842c6dda062a8e5131ac0a807134e8585570b11e302992609a0dfafc9aef4ba2

COPY rootfs /
ENV APACHE_HTTPS_PORT_NUMBER="443" \
    APACHE_HTTP_PORT_NUMBER="80" \
    BITNAMI_APP_NAME="codiad" \
    BITNAMI_IMAGE_VERSION="2.8.4-ol-7-r57" \
    CODIAD_HOST="127.0.0.1" \
    CODIAD_PASSWORD="bitnami" \
    CODIAD_PROJECT_NAME="Sample Project" \
    CODIAD_PROJECT_PATH="sampleProject" \
    CODIAD_THEME="default" \
    CODIAD_USERNAME="user" \
    PATH="/opt/bitnami/git/bin:/opt/bitnami/apache/bin:/opt/bitnami/php/bin:/opt/bitnami/php/sbin:$PATH"

EXPOSE 80 443

ENTRYPOINT [ "/app-entrypoint.sh" ]
CMD [ "nami", "start", "--foreground", "apache" ]
