; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24606 () Bool)

(assert start!24606)

(declare-fun res!103300 () Bool)

(declare-fun e!81947 () Bool)

(assert (=> start!24606 (=> (not res!103300) (not e!81947))))

(declare-datatypes ((array!5570 0))(
  ( (array!5571 (arr!3115 (Array (_ BitVec 32) (_ BitVec 8))) (size!2522 (_ BitVec 32))) )
))
(declare-fun a2!934 () array!5570)

(declare-fun to!880 () (_ BitVec 64))

(declare-fun a1!934 () array!5570)

(declare-fun from!913 () (_ BitVec 64))

(declare-fun atByte!11 () (_ BitVec 32))

(assert (=> start!24606 (= res!103300 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!913) (bvsle from!913 to!880) (= (size!2522 a1!934) (size!2522 a2!934)) (bvsle to!880 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2522 a1!934)))) (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (bvslt ((_ sign_extend 32) atByte!11) (bvsdiv to!880 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> start!24606 e!81947))

(declare-fun array_inv!2311 (array!5570) Bool)

(assert (=> start!24606 (array_inv!2311 a2!934)))

(assert (=> start!24606 true))

(assert (=> start!24606 (array_inv!2311 a1!934)))

(declare-fun b!124792 () Bool)

(declare-fun res!103299 () Bool)

(assert (=> b!124792 (=> (not res!103299) (not e!81947))))

(declare-fun arrayBitRangesEq!0 (array!5570 array!5570 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!124792 (= res!103299 (arrayBitRangesEq!0 a1!934 a2!934 from!913 to!880))))

(declare-fun i!1051 () (_ BitVec 64))

(declare-fun b!124793 () Bool)

(assert (=> b!124793 (= e!81947 (and (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) i!1051) (not (= ((_ sign_extend 32) atByte!11) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!11)) ((_ sign_extend 32) atByte!11))))))))

(assert (= (and start!24606 res!103300) b!124792))

(assert (= (and b!124792 res!103299) b!124793))

(declare-fun m!190131 () Bool)

(assert (=> start!24606 m!190131))

(declare-fun m!190133 () Bool)

(assert (=> start!24606 m!190133))

(declare-fun m!190135 () Bool)

(assert (=> b!124792 m!190135))

(check-sat (not start!24606) (not b!124792))
(check-sat)
