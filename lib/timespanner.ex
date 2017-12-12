defmodule TimeSpanner do

  def from_minutes(m) do
    minutes_to_pieces(m) |> to_str
  end
  
  def minutes_to_pieces(minutes) do
    units = [
      weeks: 7*24*60,
      days: 24*60,
      hours: 60,
      minutes: 1
    ]

    minutes_to_pieces(minutes, units, [])
  end


  defp minutes_to_pieces(minutes, [unit|tail], result) do
    key = elem(unit, 0) 
    in_minutes = elem(unit, 1) 

    in_unit = trunc(minutes/in_minutes)
    minutes = minutes-(in_unit*in_minutes)

    result = result ++ [{key, in_unit}]
    minutes_to_pieces(minutes, tail, result)
  end

  defp minutes_to_pieces(0, [], result), do: result

  defp to_str([weeks: weeks, days: days, hours: hours, minutes: minutes]) do
    pieces = [
      weeks_to_string(weeks),
      days_to_string(days),
      hours_to_string(hours),
      minutes_to_string(minutes)
    ]
    
    pieces
      |> keep_not_empty
      |> Enum.join(" ")
      |> to_str
  end

  defp to_str(""), do: "0 minutes"
  defp to_str(string), do: string

  defp weeks_to_string(weeks), do:
    timeunit_tostring(weeks, "week", "weeks")

  defp days_to_string(days), do:
    timeunit_tostring(days, "day", "days")

  defp hours_to_string(hours), do:
    timeunit_tostring(hours, "hour", "hours")
  
  defp minutes_to_string(minutes), do:
    timeunit_tostring(minutes, "minute", "minutes")

  defp timeunit_tostring(n, singular, plural) do
    case n do
      0 -> ""
      1 -> "#{n} #{singular}"
      n -> "#{n} #{plural}"
    end
  end

  defp keep_not_empty(list), do:
    Enum.filter(list, &(&1 != "" ))

end
