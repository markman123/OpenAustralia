defmodule OpenAus.UriTest do
	use ExUnit.Case

	alias OpenAus.Api

	@key System.get_env("OPENAUS_KEY")
	@base Application.get_env(:openaus, :base_url)

	test "given paramters, correct url is built" do
		assert Api.build_full_url("getHansard", search: "this term") == "#{@base}getHansard?key=#{@key}&output=js&search=this+term"
		assert Api.build_full_url("getDebates", type: "representitives") == "#{@base}getDebates?key=#{@key}&output=js&type=representitives"
	end
end
