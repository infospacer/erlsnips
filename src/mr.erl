% Functions to reload and compile modules
% mr:r(M) - only reloads
% mr:c(M) - compiles and eloads
% git test again


-module(mr).
-compile(export_all).

%Reload file only
r(Module) ->
	code:purge(Module),
	code:delete(Module),
	code:load_file(Module).

%Compile and reload file
c(Module) ->
	Path = "./src/"++atom_to_list(Module)++".erl",
	case compile:file(Path,[{outdir, "./ebin"}])of
		{ok,Module} -> io:format("Module (~w) is succesfully compiled~n",[Module]);
		_ -> error
	end,
	case code:purge(Module) of
		true -> io:format("Purging code of (~w) is true  ~n",[Module]);
		false -> io:format("Purging code  of (~w) is false ~n",[Module])
	end,
	case code:delete(Module) of
		true -> io:format("Old code of (~w) is succesfully deleted ~n",[Module]);
		false -> error
	end,
	case code:load_file(Module) of
		{module, Module} -> io:format("Module (~w) is succesfully loaded ~n",[Module]);
		{error, nofile} -> io:format("Module is not found ~n",[])
	end.

