; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14726 () Bool)

(assert start!14726)

(declare-fun b!75754 () Bool)

(declare-fun e!49534 () Bool)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!75754 (= e!49534 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((array!3093 0))(
  ( (array!3094 (arr!2038 (Array (_ BitVec 32) (_ BitVec 8))) (size!1440 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!3093)

(declare-datatypes ((BitStream!2454 0))(
  ( (BitStream!2455 (buf!1821 array!3093) (currentByte!3612 (_ BitVec 32)) (currentBit!3607 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2454)

(declare-datatypes ((tuple2!6518 0))(
  ( (tuple2!6519 (_1!3390 array!3093) (_2!3390 BitStream!2454)) )
))
(declare-fun lt!121894 () tuple2!6518)

(declare-fun checkByteArrayBitContent!0 (BitStream!2454 array!3093 array!3093 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75754 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3390 lt!121894) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!75756 () Bool)

(declare-fun e!49536 () Bool)

(declare-fun e!49535 () Bool)

(assert (=> b!75756 (= e!49536 (not e!49535))))

(declare-fun res!62634 () Bool)

(assert (=> b!75756 (=> res!62634 e!49535)))

(declare-fun lt!121896 () (_ BitVec 64))

(assert (=> b!75756 (= res!62634 (or (bvslt i!635 to!314) (not (= lt!121896 (bvsub (bvadd lt!121896 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!2454 BitStream!2454) Bool)

(assert (=> b!75756 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4980 0))(
  ( (Unit!4981) )
))
(declare-fun lt!121895 () Unit!4980)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2454) Unit!4980)

(assert (=> b!75756 (= lt!121895 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!75756 (= lt!121896 (bitIndex!0 (size!1440 (buf!1821 thiss!1379)) (currentByte!3612 thiss!1379) (currentBit!3607 thiss!1379)))))

(declare-fun b!75757 () Bool)

(declare-fun e!49533 () Bool)

(declare-fun array_inv!1286 (array!3093) Bool)

(assert (=> b!75757 (= e!49533 (array_inv!1286 (buf!1821 thiss!1379)))))

(declare-fun b!75758 () Bool)

(declare-fun res!62635 () Bool)

(assert (=> b!75758 (=> (not res!62635) (not e!49536))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75758 (= res!62635 (validate_offset_bits!1 ((_ sign_extend 32) (size!1440 (buf!1821 thiss!1379))) ((_ sign_extend 32) (currentByte!3612 thiss!1379)) ((_ sign_extend 32) (currentBit!3607 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!75759 () Bool)

(declare-fun res!62638 () Bool)

(assert (=> b!75759 (=> res!62638 e!49535)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!75759 (= res!62638 (not (invariant!0 (currentBit!3607 thiss!1379) (currentByte!3612 thiss!1379) (size!1440 (buf!1821 thiss!1379)))))))

(declare-fun res!62636 () Bool)

(assert (=> start!14726 (=> (not res!62636) (not e!49536))))

(assert (=> start!14726 (= res!62636 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1440 srcBuffer!2))))))))

(assert (=> start!14726 e!49536))

(assert (=> start!14726 true))

(assert (=> start!14726 (array_inv!1286 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2454) Bool)

(assert (=> start!14726 (and (inv!12 thiss!1379) e!49533)))

(declare-fun b!75755 () Bool)

(assert (=> b!75755 (= e!49535 e!49534)))

(declare-fun res!62637 () Bool)

(assert (=> b!75755 (=> res!62637 e!49534)))

(assert (=> b!75755 (= res!62637 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!2454 (_ BitVec 64)) tuple2!6518)

(declare-datatypes ((tuple2!6520 0))(
  ( (tuple2!6521 (_1!3391 BitStream!2454) (_2!3391 BitStream!2454)) )
))
(declare-fun reader!0 (BitStream!2454 BitStream!2454) tuple2!6520)

(assert (=> b!75755 (= lt!121894 (readBits!0 (_1!3391 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!14726 res!62636) b!75758))

(assert (= (and b!75758 res!62635) b!75756))

(assert (= (and b!75756 (not res!62634)) b!75759))

(assert (= (and b!75759 (not res!62638)) b!75755))

(assert (= (and b!75755 (not res!62637)) b!75754))

(assert (= start!14726 b!75757))

(declare-fun m!120843 () Bool)

(assert (=> b!75756 m!120843))

(declare-fun m!120845 () Bool)

(assert (=> b!75756 m!120845))

(declare-fun m!120847 () Bool)

(assert (=> b!75756 m!120847))

(declare-fun m!120849 () Bool)

(assert (=> b!75759 m!120849))

(declare-fun m!120851 () Bool)

(assert (=> b!75758 m!120851))

(declare-fun m!120853 () Bool)

(assert (=> b!75755 m!120853))

(declare-fun m!120855 () Bool)

(assert (=> b!75755 m!120855))

(declare-fun m!120857 () Bool)

(assert (=> start!14726 m!120857))

(declare-fun m!120859 () Bool)

(assert (=> start!14726 m!120859))

(declare-fun m!120861 () Bool)

(assert (=> b!75754 m!120861))

(declare-fun m!120863 () Bool)

(assert (=> b!75757 m!120863))

(check-sat (not b!75758) (not b!75755) (not b!75759) (not b!75757) (not b!75756) (not b!75754) (not start!14726))
