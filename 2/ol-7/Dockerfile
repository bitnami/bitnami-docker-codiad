FROM bitnami/oraclelinux-extras:7-r2
LABEL maintainer "Bitnami <containers@bitnami.com>"

# Install required system packages and dependencies
RUN install_packages bzip2-libs cyrus-sasl-lib expat freetype glibc gmp keyutils-libs krb5-libs libcom_err libcurl libgcc libgcrypt libgpg-error libicu libidn libjpeg-turbo libpng libselinux libssh2 libstdc++ libxml2 libxslt ncurses-libs nspr nss nss-softokn-freebl nss-util openldap openssl-libs pcre postgresql-libs readline sqlite xz-libs zlib
RUN bitnami-pkg install git-2.17.0-1 --checksum 8eff4ed96f1b3ddd4145d2fac7478073930a357cd195dea4c16095186aec626d
RUN bitnami-pkg unpack apache-2.4.33-3 --checksum 0611709446389dbf1b9a08ee4b8b447443e356e286a9c6dee312d55f72e465d6
RUN bitnami-pkg unpack php-7.1.18-0 --checksum ea15f7691a9da4e1613a18f5f49c5cc48b84bdd849d1ce27ea5e5e2dc99029dc
RUN bitnami-pkg install libphp-7.1.18-0 --checksum 6f2e9dcd8401b1140c46498879a83b0af654274e7fd5559b939a08bc8eb8292c
RUN bitnami-pkg unpack codiad-2.8.4-1 --checksum 121b2ba143e9bc5e4c1b151d8b60c70b855caeca10377eecd574a3707d955eb8

COPY rootfs /
ENV APACHE_HTTPS_PORT_NUMBER="443" \
    APACHE_HTTP_PORT_NUMBER="80" \
    BITNAMI_APP_NAME="codiad" \
    BITNAMI_IMAGE_VERSION="2.8.4-ol-7-r0" \
    CODIAD_HOST="127.0.0.1" \
    CODIAD_PASSWORD="bitnami" \
    CODIAD_PROJECT_NAME="Sample Project" \
    CODIAD_PROJECT_PATH="sampleProject" \
    CODIAD_THEME="default" \
    CODIAD_USERNAME="user" \
    PATH="/opt/bitnami/git/bin:/opt/bitnami/apache/bin:/opt/bitnami/php/bin:$PATH"

EXPOSE 80 443

ENTRYPOINT ["/app-entrypoint.sh"]
CMD ["nami","start","--foreground","apache"]
