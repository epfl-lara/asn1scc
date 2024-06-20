; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46034 () Bool)

(assert start!46034)

(declare-fun res!186789 () Bool)

(declare-fun e!151016 () Bool)

(assert (=> start!46034 (=> (not res!186789) (not e!151016))))

(declare-fun v!298 () (_ BitVec 64))

(assert (=> start!46034 (= res!186789 (and (bvslt v!298 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt v!298 #b1111111111111111111111111111111111111111111111111111111110000000) (bvslt v!298 #b1111111111111111111111111111111111111111111111111000000000000000) (bvslt v!298 #b1111111111111111111111111111111111111111100000000000000000000000) (bvslt v!298 #b1111111111111111111111111111111110000000000000000000000000000000) (bvslt v!298 #b1111111111111111111111111000000000000000000000000000000000000000) (bvslt v!298 #b1111111111111111100000000000000000000000000000000000000000000000) (bvslt v!298 #b1111111110000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!46034 e!151016))

(assert (=> start!46034 true))

(declare-fun b!222381 () Bool)

(assert (=> b!222381 (= e!151016 false)))

(declare-datatypes ((Unit!16022 0))(
  ( (Unit!16023) )
))
(declare-datatypes ((tuple3!1126 0))(
  ( (tuple3!1127 (_1!10198 Unit!16022) (_2!10198 (_ BitVec 32)) (_3!705 Bool)) )
))
(declare-fun lt!351314 () tuple3!1126)

(declare-fun GetBytesNeededForNegativeNumberWhile!0 ((_ BitVec 64) (_ BitVec 32) Bool) tuple3!1126)

(assert (=> b!222381 (= lt!351314 (GetBytesNeededForNegativeNumberWhile!0 v!298 #b00000000000000000000000000111111 true))))

(assert (= (and start!46034 res!186789) b!222381))

(declare-fun m!340627 () Bool)

(assert (=> b!222381 m!340627))

(push 1)

(assert (not b!222381))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

