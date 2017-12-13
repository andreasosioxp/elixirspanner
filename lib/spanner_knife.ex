defmodule SpannerKnife do

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

end
