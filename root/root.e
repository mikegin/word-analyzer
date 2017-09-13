note
	description : "[
		Word-Analyzer application root class.
		You may add your own tests in the place indicated below. 
		Do not remove STUDENT and INSTRUCTOR tests.
			]"
	date        : "$Date$"
	revision    : "$Revision$"

class
	ROOT
inherit
	ARGUMENTS
	ES_SUITE
create
	make

feature {NONE} -- Initialization

	make
			-- run student and instuctor tests
			-- instructor tests succeed
		do
			add_test (create {INSTRUCTOR_TESTS}.make)
			add_test (create {MY_TESTS}.make)
			add_test (create {STUDENT_TESTS}.make)
			show_browser
			run_espec
		end

end
