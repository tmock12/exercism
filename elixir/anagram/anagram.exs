defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    base
    |> String.downcase
    |> String.codepoints
    |> find_matches(candidates)
  end

  def find_matches(base_list, [candidate | candidates]) do
    candidate_list = candidate
                     |> String.downcase
                     |> String.codepoints

    case candidate_matches?(base_list, candidate_list) do
      true -> [candidate | find_matches(base_list, candidates)]
      false ->  find_matches(base_list, candidates)
    end
  end

  def find_matches(_, []) do
    []
  end

  def candidate_matches?(base_list, base_list) do
    false
  end

  def candidate_matches?(base_list, candidate_list) do
    list_match?(base_list -- candidate_list, candidate_list -- base_list)
  end

  def list_match?([], []), do: true
  def list_match?(_, _), do: false
end
