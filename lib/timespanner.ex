defmodule TimeSpanner do
  def from_minutes(m) do
    "#{m} " <> if (m != 1), do: "minutes", else: "minute"
  end
end
