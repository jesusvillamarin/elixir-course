defmodule Identicon do
  def main(input) do
    input
    |> convertToHash
    |> pickColor
    |> build_grid
    |> getEvenSquares
    |> buildPixelGrid
    |> drawImage
    |> saveImage(input)
  end

  @doc """
      This method will get a string and later encrypt this to then pass it to binary
      finally this will return a struct with the valor in binary
  """

  def convertToHash(input) do
    binary = :crypto.hash(:md5, input) |> :binary.bin_to_list()
    %Identicon.Image{input_in_binary: binary}
  end

  @doc """
      This will have a binary_value, to then do match and assign this to a variable called binary_list
      finally we will get the first three value using pipe operator 
      "Give the first three values and after pipe i know that exist more values, but ignore this"
      Remember that underscore followed by a variable, will be ignored

  ## This method will return something as this

          %Identicon.Image{color_rgb: {233, 130, 150},
          input_in_binary: [233, 130, 150, 8, 221, 144, 255, 107, 139, 247, 203, 80, 116,110, 174, 120]}

  ## This is the same as the method
      
          def pickColor(binary_value) do
              %Identicon.Image{hex: binary_list} = binary_value
              [r, g, b | _rest] = binary_list
              %Identicon.Image{binary_value | color: {r,g,b}} 
              # <- the binary_value do as the spread operator ...binary_value
              [r,g,b] #<- this will return the first three values
          end 

      

  """

  def pickColor(binary_value) do
    %Identicon.Image{input_in_binary: [r, g, b | _rest]} = binary_value
    %Identicon.Image{binary_value | color_rgb: {r, g, b}}
  end

  @doc """
  ## this method is the abbrevation of

      def build_grid(structure) do
          %Identicon.Image{input_in_binary: binary} = structure;
          arrayOfArray = Enum.chunk(binary, size_chunk);
          arrayOfArray;

  ## This -> Enum.map(fn(row)-> mirrorGrid(row) end) it's the same that the following

          arrayOfArrays = binary |> Enum.chunk(3)
          array = [] 
          for row <- arrayOfArrays do
              array ++ mirrorGrid(row)
          end

  ## A better practice to Enum.map(fn(row)-> mirrorGrid(row) end) it's:
  ## Enum.map(&mirrorGrid/1);
          & <- specific that a value will be pass to mirrorGrid
          mirrorGrid/1 <- specific that the method to run is called mirrorGrid and just have an argument

  """

  def build_grid(%Identicon.Image{input_in_binary: binary} = structure) do
    grid =
      binary
      |> Enum.chunk(3)
      |> Enum.map(&mirrorGrid/1)
      |> List.flatten()
      |> Enum.with_index()

    %Identicon.Image{structure | grid: grid}
  end

  def mirrorGrid(row) do
    [first, second | _rest] = row
    row ++ [second, first]
  end

  def getEvenSquares(%Identicon.Image{grid: allGrid} = structure) do
    gridPair =
      Enum.filter(allGrid, fn {value, _rest} ->
        rem(value, 2) == 0
      end)

    %Identicon.Image{structure | grid: gridPair}
  end

  def buildPixelGrid(%Identicon.Image{grid: grid} = structure) do
    pixel_map =
      Enum.map(grid, fn {_value, index} ->
        horizontal = rem(index, 5) * 100
        vertical = div(index, 5) * 100

        top_left = {horizontal, vertical}
        bottom_right = {horizontal + 100, vertical + 100}

        {top_left, bottom_right}
      end)

    %Identicon.Image{structure | pixel_map: pixel_map}
  end

  # This is the same ...drawImage(%Identicon.Image{color: color, pixel_map: pixel_map} = structure)...
  def drawImage(%Identicon.Image{color_rgb: color, pixel_map: pixel_map}) do
    image = :egd.create(500, 500)
    color = :egd.color(color)

    Enum.each(pixel_map, fn {start, stop} ->
      # start = {top_left};
      # stop = {bottom_right}
      :egd.filledRectangle(image, start, stop, color)
    end)

    :egd.render(image)
  end

  def saveImage(image, filename) do
    File.write("#{filename}.png", image)
  end

  def newTermsLearned(input \\ "Jesus") do
    # Convert String to binary
    :erlang.term_to_binary(input)
    # Inverse process, 
    |> :erlang.binary_to_term()

    # the pipe operator insert the value returned for first function as argument on second function

    ## creating a encryption
    encrypted_value = :crypto.hash(:md5, "value")
    # :md5 is method of encryption and the second argument is the value to encrypt

    ## Convert the encryption on base16, 32, 64... 
    encode_value = Base.encode16(encrypted_value)

    # create a file on system
    File.write("filename", "Value to save")

    # Read a file from system
    File.read("filename")
  end
end