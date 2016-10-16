defmodule OpenAus.Api do
	@moduledoc """
	Contains the helpers for URI building
	"""
	def get(api_function, opts \\ [])do

		api_function
			|> build_full_url(opts)
			|> HTTPoison.get
			|> clean_response()
	end

	defp clean_response({:ok, %HTTPoison.Response{body: body}}) do
		body
		|> Poison.decode!
	end



	def build_full_url(api, opts) do
		qry = opts |> build_string() |> URI.encode_query
		"#{base_uri}#{api}?#{qry}"
	end

	@doc """
	builds string
	"""
	def build_string(opts) do
		Keyword.merge(base_query(), opts)
	end

	defp base_uri() do
		Application.get_env(:openaus, :base_url)
	end

	defp base_query() do
		key = System.get_env("OPENAUS_KEY")
		[key: key, output: "js"]
	end


end
