require 'net/http'

def getMP3(podcastPage)
	uri = URI(podcastPage)
	rawHTML = Net::HTTP.get(uri)
	arr = rawHTML.split("\n")
	arr = arr.each do |x|
		x.strip!
	end
	indx = arr.index{|s| s.include?("mp3")}
	str = arr[indx].chomp("</guid>")
	str = str.split(">")[1]
	puts str
end
def getPodcastPage(podcastSearch)
	uri = URI(podcastSearch)
	searchResults = Net::HTTP.get(uri)
	arr = searchResults.split(',')
	indx = arr.index{|s| s.include?("feedUrl")}
	str = arr[indx]
	str = str.split('":"')[1]
	str = str.chomp("\"")
	getMP3(str)
end

getPodcastPage("https://itunes.apple.com/search?term=advices+radio")

