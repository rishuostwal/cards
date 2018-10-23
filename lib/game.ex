defmodule Cards.Game do
  def game(hand) do
    choice = hand
      |> formated_title
      |> IO.gets
      |> Integer.parse
      |> case do
        {choice,  _} -> choice - 1
        :error -> 0
      end

    decide_winner(choice, hand)
  end

  def decide_winner(choice, hand) when choice > 0 do
    winner_card = get_winner_card(hand)
    user_choice = case Enum.at(hand, choice) do
      %{name: name} -> name
      nil -> "Invalid choice"
    end

    result = if winner_card.name === user_choice do
      "You win!!"
    else
      "You lose..."
    end

    IO.puts """
      Winner choice is: #{winner_card.name}
      Your choice is: #{user_choice}
      
      #{result}
    """
  end
  
  def decide_winner(choice, hand) when choice === 0 do
    IO.puts "Choose a valid option"
    game(hand)
  end

  def get_winner_card(hand) do
    winner_index = Range.new(0, length(hand) - 1) |> Enum.random
    Enum.at(hand, winner_index)
  end

  def format_hand(hand) do
    hand
      |> Enum.with_index
      |> Enum.map(fn {card, i} -> "#{i+1} - #{card.name} \n" end)
      |> Enum.join
  end

  def formated_title(hand) do
    """
    Choose one card:
    #{format_hand(hand)}
    """
  end
end
