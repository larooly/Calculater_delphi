unit ba;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Button1: TButton;
    Label3: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Button2: TButton;
    Edit4: TEdit;
    Edit5: TEdit;
    Button3: TButton;
    ComboBox1: TComboBox;
    Edit6: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Edit7: TEdit;
    Button4: TButton;
    Label6: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
//메모를 쓰지말고 바꾸어보자

procedure TForm1.FormCreate(Sender: TObject);
begin
  Label1.Caption := '10<->무언가';//inttostr($40);


end;

//////////10->무언가////////////////////
function TransNamugi(a : integer): String;
var
  lis : String;
begin
  lis:='0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
  Result:= Copy(lis,a+1,1);
end;

function Chan10tob(a , b : integer):String;
var
  ar2 : String;
  x,y : integer;
begin
  ar2:='';
  while true do
  begin
    x := a div b;//정수 나누기
    y := a mod b;//나머지
    if a=0 then
    begin
      Result:= ar2;
      break;
    end
    else
    begin
      ar2 := TransNamugi(y)+ar2;
      a:=x;
    end;
  end;
end;

///////////무언가->10//////////////
function TransChar(a : String): integer;
var
  lis : String;
begin
  lis := '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
  Result := Pos(a,lis)-1;
end;

function dodo2(a,b : Int64): int64;
var
  i : Integer;
  c: Int64;
begin
  C:=1;
  for i:=0 to b-1 do
  begin
    c:=c*a;
  end;
  Result:= C;
end;
//숫자가 커질수있으니 주의
function ChanStringto10(a : String ; b : integer):Int64;
var
  sum : int64;
  i : integer;
begin
  sum := 0;
  for i :=1 to length(a) do
  begin
    sum := sum + dodo2(b,length(a)-i)*TransChar(a[i]);
  end;
  Result := sum;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Label2.Caption:= Chan10tob(strtoint(Edit1.Text),strtoint(Edit2.Text));
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Label3.Caption:= IntToStr(ChanStringto10(Edit3.Text,StrToInt(Edit4.Text)));
end;


procedure TForm1.Button3Click(Sender: TObject);
var
  a,b : integer;
begin
  a := StrToInt(Edit6.Text);
  b := StrToInt(Edit5.Text);
  if ComboBox1.ItemIndex<=0 then//or
  begin
    Label4.Caption := 'or : '+IntToStr(a or b);
  end
  else if ComboBox1.ItemIndex=1 then//and
  begin
    Label4.Caption := 'and : '+IntToStr(a and b);
  end
  else if ComboBox1.ItemIndex=2 then//xor
  begin
    Label4.Caption := 'xor : '+IntToStr(a xor b);
  end
  else if ComboBox1.ItemIndex=3 then//shr
  begin
    Label4.Caption := 'shr : '+IntToStr(a shr b);
  end
  else if ComboBox1.ItemIndex=4 then//shl
  begin
    Label4.Caption := 'shl : '+IntToStr(a shl b);
  end
  else//not
  begin
    Label4.Caption :='not : '+ IntToStr(not a);
  end;


end;

procedure TForm1.Button4Click(Sender: TObject);
var
  a : Byte;
begin
  a := StrToInt(Edit7.Text);
  Label6.Caption :='not : '+ IntToStr(not a);
end;

end.
