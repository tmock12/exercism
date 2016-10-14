defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t) :: non_neg_integer
  def score(word) do
    word
    |> String.trim
    |> String.upcase
    |> String.codepoints
    |> Enum.map(&(word_score(&1)))
    |> Enum.sum
  end

  def word_score(""), do: 0
  def word_score(letter) when letter in ~w(A E I O U L N R S T), do: 1
  def word_score(letter) when letter in ~w(D G), do: 2
  def word_score(letter) when letter in ~w(B C M P), do: 3
  def word_score(letter) when letter in ~w(F H V W Y), do: 4
  def word_score("K"), do: 5
  def word_score(letter) when letter in ~w(J X), do: 8
  def word_score(letter) when letter in ~w(Q Z), do: 10
end
