; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24618 () Bool)

(assert start!24618)

(declare-fun res!103363 () Bool)

(declare-fun e!82001 () Bool)

(assert (=> start!24618 (=> (not res!103363) (not e!82001))))

(declare-datatypes ((array!5582 0))(
  ( (array!5583 (arr!3121 (Array (_ BitVec 32) (_ BitVec 8))) (size!2528 (_ BitVec 32))) )
))
(declare-fun a2!934 () array!5582)

(declare-fun to!880 () (_ BitVec 64))

(declare-fun a1!934 () array!5582)

(declare-fun from!913 () (_ BitVec 64))

(declare-fun atByte!11 () (_ BitVec 32))

(assert (=> start!24618 (= res!103363 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!913) (bvsle from!913 to!880) (= (size!2528 a1!934) (size!2528 a2!934)) (bvsle to!880 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2528 a1!934)))) (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (bvslt ((_ sign_extend 32) atByte!11) (bvsdiv to!880 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> start!24618 e!82001))

(declare-fun array_inv!2317 (array!5582) Bool)

(assert (=> start!24618 (array_inv!2317 a2!934)))

(assert (=> start!24618 true))

(assert (=> start!24618 (array_inv!2317 a1!934)))

(declare-fun b!124858 () Bool)

(declare-fun res!103366 () Bool)

(assert (=> b!124858 (=> (not res!103366) (not e!82001))))

(declare-fun i!1051 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!5582 array!5582 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!124858 (= res!103366 (arrayBitRangesEq!0 a1!934 a2!934 i!1051 to!880))))

(declare-fun b!124859 () Bool)

(assert (=> b!124859 (= e!82001 (bvslt (bvsub to!880 i!1051) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!124857 () Bool)

(declare-fun res!103365 () Bool)

(assert (=> b!124857 (=> (not res!103365) (not e!82001))))

(assert (=> b!124857 (= res!103365 (and (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) i!1051) (bvsle i!1051 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!11)))))))

(declare-fun b!124856 () Bool)

(declare-fun res!103364 () Bool)

(assert (=> b!124856 (=> (not res!103364) (not e!82001))))

(assert (=> b!124856 (= res!103364 (arrayBitRangesEq!0 a1!934 a2!934 from!913 to!880))))

(assert (= (and start!24618 res!103363) b!124856))

(assert (= (and b!124856 res!103364) b!124857))

(assert (= (and b!124857 res!103365) b!124858))

(assert (= (and b!124858 res!103366) b!124859))

(declare-fun m!190175 () Bool)

(assert (=> start!24618 m!190175))

(declare-fun m!190177 () Bool)

(assert (=> start!24618 m!190177))

(declare-fun m!190179 () Bool)

(assert (=> b!124858 m!190179))

(declare-fun m!190181 () Bool)

(assert (=> b!124856 m!190181))

(check-sat (not b!124856) (not start!24618) (not b!124858))
(check-sat)
