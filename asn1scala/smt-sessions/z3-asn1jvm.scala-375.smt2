; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8944 () Bool)

(assert start!8944)

(declare-fun b!44308 () Bool)

(declare-fun res!37527 () Bool)

(declare-fun e!29512 () Bool)

(assert (=> b!44308 (=> (not res!37527) (not e!29512))))

(declare-datatypes ((array!2235 0))(
  ( (array!2236 (arr!1518 (Array (_ BitVec 32) (_ BitVec 8))) (size!1007 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1758 0))(
  ( (BitStream!1759 (buf!1350 array!2235) (currentByte!2831 (_ BitVec 32)) (currentBit!2826 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1758)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!44308 (= res!37527 (validate_offset_bits!1 ((_ sign_extend 32) (size!1007 (buf!1350 thiss!1379))) ((_ sign_extend 32) (currentByte!2831 thiss!1379)) ((_ sign_extend 32) (currentBit!2826 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!44309 () Bool)

(declare-fun e!29518 () Bool)

(declare-fun e!29515 () Bool)

(assert (=> b!44309 (= e!29518 e!29515)))

(declare-fun res!37522 () Bool)

(assert (=> b!44309 (=> res!37522 e!29515)))

(declare-datatypes ((Unit!3156 0))(
  ( (Unit!3157) )
))
(declare-datatypes ((tuple2!4338 0))(
  ( (tuple2!4339 (_1!2262 Unit!3156) (_2!2262 BitStream!1758)) )
))
(declare-fun lt!67690 () tuple2!4338)

(declare-fun isPrefixOf!0 (BitStream!1758 BitStream!1758) Bool)

(assert (=> b!44309 (= res!37522 (not (isPrefixOf!0 thiss!1379 (_2!2262 lt!67690))))))

(assert (=> b!44309 (validate_offset_bits!1 ((_ sign_extend 32) (size!1007 (buf!1350 (_2!2262 lt!67690)))) ((_ sign_extend 32) (currentByte!2831 (_2!2262 lt!67690))) ((_ sign_extend 32) (currentBit!2826 (_2!2262 lt!67690))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!67682 () Unit!3156)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1758 BitStream!1758 (_ BitVec 64) (_ BitVec 64)) Unit!3156)

(assert (=> b!44309 (= lt!67682 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2262 lt!67690) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2235)

(declare-fun appendBitFromByte!0 (BitStream!1758 (_ BitVec 8) (_ BitVec 32)) tuple2!4338)

(assert (=> b!44309 (= lt!67690 (appendBitFromByte!0 thiss!1379 (select (arr!1518 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!44310 () Bool)

(declare-fun e!29517 () Bool)

(assert (=> b!44310 (= e!29517 true)))

(declare-fun lt!67686 () (_ BitVec 64))

(declare-fun lt!67688 () tuple2!4338)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!44310 (= lt!67686 (bitIndex!0 (size!1007 (buf!1350 (_2!2262 lt!67688))) (currentByte!2831 (_2!2262 lt!67688)) (currentBit!2826 (_2!2262 lt!67688))))))

(declare-fun res!37523 () Bool)

(assert (=> start!8944 (=> (not res!37523) (not e!29512))))

(assert (=> start!8944 (= res!37523 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1007 srcBuffer!2))))))))

(assert (=> start!8944 e!29512))

(assert (=> start!8944 true))

(declare-fun array_inv!932 (array!2235) Bool)

(assert (=> start!8944 (array_inv!932 srcBuffer!2)))

(declare-fun e!29514 () Bool)

(declare-fun inv!12 (BitStream!1758) Bool)

(assert (=> start!8944 (and (inv!12 thiss!1379) e!29514)))

(declare-fun b!44311 () Bool)

(assert (=> b!44311 (= e!29515 e!29517)))

(declare-fun res!37526 () Bool)

(assert (=> b!44311 (=> res!37526 e!29517)))

(assert (=> b!44311 (= res!37526 (not (isPrefixOf!0 (_2!2262 lt!67690) (_2!2262 lt!67688))))))

(assert (=> b!44311 (isPrefixOf!0 thiss!1379 (_2!2262 lt!67688))))

(declare-fun lt!67689 () Unit!3156)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1758 BitStream!1758 BitStream!1758) Unit!3156)

(assert (=> b!44311 (= lt!67689 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2262 lt!67690) (_2!2262 lt!67688)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1758 array!2235 (_ BitVec 64) (_ BitVec 64)) tuple2!4338)

(assert (=> b!44311 (= lt!67688 (appendBitsMSBFirstLoop!0 (_2!2262 lt!67690) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!29516 () Bool)

(assert (=> b!44311 e!29516))

(declare-fun res!37525 () Bool)

(assert (=> b!44311 (=> (not res!37525) (not e!29516))))

(assert (=> b!44311 (= res!37525 (validate_offset_bits!1 ((_ sign_extend 32) (size!1007 (buf!1350 (_2!2262 lt!67690)))) ((_ sign_extend 32) (currentByte!2831 thiss!1379)) ((_ sign_extend 32) (currentBit!2826 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!67683 () Unit!3156)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1758 array!2235 (_ BitVec 64)) Unit!3156)

(assert (=> b!44311 (= lt!67683 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1350 (_2!2262 lt!67690)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!4340 0))(
  ( (tuple2!4341 (_1!2263 BitStream!1758) (_2!2263 BitStream!1758)) )
))
(declare-fun lt!67685 () tuple2!4340)

(declare-fun reader!0 (BitStream!1758 BitStream!1758) tuple2!4340)

(assert (=> b!44311 (= lt!67685 (reader!0 thiss!1379 (_2!2262 lt!67690)))))

(declare-fun b!44312 () Bool)

(declare-datatypes ((List!520 0))(
  ( (Nil!517) (Cons!516 (h!635 Bool) (t!1270 List!520)) )
))
(declare-fun head!339 (List!520) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1758 array!2235 (_ BitVec 64) (_ BitVec 64)) List!520)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1758 BitStream!1758 (_ BitVec 64)) List!520)

(assert (=> b!44312 (= e!29516 (= (head!339 (byteArrayBitContentToList!0 (_2!2262 lt!67690) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!339 (bitStreamReadBitsIntoList!0 (_2!2262 lt!67690) (_1!2263 lt!67685) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!44313 () Bool)

(assert (=> b!44313 (= e!29512 (not e!29518))))

(declare-fun res!37524 () Bool)

(assert (=> b!44313 (=> res!37524 e!29518)))

(assert (=> b!44313 (= res!37524 (bvsge i!635 to!314))))

(assert (=> b!44313 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!67687 () Unit!3156)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1758) Unit!3156)

(assert (=> b!44313 (= lt!67687 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!67684 () (_ BitVec 64))

(assert (=> b!44313 (= lt!67684 (bitIndex!0 (size!1007 (buf!1350 thiss!1379)) (currentByte!2831 thiss!1379) (currentBit!2826 thiss!1379)))))

(declare-fun b!44314 () Bool)

(assert (=> b!44314 (= e!29514 (array_inv!932 (buf!1350 thiss!1379)))))

(assert (= (and start!8944 res!37523) b!44308))

(assert (= (and b!44308 res!37527) b!44313))

(assert (= (and b!44313 (not res!37524)) b!44309))

(assert (= (and b!44309 (not res!37522)) b!44311))

(assert (= (and b!44311 res!37525) b!44312))

(assert (= (and b!44311 (not res!37526)) b!44310))

(assert (= start!8944 b!44314))

(declare-fun m!67555 () Bool)

(assert (=> b!44309 m!67555))

(declare-fun m!67557 () Bool)

(assert (=> b!44309 m!67557))

(declare-fun m!67559 () Bool)

(assert (=> b!44309 m!67559))

(assert (=> b!44309 m!67555))

(declare-fun m!67561 () Bool)

(assert (=> b!44309 m!67561))

(declare-fun m!67563 () Bool)

(assert (=> b!44309 m!67563))

(declare-fun m!67565 () Bool)

(assert (=> start!8944 m!67565))

(declare-fun m!67567 () Bool)

(assert (=> start!8944 m!67567))

(declare-fun m!67569 () Bool)

(assert (=> b!44312 m!67569))

(assert (=> b!44312 m!67569))

(declare-fun m!67571 () Bool)

(assert (=> b!44312 m!67571))

(declare-fun m!67573 () Bool)

(assert (=> b!44312 m!67573))

(assert (=> b!44312 m!67573))

(declare-fun m!67575 () Bool)

(assert (=> b!44312 m!67575))

(declare-fun m!67577 () Bool)

(assert (=> b!44308 m!67577))

(declare-fun m!67579 () Bool)

(assert (=> b!44311 m!67579))

(declare-fun m!67581 () Bool)

(assert (=> b!44311 m!67581))

(declare-fun m!67583 () Bool)

(assert (=> b!44311 m!67583))

(declare-fun m!67585 () Bool)

(assert (=> b!44311 m!67585))

(declare-fun m!67587 () Bool)

(assert (=> b!44311 m!67587))

(declare-fun m!67589 () Bool)

(assert (=> b!44311 m!67589))

(declare-fun m!67591 () Bool)

(assert (=> b!44311 m!67591))

(declare-fun m!67593 () Bool)

(assert (=> b!44314 m!67593))

(declare-fun m!67595 () Bool)

(assert (=> b!44310 m!67595))

(declare-fun m!67597 () Bool)

(assert (=> b!44313 m!67597))

(declare-fun m!67599 () Bool)

(assert (=> b!44313 m!67599))

(declare-fun m!67601 () Bool)

(assert (=> b!44313 m!67601))

(check-sat (not b!44310) (not b!44308) (not start!8944) (not b!44309) (not b!44313) (not b!44314) (not b!44311) (not b!44312))
