; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37540 () Bool)

(assert start!37540)

(declare-datatypes ((Unit!12014 0))(
  ( (Unit!12015) )
))
(declare-datatypes ((ControlFlow!101 0))(
  ( (Return!100 (value!7001 (_ BitVec 32))) (Proceed!100 (value!7002 Unit!12014)) )
))
(declare-fun lt!262357 () ControlFlow!101)

(declare-fun vv!44 () (_ BitVec 64))

(declare-fun Unit!12016 () Unit!12014)

(assert (=> start!37540 (= lt!262357 (ite (bvslt vv!44 #b0000000000000000000000000000000000000000000000000000000000000000) (Return!100 #b00000000000000000000000001000000) (Proceed!100 Unit!12016)))))

(get-info :version)

(assert (=> start!37540 (and ((_ is Return!100) lt!262357) (or (bvslt (value!7001 lt!262357) #b00000000000000000000000000000000) (bvsgt (value!7001 lt!262357) #b00000000000000000000000001000000) (and (or (not (= (value!7001 lt!262357) #b00000000000000000000000001000000)) (bvsge vv!44 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvlshr vv!44 ((_ sign_extend 32) (value!7001 lt!262357))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> start!37540 true))

(check-sat)
