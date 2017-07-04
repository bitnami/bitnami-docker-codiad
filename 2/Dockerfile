FROM bitnami/minideb-extras:jessie-r19
LABEL maintainer "Bitnami <containers@bitnami.com>"



# Install required system packages and dependencies
RUN install_packages libapr1 libaprutil1 libbz2-1.0 libc6 libcomerr2 libcurl3 libexpat1 libffi6 libfreetype6 libgcc1 libgcrypt20 libgmp10 libgnutls-deb0-28 libgpg-error0 libgssapi-krb5-2 libhogweed2 libicu52 libidn11 libjpeg62-turbo libk5crypto3 libkeyutils1 libkrb5-3 libkrb5support0 libldap-2.4-2 liblzma5 libmcrypt4 libncurses5 libnettle4 libp11-kit0 libpcre3 libpng12-0 libpq5 libreadline6 librtmp1 libsasl2-2 libssh2-1 libssl1.0.0 libstdc++6 libsybdb5 libtasn1-6 libtidy-0.99-0 libtinfo5 libuuid1 libxml2 libxslt1.1 zlib1g
RUN bitnami-pkg install git-2.13.2-0 --checksum 0c8267b16408cd9cb0f7b9041e30b9207dc51076735bca471574bb995556d588
RUN bitnami-pkg unpack apache-2.4.26-0 --checksum 2d01547a273e715388bae110707a41f458b5092193d31e6b726b5527a56a1eac
RUN bitnami-pkg unpack php-7.1.6-0 --checksum 135fae0bd830e3c8d1bf1d8b314fcdfd9a32f7a884fc5a90b1662af0db953b9a
RUN bitnami-pkg install libphp-7.1.6-0 --checksum b0447c52cb825706ce41864e5d164ca4df1de30d10ffe4afc54f3888049f7712
RUN bitnami-pkg unpack codiad-2.7.5-0 --checksum b1c1a0cbfdb7f5d7a82d7ec42e732b1a5c24a145f80cb8f37b8180b00fb0ade1

COPY rootfs /

ENV APACHE_HTTPS_PORT_NUMBER="443" \
    APACHE_HTTP_PORT_NUMBER="80" \
    BITNAMI_APP_NAME="codiad" \
    BITNAMI_IMAGE_VERSION="2.7.5-r7" \
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
