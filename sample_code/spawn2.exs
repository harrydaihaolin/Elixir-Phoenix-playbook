defmodule Spawn2 do
  def greet do
    receive do
      {sender, msg} ->
        send sender, { :ok, "Hello, #{msg}" }
    end
  end
end

# here's a client
pid = spawn(Spawn2, :greet, [])
send pid, {self(), "World!"}
receive do
  {:ok, message} ->
  IO.puts message
end

# this is the 2nd message, but the Spawn2 is closed already, so it hangs forever.
send pid, {self(), "Kermit!"}
receive do
  {:ok, message} ->
  IO.puts message
end
