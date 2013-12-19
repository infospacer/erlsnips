-module(utils).
-compile(export_all).

map_pl() ->
	Spid = self(),
	Ref = erlang:make_ref(),
	rf_prnt(Ref).

rf_prnt(Ref) ->
	[spawn(fun() -> Ref , io:format("Ref ~n~w", [Ref]) end) || _<- [1,2,3]].
