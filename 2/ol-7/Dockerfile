FROM bitnami/oraclelinux-extras:7-r137
LABEL maintainer "Bitnami <containers@bitnami.com>"

# Install required system packages and dependencies
RUN install_packages bzip2-libs cyrus-sasl-lib expat freetds freetype glibc gmp gnutls keyutils-libs krb5-libs libcom_err libcurl libffi libgcc libgcrypt libgpg-error libicu libidn libjpeg-turbo libmcrypt libpng libselinux libssh2 libstdc++ libtasn1 libtidy libxml2 libxslt ncurses-libs nettle nspr nss nss-softokn-freebl nss-util openldap openssl-libs p11-kit pcre postgresql-libs readline sqlite xz-libs zlib
RUN bitnami-pkg install git-2.19.1-0 --checksum a50a849103d0908bb94c4a048622aae0b090af99739309f7f2a093e119e9453e
RUN bitnami-pkg unpack apache-2.4.35-1 --checksum 11cde93a3a8e89ff1a113e75008485d5e9213adae847d64ac4299b1533d43173
RUN bitnami-pkg unpack php-7.1.23-0 --checksum 2bed406160aa91e888eda47df01d9d55a8fbba40b78f806ca2bc481c5aca0754
RUN bitnami-pkg unpack libphp-7.1.22-2 --checksum 8abad49bc487f1db36bac51381c7cb17bbbeedfc1ffa095785545d862fc4af31
RUN bitnami-pkg unpack codiad-2.8.4-2 --checksum 842c6dda062a8e5131ac0a807134e8585570b11e302992609a0dfafc9aef4ba2

COPY rootfs /
ENV APACHE_HTTPS_PORT_NUMBER="443" \
    APACHE_HTTP_PORT_NUMBER="80" \
    BITNAMI_APP_NAME="codiad" \
    BITNAMI_IMAGE_VERSION="2.8.4-ol-7-r65" \
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
