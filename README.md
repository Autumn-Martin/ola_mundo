## Olá mundo!

A simple gem built to learn about crafting Ruby gems. This gem translates "Hello world!" to
either binary (UTF-8 encoding) or the desired language depending on whether that language is
currently supported.

Supported languages:
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
OlaMundo.greet
#=> "Olá mundo!"
OlaMundo.greet("spanish")
#=> "Hola mundo!"
```

#### References
[RubyGems Guide](https://guides.rubygems.org/rubygems-basics/)
