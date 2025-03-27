class ApiCall
  def api_call(title, lang)
    query = { "query" => title }
    response = HTTParty.get("https://api.themoviedb.org/3/search/movie?api_key=b6ba0af499c6872471a982365c647f0e", query: query, language: lang, include_adult: false, format: :json)
    # puts 'Response', response
    response = response.parsed_response
    puts('api triggered')
    results = response["results"]
  end
end
