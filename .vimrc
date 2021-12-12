#!/bin/bash
:set shiftwidth=4
:set tabstop=4
:set expandtab

:syntax on
:colorscheme pablo

" if I ever have issues with key presses uncomment this
" :set nocompatible

" vim should adjust for makefile, but this will include Makefile
autocmd FileType make setlocal noexpandtab
