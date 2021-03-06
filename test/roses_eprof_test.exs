defmodule RosesEprofTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  alias Mix.Tasks.Profile.Cprof
  alias Mix.Tasks.Profile.Eprof
  alias Mix.Tasks.Profile.Fprof

  describe "testing_flow/0" do
    test "returns an output for cprof without erroring" do
      assert capture_io(fn -> Cprof.run(["-e", "RosesEprof.testing_flow"]) end) =~
               ~r(CNT     \nTotal)
    end

    test "returns an output for fprof without erroring" do
      some_of_the_output = "CNT    ACC (ms)    OWN (ms)"

      assert capture_io(fn -> Fprof.run(["-e", "RosesEprof.testing_flow"]) end) =~ some_of_the_output
    end

    test "returns an output for eprof, errors" do
      some_of_the_output = "it fails here."

      assert capture_io(fn -> Eprof.run(["-e", "RosesEprof.testing_flow"]) end) =~ some_of_the_output
    end
  end

  describe "testing_without_flow" do
    test "returns an output for cprof without erroring" do
      assert capture_io(fn -> Cprof.run(["-e", "RosesEprof.testing_without_flow"]) end) =~
               ~r(CNT     \nTotal)
    end

    test "returns an output for fprof without erroring" do
      some_of_the_output = "CNT    ACC (ms)    OWN (ms)"

      assert capture_io(fn -> Fprof.run(["-e", "RosesEprof.testing_without_flow"]) end) =~ some_of_the_output
    end

    test "returns an output for eprof" do
      some_of_the_output = "CALLS    % TIME µS/CALL"

      assert capture_io(fn -> Eprof.run(["-e", "RosesEprof.testing_without_flow"]) end) =~ some_of_the_output
    end
  end
end
