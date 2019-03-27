# Discuss

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`



## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix


### ERRORES PRESENTES EN LA GENERACIÓN DEL PROYECTO
  * Es necesario cambiar la dependecia  `{:gettext, "~> 0.11"},` por `{:gettext, "~> 0.14.1", override: true},`

## Crear base de datos 
  > mix ecto.create

### Crear una estructura/modelo en la base de datos 
  > mix ecto.gen.migration modelName
  
Posteriormente se accede a la carpeta y archivo generado por este y se agraga las columnas que deseamos tener en nuestra bd

* Se agrega lo siguiente dentro de la funcion change
```
  def change do
    create table(:topics) do # this will create a table called topics
      add :title, :string #this will create a column called title of type string
    end
  end
```

## Ver las rutas que hay en nuestra aplicación
  > mix phoenix.routes