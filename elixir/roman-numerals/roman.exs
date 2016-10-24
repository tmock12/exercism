defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t
  def numerals(number) when number <= 3, do: String.duplicate("I", number)
  def numerals(4), do: "IV"
  def numerals(9), do: "IX"

  def numerals(number) when number in (5..8) do
    String.duplicate("V", div(number, 5)) <> numerals(rem(number, 5))
  end

  def numerals(number) when number in (10..39) do
    String.duplicate("X", div(number, 10)) <> numerals(rem(number, 10))
  end

  def numerals(number) when number in (40..49) do
    "XL" <> numerals(rem(number, 10))
  end

  def numerals(number) when number in (50..89) do
    "L" <> numerals(rem(number, 50))
  end

  def numerals(number) when number in (90..99) do
    "XC" <> numerals(rem(number, 90))
  end

  def numerals(number) when number in (100..399) do
    String.duplicate("C", div(number, 100)) <> numerals(rem(number, 100))
  end

  def numerals(number) when number in (400..499) do
    "CD" <> numerals(rem(number, 400))
  end

  def numerals(number) when number in (500..899) do
    "D" <> numerals(rem(number, 500))
  end

  def numerals(number) when number in (900..999) do
    "CM" <> numerals(rem(number, 900))
  end

  def numerals(number) when number >= 1000 do
    String.duplicate("M", div(number, 1000)) <> numerals(rem(number, 1000))
  end
end
