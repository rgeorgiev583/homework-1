defmodule TestSuiteTest do
  use ExUnit.Case

  test "that you can create test cases" do
    f = fn -> 3 == 3 end
    g = fn -> 3 == 4 end

    TestSuite.new([f, g])
  end

  test "that you can get number of tests" do
    assert TestSuite.new() |> TestSuite.size() == 0
  end

  test "that you can add tests to cases" do
    test_case = TestSuite.new()

    test_case = TestSuite.add(test_case, fn -> 3 = 3 end)

    assert TestSuite.size(test_case) == 1
  end

  test "that you can run tests" do
    TestSuite.new()
    |> TestSuite.add(fn -> 3 = 3 end)
    |> TestSuite.run()
  end

  test "that you can get passed tests" do
    TestSuite.new()
    |> TestSuite.passed()
  end

  test "that it implements inspect" do
    t = TestSuite.new()

    assert inspect(t) =~ ~r/\A#TestCase<0 tests>/
  end
end
