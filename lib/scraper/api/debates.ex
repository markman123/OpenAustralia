defmodule Scraper.Api.Debates do
	@moduledoc """
	Contains the helpers for URI building
	"""
	def get(api_function, opts \\ [])do
		query = search_term
			|> build_string
			|> add_opts(opts)

		api_function
			|> build_full_url(query)
			|> HTTPoison.get
			|> clean_response()
	end

	defp clean_response({:ok, %HTTPoison.Response{body: body}}) do
		body
		|> Poison.decode!
	end

	@doc """
	builds string
	"""
	def build_string(opts) do
		Keyword.merge(base_query(), opts)
	end

	defp build_full_url(api, qry) do
		qry = URI.encode_query(qry)
		"#{base_uri}#{api}?#{qry}"
	end

	defp base_uri() do
		Application.get_env(:scraper, :base_url)
	end

	defp base_query() do
		key = System.get_env("OPENAUS_KEY")
		[key: key, output: "js"]
	end


end
