defmodule SpannerPrinter do

  def pieces_to_string(pieces) do
    pieces
      |> remove_empty
      |> Enum.map(&piece_to_string/1)
      |> add_comma_conjuctions
      |> add_and_conjuction
      |> Enum.join(" ")
      |> zero_minutes_if_empty
  end

  defp remove_empty(list), do: Enum.filter(list, fn({_, value}) -> value != 0 end)

  defp piece_to_string({_, 0}), do: ""
  defp piece_to_string({unit_key, 1}), do: "1 #{unit_key}"
  defp piece_to_string({unit_key, value}), do: "#{value} #{unit_key}s"

  defp add_comma_conjuctions(pieces) when length(pieces) < 3, do: pieces
  defp add_comma_conjuctions(pieces) do
    [last | rest] = Enum.reverse(pieces) 
    rest = Enum.map(rest, fn p -> (p <> ",") end)
    Enum.reverse([last | rest])
  end

  defp add_and_conjuction(pieces) when length(pieces) < 2, do: pieces
  defp add_and_conjuction(pieces) do
    pieces |> List.replace_at(-1, "and " <> List.last(pieces))
  end

  defp zero_minutes_if_empty(""), do: "0 minutes"
  defp zero_minutes_if_empty(string), do: string

end
