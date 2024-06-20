; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66498 () Bool)

(assert start!66498)

(declare-fun b!297975 () Bool)

(declare-fun res!245911 () Bool)

(declare-fun e!213405 () Bool)

(assert (=> b!297975 (=> (not res!245911) (not e!213405))))

(declare-datatypes ((array!17857 0))(
  ( (array!17858 (arr!8819 (Array (_ BitVec 32) (_ BitVec 8))) (size!7739 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13482 0))(
  ( (BitStream!13483 (buf!7802 array!17857) (currentByte!14356 (_ BitVec 32)) (currentBit!14351 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13482)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297975 (= res!245911 (validate_offset_bits!1 ((_ sign_extend 32) (size!7739 (buf!7802 thiss!1728))) ((_ sign_extend 32) (currentByte!14356 thiss!1728)) ((_ sign_extend 32) (currentBit!14351 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!245910 () Bool)

(assert (=> start!66498 (=> (not res!245910) (not e!213405))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun arr!273 () array!17857)

(assert (=> start!66498 (= res!245910 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7739 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66498 e!213405))

(declare-fun e!213408 () Bool)

(declare-fun inv!12 (BitStream!13482) Bool)

(assert (=> start!66498 (and (inv!12 thiss!1728) e!213408)))

(assert (=> start!66498 true))

(declare-fun array_inv!7351 (array!17857) Bool)

(assert (=> start!66498 (array_inv!7351 arr!273)))

(declare-fun b!297978 () Bool)

(assert (=> b!297978 (= e!213408 (array_inv!7351 (buf!7802 thiss!1728)))))

(declare-fun b!297977 () Bool)

(assert (=> b!297977 (= e!213405 (not true))))

(declare-fun arrayBitRangesEq!0 (array!17857 array!17857 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297977 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20799 0))(
  ( (Unit!20800) )
))
(declare-fun lt!434184 () Unit!20799)

(declare-fun lt!434183 () (_ BitVec 64))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17857 array!17857 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20799)

(assert (=> b!297977 (= lt!434184 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434183 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!297977 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434183)))

(assert (=> b!297977 (= lt!434183 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7739 arr!273))))))

(declare-fun lt!434182 () Unit!20799)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17857) Unit!20799)

(assert (=> b!297977 (= lt!434182 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!297976 () Bool)

(declare-fun res!245912 () Bool)

(assert (=> b!297976 (=> (not res!245912) (not e!213405))))

(assert (=> b!297976 (= res!245912 (bvsge from!505 to!474))))

(assert (= (and start!66498 res!245910) b!297975))

(assert (= (and b!297975 res!245911) b!297976))

(assert (= (and b!297976 res!245912) b!297977))

(assert (= start!66498 b!297978))

(declare-fun m!436859 () Bool)

(assert (=> b!297975 m!436859))

(declare-fun m!436861 () Bool)

(assert (=> start!66498 m!436861))

(declare-fun m!436863 () Bool)

(assert (=> start!66498 m!436863))

(declare-fun m!436865 () Bool)

(assert (=> b!297978 m!436865))

(declare-fun m!436867 () Bool)

(assert (=> b!297977 m!436867))

(declare-fun m!436869 () Bool)

(assert (=> b!297977 m!436869))

(declare-fun m!436871 () Bool)

(assert (=> b!297977 m!436871))

(declare-fun m!436873 () Bool)

(assert (=> b!297977 m!436873))

(check-sat (not b!297977) (not b!297975) (not b!297978) (not start!66498))
