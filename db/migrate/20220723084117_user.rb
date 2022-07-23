class User < ActiveRecord::Migration[7.0]
  def change
    execute <<-SQL
    CREATE TABLE IF NOT EXISTS `users` (
      `createdAt` datetime(6) NOT NULL DEFAULT current_timestamp(6),
      `updatedAt` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
      `id` int(11) NOT NULL AUTO_INCREMENT,
      `email` varchar(100) NOT NULL,
      `nickname` varchar(10) NOT NULL,
      `profileImage` varchar(255) NOT NULL,
      PRIMARY KEY (`id`),
      KEY `indexUserEmail` (`email`),
      KEY `indexUserNickname` (`nickname`)
    )
    SQL

    execute <<-SQL
    CREATE TABLE IF NOT EXISTS `tokens` (
      `id` varchar(36) NOT NULL,
      `accessToken` varchar(250) NOT NULL,
      `refreshToken` varchar(350) NOT NULL,
      `userID` int(11) DEFAULT NULL,
      PRIMARY KEY (`id`),
      UNIQUE KEY `REL_b1c8805a09a8ee2f22e6879e58` (`userID`),
      CONSTRAINT `FK_b1c8805a09a8ee2f22e6879e589` FOREIGN KEY (`userID`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
    );
    
    SQL
  end
end
