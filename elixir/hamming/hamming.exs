defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(strand1, strand2) when length(strand1) == length(strand2) do
    {:ok, distance(strand1, strand2)}
  end

  def hamming_distance(_, _) do
    {:error, "Lists must be the same length"}
  end

  def distance([nucleotide_1 | strand1], [nucleotide_2 | strand2]) do
    nucleotide_compare(nucleotide_1, nucleotide_2) + distance(strand1, strand2)
  end

  def distance([], []) do
    0
  end

  def nucleotide_compare(nucleotide, nucleotide), do: 0
  def nucleotide_compare(_nucleotide_1, _nucleotide_2), do: 1
end
