defmodule OpenAus do
	alias OpenAus.Api

	@doc """
	The `hansard` looks at the endpoint of getHansard and takes either
	a search term in the speech **OR** a number of the person's id.

	Available options:

	order: Order by`a` for date (defualt), `r` for relevance and `p` for person
	page: page number (pagination)
	num: Number of results to return

	"""
	def hansard(search_term, opts \\ [])
	def hansard(search_term, opts) when is_binary(search_term) do
		opts = Keyword.merge([search: search_term], opts)
		Api.get("getHansard", opts)
	end
	def hansard(search_term, opts) when is_number(search_term) do
		opts = Keyword.merge([person: search_term], opts)
		Api.get("getHansard", opts)
	end

	@doc """
	Returns all debates with given terms
	## Mandatory
	type: must be `representatives` or `senate` and is mandatory
	date: date of debate OR
	search: search text OR
	person: person ID OR
	gid: speech / debate ID

	Available options. when using search or person:
	order: `d` for date (default) or `r` for relevance
	page: the page for pagination
	num: number of records
	"""

	def debates(type, opts \\ []) do
		opts = Keyword.merge(type, opts)
		Api.get("getDebates", opts)
	end

	def house_debates(opts \\ []) do
		opts = Keyword.merge([type: "representatives"], opts)
		Api.get("getDebates", opts)
	end

	def senate_debates(opts \\ []) do
		opts = Keyword.merge([type: "senate"], opts)
		Api.get("getDebates", opts)
	end

	@doc """
	Returns all House of Representatives members

	Options available:

	date: as it was on this date
	party: Show from given party
	postcode: representatives that lay in postcode (could be > 1)
	search: searches in their names

	[Source](https://www.openaustralia.org.au/api/docs/getRepresentatives)
	"""
	def representatives(opts \\ []) do
		Api.get("getRepresentatives", opts)
	end

	@doc """
	Returns a single representative, based on inputs

	Options available:

	id: the person id, from representatives or another query
	division: electoral division
	always_return: boolean, returns a member even if vacant

	[Source](https://www.openaustralia.org.au/api/docs/getRepresentative)
	"""

	def representative(opts \\ []) do
		Api.get("getRepresentative", opts)
	end

	@doc """
	Returns all upper house members (senators)

	Options available:

	date: as it was on this date
	party: Show from given party
	state: NSW, Tasmania, WA, Queensland, Victoria, SA, NT, ACT
	search: searches in their names
	"""
	def senators(opts \\ []) do
		Api.get("getSenators", opts)
	end

	@doc """
	Returns a single Senator, based on inputs

	Options available:

	id: the person id, from representatives or another query

	[Source](https://www.openaustralia.org.au/api/docs/getSenator)
	"""
	def senator(opts \\ []) do
		Api.get("getSenator", opts)
	end

	@doc """
	Returns divisions, requires no params.

	Optional options (only one can be given):

	postcode:  Fetch the list of electoral divisions that are within the given postcode (there can be more than one)
	date: Fetch the list of electoral divisions as it was on this date.
	search: Fetch the list of electoral divisions that match this search string.
	"""

	def divisions(opts \\ []) do
		Api.get("getDivisions", opts)
	end

	@doc """
	Fetch comments left on OpenAustralia.

	With no arguments, returns most recent comments in reverse date order.

	Arguments
	date (optional)
	Fetch the comments for this date.
	search (optional)
	Fetch the comments that contain this term.
	user_id (optional)
	Fetch the comments by a particular user ID.
	pid
	Fetch the comments made on a particular person ID (Representative/Senator).
	page (optional)
	Page of results to return.
	num (optional)
	Number of results to return.
	"""
	def comments(opts \\ []) do
		Api.get("getComments", opts)
	end

end
