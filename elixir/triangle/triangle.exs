defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: { :ok, kind } | { :error, String.t }

  def kind(a, b, c) when a <= 0 or b <= 0 or c <= 0  do
    { :error, "all side lengths must be positive" }
  end

  def kind(a, b, c) do
    if meets_triangle_inequality?(a, b, c) do
      triangle_type(a, b, c)
    else
      { :error, "side lengths violate triangle inequality" }
    end
  end

  def meets_triangle_inequality?(a, b, c) do
    [short_1, short_2, long] = Enum.sort([a, b, c])
    short_1 + short_2 > long
  end

  def triangle_type(a, a, a), do: { :ok, :equilateral }
  def triangle_type(a, a, _b), do: { :ok, :isosceles }
  def triangle_type(_a, b, b), do: { :ok, :isosceles }
  def triangle_type(a, _b, a), do: { :ok, :isosceles }
  def triangle_type(_a, _b, _c), do: { :ok, :scalene }
end
