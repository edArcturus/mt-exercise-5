#! /bin/bash

scripts=`dirname "$0"`
base=$scripts/..

data=$base/data
tools=$base/tools

mkdir -p $base/bpe_model/
bpe_model=$base/bpe_model/

subword-nmt learn-joint-bpe-and-vocab \
	--input $data/train_tok.de $data/train_tok.nl \
	--write-vocabulary $bpe_model/vocab.de $bpe_model/vocab.nl \
	-s 10000 --total-symbols -o $base/bpe_model/model.bpe