; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10868 () Bool)

(assert start!10868)

(declare-fun b!54077 () Bool)

(declare-fun e!36063 () Bool)

(declare-fun e!36066 () Bool)

(assert (=> b!54077 (= e!36063 (not e!36066))))

(declare-fun res!45153 () Bool)

(assert (=> b!54077 (=> res!45153 e!36066)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!54077 (= res!45153 (bvsge i!635 to!314))))

(declare-datatypes ((array!2538 0))(
  ( (array!2539 (arr!1695 (Array (_ BitVec 32) (_ BitVec 8))) (size!1158 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2004 0))(
  ( (BitStream!2005 (buf!1512 array!2538) (currentByte!3085 (_ BitVec 32)) (currentBit!3080 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2004)

(declare-fun isPrefixOf!0 (BitStream!2004 BitStream!2004) Bool)

(assert (=> b!54077 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3725 0))(
  ( (Unit!3726) )
))
(declare-fun lt!83676 () Unit!3725)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2004) Unit!3725)

(assert (=> b!54077 (= lt!83676 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!83680 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!54077 (= lt!83680 (bitIndex!0 (size!1158 (buf!1512 thiss!1379)) (currentByte!3085 thiss!1379) (currentBit!3080 thiss!1379)))))

(declare-fun srcBuffer!2 () array!2538)

(declare-fun b!54078 () Bool)

(declare-fun e!36067 () Bool)

(declare-datatypes ((tuple2!4918 0))(
  ( (tuple2!4919 (_1!2570 Unit!3725) (_2!2570 BitStream!2004)) )
))
(declare-fun lt!83678 () tuple2!4918)

(declare-datatypes ((tuple2!4920 0))(
  ( (tuple2!4921 (_1!2571 BitStream!2004) (_2!2571 BitStream!2004)) )
))
(declare-fun lt!83675 () tuple2!4920)

(declare-datatypes ((List!577 0))(
  ( (Nil!574) (Cons!573 (h!692 Bool) (t!1327 List!577)) )
))
(declare-fun head!396 (List!577) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2004 array!2538 (_ BitVec 64) (_ BitVec 64)) List!577)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2004 BitStream!2004 (_ BitVec 64)) List!577)

(assert (=> b!54078 (= e!36067 (= (head!396 (byteArrayBitContentToList!0 (_2!2570 lt!83678) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!396 (bitStreamReadBitsIntoList!0 (_2!2570 lt!83678) (_1!2571 lt!83675) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!54079 () Bool)

(declare-fun res!45152 () Bool)

(assert (=> b!54079 (=> (not res!45152) (not e!36063))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!54079 (= res!45152 (validate_offset_bits!1 ((_ sign_extend 32) (size!1158 (buf!1512 thiss!1379))) ((_ sign_extend 32) (currentByte!3085 thiss!1379)) ((_ sign_extend 32) (currentBit!3080 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!45156 () Bool)

(assert (=> start!10868 (=> (not res!45156) (not e!36063))))

(assert (=> start!10868 (= res!45156 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1158 srcBuffer!2))))))))

(assert (=> start!10868 e!36063))

(assert (=> start!10868 true))

(declare-fun array_inv!1061 (array!2538) Bool)

(assert (=> start!10868 (array_inv!1061 srcBuffer!2)))

(declare-fun e!36068 () Bool)

(declare-fun inv!12 (BitStream!2004) Bool)

(assert (=> start!10868 (and (inv!12 thiss!1379) e!36068)))

(declare-fun b!54080 () Bool)

(declare-fun e!36064 () Bool)

(assert (=> b!54080 (= e!36064 (bvslt (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) (bvsub to!314 i!635)))))

(assert (=> b!54080 e!36067))

(declare-fun res!45155 () Bool)

(assert (=> b!54080 (=> (not res!45155) (not e!36067))))

(assert (=> b!54080 (= res!45155 (validate_offset_bits!1 ((_ sign_extend 32) (size!1158 (buf!1512 (_2!2570 lt!83678)))) ((_ sign_extend 32) (currentByte!3085 thiss!1379)) ((_ sign_extend 32) (currentBit!3080 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!83679 () Unit!3725)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2004 array!2538 (_ BitVec 64)) Unit!3725)

(assert (=> b!54080 (= lt!83679 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1512 (_2!2570 lt!83678)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!2004 BitStream!2004) tuple2!4920)

(assert (=> b!54080 (= lt!83675 (reader!0 thiss!1379 (_2!2570 lt!83678)))))

(declare-fun b!54081 () Bool)

(assert (=> b!54081 (= e!36068 (array_inv!1061 (buf!1512 thiss!1379)))))

(declare-fun b!54082 () Bool)

(assert (=> b!54082 (= e!36066 e!36064)))

(declare-fun res!45154 () Bool)

(assert (=> b!54082 (=> res!45154 e!36064)))

(assert (=> b!54082 (= res!45154 (not (isPrefixOf!0 thiss!1379 (_2!2570 lt!83678))))))

(assert (=> b!54082 (validate_offset_bits!1 ((_ sign_extend 32) (size!1158 (buf!1512 (_2!2570 lt!83678)))) ((_ sign_extend 32) (currentByte!3085 (_2!2570 lt!83678))) ((_ sign_extend 32) (currentBit!3080 (_2!2570 lt!83678))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!83677 () Unit!3725)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2004 BitStream!2004 (_ BitVec 64) (_ BitVec 64)) Unit!3725)

(assert (=> b!54082 (= lt!83677 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2570 lt!83678) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2004 (_ BitVec 8) (_ BitVec 32)) tuple2!4918)

(assert (=> b!54082 (= lt!83678 (appendBitFromByte!0 thiss!1379 (select (arr!1695 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!10868 res!45156) b!54079))

(assert (= (and b!54079 res!45152) b!54077))

(assert (= (and b!54077 (not res!45153)) b!54082))

(assert (= (and b!54082 (not res!45154)) b!54080))

(assert (= (and b!54080 res!45155) b!54078))

(assert (= start!10868 b!54081))

(declare-fun m!84945 () Bool)

(assert (=> b!54080 m!84945))

(declare-fun m!84947 () Bool)

(assert (=> b!54080 m!84947))

(declare-fun m!84949 () Bool)

(assert (=> b!54080 m!84949))

(declare-fun m!84951 () Bool)

(assert (=> b!54078 m!84951))

(assert (=> b!54078 m!84951))

(declare-fun m!84953 () Bool)

(assert (=> b!54078 m!84953))

(declare-fun m!84955 () Bool)

(assert (=> b!54078 m!84955))

(assert (=> b!54078 m!84955))

(declare-fun m!84957 () Bool)

(assert (=> b!54078 m!84957))

(declare-fun m!84959 () Bool)

(assert (=> b!54082 m!84959))

(declare-fun m!84961 () Bool)

(assert (=> b!54082 m!84961))

(declare-fun m!84963 () Bool)

(assert (=> b!54082 m!84963))

(declare-fun m!84965 () Bool)

(assert (=> b!54082 m!84965))

(declare-fun m!84967 () Bool)

(assert (=> b!54082 m!84967))

(assert (=> b!54082 m!84961))

(declare-fun m!84969 () Bool)

(assert (=> b!54079 m!84969))

(declare-fun m!84971 () Bool)

(assert (=> b!54077 m!84971))

(declare-fun m!84973 () Bool)

(assert (=> b!54077 m!84973))

(declare-fun m!84975 () Bool)

(assert (=> b!54077 m!84975))

(declare-fun m!84977 () Bool)

(assert (=> start!10868 m!84977))

(declare-fun m!84979 () Bool)

(assert (=> start!10868 m!84979))

(declare-fun m!84981 () Bool)

(assert (=> b!54081 m!84981))

(check-sat (not b!54078) (not b!54081) (not b!54080) (not b!54077) (not b!54079) (not b!54082) (not start!10868))
(check-sat)
