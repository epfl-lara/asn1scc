; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45888 () Bool)

(assert start!45888)

(declare-fun res!186430 () Bool)

(declare-fun e!150409 () Bool)

(assert (=> start!45888 (=> (not res!186430) (not e!150409))))

(declare-fun v!298 () (_ BitVec 64))

(assert (=> start!45888 (= res!186430 (and (bvslt v!298 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt v!298 #b1111111111111111111111111111111111111111111111111111111110000000) (bvsge v!298 #b1111111111111111111111111111111111111111111111111000000000000000)))))

(assert (=> start!45888 e!150409))

(assert (=> start!45888 true))

(declare-fun b!221526 () Bool)

(assert (=> b!221526 (= e!150409 false)))

(declare-datatypes ((Unit!15737 0))(
  ( (Unit!15738) )
))
(declare-datatypes ((tuple3!1052 0))(
  ( (tuple3!1053 (_1!10161 Unit!15737) (_2!10161 (_ BitVec 32)) (_3!668 Bool)) )
))
(declare-fun lt!349769 () tuple3!1052)

(declare-fun GetBytesNeededForNegativeNumberWhile!0 ((_ BitVec 64) (_ BitVec 32) Bool) tuple3!1052)

(assert (=> b!221526 (= lt!349769 (GetBytesNeededForNegativeNumberWhile!0 v!298 #b00000000000000000000000000001111 true))))

(assert (= (and start!45888 res!186430) b!221526))

(declare-fun m!340129 () Bool)

(assert (=> b!221526 m!340129))

(check-sat (not b!221526))
