require 'toxiproxy'

Toxiproxy.populate([
  {
    name: "translation_service",
    listen: "localhost:8666",
    upstream: "localhost:3001"
  }
])