scripts=`dirname "$0"`
base=$scripts/..
data=$base/data

python3 $scripts/tokenize.py $data/dev.de-nl.nl --lang nl > $data/dev_tok.nl
python3 $scripts/tokenize.py $data/dev.de-nl.de --lang de > $data/dev_tok.de
python3 $scripts/tokenize.py $data/test.de-nl.nl --lang nl > $data/test_tok.nl
python3 $scripts/tokenize.py $data/test.de-nl.de --lang de > $data/test_tok.de
python3 $scripts/tokenize.py $data/train.de-nl.nl --lang nl > $data/train_tok.nl
python3 $scripts/tokenize.py $data/train.de-nl.de --lang de > $data/train_tok.de
