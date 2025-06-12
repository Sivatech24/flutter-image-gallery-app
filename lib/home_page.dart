import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_image_gallery/image_detail_page.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imageUrls = [
  'https://images.pexels.com/photos/2325447/pexels-photo-2325447.jpeg?cs=srgb&dl=pexels-francesco-ungaro-2325447.jpg&fm=jpg&_gl=1*1xnjyaf*_ga*MjIwMDkyMjg4LjE3NDk3MTU4OTI.*_ga_8JE65Q40S6*czE3NDk3MTU4OTEkbzEkZzEkdDE3NDk3MTYwMTckajU5JGwwJGgw',
    'https://images.pexels.com/photos/158063/bellingrath-gardens-alabama-landscape-scenic-158063.jpeg?cs=srgb&dl=pexels-pixabay-158063.jpg&fm=jpg&_gl=1*16rn2vd*_ga*MjIwMDkyMjg4LjE3NDk3MTU4OTI.*_ga_8JE65Q40S6*czE3NDk3MTU4OTEkbzEkZzEkdDE3NDk3MTYyMTUkajU3JGwwJGgw',
    'https://images.pexels.com/photos/1659438/pexels-photo-1659438.jpeg?cs=srgb&dl=pexels-m-venter-792254-1659438.jpg&fm=jpg&_gl=1*m1eexf*_ga*MjIwMDkyMjg4LjE3NDk3MTU4OTI.*_ga_8JE65Q40S6*czE3NDk3MTU4OTEkbzEkZzEkdDE3NDk3MTYyNDEkajMxJGwwJGgw',
    'https://images.pexels.com/photos/248159/pexels-photo-248159.jpeg?cs=srgb&dl=pexels-nout-gons-80280-248159.jpg&fm=jpg&_gl=1*3dv91a*_ga*MjIwMDkyMjg4LjE3NDk3MTU4OTI.*_ga_8JE65Q40S6*czE3NDk3MTU4OTEkbzEkZzEkdDE3NDk3MTYyNTAkajIyJGwwJGgw',
    'https://images.pexels.com/photos/46160/field-clouds-sky-earth-46160.jpeg?cs=srgb&dl=pexels-pixabay-46160.jpg&fm=jpg&_gl=1*1we2lu*_ga*MjIwMDkyMjg4LjE3NDk3MTU4OTI.*_ga_8JE65Q40S6*czE3NDk3MTU4OTEkbzEkZzEkdDE3NDk3MTYyNjMkajkkbDAkaDA.',
    'https://images.pexels.com/photos/66898/elephant-cub-tsavo-kenya-66898.jpeg?cs=srgb&dl=pexels-pixabay-66898.jpg&fm=jpg&_gl=1*133vkah*_ga*MjIwMDkyMjg4LjE3NDk3MTU4OTI.*_ga_8JE65Q40S6*czE3NDk3MTU4OTEkbzEkZzEkdDE3NDk3MTYyOTMkajU5JGwwJGgw',
    'https://images.pexels.com/photos/414837/pexels-photo-414837.jpeg?cs=srgb&dl=pexels-pixabay-414837.jpg&fm=jpg&_gl=1*ecaxrv*_ga*MjIwMDkyMjg4LjE3NDk3MTU4OTI.*_ga_8JE65Q40S6*czE3NDk3MTU4OTEkbzEkZzEkdDE3NDk3MTYzMDUkajQ3JGwwJGgw',
    'https://images.pexels.com/photos/853168/pexels-photo-853168.jpeg?cs=srgb&dl=pexels-minan1398-853168.jpg&fm=jpg&_gl=1*ffq1g6*_ga*MjIwMDkyMjg4LjE3NDk3MTU4OTI.*_ga_8JE65Q40S6*czE3NDk3MTU4OTEkbzEkZzEkdDE3NDk3MTYzMTkkayM1JGwwJGgw',
    'https://images.pexels.com/photos/326900/pexels-photo-326900.jpeg?cs=srgb&dl=pexels-pixabay-326900.jpg&fm=jpg&_gl=1*v2utic*_ga*MjIwMDkyMjg4LjE3NDk3MTU4OTI.*_ga_8JE65Q40S6*czE3NDk3MTU4OTEkbzEkZzEkdDE3NDk3MTYzMjkkajIzJGwwJGgw',
    'https://images.pexels.com/photos/314726/pexels-photo-314726.jpeg?cs=srgb&dl=pexels-pixabay-314726.jpg&fm=jpg&_gl=1*1wq4sct*_ga*MjIwMDkyMjg4LjE3NDk3MTU4OTI.*_ga_8JE65Q40S6*czE3NDk3MTU4OTEkbzEkZzEkdDE3NDk3MTYzNDclajUkbDAkaDA.',
    'https://images.pexels.com/photos/1048039/pexels-photo-1048039.jpeg?cs=srgb&dl=pexels-scottwebb-1048039.jpg&fm=jpg&_gl=1*9oilce*_ga*MTYzMTMwMzc5NC4xNzQ5NzE3MjE0*_ga_8JE65Q40S6*czE3NDk3MTcyMTMkbzEkZzEkdDE3NDk3MTcyOTEkajU5JGwwJGgw',
    'https://images.pexels.com/photos/1485894/pexels-photo-1485894.jpeg?cs=srgb&dl=pexels-maoriginalphotography-1485894.jpg&fm=jpg&_gl=1*g84d7f*_ga*MTYzMTMwMzc5NC4xNzQ5NzE3MjE0*_ga_8JE65Q40S6*czE3NDk3MTcyMTMkbzEkZzEkdDE3NDk3MTczNDQkajYkbDAkaDA.',
    'https://images.pexels.com/photos/312105/pexels-photo-312105.jpeg?cs=srgb&dl=pexels-sebastian-312105.jpg&fm=jpg&_gl=1*mwofkw*_ga*MTYzMTMwMzc5NC4xNzQ5NzE3MjE0*_ga_8JE65Q40S6*czE3NDk3MTcyMTMkbzEkZzEkdDE3NDk3MTczNTgkajU4JGwwJGgw',
    'https://images.pexels.com/photos/1683975/pexels-photo-1683975.jpeg?cs=srgb&dl=pexels-dariaobymaha-1683975.jpg&fm=jpg&_gl=1*1kjmwx6*_ga*MTYzMTMwMzc5NC4xNzQ5NzE3MjE0*_ga_8JE65Q40S6*czE3NDk3MTcyMTMkbzEkZzEkdDE3NDk3MTczODkkajI3JGwwJGgw',
    'https://images.pexels.com/photos/1546901/pexels-photo-1546901.jpeg?cs=srgb&dl=pexels-thatguycraig000-1546901.jpg&fm=jpg&_gl=1*10h4rdi*_ga*MTYzMTMwMzc5NC4xNzQ5NzE3MjE0*_ga_8JE65Q40S6*czE3NDk3MTcyMTMkbzEkZzEkdDE3NDk3MTc0MjUkajU1JGwwJGgw',
    'https://images.pexels.com/photos/100582/pexels-photo-100582.jpeg?cs=srgb&dl=pexels-luftschnitzel-100582.jpg&fm=jpg&_gl=1*1egs22n*_ga*MTYzMTMwMzc5NC4xNzQ5NzE3MjE0*_ga_8JE65Q40S6*czE3NDk3MTcyMTMkbzEkZzEkdDE3NDk3MTc0MzMkajQ3JGwwJGgw',
    'https://images.pexels.com/photos/1544376/pexels-photo-1544376.jpeg?cs=srgb&dl=pexels-sliceisop-1544376.jpg&fm=jpg&_gl=1*1ouoj0t*_ga*MTYzMTMwMzc5NC4xNzQ5NzE3MjE0*_ga_8JE65Q40S6*czE3NDk3MTcyMTMkbzEkZzEkdDE3NDk3MTc0NDQkajM2JGwwJGgw',
    'https://images.pexels.com/photos/1078983/pexels-photo-1078983.jpeg?cs=srgb&dl=pexels-ollivves-1078983.jpg&fm=jpg&_gl=1*1cvllt4*_ga*MTYzMTMwMzc5NC4xNzQ5NzE3MjE0*_ga_8JE65Q40S6*czE3NDk3MTcyMTMkbzEkZzEkdDE3NDk3MTc0NTIkajI4JGwwJGgw',
    'https://images.pexels.com/photos/87009/earth-soil-creep-moon-lunar-surface-87009.jpeg?cs=srgb&dl=pexels-pixabay-87009.jpg&fm=jpg&_gl=1*1w9qixc*_ga*MTYzMTMwMzc5NC4xNzQ5NzE3MjE0*_ga_8JE65Q40S6*czE3NDk3MTcyMTMkbzEkZzEkdDE3NDk3MTc0NjMkajE3JGwwJGgw',
    'https://images.pexels.com/photos/1726310/pexels-photo-1726310.jpeg?cs=srgb&dl=pexels-pok-rie-33563-1726310.jpg&fm=jpg&_gl=1*1m4hqbf*_ga*MTYzMTMwMzc5NC4xNzQ5NzE3MjE0*_ga_8JE65Q40S6*czE3NDk3MTcyMTMkbzEkZzEkdDE3NDk3MTc0NzEkajkkbDAkaDA.',
  ];

  int _crossAxisCount = 2;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Gallery'),
        actions: [
          PopupMenuButton<int>(
            icon: const Icon(Icons.grid_on),
            onSelected: (int value){
              setState((){
                _crossAxisCount = value;
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
              const PopupMenuItem<int>(
                value: 2,
                child: Text('2 Columns'),
              ),
              const PopupMenuItem<int>(
                value: 3,
                child: Text('3 Columns'),
              ),
              const PopupMenuItem<int>(
                value: 4,
                child: Text('4 Columns'),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _isLoading ? null : _loadMoreImages,
            tooltip: 'Load More Images',
          ),
        ],
      ),
      body: _isLoading
          ? const Center (child: CircularProgressIndicator())
          : Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _crossAxisCount,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 1.0,
              ),
              itemCount: imageUrls.length,
              itemBuilder: (context, index){
                final imageUrl = imageUrls[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ImageDetailPage(
                          imageUrls: imageUrls,
                          initialIndex: index,
                        ),
                      ),
                    );
                  },
                  child: Hero(
                    tag: 'imageHero-$index',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child:CachedNetworkImage(
                        imageUrl: imageUrl,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          color: Colors.grey[200],
                          child: Center(
                            child:CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.blueGrey.shade200),
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          color: Colors.grey[300],
                          child:Icon(Icons.error, color: Colors.red[400]),
                        ),
                      ),
                    ),
                  )  ,
                );
              },
            ),
          ),
    );
  }
  void _loadMoreImages(){
    setState((){
      _isLoading = true;
    });

    Future.delayed(const Duration(seconds: 2), (){
      setState((){
        imageUrls.addAll([
          'https://images.pexels.com/photos/2086748/pexels-photo-2086748.jpeg?cs=srgb&dl=pexels-rahulp9800-2086748.jpg&fm=jpg&_gl=1*tmftcl*_ga*MTYzMTMwMzc5NC4xNzQ5NzE3MjE0*_ga_8JE65Q40S6*czE3NDk3MTcyMTMkbzEkZzEkdDE3NDk3MTc1MzAkajQ5JGwwJGgw',
          'https://images.pexels.com/photos/247376/pexels-photo-247376.jpeg?cs=srgb&dl=pexels-pixabay-247376.jpg&fm=jpg&_gl=1*1sttdew*_ga*MTYzMTMwMzc5NC4xNzQ5NzE3MjE0*_ga_8JE65Q40S6*czE3NDk3MTcyMTMkbzEkZzEkdDE3NDk3MTc1NDAkajM5JGwwJGgw',
          'https://images.pexels.com/photos/207237/pexels-photo-207237.jpeg?cs=srgb&dl=pexels-pixabay-207237.jpg&fm=jpg&_gl=1*1y7ihxq*_ga*MTYzMTMwMzc5NC4xNzQ5NzE3MjE0*_ga_8JE65Q40S6*czE3NDk3MTcyMTMkbzEkZzEkdDE3NDk3MTc1NDckajMyJGwwJGgw',
        ]);
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('New Image Loaded!')),
      );
    });
  }
}