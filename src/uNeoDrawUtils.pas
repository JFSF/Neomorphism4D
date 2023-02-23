unit uNeoDrawUtils;

interface

uses
  System.Classes,
  Winapi.Windows,
  Winapi.Messages,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.Themes,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  Vcl.Buttons,
  Vcl.ImgList,
  Vcl.Imaging.pngimage;

type
  TNeoCtrlState       = ( ctrlNormal, ctrlFocus, ctrlHot, ctrlDisable, ctrlPressed );

  TNeoCtrlStates      = set of TNeoCtrlState;

  PNeoColor           = ^TNeoColor;
  TNeoColor           = type Cardinal;
  PNeoColorRect       = ^TNeoColorRect;
  TNeoColorRect       = packed record
      case Cardinal of
           0 : ( Color           : Cardinal );
           2 : ( HiWord, LowWord : Word );
           3 : ( B, G, R, A      : Byte );
      end;

  PNeoColorArray      = ^TNeoColorArray;
  TNeoColorArray      = array[ 0..0 ] of TNeoColor;
  PNeoColorRectArray  = ^TNeoColorRectArray;
  TNeoColorRectArray  = array [ 0..0 ] of TNeoColorRect;

  NEO_BP_PAINTPARAMS  = record
    cbSize                       : DWORD;
    dwFlags                      : DWORD;
    prcExclude                   : PRect;
    pBlendFunction               : PBLENDFUNCTION;
  end;

  _NEO_BP_PAINTPARAMS = NEO_BP_PAINTPARAMS;

  TNeoBPPaintParams   = _NEO_BP_PAINTPARAMS;
  PNeoBPPaintParams   = ^TNeoBPPaintParams;

  NEO_MARGINS         = packed record
    cxLeftWidth                  : Integer;
    cxRightWidth                 : Integer;
    cyTopHeight                  : Integer;
    cyBottomHeight               : Integer;
  end;

  PNeoMargins         = ^TNeoMargins;
  TNeoMargins         = NEO_MARGINS;

  TNeoCustomImageList = class( TCustomImageList );

  TNeoBitmapOptions   = class( TPersistent )
    private
      FLeftMargin                : Integer;
      FRightMargin               : Integer;
      FTopMargin                 : Integer;
      FBottomMargin              : Integer;
      FAlphaBlend                : Boolean;
      FAlphaBlendBorder          : Boolean;
      FAlphaBlendCorners         : Boolean;
      FStrech                    : Boolean;
      FStrechBorder              : Boolean;
      FDrawOnlyBorder            : Boolean;
      FDrawInClipRect            : Boolean;
      FOnChange                  : TNotifyEvent;
      FContentLeftMargin         : Integer;
      FContentRightMargin        : Integer;
      FContentTopMargin          : Integer;
      FContentBottomMargin       : Integer;

      procedure SetLeftMargin( Value : Integer );
      procedure SetRightMargin( Value : Integer );
      procedure SetTopMargin( Value : Integer );
      procedure SetBottomMargin( Value : Integer );

    public
      constructor Create; virtual;

      procedure Assign( Source : TPersistent ); override;

      property  OnChange : TNotifyEvent read FOnChange write FOnChange;

    published
      property LeftMargin : Integer read FLeftMargin write SetLeftMargin;
      property RightMargin : Integer read FRightMargin write SetRightMargin;
      property TopMargin : Integer read FTopMargin write SetTopMargin;
      property BottomMargin : Integer read FBottomMargin write SetBottomMargin;
      property AlphaBlend : Boolean read FAlphaBlend write FAlphaBlend;
      property AlphaBlendBorder : Boolean read FAlphaBlendBorder write FAlphaBlendBorder;
      property AlphaBlendCorners : Boolean read FAlphaBlendCorners write FAlphaBlendCorners;
      property Strech : Boolean read FStrech write FStrech;
      property StrechBorder : Boolean read FStrechBorder write FStrechBorder;
      property DrawOnlyInBorder : Boolean read FDrawOnlyBorder write FDrawOnlyBorder;
      property DrawInClipRect : Boolean read FDrawInClipRect write FDrawInClipRect;
      property ContentLeftMargin : Integer read FContentLeftMargin write FContentLeftMargin;
      property ContentRightMargin : Integer read FContentRightMargin write FContentRightMargin;
      property ContentTopMargin : Integer read FContentTopMargin write FContentTopMargin;
      property ContentBottomMargin : Integer read FContentBottomMargin write FContentBottomMargin;
  end;

  function IsWindowsModernStyle( AControl : TControl = nil ) : Boolean;
  function IsDarkStyle( AControl : TControl = nil ) : Boolean;
  function IsDarkWindowsStyle( AControl : TControl = nil ) : Boolean;


implementation

end.
