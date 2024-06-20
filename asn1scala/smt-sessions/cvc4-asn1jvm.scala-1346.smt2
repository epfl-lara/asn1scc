; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37542 () Bool)

(assert start!37542)

(declare-datatypes ((Unit!12017 0))(
  ( (Unit!12018) )
))
(declare-datatypes ((ControlFlow!102 0))(
  ( (Return!101 (value!7003 (_ BitVec 32))) (Proceed!101 (value!7004 Unit!12017)) )
))
(declare-fun lt!262360 () ControlFlow!102)

(declare-fun vv!44 () (_ BitVec 64))

(declare-fun Unit!12019 () Unit!12017)

(assert (=> start!37542 (= lt!262360 (ite (bvslt vv!44 #b0000000000000000000000000000000000000000000000000000000000000000) (Return!101 #b00000000000000000000000001000000) (Proceed!101 Unit!12019)))))

(assert (=> start!37542 (and (is-Return!101 lt!262360) (or (bvslt (value!7003 lt!262360) #b00000000000000000000000000000000) (bvsgt (value!7003 lt!262360) #b00000000000000000000000001000000) (and (or (not (= (value!7003 lt!262360) #b00000000000000000000000001000000)) (bvsge vv!44 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvlshr vv!44 ((_ sign_extend 32) (value!7003 lt!262360))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> start!37542 true))

(push 1)

(check-sat)

