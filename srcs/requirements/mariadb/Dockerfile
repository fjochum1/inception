FROM debian:bullseye

# Update the package lists and install MariaDB
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install mariadb-server -y

EXPOSE 3306

# Copy the MariaDB configuration file
RUN 	mkdir -p /var/run/mysqld && chown -R mysql:mysql /var/run/mysqld && chmod 755 /var/run/mysqld
COPY	./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY	./tools/initialize-db.sh /usr/local/bin/initialize-db.sh
RUN		chmod 755 /usr/local/bin/initialize-db.sh

CMD ["/usr/local/bin/initialize-db.sh"]
