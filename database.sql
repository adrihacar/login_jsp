CREATE TABLE `users` (
  `name` varchar(200) NOT NULL,
  `surname` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `salt` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL
);
ALTER TABLE `users`
  ADD PRIMARY KEY (`email`);
