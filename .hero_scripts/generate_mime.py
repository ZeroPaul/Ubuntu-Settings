#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import argparse as arp

def template_mime(tfile, cfile, args):
    template_file = open(tfile, 'r').read() % args
    create_file = open(cfile, 'w')
    create_file.write(template_file)
    create_file.close()
    # print('{0} {1}'.format(cfile, args))


parse = arp.ArgumentParser("sample")
parse.add_argument("namer", help="Input name original font")
parse.add_argument("name_file", help="Input name file config")
args = parse.parse_args()

if __name__ == '__main__':
    template_mime('x-mime-template.xml', args.name_file, {'fonts':
    args.namer,})

