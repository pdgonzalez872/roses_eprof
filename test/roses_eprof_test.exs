defmodule RosesEprofTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  alias Mix.Tasks.Profile.Cprof
  alias Mix.Tasks.Profile.Eprof
  alias Mix.Tasks.Profile.Fprof

  test "returns an output for cprof" do
    assert capture_io(fn -> Cprof.run(["-e", "RosesEprof.testing_flow"]) end) =~
             ~r(GenStage                                                             952  <--)
  end

  test "returns an output for fprof" do
    some_of_the_output = "CNT    ACC (ms)    OWN (ms)"

    assert capture_io(fn -> Fprof.run(["-e", "RosesEprof.testing_flow"]) end) =~ some_of_the_output
  end

  test "returns an output for eprof" do
    some_of_the_output = "it fails here."

    assert capture_io(fn -> Eprof.run(["-e", "RosesEprof.testing_flow"]) end) =~ some_of_the_output
  end
end
