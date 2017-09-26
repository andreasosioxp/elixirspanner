defmodule TimeSpanner do

  def from_minutes(m) do
    minutes_to_pieces(m) |> to_str
  end
  
  def minutes_to_pieces(m) do
    days = round(m/(24*60))
    m = m-(days*24*60)

    hours = round(m/60)
    minutes = rem(m, 60)

    [days: days, hours: hours, minutes: minutes]
  end

  defp to_str([days: days, hours: hours, minutes: minutes]) do
    pieces = [
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
