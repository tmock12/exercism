defmodule Teenager do
  def hey(input) do
    cond do
      shouting?(input) -> "Whoa, chill out!"
      question?(input) -> "Sure."
      input |> String.strip |> silent? -> "Fine. Be that way!"
      true ->  "Whatever."
    end
  end

  defp silent?(""), do: true
  defp silent?(_), do: false

  defp shouting?(input) do
    String.upcase(input) == input &&
    String.downcase(input) != input
  end

  defp question?(input) do
    String.ends_with?(input, "?")
  end
end
