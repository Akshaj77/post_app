import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/bloc_event/event_bloc.dart';

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventBloc, EventState>(
      builder: (context, state) {
        if (state is EventLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is EventLoaded) {
          return ListView.builder(
            itemCount: state.events.length,
            itemBuilder: (context, index) {
              final event = state.events[index];
              print(event);
              return PostItem(event: event);
            },
          );
        } else if (state is EventError) {
          return Center(child: Text('Error: ${state.error}'));
        }
        return Center(child: Text('No Events Found'));
      },
    );
  }
}

class PostItem extends StatefulWidget {
  final dynamic event;

  PostItem({required this.event});

  @override
  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  bool isLiked = false;
  int likesCount = 0;
  int commentsCount = 0;
  int sharesCount = 0;

  @override
  void initState() {
    super.initState();
    isLiked = false;
    likesCount = widget.event.likes;
    commentsCount = widget.event.comments.length;
    sharesCount = 0; // Assuming initial shares count is 0
  }

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
      likesCount += isLiked ? 1 : -1;
    });
  }

  void _addComment() {
    setState(() {
      commentsCount += 1;
    });
  }

  void _sharePost() {
    setState(() {
      sharesCount += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(8.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Post Header
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Profile picture placeholder
                radius: 20,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.event.user.firstName} ${widget.event.user.lastName}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(widget.event.user.id),
                ],
              ),
              Spacer(),
              Icon(Icons.more_horiz),
            ],
          ),
          SizedBox(height: 10),

          // Post Content
          Stack(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.event.images[0]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Live',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),

          // Post Caption
          Text(
            widget.event.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 5),
          Text(
            'see more',
            style: TextStyle(color: Colors.blue),
          ),
          SizedBox(height: 10),

          // Interaction Buttons (Like, Comment, Share)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border),
                    onPressed: _toggleLike,
                  ),
                  SizedBox(width: 5),
                  Text('$likesCount Likes'),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.comment_outlined),
                    onPressed: _addComment,
                  ),
                  SizedBox(width: 5),
                  Text('$commentsCount Comments'),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.share_outlined),
                    onPressed: _sharePost,
                  ),
                  SizedBox(width: 5),
                  Text('$sharesCount Shares'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}