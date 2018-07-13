FROM bitnami/minideb-extras:stretch-r76
LABEL maintainer "Bitnami <containers@bitnami.com>"

# Install required system packages and dependencies
RUN install_packages libbz2-1.0 libc6 libcomerr2 libcurl3 libexpat1 libffi6 libfreetype6 libgcc1 libgcrypt20 libgmp10 libgnutls30 libgpg-error0 libgssapi-krb5-2 libhogweed4 libicu57 libidn11 libidn2-0 libjpeg62-turbo libk5crypto3 libkeyutils1 libkrb5-3 libkrb5support0 libldap-2.4-2 liblzma5 libmcrypt4 libncurses5 libnettle6 libnghttp2-14 libp11-kit0 libpcre3 libpng16-16 libpq5 libpsl5 libreadline7 librtmp1 libsasl2-2 libsqlite3-0 libssh2-1 libssl1.0.2 libssl1.1 libstdc++6 libsybdb5 libtasn1-6 libtidy5 libtinfo5 libunistring0 libxml2 libxslt1.1 zlib1g
RUN bitnami-pkg install git-2.18.0-0 --checksum eb30adad4ac36d485532b4a8a99871c3824722d09707e73328f0ac1190ab24d6
RUN bitnami-pkg unpack apache-2.4.33-4 --checksum 6cc79624d133577b8081ddcfa1d1bf5749bbd25fe372ff2a72a6eb4d38a231c6
RUN bitnami-pkg unpack php-7.1.19-3 --checksum f194bb974d4bdec0a359c6e8a4b1559c6dbc2b6864e1e2f88dd09f922e7b7658
RUN bitnami-pkg install libphp-7.1.19-0 --checksum ebb04b9a2a3e40296b3d403f4e7ef038fd505f312a419b942b7578b24b2ee6c6
RUN bitnami-pkg unpack codiad-2.8.4-2 --checksum 2ee886a917afb016fc8e8de62ec8b1153cf2670a33350be177f54ffa9dd1a2e2

COPY rootfs /
ENV APACHE_HTTPS_PORT_NUMBER="443" \
    APACHE_HTTP_PORT_NUMBER="80" \
    BITNAMI_APP_NAME="codiad" \
    BITNAMI_IMAGE_VERSION="2.8.4-debian-9-r3" \
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
