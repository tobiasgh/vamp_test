## VampTest

  * Install Node.js dependencies with `cd assets && npm install`
  * Install dependencies with `mix deps.get`
  * Set up database: 
    ```
    mix ecto.create
    mix ecto.migrate
    mix run priv/repo/seeds.exs
    ```
  * Start Phoenix endpoint with `mix phx.server`

