defmodule SpannerPrinter do

  def pieces_to_string(pieces) do
    pieces
      |> Enum.map(&piece_to_string/1)
      |> remove_empty
      |> add_comma_conjuctions
      |> add_and_conjuction
      |> Enum.join(" ")
      |> zero_minutes_if_empty
  end

  defp piece_to_string({unit_key, value}) do
    case value do
      0 -> ""
      1 -> "1 #{unit_key}"
      v -> "#{v} #{unit_key}s"
    end
  end

  defp remove_empty(list), do: Enum.filter(list, &(&1 != "" ))

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
