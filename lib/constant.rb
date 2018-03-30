module Constant

  KEYWORD_UNIQUE_ID = 'Keyword Unique ID'
  LAST_VALUE_WINS =
    " Account ID
      Account Name
      Campaign
      Ad Group
      Keyword
      Keyword Type
      Subid
      Paused
      Max CPC
      Keyword Unique ID
      ACCOUNT
      CAMPAIGN
      BRAND
      BRAND+CATEGORY
      ADGROUP
      KEYWORD".
      split("\n").map(&:strip)

  LAST_REAL_VALUE_WINS =
    " Last Avg CPC
      Last Avg Pos".
      split("\n").map(&:strip)

  INT_VALUES =
    " Clicks
      Impressions
      ACCOUNT - Clicks
      CAMPAIGN - Clicks
      BRAND - Clicks
      BRAND+CATEGORY - Clicks
      ADGROUP - Clicks
      KEYWORD - Clicks".
      split("\n").map(&:strip)

  FLOAT_VALUES =
    " Avg CPC
      CTR
      Est EPC
      newBid
      Costs
      Avg Pos".
      split("\n").map(&:strip)

  NUMBER_OF_COMMISSIONS = ['number of commissions']

  COMMISSION_VALUES =
    " Commission Value
      ACCOUNT - Commission Value
      CAMPAIGN - Commission Value
      BRAND - Commission Value
      BRAND+CATEGORY - Commission Value
      ADGROUP - Commission Value
      KEYWORD - Commission Value".
      split("\n").map(&:strip)

  LINES_PER_FILE = 120_000

  CSV_READ_OPTIONS = { col_sep: "\t", headers: :first_row }

  CSV_WRITE_OPTIONS = CSV_READ_OPTIONS.merge({ row_sep: "\r\n" })

  DATE_FORMAT = /\d+-\d+-\d+/

  FILE_NAME_FORMAT = /\d+-\d+-\d+_[[:alpha:]]+\.txt$/

  MODIFICATION_FACTOR = 1
  CANCELLATION_FACTOR = 0.4
end
