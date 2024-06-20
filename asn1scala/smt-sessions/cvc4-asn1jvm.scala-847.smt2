; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24674 () Bool)

(assert start!24674)

(declare-fun res!103605 () Bool)

(declare-fun e!82214 () Bool)

(assert (=> start!24674 (=> (not res!103605) (not e!82214))))

(declare-datatypes ((array!5611 0))(
  ( (array!5612 (arr!3134 (Array (_ BitVec 32) (_ BitVec 8))) (size!2541 (_ BitVec 32))) )
))
(declare-fun a2!934 () array!5611)

(declare-fun to!880 () (_ BitVec 64))

(declare-fun a1!934 () array!5611)

(declare-fun from!913 () (_ BitVec 64))

(declare-fun atByte!11 () (_ BitVec 32))

(assert (=> start!24674 (= res!103605 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!913) (bvsle from!913 to!880) (= (size!2541 a1!934) (size!2541 a2!934)) (bvsle to!880 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2541 a1!934)))) (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11)) (bvslt ((_ sign_extend 32) atByte!11) (bvsdiv to!880 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> start!24674 e!82214))

(declare-fun array_inv!2330 (array!5611) Bool)

(assert (=> start!24674 (array_inv!2330 a2!934)))

(assert (=> start!24674 true))

(assert (=> start!24674 (array_inv!2330 a1!934)))

(declare-fun b!125123 () Bool)

(declare-fun i!1051 () (_ BitVec 64))

(assert (=> b!125123 (= e!82214 (and (not (= (bvsdiv i!1051 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) atByte!11))) (= (bvand i!1051 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand i!1051 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1051) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!125121 () Bool)

(declare-fun res!103606 () Bool)

(assert (=> b!125121 (=> (not res!103606) (not e!82214))))

(assert (=> b!125121 (= res!103606 (and (bvsle (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!913) #b0000000000000000000000000000000000000000000000000000000000001000) i!1051) (bvsle i!1051 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!11)))))))

(declare-fun b!125122 () Bool)

(declare-fun res!103603 () Bool)

(assert (=> b!125122 (=> (not res!103603) (not e!82214))))

(declare-fun arrayBitRangesEq!0 (array!5611 array!5611 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!125122 (= res!103603 (arrayBitRangesEq!0 a1!934 a2!934 i!1051 to!880))))

(declare-fun b!125120 () Bool)

(declare-fun res!103604 () Bool)

(assert (=> b!125120 (=> (not res!103604) (not e!82214))))

(assert (=> b!125120 (= res!103604 (arrayBitRangesEq!0 a1!934 a2!934 from!913 to!880))))

(assert (= (and start!24674 res!103605) b!125120))

(assert (= (and b!125120 res!103604) b!125121))

(assert (= (and b!125121 res!103606) b!125122))

(assert (= (and b!125122 res!103603) b!125123))

(declare-fun m!190465 () Bool)

(assert (=> start!24674 m!190465))

(declare-fun m!190467 () Bool)

(assert (=> start!24674 m!190467))

(declare-fun m!190469 () Bool)

(assert (=> b!125122 m!190469))

(declare-fun m!190471 () Bool)

(assert (=> b!125120 m!190471))

(push 1)

(assert (not b!125122))

(assert (not start!24674))

(assert (not b!125120))

(check-sat)

(pop 1)

(push 1)

(check-sat)

