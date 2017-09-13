note
	description: "Corrected student version of WORD_ANALYZER"
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	WORD_ANALYZER_STUDENT
inherit
	WORD_ANALYZER_INTERFACE

create
	make

feature -- commands

	first_repeated_character: CHARACTER
		 -- returns first repeated character or null character if none found
		 -- a character is repeated if it occurs at least twice in adjacent positions
		 -- e.g. 'l' is repeated in "hollow", but 'o' is not.
		local
			i: INTEGER
			ch: CHARACTER
			stop: BOOLEAN
		do
			from
				i := 1
				Result := '%U' -- not needed due to default initilization
			until
				i > word.count - 1 or stop
			loop

				ch := word[i]
				if ch = word[i+1] then
					Result := ch
					stop := true
				end
				i := i + 1
			end
		end

	first_multiple_character: CHARACTER
		-- Returns first multiply occuring character, or null if not found.
		-- A character is multiple if it occurs twice in a word,
		-- not neceassarily in adajacent positions.
		-- E.g. both 'o' and 'l' are multiple in "hollow", but 'h' is not.
		local
			i: INTEGER
			ch: CHARACTER
			stop: BOOLEAN
		do
			from
				i := 1
				Result := '%U'
			until
				i > word.count or stop
			loop
				ch := word[i]
				if find(ch,i + 1) > 0 then
					Result := ch
					stop := true
				end
				i := i + 1
			end

		end

	count_repeated_characters: INTEGER
			-- counts groups of repeated characters.
			-- e.g., 'mississippi!!!' has 4 groups: ss, ss, pp and !!!.
			-- returns the number of such character groups
		local
			i: INTEGER
			nr: INTEGER -- number of repititions
		do
			from
				i := 1
				nr := 0
			until
				i >= word.count - 1
			loop
				if word[i] = word[i+1] then -- found repitition
					if i = 1 then -- if its the first character don't look back
						nr := nr + 1
					else
						if word[i-1] /= word[i] then -- look back to see if it's the start
							nr := nr + 1
						end
					end
				end
				i := i + 1
			end
			Result := nr
		end

feature -- utilities
	find(c: CHARACTER; position: INTEGER): INTEGER
			-- returns index of 'c' in word
			-- in range position(inclusive)..word.count(inclusive)
			-- if c is not found, 0 is returned
		require
			correct_position:
				position >= 1 and position <= word.count
		local
			i: INTEGER
			stop: BOOLEAN
		do
			from
				i := position
				Result := 0 -- default
			until
				i > word.count or stop
			loop
				if c = word[i] then
					Result := i
					stop := true
				end
				i := i + 1
			end
		ensure
			correct_index:
				Result = 0 or Result > 0 and word[Result] = c
		end


end
