class Player
{
  PImage _playerImg;
  float _x;
  float _y;
  float _startY;
  float timeDelta;
  boolean _canJump;
  int jumpOffset;
  int yForce;
  
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
      p.Jump();
    }
    
    if(_y < _startY)
    {
      int gravity = 10;
      _y += yForce * timeDelta;
      yForce += gravity * timeDelta;
    }
    else
    {
      _y = _startY;
      _canJump = true;
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
  
  public void Jump()
  {
    timeDelta = 1.0/frameRate;
    yForce = -60;
    _y+= yForce*timeDelta;
    _canJump = false;
  }
}