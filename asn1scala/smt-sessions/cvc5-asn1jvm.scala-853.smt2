; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24736 () Bool)

(assert start!24736)

(declare-fun b!125561 () Bool)

(declare-fun e!82574 () Bool)

(assert (=> b!125561 (= e!82574 (not true))))

(declare-datatypes ((array!5646 0))(
  ( (array!5647 (arr!3150 (Array (_ BitVec 32) (_ BitVec 8))) (size!2557 (_ BitVec 32))) )
))
(declare-fun a1!934 () array!5646)

(declare-fun atByte!11 () (_ BitVec 32))

(declare-fun a2!934 () array!5646)

(assert (=> b!125561 (= ((_ sign_extend 24) (select (arr!3150 a1!934) atByte!11)) ((_ sign_extend 24) (select (arr!3150 a2!934) atByte!11)))))

(declare-fun i!1051 () (_ BitVec 64))

(declare-datatypes ((Unit!7729 0))(
  ( (Unit!7730) )
))
(declare-fun lt!196520 () Unit!7729)

(declare-fun to!880 () (_ BitVec 64))

(declare-fun from!913 () (_ BitVec 64))

(declare-fun rec!23 (array!5646 array!5646 (_ BitVec 32) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!7729)

(assert (=> b!125561 (= lt!196520 (rec!23 a1!934 a2!934 atByte!11 from!913 to!880 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051)))))

(declare-fun res!104020 () Bool)

(declare-fun e!82570 () Bool)

(assert (=> start!24736 (=> (not res!104020) (not e!82570))))

(assert (=> start!24736 (= res!104020 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!913) (bvsle from!913 to!880) (= (size!2557 a1!934) (size!2557 a2!934)) (bvsle to!880 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2557 a1!934)))) (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (bvslt ((_ sign_extend 32) atByte!11) (bvsdiv to!880 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> start!24736 e!82570))

(declare-fun array_inv!2346 (array!5646) Bool)

(assert (=> start!24736 (array_inv!2346 a2!934)))

(assert (=> start!24736 true))

(assert (=> start!24736 (array_inv!2346 a1!934)))

(declare-fun b!125562 () Bool)

(declare-fun e!82572 () Bool)

(assert (=> b!125562 (= e!82570 e!82572)))

(declare-fun res!104018 () Bool)

(assert (=> b!125562 (=> (not res!104018) (not e!82572))))

(declare-fun lt!196518 () (_ BitVec 64))

(assert (=> b!125562 (= res!104018 (bvsle lt!196518 i!1051))))

(assert (=> b!125562 (= lt!196518 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!125563 () Bool)

(declare-fun res!104015 () Bool)

(assert (=> b!125563 (=> (not res!104015) (not e!82574))))

(declare-fun lt!196519 () (_ BitVec 64))

(assert (=> b!125563 (= res!104015 (and (not (= (bvsdiv i!1051 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11))) (bvsle lt!196518 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051)) (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051) lt!196519)))))

(declare-fun b!125564 () Bool)

(declare-fun res!104019 () Bool)

(assert (=> b!125564 (=> (not res!104019) (not e!82574))))

(declare-fun arrayBitRangesEq!0 (array!5646 array!5646 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!125564 (= res!104019 (arrayBitRangesEq!0 a1!934 a2!934 i!1051 to!880))))

(declare-fun b!125565 () Bool)

(declare-fun res!104017 () Bool)

(assert (=> b!125565 (=> (not res!104017) (not e!82570))))

(assert (=> b!125565 (= res!104017 (arrayBitRangesEq!0 a1!934 a2!934 from!913 to!880))))

(declare-fun b!125566 () Bool)

(declare-fun res!104014 () Bool)

(assert (=> b!125566 (=> (not res!104014) (not e!82574))))

(assert (=> b!125566 (= res!104014 (arrayBitRangesEq!0 a1!934 a2!934 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051) to!880))))

(declare-fun b!125567 () Bool)

(assert (=> b!125567 (= e!82572 e!82574)))

(declare-fun res!104016 () Bool)

(assert (=> b!125567 (=> (not res!104016) (not e!82574))))

(assert (=> b!125567 (= res!104016 (bvsle i!1051 lt!196519))))

(assert (=> b!125567 (= lt!196519 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!11)))))

(assert (= (and start!24736 res!104020) b!125565))

(assert (= (and b!125565 res!104017) b!125562))

(assert (= (and b!125562 res!104018) b!125567))

(assert (= (and b!125567 res!104016) b!125564))

(assert (= (and b!125564 res!104019) b!125563))

(assert (= (and b!125563 res!104015) b!125566))

(assert (= (and b!125566 res!104014) b!125561))

(declare-fun m!190911 () Bool)

(assert (=> b!125564 m!190911))

(declare-fun m!190913 () Bool)

(assert (=> b!125566 m!190913))

(declare-fun m!190915 () Bool)

(assert (=> start!24736 m!190915))

(declare-fun m!190917 () Bool)

(assert (=> start!24736 m!190917))

(declare-fun m!190919 () Bool)

(assert (=> b!125565 m!190919))

(declare-fun m!190921 () Bool)

(assert (=> b!125561 m!190921))

(declare-fun m!190923 () Bool)

(assert (=> b!125561 m!190923))

(declare-fun m!190925 () Bool)

(assert (=> b!125561 m!190925))

(push 1)

(assert (not b!125566))

(assert (not b!125561))

(assert (not b!125565))

(assert (not start!24736))

(assert (not b!125564))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

