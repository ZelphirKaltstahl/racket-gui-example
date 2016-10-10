#lang racket/gui

(require racket/gui/base)

(define nil '())

(define application-frame
  (new frame%
    [label "Example"]
    [width 400]
    [height 300]))

(define menu-bar
  (new menu-bar%
    [parent application-frame]))

(define file-menu
  (new menu%
    [label "&File"]
    [parent menu-bar]))

(new menu%
  [label "&Edit"]
  [parent menu-bar])

(new menu%
  [label "&Help"]
  [parent menu-bar])

(new menu-item%
  [label "E&xit"]
  [parent file-menu]
  [callback
    (λ (m event)
      (exit nil))])

(define tab-panel
  (new tab-panel%
    [parent application-frame]
    [choices '("&Lookup" "&Training")]
    [callback
      (λ (tp event)
        (case (send tp get-item-label (send tp get-selection))
          [("&Lookup")
            (send tp change-children get-lookup-panel)]
          [("&Training")
            (send tp change-children
              (λ (children)
                (list training-panel)))]))]))

(define (get-lookup-panel children)
  (lambda (children)
    (let
      [(lookup-panel (new panel% [parent tab-panel]))]
      [(new message%
        [parent lookup-panel]
        [label "The content of the lookup panel for the lookup tab."])
      (list lookup-panel)])))

(define get-lookup-panel2
  (lambda (children)
    (list (new panel% [parent tab-panel]))))

(define (get-lookup-panel3 children)
  (list (new panel% [parent tab-panel])))

(define (get-lookup-panel4 children)
  (define lookup-panel (new panel% [parent tab-panel]))
  (define lookup-panel-message (new message% [parent lookup-panel] [label "LOOKUP"]))
  (list lookup-panel))

(define lookup-panel (new panel% [parent tab-panel]))
(define lookup-panel-content
  (new message%
    [parent lookup-panel]
    [label "The content of the lookup panel for the lookup tab."]))

(define training-panel (new panel% [parent tab-panel]))
(define training-panel-content
  (new message%
    [parent training-panel]
    [label "The content of the training panel for the training tab."]))

(define status-message
  (new message%
    [parent application-frame]
    [label "No events so far..."]
   	[auto-resize #t]))

;; Derive a new canvas (a drawing window) class to handle events
;(define my-canvas%
;  (class canvas% ; The base class is canvas%
;    ; Define overriding method to handle mouse events
;    (define/override (on-event event)
;      (send msg set-label "Canvas mouse"))
;    ; Define overriding method to handle keyboard events
;    (define/override (on-char event)
;      (send msg set-label "Canvas keyboard"))
;    ; Call the superclass init, passing on all init args
;    (super-new)))

;(new my-canvas%
;  [parent frame])

;(define panel (new horizontal-panel% [parent frame]))
;(new button% [parent panel]
;             [label "Left"]
;             [callback (lambda (button event)
;                         (send msg set-label "Left click"))])
;(new button% [parent panel]
;             [label "Right"]
;             [callback (lambda (button event)
;                         (send msg set-label "Right click"))])


(send application-frame show #t)


