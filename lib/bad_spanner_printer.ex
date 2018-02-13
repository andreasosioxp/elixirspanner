defmodule SpannerPrinter do

  def pieces_to_string(pieces) do
    zero_excluded = Enum.filter(pieces, fn({_, value}) -> value != 0 end)
    pieces = Enum.map(zero_excluded, fn(p) -> piece_to_string(p) end)
    if length(pieces) >= 2 do
      pieces = List.replace_at(pieces, -1, "and " <> List.last(pieces))
    end
    if length(pieces) > 2 do
      result = Enum.join(pieces, ", ")
    else
      result = Enum.join(pieces, " ")
    end
    if result == "" do
      result = "0 minutes"
    end
    result
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

end
