# experiment with airsonic api on local network server
library(httr2)

# info
# salt: a2flqXmMBbyunA==
# token: bccb467fdd917f30241eebbc1202bacc
# api version: 1.15.0
#curl 'http://your-server/rest/ping.view?u=<username>&t=<token>&s=<salt>&v=1.15.0&c=<your-app>'

# define server URL
base_url <- "https://navidrome.tail0604.ts.net/rest"

# test ping
req <- request(base_url) |>
  req_url_path_append("ping") |>
  req_url_query(
    u = "eric",
    p = Sys.getenv("NAVIDROME_PASS"),
    v = "1.15.0",
    c = "R App"
  )

resp <- req_perform(req)
resp |>
  resp_body_xml()


# test now playing
req <- request(base_url) |>
  req_url_path_append("getNowPlaying") |>
  req_url_query(
    u = "eric",
    p = Sys.getenv("NAVIDROME_PASS"),
    v = "1.15.0",
    c = "R App"
  )


resp <- req_perform(req)
resp_xml <- resp_body_xml(resp)

xml2::write_xml(resp_xml, "test_now_playing.xml")

xml2::xml_structure(resp_xml)
xml2::xml_name(resp_xml)
xml2::xml_children(resp_xml)

# test obtianing cover art
# song: Training montage - Return All Robots
# song id: 7b505b817806dfe00222a6a2e110e6c8
req <- request(base_url) |>
  req_url_path_append("getCoverArt") |>
  req_url_query(
    u = "eric",
    p = Sys.getenv("NAVIDROME_PASS"),
    v = "1.15.0",
    c = "R App",
    id = "7b505b817806dfe00222a6a2e110e6c8"
  )

resp <- req_perform(req)
resp_binary <- resp_body_raw(resp)

writeBin(resp_binary, "album_art.png")
resp_status(resp)

# test obtaining alnum info
# for ocremix stuff, only returns the album art in small, medium, large
req <- request(base_url) |>
  req_url_path_append("getAlbumInfo2") |>
  req_url_query(
    u = "eric",
    p = Sys.getenv("NAVIDROME_PASS"),
    v = "1.15.0",
    c = "R App",
    id = "7b505b817806dfe00222a6a2e110e6c8"
  )

resp <- req_perform(req)
resp_status(resp)
resp_xml <- resp_body_xml(resp)
xml2::write_xml(resp_xml, file = "album_info.xml")

# test getting osng info
req <- request(base_url) |>
  req_url_path_append("getSong") |>
  req_url_query(
    u = "eric",
    p = Sys.getenv("NAVIDROME_PASS"),
    v = "1.15.0",
    c = "R App",
    id = "7b505b817806dfe00222a6a2e110e6c8"
  )

resp <- req_perform(req)
resp_status(resp)
resp_xml <- resp_body_xml(resp)
xml2::write_xml(resp_xml, file = "song_info.xml")
