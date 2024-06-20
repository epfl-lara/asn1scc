; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24672 () Bool)

(assert start!24672)

(declare-fun b!125108 () Bool)

(declare-fun res!103594 () Bool)

(declare-fun e!82204 () Bool)

(assert (=> b!125108 (=> (not res!103594) (not e!82204))))

(declare-datatypes ((array!5609 0))(
  ( (array!5610 (arr!3133 (Array (_ BitVec 32) (_ BitVec 8))) (size!2540 (_ BitVec 32))) )
))
(declare-fun a2!934 () array!5609)

(declare-fun to!880 () (_ BitVec 64))

(declare-fun a1!934 () array!5609)

(declare-fun from!913 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!5609 array!5609 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!125108 (= res!103594 (arrayBitRangesEq!0 a1!934 a2!934 from!913 to!880))))

(declare-fun b!125109 () Bool)

(declare-fun res!103591 () Bool)

(assert (=> b!125109 (=> (not res!103591) (not e!82204))))

(declare-fun i!1051 () (_ BitVec 64))

(declare-fun atByte!11 () (_ BitVec 32))

(assert (=> b!125109 (= res!103591 (and (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) i!1051) (bvsle i!1051 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!11)))))))

(declare-fun b!125111 () Bool)

(assert (=> b!125111 (= e!82204 (and (not (= (bvsdiv i!1051 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11))) (= (bvand i!1051 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand i!1051 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!103593 () Bool)

(assert (=> start!24672 (=> (not res!103593) (not e!82204))))

(assert (=> start!24672 (= res!103593 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!913) (bvsle from!913 to!880) (= (size!2540 a1!934) (size!2540 a2!934)) (bvsle to!880 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2540 a1!934)))) (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (bvslt ((_ sign_extend 32) atByte!11) (bvsdiv to!880 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> start!24672 e!82204))

(declare-fun array_inv!2329 (array!5609) Bool)

(assert (=> start!24672 (array_inv!2329 a2!934)))

(assert (=> start!24672 true))

(assert (=> start!24672 (array_inv!2329 a1!934)))

(declare-fun b!125110 () Bool)

(declare-fun res!103592 () Bool)

(assert (=> b!125110 (=> (not res!103592) (not e!82204))))

(assert (=> b!125110 (= res!103592 (arrayBitRangesEq!0 a1!934 a2!934 i!1051 to!880))))

(assert (= (and start!24672 res!103593) b!125108))

(assert (= (and b!125108 res!103594) b!125109))

(assert (= (and b!125109 res!103591) b!125110))

(assert (= (and b!125110 res!103592) b!125111))

(declare-fun m!190457 () Bool)

(assert (=> b!125108 m!190457))

(declare-fun m!190459 () Bool)

(assert (=> start!24672 m!190459))

(declare-fun m!190461 () Bool)

(assert (=> start!24672 m!190461))

(declare-fun m!190463 () Bool)

(assert (=> b!125110 m!190463))

(check-sat (not start!24672) (not b!125110) (not b!125108))
(check-sat)
