defmodule TestCaseTest do
  use ExUnit.Case

  test "that you can create test cases" do
    f = fn -> 3 = 3 end
    g = fn -> 3 = 4 end

    TestCase.new([f, g])
  end

  test "that you can get number of tests" do
    assert TestCase.new() |> TestCase.size() == 0
  end

  test "that you can add tests to cases" do
    test_case = TestCase.new()

    test_case = TestCase.add(test_case, fn -> 3 = 3 end)

    assert TestCase.size(test_case) == 1
  end

  test "that you can run tests" do
    TestCase.new()
    |> TestCase.add(fn -> 3 = 3 end)
    |> TestCase.run()
  end

  test "that you can get passed tests" do
    TestCase.new()
    |> TestCase.passed()
  end

  test "that it implements inspect" do
    t = TestCase.new()

    assert inspect(t) =~ ~r/\A#TestCase<0 tests>/
  end
end
