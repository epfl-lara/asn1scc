; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24620 () Bool)

(assert start!24620)

(declare-fun b!124871 () Bool)

(declare-fun e!82008 () Bool)

(declare-fun to!880 () (_ BitVec 64))

(declare-fun i!1051 () (_ BitVec 64))

(assert (=> b!124871 (= e!82008 (bvslt (bvsub to!880 i!1051) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!124870 () Bool)

(declare-fun res!103376 () Bool)

(assert (=> b!124870 (=> (not res!103376) (not e!82008))))

(declare-datatypes ((array!5584 0))(
  ( (array!5585 (arr!3122 (Array (_ BitVec 32) (_ BitVec 8))) (size!2529 (_ BitVec 32))) )
))
(declare-fun a2!934 () array!5584)

(declare-fun a1!934 () array!5584)

(declare-fun arrayBitRangesEq!0 (array!5584 array!5584 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!124870 (= res!103376 (arrayBitRangesEq!0 a1!934 a2!934 i!1051 to!880))))

(declare-fun b!124869 () Bool)

(declare-fun res!103375 () Bool)

(assert (=> b!124869 (=> (not res!103375) (not e!82008))))

(declare-fun atByte!11 () (_ BitVec 32))

(declare-fun from!913 () (_ BitVec 64))

(assert (=> b!124869 (= res!103375 (and (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) i!1051) (bvsle i!1051 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!11)))))))

(declare-fun res!103378 () Bool)

(assert (=> start!24620 (=> (not res!103378) (not e!82008))))

(assert (=> start!24620 (= res!103378 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!913) (bvsle from!913 to!880) (= (size!2529 a1!934) (size!2529 a2!934)) (bvsle to!880 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2529 a1!934)))) (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (bvslt ((_ sign_extend 32) atByte!11) (bvsdiv to!880 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> start!24620 e!82008))

(declare-fun array_inv!2318 (array!5584) Bool)

(assert (=> start!24620 (array_inv!2318 a2!934)))

(assert (=> start!24620 true))

(assert (=> start!24620 (array_inv!2318 a1!934)))

(declare-fun b!124868 () Bool)

(declare-fun res!103377 () Bool)

(assert (=> b!124868 (=> (not res!103377) (not e!82008))))

(assert (=> b!124868 (= res!103377 (arrayBitRangesEq!0 a1!934 a2!934 from!913 to!880))))

(assert (= (and start!24620 res!103378) b!124868))

(assert (= (and b!124868 res!103377) b!124869))

(assert (= (and b!124869 res!103375) b!124870))

(assert (= (and b!124870 res!103376) b!124871))

(declare-fun m!190183 () Bool)

(assert (=> b!124870 m!190183))

(declare-fun m!190185 () Bool)

(assert (=> start!24620 m!190185))

(declare-fun m!190187 () Bool)

(assert (=> start!24620 m!190187))

(declare-fun m!190189 () Bool)

(assert (=> b!124868 m!190189))

(push 1)

(assert (not b!124868))

(assert (not b!124870))

(assert (not start!24620))

(check-sat)

(pop 1)

(push 1)

(check-sat)

