You're new on the job and have been given ownership of the company's jukebox application. Unfortunately, before you can even begin adding cool new features to make it much, much more awesome than it is now, you fire it up and it won't even run! Now you have to go through the code and squash all the bugs (there's a bunch!).

Given the following spec, dive into the code and fix one problem at a time until the program's output matches the spec and there are no errors!

to run the program, type `ruby runner.rb`

__Remember!__  
1. read your error messages carefully, check error messages and line numbers  
2. use pry or irb to check your assumptions!  
3. not all bugs will throw errors, check the output against the spec!  
4. your program is only as good as the data you feed it!  
  
When running for the first time, output should be: 
```
Welcome to Ruby Console Jukebox!  
Enter a command to continue. Type 'help' for a list of commands.
```
user enters `help`:
```
Never worked a jukebox, eh? Pretty standard. Available commands are:  
'help' - shows this menu  
'list' - lists the whole song library  
or you can enter an artist's name to show that artist's songs  
or you can enter a song title to play that song!  
  
Enter a command to continue. Type 'help' for a list of commands.  
```

user enters `list`:
```
---------------
U2:
---------------
The Joshua Tree:
  With or Without You
  Still Haven't Found What I'm Looking For
  Bullet the Blue Sky
Zooropa:
  Numb

---------------
Talking Heads:
---------------
Fear of Music:
  Life During Wartime
  Heaven
Speaking in Tongues:
  This Must Be the Place (Naive Melody)
  Burning Down the House

---------------
Huey Lewis and the News:
---------------
Sports:
  I Want a New Drug
  If This is It
  Heart of Rock and Roll
  
Enter a command to continue. Type 'help' for a list of commands.

```

user enters `U2` OR user enters `u2`:
```
---------------
U2:
---------------
The Joshua Tree:
  With or Without You
  Still Haven't Found What I'm Looking For
  Bullet the Blue Sky
Zooropa:
  Numb
Enter a command to continue. Type 'help' for a list of commands.
```

user enters `numb` or `Numb` or `NUMB`
```
Now Playing: U2: Zooropa - Numb

Enter a command to continue. Type 'help' for a list of commands.
```

user enters `zzyz`:
```
I did not understand 'zzyz'!

Enter a command to continue. Type 'help' for a list of commands.
```