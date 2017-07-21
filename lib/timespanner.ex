defmodule TimeSpanner do
  def from_minutes(m) do
    result = ""
    remaining = m

    result = if (m >= 60), do: result <> "1 hour", else: result
    result = if (m > 60), do: result <> " ", else: result

    remaining = rem(remaining, 60)
  
    if(remaining>0 || result=="") do
      result = result <> "#{remaining} " <> if (remaining != 1), do: "minutes", else: "minute"
    end

    result
  end
end
