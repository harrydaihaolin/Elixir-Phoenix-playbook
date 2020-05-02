defmodule MyList do
  def reduce([], value, _), do: value
  def reduce([head | tail], value, func), do: reduce(tail, func.(head, value), func)

  @doc """
    applies the function to each element of the list and then sums the result
    ex:
      iex> MyList.mapsum [1, 2, 3], &(&1 * &1)
      14
  """
  def mapsum([head], func), do: func.(head)
  def mapsum([head | tail], func), do: mapsum(tail, func.(head))

  def mymax([max], max), do: max
  def mymax([head | tail], max) do
    mymax(tail, Kernel.max(head, max))
  end
end
