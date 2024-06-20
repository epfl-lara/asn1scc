; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24610 () Bool)

(assert start!24610)

(declare-fun b!124810 () Bool)

(declare-fun res!103317 () Bool)

(declare-fun e!81964 () Bool)

(assert (=> b!124810 (=> (not res!103317) (not e!81964))))

(declare-datatypes ((array!5574 0))(
  ( (array!5575 (arr!3117 (Array (_ BitVec 32) (_ BitVec 8))) (size!2524 (_ BitVec 32))) )
))
(declare-fun a2!934 () array!5574)

(declare-fun i!1051 () (_ BitVec 64))

(declare-fun to!880 () (_ BitVec 64))

(declare-fun a1!934 () array!5574)

(declare-fun arrayBitRangesEq!0 (array!5574 array!5574 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!124810 (= res!103317 (arrayBitRangesEq!0 a1!934 a2!934 i!1051 to!880))))

(declare-fun res!103316 () Bool)

(assert (=> start!24610 (=> (not res!103316) (not e!81964))))

(declare-fun from!913 () (_ BitVec 64))

(declare-fun atByte!11 () (_ BitVec 32))

(assert (=> start!24610 (= res!103316 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!913) (bvsle from!913 to!880) (= (size!2524 a1!934) (size!2524 a2!934)) (bvsle to!880 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2524 a1!934)))) (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (bvslt ((_ sign_extend 32) atByte!11) (bvsdiv to!880 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> start!24610 e!81964))

(declare-fun array_inv!2313 (array!5574) Bool)

(assert (=> start!24610 (array_inv!2313 a2!934)))

(assert (=> start!24610 true))

(assert (=> start!24610 (array_inv!2313 a1!934)))

(declare-fun b!124808 () Bool)

(declare-fun res!103318 () Bool)

(assert (=> b!124808 (=> (not res!103318) (not e!81964))))

(assert (=> b!124808 (= res!103318 (arrayBitRangesEq!0 a1!934 a2!934 from!913 to!880))))

(declare-fun b!124809 () Bool)

(declare-fun res!103315 () Bool)

(assert (=> b!124809 (=> (not res!103315) (not e!81964))))

(assert (=> b!124809 (= res!103315 (and (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) i!1051) (bvsle i!1051 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!11)))))))

(declare-fun b!124811 () Bool)

(assert (=> b!124811 (= e!81964 (and (not (= (bvand to!880 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!1051 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= (bvand to!880 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!880 i!1051) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!24610 res!103316) b!124808))

(assert (= (and b!124808 res!103318) b!124809))

(assert (= (and b!124809 res!103315) b!124810))

(assert (= (and b!124810 res!103317) b!124811))

(declare-fun m!190143 () Bool)

(assert (=> b!124810 m!190143))

(declare-fun m!190145 () Bool)

(assert (=> start!24610 m!190145))

(declare-fun m!190147 () Bool)

(assert (=> start!24610 m!190147))

(declare-fun m!190149 () Bool)

(assert (=> b!124808 m!190149))

(push 1)

(assert (not b!124808))

(assert (not b!124810))

(assert (not start!24610))

(check-sat)

(pop 1)

(push 1)

(check-sat)

