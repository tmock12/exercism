defmodule Prime do

  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(0), do: raise ArgumentError
  def nth(count) do
    find_prime(count, 2, [])
  end

  def find_prime(count, _iteration, found_primes) when length(found_primes) == count do
    List.first(found_primes)
  end

  def find_prime(count, iteration, found_primes) do
    case is_prime?(iteration, found_primes) do
      true -> find_prime(count, iteration + 1, [iteration | found_primes] )
      false -> find_prime(count, iteration + 1, found_primes )
    end
  end

  def is_prime?(number, found_primes) do
    found_primes
    |> Enum.all?(&(rem(number, &1) !== 0))
  end
end
