defmodule SpannerPrinter do

  def pieces_to_string(pieces) do
    pieces
      |> remove_empty
      |> map_to_string
      |> add_and_conjuction
      |> join
      |> handle_zero_minutes
  end

  defp remove_empty(pieces), do: Enum.filter(pieces, fn({_, value}) -> value != 0 end)
  defp map_to_string(pieces), do: Enum.map(pieces, &piece_to_string/1)

  defp piece_to_string({unit_key, 1}), do: "1 #{unit_key}"
  defp piece_to_string({unit_key, value}), do: "#{value} #{unit_key}s"

  defp add_and_conjuction(pieces) when length(pieces) < 2, do: pieces
  defp add_and_conjuction(pieces) do
    pieces |> List.replace_at(-1, "and " <> List.last(pieces))
  end

  defp join(pieces) when length(pieces) < 3, do: Enum.join(pieces, " ")
  defp join(pieces), do: Enum.join(pieces, ", ")

  defp handle_zero_minutes(""), do: "0 minutes"
  defp handle_zero_minutes(string), do: string

end
