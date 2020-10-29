class User
    attr_accessor:name,:email
    
    def initialize(attributes={})
        @first_name = attributes[:first_name]
        @last_name = attributes[:last_name]
        @email = attributes[:email]
    end
    
    def full_name
        puts "#{@first_name}#{@last_name}"
    end
    
    def formatted_email
        "名前#{@name}:email<#{@email}>"
    end
end