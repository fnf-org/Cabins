seeds = %w[users instants tiers cabins payments posts]

@year = Time.new.year
seed_start = Time.now
seeds.each do |file|
  path = "./seed/#{file}"
  start = Time.now
  print "Seeding #{path}..."
  require_relative path
  puts "Done. [#{Time.now - start}s]"
end
puts "Total time: #{Time.now - seed_start}s"
