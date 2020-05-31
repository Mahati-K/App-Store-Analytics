//5. Load Reviews
call apoc.load.json("file:///appReviews.json") yield value
merge (ra:Review{reviewId:value.review_id})
set ra.title = value.title
set ra.body = value.body
set ra.star_rating = value.star_rating
set ra.date = value.date