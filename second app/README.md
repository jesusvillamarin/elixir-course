

## Se uso la libreria EGD para crear una imagen, Se creo una app generador de Identicon

## Comparación de código, lo mismo pero mas "abreviado"
    ```
      Enum.each(pixel_map, fn({start, stop}) -> 
            #start = {top_left};
            #stop = {bottom_right}
            :egd.filledRectangle(image, start, stop, color);
        end)
    ```

    -- each es un método de Enum por lo tanto se ponen los parentesis. En elixir no es necesario poner los parentesis de un método, como lo será en el siguiente caso

    ```
        Enum.each pixel_map, fn({start, stop}) -> 
            #start = {top_left};
            #stop = {bottom_right}
            :egd.filledRectangle(image, start, stop, color);
        end
    ```
    -- Ambos métodos funcionaran de la misma manera


  1. Add `second` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:second, "~> 0.1.0"}]
    end
    ```

  2. Ensure `second` is started before your application:

    ```elixir
    def application do
      [applications: [:second]]
    end
    ```

