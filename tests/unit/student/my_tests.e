note
	description: "[
		Students shall write unit tests that cause the bad routines to fail;
		and the good routines in WORD_ANALYZER_STUDENT to succeed.
		Don't change the names of the tests.
		Fill in the tests below where it says TO DO.
		]"
	author: "cse04"
	date: "$Date$"
	revision: "$Revision$"

class
	MY_TESTS

inherit
	ES_TEST

create
	make

feature {NONE} -- Initialization

	make
			-- run student tests
		do
			add_boolean_case (agent t1)
			add_boolean_case (agent t2)
			add_boolean_case (agent t3)
			add_boolean_case (agent t4)
			add_boolean_case (agent t5)
			add_boolean_case (agent t6)
			add_boolean_case (agent t7)
			add_boolean_case (agent t8)
			add_boolean_case (agent t9)
			add_boolean_case (agent t10)
		end

feature -- tests
	frc_empty_string : STRING = ""
	t1 : BOOLEAN
		local
			wa: WORD_ANALYZER_INTERFACE
		do
			comment ("t1: Test empty string on first_repeated_character")
			create {WORD_ANALYZER_STUDENT} wa.make (frc_empty_string)
			Result := wa.first_repeated_character = '%U'
		end

	frc_single_char_string : STRING = "a"
	t2 : BOOLEAN
		local
			wa: WORD_ANALYZER_INTERFACE
		do
			comment ("t2: Test single character string on first_repeated_character")
			create {WORD_ANALYZER_STUDENT} wa.make (frc_empty_string)
			Result := wa.first_repeated_character = '%U'
		end

	fmc_empty_string : STRING = ""
	t3 : BOOLEAN
		local
			wa: WORD_ANALYZER_INTERFACE
		do
			comment ("t3: Test empty string on first_multiple_character")
			create {WORD_ANALYZER_STUDENT} wa.make (fmc_empty_string)
			Result := wa.first_multiple_character = '%U'
		end

	fmc_single_char_string : STRING = "a"
	t4 : BOOLEAN
		local
			wa: WORD_ANALYZER_INTERFACE
		do
			comment ("t4: Test single character string on first_multiple_character")
			create {WORD_ANALYZER_STUDENT} wa.make (fmc_empty_string)
			Result := wa.first_multiple_character = '%U'
		end

	fmc_middle_adjacent : STRING = "aooobb"
	t5 : BOOLEAN
		local
			wa: WORD_ANALYZER_INTERFACE
		do
			comment ("t5: Test string with identical multiple characters in in the middle adjacent to one another on first_multiple_character")
			create {WORD_ANALYZER_STUDENT} wa.make (fmc_middle_adjacent)
			Result := wa.first_multiple_character = 'o'
		end

	fmc_multiple_within : STRING = "obbo"
	t6 : BOOLEAN
		local
			wa: WORD_ANALYZER_INTERFACE
		do
			comment ("t6: Test string with identical multiple characters surrounded by other identical multiple characters on first_multiple_character")
			create {WORD_ANALYZER_STUDENT} wa.make (fmc_multiple_within)
			Result := wa.first_multiple_character = 'o'
		end

	crc_empty_string : STRING = ""
	t7 : BOOLEAN
		local
			wa: WORD_ANALYZER_INTERFACE
		do
			comment ("t7: Test empty string on count_repeated_characters")
			create {WORD_ANALYZER_STUDENT} wa.make (crc_empty_string)
			Result := wa.count_repeated_characters = 0
		end

	crc_single_char_string : STRING = "a"
	t8 : BOOLEAN
		local
			wa: WORD_ANALYZER_INTERFACE
		do
			comment ("t8: Test single character string on count_repeated_characters")
			create {WORD_ANALYZER_STUDENT} wa.make (frc_empty_string)
			Result := wa.count_repeated_characters = 0
		end

	crc_mississippi : STRING = "mississippi!!!"
	t9 : BOOLEAN
		local
			wa: WORD_ANALYZER_INTERFACE
		do
			comment ("t9: Test string mississippi!!! on count_repeated_characters")
			create {WORD_ANALYZER_STUDENT} wa.make (crc_mississippi)
			Result := wa.count_repeated_characters = 4
		end

	crc_no_repeating_characters : STRING = "lolololol"
	t10 : BOOLEAN
		local
			wa: WORD_ANALYZER_INTERFACE
		do
			comment ("t10: Test no repeating characters on count_repeated_characters")
			create {WORD_ANALYZER_STUDENT} wa.make (crc_no_repeating_characters)
			Result := wa.count_repeated_characters = 0
		end
end
