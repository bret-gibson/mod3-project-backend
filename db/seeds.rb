require 'rest-client'
require 'json'

# Song.delete_all
# GameSession.delete_all
# GameSong.delete_all

user1 = User.create(username: "mary")
user2 = User.create(username: "bret")

song1 = Song.create(title: 'Circles', artist: 'Post Malone', genre: '2010s', source: 'https://cdns-preview-d.dzcdn.net/stream/c-df36f056f3f9770ab7b7b466e32975fd-5.mp3', dummy: false)
song2 = Song.create(title: 'Say So', artist: 'Doja Cat', genre: '2010s', source: 'https://cdns-preview-7.dzcdn.net/stream/c-7bc96d31b485a05a8867d0f957ff8649-3.mp3', dummy: false)
song3 = Song.create(title: 'Blinding Light', artist: 'The Weeknd', genre: '2010s', source: 'https://cdns-preview-0.dzcdn.net/stream/c-0cb3c26f5c0be8b37d90560955431118-4.mp3', dummy: false)
song4 = Song.create(title: 'The Less I Know the Better', artist: 'Tame Impala', genre: '2010s', source: 'https://cdns-preview-a.dzcdn.net/stream/c-ae8f32367cb3c4fcbb60ca892f11297c-2.mp3', dummy: false)
song5 = Song.create(title: 'When You Were Young', artist: 'The Killers', genre: '2000s', source: 'https://cdns-preview-c.dzcdn.net/stream/c-ca6ba727fefad4f03d2ab55ed6fc471c-4.mp3', dummy: false)

song6 = Song.create(title: "Last Nite", artist: "The Strokes", genre: "2000s", source: "", dummy: true)
song7 = Song.create(title: "Lonely Boy", artist: "The Black Keys", genre: "2010s", source: "", dummy: true)
song8 = Song.create(title: "Slow Dancing in the Dark", artist: "Joji", genre: "2010s", source: "", dummy: true)
song9 = Song.create(title: "Do I Wanna Know?", artist: "Arctic Monkeys", genre: "2010s", source: "", dummy: true)
song10 = Song.create(title: "Toosie Slide", artist:"Drake" , genre: "2010s", source: "", dummy: true)


game1 = GameSession.create(points: 600, user: user1)
game2 = GameSession.create(points: 300, user: user2)
game3 = GameSession.create(points: 300, user: user2)
game4 = GameSession.create(points: 0, user: user1)
game5 = GameSession.create(points: 150, user: user1)
game6 = GameSession.create(points: 250, user: user1)


gamesong1 = GameSong.create(game_session: game1, song: song1, correct_guess: false)
gamesong2 = GameSong.create(game_session: game2, song: song2, correct_guess: false)
gamesong3 = GameSong.create(game_session: game3, song: song3, correct_guess: false)
gamesong4 = GameSong.create(game_session: game4, song: song4, correct_guess: false)

url = 'https://api.deezer.com/playlist/6529042504'
response = RestClient.get(url)
json = JSON.parse(response)

trackArr = json["tracks"]["data"]

64.times do |i|
    if i > 32 || trackArr[i]["preview"] == ""
        Song.create(
            title: trackArr[i]["title"],
            artist: trackArr[i]["artist"]["name"],
            genre: "2000s",
            source: trackArr[i]["preview"],
            dummy: true)
    else
        Song.create(
            title: trackArr[i]["title"],
            artist: trackArr[i]["artist"]["name"],
            genre: "2000s",
            source: trackArr[i]["preview"],
            dummy: false)
    end
end

url = 'https://api.deezer.com/playlist/878989033'
response = RestClient.get(url)
json = JSON.parse(response)

trackArr = json["tracks"]["data"]

79.times do |i|
    if i > 40 || trackArr[i]["preview"] == ""
        Song.create(
            title: trackArr[i]["title"],
            artist: trackArr[i]["artist"]["name"],
            genre: "1990s",
            source: trackArr[i]["preview"],
            dummy: true)
    else
        Song.create(
            title: trackArr[i]["title"],
            artist: trackArr[i]["artist"]["name"],
            genre: "1990s",
            source: trackArr[i]["preview"],
            dummy: false)
    end
end

url = 'https://api.deezer.com/playlist/1890851822'
response = RestClient.get(url)
json = JSON.parse(response)

trackArr = json["tracks"]["data"]

109.times do |i|
    if i > 55 || trackArr[i]["preview"] == ""
        Song.create(
            title: trackArr[i]["title"],
            artist: trackArr[i]["artist"]["name"],
            genre: "2010s",
            source: trackArr[i]["preview"],
            dummy: true)
    else
        Song.create(
            title: trackArr[i]["title"],
            artist: trackArr[i]["artist"]["name"],
            genre: "2010s",
            source: trackArr[i]["preview"],
            dummy: false)
    end
end

