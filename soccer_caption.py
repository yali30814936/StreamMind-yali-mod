from SoccerNet.Downloader import SoccerNetDownloader

mySoccerNetDownloader = SoccerNetDownloader(LocalDirectory="./dataset/sn-captions")

mySoccerNetDownloader.password = "s0cc3rn3t"

mySoccerNetDownloader.downloadDataTask(task="caption-2024", split=["train","valid", "test"])