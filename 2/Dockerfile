FROM bitnami/minideb-extras:jessie-r52
LABEL maintainer "Bitnami <containers@bitnami.com>"

# Install required system packages and dependencies
RUN install_packages libapr1 libaprutil1 libbz2-1.0 libc6 libcomerr2 libcurl3 libexpat1 libffi6 libfreetype6 libgcc1 libgcrypt20 libgmp10 libgnutls-deb0-28 libgpg-error0 libgssapi-krb5-2 libhogweed2 libicu52 libidn11 libjpeg62-turbo libk5crypto3 libkeyutils1 libkrb5-3 libkrb5support0 libldap-2.4-2 liblzma5 libmcrypt4 libncurses5 libnettle4 libp11-kit0 libpcre3 libpng12-0 libpq5 libreadline6 librtmp1 libsasl2-2 libsqlite3-0 libssh2-1 libssl1.0.0 libstdc++6 libsybdb5 libtasn1-6 libtidy-0.99-0 libtinfo5 libuuid1 libxml2 libxslt1.1 zlib1g
RUN bitnami-pkg install git-2.17.0-0 --checksum fbfa53f51d88bf6a8f0222f8861ed3b91f8ba4a0f7e1d8e132c3c5a596c963b2
RUN bitnami-pkg unpack apache-2.4.33-2 --checksum 303515aa732cb8a33c9018953f1f8bd3d244e95588906f3dd8c1f30efc115dd2
RUN bitnami-pkg unpack php-7.1.17-2 --checksum 2aec4c065afea2d363579b1f9580ee8df41e144874dab612cbbe189fd7fab03d
RUN bitnami-pkg install libphp-7.1.17-1 --checksum 6702ce0c274a83c5111fe16fcf051bef0dc65e6feeac155f179899329add4ee3
RUN bitnami-pkg unpack codiad-2.8.4-1 --checksum bfd25bf72154d13d064f4cd761ad1d9c6d48c7b37d28ca36ba96e2a5240d8be6

COPY rootfs /
ENV APACHE_HTTPS_PORT_NUMBER="443" \
    APACHE_HTTP_PORT_NUMBER="80" \
    BITNAMI_APP_NAME="codiad" \
    BITNAMI_IMAGE_VERSION="2.8.4-r24" \
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
