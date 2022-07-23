class Auth < ActiveRecord::Migration[7.0]
  def change
    execute <<-SQL
    CREATE TABLE IF NOT EXISTS `certifications` (
      `id` varchar(36) NOT NULL,
      `email` varchar(100) NOT NULL,
      `code` varchar(20) NOT NULL,
      `isSignup` tinyint(4) NOT NULL,
      `deleteTime` datetime NOT NULL,
      PRIMARY KEY (`id`),
      KEY `indexCertificationEmail` (`email`),
      KEY `indexCertificationCode` (`code`),
      KEY `IDX_716aee59ee337fe7c3967a34e0` (`deleteTime`)
    );
    SQL
  end
end
