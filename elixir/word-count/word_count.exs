defmodule Words do
  @delete_characters ~r{!|\$|%|&|:|@|\^|,}
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    sentence
    |> String.downcase
    |> String.replace("_", " ")
    |> String.replace(@delete_characters, " ")
    |> String.split
    |> reduce_it
  end

  defp reduce_it(sentence) do
    Enum.reduce(sentence, %{}, &add_count/2)
  end

  defp add_count(word, counts) do
    Dict.update(counts, word, 1, &(&1 + 1))
  end

end
