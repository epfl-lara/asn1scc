; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46030 () Bool)

(assert start!46030)

(declare-fun res!186783 () Bool)

(declare-fun e!151010 () Bool)

(assert (=> start!46030 (=> (not res!186783) (not e!151010))))

(declare-fun v!298 () (_ BitVec 64))

(assert (=> start!46030 (= res!186783 (and (bvslt v!298 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt v!298 #b1111111111111111111111111111111111111111111111111111111110000000) (bvslt v!298 #b1111111111111111111111111111111111111111111111111000000000000000) (bvslt v!298 #b1111111111111111111111111111111111111111100000000000000000000000) (bvslt v!298 #b1111111111111111111111111111111110000000000000000000000000000000) (bvslt v!298 #b1111111111111111111111111000000000000000000000000000000000000000) (bvslt v!298 #b1111111111111111100000000000000000000000000000000000000000000000) (bvslt v!298 #b1111111110000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!46030 e!151010))

(assert (=> start!46030 true))

(declare-fun b!222375 () Bool)

(assert (=> b!222375 (= e!151010 false)))

(declare-datatypes ((Unit!16018 0))(
  ( (Unit!16019) )
))
(declare-datatypes ((tuple3!1122 0))(
  ( (tuple3!1123 (_1!10196 Unit!16018) (_2!10196 (_ BitVec 32)) (_3!703 Bool)) )
))
(declare-fun lt!351308 () tuple3!1122)

(declare-fun GetBytesNeededForNegativeNumberWhile!0 ((_ BitVec 64) (_ BitVec 32) Bool) tuple3!1122)

(assert (=> b!222375 (= lt!351308 (GetBytesNeededForNegativeNumberWhile!0 v!298 #b00000000000000000000000000111111 true))))

(assert (= (and start!46030 res!186783) b!222375))

(declare-fun m!340623 () Bool)

(assert (=> b!222375 m!340623))

(push 1)

(assert (not b!222375))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

