## Olá mundo!

A gem built to explore crafting Ruby gems. This gem translates strings, like "Hello world!", to either
binary (UTF-8 encoding in MSbit format) or the desired language depending on the objective and whether or not that
language and word-choice is currently available. Unknown words and languages are encoded to binary instead.

Available languages:
- French
- Italian
- Maltese
- Portuguese
- Spanish

#### Installing an unpublished version locally
```
# Build it
gem build ola_mundo.gemspec
#=> Successfully built RubyGem
#=> Name: ola_mundo
#=> Version: 0.0.0
#=> File: ola_mundo-0.0.0.gem

# Reference the returned file and install the local version
gem install ./ola_mundo-0.0.0
#=> Successfully installed ola_mundo-0.0.0

# Try it out in IRB
irb -Ilib -rola_mundo

# Start up the translator
OlaMundo.start
#=> "Olá mundo!"

# Translate!
"Hello world!".translate("spanish")
#=> "Hola mundo!"
"Hello world!".translate("maltese")
=> Bongu dinja!
"hi".translate("binary")
=> "01101000 01101001"

# Unavailable words are encoded to binary
"hello quatervois?".translate("italian")
=> "Ciao 01110001 01110101 01100001 01110100 01100101 01110010 01110110 01101111 01101001 01110011?"

# Unavailable language requests are also encoded to binary
"world".translate("dalek")
=> "01110111 01101111 01110010 01101100 01100100"
```


### In case you're curious about the binary

This section explains what it means to convert to binary using UTF-8 encoding in MSbit format.

A byte is a unit of digital information that is composed of a group of (typically 8) binary digits, or bits.
A bit is the smallest piece of info on a computer, a binary digit. Computers store data in this binary system.
Binary represents data in sequences of 0s and 1s.

A binary number can be sent as a string of data in two ways:
1. most significant bit (MSbit) first, starting from left to right. In other words, starting from the left-most bit,
which has the greatest effect on the value of the binary number. Ex: `'H'.unpack('B*')#=> ["01001000"]`
2. least significant bit (LSbit) first, starting from right to left. In other words, starting from the right-most bit,
which has the least effect on the value of the binary number. Ex: `'H'.unpack('b*')#=> ["00010010"]`

With Ruby, we can convert to binary in MSbit format with `"Hello world!".unpack('B*')`,
and we can convert to binary in LSbit format with `"Hello world!".unpack('b*')`.

Characters and emojis are converted to binary by encoding systems. UTF-8 and UTF-16 are encoding systems for unicode.
Unicode is the universal standard for encoding that expands on its predecessor, ASCII, to include emojis and all human
language characters. Unicode can represent more characters, because it many more unique codes available to represent
them than ASCII.

UTF-8 encodes a character in 1-4 bytes (meaning the smallest possible representation is 1 byte), whereas
UTF-16 encodes a character in 2 or 4 bytes (meaning the smallest possible representation is 2 bytes).

UTF-8 is the most common character encoding in web development. It decreases file size by allowing common characters
to be represented with less space. It is specified with the HTML meta tag, `<meta charset="UTF-8">`.

UTF-16 is better used on websites with non-English text, where complex characters are more common that
would be only 2 bytes in UTF-16, but would be 4 bytes in UTF-8.

#### References
[RubyGems Guide](https://guides.rubygems.org/rubygems-basics/)
[What is UTF-8 Encoding?](https://blog.hubspot.com/website/what-is-utf-8)
