; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37546 () Bool)

(assert start!37546)

(declare-fun vv!44 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((Unit!12024 0))(
  ( (Unit!12025) )
))
(declare-datatypes ((ControlFlow!104 0))(
  ( (Return!103 (value!7012 (_ BitVec 32))) (Proceed!103 (value!7013 Unit!12024)) )
))
(declare-fun Unit!12026 () Unit!12024)

(declare-fun Unit!12027 () Unit!12024)

(assert (=> start!37546 (and (not ((_ is Return!103) (ite (bvslt vv!44 #b0000000000000000000000000000000000000000000000000000000000000000) (Return!103 #b00000000000000000000000001000000) (Proceed!103 Unit!12026)))) (let ((bdg!10191 (ite (= vv!44 #b0000000000000000000000000000000000000000000000000000000000000000) (Return!103 #b00000000000000000000000000000000) (Proceed!103 Unit!12027)))) (and ((_ is Return!103) bdg!10191) (bvsge (value!7012 bdg!10191) #b00000000000000000000000000000000) (bvsle (value!7012 bdg!10191) #b00000000000000000000000001000000) (or (not (= (value!7012 bdg!10191) #b00000000000000000000000001000000)) (bvsge vv!44 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (bvslt ((_ sign_extend 32) (value!7012 bdg!10191)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt ((_ sign_extend 32) (value!7012 bdg!10191)) #b0000000000000000000000000000000000000000000000000000000001000000)))))))

(assert (=> start!37546 true))

(check-sat)
