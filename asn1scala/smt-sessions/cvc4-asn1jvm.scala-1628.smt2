; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45914 () Bool)

(assert start!45914)

(declare-fun res!186517 () Bool)

(declare-fun e!150562 () Bool)

(assert (=> start!45914 (=> (not res!186517) (not e!150562))))

(declare-fun v!298 () (_ BitVec 64))

(assert (=> start!45914 (= res!186517 (and (bvslt v!298 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt v!298 #b1111111111111111111111111111111111111111111111111111111110000000) (bvslt v!298 #b1111111111111111111111111111111111111111111111111000000000000000) (bvsge v!298 #b1111111111111111111111111111111111111111100000000000000000000000)))))

(assert (=> start!45914 e!150562))

(assert (=> start!45914 true))

(declare-fun b!221745 () Bool)

(assert (=> b!221745 (= e!150562 false)))

(declare-datatypes ((Unit!15811 0))(
  ( (Unit!15812) )
))
(declare-datatypes ((tuple3!1066 0))(
  ( (tuple3!1067 (_1!10168 Unit!15811) (_2!10168 (_ BitVec 32)) (_3!675 Bool)) )
))
(declare-fun lt!350177 () tuple3!1066)

(declare-fun GetBytesNeededForNegativeNumberWhile!0 ((_ BitVec 64) (_ BitVec 32) Bool) tuple3!1066)

(assert (=> b!221745 (= lt!350177 (GetBytesNeededForNegativeNumberWhile!0 v!298 #b00000000000000000000000000010111 true))))

(assert (= (and start!45914 res!186517) b!221745))

(declare-fun m!340263 () Bool)

(assert (=> b!221745 m!340263))

(push 1)

