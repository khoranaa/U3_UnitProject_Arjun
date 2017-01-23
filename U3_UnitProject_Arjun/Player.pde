class Player
{
  PImage _playerImg;
  float _x;
  float _y;
  float _startY;
  float _groundY;
  float timeDelta;
  boolean _canJump;
  int jumpOffset;
  int yForce;
  
  Player(PImage img)
  {
    _playerImg = img;
    _x = width/2;
    _y = height*0.9 - img.height/2;
    jumpOffset = 30;
    _startY = height;
    _canJump = true;
    _groundY = height*0.9 - img.height/2;
  }
  
  void Update()
  {
    println("StartY:" + _startY);
    println("TrackerY:" + trackerPos.y);
    
    if(_canJump && trackerPos.y + jumpOffset < _startY)
    {
      println("Jumping");
      Jump();
    }
    
    if(_y < _groundY)
    {
      int gravity = 100;
      _y += yForce * timeDelta;
      yForce += gravity * timeDelta;
      println("Currently Jumping at: " + yForce);
    }
    else
    {
      _y = _groundY;
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
    println("Start Jumping!");
  }
}