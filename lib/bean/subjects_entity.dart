class SubjectsEntity {
	int total;
	List<SubjectsSubject> subjects;
	int count;
	int start;
	String title;

	SubjectsEntity({this.total, this.subjects, this.count, this.start, this.title});

	SubjectsEntity.fromJson(Map<String, dynamic> json) {
		total = json['total'];
		if (json['subjects'] != null) {
			subjects = new List<SubjectsSubject>();(json['subjects'] as List).forEach((v) { subjects.add(new SubjectsSubject.fromJson(v)); });
		}
		count = json['count'];
		start = json['start'];
		title = json['title'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['total'] = this.total;
		if (this.subjects != null) {
      data['subjects'] =  this.subjects.map((v) => v.toJson()).toList();
    }
		data['count'] = this.count;
		data['start'] = this.start;
		data['title'] = this.title;
		return data;
	}
}

class SubjectsSubject {
	SubjectsSubjectsImages images;
	List<SubjectsSubjectsCast> casts;
	String originalTitle;
	String subtype;
	String year;
	List<String> genres;
	List<SubjectsSubjectsDirector> directors;
	SubjectsSubjectsRating rating;
	String alt;
	String id;
	String title;
	int collectCount;

	SubjectsSubject({this.images, this.casts, this.originalTitle, this.subtype, this.year, this.genres, this.directors, this.rating, this.alt, this.id, this.title, this.collectCount});

	SubjectsSubject.fromJson(Map<String, dynamic> json) {
		images = json['images'] != null ? new SubjectsSubjectsImages.fromJson(json['images']) : null;
		if (json['casts'] != null) {
			casts = new List<SubjectsSubjectsCast>();(json['casts'] as List).forEach((v) { casts.add(new SubjectsSubjectsCast.fromJson(v)); });
		}
		originalTitle = json['original_title'];
		subtype = json['subtype'];
		year = json['year'];
		genres = json['genres']?.cast<String>();
		if (json['directors'] != null) {
			directors = new List<SubjectsSubjectsDirector>();(json['directors'] as List).forEach((v) { directors.add(new SubjectsSubjectsDirector.fromJson(v)); });
		}
		rating = json['rating'] != null ? new SubjectsSubjectsRating.fromJson(json['rating']) : null;
		alt = json['alt'];
		id = json['id'];
		title = json['title'];
		collectCount = json['collect_count'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.images != null) {
      data['images'] = this.images.toJson();
    }
		if (this.casts != null) {
      data['casts'] =  this.casts.map((v) => v.toJson()).toList();
    }
		data['original_title'] = this.originalTitle;
		data['subtype'] = this.subtype;
		data['year'] = this.year;
		data['genres'] = this.genres;
		if (this.directors != null) {
      data['directors'] =  this.directors.map((v) => v.toJson()).toList();
    }
		if (this.rating != null) {
      data['rating'] = this.rating.toJson();
    }
		data['alt'] = this.alt;
		data['id'] = this.id;
		data['title'] = this.title;
		data['collect_count'] = this.collectCount;
		return data;
	}
}

class SubjectsSubjectsImages {
	String small;
	String large;
	String medium;

	SubjectsSubjectsImages({this.small, this.large, this.medium});

	SubjectsSubjectsImages.fromJson(Map<String, dynamic> json) {
		small = json['small'];
		large = json['large'];
		medium = json['medium'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['small'] = this.small;
		data['large'] = this.large;
		data['medium'] = this.medium;
		return data;
	}
}

class SubjectsSubjectsCast {
	String alt;
	String name;
	String id;
	SubjectsSubjectsCastsAvatars avatars;

	SubjectsSubjectsCast({this.alt, this.name, this.id, this.avatars});

	SubjectsSubjectsCast.fromJson(Map<String, dynamic> json) {
		alt = json['alt'];
		name = json['name'];
		id = json['id'];
		avatars = json['avatars'] != null ? new SubjectsSubjectsCastsAvatars.fromJson(json['avatars']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['alt'] = this.alt;
		data['name'] = this.name;
		data['id'] = this.id;
		if (this.avatars != null) {
      data['avatars'] = this.avatars.toJson();
    }
		return data;
	}
}

class SubjectsSubjectsCastsAvatars {
	String small;
	String large;
	String medium;

	SubjectsSubjectsCastsAvatars({this.small, this.large, this.medium});

	SubjectsSubjectsCastsAvatars.fromJson(Map<String, dynamic> json) {
		small = json['small'];
		large = json['large'];
		medium = json['medium'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['small'] = this.small;
		data['large'] = this.large;
		data['medium'] = this.medium;
		return data;
	}
}

class SubjectsSubjectsDirector {
	String alt;
	String name;
	String id;
	SubjectsSubjectsDirectorsAvatars avatars;

	SubjectsSubjectsDirector({this.alt, this.name, this.id, this.avatars});

	SubjectsSubjectsDirector.fromJson(Map<String, dynamic> json) {
		alt = json['alt'];
		name = json['name'];
		id = json['id'];
		avatars = json['avatars'] != null ? new SubjectsSubjectsDirectorsAvatars.fromJson(json['avatars']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['alt'] = this.alt;
		data['name'] = this.name;
		data['id'] = this.id;
		if (this.avatars != null) {
      data['avatars'] = this.avatars.toJson();
    }
		return data;
	}
}

class SubjectsSubjectsDirectorsAvatars {
	String small;
	String large;
	String medium;

	SubjectsSubjectsDirectorsAvatars({this.small, this.large, this.medium});

	SubjectsSubjectsDirectorsAvatars.fromJson(Map<String, dynamic> json) {
		small = json['small'];
		large = json['large'];
		medium = json['medium'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['small'] = this.small;
		data['large'] = this.large;
		data['medium'] = this.medium;
		return data;
	}
}

class SubjectsSubjectsRating {
	double average;
	int min;
	int max;
	String stars;

	SubjectsSubjectsRating({this.average, this.min, this.max, this.stars});

	SubjectsSubjectsRating.fromJson(Map<String, dynamic> json) {
		average = json['average'];
		min = json['min'];
		max = json['max'];
		stars = json['stars'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['average'] = this.average;
		data['min'] = this.min;
		data['max'] = this.max;
		data['stars'] = this.stars;
		return data;
	}
}
