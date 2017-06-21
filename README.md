# Spectral Mapping for Brain Connectivity v1.0 

These files implement the algorithms presented in the paper:

*[Becker, C.O.](http://www.seas.upenn.edu/~cassiano/), [Pequito, S.](http://www.spequito.com/), [Pappas, G.J.](http://www.georgejpappas.org/), [Miller, M.B.](https://www.psych.ucsb.edu/people/faculty/miller), [Grafton, S.T.](https://www.psych.ucsb.edu/people/faculty/grafton), [Bassett, D.S.](http://www.danisbassett.com/) and [Preciado, V.M.](https://sites.google.com/site/victormpreciado/) (2017) Spectral Mapping of Brain Functional Connectivity from Diffusion Imaging. To appear; [arXiv:1512.02602](https://arxiv.org/abs/1512.02602).*

The code is written in Matlab, tested in Release 2016b.

![spectral](/res/spectral.png)

## Demos

The files *individual_demo.m* and *group_demo.m* (see note below) illustrate the use of the algorithms to generate spectral mappings from structural to functional brain connectivity data. They are available in the *demo* folder.

## External dependencies

The group spectral mapping algorithm uses an external optimization solver, Manopt 3.0. Please download it from [manopt.org](http://manopt.org) and add it to the *ext* folder. Then, uncompress it and add all subdirectories to your Matlab path.

## Feedback

We will appreciate if you send your suggestions for improvements to brainopt@gmail.com.
