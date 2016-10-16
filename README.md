# Open Australia

This interfaces with the [OpenAustralia.org API](https://www.openaustralia.org.au/api).

It searches for an environment variable for your api key
```
export OPENAUS_KEY=KEY_HERE
```

Then, you simply run one of the functions, such as:

```elixir
iex> OpenAus.hansard("Search term")
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `openaus` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:openaus, "~> 0.1.0"}]
    end
    ```

  2. Ensure `openaus` is started before your application:

    ```elixir
    def application do
      [applications: [:openaus]]
    end
    ```
