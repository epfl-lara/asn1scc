; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24604 () Bool)

(assert start!24604)

(declare-fun res!103294 () Bool)

(declare-fun e!81938 () Bool)

(assert (=> start!24604 (=> (not res!103294) (not e!81938))))

(declare-datatypes ((array!5568 0))(
  ( (array!5569 (arr!3114 (Array (_ BitVec 32) (_ BitVec 8))) (size!2521 (_ BitVec 32))) )
))
(declare-fun a2!934 () array!5568)

(declare-fun to!880 () (_ BitVec 64))

(declare-fun a1!934 () array!5568)

(declare-fun atByte!11 () (_ BitVec 32))

(declare-fun from!913 () (_ BitVec 64))

(assert (=> start!24604 (= res!103294 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!913) (bvsle from!913 to!880) (= (size!2521 a1!934) (size!2521 a2!934)) (bvsle to!880 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2521 a1!934)))) (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (bvslt ((_ sign_extend 32) atByte!11) (bvsdiv to!880 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> start!24604 e!81938))

(declare-fun array_inv!2310 (array!5568) Bool)

(assert (=> start!24604 (array_inv!2310 a2!934)))

(assert (=> start!24604 true))

(assert (=> start!24604 (array_inv!2310 a1!934)))

(declare-fun b!124786 () Bool)

(declare-fun res!103293 () Bool)

(assert (=> b!124786 (=> (not res!103293) (not e!81938))))

(declare-fun arrayBitRangesEq!0 (array!5568 array!5568 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!124786 (= res!103293 (arrayBitRangesEq!0 a1!934 a2!934 from!913 to!880))))

(declare-fun b!124787 () Bool)

(declare-fun i!1051 () (_ BitVec 64))

(assert (=> b!124787 (= e!81938 (and (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) i!1051) (not (= ((_ sign_extend 32) atByte!11) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!11)) ((_ sign_extend 32) atByte!11))))))))

(assert (= (and start!24604 res!103294) b!124786))

(assert (= (and b!124786 res!103293) b!124787))

(declare-fun m!190125 () Bool)

(assert (=> start!24604 m!190125))

(declare-fun m!190127 () Bool)

(assert (=> start!24604 m!190127))

(declare-fun m!190129 () Bool)

(assert (=> b!124786 m!190129))

(push 1)

(assert (not b!124786))

(assert (not start!24604))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

