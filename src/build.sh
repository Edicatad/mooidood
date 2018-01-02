#!/bin/bash

PARTIAL='html/partials'
HTML='html'
BUILD='..'

echo 'Deploying dependencies'
cp -r js/* "${BUILD}/js"
cp -r css/* "${BUILD}/css"
cp -r img/* "${BUILD}/img"

PAGES=(
"index"
"about"
)

for page in "${PAGES[@]}"
do
    # Build page
    echo "Building ${page}"
    cat "${PARTIAL}/header.html" > "${BUILD}/${page}.html"
    cat "${HTML}/${page}.html" >> "${BUILD}/${page}.html"
    cat "${PARTIAL}/footer.html" >> "${BUILD}/${page}.html"

    # Add title
    if [ ${page} == 'index' ]
    then    # do index-specific things
        echo "  Performing index-specific actions"
        sed -i '' -e "s/{{{ TITLE }}}/mooidood/g" "${BUILD}/${page}.html"
    else
        sed -i '' -e "s/{{{ TITLE }}}/mooidood | ${page}/g" "${BUILD}/${page}.html"
    fi
done
