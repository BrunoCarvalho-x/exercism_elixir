defmodule LogLevelTest do
  use ExUnit.Case

  describe "LogLevel.to_label/2" do
    test "when inputs are 0 and false, return :trace" do
      assert LogLevel.to_label(0, false) == :trace
    end

    test "when inputs are 0 and true, return :unknown" do
      assert LogLevel.to_label(0, true) == :unknown
    end

    test "when inputs are 1 and false, return :debug" do
      assert LogLevel.to_label(1, false) == :debug
    end

    test "when inputs are 1 and true, return :debug" do
      assert LogLevel.to_label(1, true) == :debug
    end

    test "when inputs are 2 and false, return :info" do
      assert LogLevel.to_label(2, false) == :info
    end

    test "when inputs are 2 and true, return :info" do
      assert LogLevel.to_label(2, true) == :info
    end

    test "when inputs are 3 and false, return :warning" do
      assert LogLevel.to_label(3, false) == :warning
    end

    test "when inputs are 3 and true, return :warning" do
      assert LogLevel.to_label(3, true) == :warning
    end

    test "when inputs are 4 and false, return :error" do
      assert LogLevel.to_label(4, false) == :error
    end

    test "when inputs are 4 and true, return :error" do
      assert LogLevel.to_label(4, true) == :error
    end

    test "when inputs are 5 and false, return :fatal" do
      assert LogLevel.to_label(5, false) == :fatal
    end

    test "when inputs are 5 and true, return :unknown" do
      assert LogLevel.to_label(5, true) == :unknown
    end

    test "when inputs are 6 and false, return :unknown" do
      assert LogLevel.to_label(6, false) == :unknown
    end

    test "when inputs are 6 and true, return :unknown" do
      assert LogLevel.to_label(6, true) == :unknown
    end

    test "when inputs are -1 and false, return :unknown" do
      assert LogLevel.to_label(-1, false) == :unknown
    end

    test "when inputs are -1 and true, return :unknown" do
      assert LogLevel.to_label(-1, true) == :unknown
    end
  end

  describe "LogLevel.alert_recipient/2" do
    test "when inputs are 0 and false, return false" do
      assert LogLevel.alert_recipient(0, false) == false
    end

    test "when inputs are 0 and true, return :dev1" do
      assert LogLevel.alert_recipient(0, true) == :dev1
    end

    test "when inputs are 1 and false, return false" do
      assert LogLevel.alert_recipient(1, false) == false
    end

    test "when inputs are 1 and true, return false" do
      assert LogLevel.alert_recipient(1, true) == false
    end

    test "when inputs are 2 and false, return false" do
      assert LogLevel.alert_recipient(2, false) == false
    end

    test "when inputs are 2 and true, return false" do
      assert LogLevel.alert_recipient(2, true) == false
    end

    test "when inputs are 3 and false, return false" do
      assert LogLevel.alert_recipient(3, false) == false
    end

    test "when inputs are 3 and true, return false" do
      assert LogLevel.alert_recipient(3, true) == false
    end

    test "when inputs are 4 and false, return :ops" do
      assert LogLevel.alert_recipient(4, false) == :ops
    end

    test "when inputs are 4 and true, return :ops" do
      assert LogLevel.alert_recipient(4, true) == :ops
    end

    test "when inputs are 5 and false, return :ops" do
      assert LogLevel.alert_recipient(5, false) == :ops
    end

    test "when inputs are 5 and true, return :dev1" do
      assert LogLevel.alert_recipient(5, true) == :dev1
    end

    test "when inputs are 6 and false, return :dev2" do
      assert LogLevel.alert_recipient(6, false) == :dev2
    end

    test "when inputs are 6 and true, return :dev1" do
      assert LogLevel.alert_recipient(6, true) == :dev1
    end

    test "when inputs are -1 and false, return :dev2" do
      assert LogLevel.alert_recipient(-1, false) == :dev2
    end

    test "when inputs are -1 and true, return :unknown" do
      assert LogLevel.alert_recipient(-1, true) == :dev1
    end
  end
end
