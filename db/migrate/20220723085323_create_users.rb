class CreateUsers < ActiveRecord::Migration[7.0]
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
  end
end
