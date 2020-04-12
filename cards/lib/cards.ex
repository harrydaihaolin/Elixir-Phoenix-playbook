defmodule Cards do
  @moduledoc """
  Documentation for `Cards`.
  """

  @doc """
  Create Cards
  """
  def create_cards do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]


    # automatically finds combinations of those
    cards = for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end

    List.flatten(cards)
  end

  @doc """
  Shuffle Cards
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  Check if the deck contains the card
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Deal cards
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
      {:ok, binary} ->
          :erlang.binary_to_term binary
      {:error, _reason} ->
          "That file does not exist."
    end
  end

  @doc """
    Noticed that pipe operator only cares about the first argument
  """
  def create_hand(hand_size) do
    Cards.create_cards
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
