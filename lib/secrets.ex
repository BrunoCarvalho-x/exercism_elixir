defmodule Secrets do
  
  def secret_add(secret) do
    fn param -> param + secret end
  end

  def secret_subtract(secret) do
    fn param -> param - secret end
  end

  def secret_multiply(secret) do
    fn param -> param * secret end
  end

  def secret_divide(secret) do
    fn param -> trunc(param / secret) end
  end

  def secret_and(secret) do
    fn param -> 
      cond do
        param == secret -> param
        param == 1 -> 1
        secret == 1 -> 0
        true -> 1
      end
    end
  end

  def secret_xor(secret) do
    fn param -> if param == secret, do: 0, else: param + secret end
  end

  def secret_combine(secret_function1, secret_function2) do
    fn param -> secret_function2.(secret_function1.(param)) end
  end
end