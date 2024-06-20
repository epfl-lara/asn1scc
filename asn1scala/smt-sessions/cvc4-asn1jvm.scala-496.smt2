; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14740 () Bool)

(assert start!14740)

(declare-fun b!75880 () Bool)

(declare-fun res!62740 () Bool)

(declare-fun e!49661 () Bool)

(assert (=> b!75880 (=> res!62740 e!49661)))

(declare-datatypes ((array!3107 0))(
  ( (array!3108 (arr!2045 (Array (_ BitVec 32) (_ BitVec 8))) (size!1447 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2468 0))(
  ( (BitStream!2469 (buf!1828 array!3107) (currentByte!3619 (_ BitVec 32)) (currentBit!3614 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2468)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!75880 (= res!62740 (not (invariant!0 (currentBit!3614 thiss!1379) (currentByte!3619 thiss!1379) (size!1447 (buf!1828 thiss!1379)))))))

(declare-fun b!75881 () Bool)

(declare-fun e!49658 () Bool)

(assert (=> b!75881 (= e!49658 (not e!49661))))

(declare-fun res!62739 () Bool)

(assert (=> b!75881 (=> res!62739 e!49661)))

(declare-fun lt!121957 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!75881 (= res!62739 (or (bvslt i!635 to!314) (not (= lt!121957 (bvsub (bvadd lt!121957 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!2468 BitStream!2468) Bool)

(assert (=> b!75881 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4994 0))(
  ( (Unit!4995) )
))
(declare-fun lt!121959 () Unit!4994)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2468) Unit!4994)

(assert (=> b!75881 (= lt!121959 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!75881 (= lt!121957 (bitIndex!0 (size!1447 (buf!1828 thiss!1379)) (currentByte!3619 thiss!1379) (currentBit!3614 thiss!1379)))))

(declare-fun b!75882 () Bool)

(declare-fun e!49659 () Bool)

(assert (=> b!75882 (= e!49659 true)))

(declare-fun srcBuffer!2 () array!3107)

(declare-datatypes ((tuple2!6546 0))(
  ( (tuple2!6547 (_1!3404 array!3107) (_2!3404 BitStream!2468)) )
))
(declare-fun lt!121958 () tuple2!6546)

(declare-fun checkByteArrayBitContent!0 (BitStream!2468 array!3107 array!3107 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75882 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3404 lt!121958) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun res!62742 () Bool)

(assert (=> start!14740 (=> (not res!62742) (not e!49658))))

(assert (=> start!14740 (= res!62742 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1447 srcBuffer!2))))))))

(assert (=> start!14740 e!49658))

(assert (=> start!14740 true))

(declare-fun array_inv!1293 (array!3107) Bool)

(assert (=> start!14740 (array_inv!1293 srcBuffer!2)))

(declare-fun e!49657 () Bool)

(declare-fun inv!12 (BitStream!2468) Bool)

(assert (=> start!14740 (and (inv!12 thiss!1379) e!49657)))

(declare-fun b!75883 () Bool)

(assert (=> b!75883 (= e!49657 (array_inv!1293 (buf!1828 thiss!1379)))))

(declare-fun b!75884 () Bool)

(assert (=> b!75884 (= e!49661 e!49659)))

(declare-fun res!62741 () Bool)

(assert (=> b!75884 (=> res!62741 e!49659)))

(assert (=> b!75884 (= res!62741 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!2468 (_ BitVec 64)) tuple2!6546)

(declare-datatypes ((tuple2!6548 0))(
  ( (tuple2!6549 (_1!3405 BitStream!2468) (_2!3405 BitStream!2468)) )
))
(declare-fun reader!0 (BitStream!2468 BitStream!2468) tuple2!6548)

(assert (=> b!75884 (= lt!121958 (readBits!0 (_1!3405 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!75885 () Bool)

(declare-fun res!62743 () Bool)

(assert (=> b!75885 (=> (not res!62743) (not e!49658))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75885 (= res!62743 (validate_offset_bits!1 ((_ sign_extend 32) (size!1447 (buf!1828 thiss!1379))) ((_ sign_extend 32) (currentByte!3619 thiss!1379)) ((_ sign_extend 32) (currentBit!3614 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!14740 res!62742) b!75885))

(assert (= (and b!75885 res!62743) b!75881))

(assert (= (and b!75881 (not res!62739)) b!75880))

(assert (= (and b!75880 (not res!62740)) b!75884))

(assert (= (and b!75884 (not res!62741)) b!75882))

(assert (= start!14740 b!75883))

(declare-fun m!120997 () Bool)

(assert (=> b!75885 m!120997))

(declare-fun m!120999 () Bool)

(assert (=> b!75880 m!120999))

(declare-fun m!121001 () Bool)

(assert (=> b!75884 m!121001))

(declare-fun m!121003 () Bool)

(assert (=> b!75884 m!121003))

(declare-fun m!121005 () Bool)

(assert (=> start!14740 m!121005))

(declare-fun m!121007 () Bool)

(assert (=> start!14740 m!121007))

(declare-fun m!121009 () Bool)

(assert (=> b!75882 m!121009))

(declare-fun m!121011 () Bool)

(assert (=> b!75883 m!121011))

(declare-fun m!121013 () Bool)

(assert (=> b!75881 m!121013))

(declare-fun m!121015 () Bool)

(assert (=> b!75881 m!121015))

(declare-fun m!121017 () Bool)

(assert (=> b!75881 m!121017))

(push 1)

