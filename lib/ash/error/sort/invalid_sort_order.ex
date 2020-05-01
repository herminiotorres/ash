defmodule Ash.Error.Sort.InvalidSortOrder do
  use Ash.Error

  def_ash_error([:order], class: :invalid)

  defimpl Ash.ErrorKind do
    def id(_), do: Ecto.UUID.generate()

    def code(_), do: "invalid_sort_order"

    def message(%{order: order}) do
      "No such sort order #{inspect(order)}"
    end

    def description(%{order: order}) do
      "Attempted to use a sort order does not exist: #{order}"
    end
  end
end