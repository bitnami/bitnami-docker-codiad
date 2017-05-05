FROM bitnami/minideb-extras:jessie-r15

MAINTAINER Bitnami <containers@bitnami.com>

ENV BITNAMI_APP_NAME=codiad \
    BITNAMI_IMAGE_VERSION=2.7.5-r4 \
    PATH=/opt/bitnami/php/bin:/opt/bitnami/apache/bin:/opt/bitnami/git/bin:$PATH

# System packages required
RUN install_packages libaprutil1 libapr1 libc6 libuuid1 libexpat1 libssl1.0.0 libpcre3 libldap-2.4-2 libsasl2-2 libgnutls-deb0-28 zlib1g libp11-kit0 libtasn1-6 libnettle4 libhogweed2 libgmp10 libffi6 libxslt1.1 libtidy-0.99-0 libreadline6 libncurses5 libtinfo5 libmcrypt4 libstdc++6 libpng12-0 libjpeg62-turbo libbz2-1.0 libxml2 libcurl3 libfreetype6 libicu52 libgcc1 libgcrypt20 liblzma5 libidn11 librtmp1 libssh2-1 libgssapi-krb5-2 libkrb5-3 libk5crypto3 libcomerr2 libgpg-error0 libkrb5support0 libkeyutils1 libsybdb5 libpq5

# Additional modules required
RUN bitnami-pkg unpack apache-2.4.25-0 --checksum 8b46af7d737772d7d301da8b30a2770b7e549674e33b8a5b07480f53c39f5c3f
RUN bitnami-pkg unpack php-7.1.4-0 --checksum 84cce4741cc5823c33a3996872eb226025ca2257320b4f9fed4b2be41aef45c6
RUN bitnami-pkg install libphp-7.1.4-0 --checksum f550ee8d4dd7fd18268cf40ffea8838a88a0f2cb68fe00ff7b5b0ca0a5df6e37
RUN bitnami-pkg install git-2.10.1-2 --checksum 6f9fd8b0591f268f965930db0c091598e5c4f9dccbb6853010e1ac9e5035cd6f

# Install codiad
RUN bitnami-pkg unpack codiad-2.7.5-0 --checksum b1c1a0cbfdb7f5d7a82d7ec42e732b1a5c24a145f80cb8f37b8180b00fb0ade1

COPY rootfs /

ENV APACHE_HTTP_PORT="80" \
    APACHE_HTTPS_PORT="443" \
    CODIAD_USERNAME="user" \
    CODIAD_PASSWORD="bitnami" \
    CODIAD_PROJECT_NAME="Sample Project" \
    CODIAD_PROJECT_PATH="sampleProject" \
    CODIAD_THEME="default" \
    CODIAD_HOST="127.0.0.1"

VOLUME ["/bitnami/codiad", "/bitnami/apache"]

EXPOSE 80 443

ENTRYPOINT ["/app-entrypoint.sh"]

CMD ["nami", "start", "--foreground", "apache"]
