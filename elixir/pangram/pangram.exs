defmodule Pangram do
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """

  @spec pangram?(String.t) :: boolean
  def pangram?(sentence) do
    charlist = sentence |> String.downcase |> String.to_charlist

    contains?(?a..?z, charlist)
  end

  def contains?(first..last, _) when first == last, do: true

  def contains?(first..last, charlist) do
    if charlist_contains?(first, charlist) do
      contains?(1 + first..last, charlist)
    end
  end

  def charlist_contains?(character, [character | _tail ]), do: true
  def charlist_contains?(character, [_ | tail]), do: charlist_contains?(character, tail)
  def charlist_contains?(_, []), do: false
end
