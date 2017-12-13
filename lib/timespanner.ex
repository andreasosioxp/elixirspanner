defmodule TimeSpanner do

  def from_minutes(minutes) do
    minutes
      |> SpannerKnife.minutes_to_pieces
      |> SpannerPrinter.pieces_to_string
  end

end
