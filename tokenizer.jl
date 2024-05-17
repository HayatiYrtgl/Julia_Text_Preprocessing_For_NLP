# struct for tokenization
function Tokenizer(raw_text::String)
    #=
    This method get raw text and split from spaces to Tokenize
    =#

    # split text
    text = collect(split(lowercase(raw_text), " "))

    # create dictionary
    token_dictionary = Dict()

    # index num
    index_num = 1

    # parse the text 
    for token in text

        # control flow
        if token ∉ keys(token_dictionary)
            
            # add value
            token_dictionary[token] = index_num

            # index num increase
            index_num += 1
            
        end # if end

    end # for end

    return token_dictionary, text

end # function end

# texts to sequence function
function texts_to_sequence(tokenizer_dictionary::Dict, parsed_text::String, unknown_token=0)::Array

    # get text and parse
    text = split(lowercase(parsed_text), " " )

    # return list
    return_array = Int64[]

    # with for loop
    for token in text
        if haskey(tokenizer_dictionary, token)
            push!(return_array, tokenizer_dictionary[token])
        else
            push!(return_array, unknown_token)
        end
        
    end # for end

    # return the Array
    return return_array
end # function end

# pad sequences
function pad_sequence(maxlen::Int, array::Array, padding="pre")
    #=This method get the array and fill it with 0=#

    # create 0 matrix
    pad_array = zeros(1, maxlen)

    # difference
    diff = maxlen-length(array)

    # control flow
    if length(array) < maxlen

        pad_array[diff+1:end] = array
        
    end

    # return zero matrix
    return pad_array
end

# example Usage
words = "Abandon Benevolent Catastrophe Diligent Eccentric Fascinate Generous Hilarious Innovative Juxtapose Kaleidoscope Luminous Meticulous Notorious Obsolete Phenomenon"
tok,text = Tokenizer(words)
sequence = texts_to_sequence(tok, "abandon Catastrophe Fascinate Hilarious")
println(pad_sequence(50, sequence))
