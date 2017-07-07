defmodule TimeSpannerTest do
  use ExUnit.Case

  test "works for a single minute" do
    assert TimeSpanner.from_minutes(1) == "1 minute"
  end

  test "works for some minutes" do
    assert TimeSpanner.from_minutes(2) == "2 minutes"
  end
end
