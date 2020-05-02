defmodule Factorial do
  # tries function from top to down
  def of(0), do: 1
  def of(n) when is_integer(n) and n > 0, do: n * of(n-1)
end
