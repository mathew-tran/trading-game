extends Panel

class_name CardHoldArea

func GetSlots():
	return $CardHolder.get_children()

func GetNextOpenSlot() -> CardSlot:
	for slot in $CardHolder.get_children():
		if slot.IsOccupied() == false:
			return slot
	return null
	
func GetNextUsedSlot() -> CardSlot:
	for slot in $CardHolder.get_children():
		if slot.IsOccupied():
			return slot
	return null
