class Exercise {
  String content = '';
  bool complete = false;
  
  Exercise(String content){
    this.content = content;
  }

  void setContent(String content){
    this.content = content;
  }

  void toggleComplete(){
    complete = !complete;
  }

  String getContent(){
    return content;
  }

  bool getComplete(){
    return complete;
  }
}