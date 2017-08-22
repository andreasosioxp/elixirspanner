defmodule TimeSpanner do
  def from_minutes(m) do
    days = round(m/(60*24))
    hours = round((m-(days*60*24))/60)
    minutes = rem(m, 60)
    
    to_string(days, hours, minutes)
  end

  def concatenate(strings) do 
    Enum.reduce(strings, fn(x, acc) -> 
      if(x != "" && acc != "") do
        acc <> " " <> x
      else
        acc <> x
      end
    end)
  end

  defp to_string(days, hours, minutes) do
    only_minutes = hours < 1 and days < 1
    minutes_as_string = minutes_to_string(minutes, only_minutes)
    hours_as_string = hours_to_string(hours)
    days_as_string = days_to_string(days)
    concatenate([days_as_string, hours_as_string, minutes_as_string])
  end

  defp days_to_string(days) do
    case days do
      0 -> ""
      1 -> "1 day"
      n -> "#{n} days"
    end
  end

  defp hours_to_string(hours) do
    case hours do
      0 -> ""
      1 -> "1 hour"
      n -> "#{n} hours"
    end
  end
  
  defp minutes_to_string(minutes, only_minutes) do
    case minutes do
      0 -> if (only_minutes), do: "0 minutes", else: ""
      1 -> "1 minute"
      n -> "#{n} minutes"
    end
  end
end
