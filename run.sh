#!/bin/bash

# trace-cmd can be obtained from https://github.com/rostedt/trace-cmd.

trace-cmd record \
	  -p function_graph \
	  -n do_page_fault \
	  -O nofuncgraph-irqs \
	  -n __x64_sys_execve \
	  -o trace-create-empty-file.dat \
	  -F touch foobar

rm foobar

trace-cmd record \
	  -p function_graph \
	  -O nofuncgraph-irqs \
	  -g __x64_sys_write \
	  -o trace-write-file.dat \
	  -F echo foo > foobar

rm foobar

