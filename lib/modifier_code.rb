require_relative './class_extensions/float'
require_relative './class_extensions/string'
require_relative './constant'
require_relative './combiner'
class ModifierCode

  include Constant

  def initialize(saleamount_factor, cancellation_factor)
    @saleamount_factor = saleamount_factor
    @cancellation_factor = cancellation_factor
  end

  def modify(csv_manager)
    input_enumerator = csv_manager.sort_by_clicks.lazy_read
    combiner = get_combiner(input_enumerator)
    merger = get_merger(combiner)
    csv_manager.write(merger)
  end

  private

    # combine the data with respective to key
    def get_combiner(input_enumerator)
      Combiner.new do |value|
        value[KEYWORD_UNIQUE_ID]
      end.combine(input_enumerator)
    end

    # merge data 
    def get_merger(combiner)
      Enumerator.new do |yielder|
        combiner.each do |list_of_rows|
          merged_hashes = combine_hashes(list_of_rows)
          yielder.yield(combine_values(merged_hashes))
        end
      end
    end

    def combine(merged)
      result = []
      merged.each do |_, hash|
        result << combine_values(hash)
      end
      result
    end

    def combine_values(hash)
      LAST_VALUE_WINS.each do |key|
        hash[key] = hash[key].last
      end
      LAST_REAL_VALUE_WINS.each do |key|
        hash[key] = hash[key].select {|v| !(v.nil? || v == 0 || v == '0' || v == '')}.last
      end
      INT_VALUES.each do |key|
        hash[key] = hash[key][0].to_s
      end
      FLOAT_VALUES.each do |key|
        hash[key] = hash[key][0].from_german_to_f.to_german_s
      end
      NUMBER_OF_COMMISSIONS.each do |key|
        hash[key] = (@cancellation_factor * hash[key][0].from_german_to_f).to_german_s
      end
      COMMISSION_VALUES.each do |key|
        hash[key] = (@cancellation_factor * @saleamount_factor * hash[key][0].from_german_to_f).to_german_s
      end
      hash
    end

    def combine_hashes(list_of_rows)
      keys = list_of_rows.compact.map(&:headers).flatten
      keys.reduce({}) do |result, key|
        result[key] = list_of_rows.map{|row| row.nil? ? nil : row[key] }
        result
      end
    end

end
