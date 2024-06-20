; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10860 () Bool)

(assert start!10860)

(declare-fun b!54005 () Bool)

(declare-fun res!45095 () Bool)

(declare-fun e!35984 () Bool)

(assert (=> b!54005 (=> (not res!45095) (not e!35984))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-datatypes ((array!2530 0))(
  ( (array!2531 (arr!1691 (Array (_ BitVec 32) (_ BitVec 8))) (size!1154 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1996 0))(
  ( (BitStream!1997 (buf!1508 array!2530) (currentByte!3081 (_ BitVec 32)) (currentBit!3076 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1996)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!54005 (= res!45095 (validate_offset_bits!1 ((_ sign_extend 32) (size!1154 (buf!1508 thiss!1379))) ((_ sign_extend 32) (currentByte!3081 thiss!1379)) ((_ sign_extend 32) (currentBit!3076 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!54006 () Bool)

(declare-fun e!35979 () Bool)

(declare-fun e!35980 () Bool)

(assert (=> b!54006 (= e!35979 e!35980)))

(declare-fun res!45096 () Bool)

(assert (=> b!54006 (=> res!45096 e!35980)))

(declare-datatypes ((Unit!3717 0))(
  ( (Unit!3718) )
))
(declare-datatypes ((tuple2!4902 0))(
  ( (tuple2!4903 (_1!2562 Unit!3717) (_2!2562 BitStream!1996)) )
))
(declare-fun lt!83607 () tuple2!4902)

(declare-fun isPrefixOf!0 (BitStream!1996 BitStream!1996) Bool)

(assert (=> b!54006 (= res!45096 (not (isPrefixOf!0 thiss!1379 (_2!2562 lt!83607))))))

(assert (=> b!54006 (validate_offset_bits!1 ((_ sign_extend 32) (size!1154 (buf!1508 (_2!2562 lt!83607)))) ((_ sign_extend 32) (currentByte!3081 (_2!2562 lt!83607))) ((_ sign_extend 32) (currentBit!3076 (_2!2562 lt!83607))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!83603 () Unit!3717)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1996 BitStream!1996 (_ BitVec 64) (_ BitVec 64)) Unit!3717)

(assert (=> b!54006 (= lt!83603 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2562 lt!83607) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2530)

(declare-fun appendBitFromByte!0 (BitStream!1996 (_ BitVec 8) (_ BitVec 32)) tuple2!4902)

(assert (=> b!54006 (= lt!83607 (appendBitFromByte!0 thiss!1379 (select (arr!1691 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!54007 () Bool)

(assert (=> b!54007 (= e!35980 (or (not (= (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!35978 () Bool)

(assert (=> b!54007 e!35978))

(declare-fun res!45092 () Bool)

(assert (=> b!54007 (=> (not res!45092) (not e!35978))))

(assert (=> b!54007 (= res!45092 (validate_offset_bits!1 ((_ sign_extend 32) (size!1154 (buf!1508 (_2!2562 lt!83607)))) ((_ sign_extend 32) (currentByte!3081 thiss!1379)) ((_ sign_extend 32) (currentBit!3076 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!83604 () Unit!3717)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1996 array!2530 (_ BitVec 64)) Unit!3717)

(assert (=> b!54007 (= lt!83604 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1508 (_2!2562 lt!83607)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!4904 0))(
  ( (tuple2!4905 (_1!2563 BitStream!1996) (_2!2563 BitStream!1996)) )
))
(declare-fun lt!83605 () tuple2!4904)

(declare-fun reader!0 (BitStream!1996 BitStream!1996) tuple2!4904)

(assert (=> b!54007 (= lt!83605 (reader!0 thiss!1379 (_2!2562 lt!83607)))))

(declare-fun b!54008 () Bool)

(declare-fun e!35983 () Bool)

(declare-fun array_inv!1057 (array!2530) Bool)

(assert (=> b!54008 (= e!35983 (array_inv!1057 (buf!1508 thiss!1379)))))

(declare-fun res!45094 () Bool)

(assert (=> start!10860 (=> (not res!45094) (not e!35984))))

(assert (=> start!10860 (= res!45094 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1154 srcBuffer!2))))))))

(assert (=> start!10860 e!35984))

(assert (=> start!10860 true))

(assert (=> start!10860 (array_inv!1057 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1996) Bool)

(assert (=> start!10860 (and (inv!12 thiss!1379) e!35983)))

(declare-fun b!54009 () Bool)

(assert (=> b!54009 (= e!35984 (not e!35979))))

(declare-fun res!45093 () Bool)

(assert (=> b!54009 (=> res!45093 e!35979)))

(assert (=> b!54009 (= res!45093 (bvsge i!635 to!314))))

(assert (=> b!54009 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!83608 () Unit!3717)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1996) Unit!3717)

(assert (=> b!54009 (= lt!83608 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!83606 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!54009 (= lt!83606 (bitIndex!0 (size!1154 (buf!1508 thiss!1379)) (currentByte!3081 thiss!1379) (currentBit!3076 thiss!1379)))))

(declare-fun b!54010 () Bool)

(declare-datatypes ((List!573 0))(
  ( (Nil!570) (Cons!569 (h!688 Bool) (t!1323 List!573)) )
))
(declare-fun head!392 (List!573) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1996 array!2530 (_ BitVec 64) (_ BitVec 64)) List!573)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1996 BitStream!1996 (_ BitVec 64)) List!573)

(assert (=> b!54010 (= e!35978 (= (head!392 (byteArrayBitContentToList!0 (_2!2562 lt!83607) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!392 (bitStreamReadBitsIntoList!0 (_2!2562 lt!83607) (_1!2563 lt!83605) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and start!10860 res!45094) b!54005))

(assert (= (and b!54005 res!45095) b!54009))

(assert (= (and b!54009 (not res!45093)) b!54006))

(assert (= (and b!54006 (not res!45096)) b!54007))

(assert (= (and b!54007 res!45092) b!54010))

(assert (= start!10860 b!54008))

(declare-fun m!84793 () Bool)

(assert (=> b!54005 m!84793))

(declare-fun m!84795 () Bool)

(assert (=> b!54009 m!84795))

(declare-fun m!84797 () Bool)

(assert (=> b!54009 m!84797))

(declare-fun m!84799 () Bool)

(assert (=> b!54009 m!84799))

(declare-fun m!84801 () Bool)

(assert (=> b!54008 m!84801))

(declare-fun m!84803 () Bool)

(assert (=> b!54006 m!84803))

(declare-fun m!84805 () Bool)

(assert (=> b!54006 m!84805))

(declare-fun m!84807 () Bool)

(assert (=> b!54006 m!84807))

(declare-fun m!84809 () Bool)

(assert (=> b!54006 m!84809))

(assert (=> b!54006 m!84805))

(declare-fun m!84811 () Bool)

(assert (=> b!54006 m!84811))

(declare-fun m!84813 () Bool)

(assert (=> start!10860 m!84813))

(declare-fun m!84815 () Bool)

(assert (=> start!10860 m!84815))

(declare-fun m!84817 () Bool)

(assert (=> b!54007 m!84817))

(declare-fun m!84819 () Bool)

(assert (=> b!54007 m!84819))

(declare-fun m!84821 () Bool)

(assert (=> b!54007 m!84821))

(declare-fun m!84823 () Bool)

(assert (=> b!54010 m!84823))

(assert (=> b!54010 m!84823))

(declare-fun m!84825 () Bool)

(assert (=> b!54010 m!84825))

(declare-fun m!84827 () Bool)

(assert (=> b!54010 m!84827))

(assert (=> b!54010 m!84827))

(declare-fun m!84829 () Bool)

(assert (=> b!54010 m!84829))

(push 1)

(assert (not b!54006))

(assert (not b!54005))

(assert (not b!54010))

(assert (not b!54008))

(assert (not start!10860))

(assert (not b!54009))

(assert (not b!54007))

(check-sat)

(pop 1)

(push 1)

(check-sat)

