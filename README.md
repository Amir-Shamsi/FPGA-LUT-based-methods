# FPGA LUT based methods

* Course: *Field Programmable Gate Array (FPGA)*
* Proffesor: *Dr. Mohsen Raji*
* Fall **2022/23**

## Project document

Page 1 | Page 2
:-------------------------:|:-------------------------:
<img src="doc/doc1.jpg"/> |  <img src="doc/doc2.jpg"/>

## LUT without Interpolation (First Part)
For the first part of the project, I created a python code that generates a LUT table of function `x^2 - x^3` for x in range `(0, 1)` and the table has `256 sluts` which means we only need 8-bits so we create LUT for every possible number in 8-bits and also, they are less than 1 and bigger than 0 so we use all 8-bits as the fraction.

After generating the LUT table we only need to make a module that returns the related LUT entry based on `8-bit input`.

## Linear Interpolation (Second Part)
For the second part, we must implement the function using linear interpolation using 64 slut memories so first of all, we must separate `64 entries` from the table and the choices must be in equal places so we collect every `4k` (k = 0, 1, ...) entry.

After that we need to implement the formula below inside our Verilog module.

For being able to synthesize the module on FPGA we must remove the division; the best thing is to make it into a shift division (base 2 division) so that let module gets synthesized.

Base on the course slides we can convert the formula to this (we know that `XLSB` is input `(8-6=)2 LSB` bits and `X2 – X1 = 2N-P = 2(8-6))`.

<img src="doc/part2.png"/>

## Quadratic Interpolation (Third Part)
this part required learning the quadratic method, after a little search I got a YouTube video that explained: "**Quadratic Interpolation**" ([YouTube Link](https://www.youtube.com/watch?v=BQHyEAl3-qk)).

First of all, we need a 64 slut LUT which is just like part 2. 

Tor implementing the formula first we need to eliminate the division so:

<p align="center"><img src="doc/part3.jpg" height="800"/></p>

## Comparing the accuracy of step 1, 2, and 3
In first part has 256 slut and also we don’t need to calculate and approximate any 8-bit input which is why the first part has the most accurate among all parts.

In the second one, we use 64 slut so the accuracy is less that the first part because we must approximate the output with the 8-bit input through the linear formula. 

In the third one, we also use 64 slut like the second part but this time we use the quadratic method which needs three nodes and the accuracy is less than the first and second parts. Here is a table of the average accuracy of 20 same random inputs in all three parts:

|**Part** | Average Accuracy|
:---------:|:-----------:
|First| 96.41389884449454 % |
|Second |78.55320366164348 %|
|Third |61.19051129796653 %|


### Instalation
1. Clone the project 

    ```bash
    git clone https://github.com/Amir-Shamsi/FPGA-LUT-based-methods.git
    ```
2. Create a Xillinx project
3. Add file of `First Part`, `Second Part` and `Third Part` folder files through `Add Source` inside project.
4. Get some coffee.


