require_relative 'separate_chaining'

my_hash = SeparateChaining.new(6)
my_hash["foo"] = "bar"
my_hash["a"] = "b"
my_hash["best_movie"] = "interstellar"
my_hash["another"] = "test"
my_hash.print_hash()