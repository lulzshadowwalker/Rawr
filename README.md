# RAWR

Flutter project that implements the idea of a group card that uses [appwrite](https://appwrite.io/) as a backend service and [GetX]((https://pub.dev/packages/get)) as a state management solution. 

## TABLE OF CONTENTS

[platforms](#platforms)

[what I learned](#what-i-learned)

## PLATFORMS

- Windows

- Linux 

- Web ( limited to some features only such as adding new submissions )

## WHAT I LEARNED

### RenderObjects

> [Drawing Every Line Pixel-perfectly with Custom Render Objects](https://medium.com/flutter-community/pure-flutterclock-face-every-line-customly-drawn-with-pixel-perfect-control-c27cba427801)
> 
> [A definitive guide to RenderObjects in Flutter - YouTube](https://youtu.be/HqXNGawzSbY)

There are three types of trees in Flutter:

1. Widget

2. Element

3. RenderObject

> Widget tree: Immutable. for **configuration**. it's where you decided or "configure" how your UI parts would look like.    
> 
> Element tree: manage the widgets **life cycle**, **life cycle** and whatever.   
> 
> RenderObject: responsible for **rendering** and painting UI elements to the screen.

#### The RenderBox protocol

- Constraints go down, sizes go up. Parent sets position.

From top to bottom or leaf nodes, the parent would tell the children their constraints or "constraint" them ( and constraints are simply `BoxCosntraints`  ) and the children would in return report their size up from bottom to top. 

> [Understanding constraints | Flutter docs](https://docs.flutter.dev/development/ui/layout/constraints)

<!-- TODO summarize the constraints article from Flutter docs -->

#### The Sliver protocol

- Sliver: a sliver is basically a "slice of a viewport"  and it's a part of something scrollable.

- it uses `SliverConstraints` instead of `BoxConstraints` which goes down.

- it uses `SliverGeometry` instead of a simple `Size` which goes up.

> This one is more complex than the render box protocol 

#### [CustomSingle/MultiChildLayout]([YouTube](https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbXFZMmZSODdLd3pnX1VHQ1Y0TE1KMndXR1FPUXxBQ3Jtc0tuN1Q5Z25jSHo2Z3luR3RMT01vTnUxQmdoM1RnTTg0ZURmYWlEYWJINzg1aGtIT3hDajlnaDdHQ0RNblJUdGNMdnMya0RfTkF5cVFVMkJCclhrMkpWeDRkYVRkWHJNalU1TmY0SVBlR092MTFTMmtUaw&q=https%3A%2F%2Fstackoverflow.com%2Fquestions%2F59483051%2Fhow-to-use-custommultichildlayout-customsinglechildlayout-in-flutter%2F59483482%2359483482&v=HqXNGawzSbY))
