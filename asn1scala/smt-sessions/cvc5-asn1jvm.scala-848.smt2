; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24676 () Bool)

(assert start!24676)

(declare-fun b!125134 () Bool)

(declare-fun e!82229 () Bool)

(declare-fun i!1051 () (_ BitVec 64))

(declare-fun lt!196363 () (_ BitVec 64))

(declare-fun atByte!11 () (_ BitVec 32))

(declare-fun lt!196364 () (_ BitVec 64))

(assert (=> b!125134 (= e!82229 (and (not (= (bvsdiv i!1051 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11))) (or (bvsgt lt!196364 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051)) (bvsgt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051) lt!196363))))))

(declare-fun b!125135 () Bool)

(declare-fun res!103620 () Bool)

(assert (=> b!125135 (=> (not res!103620) (not e!82229))))

(declare-datatypes ((array!5613 0))(
  ( (array!5614 (arr!3135 (Array (_ BitVec 32) (_ BitVec 8))) (size!2542 (_ BitVec 32))) )
))
(declare-fun a2!934 () array!5613)

(declare-fun to!880 () (_ BitVec 64))

(declare-fun a1!934 () array!5613)

(declare-fun arrayBitRangesEq!0 (array!5613 array!5613 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!125135 (= res!103620 (arrayBitRangesEq!0 a1!934 a2!934 i!1051 to!880))))

(declare-fun b!125136 () Bool)

(declare-fun e!82226 () Bool)

(declare-fun e!82227 () Bool)

(assert (=> b!125136 (= e!82226 e!82227)))

(declare-fun res!103619 () Bool)

(assert (=> b!125136 (=> (not res!103619) (not e!82227))))

(assert (=> b!125136 (= res!103619 (bvsle lt!196364 i!1051))))

(declare-fun from!913 () (_ BitVec 64))

(assert (=> b!125136 (= lt!196364 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!125137 () Bool)

(declare-fun res!103621 () Bool)

(assert (=> b!125137 (=> (not res!103621) (not e!82226))))

(assert (=> b!125137 (= res!103621 (arrayBitRangesEq!0 a1!934 a2!934 from!913 to!880))))

(declare-fun b!125138 () Bool)

(assert (=> b!125138 (= e!82227 e!82229)))

(declare-fun res!103617 () Bool)

(assert (=> b!125138 (=> (not res!103617) (not e!82229))))

(assert (=> b!125138 (= res!103617 (bvsle i!1051 lt!196363))))

(assert (=> b!125138 (= lt!196363 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!11)))))

(declare-fun res!103618 () Bool)

(assert (=> start!24676 (=> (not res!103618) (not e!82226))))

(assert (=> start!24676 (= res!103618 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!913) (bvsle from!913 to!880) (= (size!2542 a1!934) (size!2542 a2!934)) (bvsle to!880 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2542 a1!934)))) (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (bvslt ((_ sign_extend 32) atByte!11) (bvsdiv to!880 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> start!24676 e!82226))

(declare-fun array_inv!2331 (array!5613) Bool)

(assert (=> start!24676 (array_inv!2331 a2!934)))

(assert (=> start!24676 true))

(assert (=> start!24676 (array_inv!2331 a1!934)))

(assert (= (and start!24676 res!103618) b!125137))

(assert (= (and b!125137 res!103621) b!125136))

(assert (= (and b!125136 res!103619) b!125138))

(assert (= (and b!125138 res!103617) b!125135))

(assert (= (and b!125135 res!103620) b!125134))

(declare-fun m!190473 () Bool)

(assert (=> b!125135 m!190473))

(declare-fun m!190475 () Bool)

(assert (=> b!125137 m!190475))

(declare-fun m!190477 () Bool)

(assert (=> start!24676 m!190477))

(declare-fun m!190479 () Bool)

(assert (=> start!24676 m!190479))

(push 1)

(assert (not start!24676))

(assert (not b!125135))

(assert (not b!125137))

(check-sat)

(pop 1)

(push 1)

(check-sat)

