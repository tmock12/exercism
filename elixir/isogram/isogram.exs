defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t) :: boolean
  def isogram?(sentence) do
    codepoints = sentence
                 |> String.replace(~r{(-| |)}, "")
                 |> String.codepoints
    length(codepoints) === length(Enum.uniq(codepoints))
  end

end
