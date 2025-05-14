# clone the part3.1 branch of oss-fuzz repo
git clone -b part3.1 git@github.com:hrishi-06/oss-fuzz.git
cd oss-fuzz

# build the libxml2 image and fuzzers
python3 infra/helper.py build_image libxml2
python3 infra/helper.py build_fuzzers libxml2

# create a directory for the corpus
mkdir build/out/corpus

# run the fuzzer
timeout -k 1s 4h python3 infra/helper.py run_fuzzer libxml2 xml --corpus-dir build/out/corpus

rm -rf build/out/libxml2

# build the fuzzers with coverage
python3 infra/helper.py build_fuzzers --sanitizer coverage libxml2

# get the coverage
python3 infra/helper.py coverage libxml2 --corpus-dir build/out/corpus/ --fuzz-target xml
