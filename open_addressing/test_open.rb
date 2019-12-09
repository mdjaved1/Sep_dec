require_relative 'open_addressing'

my_hash = OpenAddressing.new(6)
my_hash["foo"] = "bar"
my_hash["a"] = "b"
my_hash["best_movie"] = "interstellar"
my_hash["another"] = "test"
my_hash.print_hash()