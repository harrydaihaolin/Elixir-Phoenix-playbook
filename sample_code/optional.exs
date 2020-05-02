defmodule Optional do
  def default(value, [h | t] \\ [1,2,3]) do
    IO.puts("value: #{value}")
    IO.puts("head: #{h}")
    IO.puts("tail: " <> List.to_string(Enum.map(t, fn x -> Integer.to_string(x) <> " " end)))
  end
end
