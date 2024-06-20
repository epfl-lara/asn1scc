; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37552 () Bool)

(assert start!37552)

(declare-fun vv!44 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((Unit!12036 0))(
  ( (Unit!12037) )
))
(declare-datatypes ((ControlFlow!107 0))(
  ( (Return!106 (value!7023 (_ BitVec 32))) (Proceed!106 (value!7024 Unit!12036)) )
))
(declare-fun Unit!12038 () Unit!12036)

(declare-fun Unit!12039 () Unit!12036)

(assert (=> start!37552 (and (not ((_ is Return!106) (ite (bvslt vv!44 #b0000000000000000000000000000000000000000000000000000000000000000) (Return!106 #b00000000000000000000000001000000) (Proceed!106 Unit!12038)))) (let ((bdg!10192 (ite (= vv!44 #b0000000000000000000000000000000000000000000000000000000000000000) (Return!106 #b00000000000000000000000000000000) (Proceed!106 Unit!12039)))) (and ((_ is Return!106) bdg!10192) (or (bvslt (value!7023 bdg!10192) #b00000000000000000000000000000000) (bvsgt (value!7023 bdg!10192) #b00000000000000000000000001000000) (and (or (not (= (value!7023 bdg!10192) #b00000000000000000000000001000000)) (bvsge vv!44 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvlshr vv!44 ((_ sign_extend 32) (value!7023 bdg!10192))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> start!37552 true))

(check-sat)
