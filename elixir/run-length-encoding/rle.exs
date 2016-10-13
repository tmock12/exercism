defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    string
    |> String.graphemes
    |> Enum.chunk_by(&(&1))
    |> Enum.map_join(fn(chunk) -> "#{length(chunk)}#{List.first(chunk)}" end)
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    string
    |> String.split(~r{()[A-Z]()}, on: [1,2], trim: true)
    |> Enum.chunk(2)
    |> Enum.map_join(fn([count, code]) ->
      String.duplicate(code, String.to_integer(count))
    end)
  end
end
