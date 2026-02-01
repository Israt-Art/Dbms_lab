Table users {
  username varchar [pk] 
  email varchar [unique]
  password_hash varchar
  reward_points int [default]
  join_date date [default]
  status varchar [default]
}
Table categories {
  category_id int [pk, increment]
  category_name varchar [unique, not null]
}
Table products {
  product_id int [pk, increment]
  item_name varchar [not null] 
  price_tk decimal 
  category_id int
  is_recommended boolean [default: false]
}
Table orders {
  order_id varchar [pk] 
  customer_username varchar
  order_time time
  total_tk decimal
  payment_method varchar 
  order_status varchar 
}
Table reviews {
  review_id int [pk, increment]
  username varchar
  rating decimal 
  comment text
  created_at timestamp
}

