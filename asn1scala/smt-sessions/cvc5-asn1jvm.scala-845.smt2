; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24628 () Bool)

(assert start!24628)

(declare-fun res!103425 () Bool)

(declare-fun e!82046 () Bool)

(assert (=> start!24628 (=> (not res!103425) (not e!82046))))

(declare-fun to!880 () (_ BitVec 64))

(declare-fun from!913 () (_ BitVec 64))

(declare-fun atByte!11 () (_ BitVec 32))

(declare-datatypes ((array!5592 0))(
  ( (array!5593 (arr!3126 (Array (_ BitVec 32) (_ BitVec 8))) (size!2533 (_ BitVec 32))) )
))
(declare-fun a2!934 () array!5592)

(declare-fun a1!934 () array!5592)

(assert (=> start!24628 (= res!103425 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!913) (bvsle from!913 to!880) (= (size!2533 a1!934) (size!2533 a2!934)) (bvsle to!880 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2533 a1!934)))) (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (bvslt ((_ sign_extend 32) atByte!11) (bvsdiv to!880 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> start!24628 e!82046))

(declare-fun array_inv!2322 (array!5592) Bool)

(assert (=> start!24628 (array_inv!2322 a2!934)))

(assert (=> start!24628 true))

(assert (=> start!24628 (array_inv!2322 a1!934)))

(declare-fun b!124918 () Bool)

(declare-fun res!103423 () Bool)

(assert (=> b!124918 (=> (not res!103423) (not e!82046))))

(declare-fun i!1051 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!5592 array!5592 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!124918 (= res!103423 (arrayBitRangesEq!0 a1!934 a2!934 i!1051 to!880))))

(declare-fun b!124916 () Bool)

(declare-fun res!103424 () Bool)

(assert (=> b!124916 (=> (not res!103424) (not e!82046))))

(assert (=> b!124916 (= res!103424 (arrayBitRangesEq!0 a1!934 a2!934 from!913 to!880))))

(declare-fun b!124919 () Bool)

(assert (=> b!124919 (= e!82046 (and (= (bvsdiv i!1051 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (or (bvslt atByte!11 #b00000000000000000000000000000000) (bvsge atByte!11 (size!2533 a2!934)))))))

(declare-fun b!124917 () Bool)

(declare-fun res!103426 () Bool)

(assert (=> b!124917 (=> (not res!103426) (not e!82046))))

(assert (=> b!124917 (= res!103426 (and (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) i!1051) (bvsle i!1051 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!11)))))))

(assert (= (and start!24628 res!103425) b!124916))

(assert (= (and b!124916 res!103424) b!124917))

(assert (= (and b!124917 res!103426) b!124918))

(assert (= (and b!124918 res!103423) b!124919))

(declare-fun m!190215 () Bool)

(assert (=> start!24628 m!190215))

(declare-fun m!190217 () Bool)

(assert (=> start!24628 m!190217))

(declare-fun m!190219 () Bool)

(assert (=> b!124918 m!190219))

(declare-fun m!190221 () Bool)

(assert (=> b!124916 m!190221))

(push 1)

(assert (not b!124916))

(assert (not start!24628))

(assert (not b!124918))

(check-sat)

(pop 1)

(push 1)

(check-sat)

