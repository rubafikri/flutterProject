
class Note {

	int _id;
	String _title;
	String _description;
  String _price;
  
	
	

	Note(this._title,this._price, [this._description]);

	Note.withId(this._id, this._title,this._price, [this._description]);

	int get id => _id;

	String get title => _title;

	String get description => _description;
  String get price => _price;



	set title(String newTitle) {
		if (newTitle.length <= 255) {
			this._title = newTitle;
		}
	}

	set description(String newDescription) {
		if (newDescription.length <= 255) {
			this._description = newDescription;
		}
	}


	set price(String newPrice) {
		if (newPrice.length <= 255) {
			this._price = newPrice;
		}
	}


	// Convert a Note object into a Map object
	Map<String, dynamic> toMap() {

		var map = Map<String, dynamic>();
		if (id != null) {
			map['id'] = _id;
		}
		map['title'] = _title;
		map['description'] = _description;
    map['price'] = _price;

		return map;
	}

	// Extract a Note object from a Map object
	Note.fromMapObject(Map<String, dynamic> map) {
		this._id = map['id'];
		this._title = map['title'];
		this._description = map['description'];
    this._price = map['price'];
	}
}









