defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    cycle_factors(limit, factors, [])
    |> List.flatten
    |> Enum.uniq
    |> Enum.sum
  end

  def cycle_factors(limit, [h|t], factor_list) do
    [find_factors(Enum.to_list(1..(limit - 1)), h, factor_list) | cycle_factors(limit, t, factor_list)]
  end

  def cycle_factors(_limit, [], factor_list) do
    factor_list
  end

  def find_factors([h | t], factor, factor_list) when rem(h, factor) == 0 do
    find_factors(t, factor, [h | factor_list])
  end

  def find_factors([_ | t], factor, factor_list) do
    find_factors(t, factor, factor_list)
  end

  def find_factors([], _factor, factor_list) do
    factor_list
  end
end
