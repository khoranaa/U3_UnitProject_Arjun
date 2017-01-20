class Player
{
  PImage _playerImg;
  float _x;
  float _y;
  float _startY;
  boolean _canJump;
  int jumpOffset;
  
  Player(PImage img)
  {
    _playerImg = img;
    _x = 0;
    _y = height*0.9-img.height/2;
    jumpOffset = 30;
    _startY = 0;
    _canJump = true;
  }
  
  void Update()
  {
    println("StartY:" + _startY);
    println("TrackerY:" + trackerPos.y);
    
    if(_canJump && trackerPos.y + jumpOffset < _startY)
    {
      println("Jumping");
    }
  }
  
  void Draw()
  {
    image(_playerImg, _x, _y);
  }
  
  void SetStartY(float y)
  {
    _startY = y;
  }
}