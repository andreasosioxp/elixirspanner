defmodule SpannerPrinter do

  def pieces_to_string(pieces) do
    pieces
      |> Enum.map(&(piece_to_string(&1)))
      |> remove_empty
      |> Enum.join(" ")
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
  defp zero_minutes_if_empty(""), do: "0 minutes"
  defp zero_minutes_if_empty(string), do: string

end
