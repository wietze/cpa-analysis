Correlation Power Analysis
===================
The purpose of this assignment is to implement in detail the Correlation Power Analysis attack (CPA) against software-based cryptographic implementations. For the project, the encryption algorithm used is the PRESENT cipher (http://www.ist-ubisecsens.org/publications/present_ches2007.pdf).
The attack will be performed during the 1st round of encryption.

----------

Running the project
-------------
This is a Matlab project. To run the analysis, open Matlab and run ```assignment.m```. This file will perform all computations, and output:

* The correct key candidate ```k```;
* A plot of the absolute correlation value for each ```k``` candidate, the top candidate highlighted in blue;
* A plot giving the rankings for the correct key candidate with respectively 1k, 4k, 8k and 12k power traces.

Notes
-------------
Please note that the file ```traces.mat``` is required for this project. Due to file size restrictions, this file is not part of repository. Make sure this file is present in the project folder before running it. 