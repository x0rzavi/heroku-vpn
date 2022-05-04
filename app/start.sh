#!/bin/sh

/app/tailscaled --tun=userspace-networking --socks5-server=localhost:1055 &
/app/tailscale up --authkey=${TAILSCALE_AUTHKEY} --hostname=ephermeral-vpn-${PORT} --advertise-exit-node
echo Tailscale started
ALL_PROXY=socks5://localhost:1055/
gunicorn --bind 0.0.0.0:${PORT} --workers 2 --threads 2 app.wsgi:app
