ALTER TABLE `cfg_engine_hosts_relations` DROP FOREIGN KEY cfg_engine_hosts_relations_ibfk_2;
ALTER TABLE `cfg_engine_hosts_relations` DROP FOREIGN KEY cfg_engine_hosts_relations_ibfk_3;
DROP INDEX `nagios_server_id` ON `cfg_engine_hosts_relations`;
ALTER TABLE `cfg_engine_servers` CHANGE `ns_ip_address` `ip_address` VARCHAR(255);
ALTER TABLE `cfg_engine_servers` CHANGE `nagios_bin` `engine_bin` VARCHAR(255);
ALTER TABLE `cfg_engine_servers` CHANGE `nagiostats_bin` `enginestats_bin` VARCHAR(255);
ALTER TABLE `cfg_engine_servers` CHANGE `nagios_perfdata` `engine_perfdata` VARCHAR(255);
ALTER TABLE `cfg_engine_servers` CHANGE `init_script_centreontrapd` `init_script_snmptt` VARCHAR(255);
DELETE FROM cfg_custom_views_users_relations WHERE user_id IS NULL;
ALTER TABLE `cfg_custom_views_users_relations` CHANGE COLUMN `user_id` `user_id` INT(11) NOT NULL , ADD PRIMARY KEY (`custom_view_id`, `user_id`);
ALTER TABLE `cfg_hostgroups_hostgroups_relations` DROP FOREIGN KEY cfg_hostgroups_hostgroups_relations_ibfk_1;
ALTER TABLE `cfg_hostgroups_hostgroups_relations` DROP FOREIGN KEY cfg_hostgroups_hostgroups_relations_ibfk_2;
DROP TABLE `cfg_sessions`;
CREATE TABLE `cfg_sessions` (
    `session_id` VARCHAR(255) NOT NULL,
    `user_id` INT NOT NULL,
    `session_start_time` INT NOT NULL,
    `last_reload` INT NOT NULL,
    `ip_address` VARCHAR(45) NOT NULL,
    `route` VARCHAR(255) NOT NULL,
    `update_acl` BOOLEAN DEFAULT 0,
    PRIMARY KEY(`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE cfg_widgets_preferences DROP FOREIGN KEY fk_widget_view_id;
ALTER TABLE `cfg_options` ADD COLUMN `group` VARCHAR(255) NOT NULL DEFAULT 'default' FIRST;
ALTER TABLE `cfg_widgets_models` DROP `url`;