defmodule TimeSpanner do

  def from_minutes(m) do
    days = round(m/(60*24))
    hours = round((m-(days*60*24))/60)
    minutes = rem(m, 60)
    
    to_str(days, hours, minutes)
  end

  defp to_str(days, hours, minutes) do
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
