defmodule TimeSpanner do
  def from_minutes(m) do
    days = round(m/(60*24))
    hours = round((m-(days*60*24))/60)
    minutes = rem(m, 60)
    
    to_string(days, hours, minutes)
  end


  defp to_string(days, hours, minutes) do
    result = concatenate([
      days_to_string(days),
      hours_to_string(hours),
      minutes_to_string(minutes)
    ])

    if result != "", do: result, else: "0 minutes"
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
  
  defp minutes_to_string(minutes) do
    case minutes do
      0 -> ""
      1 -> "1 minute"
      n -> "#{n} minutes"
    end
  end
end
