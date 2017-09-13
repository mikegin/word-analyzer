note
	description: "[
		Instructor tests.
	]"
	author: "JSO"
	date: "$Date$"
	revision: "$Revision$"

class
	INSTRUCTOR_TESTS
inherit
	ES_TEST
create
	make
feature {NONE} -- Initialization
	make
			--exercise version
			-- run succesful tests; skip tests that fail
		do
				-- first repeated char
			add_boolean_case (agent t_frc1) -- succeeds in bad analyzer

				-- first multiple character
			add_boolean_case (agent t_fmc1) -- succeeds in bad analyzer

				-- count repeated chars
			add_boolean_case (agent t_crc1)

		end

feature -- tests first repeated character

	t_frc1: BOOLEAN
			-- succeeds in bad analyzer
		local
			wa: WORD_ANALYZER_INTERFACE
		do
			comment("t_frc1: first repeated character for 'hollow' is 'l'")
			create {WORD_ANALYZER_BAD} wa.make ("hollow")
			Result := wa.first_repeated_character = 'l'
			assert ("'o' is not repeated",
				wa.first_repeated_character /= 'o',
				wa.first_repeated_character)
		end

feature -- tests first multiple character
	t_fmc1: BOOLEAN
		local
			wa: WORD_ANALYZER_INTERFACE
		do
			comment("t_fmc1: first multiple character in 'bob' is 'b'")
			create {WORD_ANALYZER_BAD} wa.make ("bob")
			Result := wa.first_multiple_character = 'b'
		end


feature -- test count repeated characters
	t_crc1: BOOLEAN
		local
			wa: WORD_ANALYZER_INTERFACE
			nr: INTEGER
		do
			comment("t_crc1: test count_repeated_character")
			sub_comment("'mississippi!!!' has 4 groups: ss, ss, pp and !!!.")
			create {WORD_ANALYZER_BAD} wa.make ("mississippi!!!")
			nr := wa.count_repeated_characters
			Result := nr = 4
		end
end


--%Exported from SVN%
--%2017-01-09:18:56:18%
--%mikegin%
