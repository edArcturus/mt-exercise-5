scripts=`dirname "$0"`
base=$scripts/..
data=$base/data

python3 $scripts/tokenize.py $data/dev.de-nl.nl > $data/dev_tok.de-nl.nl
python3 $scripts/tokenize.py $data/dev.de-nl.de > $data/dev_tok.de-nl.de
python3 $scripts/tokenize.py $data/test.de-nl.nl > $data/test_tok.de-nl.nl
python3 $scripts/tokenize.py $data/test.de-nl.de > $data/test_tok.de-nl.de
python3 $scripts/tokenize.py $data/train.de-nl.nl > $data/train_tok.de-nl.nl
python3 $scripts/tokenize.py $data/train.de-nl.de > $data/train_tok.de-nl.de
