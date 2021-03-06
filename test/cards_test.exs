defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck makes 20 cards" do
    assert Cards.create_deck |> length == 24
  end

  test "shuffle should randomize a deck" do
    refute Cards.create_deck == Cards.create_deck |> Cards.shuffle
  end
end
