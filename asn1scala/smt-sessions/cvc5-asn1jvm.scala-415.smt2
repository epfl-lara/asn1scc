; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10614 () Bool)

(assert start!10614)

(declare-fun b!53100 () Bool)

(declare-fun e!35359 () Bool)

(declare-fun e!35360 () Bool)

(assert (=> b!53100 (= e!35359 e!35360)))

(declare-fun res!44358 () Bool)

(assert (=> b!53100 (=> res!44358 e!35360)))

(declare-datatypes ((array!2506 0))(
  ( (array!2507 (arr!1679 (Array (_ BitVec 32) (_ BitVec 8))) (size!1143 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1978 0))(
  ( (BitStream!1979 (buf!1493 array!2506) (currentByte!3054 (_ BitVec 32)) (currentBit!3049 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1978)

(declare-datatypes ((Unit!3693 0))(
  ( (Unit!3694) )
))
(declare-datatypes ((tuple2!4830 0))(
  ( (tuple2!4831 (_1!2520 Unit!3693) (_2!2520 BitStream!1978)) )
))
(declare-fun lt!82320 () tuple2!4830)

(declare-fun isPrefixOf!0 (BitStream!1978 BitStream!1978) Bool)

(assert (=> b!53100 (= res!44358 (not (isPrefixOf!0 thiss!1379 (_2!2520 lt!82320))))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!53100 (validate_offset_bits!1 ((_ sign_extend 32) (size!1143 (buf!1493 (_2!2520 lt!82320)))) ((_ sign_extend 32) (currentByte!3054 (_2!2520 lt!82320))) ((_ sign_extend 32) (currentBit!3049 (_2!2520 lt!82320))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!82323 () Unit!3693)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1978 BitStream!1978 (_ BitVec 64) (_ BitVec 64)) Unit!3693)

(assert (=> b!53100 (= lt!82323 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2520 lt!82320) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2506)

(declare-fun appendBitFromByte!0 (BitStream!1978 (_ BitVec 8) (_ BitVec 32)) tuple2!4830)

(assert (=> b!53100 (= lt!82320 (appendBitFromByte!0 thiss!1379 (select (arr!1679 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!44361 () Bool)

(declare-fun e!35358 () Bool)

(assert (=> start!10614 (=> (not res!44361) (not e!35358))))

(assert (=> start!10614 (= res!44361 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1143 srcBuffer!2))))))))

(assert (=> start!10614 e!35358))

(assert (=> start!10614 true))

(declare-fun array_inv!1048 (array!2506) Bool)

(assert (=> start!10614 (array_inv!1048 srcBuffer!2)))

(declare-fun e!35357 () Bool)

(declare-fun inv!12 (BitStream!1978) Bool)

(assert (=> start!10614 (and (inv!12 thiss!1379) e!35357)))

(declare-fun b!53101 () Bool)

(assert (=> b!53101 (= e!35357 (array_inv!1048 (buf!1493 thiss!1379)))))

(declare-fun b!53102 () Bool)

(assert (=> b!53102 (= e!35358 (not e!35359))))

(declare-fun res!44360 () Bool)

(assert (=> b!53102 (=> res!44360 e!35359)))

(assert (=> b!53102 (= res!44360 (bvsge i!635 to!314))))

(assert (=> b!53102 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!82322 () Unit!3693)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1978) Unit!3693)

(assert (=> b!53102 (= lt!82322 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!82324 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!53102 (= lt!82324 (bitIndex!0 (size!1143 (buf!1493 thiss!1379)) (currentByte!3054 thiss!1379) (currentBit!3049 thiss!1379)))))

(declare-fun b!53103 () Bool)

(declare-fun res!44359 () Bool)

(assert (=> b!53103 (=> (not res!44359) (not e!35358))))

(assert (=> b!53103 (= res!44359 (validate_offset_bits!1 ((_ sign_extend 32) (size!1143 (buf!1493 thiss!1379))) ((_ sign_extend 32) (currentByte!3054 thiss!1379)) ((_ sign_extend 32) (currentBit!3049 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!53104 () Bool)

(assert (=> b!53104 (= e!35360 true)))

(declare-datatypes ((tuple2!4832 0))(
  ( (tuple2!4833 (_1!2521 BitStream!1978) (_2!2521 BitStream!1978)) )
))
(declare-fun lt!82321 () tuple2!4832)

(declare-fun reader!0 (BitStream!1978 BitStream!1978) tuple2!4832)

(assert (=> b!53104 (= lt!82321 (reader!0 thiss!1379 (_2!2520 lt!82320)))))

(assert (= (and start!10614 res!44361) b!53103))

(assert (= (and b!53103 res!44359) b!53102))

(assert (= (and b!53102 (not res!44360)) b!53100))

(assert (= (and b!53100 (not res!44358)) b!53104))

(assert (= start!10614 b!53101))

(declare-fun m!83569 () Bool)

(assert (=> b!53101 m!83569))

(declare-fun m!83571 () Bool)

(assert (=> start!10614 m!83571))

(declare-fun m!83573 () Bool)

(assert (=> start!10614 m!83573))

(declare-fun m!83575 () Bool)

(assert (=> b!53104 m!83575))

(declare-fun m!83577 () Bool)

(assert (=> b!53100 m!83577))

(declare-fun m!83579 () Bool)

(assert (=> b!53100 m!83579))

(declare-fun m!83581 () Bool)

(assert (=> b!53100 m!83581))

(declare-fun m!83583 () Bool)

(assert (=> b!53100 m!83583))

(assert (=> b!53100 m!83577))

(declare-fun m!83585 () Bool)

(assert (=> b!53100 m!83585))

(declare-fun m!83587 () Bool)

(assert (=> b!53103 m!83587))

(declare-fun m!83589 () Bool)

(assert (=> b!53102 m!83589))

(declare-fun m!83591 () Bool)

(assert (=> b!53102 m!83591))

(declare-fun m!83593 () Bool)

(assert (=> b!53102 m!83593))

(push 1)

(assert (not b!53102))

(assert (not b!53100))

(assert (not b!53104))

(assert (not b!53101))

(assert (not start!10614))

(assert (not b!53103))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

