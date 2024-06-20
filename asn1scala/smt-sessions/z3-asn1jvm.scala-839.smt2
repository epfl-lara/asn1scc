; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24594 () Bool)

(assert start!24594)

(declare-fun res!103264 () Bool)

(declare-fun e!81891 () Bool)

(assert (=> start!24594 (=> (not res!103264) (not e!81891))))

(declare-datatypes ((array!5558 0))(
  ( (array!5559 (arr!3109 (Array (_ BitVec 32) (_ BitVec 8))) (size!2516 (_ BitVec 32))) )
))
(declare-fun a2!934 () array!5558)

(declare-fun to!880 () (_ BitVec 64))

(declare-fun a1!934 () array!5558)

(declare-fun from!913 () (_ BitVec 64))

(declare-fun atByte!11 () (_ BitVec 32))

(assert (=> start!24594 (= res!103264 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!913) (bvsle from!913 to!880) (= (size!2516 a1!934) (size!2516 a2!934)) (bvsle to!880 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2516 a1!934)))) (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (bvslt ((_ sign_extend 32) atByte!11) (bvsdiv to!880 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> start!24594 e!81891))

(declare-fun array_inv!2305 (array!5558) Bool)

(assert (=> start!24594 (array_inv!2305 a2!934)))

(assert (=> start!24594 true))

(assert (=> start!24594 (array_inv!2305 a1!934)))

(declare-fun b!124756 () Bool)

(declare-fun res!103263 () Bool)

(assert (=> b!124756 (=> (not res!103263) (not e!81891))))

(declare-fun arrayBitRangesEq!0 (array!5558 array!5558 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!124756 (= res!103263 (arrayBitRangesEq!0 a1!934 a2!934 from!913 to!880))))

(declare-fun i!1051 () (_ BitVec 64))

(declare-fun b!124757 () Bool)

(assert (=> b!124757 (= e!81891 (and (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) i!1051) (bvsle i!1051 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!11))) (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 i!1051) (bvsgt i!1051 to!880))))))

(assert (= (and start!24594 res!103264) b!124756))

(assert (= (and b!124756 res!103263) b!124757))

(declare-fun m!190095 () Bool)

(assert (=> start!24594 m!190095))

(declare-fun m!190097 () Bool)

(assert (=> start!24594 m!190097))

(declare-fun m!190099 () Bool)

(assert (=> b!124756 m!190099))

(check-sat (not start!24594) (not b!124756))
(check-sat)
