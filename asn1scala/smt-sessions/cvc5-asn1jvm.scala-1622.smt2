; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45862 () Bool)

(assert start!45862)

(declare-fun res!186332 () Bool)

(declare-fun e!150234 () Bool)

(assert (=> start!45862 (=> (not res!186332) (not e!150234))))

(declare-fun v!298 () (_ BitVec 64))

(assert (=> start!45862 (= res!186332 (and (bvslt v!298 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge v!298 #b1111111111111111111111111111111111111111111111111111111110000000)))))

(assert (=> start!45862 e!150234))

(assert (=> start!45862 true))

(declare-fun b!221274 () Bool)

(assert (=> b!221274 (= e!150234 false)))

(declare-datatypes ((Unit!15652 0))(
  ( (Unit!15653) )
))
(declare-datatypes ((tuple3!1038 0))(
  ( (tuple3!1039 (_1!10154 Unit!15652) (_2!10154 (_ BitVec 32)) (_3!661 Bool)) )
))
(declare-fun lt!349295 () tuple3!1038)

(declare-fun GetBytesNeededForNegativeNumberWhile!0 ((_ BitVec 64) (_ BitVec 32) Bool) tuple3!1038)

(assert (=> b!221274 (= lt!349295 (GetBytesNeededForNegativeNumberWhile!0 v!298 #b00000000000000000000000000000111 true))))

(assert (= (and start!45862 res!186332) b!221274))

(declare-fun m!339973 () Bool)

(assert (=> b!221274 m!339973))

(push 1)

(assert (not b!221274))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

