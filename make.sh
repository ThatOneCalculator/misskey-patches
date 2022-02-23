#!/bin/bash

echo "Patching files..."
fdfind -t f -x sed -i 's/https:\/\/xn--931a.moe\/assets\/error.jpg/https:\/\/cdn.discordapp.com\/attachments\/810799100940255260\/941040147351359578\/emote.png/g' {} \;
fdfind -t f -x sed -i 's/https:\/\/xn--931a.moe\/assets\/info.jpg/https:\/\/cdn.discordapp.com\/attachments\/810799100940255260\/933578895574302760\/spunch.png/g' {} \;
fdfind -t f -x sed -i 's/https:\/\/xn--931a.moe\/assets\/not-found.jpg/https:\/\/cdn.discordapp.com\/attachments\/810799100940255260\/941040122609147966\/calcponder_nobg.png/g' {} \;
sed -i 's/https:\/\/www.google.com/https:\/\/gowogle.voring.me/g' ./packages/client/src/components/google.vue
sed -i 's/86b300/00beff/g' ./packages/backend/src/server/web/views/base.pug
sed -i '20s/false/true/' ./packages/client/src/store.ts
sed -i "56s/'🎉', '💢', '😥', '😇'/'😥', '😇', ':calchigh:', ':calcmentalbreakdowncrying:', ':amongass:'/" ./packages/client/src/store.ts
wget -q https://github.com/ThatOneCalculator/misskey-patches/raw/main/favicon.ico
mv ./favicon.ico ./packages/backend/assets/
echo "Patched files!"
yarn
NODE_ENV=production npm run build
NODE_ENV=production npm run migrate
echo "Done!"
