defmodule TimeSpanner do
  def from_minutes(m) do
    result = ""
    remaining = m

    hours = round(m/60)

    result = if (hours > 1), do: result <> "#{hours} hours", else: result
    result = if (hours == 1), do: result <> "#{hours} hour", else: result

    remaining = rem(remaining, 60)
    result = if (hours > 0 && remaining > 0), do: result <> " ", else: result
  
    if(remaining>0 || result=="") do
      result = result <> "#{remaining} " <> if (remaining != 1), do: "minutes", else: "minute"
    end

    result
  end
end
