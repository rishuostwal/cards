defmodule Cards.CLI do
	def main(_args) do
		{hand, deck} = Cards.create_hand(5)
		Cards.Game.game(hand)
	end
end
