#!/bin/bash

echo "Patching files..."
fdfind -t f -x sed -i 's/https:\/\/xn--931a.moe\/assets\/error.jpg/https:\/\/cdn.discordapp.com\/attachments\/810799100940255260\/941040147351359578\/emote.png/g' {} \;
fdfind -t f -x sed -i 's/https:\/\/xn--931a.moe\/assets\/info.jpg/https:\/\/cdn.discordapp.com\/attachments\/810799100940255260\/933578895574302760\/spunch.png/g' {} \;
fdfind -t f -x sed -i 's/https:\/\/xn--931a.moe\/assets\/not-found.jpg/https:\/\/cdn.discordapp.com\/attachments\/810799100940255260\/941040122609147966\/calcponder_nobg.png/g' {} \;
sed -i 's/https:\/\/www.google.com/https:\/\/gowogle.voring.me/g' ./packages/client/src/components/google.vue
sed -i 's/Misskey expands the world of the Fediverse/Stop posting about Among Us/g' ./locales/en-US.yml
sed -i 's/86b300/00beff/g' ./packages/backend/src/server/web/views/base.pug
mv patches/favicon.ico ./packages/backend/assets/favicon.ico
mv patches/apple-touch-icon.png ./packages/backend/assets/apple-touch-icon.png
mv patches/user-unknown.png ./packages/backend/assets/icons/user-unknown.png
mv patches/192.png ./packages/backend/assets/icons/192.png
mv patches/512.png ./packages/backend/assets/icons/512.png
git apply patches/store.patch
echo "Patched files!"
yarn
NODE_ENV=production npm run build
NODE_ENV=production npm run migrate
echo "Done!"
