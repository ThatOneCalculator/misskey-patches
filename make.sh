#!/bin/bash

echo "Patching files..."
git clone --quiet https://github.com/rose-pine/misskey.git rosepinethemes &> /dev/null
mv ./rosepinethemes/*.json5 ./packages/client/src/themes/
rm -rf ./rosepinethemes
fdfind -t f -x sed -i 's/badges\/info.jpg/badges\/info.png/g' {} \;
fdfind -t f -x sed -i 's/badges\/not-found.jpg/badges\/not-found.png/g' {} \;
fdfind -t f -x sed -i 's/badges\/error.jpg/badges\/error.png/g' {} \;
fdfind -t f -x sed -i 's/Google/gOwOgle/g' {} \;
cp -r patches/splash/loading_icons/ ./packages/backend/assets/
sed -i 's/https:\/\/www.google.com/https:\/\/gowogle.voring.me/g' ./packages/client/src/components/google.vue
sed -i 's/Misskey expands the world of the Fediverse/Stop posting about Among Us/g' ./locales/en-US.yml
sed -i 's/86b300/00beff/g' ./packages/backend/src/server/web/views/base.pug
sed -i 's/3000/2800/g' ./packages/backend/src/const.ts
sed -i 's/limit: 30/limit: 100/g' ./packages/client/src/components/note-detailed.vue
cp patches/splash.png ./packages/backend/assets/splash.png
cp patches/favicon.ico ./packages/backend/assets/favicon.ico
cp patches/favicon.png ./packages/backend/assets/favicon.png
cp patches/apple-touch-icon.png ./packages/backend/assets/apple-touch-icon.png
cp patches/user-unknown.png ./packages/backend/assets/user-unknown.png
cp patches/192.png ./packages/backend/assets/icons/192.png
cp patches/512.png ./packages/backend/assets/icons/512.png
cp patches/info.png ./packages/backend/assets/badges/info.png
cp patches/not-found.png ./packages/backend/assets/badges/not-found.png
cp patches/error.png ./packages/backend/assets/badges/error.png
cp patches/512.png ./packages/client/assets/about-icon.png
cp patches/fedi.jpg ./packages/client/assets/fedi.jpg
cp patches/*.json5 ./packages/client/src/themes/
git apply patches/store.patch &> /dev/null
git apply patches/welcome.patch &> /dev/null
git apply patches/splash/index.patch &> /dev/null
git apply patches/splash/base.patch &> /dev/null
git apply patches/splash/style.patch &> /dev/null
git apply patches/star-is-like.patch &> /dev/null
echo "Patched files!"
#yarn
NODE_ENV=production npm run build
NODE_ENV=production npm run migrate
echo "Done!"
