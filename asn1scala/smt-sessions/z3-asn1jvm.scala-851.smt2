; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24726 () Bool)

(assert start!24726)

(declare-fun b!125456 () Bool)

(declare-fun e!82496 () Bool)

(declare-fun atByte!11 () (_ BitVec 32))

(declare-datatypes ((array!5636 0))(
  ( (array!5637 (arr!3145 (Array (_ BitVec 32) (_ BitVec 8))) (size!2552 (_ BitVec 32))) )
))
(declare-fun a1!934 () array!5636)

(assert (=> b!125456 (= e!82496 (not (and (bvsge atByte!11 #b00000000000000000000000000000000) (bvslt atByte!11 (size!2552 a1!934)))))))

(declare-fun a2!934 () array!5636)

(assert (=> b!125456 (= ((_ sign_extend 24) (select (arr!3145 a1!934) atByte!11)) ((_ sign_extend 24) (select (arr!3145 a2!934) atByte!11)))))

(declare-fun i!1051 () (_ BitVec 64))

(declare-datatypes ((Unit!7719 0))(
  ( (Unit!7720) )
))
(declare-fun lt!196473 () Unit!7719)

(declare-fun to!880 () (_ BitVec 64))

(declare-fun from!913 () (_ BitVec 64))

(declare-fun rec!23 (array!5636 array!5636 (_ BitVec 32) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!7719)

(assert (=> b!125456 (= lt!196473 (rec!23 a1!934 a2!934 atByte!11 from!913 to!880 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051)))))

(declare-fun b!125457 () Bool)

(declare-fun res!103913 () Bool)

(assert (=> b!125457 (=> (not res!103913) (not e!82496))))

(declare-fun lt!196475 () (_ BitVec 64))

(declare-fun lt!196474 () (_ BitVec 64))

(assert (=> b!125457 (= res!103913 (and (not (= (bvsdiv i!1051 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11))) (bvsle lt!196475 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051)) (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051) lt!196474)))))

(declare-fun res!103912 () Bool)

(declare-fun e!82498 () Bool)

(assert (=> start!24726 (=> (not res!103912) (not e!82498))))

(assert (=> start!24726 (= res!103912 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!913) (bvsle from!913 to!880) (= (size!2552 a1!934) (size!2552 a2!934)) (bvsle to!880 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2552 a1!934)))) (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (bvslt ((_ sign_extend 32) atByte!11) (bvsdiv to!880 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> start!24726 e!82498))

(declare-fun array_inv!2341 (array!5636) Bool)

(assert (=> start!24726 (array_inv!2341 a2!934)))

(assert (=> start!24726 true))

(assert (=> start!24726 (array_inv!2341 a1!934)))

(declare-fun b!125458 () Bool)

(declare-fun res!103910 () Bool)

(assert (=> b!125458 (=> (not res!103910) (not e!82496))))

(declare-fun arrayBitRangesEq!0 (array!5636 array!5636 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!125458 (= res!103910 (arrayBitRangesEq!0 a1!934 a2!934 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051) to!880))))

(declare-fun b!125459 () Bool)

(declare-fun e!82495 () Bool)

(assert (=> b!125459 (= e!82495 e!82496)))

(declare-fun res!103911 () Bool)

(assert (=> b!125459 (=> (not res!103911) (not e!82496))))

(assert (=> b!125459 (= res!103911 (bvsle i!1051 lt!196474))))

(assert (=> b!125459 (= lt!196474 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!11)))))

(declare-fun b!125460 () Bool)

(assert (=> b!125460 (= e!82498 e!82495)))

(declare-fun res!103909 () Bool)

(assert (=> b!125460 (=> (not res!103909) (not e!82495))))

(assert (=> b!125460 (= res!103909 (bvsle lt!196475 i!1051))))

(assert (=> b!125460 (= lt!196475 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!125461 () Bool)

(declare-fun res!103915 () Bool)

(assert (=> b!125461 (=> (not res!103915) (not e!82496))))

(assert (=> b!125461 (= res!103915 (arrayBitRangesEq!0 a1!934 a2!934 i!1051 to!880))))

(declare-fun b!125462 () Bool)

(declare-fun res!103914 () Bool)

(assert (=> b!125462 (=> (not res!103914) (not e!82498))))

(assert (=> b!125462 (= res!103914 (arrayBitRangesEq!0 a1!934 a2!934 from!913 to!880))))

(assert (= (and start!24726 res!103912) b!125462))

(assert (= (and b!125462 res!103914) b!125460))

(assert (= (and b!125460 res!103909) b!125459))

(assert (= (and b!125459 res!103911) b!125461))

(assert (= (and b!125461 res!103915) b!125457))

(assert (= (and b!125457 res!103913) b!125458))

(assert (= (and b!125458 res!103910) b!125456))

(declare-fun m!190831 () Bool)

(assert (=> b!125456 m!190831))

(declare-fun m!190833 () Bool)

(assert (=> b!125456 m!190833))

(declare-fun m!190835 () Bool)

(assert (=> b!125456 m!190835))

(declare-fun m!190837 () Bool)

(assert (=> b!125462 m!190837))

(declare-fun m!190839 () Bool)

(assert (=> b!125461 m!190839))

(declare-fun m!190841 () Bool)

(assert (=> b!125458 m!190841))

(declare-fun m!190843 () Bool)

(assert (=> start!24726 m!190843))

(declare-fun m!190845 () Bool)

(assert (=> start!24726 m!190845))

(check-sat (not b!125462) (not b!125456) (not b!125458) (not b!125461) (not start!24726))
(check-sat)
