defmodule Scraper.UriTest do
	use ExUnit.Case

	alias Scraper.Api.Debates

	@key (System.get_env("OPENAUS_KEY") || "TEST")
	@house "key=#{@key}&output=js&type=representatives"

	test "builds query strings correctly" do
		assert Debates.query_string("house") == @house
		assert Debates.query_string("senate") == "key=#{@key}&output=js&type=senate"
	end

	test "adds options" do
		assert Debates.query_string("house", search: "Hanson") == "#{@house}&search=Hanson"
		assert Debates.query_string("house", gid: "1234", search: "asbs") == "#{@house}&gid=1234&search=asbs"
	end
end
