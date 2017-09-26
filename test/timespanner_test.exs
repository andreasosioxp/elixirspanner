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
    assert TimeSpanner.from_minutes(61) == "1 hour 1 minute"
  end

  test "works for 70 minutes" do
    assert TimeSpanner.from_minutes(70) == "1 hour 10 minutes"
  end

  test "works with multiple hours and minutes" do
    assert TimeSpanner.from_minutes(122) == "2 hours 2 minutes"
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
    assert TimeSpanner.from_minutes(24*60 + 60*2) == "1 day 2 hours"
  end

  test "works for some days and some minutes" do
    assert TimeSpanner.from_minutes((24*60)*2 + 5) == "2 days 5 minutes"
  end

  test "works for some days, some hours and some minutes" do
    assert TimeSpanner.from_minutes(24*60 + 60*2 + 14) == "1 day 2 hours 14 minutes"
  end

  test "works for 1 week" do
    assert TimeSpanner.from_minutes(7*24*60) == "1 week"
  end

  @tag :skip
  test "works some weeks, some days and some minutes" do
    assert TimeSpanner.from_minutes(7*24*60 + 4*24*60 + 18) == "1 week 4 days 18 minutes"
  end

  test "minutes_to_pieces works properly" do
    assert TimeSpanner.minutes_to_pieces(24*60 + 60*2 + 14) == [weeks: 0, days: 1, hours: 2, minutes: 14]
    assert TimeSpanner.minutes_to_pieces(7*24*60) == [weeks: 1, days: 0, hours: 0, minutes: 0]
    assert TimeSpanner.minutes_to_pieces(7*24*60 + 2*60 + 6) == [weeks: 1, days: 0, hours: 2, minutes: 6]
    #assert TimeSpanner.minutes_to_pieces((7*24*60) + (4*24*60) + (18)) == [weeks: 1, days: 4, hours: 0, minutes: 18]
  end
end
