; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24600 () Bool)

(assert start!24600)

(declare-fun res!103281 () Bool)

(declare-fun e!81918 () Bool)

(assert (=> start!24600 (=> (not res!103281) (not e!81918))))

(declare-datatypes ((array!5564 0))(
  ( (array!5565 (arr!3112 (Array (_ BitVec 32) (_ BitVec 8))) (size!2519 (_ BitVec 32))) )
))
(declare-fun a2!934 () array!5564)

(declare-fun to!880 () (_ BitVec 64))

(declare-fun a1!934 () array!5564)

(declare-fun from!913 () (_ BitVec 64))

(declare-fun atByte!11 () (_ BitVec 32))

(assert (=> start!24600 (= res!103281 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!913) (bvsle from!913 to!880) (= (size!2519 a1!934) (size!2519 a2!934)) (bvsle to!880 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2519 a1!934)))) (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (bvslt ((_ sign_extend 32) atByte!11) (bvsdiv to!880 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> start!24600 e!81918))

(declare-fun array_inv!2308 (array!5564) Bool)

(assert (=> start!24600 (array_inv!2308 a2!934)))

(assert (=> start!24600 true))

(assert (=> start!24600 (array_inv!2308 a1!934)))

(declare-fun b!124774 () Bool)

(declare-fun res!103282 () Bool)

(assert (=> b!124774 (=> (not res!103282) (not e!81918))))

(declare-fun arrayBitRangesEq!0 (array!5564 array!5564 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!124774 (= res!103282 (arrayBitRangesEq!0 a1!934 a2!934 from!913 to!880))))

(declare-fun b!124775 () Bool)

(assert (=> b!124775 (= e!81918 (and (= (bvand from!913 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand from!913 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!24600 res!103281) b!124774))

(assert (= (and b!124774 res!103282) b!124775))

(declare-fun m!190113 () Bool)

(assert (=> start!24600 m!190113))

(declare-fun m!190115 () Bool)

(assert (=> start!24600 m!190115))

(declare-fun m!190117 () Bool)

(assert (=> b!124774 m!190117))

(check-sat (not start!24600) (not b!124774))
(check-sat)
