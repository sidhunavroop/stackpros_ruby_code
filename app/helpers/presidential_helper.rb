module PresidentialHelper

    def firstName_reverse_split(full_name)
        return full_name.split(" ")[0].reverse
    end

    def party_abbreviation(party_name)
        party_name_parts = party_name.split(/[\s-]+/)
        party_name_first_part = "#{party_name_parts[0]}"
        party_name_next_part = "#{party_name_parts[1]}"
        abbreviation = "#{party_name_first_part[0]}" + "#{party_name_next_part[0]}"
        return abbreviation
    end

    def term_split(term_duration)
        return term_duration.split('-')[0]
    end

end
