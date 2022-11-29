# frozen_string_literal: true

# Logic-aggregation module
module Files
  def self.post_a(input_file, output_file)
    File.write(output_file, File.read(input_file).scan(/a./).map { |t| t[1] }.join)
  end
end
