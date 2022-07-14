#! /usr/bin/env bash

curl --location --request POST "$1" \
--header 'Content-Type: application/json' \
--data-raw '{
    "title": "The wrong type of snow",
    "body": "Kogi af microdosing la croix. Single-origin coffee street art vegan echo park, chia drinking vinegar ethical poutine gochujang hot chicken. Quinoa bicycle rights portland lumbersexual. Bicycle rights brooklyn readymade, bespoke brunch master cleanse portland YOLO celiac schlitz."
}'