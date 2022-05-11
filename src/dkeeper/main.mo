import List "mo:base/List";
import Debug "mo:base/Debug";
actor DKeeper{
  Debug.print("ee");
  public type Note={
    title:Text;
    content:Text;
  };
  stable var notes: List.List<Note> = List.nil<Note>();

  public func createNote(title:Text,content:Text){
    var newNote:Note={
      title=title;
      content=content;
    };
    notes:=List.push(newNote,notes);
  };

  public query func readNotes():async [Note]{
    return List.toArray(notes);
  };

  public func removeNote(id:Nat){
    let prefix=List.take(notes,id);
    let suffix=List.drop(notes,id+1);
    notes:=List.append(prefix,suffix);
  };



}