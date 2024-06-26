defmodule FreelancerRates do
  
  def daily_rate(hourly_rate) do
    hourly_rate*8.0
  end

  def apply_discount(before_discount, discount) do
    before_discount*(100.0 - discount)/100.0
  end

  def monthly_rate(hourly_rate, discount) do
    rate = hourly_rate*8.0*22.0*(100.0 - discount)/100.0
    ceil(rate)
  end

  def days_in_budget(budget, hourly_rate, discount) do
    day = daily_rate(hourly_rate)*(100 - discount)/100
    budget_days = budget/day
    trunc(budget_days * 10) / 10
  end
end
