# experiment with rainwave api to get ocremix song information
library(httr2)

# define server URL
base_url <- "https://rainwave.cc/api4/"

# basics for api: https://rainwave.cc/api4/
# my user ID: 7650
# station IDs
# 1: Game
# 2: OC ReMix
# 3: Covers
# 4: Chiptunes
# 5: All

# test getting all song info
req <- request(base_url) |>
  req_url_path_append("all_songs") |>
  req_url_query(
    user_id = 7650,
    key = Sys.getenv("RAINWAVE_API_KEY")
  )


resp <- req_perform(req)
resp_status(resp)
resp |>
  resp_body_json() |>
  View()


# test searching for song
req <- request(base_url) |>
  req_url_path_append("search") |>
  req_body_json(
    list(
      user_id = 7650,
      key = Sys.getenv("RAINWAVE_API_KEY"),
      sid = "2",
      search = "Training Montage"
    )
  )

req_dry_run(req)

resp <- req_perform(req)
resp_status(resp)
resp |>
  resp_body_json() |>
  View()