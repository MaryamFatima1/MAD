// ignore_for_file: unnecessary_null_comparison, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, library_private_types_in_public_api, unnecessary_to_list_in_spreads, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluro/fluro.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final FluroRouter router = FluroRouter();

  var loginHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return LoginScreen(recipe: params['recipe'][0], router: router);
    },
  );

  router.define('/login/:recipe', handler: loginHandler);

  var recipeDetailHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      String title = params['title']?[0] ?? '';
      Recipe selectedRecipe = Recipe(
        title: title,
        description: 'Recipe description placeholder',
        comments: ['Comment 1', 'Comment 2'],
      );
      return RecipeDetail(recipe: selectedRecipe, router: router);
    },
  );

  router.define('biryani', handler: recipeDetailHandler);

  runApp(MyApp(router: router));
}

class MyApp extends StatelessWidget {
  final FluroRouter router;

  MyApp({required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: router.generator,
      home: RecipeList(router: router),
    );
  }
}

class Recipe {
  final String title;
  final String description;
  List<String> comments;

  Recipe({
    required this.title,
    required this.description,
    this.comments = const [],
  });
}

class RecipeList extends StatelessWidget {
  final FluroRouter router;

  RecipeList({required this.router});

  final List<Recipe> recipes = [
    Recipe(
      title: 'Pasta Carbonara',
      description: 'Delicious pasta with eggs and bacon.',
      comments: ['Yummy!', 'I love it!'],
    ),
    Recipe(
      title: 'Chicken Alfredo',
      description: 'Creamy Alfredo sauce with grilled chicken.',
      comments: ['Delicious!', 'Great recipe.'],
    ),
    Recipe(
      title: 'Margherita Pizza',
      description: 'Classic pizza with tomato, mozzarella, and basil.',
      comments: ['Perfect!', 'My favorite pizza.'],
    ),
    Recipe(
      title: 'Chocolate Cake',
      description: 'Rich and moist chocolate cake for dessert.',
      comments: ['Best cake ever!', 'So chocolatey.'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe App'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(recipes[index].title),
            leading: Container(
              width: 50,
              height: 50,
              color: Colors.grey,
            ),
            onTap: () {
              router.navigateTo(
                context,
                '/recipe/${Uri.encodeComponent(recipes[index].title)}',
              );
            },
          );
        },
      ),
    );
  }
}

class RecipeDetail extends StatelessWidget {
  final Recipe recipe;
  final FluroRouter router;

  RecipeDetail({required this.recipe, required this.router});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(recipe.description),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      LoginScreen(recipe: recipe, router: router),
                ),
              );
            },
            child: Text('Login'),
          ),
          SizedBox(height: 16),
          Text(
            'Comments:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: recipe.comments
                .map((comment) => Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text('- $comment'),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  final Recipe recipe;
  final FluroRouter router;

  LoginScreen({required this.recipe, required this.router});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                widget.router.navigateTo(
                  context,
                  '/login/${Uri.encodeComponent(widget.recipe.toString())}',
                );
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class RecipeDetailsAfterLogin extends StatefulWidget {
  final Recipe recipe;

  RecipeDetailsAfterLogin({required this.recipe});

  @override
  _RecipeDetailsAfterLoginState createState() =>
      _RecipeDetailsAfterLoginState();
}

class _RecipeDetailsAfterLoginState extends State<RecipeDetailsAfterLogin> {
  List<String> newComments = [];
  double averageRating = 0.0;
  int totalRatings = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(widget.recipe.description),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddCommentScreen(
                      recipe: widget.recipe, comments: newComments),
                ),
              );
            },
            child: Text('Add Comment'),
          ),
          ElevatedButton(
            onPressed: () async {
              double rating = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RateRecipeScreen(),
                ),
              );

              if (rating != null) {
                setState(() {
                  totalRatings++;
                  averageRating =
                      ((averageRating * (totalRatings - 1)) + rating) /
                          totalRatings;
                });
              }
            },
            child: Text('Rate Recipe'),
          ),
          SizedBox(height: 16),
          Text(
            'Comments:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...widget.recipe.comments
                  .map(
                    (comment) => Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text('- $comment'),
                    ),
                  )
                  .toList(),
              ...newComments
                  .map(
                    (comment) => Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text('- $comment',
                          style: TextStyle(color: Colors.green)),
                    ),
                  )
                  .toList(),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'Average Rating: ${averageRating.toStringAsFixed(1)}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class RateRecipeScreen extends StatefulWidget {
  @override
  _RateRecipeScreenState createState() => _RateRecipeScreenState();
}

class _RateRecipeScreenState extends State<RateRecipeScreen> {
  double userRating = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rate Recipe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select your rating:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Slider(
              value: userRating,
              onChanged: (value) {
                setState(() {
                  userRating = value;
                });
              },
              min: 0,
              max: 5,
              divisions: 10,
              label: userRating.toStringAsFixed(1),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, userRating);
              },
              child: Text('Submit Rating'),
            ),
          ],
        ),
      ),
    );
  }
}

class AddCommentScreen extends StatefulWidget {
  final Recipe recipe;
  final List<String> comments;

  AddCommentScreen({required this.recipe, required this.comments});

  @override
  _AddCommentScreenState createState() => _AddCommentScreenState();
}

class _AddCommentScreenState extends State<AddCommentScreen> {
  final TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Comment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: commentController,
              decoration: InputDecoration(labelText: 'Enter your comment'),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.comments.add(commentController.text);
                });
                Navigator.pop(context);
              },
              child: Text('Add Comment'),
            ),
          ],
        ),
      ),
    );
  }
}
