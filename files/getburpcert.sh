#!/bin/bash
burp=$(find /usr/share/burpsuite -name "burp*.jar" 2>/dev/null | head -1)
[[ -z "$burp" ]] && { echo "burp jar not found under /usr/share/burpsuite" >&2; exit 1; }

JAVA=$(which java 2>/dev/null || find /usr/lib/jvm -name java -type f 2>/dev/null | head -1)
[[ -z "$JAVA" ]] && { echo "java not found" >&2; exit 1; }

rm -f /tmp/cacert.der
timeout 200 "$JAVA" -Djava.awt.headless=true -jar "$burp" < <(echo y) &
# the first launch shows the EULA and builds ~/.BurpSuite, so the proxy can take over a minute to listen
for _ in $(seq 90); do
    sleep 2
    curl -sf http://127.0.0.1:8080/cert -o /tmp/cacert.der && break
done
kill %1 2>/dev/null
[[ -s /tmp/cacert.der ]] || { echo "burp never served its CA certificate on 127.0.0.1:8080" >&2; exit 1; }
