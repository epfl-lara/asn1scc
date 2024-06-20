; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24616 () Bool)

(assert start!24616)

(declare-fun res!103351 () Bool)

(declare-fun e!81992 () Bool)

(assert (=> start!24616 (=> (not res!103351) (not e!81992))))

(declare-datatypes ((array!5580 0))(
  ( (array!5581 (arr!3120 (Array (_ BitVec 32) (_ BitVec 8))) (size!2527 (_ BitVec 32))) )
))
(declare-fun a2!934 () array!5580)

(declare-fun to!880 () (_ BitVec 64))

(declare-fun a1!934 () array!5580)

(declare-fun from!913 () (_ BitVec 64))

(declare-fun atByte!11 () (_ BitVec 32))

(assert (=> start!24616 (= res!103351 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!913) (bvsle from!913 to!880) (= (size!2527 a1!934) (size!2527 a2!934)) (bvsle to!880 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2527 a1!934)))) (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (bvslt ((_ sign_extend 32) atByte!11) (bvsdiv to!880 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> start!24616 e!81992))

(declare-fun array_inv!2316 (array!5580) Bool)

(assert (=> start!24616 (array_inv!2316 a2!934)))

(assert (=> start!24616 true))

(assert (=> start!24616 (array_inv!2316 a1!934)))

(declare-fun b!124844 () Bool)

(declare-fun res!103352 () Bool)

(assert (=> b!124844 (=> (not res!103352) (not e!81992))))

(declare-fun arrayBitRangesEq!0 (array!5580 array!5580 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!124844 (= res!103352 (arrayBitRangesEq!0 a1!934 a2!934 from!913 to!880))))

(declare-fun b!124846 () Bool)

(declare-fun res!103354 () Bool)

(assert (=> b!124846 (=> (not res!103354) (not e!81992))))

(declare-fun i!1051 () (_ BitVec 64))

(assert (=> b!124846 (= res!103354 (arrayBitRangesEq!0 a1!934 a2!934 i!1051 to!880))))

(declare-fun b!124847 () Bool)

(assert (=> b!124847 (= e!81992 (bvslt (bvsub to!880 i!1051) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!124845 () Bool)

(declare-fun res!103353 () Bool)

(assert (=> b!124845 (=> (not res!103353) (not e!81992))))

(assert (=> b!124845 (= res!103353 (and (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) i!1051) (bvsle i!1051 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!11)))))))

(assert (= (and start!24616 res!103351) b!124844))

(assert (= (and b!124844 res!103352) b!124845))

(assert (= (and b!124845 res!103353) b!124846))

(assert (= (and b!124846 res!103354) b!124847))

(declare-fun m!190167 () Bool)

(assert (=> start!24616 m!190167))

(declare-fun m!190169 () Bool)

(assert (=> start!24616 m!190169))

(declare-fun m!190171 () Bool)

(assert (=> b!124844 m!190171))

(declare-fun m!190173 () Bool)

(assert (=> b!124846 m!190173))

(push 1)

(assert (not b!124844))

(assert (not b!124846))

(assert (not start!24616))

(check-sat)

(pop 1)

(push 1)

(check-sat)

