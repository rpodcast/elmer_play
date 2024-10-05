# Choose the path to your project
# This will create two files: .Rprofile and default.nix
path_default_nix <- "."
library(rix)
rix(
  r_ver = "frozen_edge",
  r_pkgs = NULL,
  system_pkgs = NULL,
  git_pkgs = list(
#     list(
#       package_name = "shinychat",
#       repo_url = "https://github.com/jcheng5/shinychat",
#       commit = "de2e7f92284c426a5f058c40c2623f38803dd05e"
#     ),
    list(
      package_name = "elmer",
      repo_url = "https://github.com/hadley/elmer",
      commit = "f272f745b5d96d0ad6198296024bbfc6222d272b"
    )
  ),
  ide = "code",
  project_path = path_default_nix,
  overwrite = TRUE,
  print = TRUE
)
