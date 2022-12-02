# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aliburdi <aliburdi@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/02 11:36:17 by aliburdi          #+#    #+#              #
#    Updated: 2022/12/02 15:20:11 by aliburdi         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CLIENT = client
SERVER = server

CFLAGS = -Wall -Wextra -Werror

SRCS =	server.c client.c ft_put_fd.c

OBJ = $(SRCS:%.c=%.o)

SERVERSRC = server.o ft_put_fd.o
CLIENTSRC = client.o ft_put_fd.o

CC = gcc

RM = rm -rf

all: $(CLIENT) $(SERVER)

$(CLIENT): $(OBJ)
			$(CC) $(CFLAGS) $(CLIENTSRC) -o $(CLIENT)

$(SERVER): $(OBJ)
			$(CC) $(CFLAGS) $(SERVERSRC) -o $(SERVER)

$(OBJ): $(SRCS)
	$(CC) $(CFLAGS) -c $(SRCS)


norme:
		@norminette $(SRCS)

clean:
			$(RM) $(OBJ)

fclean:		clean
			$(RM) $(CLIENT) $(SERVER)

re:			fclean all

.PHONY: all clean fclean re