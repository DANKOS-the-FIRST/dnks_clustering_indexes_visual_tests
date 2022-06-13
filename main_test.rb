require "test/unit"
require "bigdecimal"
require "index_calculator"
require "gruff"
class CalculationsTest < Test::Unit::TestCase
  def setup
  end
  def test_one_dataset_from_test_file
    labels = %w[x y]
    calc = IndexCalculator.new([], labels, 7)
    filename = "#{Dir.pwd}/test_data/5.txt"

    puts "Started testing for ''#{filename}''"
    calc.load_data_from_file(filename)
    test_data = calc.data
    # puts "Data from file: '#{test_data}"

    xs = []
    ys = []

    test_data.each do |point|
      xs.push point[0]
      ys.push point[1]
    end
    g = Gruff::Scatter.new(1200)
    g.title = '5.txt data'
    g.data(:points, xs, ys)
    g.write("#{Dir.pwd}/test_data/5txt_graph.png")
    calc.data
    calc.build_by_kmeans_clustering
    calc.find_all_optimal_k_indexes

    calc.show_all_indexes_table

    calc.show_optimal_k_indexes_table
    assert true
  end
end