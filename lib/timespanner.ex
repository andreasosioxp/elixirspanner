defmodule TimeSpanner do

  def from_minutes(minutes) do
    minutes
      |> minutes_to_pieces
      |> pieces_to_string
  end
  
  def minutes_to_pieces(minutes) do
    units = [
      week: 7*24*60,
      day: 24*60,
      hour: 60,
      minute: 1
    ]

    minutes_to_pieces(minutes, units, [])
  end

  defp minutes_to_pieces(remaining, [unit|tail], result) do
    {unit_key, in_minutes} = unit

    in_unit = trunc(remaining/in_minutes)
    remaining = remaining-(in_unit*in_minutes)

    result = result ++ [{unit_key, in_unit}]
    minutes_to_pieces(remaining, tail, result)
  end

  defp minutes_to_pieces(0, [], result), do: result

  defp pieces_to_string(pieces) do
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
