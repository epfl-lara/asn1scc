; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45866 () Bool)

(assert start!45866)

(declare-fun res!186338 () Bool)

(declare-fun e!150240 () Bool)

(assert (=> start!45866 (=> (not res!186338) (not e!150240))))

(declare-fun v!298 () (_ BitVec 64))

(assert (=> start!45866 (= res!186338 (and (bvslt v!298 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge v!298 #b1111111111111111111111111111111111111111111111111111111110000000)))))

(assert (=> start!45866 e!150240))

(assert (=> start!45866 true))

(declare-fun b!221280 () Bool)

(assert (=> b!221280 (= e!150240 false)))

(declare-datatypes ((Unit!15656 0))(
  ( (Unit!15657) )
))
(declare-datatypes ((tuple3!1042 0))(
  ( (tuple3!1043 (_1!10156 Unit!15656) (_2!10156 (_ BitVec 32)) (_3!663 Bool)) )
))
(declare-fun lt!349301 () tuple3!1042)

(declare-fun GetBytesNeededForNegativeNumberWhile!0 ((_ BitVec 64) (_ BitVec 32) Bool) tuple3!1042)

(assert (=> b!221280 (= lt!349301 (GetBytesNeededForNegativeNumberWhile!0 v!298 #b00000000000000000000000000000111 true))))

(assert (= (and start!45866 res!186338) b!221280))

(declare-fun m!339977 () Bool)

(assert (=> b!221280 m!339977))

(push 1)

