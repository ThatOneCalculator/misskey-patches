#!/bin/bash

echo "Patching files..."
fdfind -t f -x sed -i 's/https:\/\/xn--931a.moe\/assets\/error.jpg/https:\/\/cdn.discordapp.com\/attachments\/810799100940255260\/941040147351359578\/emote.png/g' {} \;
fdfind -t f -x sed -i 's/https:\/\/xn--931a.moe\/assets\/info.jpg/https:\/\/cdn.discordapp.com\/attachments\/810799100940255260\/933578895574302760\/spunch.png/g' {} \;
fdfind -t f -x sed -i 's/https:\/\/xn--931a.moe\/assets\/not-found.jpg/https:\/\/cdn.discordapp.com\/attachments\/810799100940255260\/941040122609147966\/calcponder_nobg.png/g' {} \;
sed -i 's/https:\/\/www.google.com/https:\/\/gowogle.voring.me/g' ./packages/client/src/components/google.vue
sed -i 's/Misskey expands the world of the Fediverse/Stop posting about Among Us/g' ./locales/en-US.yml
sed -i 's/86b300/00beff/g' ./packages/backend/src/server/web/views/base.pug
sed -i "s/'🎉', '💢', '😥', '😇', '🍮'/'😥', '😇', ':calchigh:', ':calcmentalbreakdowncrying:', ':amongass:'/" ./packages/client/src/store.ts
sed '70,81d' ./packages/client/src/store.ts
sed -i "70/]/'notifications', 'mentions', 'messaging', 'followRequests', '-', 'drive', 'pages', 'gallery', 'clips', '-', 'featured', 'explore', 'antennas', 'search', 'announcements']/g" ./packages/client/src/store.ts
sed -i '236s/1/0/' ./packages/client/src/store.ts
sed -i 's/-light/-rosepinedawn/g' ./packages/client/src/store.ts
sed -i 's/-dark/-rosepine/g' ./packages/client/src/store.ts
wget -q https://github.com/ThatOneCalculator/misskey-patches/raw/main/favicon.ico -O ./packages/backend/assets/favicon.ico
wget -q https://github.com/ThatOneCalculator/misskey-patches/raw/main/apple-touch-icon.png -O ./packages/backend/assets/apple-touch-icon.png
wget -q https://github.com/ThatOneCalculator/misskey-patches/raw/main/user-unknown.png -O ./packages/backend/assets/user-unknown.png
wget -q https://github.com/ThatOneCalculator/misskey-patches/raw/main/192.png -O ./packages/backend/assets/icons/192.png
wget -q https://github.com/ThatOneCalculator/misskey-patches/raw/main/512.png -O ./packages/backend/assets/icons/512.png
echo "Patched files!"
yarn
NODE_ENV=production npm run build
NODE_ENV=production npm run migrate
echo "Done!"
