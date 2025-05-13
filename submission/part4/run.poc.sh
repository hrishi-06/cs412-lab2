# clone the ain branch of oss-fuzz repo
git clone -b part4 git@github.com:hrishi-06/oss-fuzz.git
cd oss-fuzz

# build the libxml2 image and fuzzers
python3 infra/helper.py build_image libxml2
python3 infra/helper.py build_fuzzers libxml2

./build/out/libxml2/lint ../memory-leak-input
