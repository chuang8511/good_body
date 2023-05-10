class RecomdTxtRepository

    def initialize
        ##
    end

    def find_sets_table (userid, num = 1)
        # find out the last num data in SetsRecords for user~userid
        # input: userid: arr ; num: int
        # output: outputlist: arr(2)
        outputlist = []
        sets_table_of_userid = SetsRecords.where(user_id:userid).order(created_at: :desc).limit(num)

        if sets_table_of_userid.count < num
            num = sets_table_of_userid.count
        end

        for i in (0...num)
            outputlist.append( [
                sets_table_of_userid[i].created_at,
                sets_table_of_userid[i].user_id, 
                sets_table_of_userid[i].contents, 
                sets_table_of_userid[i].sets, 
                sets_table_of_userid[i].reps, 
                sets_table_of_userid[i].weight
                ] )
        end
            return outputlist   # [ created_at, user_id, contents, duation ]_i
    end

    def find_times_table (userid, num = 1)
        # find out the last num data in TimesRecords for user~userid
        # input: userid: arr ; num: int
        # output: outputlist: arr(2)
        outputlist = []

        times_table_of_userid = TimesRecords.where(user_id:userid).order(created_at: :desc).limit(num)

        if times_table_of_userid.count < num
            num = times_table_of_userid.count
        end

        unless times_table_of_userid.count == 0
            for i in (0...num) 
                    p times_table_of_userid
                    outputlist.append([
                    times_table_of_userid[i].created_at,
                    times_table_of_userid[i].user_id, 
                    times_table_of_userid[i].contents, 
                    times_table_of_userid[i].duration, 
                    ] )
                end
            return outputlist   # [ created_at, user_id, contents, duation ]_i
        else
            return []
        end   
    end

end