FROM python:alpine

WORKDIR /app

COPY ./app/requirements.txt /app/app/
RUN pip install --no-cache-dir -r /app/app/requirements.txt

RUN wget https://pkgs.tailscale.com/stable/$(wget -q -O- https://pkgs.tailscale.com/stable/ | grep 'amd64.tgz' | cut -d '"' -f 2) && \
    tar xzf tailscale* --strip-components=1
RUN mkdir -p /var/run/tailscale /var/cache/tailscale /var/lib/tailscale

#ENV PORT 1229
#EXPOSE 1229

COPY . .
CMD /app/app/start.sh
