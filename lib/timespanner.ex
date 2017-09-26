defmodule TimeSpanner do

  def from_minutes(m) do
    minutes_to_pieces(m) |> to_str
  end
  
  def minutes_to_pieces(m) do
    weeks = round(m/(7*24*60))
    m = m-(weeks*7*24*60)

    days = round(m/(24*60))
    m = m-(days*24*60)

    hours = round(m/60)
    minutes = rem(m, 60)

    [weeks: weeks, days: days, hours: hours, minutes: minutes]
  end

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

  defp to_str(""), do: "0 minutes"
  defp to_str(string), do: string

end
