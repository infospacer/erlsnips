% Functions to reload and compile modules
% mr:r(M) - only reloads
% mr:c(M) - compiles and eloads
% git test
% else one change

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
	case ({ok,Module} == compile:file(Path,[{outdir, "./ebin"}])) of
		true -> io:format("Module ~w is succesfully compiled~n",[Module]);
		_ -> error
	end.
	% code:delete(Module),
	% code:purge(Module),
	% code:load_file(Module).

