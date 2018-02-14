FROM elixir:slim
RUN apt update && apt install -y inotify-tools
