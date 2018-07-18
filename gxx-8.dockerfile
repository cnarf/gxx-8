ARG TAG=latest

FROM cnarf/buster:${TAG}

LABEL maintainer="cnarf@charline"
LABEL description="gxx-8 from buster in scratch"

RUN apt-get install --no-install-recommends -y g++-8 libstdc++6-8-dbg gcc-8-locales libgomp1-dbg libitm1-dbg libatomic1-dbg libasan5-dbg liblsan0-dbg libtsan0-dbg libubsan1-dbg libmpx2-dbg libquadmath0-dbg \
&& apt-get autoremove --purge -y \
&& apt-get clean \
&& /root/finalize.sh;


# docker run --rm -it -v (pwd):/usr/src -w /usr/src gxx-8 g++-8 -I . -I headers -std=c++17 -Wall -Wextra -O0 -g3 -DDEBUG=2 -fsanitize=address -fsanitize-recover=address -fno-omit-frame-pointer -o build/debug/tests/expect.o -c tests/expect.cc
