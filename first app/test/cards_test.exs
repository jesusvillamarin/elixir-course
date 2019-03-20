defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "it should return an array length 20" do
    assert length(Cards.createDeck()) == 20
  end

  test "it should shuffle a deck" do
      deck = Cards.createDeck();
      refute deck == Cards.shuffle(deck);
  end

  test "it should find a card in a deck" do
    deck = Cards.createDeck();
    assert Cards.exist?("Ace of Spades", deck);
  end

  test "it should create, deal and save a deck on system" do
    result = Cards.usingPipeOperator(3);
    assert :ok === result
  end
end
