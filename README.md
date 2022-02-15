# misskey-patches
Very simple image/content patch script for my Misskey instance, https://stop.voring.me

### Usage:
Place `make.sh` into your Misskey directory, make it executable, then run `./make.sh` to patch and build Misskey.

### Note:

- I have the `fd` binary as `fdfind`, given my server runs Ubuntu. You may have to change `fdfind` to `fd` in the script. 
- ***As of right now***, I also
```
git remote add nullobsi https://github.com/nullobsi/misskey
git pull nullobsi
git merge nullobsi/configurable-fields
```
before running `./make.sh`. This is temporary until that PR is merged into Misskey's main repo.

![](https://cdn.discordapp.com/attachments/810799100940255260/941040122609147966/calcponder_nobg.png)
