defmodule LogLevel do
  def to_label(level, legacy?) do
    if Enum.at(log_code(level), 1) == false do
      if legacy? == true do
        :unknown
      else
        Enum.at(log_code(level), 0)
      end
    else
      Enum.at(log_code(level), 0)
    end
  end

  def alert_recipient(level, legacy?) do
    condicion = to_label(level, legacy?)

    cond do
      condicion == :error -> :ops
      condicion == :fatal -> :ops
      condicion == :unknown && legacy? -> :dev1
      condicion == :unknown && !legacy? -> :dev2
      true -> false
    end
  end

  defp log_code(level) do
    cond do
      level == 0 -> [:trace, false]
      level == 1 -> [:debug, true]
      level == 2 -> [:info, true]
      level == 3 -> [:warning, true]
      level == 4 -> [:error, true]
      level == 5 -> [:fatal, false]
      true -> [:unknown, true]
    end
  end
end