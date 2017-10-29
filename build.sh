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

yomichan-import --title="JMdict (Dutch)" --language=dutch $SRC/JMdict $DST/jmdict_dutch.zip
yomichan-import --title="JMdict (English)" --language=english $SRC/JMdict $DST/jmdict_english.zip
yomichan-import --title="JMdict (French)" --language=french $SRC/JMdict $DST/jmdict_french.zip
yomichan-import --title="JMdict (German)" --language=german $SRC/JMdict $DST/jmdict_german.zip
yomichan-import --title="JMdict (Hungarian)" --language=hungarian $SRC/JMdict $DST/jmdict_hungarian.zip
yomichan-import --title="JMdict (Italian)" --language=italian $SRC/JMdict $DST/jmdict_italian.zip
yomichan-import --title="JMdict (Russian)" --language=russian $SRC/JMdict $DST/jmdict_russian.zip
yomichan-import --title="JMdict (Slovenian)" --language=slovenian $SRC/JMdict $DST/jmdict_slovenian.zip
yomichan-import --title="JMdict (Spanish)" --language=spanish $SRC/JMdict $DST/jmdict_spanish.zip
yomichan-import --title="JMdict (Swedish)" --language=swedish $SRC/JMdict $DST/jmdict_swedish.zip

# convert kireicake
if ! [ -f $SRC/kireicake.sqlite ]; then
    gzip -d -k $SRC/kireicake.sqlite.gz
fi

yomichan-import --title="KireiCake" $SRC/kireicake.sqlite $DST/kireicake.zip

# convert jmnedict
if ! [ -f $SRC/JMnedict.xml ]; then
    gzip -d -k $SRC/JMnedict.xml.gz
fi

yomichan-import $SRC/JMnedict.xml $DST/jmnedict.zip

# convert kanjidic2
if ! [ -f $SRC/kanjidic2.xml ]; then
    gzip -d -k $SRC/kanjidic2.xml.gz
fi

yomichan-import --title="JMdict (English)" --language=english $SRC/kanjidic2.xml $DST/kanjidic_english.zip
yomichan-import --title="JMdict (French)" --language=french $SRC/kanjidic2.xml $DST/kanjidic_french.zip
yomichan-import --title="JMdict (Portuguese)" --language=portuguese $SRC/kanjidic2.xml $DST/kanjidic_portuguese.zip
yomichan-import --title="JMdict (Spanish)" --language=spanish $SRC/kanjidic2.xml $DST/kanjidic_spanish.zip
