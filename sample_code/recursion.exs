defmodule Recursion do
  def sum(0), do: 0
  # when is the guard clause
  def sum(n) when is_integer(n) and n > 0, do: n + sum(n - 1)

  def gcd(0, y), do: y
  def gcd(x, 0), do: x
  # def gcd(x, y), do: gcd(rem(y,x), x)
  def gcd(x, y), do: gcd(y, rem(x, y))
end
