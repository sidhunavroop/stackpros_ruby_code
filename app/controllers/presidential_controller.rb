class PresidentialController < ApplicationController
    include PresidentialHelper # This helper class has the definition of all 
                               # the methods used in this code
    
    # step 1 calls /create_csv
    # main index page
    def index
        return create_csv
    end

    # step 2 creates csv and downloads it
    def create_csv
        # create csv for JSON data
        csv_string = CSV.generate do |csv|
            # getting json data
            # creating string array of each row
            ary = JSON.parse(File.open("app/assets/javascripts/presidential.json").read)
            @list = ary
            # sorting on the basis of Name
            sorted_ary = @list.sort_by!{ |m| m['nm'] }
            csv << ["Name", "Party", "Presidential term", "President Number", "Ingestion Time"]
            sorted_ary.each do |hash|
                # excluding all parties with which have the word Federalist in their name
                if hash.values[3].include?("Federalist")
                    nil
                else
                    # reverse first name after splitting full name
                    hash['nm'] = firstName_reverse_split(hash.values[2])
                    # creating abbreviation for party
                    hash['pp'] = party_abbreviation(hash.values[3])
                    # extracting starting year of the term
                    hash['tm'] = term_split(hash.values[4])
                    # adding new column with timestamp
                    hash[:iTime] = Time.now.strftime('%Y-%m-%d %H:%M:%S')
                    # arranging columns in the required format
                    csv << [hash.values[2], hash.values[3], hash.values[4], hash.values[1], hash.values[5]]
                end
            end
        end
        # redirecting to download the csv in Downloads folder
        send_data csv_string, type: :csv, filename: "presidential.csv"
    end
end
