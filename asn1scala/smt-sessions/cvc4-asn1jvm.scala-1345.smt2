; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37536 () Bool)

(assert start!37536)

(declare-datatypes ((Unit!12008 0))(
  ( (Unit!12009) )
))
(declare-datatypes ((ControlFlow!99 0))(
  ( (Return!98 (value!6992 (_ BitVec 32))) (Proceed!98 (value!6993 Unit!12008)) )
))
(declare-fun lt!262351 () ControlFlow!99)

(declare-fun vv!44 () (_ BitVec 64))

(declare-fun Unit!12010 () Unit!12008)

(assert (=> start!37536 (= lt!262351 (ite (bvslt vv!44 #b0000000000000000000000000000000000000000000000000000000000000000) (Return!98 #b00000000000000000000000001000000) (Proceed!98 Unit!12010)))))

(assert (=> start!37536 (and (is-Return!98 lt!262351) (bvsge (value!6992 lt!262351) #b00000000000000000000000000000000) (bvsle (value!6992 lt!262351) #b00000000000000000000000001000000) (or (not (= (value!6992 lt!262351) #b00000000000000000000000001000000)) (bvsge vv!44 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (bvslt ((_ sign_extend 32) (value!6992 lt!262351)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt ((_ sign_extend 32) (value!6992 lt!262351)) #b0000000000000000000000000000000000000000000000000000000001000000)))))

(assert (=> start!37536 true))

(push 1)

(check-sat)

