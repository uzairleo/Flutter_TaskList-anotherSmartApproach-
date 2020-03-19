import 'package:flutter/material.dart';

class TaskList {


  String _title;
  String _subTitle;
  Color _color;


  TaskList(this._title,this._subTitle,this._color);

  get title
  {
    return _title;
  }

  get subTitle=> _subTitle;

  get color=> _color;

  set title(String title)
  {
      this._title=title;
  }

  set subTitle (String subtiTile)
  {
    this._subTitle=subtiTile;
  }

  set color( Color color)
  {
      this._color=color;
  }
  
}