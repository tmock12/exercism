defmodule Minesweeper do

  @doc """
  Annotate empty spots next to mines with the number of mines next to them.
  """
  @spec annotate([String.t]) :: [String.t]

  def annotate([]), do: []
  def annotate([first_row | board]) do
    mine_map = minecount([first_row | board])

    mine_map
    |> Enum.map_join(&score_it(&1, mine_map))
    |> String.replace("0", " ")
    |> String.split(~r/().{#{String.length(first_row)}}/, on: [1])
  end

  def score_it({"*", _, _}, _), do: "*"
  def score_it({_, row, column}, mine_map) do
    for x <- -1..1, y <- -1..1 do
      minescore(row + x, column + y, mine_map)
    end
    |> Enum.sum
  end

  def minescore(x, y, mine_map) do
    if Enum.any?(mine_map, &(&1 == {"*", x, y})), do: 1, else: 0
  end

  def minecount(board) do
    for {row, x} <- Enum.with_index(board),
    {key, y} <- Enum.with_index(String.codepoints(row)) do
      {key, x, y}
    end
  end
end
