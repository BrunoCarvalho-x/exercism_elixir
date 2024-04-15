defmodule FreelancerRatesTest do
  use ExUnit.Case

  describe "FreelancerRates.daily_rate/1" do
    test "when input equal 50" do
      assert FreelancerRates.daily_rate(50) == 400.0
    end

    test "when input equal 60" do
      assert FreelancerRates.daily_rate(60) == 480.0
    end

    test "when input equal 55.1" do
      assert FreelancerRates.daily_rate(55.1) == 440.8
    end
  end

  describe "FreelancerRates.apply_discount/2" do
    test "when inputs equals 140.0 and 10" do
      assert FreelancerRates.apply_discount(140.0, 10) == 126.0
    end

    test "when inputs equals 100 and 10" do
      assert FreelancerRates.apply_discount(100, 10) == 90.0
    end

    test "when inputs equals 111.11 and 13.5" do
      assert_in_delta FreelancerRates.apply_discount(111.11, 13.5), 96.11015, 1.0e-6
    end
  end

  describe "FreelancerRates.monthly_rate/2" do
    test "when inputs equals 62 and 0.0" do
      assert FreelancerRates.monthly_rate(62, 0.0) == 10912
    end

    test "when inputs equals 70 and 0.0" do
      assert FreelancerRates.monthly_rate(70, 0.0) === 12320
    end

    test "when inputs equals 62.8 and 0.0" do
      assert FreelancerRates.monthly_rate(62.8, 0.0) == 11053
    end

    test "when inputs equals 67 and 12.0" do
      assert FreelancerRates.monthly_rate(67, 12.0) == 10377
    end
  end

  describe "FreelancerRates.days_in_budget/3" do
    test "when inputs equals 1600, 50 and 0.0" do
      assert FreelancerRates.days_in_budget(1600, 50, 0.0) == 4
    end

    test "when inputs equals 520, 65 and 0.0" do
      assert FreelancerRates.days_in_budget(520, 65, 0.0) === 1.0
    end

    test "when inputs equals 4410, 55 and 0.0" do
      assert FreelancerRates.days_in_budget(4410, 55, 0.0) == 10.0
    end

    test "when inputs equals 4480, 55 and 0.0" do
      assert FreelancerRates.days_in_budget(4480, 55, 0.0) == 10.1
    end

    test "when inputs equals 480, 60 and 20" do
      assert FreelancerRates.days_in_budget(480, 60, 20) == 1.2
    end
  end
end