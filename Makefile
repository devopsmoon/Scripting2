print:		##Printing help messages
	@echo

frontend:	##Installing frontend components
	@sh 	components/frontend.sh

mongodb:	##Installing mongodb components
	@sh 	components/mongodb.sh

catalogue:	##Installing catalogue components
	@sh 	components/catalogue.sh

redis:		##Installing redis components
	@sh		components/redis.sh

user:		##Installing user components
	@sh 	components/user.sh

cart:		##Installing cart components
	@sh 	components/cart.sh

mysql:		##Installing mysql components
	@sh 	components/mysql.sh

shipping:	##Installing shipping components
	@sh 	components/shipping.sh

rmq:		##Installing rmq components
	@sh 	components/rmq.sh

payment:	##Installing payment components
	@sh 	components/payment.sh

