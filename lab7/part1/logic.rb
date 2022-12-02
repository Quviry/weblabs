# frozen_string_literal: true

# Logic-aggregation module
module Files
  def self.post_a(input_file, output_file)
    # rubocop:disable Rails/Pluck
    File.write(output_file, File.read(input_file).scan(/a./).map { |t| t[1] }.join)
    # rubocop:enable Rails/Pluck
  end
end
