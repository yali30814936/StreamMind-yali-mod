from SoccerNet.Downloader import SoccerNetDownloader

mySoccerNetDownloader = SoccerNetDownloader(LocalDirectory="./dataset/sn-captions")

mySoccerNetDownloader.password = "s0cc3rn3t"
mySoccerNetDownloader.downloadGames(files=["1_224p.mkv", "2_224p.mkv"], split=["train", "valid", "test"]) # download 224p Videos
