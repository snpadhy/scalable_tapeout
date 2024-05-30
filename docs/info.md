<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

sea_top: This is the top-level module that instantiates the encryption and decryption modules (sea_en and sea_de) and connects their inputs and outputs.

sea_en: This module performs the encryption process. It takes inputs li, ri (left and right halves of the input block), and ki (the key), and produces nli and nri (the new left and right halves).

sea_de: This module performs the decryption process. It takes inputs nli, nri (new left and right halves), and ki (the key), and produces li and ri (left and right halves of the decrypted block).

sbox: This module represents the substitution box (S-box) used in the encryption and decryption processes. It takes a 3-bit input a and produces a 3-bit output b based on a predefined substitution table.

Variables and Wires: Various wires and registers are declared to hold intermediate values during the encryption and decryption processes.

Substitution Boxes (S-boxes): There are 16 instances of the sbox module instantiated in both encryption and decryption processes. Each S-box takes a 3-bit input and produces a 3-bit output based on a predefined substitution table

## How to test

Use inputs to test output

## External hardware

List external hardware used in your project (e.g. PMOD, LED display, etc), if any
