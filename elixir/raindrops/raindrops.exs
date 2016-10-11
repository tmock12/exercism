defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    [3, 5, 7]
    |> Enum.map_join(&(factor_reaction(number, &1)))
    |> factored_string(number)
  end

  def factor_reaction(number, divider) do
    case {divider, rem(number, divider)} do
      {3, 0} -> "Pling"
      {5, 0} -> "Plang"
      {7, 0} -> "Plong"
      _ -> nil
    end
  end

  def factored_string("", number) do
    Integer.to_string(number)
  end

  def factored_string(string, _number) do
    string
  end
end
