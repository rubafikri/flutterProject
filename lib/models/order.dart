
class Order {

	int _id;
	String _title;
	String _description;
  String _price;
  
	
	

	Order(this._title,this._price, [this._description]);

	Order.withId(this._id, this._title,this._price, [this._description]);

	int get id => _id;

	String get title => _title;

	String get description => _description;
  String get price => _price;



	set title(String newTitle) {
	
			this._title = newTitle;
		
	}

	set description(String newDescription) {
		
			this._description = newDescription;
		
	}


	set price(String newPrice) {
	
			this._price = newPrice;
		
	}


	// Convert a Note object into a Map object
	Map<String, dynamic> toMap() {

		var map = Map<String, dynamic>();

		map['title'] = _title;
		map['description'] = _description;
    map['price'] = _price;

		return map;
	}

	// Extract a Note object from a Map object
	Order.fromMapObject(Map<String, dynamic> map) {
		this._id = map['id'];
		this._title = map['title'];
		this._description = map['description'];
    this._price = map['price'];
	}
}









