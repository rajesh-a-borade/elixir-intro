defmodule TaskList do

  def new(), do: MultiStorage.new()

  def add_task(tasks_map, date, task) do
    MultiStorage.add_task(tasks_map, date, task)
  end

  def get_task(task_map, date) do
    MultiStorage.get_task(task_map, date)
  end
end


defmodule MultiStorage do
  def new(), do: %{}

  def add_task(storage, key, value) do
      Map.update(
        storage,
        key,
        [value],
        fn values -> [value | values] end
      )
  end

  def get_task(storage, key) do
    Map.get(storage, key, [])
  end
end

defmodule Test do
  def test() do
    IO.puts("Test of TaskList")
    map = TaskList.new()
            |> TaskList.add_task(~D[2019-01-11], "Get Milk")
            |> TaskList.add_task(~D[2019-01-12], "Meeting")
    IO.puts(TaskList.get_task(map, ~D[2019-01-12]))
    :ok
  end
end
