; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24680 () Bool)

(assert start!24680)

(declare-fun res!103647 () Bool)

(declare-fun e!82257 () Bool)

(assert (=> start!24680 (=> (not res!103647) (not e!82257))))

(declare-datatypes ((array!5617 0))(
  ( (array!5618 (arr!3137 (Array (_ BitVec 32) (_ BitVec 8))) (size!2544 (_ BitVec 32))) )
))
(declare-fun a2!934 () array!5617)

(declare-fun to!880 () (_ BitVec 64))

(declare-fun a1!934 () array!5617)

(declare-fun from!913 () (_ BitVec 64))

(declare-fun atByte!11 () (_ BitVec 32))

(assert (=> start!24680 (= res!103647 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!913) (bvsle from!913 to!880) (= (size!2544 a1!934) (size!2544 a2!934)) (bvsle to!880 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2544 a1!934)))) (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (bvslt ((_ sign_extend 32) atByte!11) (bvsdiv to!880 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> start!24680 e!82257))

(declare-fun array_inv!2333 (array!5617) Bool)

(assert (=> start!24680 (array_inv!2333 a2!934)))

(assert (=> start!24680 true))

(assert (=> start!24680 (array_inv!2333 a1!934)))

(declare-fun b!125164 () Bool)

(declare-fun e!82256 () Bool)

(declare-fun e!82255 () Bool)

(assert (=> b!125164 (= e!82256 e!82255)))

(declare-fun res!103648 () Bool)

(assert (=> b!125164 (=> (not res!103648) (not e!82255))))

(declare-fun i!1051 () (_ BitVec 64))

(declare-fun lt!196376 () (_ BitVec 64))

(assert (=> b!125164 (= res!103648 (bvsle i!1051 lt!196376))))

(assert (=> b!125164 (= lt!196376 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!11)))))

(declare-fun b!125165 () Bool)

(declare-fun lt!196375 () (_ BitVec 64))

(assert (=> b!125165 (= e!82255 (and (not (= (bvsdiv i!1051 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11))) (or (bvsgt lt!196375 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051)) (bvsgt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051) lt!196376))))))

(declare-fun b!125166 () Bool)

(assert (=> b!125166 (= e!82257 e!82256)))

(declare-fun res!103649 () Bool)

(assert (=> b!125166 (=> (not res!103649) (not e!82256))))

(assert (=> b!125166 (= res!103649 (bvsle lt!196375 i!1051))))

(assert (=> b!125166 (= lt!196375 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!125167 () Bool)

(declare-fun res!103650 () Bool)

(assert (=> b!125167 (=> (not res!103650) (not e!82257))))

(declare-fun arrayBitRangesEq!0 (array!5617 array!5617 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!125167 (= res!103650 (arrayBitRangesEq!0 a1!934 a2!934 from!913 to!880))))

(declare-fun b!125168 () Bool)

(declare-fun res!103651 () Bool)

(assert (=> b!125168 (=> (not res!103651) (not e!82255))))

(assert (=> b!125168 (= res!103651 (arrayBitRangesEq!0 a1!934 a2!934 i!1051 to!880))))

(assert (= (and start!24680 res!103647) b!125167))

(assert (= (and b!125167 res!103650) b!125166))

(assert (= (and b!125166 res!103649) b!125164))

(assert (= (and b!125164 res!103648) b!125168))

(assert (= (and b!125168 res!103651) b!125165))

(declare-fun m!190489 () Bool)

(assert (=> start!24680 m!190489))

(declare-fun m!190491 () Bool)

(assert (=> start!24680 m!190491))

(declare-fun m!190493 () Bool)

(assert (=> b!125167 m!190493))

(declare-fun m!190495 () Bool)

(assert (=> b!125168 m!190495))

(push 1)

(assert (not b!125167))

(assert (not start!24680))

(assert (not b!125168))

(check-sat)

(pop 1)

(push 1)

(check-sat)

