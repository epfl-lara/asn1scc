; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46006 () Bool)

(assert start!46006)

(declare-fun res!186747 () Bool)

(declare-fun e!150956 () Bool)

(assert (=> start!46006 (=> (not res!186747) (not e!150956))))

(declare-fun v!298 () (_ BitVec 64))

(assert (=> start!46006 (= res!186747 (and (bvslt v!298 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt v!298 #b1111111111111111111111111111111111111111111111111111111110000000) (bvslt v!298 #b1111111111111111111111111111111111111111111111111000000000000000) (bvslt v!298 #b1111111111111111111111111111111111111111100000000000000000000000) (bvslt v!298 #b1111111111111111111111111111111110000000000000000000000000000000) (bvslt v!298 #b1111111111111111111111111000000000000000000000000000000000000000) (bvslt v!298 #b1111111111111111100000000000000000000000000000000000000000000000) (bvsge v!298 #b1111111110000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!46006 e!150956))

(assert (=> start!46006 true))

(declare-fun b!222303 () Bool)

(assert (=> b!222303 (= e!150956 false)))

(declare-datatypes ((Unit!15994 0))(
  ( (Unit!15995) )
))
(declare-datatypes ((tuple3!1110 0))(
  ( (tuple3!1111 (_1!10190 Unit!15994) (_2!10190 (_ BitVec 32)) (_3!697 Bool)) )
))
(declare-fun lt!351191 () tuple3!1110)

(declare-fun GetBytesNeededForNegativeNumberWhile!0 ((_ BitVec 64) (_ BitVec 32) Bool) tuple3!1110)

(assert (=> b!222303 (= lt!351191 (GetBytesNeededForNegativeNumberWhile!0 v!298 #b00000000000000000000000000110111 true))))

(assert (= (and start!46006 res!186747) b!222303))

(declare-fun m!340587 () Bool)

(assert (=> b!222303 m!340587))

(push 1)

(assert (not b!222303))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

