 DEMO Store

Built with Ruby-on-Rails 5.1

Covered with RSpec tests
 -------------------------------------------

 DB Relations:

 Category has_many Product

 Cart has_many LineItem

 Order has_many LineItem

 User has_one Cart

 User has_one Order

 Product has_many LineItem

-------------------------------------------

Scaffolding:

rails g scaffold Category title:string discount:integer

rails g scaffold Product title:string description:text category:belongs_to price:decimal{8.2} salescount:integer

rails g scaffold Cart user:belongs_to

rails g scaffold Order user:belongs_to pay_type:string

rails g scaffold LineItem cart:belongs_to order:belongs_to product:belongs_to quantity:integer

-------------------------------------------

NOTE:

At the time of the purchase LineItem is simply moved from Cart to Order.

--------------------

Admin area scaffolding:

rails g admin:scaffold_controller Category title:string discount:integer

rails g admin:scaffold_controller Product title:string description:text category:belongs_to price:decimal{8.2} salescount:integer

rails g admin:scaffold_controller Cart user:belongs_to

rails g admin:scaffold_controller Order user:belongs_to pay_type:string

rails g admin:scaffold_controller LineItem cart:belongs_to order:belongs_to product:belongs_to quantity:integer

rails g admin:scaffold_controller User name:string address:string