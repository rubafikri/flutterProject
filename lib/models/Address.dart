
class Address {

	int _id;
	String _name;
	String _addressLine;
  String _city;
  String _portalCode;
  String _phoneNumber;
  
	
	

	Address(this._name,this._addressLine, this._city , this._portalCode, this._phoneNumber);

	Address.withId(this._id, this._name,this._addressLine, this._city , this._portalCode, this._phoneNumber);

	int get id => _id;

	String get name => _name;

	String get addressLine => _addressLine;
  String get city => _city;
    String get portalCode => _portalCode;
  String get phoneNumber => _phoneNumber;




	set name(String newname) {
		if (newname.length <= 255) {
			this._name = newname;
		}
	}

	set addressLine(String newaddressLine) {
		if (newaddressLine.length <= 255) {
			this._addressLine = newaddressLine;
		}
	}


	set city(String newcity) {
		if (newcity.length <= 255) {
			this._city = newcity;
		}
	}
  	set portalCode(String newportalCode) {
		if (newportalCode.length <= 255) {
			this._portalCode = newportalCode;
		}
	}
  	set phoneNumber(String newphoneNumber) {
		if (newphoneNumber.length <= 255) {
			this._phoneNumber = newphoneNumber;
		}
	}


	// Convert a Note object into a Map object
	Map<String, dynamic> toMap() {

		var map = Map<String, dynamic>();
		if (id != null) {
			map['id'] = _id;
		}
		map['name'] = _name;
		map['addressLine'] = _addressLine;
    map['city'] = _city;
  

		return map;
	}

	// Extract a Note object from a Map object
	Address.fromMapObject(Map<String, dynamic> map) {
		this._id = map['id'];
		this._name = map['name'];
		this._addressLine = map['addressLine'];
    this._city = map['city'];
        this._portalCode = map['portalCode'];
    this._phoneNumber = map['phoneNumber'];

	}
}









