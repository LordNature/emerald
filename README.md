# emerald
Emerald is a blog written in the young language, Crystal.
The main focus of this project was to provide a development environment to learn Kemal and Crystal.

### Requisites
Emerald requires the following to function:  

`crystal` 0.23.1  
`shards` or invoke `crystal deps`  
`sassc` or any sass compiler

### Usage for Development
While I assume you could figure out yourself, here's a quick-start guide.
```
(Assuming you've downloaded the git repo and entered the folder)
$ git pull
Already up-to-date.
$ crystal deps
Using kemal, radix, kilt, sqlite3, db, remarkdown (summary)
$ crystal run src/emerald.cr
[development] Kemal is ready to lead at http://0.0.0.0:3000
```
