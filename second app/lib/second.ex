defmodule Second do

    @doc """
        This create a new Map with the following values

    ## Example 

        iex> map = Second.createMap()
        iex> map 
        %{name: "Jesus Auriol", first_surname: "Villamarin", second_surname: "Ortiz" }

    """

    def createMap do
        fullName = %{name: "Jesus Auriol", first_surname: "Villamarin", second_surname: "Ortiz" }
    end


    @doc """
        Return a new map with any key updated

    ## Example
        
        iex> map_created = Second.createMap()
        %{name: "Jesus Auriol", first_surname: "Villamarin", second_surname: "Ortiz"}
        iex> map_updated = Second.updateMap(map_created, :name, "Humberto")
        iex> map_updated 
        %{name: "Humberto", first_surname: "Villamarin", second_surname: "Ortiz"}

    ## Other alternative is:

        iex> map = Second.createMap();
        %{name: "Jesus Auriol", first_surname: "Villamarin", second_surname: "Ortiz"}
        iex> map_updated = %{map | name: "Humberto Jesus"}
        iex> map_updated
        %{name: "Humberto Jesus", first_surname: "Villamarin", second_surname: "Ortiz"}

    ## And this will failed, because not exist this property

        iex> map = Second.createMap()
        %{name: "Jesus Auriol", first_surname: "Villamarin", second_surname: "Ortiz"}
        iex> %{map | age: 22 }
        iex> map 
        %{name: "Jesus Auriol", first_surname: "Villamarin", second_surname: "Ortiz"}
        
        ## To add a property to a map, we need use the same method, but pass the new property
        
        iex> map = Second.createMap()
        %{name: "Jesus Auriol", first_surname: "Villamarin", second_surname: "Ortiz"}
        iex> map = Second.updateMap(map, :age, 20)
        %{name: "Jesus Auriol", first_surname: "Villamarin", second_surname: "Ortiz", age: 20}
    

    """

    def updateMap(map, key, value) do
        Map.put(map,key, value)
    end

    def createTupla() do
        [
            {:blue, "blue", :red , "Red"},
            {:green ,"Green"}
        ]
    end


end

