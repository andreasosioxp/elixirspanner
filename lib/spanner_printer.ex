defmodule SpannerPrinter do

  def pieces_to_string(pieces) do
    pieces
      |> Enum.map(&(piece_to_string(&1)))
      |> remove_empty
      |> add_and_conjuction
      |> join_pieces 
      |> zero_minutes_if_empty
  end

  defp piece_to_string({unit_key, value}) do
    unit_name = Atom.to_string(unit_key)
    case value do
      0 -> ""
      1 -> "1 #{unit_name}"
      v -> "#{v} #{unit_name}s"
    end
  end

  defp remove_empty(list), do: Enum.filter(list, &(&1 != "" ))

  defp add_and_conjuction(pieces) when length(pieces) < 2, do: pieces
  defp add_and_conjuction(pieces) do
    pieces |> List.replace_at(-1, "and " <> List.last(pieces))
  end

  defp join_pieces(pieces) when length(pieces) == 2, do: Enum.join(pieces, " ")
  defp join_pieces(pieces), do: Enum.join(pieces, ", ")

  defp zero_minutes_if_empty(""), do: "0 minutes"
  defp zero_minutes_if_empty(string), do: string

end
