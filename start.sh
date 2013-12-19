#!/bin/bash
erl -sname myapp -pa ebin deps/*/ebin -boot start_sasl
