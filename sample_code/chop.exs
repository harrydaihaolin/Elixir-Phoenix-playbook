defmodule Chop do
  @doc """
    example:
      iex> guess(273)
      Is it 500
      Is it 250
      Is it 375
      Is it 312
      Is it 281
      Is it 265
      Is it 273
      273
      iex> guess(273, 1000)
      Is it 500: 273
      # 1..1000 -> 1..500
      Is it 250: 273
      # 1..500 -> 250..500
      Is it 375
      # 250..500 -> 375..500
      Is it 312
      Is it 281
      Is it 265
      Is it 273
      273
  """
  def guess(ges, a..b) when is_integer(ges) and ges != b do
    div = div(b, 2)
    # 273 > 250 -> 251..500
    IO.puts("Is it #{div}: #{ges}")
    case ges > div do
      false ->
        guess(ges, a+div..b)
      true ->
        guess(ges, div..b)
    end
  end
end
