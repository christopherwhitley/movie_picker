class ApiCall
  def api_call(title, _lang)
    query = { "query" => title }
    response = HTTParty.get("https://api.themoviedb.org/3/search/movie?api_key=b6ba0af499c6872471a982365c647f0e", query: query, include_adult: false, format: :json)
    response = response.parsed_response
    Rails.logger.info("API_RESPONSE:, #{JSON.pretty_generate(response)}")
    response["results"]
  end
end
