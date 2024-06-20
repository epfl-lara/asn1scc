; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24614 () Bool)

(assert start!24614)

(declare-fun b!124832 () Bool)

(declare-fun res!103339 () Bool)

(declare-fun e!81981 () Bool)

(assert (=> b!124832 (=> (not res!103339) (not e!81981))))

(declare-datatypes ((array!5578 0))(
  ( (array!5579 (arr!3119 (Array (_ BitVec 32) (_ BitVec 8))) (size!2526 (_ BitVec 32))) )
))
(declare-fun a2!934 () array!5578)

(declare-fun to!880 () (_ BitVec 64))

(declare-fun a1!934 () array!5578)

(declare-fun from!913 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!5578 array!5578 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!124832 (= res!103339 (arrayBitRangesEq!0 a1!934 a2!934 from!913 to!880))))

(declare-fun b!124835 () Bool)

(declare-fun i!1051 () (_ BitVec 64))

(assert (=> b!124835 (= e!81981 (and (not (= (bvand to!880 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!1051 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= (bvand to!880 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!880 i!1051) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!103340 () Bool)

(assert (=> start!24614 (=> (not res!103340) (not e!81981))))

(declare-fun atByte!11 () (_ BitVec 32))

(assert (=> start!24614 (= res!103340 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!913) (bvsle from!913 to!880) (= (size!2526 a1!934) (size!2526 a2!934)) (bvsle to!880 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2526 a1!934)))) (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (bvslt ((_ sign_extend 32) atByte!11) (bvsdiv to!880 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> start!24614 e!81981))

(declare-fun array_inv!2315 (array!5578) Bool)

(assert (=> start!24614 (array_inv!2315 a2!934)))

(assert (=> start!24614 true))

(assert (=> start!24614 (array_inv!2315 a1!934)))

(declare-fun b!124834 () Bool)

(declare-fun res!103341 () Bool)

(assert (=> b!124834 (=> (not res!103341) (not e!81981))))

(assert (=> b!124834 (= res!103341 (arrayBitRangesEq!0 a1!934 a2!934 i!1051 to!880))))

(declare-fun b!124833 () Bool)

(declare-fun res!103342 () Bool)

(assert (=> b!124833 (=> (not res!103342) (not e!81981))))

(assert (=> b!124833 (= res!103342 (and (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) i!1051) (bvsle i!1051 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!11)))))))

(assert (= (and start!24614 res!103340) b!124832))

(assert (= (and b!124832 res!103339) b!124833))

(assert (= (and b!124833 res!103342) b!124834))

(assert (= (and b!124834 res!103341) b!124835))

(declare-fun m!190159 () Bool)

(assert (=> b!124832 m!190159))

(declare-fun m!190161 () Bool)

(assert (=> start!24614 m!190161))

(declare-fun m!190163 () Bool)

(assert (=> start!24614 m!190163))

(declare-fun m!190165 () Bool)

(assert (=> b!124834 m!190165))

(push 1)

(assert (not b!124832))

(assert (not start!24614))

(assert (not b!124834))

(check-sat)

(pop 1)

(push 1)

(check-sat)

