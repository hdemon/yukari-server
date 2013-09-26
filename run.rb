require 'watchr'

watch("./app/*\.rb") {|md| puts md;system("ruby #{md[0]}")}
