
# Lucene Cheatsheet

## Basics: 

### Case sensitive
Lucene indexes can be case-sensitive or case-insensitive, depending on configuration.

### Default OR / AND
Unlike other search engines, Lucene defaults term-pairing to ORs rather than ANDs.

### Special characters
`+`,`-`, `&`, `|`, `!`, `(`, `)`, `{`, `}`, `[`, `]`, `^`, `"`, `~`, `*`, `?`, `:`, `\`

Special character need to be escaped (e.g., `\?`) to be searched as a literal

### Operators

| Operator         | Option 1                    | Option2         | Description                                                                                                                 | Restrictions                     |
| ---------------- | --------------------------- | --------------- | --------------------------------------------------------------------------------------------------------------------------- | -------------------------------- |
| INTERSECT        | gal AND acro                | +gal +acro      | gal AND acro must exists                                                                                                    |                                  |
| UNION            | gal OR acro                 | gal acro        | At least one of gal or acro must exists                                                                                     |
| SUBSTRUCTION     | gal AND NOT acro            | gal -acro       | gal must exists but acro cannot exists                                                                                      |
| PHRASES          | "gal acro"                  |                 | "gal acro" must exists                                                                                                      | Can't use in wildcard            |
| FUZZY SEARCHES   | ga~ acr~                    | ga~0.5 acro~0.5 | Defaults to 0.5. The value is between 0 and 1, with a value closer to 1 only terms with a higher similarity will be matched | Can't use wildcard or in phrases |
| OPERATORS        | host: acro.com              | host:acro*      | Search by indexed field                                                                                                     |
| NESTING/GROUPING | (+gal +acro) (+gal +charge) |                 | Group by and use operators between the groups                                                                               |