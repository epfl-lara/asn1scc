; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24626 () Bool)

(assert start!24626)

(declare-fun i!1051 () (_ BitVec 64))

(declare-fun e!82037 () Bool)

(declare-datatypes ((array!5590 0))(
  ( (array!5591 (arr!3125 (Array (_ BitVec 32) (_ BitVec 8))) (size!2532 (_ BitVec 32))) )
))
(declare-fun a1!934 () array!5590)

(declare-fun b!124907 () Bool)

(declare-fun atByte!11 () (_ BitVec 32))

(assert (=> b!124907 (= e!82037 (and (= (bvsdiv i!1051 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (or (bvslt atByte!11 #b00000000000000000000000000000000) (bvsge atByte!11 (size!2532 a1!934)))))))

(declare-fun b!124906 () Bool)

(declare-fun res!103414 () Bool)

(assert (=> b!124906 (=> (not res!103414) (not e!82037))))

(declare-fun a2!934 () array!5590)

(declare-fun to!880 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!5590 array!5590 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!124906 (= res!103414 (arrayBitRangesEq!0 a1!934 a2!934 i!1051 to!880))))

(declare-fun b!124905 () Bool)

(declare-fun res!103413 () Bool)

(assert (=> b!124905 (=> (not res!103413) (not e!82037))))

(declare-fun from!913 () (_ BitVec 64))

(assert (=> b!124905 (= res!103413 (and (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) i!1051) (bvsle i!1051 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!11)))))))

(declare-fun res!103411 () Bool)

(assert (=> start!24626 (=> (not res!103411) (not e!82037))))

(assert (=> start!24626 (= res!103411 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!913) (bvsle from!913 to!880) (= (size!2532 a1!934) (size!2532 a2!934)) (bvsle to!880 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2532 a1!934)))) (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (bvslt ((_ sign_extend 32) atByte!11) (bvsdiv to!880 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> start!24626 e!82037))

(declare-fun array_inv!2321 (array!5590) Bool)

(assert (=> start!24626 (array_inv!2321 a2!934)))

(assert (=> start!24626 true))

(assert (=> start!24626 (array_inv!2321 a1!934)))

(declare-fun b!124904 () Bool)

(declare-fun res!103412 () Bool)

(assert (=> b!124904 (=> (not res!103412) (not e!82037))))

(assert (=> b!124904 (= res!103412 (arrayBitRangesEq!0 a1!934 a2!934 from!913 to!880))))

(assert (= (and start!24626 res!103411) b!124904))

(assert (= (and b!124904 res!103412) b!124905))

(assert (= (and b!124905 res!103413) b!124906))

(assert (= (and b!124906 res!103414) b!124907))

(declare-fun m!190207 () Bool)

(assert (=> b!124906 m!190207))

(declare-fun m!190209 () Bool)

(assert (=> start!24626 m!190209))

(declare-fun m!190211 () Bool)

(assert (=> start!24626 m!190211))

(declare-fun m!190213 () Bool)

(assert (=> b!124904 m!190213))

(push 1)

(assert (not start!24626))

(assert (not b!124906))

(assert (not b!124904))

(check-sat)

(pop 1)

(push 1)

(check-sat)

