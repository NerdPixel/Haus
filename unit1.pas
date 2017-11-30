unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Gebaeude1;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    CheckBox1: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    procedure Button1Click(Sender: TObject);
    procedure CheckBox10Change(Sender: TObject);
    procedure CheckBox11Change(Sender: TObject);
    procedure CheckBox12Change(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure CheckBox2Change(Sender: TObject);
    procedure CheckBox3Change(Sender: TObject);
    procedure CheckBox4Change(Sender: TObject);
    procedure CheckBox5Change(Sender: TObject);
    procedure CheckBox6Change(Sender: TObject);
    procedure CheckBox7Change(Sender: TObject);
    procedure CheckBox8Change(Sender: TObject);
    procedure CheckBox9Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GroupBox1Click(Sender: TObject);
    procedure GroupBox2Click(Sender: TObject);
  private
      Haus1: THaus;
      H: array[1..5] of THaus;
  public
    { public declarations }
  end;

var
  Form1: TForm1;


implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin

  WindowState:=wsMaximized;

end;

procedure TForm1.GroupBox1Click(Sender: TObject);
begin

end;

procedure TForm1.GroupBox2Click(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
var i: integer;
begin



     Haus1:=THaus.create(1300, 600, 200, clGreen, Form1, false);

     for i:= 1 to 5 do
     begin

       H[i]:=THaus.create(1200-i*200,600, 100, clGreen, Form1, false);

     end;




end;

procedure TForm1.CheckBox10Change(Sender: TObject);
begin
  H[3].istTueroffen;
end;

procedure TForm1.CheckBox11Change(Sender: TObject);
begin
  H[4].istTueroffen;
end;

procedure TForm1.CheckBox12Change(Sender: TObject);
begin
  H[5].istTueroffen;
end;

procedure TForm1.CheckBox1Change(Sender: TObject);
begin
   Haus1.istLichtAn;
end;

procedure TForm1.CheckBox2Change(Sender: TObject);
begin
   H[1].istLichtAn;
end;

procedure TForm1.CheckBox3Change(Sender: TObject);
begin
   H[2].istLichtAn;
end;

procedure TForm1.CheckBox4Change(Sender: TObject);
begin
   H[3].istLichtAn;
end;

procedure TForm1.CheckBox5Change(Sender: TObject);
begin
   H[4].istLichtAn;
end;

procedure TForm1.CheckBox6Change(Sender: TObject);
begin
   H[5].istLichtAn;
end;

procedure TForm1.CheckBox7Change(Sender: TObject);
begin
  Haus1.istTueroffen;
end;

procedure TForm1.CheckBox8Change(Sender: TObject);
begin
  H[1].istTueroffen;
end;

procedure TForm1.CheckBox9Change(Sender: TObject);
begin
  H[2].istTueroffen;
end;

end.

