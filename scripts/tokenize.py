import argparse
from mosestokenizer import *
import sys
import logging


if __name__ == "__main__":


	parser = argparse.ArgumentParser(description="Simple script for tokenizing")
	parser.add_argument("file", type=argparse.FileType('r', encoding='utf-8'))
	parser.add_argument("--lang", type=str, choices=['de', 'en', 'it', 'fr', 'nl'], default='en')
	args = parser.parse_args()

	tokenize = MosesTokenizer(args.lang)

	for line in args.file:
		tokens = " ".join(tokenize(line))
		sys.stdout.write(tokens + '\n')


