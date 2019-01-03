
gen_cfg() {
    CFG_PATH=/opt/janus/etc/janus
    CFG_BIN=/opt/janus/bin/janus-cfgconv

    for sample in $(ls $CFG_PATH/*.sample); do
        jcfg=${sample%.*}
        [ ! -e $jcfg ] && $CFG_BIN ${sample} ${jcfg} 1>/dev/null
    done
}

gen_bld() {
    LIBS="-lpthread -lssl -lcrypto -lgio-2.0 -lgobject-2.0 -lglib-2.0 -lgnutls"
    PKG_CONFIG_PATH="/usr/local/lib/pkgconfig" LIBS="$LIBS" ./configure --prefix=/opt/janus --enable-libsrtp2 --enable-plugin-lua
}


#gen_cfg
gen_bld
