### Team member #2
- [X] Create MusicAlbum class in a separate .rb file.
- [X] Create Genre class with an association to the Item class (in a separate .rb file).
- [X] All MusicAlbum class properties visible in the diagram should be defined and set up in the constructor method.
- [X] All Genre class properties visible in the diagram should be defined and set up in the constructor method.
- [X] Implement methods:
    - [X] add_item method in the Genre class
        - [X] should take an instance of the Item class as an input
        - [X] should add the input item to the collection of items
        - [X] should add self as a property of the item object (by using the correct setter from the item object)
    - [X] can_be_archived?() in the MusicAlbum class
        - [X] should override the method from the parent class
        - [X] should return true if parent's method returns true AND if on_spotify equals true
        - [X] otherwise, it should return false
 - [X] Add unit tests for all implemented methods.
    - [X] Add tests for #add_item method in Genre class
    - [X] Add tests for #can_be_archived? method in MusicAlbum class

 - [ ] The following options should be available:
    - [ ] List all music albums
    - [ ] List all genres (e.g 'Comedy', 'Thriller')
    - [ ] Add a music album

 - [ ] All data should be preserved by saving collections in .json files.

 - [ ] Create a schema.sql file with tables that will be analogical to the structure of the classes that you created:
    - [ ] music_albums table (add all properties and associations from the parent Item class as table columns)
    - [ ] genres table
