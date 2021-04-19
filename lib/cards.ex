defmodule Cards do
  @moduledoc """
    Provides functions for creating and handling a deck of cards
  """

  @doc """
    Returns a list of strings representing a deck of cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end

    ## Code below produces the same result
    # for suit <- suits do
    #   for value <- values do
    #     "#{value} of #{suit}"
    #   end
    # end
    # |> List.flatten
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Determines whether a deck contains a given card

## Examples

      iex> Cards.create_deck |> Cards.contains?("Ace of Spades")
      true

      iex> Cards.create_deck |> Cards.contains?("Seven of Spades")
      false
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Divides a deck into a hand and the remainder of the deck. The `hand_size` argument indicates how many cards should be in the hand.

## Examples

      iex> Cards.create_deck |> Cards.deal(1) |> elem(0)
      ["Ace of Spades"]
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _} -> "That file does not exist"
    end
  end

  def create_hand(hand_size) do
    create_deck()
    |> shuffle()
    |> deal(hand_size)
  end
end
