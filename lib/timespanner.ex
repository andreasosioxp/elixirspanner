defmodule TimeSpanner do
  def from_minutes(m) do
    hours = round(m/60)
    minutes = rem(m, 60)
    
    to_string(hours, minutes)
  end

  defp to_string(hours, minutes) do
    result = ""
    result = result <> hours_to_string(hours)
    result = if (hours > 0 && minutes > 0), do: result <> " ", else: result
    result = result <> minutes_to_string(minutes)
    if (result == ""), do: "0 minutes", else: result
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
