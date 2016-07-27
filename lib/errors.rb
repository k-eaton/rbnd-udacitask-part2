module UdaciListErrors
  class IndexExceedsListSize < StandardError
  end

  class InvalidItemType < StandardError
  end

  class InvalidPriorityValue < StandardError
  end
end
