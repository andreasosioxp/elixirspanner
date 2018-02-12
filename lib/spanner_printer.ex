defmodule SpannerPrinter do

  def pieces_to_string(pieces) do
    pieces_strings = Enum.map(pieces, fn(p) -> piece_to_string(p) end)
    pieces_strings = Enum.filter(pieces_strings, fn(v) -> v != "" end)
    pieces_strings = add_comma_conjuctions(pieces_strings)
    pieces_strings = add_and_conjuction(pieces_strings)
    result = Enum.join(pieces_strings, " ")

    if(result == "") do
      "0 minutes"
    else
      result
    end
  end

  defp piece_to_string(piece) do
    unit_name = elem(piece, 0)
    value = elem(piece, 1)

    case value do
      0 -> ""
      1 -> "1 #{unit_name}"
      v -> "#{v} #{unit_name}s"
    end
  end

  defp add_comma_conjuctions(pieces) do
    if length(pieces) >= 3 do
      [last | rest] = Enum.reverse(pieces) 
      rest = Enum.map(rest, fn p -> (p <> ",") end)
      Enum.reverse([last | rest])
    else
      pieces
    end
  end

  defp add_and_conjuction(pieces) do
    if length(pieces) >= 2 do
      pieces |> List.replace_at(-1, "and " <> List.last(pieces))
    else
      pieces
    end
  end


end
