defmodule RosesEprof do
  def testing_flow do
    # same as https://github.com/elixir-lang/flow example
    Path.join(["lib", "roses.txt"])
    |> Path.absname
    |> File.stream!
    |> Flow.from_enumerable()
    |> Flow.flat_map(&String.split(&1, " "))
    |> Flow.partition()
    |> Flow.reduce(fn -> %{} end, fn word, acc ->
        Map.update(acc, word, 1, & &1 + 1)
    end)
    |> Enum.to_list()
  end
end
