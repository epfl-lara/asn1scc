; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3178 () Bool)

(assert start!3178)

(declare-fun uintSizeInBytes!2 () (_ BitVec 32))

(declare-fun v!144 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((Unit!1163 0))(
  ( (Unit!1164) )
))
(declare-datatypes ((ControlFlow!14 0))(
  ( (Return!13 (value!752 (_ BitVec 64))) (Proceed!13 (value!753 Unit!1163)) )
))
(declare-fun Unit!1165 () Unit!1163)

(assert (=> start!3178 false))

(assert (=> start!3178 true))

(check-sat)
