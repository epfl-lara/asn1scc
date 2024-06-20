; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37550 () Bool)

(assert start!37550)

(declare-fun vv!44 () (_ BitVec 64))

(declare-datatypes ((Unit!12032 0))(
  ( (Unit!12033) )
))
(declare-datatypes ((ControlFlow!106 0))(
  ( (Return!105 (value!7021 (_ BitVec 32))) (Proceed!105 (value!7022 Unit!12032)) )
))
(declare-fun Unit!12034 () Unit!12032)

(declare-fun Unit!12035 () Unit!12032)

(assert (=> start!37550 (and (not (is-Return!105 (ite (bvslt vv!44 #b0000000000000000000000000000000000000000000000000000000000000000) (Return!105 #b00000000000000000000000001000000) (Proceed!105 Unit!12034)))) (let ((bdg!10192 (ite (= vv!44 #b0000000000000000000000000000000000000000000000000000000000000000) (Return!105 #b00000000000000000000000000000000) (Proceed!105 Unit!12035)))) (and (is-Return!105 bdg!10192) (or (bvslt (value!7021 bdg!10192) #b00000000000000000000000000000000) (bvsgt (value!7021 bdg!10192) #b00000000000000000000000001000000) (and (or (not (= (value!7021 bdg!10192) #b00000000000000000000000001000000)) (bvsge vv!44 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvlshr vv!44 ((_ sign_extend 32) (value!7021 bdg!10192))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> start!37550 true))

(push 1)

(check-sat)

(pop 1)

