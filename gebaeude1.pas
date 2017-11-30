unit Gebaeude1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs;

type
  THaus=class(TObject)
  private
    FX, FY:         Integer;
    FBreite:        Integer;
    FFarbe:         TColor;
    FBesitzer:      TForm;
    FLichtAn, FTuer:       boolean;
    procedure zeichneWand;
    procedure zeichneDach;
    procedure zeichneFenster;
    procedure zeichneTuer;
    procedure TuerOeffnen;
    procedure TuerSchliessen;
  public
    constructor create(xPos, yPos, Breite:integer; F:TColor;Besitzer: TForm; Licht:boolean);
    procedure zeichnen;
    procedure LichtEinSchalten;
    procedure LichtAusSchalten;
    function istLichtAn: boolean;
    function istTueroffen: boolean;
    destructor destroy; override;

  end;
var
  r,p_w: integer;
  FF: TColor;


implementation

constructor THaus.create(xPos,yPos,Breite:integer; F:TColor; Besitzer:TForm; Licht:boolean);
begin
  inherited create;
  FX:=xPos;
  FY:=yPos;
  FBreite:=Breite;
  r:=Breite div 5;
  FFArbe:=F;
  FBesitzer:=Besitzer;
  FLichtAn:=Licht;
  p_w:=2;
  FTuer:=false;
  zeichnen
end;

procedure THaus.zeichnen;
begin
  FBesitzer.Canvas.pen.Color:=clBlack;
  zeichneWand;
  zeichneDach;
  zeichneFenster;
  zeichneTuer;

end;

procedure THaus.zeichneWand;
begin

  with FBesitzer.Canvas do
  begin
    pen.width:=p_w;
    brush.Color:=FFarbe;

    rectangle(FX, FY, FX+FBreite, FY-FBreite);

  end;

end;

procedure THaus.zeichneDach;
var a,b: integer;
    c:double;
begin


  with FBesitzer.Canvas do
  begin
  pen.width:=p_w;



  b:=round(FX+FBreite/2);
  c:=1/2*FBreite;
  a:=round((FY-FBreite)-c);

  {MoveTo(FX-1,FY-FBreite);
  LineTo(b,a);

  MoveTo(FX+FBreite-1,FY-FBreite);
  LineTo(b,a);}                    //alternative Variante


  brush.color:=clGreen;
                                            // -1 damit es perfekt auf dem Haus sitzt
  Polygon([Point(FX-1, FY-FBreite),
           Point(b, a),
           Point(FX+FBreite-1, FY-FBreite)  // siehe oben (s.o.)
         ])
  end;

end;

procedure THaus.zeichneFenster;
begin

  with FBesitzer.Canvas do
  begin

       pen.width:=p_w;

       if FLichtAn=true then
          begin
            brush.Color:=clFuchsia;
          end
       else
           begin
            brush.Color:=clWhite;
           end;

       rectangle(
                 round(1/5*FBreite)+FX,
                 FY-Round(3/5*FBreite),
                 round(2/5*FBreite)+FX,
                 FY-Round(4/5*FBreite)
                 );

       rectangle(
                 round(3/5*FBreite)+FX,
                 FY-Round(3/5*FBreite),
                 round(4/5*FBreite)+FX,
                 FY-Round(4/5*FBreite)
                 );

       rectangle(
                 round(3/5*FBreite)+FX,
                 FY-Round(1/5*FBreite),
                 round(4/5*FBreite)+FX,
                 FY-Round(2/5*FBreite)
                 );
  end;
end;

procedure THaus.zeichneTuer;
begin

  with FBesitzer.Canvas do
  begin

       pen.width:=p_w;

       if FTuer=true then
          begin
       if FLichtAn=true then
          begin
            brush.Color:=clFuchsia;
          end
       else
           begin
                brush.Color:=clWhite;
           end;



               rectangle(
                         round(1/5*FBreite)+FX,
                         FY-Round(0/5*FBreite),
                         round(2/5*FBreite)+FX,
                         FY-Round(2/5*FBreite)
                         );

               brush.Color:=clBlack;

               rectangle(
                         round((2/5*FBreite)/2)+FX,
                         FY-Round(0.5/5*FBreite),
                         round((3/5*FBreite)/2)+FX,
                         FY-Round(2/5*FBreite)
                         );

               Polygon([
                        Point(
                              round(1/5*FBreite)+FX,
                              FY-1
                              ),
                        Point(
                              round((1/5+2/5)/2*FBreite)+FX-1, //s.o.
                              FY-round((1/5*FBreite)/2)
                              ),
                        Point(
                              round((1/5*FBreite))+FX,
                              FY-Round((1/5*FBreite)/2)
                              )
                              ]);



          end
       else
          begin
               brush.Color:=clBlack;
               rectangle(
                         round(1/5*FBreite)+FX,
                         FY-Round(0/5*FBreite),
                         round(2/5*FBreite)+FX,
                         FY-Round(2/5*FBreite)
                         );
          end;
  end;
end;

procedure THaus.LichtEinSchalten;
begin
  FLichtAn:=true;
  zeichneFenster;

end;

procedure THaus.LichtAusSchalten;
begin
  FLichtAn:=false;
  zeichneFenster;

end;

function THaus.istLichtAn:boolean;
begin

  if FLichtAn=true then
  begin
    result:=false;
    FlichtAn:=false;
    LichtAusschalten;
    zeichneTuer;
  end
  else
  begin
    result:=true;
    FLichtAn:=true;
    LichtEinSchalten;
    zeichneTuer;
  end;

end;

procedure THaus.TuerOeffnen;
begin
   FTuer:=false;
   zeichneTuer;


end;

procedure THaus.TuerSchliessen;
begin
   FTuer:=true;
   zeichneTuer;

end;

function THaus.istTueroffen: boolean;
begin

  if FTuer=false then
  begin
    result:=true;
    FTuer:=true;
    TuerSchliessen;
  end
  else
  begin
    result:=true;
    FTuer:=true;
    TuerOeffnen;
  end;

end;

destructor THaus.destroy;
begin
  inherited;
end;

end.
