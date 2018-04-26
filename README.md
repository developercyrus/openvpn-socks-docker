### Pull the Image
```bash
sudo docker pull developercyrus/nordvpn
```

### Run the Container
```bash
sudo docker run -d -p 1080:1080 --dns=8.8.8.8 -e USERNAME='username' -e PASSWORD='password' -e REGION='hk48' --cap-add=NET_ADMIN --device=/dev/net/tun developercyrus/nordvpn
```

 
