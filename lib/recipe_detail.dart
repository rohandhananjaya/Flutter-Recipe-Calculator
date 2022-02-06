import 'package:flutter/material.dart';
import 'recipe.dart';
import 'recipe_detail.dart';

class RecipeDetail extends StatefulWidget{
  final Recipe recipe;

  const RecipeDetail({Key? key, required this.recipe,}): super(key: key);

  @override
  _RecipeDetailState createState() {
    return _RecipeDetailState();
  }
}

class _RecipeDetailState extends State<RecipeDetail> {
  int _sliderVal =1;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget> [
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 300,
              width: double.infinity,
              child:Image(
                image: AssetImage(widget.recipe.imageURl),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              widget.recipe.label,
              style: const TextStyle(fontSize: 18),
            ),
           Expanded(child: ListView.builder(
                padding: const EdgeInsets.all(7.0),
               itemCount: widget.recipe.ingradients.length ,
               itemBuilder: (BuildContext context, int index){
                  final ingredient = widget.recipe.ingradients[index];
                  return Text(
                    '${ingredient.name} ${ingredient.qty * _sliderVal} x ${ingredient.measure} ' );
               }
            ),
           ),
            Slider(
              min: 1,
              max: 10,
              divisions: 10,
              label: '${_sliderVal * widget.recipe.servings} servings',
              value: _sliderVal.toDouble(),
              onChanged: (newValue) {
                setState(() {
                  _sliderVal = newValue.round();
                });
              },
              activeColor: Colors.green,
              inactiveColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}