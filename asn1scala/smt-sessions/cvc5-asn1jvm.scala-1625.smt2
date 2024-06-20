; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45886 () Bool)

(assert start!45886)

(declare-fun res!186427 () Bool)

(declare-fun e!150406 () Bool)

(assert (=> start!45886 (=> (not res!186427) (not e!150406))))

(declare-fun v!298 () (_ BitVec 64))

(assert (=> start!45886 (= res!186427 (and (bvslt v!298 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt v!298 #b1111111111111111111111111111111111111111111111111111111110000000) (bvsge v!298 #b1111111111111111111111111111111111111111111111111000000000000000)))))

(assert (=> start!45886 e!150406))

(assert (=> start!45886 true))

(declare-fun b!221523 () Bool)

(assert (=> b!221523 (= e!150406 false)))

(declare-datatypes ((Unit!15735 0))(
  ( (Unit!15736) )
))
(declare-datatypes ((tuple3!1050 0))(
  ( (tuple3!1051 (_1!10160 Unit!15735) (_2!10160 (_ BitVec 32)) (_3!667 Bool)) )
))
(declare-fun lt!349766 () tuple3!1050)

(declare-fun GetBytesNeededForNegativeNumberWhile!0 ((_ BitVec 64) (_ BitVec 32) Bool) tuple3!1050)

(assert (=> b!221523 (= lt!349766 (GetBytesNeededForNegativeNumberWhile!0 v!298 #b00000000000000000000000000001111 true))))

(assert (= (and start!45886 res!186427) b!221523))

(declare-fun m!340127 () Bool)

(assert (=> b!221523 m!340127))

(push 1)

(assert (not b!221523))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

