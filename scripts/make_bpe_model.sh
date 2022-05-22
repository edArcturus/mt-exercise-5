#! /bin/bash

scripts=`dirname "$0"`
base=$scripts/..

data=$base/data
tools=$base/tools

mkdir -p $base/bpe_model/
bpe_model=$base/bpe_model/


echo Learning BPE model...

subword-nmt learn-joint-bpe-and-vocab \
	--input $data/train_tok.de $data/train_tok.nl \
	--write-vocabulary $bpe_model/vocab.de $bpe_model/vocab.nl \
	-s 10000 --total-symbols -o $base/bpe_model/model.bpe

echo Applying BPE model to training data...

subword-nmt apply-bpe -c $bpe_model/model.bpe --vocabulary $bpe_model/vocab.de \
	--vocabulary-threshold 10 < data/train_tok.de > data/train_bpe.de

subword-nmt apply-bpe -c $bpe_model/model.bpe --vocabulary $bpe_model/vocab.nl \
	--vocabulary-threshold 10 < data/train_tok.nl > data/train_bpe.nl


echo Applying BPE model to dev data...

subword-nmt apply-bpe -c $bpe_model/model.bpe --vocabulary $bpe_model/vocab.de \
	--vocabulary-threshold 10 < data/dev_tok.de > data/dev_bpe.de

subword-nmt apply-bpe -c $bpe_model/model.bpe --vocabulary $bpe_model/vocab.nl \
	--vocabulary-threshold 10 < data/dev_tok.nl > data/dev_bpe.nl

echo Applying BPE model to test data...

subword-nmt apply-bpe -c $bpe_model/model.bpe --vocabulary $bpe_model/vocab.de \
	--vocabulary-threshold 10 < data/test_tok.de > data/test_bpe.de

subword-nmt apply-bpe -c $bpe_model/model.bpe --vocabulary $bpe_model/vocab.nl \
	--vocabulary-threshold 10 < data/test_tok.nl > data/test_bpe.nl


echo Creating vocabulary file...

python3 $tools/joeynmt/scripts/build_vocab.py \
$data/train_bpe.de $data/train_bpe.nl \
--output_path $data/vocab.txt
