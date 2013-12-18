-module(mr).
-compile(export_all).

%Reload file only
r(Module) ->
	code:purge(Module),
	code:delete(Module),
	code:load_file(Module).

%Compile and reload file
cr(Module) ->
	Path = "./src/"++atom_to_list(Module)++".erl",
	compile:file(Path,[{outdir, "./ebin"}]),
	code:delete(Module),
	code:purge(Module),
	code:load_file(Module).
