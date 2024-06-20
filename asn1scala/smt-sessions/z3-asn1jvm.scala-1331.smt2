; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37440 () Bool)

(assert start!37440)

(declare-fun uintSizeInBytes!5 () (_ BitVec 32))

(declare-fun v!147 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((Unit!11873 0))(
  ( (Unit!11874) )
))
(declare-datatypes ((ControlFlow!56 0))(
  ( (Return!55 (value!6836 (_ BitVec 64))) (Proceed!55 (value!6837 Unit!11873)) )
))
(declare-fun Unit!11875 () Unit!11873)

(assert (=> start!37440 false))

(assert (=> start!37440 true))

(check-sat)
