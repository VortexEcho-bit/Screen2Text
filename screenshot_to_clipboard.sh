#!/bin/bash
TMP_IMG=$(mktemp /tmp/ocr-temp.png)
scrot -s -o "$TMP_IMG"
convert "$TMP_IMG" -colorspace Gray -normalize -deskew 40% -threshold 60% "$TMP_IMG"
tesseract "$TMP_IMG" stdout -l eng --dpi 150 | xclip -selection clipboard
rm "$TMP_IMG"
