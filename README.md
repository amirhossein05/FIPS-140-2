# FIPS-140-2 - MATLAB Implementation of Randomness Tests
This repository contains a MATLAB project that implements the FIPS PUB 140-2 statistical tests for randomness. These tests are essential for verifying the quality of pseudorandom sequences, especially in cryptographic modules and secure communication systems.

## Features
* **Monobit Test**: Checks the balance between 0s and 1s in a binary sequence.
* **Poker Test**: Evaluates the uniformity of m-bit patterns across the input.
* **Runs Test**: Analyzes runs of identical bits to detect non-random patterns.
* **Long Run Test**: Ensures that no single long run of identical bits exceeds a predefined threshold.

## Directory Structure

- **Main Source Files** (in `final_fips/`):
  - `monobit_test.m`: Implements the Monobit test.
  - `poker_test.m`: Implements the Poker test.
  - `runs_test.m`: Implements the Runs test.
  - `long_run_test.m`: Implements the Long Run test.


## Requirements

- **MATLAB**: Tested on MATLAB R2018 and newer.
- **Binary Input Format**: The input should be a string or array consisting of 0s and 1s.

## Example Usage

```matlab
% Example binary sequence
seq = '1101001101010100';

% Run Monobit test
result = monobit_test(seq);
disp(result);

% Run Runs test
result = runs_test(seq);
disp(result);
