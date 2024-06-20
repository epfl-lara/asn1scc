; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37538 () Bool)

(assert start!37538)

(declare-datatypes ((Unit!12011 0))(
  ( (Unit!12012) )
))
(declare-datatypes ((ControlFlow!100 0))(
  ( (Return!99 (value!6999 (_ BitVec 32))) (Proceed!99 (value!7000 Unit!12011)) )
))
(declare-fun lt!262354 () ControlFlow!100)

(declare-fun vv!44 () (_ BitVec 64))

(declare-fun Unit!12013 () Unit!12011)

(assert (=> start!37538 (= lt!262354 (ite (bvslt vv!44 #b0000000000000000000000000000000000000000000000000000000000000000) (Return!99 #b00000000000000000000000001000000) (Proceed!99 Unit!12013)))))

(assert (=> start!37538 (and (is-Return!99 lt!262354) (or (bvslt (value!6999 lt!262354) #b00000000000000000000000000000000) (bvsgt (value!6999 lt!262354) #b00000000000000000000000001000000) (and (or (not (= (value!6999 lt!262354) #b00000000000000000000000001000000)) (bvsge vv!44 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvlshr vv!44 ((_ sign_extend 32) (value!6999 lt!262354))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> start!37538 true))

(push 1)

(check-sat)

(pop 1)

