Sure, here is a detailed README.md file for your GitHub repository based on the provided code:

```markdown
# Tokenizer and Sequence Padding in Julia

This repository provides simple functions for tokenizing text, converting text to sequences of tokens, and padding these sequences. The implementation is done in the Julia programming language.

## Functions

### `Tokenizer`

The `Tokenizer` function takes raw text as input, tokenizes it by splitting the text into words, and creates a dictionary of tokens. It returns a dictionary of tokens and the tokenized text.

#### Parameters

- `raw_text::String`: The input text to be tokenized.

#### Returns

- `token_dictionary::Dict`: A dictionary where keys are unique tokens and values are their corresponding indices.
- `text::Array{String,1}`: An array of the tokenized words.

#### Example

```julia
words = "Abandon Benevolent Catastrophe Diligent Eccentric Fascinate Generous Hilarious Innovative Juxtapose Kaleidoscope Luminous Meticulous Notorious Obsolete Phenomenon"
tok, text = Tokenizer(words)
println(tok)
println(text)
```

### `texts_to_sequence`

The `texts_to_sequence` function converts a given text to a sequence of token indices based on the provided tokenizer dictionary. It also handles unknown tokens by assigning them a default value.

#### Parameters

- `tokenizer_dictionary::Dict`: The dictionary of tokens generated by the `Tokenizer` function.
- `parsed_text::String`: The text to be converted into a sequence.
- `unknown_token::Int`: The value to be assigned to unknown tokens (default is 0).

#### Returns

- `Array{Int64,1}`: An array of token indices representing the input text.

#### Example

```julia
sequence = texts_to_sequence(tok, "abandon Catastrophe Fascinate Hilarious")
println(sequence)
```

### `pad_sequence`

The `pad_sequence` function pads a sequence of token indices to a specified length with zeros. It supports pre-padding.

#### Parameters

- `maxlen::Int`: The maximum length of the padded sequence.
- `array::Array`: The array of token indices to be padded.
- `padding::String`: The padding type, currently supports only "pre" (default is "pre").

#### Returns

- `Array{Float64,2}`: A padded array of the specified length.

#### Example

```julia
padded_sequence = pad_sequence(50, sequence)
println(padded_sequence)
```

## Example Usage

Here is an example of how to use these functions together:

```julia
words = "Abandon Benevolent Catastrophe Diligent Eccentric Fascinate Generous Hilarious Innovative Juxtapose Kaleidoscope Luminous Meticulous Notorious Obsolete Phenomenon"
tok, text = Tokenizer(words)
sequence = texts_to_sequence(tok, "abandon Catastrophe Fascinate Hilarious")
padded_sequence = pad_sequence(50, sequence)
println(padded_sequence)
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License.
```

This README file includes descriptions of each function, their parameters, return values, and examples of how to use them. It should help users understand and utilize your code effectively.