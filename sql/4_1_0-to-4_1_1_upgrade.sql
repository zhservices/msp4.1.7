--
--  Comment Meta Language Constructs:
--
--  #IfNotTable
--    argument: table_name
--    behavior: if the table_name does not exist,  the block will be executed

--  #IfTable
--    argument: table_name
--    behavior: if the table_name does exist, the block will be executed

--  #IfMissingColumn
--    arguments: table_name colname
--    behavior:  if the colname in the table_name table does not exist,  the block will be executed

--  #IfNotColumnType
--    arguments: table_name colname value
--    behavior:  If the table table_name does not have a column colname with a data type equal to value, then the block will be executed

--  #IfNotRow
--    arguments: table_name colname value
--    behavior:  If the table table_name does not have a row where colname = value, the block will be executed.

--  #IfNotRow2D
--    arguments: table_name colname value colname2 value2
--    behavior:  If the table table_name does not have a row where colname = value AND colname2 = value2, the block will be executed.

--  #IfNotRow3D
--    arguments: table_name colname value colname2 value2 colname3 value3
--    behavior:  If the table table_name does not have a row where colname = value AND colname2 = value2 AND colname3 = value3, the block will be executed.

--  #IfNotRow4D
--    arguments: table_name colname value colname2 value2 colname3 value3 colname4 value4
--    behavior:  If the table table_name does not have a row where colname = value AND colname2 = value2 AND colname3 = value3 AND colname4 = value4, the block will be executed.

--  #IfNotRow2Dx2
--    desc:      This is a very specialized function to allow adding items to the list_options table to avoid both redundant option_id and title in each element.
--    arguments: table_name colname value colname2 value2 colname3 value3
--    behavior:  The block will be executed if both statements below are true:
--               1) The table table_name does not have a row where colname = value AND colname2 = value2.
--               2) The table table_name does not have a row where colname = value AND colname3 = value3.

--  #IfNotIndex
--    desc:      This function will allow adding of indexes/keys.
--    arguments: table_name colname
--    behavior:  If the index does not exist, it will be created

--  #EndIf
--    all blocks are terminated with and #EndIf statement.


#IfNotIndex lists type
CREATE INDEX `type` ON `lists` (`type`);
#EndIf

#IfNotIndex lists pid
CREATE INDEX `pid` ON `lists` (`pid`);
#EndIf

#IfNotIndex form_vitals pid
CREATE INDEX `pid` ON `form_vitals` (`pid`);
#EndIf

#IfNotIndex forms pid
CREATE INDEX `pid` ON `forms` (`pid`);
#EndIf

#IfNotIndex form_encounter pid
CREATE INDEX `pid` ON `form_encounter` (`pid`);
#EndIf

#IfNotIndex immunizations patient_id
CREATE INDEX `patient_id` ON `immunizations` (`patient_id`);
#EndIf

#IfNotIndex procedure_order patient_id
CREATE INDEX `patient_id` ON `procedure_order` (`patient_id`);
#EndIf

#IfNotIndex pnotes pid
CREATE INDEX `pid` ON `pnotes` (`pid`);
#EndIf

#IfNotIndex transactions pid
CREATE INDEX `pid` ON `transactions` (`pid`);
#EndIf

#IfNotIndex extended_log patient_id
CREATE INDEX `patient_id` ON `extended_log` (`patient_id`);
#EndIf

#IfNotIndex prescriptions patient_id
CREATE INDEX `patient_id` ON `prescriptions` (`patient_id`);
#EndIf

#IfMissingColumn version v_realpatch
ALTER TABLE `version` ADD COLUMN `v_realpatch` int(11) NOT NULL DEFAULT 0;
#EndIf

#IfMissingColumn prescriptions drug_info_erx
ALTER TABLE `prescriptions` ADD COLUMN `drug_info_erx` TEXT DEFAULT NULL;
#EndIf

#IfMissingColumn ar_activity ded_amount
ALTER TABLE `ar_activity` ADD COLUMN `ded_amount` DECIMAL(12,2) DEFAULT '0.00' NULL AFTER `adj_amount`;
#EndIf

#IfMissingColumn ar_activity grp_code
ALTER TABLE `ar_activity` ADD COLUMN `grp_code` VARCHAR(10) NULL AFTER `reason_code`;
#EndIf

#IfMissingColumn ar_activity grp_code
ALTER TABLE `ar_activity` ADD COLUMN `rsn_code` VARCHAR(10) NULL AFTER `grp_code`;
#EndIf

#IfMissingColumn ar_activity ins_adjud_date
ALTER TABLE `ar_activity` ADD COLUMN `ins_adjud_date` DATE NULL AFTER `rsn_code`;
#EndIf

#IfNotRow2D list_options list_id lists option_id MSP_Categories
INSERT INTO list_options ( list_id, option_id, title, seq, notes ) VALUES ('lists'   ,'MSP_Categories','MSP Categories', 1,'');
INSERT INTO list_options ( list_id, option_id, title, seq, notes ) VALUES ('MSP_Categories', '15', 'Workers’ Compensation', 60, 'Insurance that employers are required to provide to cover employees who become sick or are injured on the job. Note: This type has no age restrictions.');
INSERT INTO list_options ( list_id, option_id, title, seq, notes ) VALUES ('MSP_Categories', '16', 'Federal Agency (Public Health)', 50, 'Services that are the direct obligation of another federal, state or local governmental entity.');
INSERT INTO list_options ( list_id, option_id, title, seq, notes ) VALUES ('MSP_Categories', '41', 'Federal Black Lung', 60, 'Coverage due to black lung disease and other respiratory conditions caused by coal mining, where a Medicare beneficiary may be entitled to have services reimbursed by the United States Department of Labor');
INSERT INTO list_options ( list_id, option_id, title, seq, notes ) VALUES ('MSP_Categories', '14', 'Automobile/No-Fault', 30, 'Insurance coverage (including a self-insured plan) that pays for medical expenses for injuries sustained on the property or premises of the insured, or in the use, occupancy or operation of an automobile regardless of who may have been responsible for cau');
INSERT INTO list_options ( list_id, option_id, title, seq, notes ) VALUES ('MSP_Categories', '13', 'End Stage Renal Disease (ESRD)', 20, 'Beneficiaries enrolled with Medicare solely due to renal failure and are insured through their own, or through a family member’s former or current employment. Note: This type has no age restrictions.');
INSERT INTO list_options ( list_id, option_id, title, seq, notes ) VALUES ('MSP_Categories', '12', 'Working Aged', 10, 'Beneficiaries age 65 or older who are insured through their or their spouses’ current employment. Employer’s group plan has 20 or more employees. Note: This type must only be used for beneficiaries who are 65 years old or older on the date the service was');
INSERT INTO list_options ( list_id, option_id, title, seq, notes ) VALUES ('MSP_Categories', '42', 'Veterans Affairs', 70, 'Veterans who are Medicare-eligible may elect whether Medicare or VA benefits will handle their claims. Note: This type has no age restrictions.');
INSERT INTO list_options ( list_id, option_id, title, seq, notes ) VALUES ('MSP_Categories', '43', 'Disability', 80, 'Beneficiaries under the age of 65, who are disabled and insured through their current employment or through the current employment of a family member. The plan has 100 or more employees. Note: If the basis of disability is ESRD, the ESRD type should be us');
#EndIf

#IfMissingColumn insurance_data msp_category
ALTER TABLE insurance_data ADD COLUMN msp_category int(11) DEFAULT NULL COMMENT 'references option_id in MSP_Categories list';
#EndIf

#IfNotRow2D list_options list_id lists option_id payment_group_codes
INSERT INTO list_options ( list_id, option_id, title, seq ) VALUES ('lists'   ,'payment_group_codes','Payment Group Codes', 1);
INSERT INTO list_options ( list_id, option_id, title, seq ) VALUES ('payment_group_codes', 'CO', 'CO', 60);
INSERT INTO list_options ( list_id, option_id, title, seq ) VALUES ('payment_group_codes', 'CR', 'CR', 50);
INSERT INTO list_options ( list_id, option_id, title, seq ) VALUES ('payment_group_codes', 'OA', 'OA', 60);
INSERT INTO list_options ( list_id, option_id, title, seq ) VALUES ('payment_group_codes', 'PI', 'PI', 30);
INSERT INTO list_options ( list_id, option_id, title, seq ) VALUES ('payment_group_codes', 'PR', 'PR ', 20);
#EndIf