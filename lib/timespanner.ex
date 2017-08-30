defmodule TimeSpanner do
  def from_minutes(m) do
    days = round(m/(60*24))
    hours = round((m-(days*60*24))/60)
    minutes = rem(m, 60)
    
    to_string(days, hours, minutes)
  end


  defp to_string(days, hours, minutes) do
    [
      days_to_string(days),
      hours_to_string(hours),
      minutes_to_string(minutes)
    ] |> Enum.filter(&(&1 != "" ))
      |> Enum.join(" ")
      |> if_empty("0 minutes")

  end

  defp if_empty(string, default), do:
    if string != "", do: string, else: default

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

end
