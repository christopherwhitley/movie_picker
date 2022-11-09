#!/bin/bash

cd /opt

echo $PATH
export PATH=/Users/chriswhitley/.rvm/gems/ruby-3.0.4/bin/ruby_executable_hooks:/usr/local/bin:$PATH
echo $PATH

./configure --host=${HOST} || cat */config.log
make
make dist
make check RUNTESTFLAGS="-a $RUNTESTFLAGS" || true


