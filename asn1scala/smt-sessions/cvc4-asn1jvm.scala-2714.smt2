; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66488 () Bool)

(assert start!66488)

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun lt!434139 () (_ BitVec 64))

(declare-fun e!213348 () Bool)

(declare-fun b!297917 () Bool)

(assert (=> b!297917 (= e!213348 (not (= (bvsub (bvadd lt!434139 to!474) from!505) lt!434139)))))

(declare-datatypes ((array!17847 0))(
  ( (array!17848 (arr!8814 (Array (_ BitVec 32) (_ BitVec 8))) (size!7734 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13472 0))(
  ( (BitStream!13473 (buf!7797 array!17847) (currentByte!14351 (_ BitVec 32)) (currentBit!14346 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13472)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!297917 (= lt!434139 (bitIndex!0 (size!7734 (buf!7797 thiss!1728)) (currentByte!14351 thiss!1728) (currentBit!14346 thiss!1728)))))

(declare-fun arr!273 () array!17847)

(declare-fun arrayBitRangesEq!0 (array!17847 array!17847 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297917 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20789 0))(
  ( (Unit!20790) )
))
(declare-fun lt!434138 () Unit!20789)

(declare-fun lt!434137 () (_ BitVec 64))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17847 array!17847 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20789)

(assert (=> b!297917 (= lt!434138 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434137 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!297917 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434137)))

(assert (=> b!297917 (= lt!434137 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7734 arr!273))))))

(declare-fun lt!434136 () Unit!20789)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17847) Unit!20789)

(assert (=> b!297917 (= lt!434136 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!297915 () Bool)

(declare-fun res!245865 () Bool)

(assert (=> b!297915 (=> (not res!245865) (not e!213348))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297915 (= res!245865 (validate_offset_bits!1 ((_ sign_extend 32) (size!7734 (buf!7797 thiss!1728))) ((_ sign_extend 32) (currentByte!14351 thiss!1728)) ((_ sign_extend 32) (currentBit!14346 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!245866 () Bool)

(assert (=> start!66488 (=> (not res!245866) (not e!213348))))

(assert (=> start!66488 (= res!245866 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7734 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66488 e!213348))

(declare-fun e!213346 () Bool)

(declare-fun inv!12 (BitStream!13472) Bool)

(assert (=> start!66488 (and (inv!12 thiss!1728) e!213346)))

(assert (=> start!66488 true))

(declare-fun array_inv!7346 (array!17847) Bool)

(assert (=> start!66488 (array_inv!7346 arr!273)))

(declare-fun b!297918 () Bool)

(assert (=> b!297918 (= e!213346 (array_inv!7346 (buf!7797 thiss!1728)))))

(declare-fun b!297916 () Bool)

(declare-fun res!245867 () Bool)

(assert (=> b!297916 (=> (not res!245867) (not e!213348))))

(assert (=> b!297916 (= res!245867 (bvsge from!505 to!474))))

(assert (= (and start!66488 res!245866) b!297915))

(assert (= (and b!297915 res!245865) b!297916))

(assert (= (and b!297916 res!245867) b!297917))

(assert (= start!66488 b!297918))

(declare-fun m!436777 () Bool)

(assert (=> b!297917 m!436777))

(declare-fun m!436779 () Bool)

(assert (=> b!297917 m!436779))

(declare-fun m!436781 () Bool)

(assert (=> b!297917 m!436781))

(declare-fun m!436783 () Bool)

(assert (=> b!297917 m!436783))

(declare-fun m!436785 () Bool)

(assert (=> b!297917 m!436785))

(declare-fun m!436787 () Bool)

(assert (=> b!297915 m!436787))

(declare-fun m!436789 () Bool)

(assert (=> start!66488 m!436789))

(declare-fun m!436791 () Bool)

(assert (=> start!66488 m!436791))

(declare-fun m!436793 () Bool)

(assert (=> b!297918 m!436793))

(push 1)

(assert (not b!297915))

(assert (not start!66488))

(assert (not b!297918))

(assert (not b!297917))

(check-sat)

(pop 1)

(push 1)

(check-sat)

