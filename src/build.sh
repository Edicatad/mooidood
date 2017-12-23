#!/bin/bash

PARTIAL='html/partials'
HTML='html'
BUILD='..'

echo 'Deploying dependencies'
cp -r js/* "${BUILD}/js"
cp -r css/* "${BUILD}/css"
cp -r img/* "${BUILD}/img"

echo 'Building index'
cat "${PARTIAL}/header.html" > "${BUILD}/index.html"
cat "${HTML}/index.html" >> "${BUILD}/index.html"
cat "${PARTIAL}/footer.html" >> "${BUILD}/index.html"

sed -i "s/{{{ TITLE }}}/mooidood/g" "${BUILD}/index.html"

PAGES=(
    "about"
)

for page in "${PAGES[@]}"
do
        echo "Building ${page}"
        cat "${PARTIAL}/header.html" > "${BUILD}/${page}.html"
        cat "${HTML}/${page}.html" >> "${BUILD}/${page}.html"
        cat "${PARTIAL}/footer.html" >> "${BUILD}/${page}.html"
        
        sed -i "s/{{{ TITLE }}}/mooidood | ${page}/g" "${BUILD}/${page}.html"
done
