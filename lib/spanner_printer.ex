defmodule SpannerPrinter do

  def pieces_to_string(pieces) do
    pieces
      |> remove_empty
      |> Enum.map(&piece_to_string/1)
      |> add_and_conjuction
      |> join_pieces
      |> zero_minutes_if_empty
  end

  defp remove_empty(list), do: Enum.filter(list, fn({_, value}) -> value != 0 end)

  defp piece_to_string({unit_key, 1}), do: "1 #{unit_key}"
  defp piece_to_string({unit_key, value}), do: "#{value} #{unit_key}s"

  defp add_and_conjuction(pieces) when length(pieces) < 2, do: pieces
  defp add_and_conjuction(pieces) do
    pieces |> List.replace_at(-1, "and " <> List.last(pieces))
  end

  defp join_pieces(pieces) when length(pieces) < 3, do: Enum.join(pieces, " ")
  defp join_pieces(pieces), do: Enum.join(pieces, ", ")

  defp zero_minutes_if_empty(""), do: "0 minutes"
  defp zero_minutes_if_empty(string), do: string

end
