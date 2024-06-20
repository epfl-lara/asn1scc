; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66504 () Bool)

(assert start!66504)

(declare-fun res!245939 () Bool)

(declare-fun e!213442 () Bool)

(assert (=> start!66504 (=> (not res!245939) (not e!213442))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17863 0))(
  ( (array!17864 (arr!8822 (Array (_ BitVec 32) (_ BitVec 8))) (size!7742 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17863)

(assert (=> start!66504 (= res!245939 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7742 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66504 e!213442))

(declare-datatypes ((BitStream!13488 0))(
  ( (BitStream!13489 (buf!7805 array!17863) (currentByte!14359 (_ BitVec 32)) (currentBit!14354 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13488)

(declare-fun e!213441 () Bool)

(declare-fun inv!12 (BitStream!13488) Bool)

(assert (=> start!66504 (and (inv!12 thiss!1728) e!213441)))

(assert (=> start!66504 true))

(declare-fun array_inv!7354 (array!17863) Bool)

(assert (=> start!66504 (array_inv!7354 arr!273)))

(declare-fun b!298011 () Bool)

(declare-fun res!245937 () Bool)

(assert (=> b!298011 (=> (not res!245937) (not e!213442))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298011 (= res!245937 (validate_offset_bits!1 ((_ sign_extend 32) (size!7742 (buf!7805 thiss!1728))) ((_ sign_extend 32) (currentByte!14359 thiss!1728)) ((_ sign_extend 32) (currentBit!14354 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!298013 () Bool)

(assert (=> b!298013 (= e!213442 (not true))))

(declare-fun arrayBitRangesEq!0 (array!17863 array!17863 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298013 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!434211 () (_ BitVec 64))

(declare-datatypes ((Unit!20805 0))(
  ( (Unit!20806) )
))
(declare-fun lt!434210 () Unit!20805)

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17863 array!17863 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20805)

(assert (=> b!298013 (= lt!434210 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434211 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!298013 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434211)))

(assert (=> b!298013 (= lt!434211 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7742 arr!273))))))

(declare-fun lt!434209 () Unit!20805)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17863) Unit!20805)

(assert (=> b!298013 (= lt!434209 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!298012 () Bool)

(declare-fun res!245938 () Bool)

(assert (=> b!298012 (=> (not res!245938) (not e!213442))))

(assert (=> b!298012 (= res!245938 (bvsge from!505 to!474))))

(declare-fun b!298014 () Bool)

(assert (=> b!298014 (= e!213441 (array_inv!7354 (buf!7805 thiss!1728)))))

(assert (= (and start!66504 res!245939) b!298011))

(assert (= (and b!298011 res!245937) b!298012))

(assert (= (and b!298012 res!245938) b!298013))

(assert (= start!66504 b!298014))

(declare-fun m!436907 () Bool)

(assert (=> start!66504 m!436907))

(declare-fun m!436909 () Bool)

(assert (=> start!66504 m!436909))

(declare-fun m!436911 () Bool)

(assert (=> b!298011 m!436911))

(declare-fun m!436913 () Bool)

(assert (=> b!298013 m!436913))

(declare-fun m!436915 () Bool)

(assert (=> b!298013 m!436915))

(declare-fun m!436917 () Bool)

(assert (=> b!298013 m!436917))

(declare-fun m!436919 () Bool)

(assert (=> b!298013 m!436919))

(declare-fun m!436921 () Bool)

(assert (=> b!298014 m!436921))

(check-sat (not b!298013) (not start!66504) (not b!298014) (not b!298011))
