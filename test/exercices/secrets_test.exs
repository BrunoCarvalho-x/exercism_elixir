defmodule SecretsTest do
  use ExUnit.Case

  describe "Secrets.secret_add/2" do
    test "return 6 when input equals 3 and param 3" do
      add = Secrets.secret_add(3)
      assert add.(3) === 6
    end

    test "return 15 when input equals 6 and param 9" do
      add = Secrets.secret_add(3)
      assert add.(3) === 6
    end

    test "return n+m when input equals n and param m" do
      n = :rand.uniform(1000)
      m = :rand.uniform(1000)
      add = Secrets.secret_add(n)

      assert add.(m) === n + m
    end
  end

  describe "Secrets.secret_subtract/2" do
    test "return 3 when input equals 3 and param 6" do
      subtract = Secrets.secret_subtract(3)
      assert subtract.(6) === 3
    end

    test "return -3 when input equals 6 and param 3" do
      subtract = Secrets.secret_subtract(6)
      assert subtract.(3) === -3
    end

    test "return m-n when input equals n and param m" do
      n = :rand.uniform(1000)
      m = :rand.uniform(1000)
      subtract = Secrets.secret_subtract(n)
      
      assert subtract.(m) === m - n
    end
  end

  describe "Secrets.secret_multiply/2" do
    test "return 18 when input equals 3 and param 6" do
      multiply = Secrets.secret_multiply(3)
      assert multiply.(6) === 18
    end

    test "return 42 when input equals 6 and param 7" do
      multiply = Secrets.secret_multiply(6)
      assert multiply.(7) === 42
    end

    test "return m*n when input equals n and param m" do
      n = :rand.uniform(1000)
      m = :rand.uniform(1000)
      multiply = Secrets.secret_multiply(n)
      
      assert multiply.(m) === m * n
    end
  end

  describe "Secrets.secret_divide/2" do
    test "return 2 when input equals 3 and param 6" do
      divide = Secrets.secret_divide(3)
      assert divide.(6) === 2
    end

    test "return 1 when input equals 6 and param 7" do
      divide = Secrets.secret_divide(6)
      assert divide.(7) === 1
    end

    test "return the integer part of m/n when input equals n and param m" do
      n = :rand.uniform(1000)
      m = :rand.uniform(1000)
      divide = Secrets.secret_divide(n)
      
      assert divide.(m) === trunc(m/n)
    end
  end

  describe "Secrets.secret_and/2" do
    test "return 0 when input equals 1 and param 2" do
      ander = Secrets.secret_and(1)
      assert ander.(2) === 0
    end

    test "return 7 when input equals 7 and param 7" do
      ander = Secrets.secret_and(7)
      assert ander.(7) === 7
    end

    test "return 0 when input equal 1 and param not 1" do
      n = 1
      m = :rand.uniform(1000) + 2
      ander = Secrets.secret_and(n)
      
      assert ander.(m) === 0
    end

    test "return 1 when param equal 1" do
      n = :rand.uniform(1000)
      m = 1
      ander = Secrets.secret_and(n)
      
      assert ander.(m) === 1
    end

    test "return 1 when param and input are diferent" do
      n = :rand.uniform(1000)
      m = :rand.uniform(1000)

      if n != m do
        ander = Secrets.secret_and(n)
        assert ander.(m) === 1
      else
        1
      end
    end
  end

  describe "Secrets.secret_xor/2" do
    test "return 3 when input equals 1 and param 2" do
      xorer = Secrets.secret_xor(1)
      assert xorer.(2) === 3
    end

    test "return 0 when input equals 7 and param 7" do
      xorer = Secrets.secret_xor(7)
      assert xorer.(7) === 0
    end

    test "return 0 when input equals param" do
      n = :rand.uniform(1000)
      m = n
      
      xorer = Secrets.secret_xor(n)
      assert xorer.(m) === 0
    end

    test "return n + m when input different param" do
      n = :rand.uniform(1000)
      m = :rand.uniform(1000)
      
      if n != m do
        xorer = Secrets.secret_xor(n)
        assert xorer.(m) === n + m
      end
    end
  end

  describe "Secrets.secret_combine/2" do
    test "return 180 when inputs equals 
          Secrets.secret_multiply(2), Secrets.secret_subtract(20) and 100" do
      f = Secrets.secret_multiply(2)
      g = Secrets.secret_subtract(20)
      h = Secrets.secret_combine(f, g)

      assert h.(100) === 180
    end

    test "return 20 when inputs equals 
          Secrets.secret_divide(10), Secrets.secret_add(10) and 100" do
      f = Secrets.secret_divide(10)
      g = Secrets.secret_add(10)
      h = Secrets.secret_combine(f, g)

      assert h.(100) === 20
    end

    test "return 15 when inputs equals 
          Secrets.secret_divide(3), Secrets.secret_add(5) and 32" do
      f = Secrets.secret_divide(3)
      g = Secrets.secret_add(5)
      h = Secrets.secret_combine(f, g)

      assert h.(32) === 15
    end

    test "return 1 when inputs equals 
          Secrets.secret_and(3), Secrets.secret_and(5) and 7" do
      f = Secrets.secret_and(3)
      g = Secrets.secret_and(5)
      h = Secrets.secret_combine(f, g)

      assert h.(7) === 1
    end

    test "return 7 when inputs equals 
          Secrets.secret_and(7), Secrets.secret_and(7) and 7" do
      f = Secrets.secret_and(7)
      g = Secrets.secret_and(7)
      h = Secrets.secret_combine(f, g)

      assert h.(7) === 7
    end

    test "return 7 when inputs equals 
          Secrets.secret_xor(1), Secrets.secret_xor(2) and 4" do
      f = Secrets.secret_xor(1)
      g = Secrets.secret_xor(2)
      h = Secrets.secret_combine(f, g)

      assert h.(4) === 7
    end

    test "return 7 when inputs equals 
          Secrets.secret_xor(7), Secrets.secret_xor(7) and 7" do
      f = Secrets.secret_xor(7)
      g = Secrets.secret_xor(7)
      h = Secrets.secret_combine(f, g)

      assert h.(7) === 7
    end

    test "return 7 when inputs equals 
          Secrets.secret_add(3), Secrets.secret_xor(7) and 4" do
      f = Secrets.secret_add(3)
      g = Secrets.secret_xor(7)
      h = Secrets.secret_combine(f, g)

      assert h.(4) === 0
    end

    test "return 7 when inputs equals 
          Secrets.secret_divide(9), Secrets.secret_and(7) and 81" do
      f = Secrets.secret_divide(9)
      g = Secrets.secret_and(7)
      h = Secrets.secret_combine(f, g)

      assert h.(81) === 1
    end
  end
end
