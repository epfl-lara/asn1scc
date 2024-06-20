; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24730 () Bool)

(assert start!24730)

(declare-fun b!125498 () Bool)

(declare-fun res!103953 () Bool)

(declare-fun e!82527 () Bool)

(assert (=> b!125498 (=> (not res!103953) (not e!82527))))

(declare-fun i!1051 () (_ BitVec 64))

(declare-fun lt!196492 () (_ BitVec 64))

(declare-fun lt!196493 () (_ BitVec 64))

(declare-fun atByte!11 () (_ BitVec 32))

(assert (=> b!125498 (= res!103953 (and (not (= (bvsdiv i!1051 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11))) (bvsle lt!196493 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051)) (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051) lt!196492)))))

(declare-fun res!103952 () Bool)

(declare-fun e!82525 () Bool)

(assert (=> start!24730 (=> (not res!103952) (not e!82525))))

(declare-datatypes ((array!5640 0))(
  ( (array!5641 (arr!3147 (Array (_ BitVec 32) (_ BitVec 8))) (size!2554 (_ BitVec 32))) )
))
(declare-fun a2!934 () array!5640)

(declare-fun to!880 () (_ BitVec 64))

(declare-fun from!913 () (_ BitVec 64))

(declare-fun a1!934 () array!5640)

(assert (=> start!24730 (= res!103952 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!913) (bvsle from!913 to!880) (= (size!2554 a1!934) (size!2554 a2!934)) (bvsle to!880 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2554 a1!934)))) (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (bvslt ((_ sign_extend 32) atByte!11) (bvsdiv to!880 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> start!24730 e!82525))

(declare-fun array_inv!2343 (array!5640) Bool)

(assert (=> start!24730 (array_inv!2343 a2!934)))

(assert (=> start!24730 true))

(assert (=> start!24730 (array_inv!2343 a1!934)))

(declare-fun b!125499 () Bool)

(declare-fun res!103954 () Bool)

(assert (=> b!125499 (=> (not res!103954) (not e!82527))))

(declare-fun arrayBitRangesEq!0 (array!5640 array!5640 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!125499 (= res!103954 (arrayBitRangesEq!0 a1!934 a2!934 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051) to!880))))

(declare-fun b!125500 () Bool)

(declare-fun e!82526 () Bool)

(assert (=> b!125500 (= e!82525 e!82526)))

(declare-fun res!103955 () Bool)

(assert (=> b!125500 (=> (not res!103955) (not e!82526))))

(assert (=> b!125500 (= res!103955 (bvsle lt!196493 i!1051))))

(assert (=> b!125500 (= lt!196493 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!125501 () Bool)

(declare-fun res!103956 () Bool)

(assert (=> b!125501 (=> (not res!103956) (not e!82527))))

(assert (=> b!125501 (= res!103956 (arrayBitRangesEq!0 a1!934 a2!934 i!1051 to!880))))

(declare-fun b!125502 () Bool)

(assert (=> b!125502 (= e!82527 (not (and (bvsge atByte!11 #b00000000000000000000000000000000) (bvslt atByte!11 (size!2554 a2!934)))))))

(assert (=> b!125502 (= ((_ sign_extend 24) (select (arr!3147 a1!934) atByte!11)) ((_ sign_extend 24) (select (arr!3147 a2!934) atByte!11)))))

(declare-datatypes ((Unit!7723 0))(
  ( (Unit!7724) )
))
(declare-fun lt!196491 () Unit!7723)

(declare-fun rec!23 (array!5640 array!5640 (_ BitVec 32) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!7723)

(assert (=> b!125502 (= lt!196491 (rec!23 a1!934 a2!934 atByte!11 from!913 to!880 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051)))))

(declare-fun b!125503 () Bool)

(assert (=> b!125503 (= e!82526 e!82527)))

(declare-fun res!103957 () Bool)

(assert (=> b!125503 (=> (not res!103957) (not e!82527))))

(assert (=> b!125503 (= res!103957 (bvsle i!1051 lt!196492))))

(assert (=> b!125503 (= lt!196492 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!11)))))

(declare-fun b!125504 () Bool)

(declare-fun res!103951 () Bool)

(assert (=> b!125504 (=> (not res!103951) (not e!82525))))

(assert (=> b!125504 (= res!103951 (arrayBitRangesEq!0 a1!934 a2!934 from!913 to!880))))

(assert (= (and start!24730 res!103952) b!125504))

(assert (= (and b!125504 res!103951) b!125500))

(assert (= (and b!125500 res!103955) b!125503))

(assert (= (and b!125503 res!103957) b!125501))

(assert (= (and b!125501 res!103956) b!125498))

(assert (= (and b!125498 res!103953) b!125499))

(assert (= (and b!125499 res!103954) b!125502))

(declare-fun m!190863 () Bool)

(assert (=> b!125499 m!190863))

(declare-fun m!190865 () Bool)

(assert (=> b!125504 m!190865))

(declare-fun m!190867 () Bool)

(assert (=> start!24730 m!190867))

(declare-fun m!190869 () Bool)

(assert (=> start!24730 m!190869))

(declare-fun m!190871 () Bool)

(assert (=> b!125501 m!190871))

(declare-fun m!190873 () Bool)

(assert (=> b!125502 m!190873))

(declare-fun m!190875 () Bool)

(assert (=> b!125502 m!190875))

(declare-fun m!190877 () Bool)

(assert (=> b!125502 m!190877))

(push 1)

(assert (not b!125502))

(assert (not start!24730))

(assert (not b!125504))

(assert (not b!125499))

(assert (not b!125501))

(check-sat)

(pop 1)

(push 1)

(check-sat)

