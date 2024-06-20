; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45890 () Bool)

(assert start!45890)

(declare-fun res!186433 () Bool)

(declare-fun e!150412 () Bool)

(assert (=> start!45890 (=> (not res!186433) (not e!150412))))

(declare-fun v!298 () (_ BitVec 64))

(assert (=> start!45890 (= res!186433 (and (bvslt v!298 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt v!298 #b1111111111111111111111111111111111111111111111111111111110000000) (bvsge v!298 #b1111111111111111111111111111111111111111111111111000000000000000)))))

(assert (=> start!45890 e!150412))

(assert (=> start!45890 true))

(declare-fun b!221529 () Bool)

(assert (=> b!221529 (= e!150412 false)))

(declare-datatypes ((Unit!15739 0))(
  ( (Unit!15740) )
))
(declare-datatypes ((tuple3!1054 0))(
  ( (tuple3!1055 (_1!10162 Unit!15739) (_2!10162 (_ BitVec 32)) (_3!669 Bool)) )
))
(declare-fun lt!349772 () tuple3!1054)

(declare-fun GetBytesNeededForNegativeNumberWhile!0 ((_ BitVec 64) (_ BitVec 32) Bool) tuple3!1054)

(assert (=> b!221529 (= lt!349772 (GetBytesNeededForNegativeNumberWhile!0 v!298 #b00000000000000000000000000001111 true))))

(assert (= (and start!45890 res!186433) b!221529))

(declare-fun m!340131 () Bool)

(assert (=> b!221529 m!340131))

(push 1)

(assert (not b!221529))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

