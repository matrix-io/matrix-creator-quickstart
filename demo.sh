#!/bin/bash
git clone https://github.com/matrix-io/matrix-creator-hal.git
cd matrix-creator-hal
mkdir build && cd build
cmake .. && make