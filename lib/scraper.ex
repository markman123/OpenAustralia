defmodule Scraper do
	alias Scraper.Api.Debates
	def get_hansard(search_term) when is_binary(search_term) do
		Debates.get("getHansard", search: search_term)
	end
	def get_hansard(search_term) when is_integer(search_term) do
		Debates.get("getHansard", person: search_term)
	end
end
