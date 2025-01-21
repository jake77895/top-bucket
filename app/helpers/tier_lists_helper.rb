module TierListsHelper
  # Maps ranks (S, A, B, C, D, F) to integer values
  def rank_value(rank)
    return nil unless rank.is_a?(String) # Ensure rank is a String
    mapping = {
      "S" => 1,
      "A" => 2,
      "B" => 3,
      "C" => 4,
      "D" => 5,
      "F" => 6
    }
    result = mapping[rank.upcase] # Normalize rank to uppercase
    Rails.logger.info "Mapping for '#{rank}': #{result.inspect}" # Log the mapping result
    result || nil # Returns `nil` if rank is invalid
  end
end