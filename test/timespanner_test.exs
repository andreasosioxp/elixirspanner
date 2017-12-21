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

  test "works for 61 minutes" do
    assert TimeSpanner.from_minutes(61) == "1 hour and 1 minute"
  end

  test "works for 70 minutes" do
    assert TimeSpanner.from_minutes(70) == "1 hour and 10 minutes"
  end

  test "works with multiple hours and minutes" do
    assert TimeSpanner.from_minutes(122) == "2 hours and 2 minutes"
  end

  test "works for 120 minutes" do
    assert TimeSpanner.from_minutes(120) == "2 hours"
  end

  test "works for 60 minutes" do
    assert TimeSpanner.from_minutes(60) == "1 hour"
  end

  test "works for 1 day" do
    assert TimeSpanner.from_minutes(24*60) == "1 day"
  end

  test "works for 1 day and some hours" do
    assert TimeSpanner.from_minutes(24*60 + 60*2) == "1 day and 2 hours"
  end

  test "works for some days and some minutes" do
    assert TimeSpanner.from_minutes((24*60)*2 + 5) == "2 days and 5 minutes"
  end

  test "works for some days, some hours and some minutes" do
    assert TimeSpanner.from_minutes(24*60 + 60*2 + 14) == "1 day, 2 hours, and 14 minutes"
  end

  test "works for 1 week" do
    assert TimeSpanner.from_minutes(7*24*60) == "1 week"
  end

  test "works some weeks, some days and some minutes" do
    assert TimeSpanner.from_minutes(7*24*60 + 4*24*60 + 18) == "1 week, 4 days, and 18 minutes"
  end

end
