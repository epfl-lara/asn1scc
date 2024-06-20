; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24622 () Bool)

(assert start!24622)

(declare-fun res!103390 () Bool)

(declare-fun e!82019 () Bool)

(assert (=> start!24622 (=> (not res!103390) (not e!82019))))

(declare-datatypes ((array!5586 0))(
  ( (array!5587 (arr!3123 (Array (_ BitVec 32) (_ BitVec 8))) (size!2530 (_ BitVec 32))) )
))
(declare-fun a2!934 () array!5586)

(declare-fun to!880 () (_ BitVec 64))

(declare-fun from!913 () (_ BitVec 64))

(declare-fun atByte!11 () (_ BitVec 32))

(declare-fun a1!934 () array!5586)

(assert (=> start!24622 (= res!103390 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!913) (bvsle from!913 to!880) (= (size!2530 a1!934) (size!2530 a2!934)) (bvsle to!880 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2530 a1!934)))) (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (bvslt ((_ sign_extend 32) atByte!11) (bvsdiv to!880 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> start!24622 e!82019))

(declare-fun array_inv!2319 (array!5586) Bool)

(assert (=> start!24622 (array_inv!2319 a2!934)))

(assert (=> start!24622 true))

(assert (=> start!24622 (array_inv!2319 a1!934)))

(declare-fun b!124882 () Bool)

(declare-fun res!103389 () Bool)

(assert (=> b!124882 (=> (not res!103389) (not e!82019))))

(declare-fun i!1051 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!5586 array!5586 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!124882 (= res!103389 (arrayBitRangesEq!0 a1!934 a2!934 i!1051 to!880))))

(declare-fun b!124881 () Bool)

(declare-fun res!103388 () Bool)

(assert (=> b!124881 (=> (not res!103388) (not e!82019))))

(assert (=> b!124881 (= res!103388 (and (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) i!1051) (bvsle i!1051 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!11)))))))

(declare-fun b!124880 () Bool)

(declare-fun res!103387 () Bool)

(assert (=> b!124880 (=> (not res!103387) (not e!82019))))

(assert (=> b!124880 (= res!103387 (arrayBitRangesEq!0 a1!934 a2!934 from!913 to!880))))

(declare-fun b!124883 () Bool)

(assert (=> b!124883 (= e!82019 (and (= (bvsdiv i!1051 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (or (bvslt atByte!11 #b00000000000000000000000000000000) (bvsge atByte!11 (size!2530 a1!934)))))))

(assert (= (and start!24622 res!103390) b!124880))

(assert (= (and b!124880 res!103387) b!124881))

(assert (= (and b!124881 res!103388) b!124882))

(assert (= (and b!124882 res!103389) b!124883))

(declare-fun m!190191 () Bool)

(assert (=> start!24622 m!190191))

(declare-fun m!190193 () Bool)

(assert (=> start!24622 m!190193))

(declare-fun m!190195 () Bool)

(assert (=> b!124882 m!190195))

(declare-fun m!190197 () Bool)

(assert (=> b!124880 m!190197))

(push 1)

(assert (not b!124880))

(assert (not b!124882))

(assert (not start!24622))

(check-sat)

(pop 1)

(push 1)

(check-sat)

