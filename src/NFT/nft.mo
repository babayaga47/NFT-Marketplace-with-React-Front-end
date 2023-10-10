import Debug "mo:base/Debug";
import Text "mo:base/Text";
import Principal "mo:base/Principal";
import Nat8 "mo:base/Nat8";



 actor class NFT (name: Text, owner: Principal, content: [Nat8]) = this {

  private let itemName : Text = name;
  private var nftOwner : Principal = owner;
  private let imageBytes : [Nat8] = content; 

  public query func getName() : async Text {

    return itemName;

  };

  public query func getOwner() : async Principal {
     
     return nftOwner;

  };

  public query func getAsset() : async [Nat8] {
    
    return imageBytes;

  };


  public query func getCanisterId(): async Principal {

     return Principal.fromActor(this);

  };



  public shared(msg) func transferOwnership(newOwner: Principal) : async Text {
     
     if (msg.caller == nftOwner) {
    
         nftOwner := newOwner;
         return "Success";
   
     } else {

       return "Error: Not initiated by NFT Owner.!!!";

     }



  }




 }