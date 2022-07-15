# misskey-patches
The patches used on https://stop.voring.me

- Favicon/icon
- Default menu items
- Default emojis
- Turn off new note sound
- Search syntax URL
- Images (error/info/unknown user)
- Signup screen message
- Custom error screen
- MOTD (Thank you [PikaDude!](https://github.com/PikaDude))
- Star is like (Made by [Johann150](https://github.com/Johann150))
- Random icon on loading screen

### Usage:
```
cd misskey
git clone https://github.com/ThatOneCalculator/misskey-patches/ patches
ln -s ./patches/make.sh ./make.sh
./make.sh
```

#### Custom error screen
If you're using the default Misskey nginx config, place this ***before*** `location /`:
```
error_page 502 /502.html;
location = /502.html {
  root /home/misskey/misskey/patches; # Path to patches folder
  internal;
}
```
###### Thank you Sandafied#2973 for the help with this 💚
