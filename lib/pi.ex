defmodule Pi do
  @moduledoc """
  Documentation for `Pi`.
  """

  require Integer

  # https://en.wikipedia.org/wiki/Leibniz_formula_for_%CF%80

  def lb(n) when is_integer(n) do
    0..n
    |> Enum.reduce(Decimal.new(0), fn n, acc ->
      item_for(n)
      |> Decimal.add(acc)
    end)
    |> Decimal.mult(4)
  end

  def item_for(n) do
    n
    |> dividend_of_item()
    |> Decimal.new()
    |> Decimal.div(divisor_of_item(n))
  end

  def dividend_of_item(n) when Integer.is_even(n), do: 1
  def dividend_of_item(_), do: -1
  def divisor_of_item(n) when is_integer(n), do: 2 * n + 1
end
