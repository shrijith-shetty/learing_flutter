  body:Container(
        width: double.infinity,
        height: double.infinity,
        color:Colors.blue.shade50,
        child:Center(
          child:Container(
            width:100,
            height:100,
            // color: Colors.black12,
            decoration: BoxDecoration(
              color:Colors.blueGrey,
              borderRadius : BorderRadius.only(bottomLeft:Radius.circular(99),topLeft:Radius.circular(10),bottomRight:Radius.circular(10),topRight: Radius.circular(99)),
              border: Border.all(
                width:3,
                color: Colors.black87
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                  color: Colors.green,
                  
                )
              ]
            ),
          )
      )
      )
