module TierListsHelper
  # Maps ranks (S, A, B, C, D, F) to integer values
  def rank_value(rank)
    mapping = {
      "S" => 1,
      "A" => 2,
      "B" => 3,
      "C" => 4,
      "D" => 5,
      "F" => 6
    }
    mapping[rank]
  end
end
