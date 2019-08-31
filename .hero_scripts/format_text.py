#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import argparse as arp

def format_text(text):
    formatted_text = ""
    counter = 0
    for letter in text:
        if letter.isupper():
            if counter >= 1:
                formatted_text += "-"
            formatted_text += letter.lower()
        elif letter.islower():
            formatted_text += letter
        counter += 1
    print(formatted_text)
    return formatted_text

parse = arp.ArgumentParser("sample")
parse.add_argument("namefont", help="Input name original font")
args = parse.parse_args()

if __name__ == '__main__':
    format_text(args.namefont)

