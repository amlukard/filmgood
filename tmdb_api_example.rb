require 'uri'
require 'net/http'

url = URI("https://api.themoviedb.org/3/movie/movie_id?language=en-US")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)

request["accept"] = 'application/json'
request["Authorization"] = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwMTQ4YTY2YjM2YTQ4ZWE5ZTRiYzU3MGExZGJkOGE5YyIsInN1YiI6IjY1NjYxOWJiMTU2Y2M3MDBjYTcwNmQ1MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vSC8H8Y6_6bJs1WpdY6sembeksehHk632yB7GBlPOho'

response = http.request(request)
puts response.read_body