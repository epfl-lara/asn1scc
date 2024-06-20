; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24670 () Bool)

(assert start!24670)

(declare-fun b!125096 () Bool)

(declare-fun res!103579 () Bool)

(declare-fun e!82195 () Bool)

(assert (=> b!125096 (=> (not res!103579) (not e!82195))))

(declare-datatypes ((array!5607 0))(
  ( (array!5608 (arr!3132 (Array (_ BitVec 32) (_ BitVec 8))) (size!2539 (_ BitVec 32))) )
))
(declare-fun a2!934 () array!5607)

(declare-fun to!880 () (_ BitVec 64))

(declare-fun a1!934 () array!5607)

(declare-fun from!913 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!5607 array!5607 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!125096 (= res!103579 (arrayBitRangesEq!0 a1!934 a2!934 from!913 to!880))))

(declare-fun res!103580 () Bool)

(assert (=> start!24670 (=> (not res!103580) (not e!82195))))

(declare-fun atByte!11 () (_ BitVec 32))

(assert (=> start!24670 (= res!103580 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!913) (bvsle from!913 to!880) (= (size!2539 a1!934) (size!2539 a2!934)) (bvsle to!880 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2539 a1!934)))) (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (bvslt ((_ sign_extend 32) atByte!11) (bvsdiv to!880 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> start!24670 e!82195))

(declare-fun array_inv!2328 (array!5607) Bool)

(assert (=> start!24670 (array_inv!2328 a2!934)))

(assert (=> start!24670 true))

(assert (=> start!24670 (array_inv!2328 a1!934)))

(declare-fun b!125097 () Bool)

(declare-fun res!103582 () Bool)

(assert (=> b!125097 (=> (not res!103582) (not e!82195))))

(declare-fun i!1051 () (_ BitVec 64))

(assert (=> b!125097 (= res!103582 (and (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) i!1051) (bvsle i!1051 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!11)))))))

(declare-fun b!125098 () Bool)

(declare-fun res!103581 () Bool)

(assert (=> b!125098 (=> (not res!103581) (not e!82195))))

(assert (=> b!125098 (= res!103581 (arrayBitRangesEq!0 a1!934 a2!934 i!1051 to!880))))

(declare-fun b!125099 () Bool)

(assert (=> b!125099 (= e!82195 (and (not (= (bvsdiv i!1051 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11))) (= (bvand i!1051 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand i!1051 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!24670 res!103580) b!125096))

(assert (= (and b!125096 res!103579) b!125097))

(assert (= (and b!125097 res!103582) b!125098))

(assert (= (and b!125098 res!103581) b!125099))

(declare-fun m!190449 () Bool)

(assert (=> b!125096 m!190449))

(declare-fun m!190451 () Bool)

(assert (=> start!24670 m!190451))

(declare-fun m!190453 () Bool)

(assert (=> start!24670 m!190453))

(declare-fun m!190455 () Bool)

(assert (=> b!125098 m!190455))

(push 1)

(assert (not b!125098))

(assert (not start!24670))

(assert (not b!125096))

(check-sat)

(pop 1)

(push 1)

(check-sat)

