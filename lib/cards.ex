defmodule Cards do

    @moduledoc """
        Provides methods to create, shuffle a deck and also deal a hand
    """

    @doc """
        Method that create a deck with two loop for and return an list flatten
        because the two loop for return a array of array's 
        therefore need use List.flatten method.
    """
    def createDeck() do
        values = ["Ace", "Two","Three", "Four", "Five"];
        suits = ["Spades", "Clubs", "Hearts", "Diamonds"]; 

        deck = for value <- values do
            for suit <- suits do
                "#{value} of #{suit}"
            end
        end
        
        List.flatten(deck);
    end

    @doc """
        Method that create a deck with two compressions and return a array flatten without List.flatten.

    """

    def createDeckSecondMethod() do
        values = ["Ace", "Two","Three", "Four", "Five"];
        suits = ["Spades", "Clubs", "Hearts", "Diamonds"]; 

        for suit <- suits, value <- values do
            "#{value} of #{suit}"
        end
    end

    @doc """
        Return a shuffle deck, this use the Module Enum.
    """

    def shuffle(deck) do
        Enum.shuffle(deck);
    end

    @doc """
        Verify is a card exist on the deck, using String.contains?
    """
    def exist?(card \\ "Ace") do
        String.contains?(card, createDeck);
    end

    @doc """
        Verify is a card exist on the deck, using  Enum.member
    """

    # Otra forma de hacerlo sería...
    def exist?(card, deck) do
        Enum.member?(deck, card);
    end
    
    @doc """
        Cut a deck and return a array with the size according to the pass arguments
    """
    def deal(deck, hand_size) do
        {hand, _deck_rest} = Enum.split(deck, hand_size);
        hand;
    end

    @doc """
        Testing method --- return all variables enclosed in curly braces
    """
    # How set value of an array to each variable
    def getColors(_color \\ "red") do
        [red, blue, green, pink] = ["Red", "Blue","Green", "Pink"];
        # How return an object with all variables
        { red, blue, green, pink }
    end

    @doc """
        Save deck on system, convert to binary and later write file on the system
    """

    def saveDeck(deck, filename \\ "file") do
        binaryDeck = :erlang.term_to_binary(deck) #Convert to binary
        File.write(filename, binaryDeck); #Save file on system
    end

    @doc """
        Load a file of system, convert binary to string and return 
        First method.
    """

    def loadDeckFromSystem(filename) do
        {_status, binary} = File.read(filename);
        deck = :erlang.binary_to_term(binary);
        deck;
    end

    @doc """
        Load a file of system, convert binary to string and return 
        Second method --- Better Method.
    """

    def loadDeckBetterMethod(filename) do
        {status, binary} = File.read(filename);
        case status do
            :ok -> :erlang.binary_to_term(binary);
            :error -> "This file don't exist";
        end
    end
    @doc """
        Load a file of system, convert binary to string and return 
        Third method --- MOST BETTER
    """

    def loadDeckMostBetter(filename) do
        case File.read(filename) do
            {:ok, binary} -> :erlang.binary_to_term(binary);
            {:error, _reason } -> "This file don't exist"
        end
    end

    @doc """
        Create a deck, deal this and save on system in a line using pipe operator.

    ## Instead of do 
        
        iex> hand_size = 5
        iex> deck = Cards.createDeck();
        iex> deck = Cards.deal(deck, hand_size);
        iex> deck = Cards.saveDeck(deck, "filename");
        iex> deck 
        :ok

    ## This method do:
        iex> hand_size = 5
        iex> deck = Cards.createDeck() |> Cards.deal(hand_size) |> Cards.saveDeck("filename")
        iex> deck
        :ok
    """

    #Con el operador pipe, el resultado que devuelva la primera función
    #Se le asignara a la función que le sigue como primer argumento
    def usingPipeOperator(hand_size) do
        createDeck |> deal(hand_size) |> saveDeck("mydeck")
    end

    # Función que asigna valor por default cuando no se pasa ningun argumento
    # def changeName (lastName \\ "CHUY") do
    #     fullName = "JESUS AURIOL";
    #     fullName = lastName;
    #     fullName;
    # end
    
end
