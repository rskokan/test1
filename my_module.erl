%% This is a simple Erlang module
-module(my_module).
-export([pie/0, print/1, printw/1, either_or_both/2, either_or_both2/2, area/1]).

pie() ->
	3.14.

print(Term) ->
	io:format("The value of Term is ~p.~n", [Term]).

printw(Term) ->
	io:format("The value of Term is ~w.~n", [Term]).

either_or_both(true, B) when is_boolean(B) ->
	true;
either_or_both(A, true) when is_boolean(A) ->
	true;
either_or_both(false, false) ->
	false;
either_or_both(_, _) ->
	%% Just to try to catch this case and print something. But better to raise an error.
	io:format("ERROR: Arguments must be booleans~n").

%% Same using case (not much Erlang-ish)
either_or_both2(A, B) ->
	case {A, B} of
		{true, B} when is_boolean(B) ->
			true;
		{A, true} when is_boolean(A) ->
			true;
		{false, false} ->
			false
	end.

area({circle, Radius}) ->
	Radius * Radius * math:pi();
area({square, Side}) ->
	Side * Side;
area({rectangle, Width, Height}) ->
	Width * Height.

