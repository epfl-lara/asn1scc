; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24740 () Bool)

(assert start!24740)

(declare-fun res!104061 () Bool)

(declare-fun e!82601 () Bool)

(assert (=> start!24740 (=> (not res!104061) (not e!82601))))

(declare-datatypes ((array!5650 0))(
  ( (array!5651 (arr!3152 (Array (_ BitVec 32) (_ BitVec 8))) (size!2559 (_ BitVec 32))) )
))
(declare-fun a2!934 () array!5650)

(declare-fun to!880 () (_ BitVec 64))

(declare-fun a1!934 () array!5650)

(declare-fun from!913 () (_ BitVec 64))

(declare-fun atByte!11 () (_ BitVec 32))

(assert (=> start!24740 (= res!104061 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!913) (bvsle from!913 to!880) (= (size!2559 a1!934) (size!2559 a2!934)) (bvsle to!880 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2559 a1!934)))) (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (bvslt ((_ sign_extend 32) atByte!11) (bvsdiv to!880 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> start!24740 e!82601))

(declare-fun array_inv!2348 (array!5650) Bool)

(assert (=> start!24740 (array_inv!2348 a2!934)))

(assert (=> start!24740 true))

(assert (=> start!24740 (array_inv!2348 a1!934)))

(declare-fun b!125603 () Bool)

(declare-fun e!82600 () Bool)

(declare-fun e!82603 () Bool)

(assert (=> b!125603 (= e!82600 e!82603)))

(declare-fun res!104060 () Bool)

(assert (=> b!125603 (=> (not res!104060) (not e!82603))))

(declare-fun i!1051 () (_ BitVec 64))

(declare-fun lt!196538 () (_ BitVec 64))

(assert (=> b!125603 (= res!104060 (bvsle i!1051 lt!196538))))

(assert (=> b!125603 (= lt!196538 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!11)))))

(declare-fun b!125604 () Bool)

(declare-fun res!104062 () Bool)

(assert (=> b!125604 (=> (not res!104062) (not e!82603))))

(declare-fun arrayBitRangesEq!0 (array!5650 array!5650 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!125604 (= res!104062 (arrayBitRangesEq!0 a1!934 a2!934 i!1051 to!880))))

(declare-fun b!125605 () Bool)

(declare-fun res!104059 () Bool)

(assert (=> b!125605 (=> (not res!104059) (not e!82601))))

(assert (=> b!125605 (= res!104059 (arrayBitRangesEq!0 a1!934 a2!934 from!913 to!880))))

(declare-fun b!125606 () Bool)

(declare-fun res!104056 () Bool)

(assert (=> b!125606 (=> (not res!104056) (not e!82603))))

(assert (=> b!125606 (= res!104056 (arrayBitRangesEq!0 a1!934 a2!934 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051) to!880))))

(declare-fun b!125607 () Bool)

(declare-fun res!104057 () Bool)

(assert (=> b!125607 (=> (not res!104057) (not e!82603))))

(declare-fun lt!196536 () (_ BitVec 64))

(assert (=> b!125607 (= res!104057 (and (not (= (bvsdiv i!1051 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11))) (bvsle lt!196536 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051)) (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051) lt!196538)))))

(declare-fun b!125608 () Bool)

(assert (=> b!125608 (= e!82601 e!82600)))

(declare-fun res!104058 () Bool)

(assert (=> b!125608 (=> (not res!104058) (not e!82600))))

(assert (=> b!125608 (= res!104058 (bvsle lt!196536 i!1051))))

(assert (=> b!125608 (= lt!196536 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!125609 () Bool)

(assert (=> b!125609 (= e!82603 (not true))))

(assert (=> b!125609 (= ((_ sign_extend 24) (select (arr!3152 a1!934) atByte!11)) ((_ sign_extend 24) (select (arr!3152 a2!934) atByte!11)))))

(declare-datatypes ((Unit!7733 0))(
  ( (Unit!7734) )
))
(declare-fun lt!196537 () Unit!7733)

(declare-fun rec!23 (array!5650 array!5650 (_ BitVec 32) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!7733)

(assert (=> b!125609 (= lt!196537 (rec!23 a1!934 a2!934 atByte!11 from!913 to!880 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051)))))

(assert (= (and start!24740 res!104061) b!125605))

(assert (= (and b!125605 res!104059) b!125608))

(assert (= (and b!125608 res!104058) b!125603))

(assert (= (and b!125603 res!104060) b!125604))

(assert (= (and b!125604 res!104062) b!125607))

(assert (= (and b!125607 res!104057) b!125606))

(assert (= (and b!125606 res!104056) b!125609))

(declare-fun m!190943 () Bool)

(assert (=> start!24740 m!190943))

(declare-fun m!190945 () Bool)

(assert (=> start!24740 m!190945))

(declare-fun m!190947 () Bool)

(assert (=> b!125605 m!190947))

(declare-fun m!190949 () Bool)

(assert (=> b!125606 m!190949))

(declare-fun m!190951 () Bool)

(assert (=> b!125604 m!190951))

(declare-fun m!190953 () Bool)

(assert (=> b!125609 m!190953))

(declare-fun m!190955 () Bool)

(assert (=> b!125609 m!190955))

(declare-fun m!190957 () Bool)

(assert (=> b!125609 m!190957))

(push 1)

(assert (not b!125604))

