defmodule TimeSpannerTest do
  use ExUnit.Case

  test "works for a single minute" do
    assert TimeSpanner.from_minutes(1) == "1 minute"
  end

  test "works for some minutes" do
    assert TimeSpanner.from_minutes(2) == "2 minutes"
    assert TimeSpanner.from_minutes(5) == "5 minutes"
    assert TimeSpanner.from_minutes(13) == "13 minutes"
  end

  test "works for 0 minutes" do
    assert TimeSpanner.from_minutes(0) == "0 minutes"
  end

end
