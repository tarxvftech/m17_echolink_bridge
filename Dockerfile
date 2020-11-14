from archlinux
RUN pacman --noconfirm -Syyu base-devel git
RUN pacman --noconfirm -S codec2 python python-pip python-setuptools
RUN pip install --upgrade pip numpy Cython wheel setuptools
#above is from m17 requirements from pyM17 and might need to be updated later

RUN pacman --noconfirm -S ffmpeg
RUN pip install --upgrade m17[codec2]
RUN useradd builduser -m 
RUN passwd -d builduser 
RUN printf 'builduser ALL=(ALL) ALL\n' | tee -a /etc/sudoers 
workdir /build
RUN chmod 777 -R /build
RUN ls -latr
RUN git clone https://aur.archlinux.org/pkgbuilder.git && chown builduser:builduser -R pkgbuilder/ && cd pkgbuilder && ls -altr && sudo -u builduser makepkg --noconfirm -fsri
RUN sudo -u builduser pkgbuilder --noconfirm -S svxlink

workdir /app

COPY svxlink/ /etc/svxlink/
COPY *.sh /app/

CMD bash run.sh
