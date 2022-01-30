
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:second_preoject/modules/webView/webViewScreen.dart';

Widget myDevider(){
  return Padding(
    padding: const EdgeInsets.only(top: 3,bottom: 3,left: 20),
    child: Container(
      width: double.infinity,
      height: 1,
      color: Colors.black54,
    ),
  );
}

Widget buildBusinessItem(article,context){
  return InkWell(
    onTap: (){
      navigateTo(context,WebViewScreen(article['url']));
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children:  [
          Container(
              height:120 ,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image:  NetworkImage('${article['urlToImage']}'),
                  fit:BoxFit.cover ,),
              )
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Container(
              height: 120,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Expanded(
                    child: Text('${article['title']}',
                      style:  TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),

                  ),
                  Text('${article['publishedAt']} ',
                    style: TextStyle(
                      color: Colors.black26,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          )

        ],
      ),
    ),
  ) ;
}

Widget buildarticle(list){
  return ConditionalBuilder(
    condition: list.length >0 ,
    builder:(context)=>ListView.separated(
      physics:BouncingScrollPhysics(),
      itemBuilder: (context,index){
        print(list);
        return buildBusinessItem(list[index],context);
      },
      separatorBuilder:  (context,index){
        return myDevider();
      },
      itemCount: list.length,
    ),
    fallback:(context)=> Center(child:CircularProgressIndicator()),
  );
}

void navigateTo(context ,Widget widget)
{
  Navigator.push(context, MaterialPageRoute(builder:(context)=>widget ));
}