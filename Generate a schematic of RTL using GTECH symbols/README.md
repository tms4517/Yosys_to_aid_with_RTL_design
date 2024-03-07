# Outputs from the synthesis scripts

`yosys -s synthesisScript`

![script](circuit.svg)

`yosys -s synthesisScript2`

![script2](circuit2.svg)

For more information, see: https://yosyshq.readthedocs.io/projects/yosys/en/latest/appendix/APPNOTE_011_Design_Investigation.html. 

Note: If the synthesis script is run on a top-level module containing sub-modules, the sub-modules will appear as blackboxes with
an interface.
