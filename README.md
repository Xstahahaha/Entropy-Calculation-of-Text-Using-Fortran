# Entropy-Calculation-of-Text-Using-Fortran
This repository contains a Fortran program that calculates the entropy of a text file. It reads the file, counts the occurrences of characters from a predefined alphabet (including letters and spaces), computes their probabilities, and calculates the entropy. The program also checks for invalid characters not in the defined alphabet.

## Overview
This program calculates the entropy of a text file using the principles of information theory. It analyzes the frequency of each character from a defined alphabet and computes the entropy based on these frequencies.

## Features
- Reads a text file and counts character occurrences.
- Computes the probability of each character.
- Calculates the entropy of the text in bits.
- Reports any invalid characters not in the defined alphabet.

## Requirements
- A Fortran compiler (e.g., gfortran)

## How to Run
1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/entropy_calculation.git
   cd entropy_calculation 
2. Compile the program:
   ```bash
   gfortran -o entropy_text entropy_text.f90
3. Run the program
   ```bash
   ./entropy_text
## Output
The program will output:
  - Total number of characters
  - Entropy per character
  - Total entropy in bits
  - Total information in bytes
  - List of any invalid characters encountered


