defmodule Cards.CLI do
	def main(_args) do
		IO.puts "Generated cards: "
		cards = Cards.create_deck

		for card <- cards do
			IO.puts "#{card}"
		end
	end
end
