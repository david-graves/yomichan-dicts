#!/usr/bin/bash

SRC="src"
DST="dst"

# check for yomichan-import
if ! [ -x "$(command -v yomichan-import)" ]; then
    echo "error: yomichan-import is not installed" >&2
    exit 1
fi

# convert jmdict
if ! [ -f $SRC/JMdict ]; then
    gzip -d -k $SRC/JMdict.gz
fi

yomichan-import --language=dutch $SRC/JMdict $DST/jmdict_dutch.zip
yomichan-import --language=english $SRC/JMdict $DST/jmdict_english.zip
yomichan-import --language=french $SRC/JMdict $DST/jmdict_french.zip
yomichan-import --language=german $SRC/JMdict $DST/jmdict_german.zip
yomichan-import --language=hungarian $SRC/JMdict $DST/jmdict_hungarian.zip
yomichan-import --language=italian $SRC/JMdict $DST/jmdict_italian.zip
yomichan-import --language=russian $SRC/JMdict $DST/jmdict_russian.zip
yomichan-import --language=slovenian $SRC/JMdict $DST/jmdict_slovenian.zip
yomichan-import --language=spanish $SRC/JMdict $DST/jmdict_spanish.zip
yomichan-import --language=swedish $SRC/JMdict $DST/jmdict_swedish.zip

# convert jmnedict
if ! [ -f $SRC/JMnedict.xml ]; then
    gzip -d -k $SRC/JMnedict.xml.gz
fi

yomichan-import $SRC/JMnedict.xml $DST/jmnedict.zip

# convert kanjidic2
if ! [ -f $SRC/kanjidic2.xml ]; then
    gzip -d -k $SRC/kanjidic2.xml.gz
fi

yomichan-import --language=english $SRC/kanjidic2.xml $DST/kanjidic_english.zip
yomichan-import --language=french $SRC/kanjidic2.xml $DST/.dst/kanjidic_french.zip
yomichan-import --language=portuguese $SRC/kanjidic2.xml $DST/kanjidic_portuguese.zip
yomichan-import --language=spanish $SRC/kanjidic2.xml $DST/kanjidic_spanish.zip
