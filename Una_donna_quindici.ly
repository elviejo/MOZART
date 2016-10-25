\version "2.18.2"
\markup \vspace #3

#(set-global-staff-size 18)
#(set-default-paper-size "a4")

tr = \trill
afg = #(define-music-function (parser location expr1 expr2) (ly:music? ly:music?)
	#{ \afterGrace $expr1 $expr2 #})
app = #(define-music-function (parser location expr) (ly:music?)
	#{ \appoggiatura $expr #})
acc = #(define-music-function (parser location expr) (ly:music?)
	#{ \acciaccatura $expr #})
mfp =_\markup \italic \bold { "mf" {\dynamic p }}

\header {
    title = "Una donna quindici"
    subtitle = "Extrait de \"Cosi fan tutte\""
    composer = \markup \bold \center-column { "W.A.Mozart (1756 - 1791)" }
    piece = \markup { \bold \fontsize #4 "N° 19 - Aria"   }
    instrument = "Fagotto I"
    tagline = \markup { \fontsize # -2 "Partition gravée avec LilyPond, un logiciel gratuit et libre (http://lilypond.org)"}

}

date = #(strftime "%d %m %y" (localtime (current-time)))



\paper {
	date = #(strftime "%d %m %y" (localtime (current-time)))

	oddFooterMarkup = \markup { \fill-line {
	{ \on-the-fly #first-page
		{ \fontsize #-1 \fromproperty #'header:title }
		{ \fontsize #-1 \italic \fromproperty #'header: }
		} } }

	evenFooterMarkup = \markup \fill-line {
	\fontsize #0 { \fromproperty #'header:title }
	{ \on-the-fly #last-page \fromproperty #'header:tagline % dernière page
	\center-column { \line {JJG le \date }} 	% date sur une seule ligne
	}}
	 ragged-last-bottom = ##f
}


resetBarnum = \context Score \applyContext % pour la numérotation des mesures
  #(set-bar-number-visibility 3)


Aria = \relative c' {
         \set Score.skipBars = ##t


         \set Staff.midiInstrument = "bassoon"
         \set Staff.printKeyCancellation = ##f


  \override Staff.VerticalAxisGroup.minimum-Y-extent = #'(-6 . 6)
  \override TextScript.padding = #2.0
  \override MultiMeasureRest.expand-limit = 1

  \set Timing.beamExceptions = #'() 		% on désactive la ligature automatique
  \set Timing.baseMoment = #(ly:make-moment 1/8) 	% Encore les croches
  \set Timing.beatStructure = #'(3 8) 		% liées par 3



         \time 6/8
         \key g \major
         \clef bass
    %    \tempo "Andante"

%   \once \override TextScript.outside-staff-padding = #-5
      g,4.\f  r8 ^\markup \bold { \halign #1  "Andante" } d''8-.\p d
%       \once \override TextScript.outside-staff-padding = #+3
      %^\markup { \bold \fontsize #4 { \halign #1.5 { "N° 19 - Aria"  } } } |
      d8. (c16) b8-. b4 b8 |
      b8. (c16) a8-. r a (b) |
      c16 (d e b c a)
      g4 (a8) |
      a8. (b16) g8-. r8 g\mf (b) |
      \app  b16 (a8.) g16 fis8 r a (c) |
%7
      \app  c16 (b8.) a16\> g8\! r8 g (a) | b8 (c) r fis, (g a) | fis4. r4 r8 | R2.*3|
%13
      r4 r8 r g8\f (a) | b (g) d'-. r g, (a)\p | b (g) d'-. r g, (a)|
%16
      e'16 (d c b a g) g4 (a8) |a4 (b8) r g\f (a) | b (g) d'-. r g,\p (a) |
%19
      b (g) d'-. r8 b (c) | e16-- [(d c b a g)] b8. (d16 a d) |\break
      g,4 r8 \fermata d'8-.^\markup \bold "Allegretto" d8-.d8-. | cis16 (d e d a8) a-. [a-. a-.]
%23
    a8 (b) g-. d'8-. [d8-.d8-.] | cis16 (d e d a8) a-. [a-. a-.] |
    a8 (b) g-. d'8-. [d8-.d8-.] | cis16 (d e d a8) a-. [a-. a-.] |
%27
    a8 (b) g-. b ([c16 b a g)] | fis8 (a d cis [e a,)] | fis'4 (d8) b[ (c16 b a g)] |
    fis8 (a d cis [e a,)] |
     fis'4 (d8) b [(c16 b a g)] | fis8 (a d cis [e a,)] |
    fis'4 (d8) r4 r8 | R2. | r4 r8 d (cis b) | gis r \fermata a8 \fermata \bar "||"

    \clef treble
    \set fontSize = # -3
    d'8\f ^\markup "Viol. I." [d\p e] | \unset fontSize
    \clef bass R2.*3 |\pageTurn
    r4 r8 d,8-. \f d16\p (cis e d) |
    fis8. (d16) b8-. b\f [b16\p (ais cis b)] |
%42
    d8. (b16) g8 g-.\f [g16\p (fis a g)] |
    b8. (g16) e8-. a16 [ (b a fis g e)] |
    d4 r8 r4 r8 |
%45
    r4 r8 e'8 (c! a) |
    fis4 r8 r4 r8 |
    r4 r8 e'8 (c! a) | fis (a c e [c a)] |
%49
    fis (a c e [c a)] |fis (a c e [c a)] | fis4.\fermata d'8-. d8-. d8-.  |
%52
    cis16 (d e d a8) a [a a] | a (b) g-. d'8-. [d8-. d8-.]  |
     cis16 (d e d a8) a [a a] | a (b) g-. d'8-. [d8-. d8-.]  |
     cis16 (d e d a8) a [a a] | a (b) g-. b [(c!16 b a b)]  |
%58
    g4 (d8) b' [(c16 b c a)] | e'8 (d) d-. b [ (c16 b a b)] | g4 (d8) b' [ (c16 b c a)] |
    e'8 (d) d-. b [ (c16 b a b)] | g4 (d8) b' [ (c16 b c a)] |
%63
     e'8 (d) d-. r4 r8 | R2.| r4 r8 d (c b) | gis r8 \fermata a \fermata
     \clef treble
    \set fontSize = # -3
    d'8\f ^\markup "Viol. I" [e fis] |\unset fontSize
    \clef bass R2.*3 |
%70
    r4 r8 d,8\fp (e fis) | g8. (d16) b8-. b16\fp (d c e d f) |
    e8. (c16) a8-. a16\fp (c b d c e) | d8 (b g) d16 (fis e g fis a) |
%74
    g4 r8 b16 (ais b ais b ais |
    b8) r r d16 (cis d cis d cis |
    d8) r r g16 (fis g fis g fis |
    g8) r r e16 (dis e dis e dis |
    e8) r r c16 (b c b c b) |
%79
    c4.\sfp \fermata d,8 r r  \fermata | R2.*3 |
%83
    r4 r8 e'4._\markup \italic { {\dynamic p }"cresc." } | c d |
    g,8 g g e\f [e e] | c c c d [d d ] | g,4 r8 \fermata d''-.\p d-. d-. |
%88
    cis16 (d e d a8) r4 r8 | r4 r8 d-.\p d-. d-. |cis16 (d e d a8) a8 [a a] |
%91
    a (b) g-.  d'-.\p d-. d-. |cis16 (d e d a8) a8 [a a] |
%93
    b4 r8 b (g d' | b g d' c a d) | b8 r r b (g d' | b g d' c a d) |
  \override TextScript #'staff-padding = #+8
    b r r_\markup \bold \box \pad-markup #2 "     Recitativo     " a r r b r r a r r |
    g4 r8 r4 r8 \bar "|."

}


Duetto = \relative c {



     \set Score.skipBars = ##t
   %     \set Staff.printKeyCancellation = ##t  %(barre horizontale pour les multi-mesures)

         \set Staff.midiInstrument = "bassoon"
         \set Staff.printKeyCancellation = ##f

  \override Staff.VerticalAxisGroup.minimum-Y-extent = #'(-6 . 6)
  \override TextScript.padding = #2.0
  \override MultiMeasureRest.expand-limit = 1

  \set Timing.beamExceptions = #'() 		% on désactive la ligature automatique
  \set Timing.baseMoment = #(ly:make-moment 1/8) 	% Encore les croches
  \set Timing.beatStructure = #'(3 8) 		% liées par 3



  \clef "bass"
  \time 2/4
   \key bes \major

  \mark \markup { \bold \fontsize #2 "N° 20 - Duetto"   }

    \partial 8


    r8^\markup \bold { \halign #0.5  "Andante" } |
    \set fontSize = # -2 bes\p ^\markup "   Bassi" \set fontSize = # -3 r f' r | bes r f (es) |
    d r bes r | r f' f, r |
   \unset fontSize  R2*16 |

%21
    c''2\p (| d c d) | b8 (c) r4 | R2*6 | es2~\f | es4 r | r r8\fermata r | R2*5 |

    r8 es,\p [es,] r | R2 | r8 f' f, r | R2*10 | r4 r8 r\fermata
%3ème sysyème
     r8 d''16\mfp (c) es\mfp [(d)] f\mfp [(es)] |
    g\mfp (f) es-. d-. c-. d-. es-. f-. |
    d8 d16\mfp (c) es\mfp [(d)] f\mfp [(es)] |
     g\mfp (f) es-. d-. c-. d-. es-. f-. | d8 r r4 |  R2*5 |
% 4ème sysyème
    r4 es\p | d c |
    f8 r r4 | R2*3 |
    r8 es8 (d c)
    f4 (g_\markup \italic "cresc.")|
    f8 (d es c) | bes8 r c (es | d f es cis) | d4 g |
% dernier système
    f4~ f16 (d es c) | bes8-. d-. bes-. r \bar "|."

}




\score {


  \header  { piece = "" }
  \new Voice <<
     \include "/commun/améliorations.ly"
    \Aria >>
  \layout {
    \context { \Score
	\override SpacingSpanner #'common-shortest-duration =
	#(ly:make-moment 1 16)  %(Plus le dernier chiffre est grand, plus la partition sera étirée)
	}


    \set restNumberThreshold = #0

  \override DynamicLineSpanner #'staff-padding =#2.0 	% toutes les dynamiques alignées


}
   \midi { }

}

%{

\score {
  \new Voice <<
     \include "/commun/améliorations.ly"
    \Duetto  >>
  \layout {
    \context { \Score
	\override SpacingSpanner #'common-shortest-duration =
	#(ly:make-moment 1 16)  %(Plus le dernier chiffre est grand, plus la partition sera étirée)

	\override DynamicLineSpanner #'staff-padding =#2.0
	}
    \set restNumberThreshold = #0 }


%  \header  { piece = "Coro"   }
  \midi { }

%}





