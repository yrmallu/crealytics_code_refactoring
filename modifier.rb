require_relative 'lib/modifier_code'
require_relative 'lib/csv_manager'
include Constant

csv_manager = CSVManager.new('project_2012-07-27_2012-10-10_performancedata')
modifier = ModifierCode.new(MODIFICATION_FACTOR, CANCELLATION_FACTOR)
modifier.modify(csv_manager)

puts "DONE modifying"
