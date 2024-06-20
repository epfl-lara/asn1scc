; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37534 () Bool)

(assert start!37534)

(declare-datatypes ((Unit!12005 0))(
  ( (Unit!12006) )
))
(declare-datatypes ((ControlFlow!98 0))(
  ( (Return!97 (value!6990 (_ BitVec 32))) (Proceed!97 (value!6991 Unit!12005)) )
))
(declare-fun lt!262348 () ControlFlow!98)

(declare-fun vv!44 () (_ BitVec 64))

(declare-fun Unit!12007 () Unit!12005)

(assert (=> start!37534 (= lt!262348 (ite (bvslt vv!44 #b0000000000000000000000000000000000000000000000000000000000000000) (Return!97 #b00000000000000000000000001000000) (Proceed!97 Unit!12007)))))

(get-info :version)

(assert (=> start!37534 (and ((_ is Return!97) lt!262348) (bvsge (value!6990 lt!262348) #b00000000000000000000000000000000) (bvsle (value!6990 lt!262348) #b00000000000000000000000001000000) (or (not (= (value!6990 lt!262348) #b00000000000000000000000001000000)) (bvsge vv!44 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (bvslt ((_ sign_extend 32) (value!6990 lt!262348)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt ((_ sign_extend 32) (value!6990 lt!262348)) #b0000000000000000000000000000000000000000000000000000000001000000)))))

(assert (=> start!37534 true))

(check-sat)
