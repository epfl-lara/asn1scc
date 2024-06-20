; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37554 () Bool)

(assert start!37554)

(declare-fun vv!44 () (_ BitVec 64))

(declare-datatypes ((Unit!12040 0))(
  ( (Unit!12041) )
))
(declare-datatypes ((ControlFlow!108 0))(
  ( (Return!107 (value!7025 (_ BitVec 32))) (Proceed!107 (value!7026 Unit!12040)) )
))
(declare-fun Unit!12042 () Unit!12040)

(declare-fun Unit!12043 () Unit!12040)

(assert (=> start!37554 (and (not (is-Return!107 (ite (bvslt vv!44 #b0000000000000000000000000000000000000000000000000000000000000000) (Return!107 #b00000000000000000000000001000000) (Proceed!107 Unit!12042)))) (let ((bdg!10192 (ite (= vv!44 #b0000000000000000000000000000000000000000000000000000000000000000) (Return!107 #b00000000000000000000000000000000) (Proceed!107 Unit!12043)))) (and (is-Return!107 bdg!10192) (or (bvslt (value!7025 bdg!10192) #b00000000000000000000000000000000) (bvsgt (value!7025 bdg!10192) #b00000000000000000000000001000000) (and (or (not (= (value!7025 bdg!10192) #b00000000000000000000000001000000)) (bvsge vv!44 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvlshr vv!44 ((_ sign_extend 32) (value!7025 bdg!10192))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> start!37554 true))

(push 1)

(check-sat)

(pop 1)

