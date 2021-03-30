class Validator < Kimurai::Pipeline
  def process_item(item, options: {})
    # Here you can validate item and raise `DropItemError`
    # if one of the validations failed. Examples:

    # Check item stock number for uniqueness using buit-in unique? helper:
    # unless unique?(stock_number: item[:stock_number])
    #   raise DropItemError, "Item is not unique"
    # end

    # Drop item if title length shorter than 5 symbols:
    # if item[:title].size < 5
    #   raise DropItemError, "Item title is too short"
    # end

    # Drop item if it doesn't contains any images:
    # unless item[:images].present?
    #   raise DropItemError, "Item images are not present"
    # end

    # Pass item to the next pipeline (if it wasn't dropped)
    item
  end
end
