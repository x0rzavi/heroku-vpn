FROM python:alpine

WORKDIR /app

COPY ./app/requirements.txt /app/app/
RUN pip install --no-cache-dir -r /app/app/requirements.txt

ENV TSFILE tailscale_1.24.2_amd64.tgz
RUN wget https://pkgs.tailscale.com/stable/${TSFILE} && \
    tar xzf ${TSFILE} --strip-components=1
RUN mkdir -p /var/run/tailscale /var/cache/tailscale /var/lib/tailscale

#ENV PORT 1229
#EXPOSE 1229

COPY . .
CMD /app/app/start.sh