defmodule SpannerKnifeTest do
  use ExUnit.Case

  describe "minutes_to_pieces" do 

    test "returns empty pieces with 0 minutes" do
      assert SpannerKnife.minutes_to_pieces(0) == [week: 0, day: 0, hour: 0, minute: 0]
    end

    test "works when every pieces is set as 1" do
      assert SpannerKnife.minutes_to_pieces((7*24*60) + (24*60) + (60) + (1)) == [week: 1, day: 1, hour: 1, minute: 1]
    end

    test "works when some pieces is greater than 1" do
      assert SpannerKnife.minutes_to_pieces((1*7*24*60) + (3*24*60) + (5*60) + (1)) == [week: 1, day: 3, hour: 5, minute: 1]
    end

    test "set properly empty pieces" do
      assert SpannerKnife.minutes_to_pieces(24*60 + 60*2 + 14)             == [week: 0, day: 1, hour: 2, minute: 14]
      assert SpannerKnife.minutes_to_pieces(7*24*60)                       == [week: 1, day: 0, hour: 0, minute: 0]
      assert SpannerKnife.minutes_to_pieces(7*24*60 + 2*60 + 6)            == [week: 1, day: 0, hour: 2, minute: 6]
      assert SpannerKnife.minutes_to_pieces((7*24*60) + (4*24*60) + (18))  == [week: 1, day: 4, hour: 0, minute: 18]
    end
    
  end

end
