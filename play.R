library(elmer)

chat <- new_chat_openai(
  model = "gpt-4o-mini",
  system_prompt = "Please be kind in your answers.",
  api_key = Sys.getenv("OPENAI_API_KEY"),
  echo = TRUE
)

chat$chat("What is the best language?")


chat$chat("What preceding languages most influenced R?")

chat <- new_chat_gemini(
  system_prompt = "Please be kind in your answers.",
  echo = TRUE
)

chat$chat("I have a raw object obtained from an API that I want to write to an image format like PNG. How do I do this in R?")

chat$chat("Not quite. I meant to say I have a binary object returned from an API, that represents an image. How do I write this binary object to an image file in R?")

chat$chat("Who wrote the declaration of independence?")

chat$chat("You talk too much")
