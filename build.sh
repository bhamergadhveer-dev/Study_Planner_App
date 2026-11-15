#!/bin/bash
if cd flutter; then
  git pull && cd ..
else
  git clone https://github.com -b stable --depth 1
fi
flutter/bin/flutter config --enable-web
flutter/bin/flutter build web --release
