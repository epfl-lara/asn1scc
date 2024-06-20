; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10872 () Bool)

(assert start!10872)

(declare-fun b!54113 () Bool)

(declare-fun res!45186 () Bool)

(declare-fun e!36110 () Bool)

(assert (=> b!54113 (=> (not res!45186) (not e!36110))))

(declare-datatypes ((array!2542 0))(
  ( (array!2543 (arr!1697 (Array (_ BitVec 32) (_ BitVec 8))) (size!1160 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2008 0))(
  ( (BitStream!2009 (buf!1514 array!2542) (currentByte!3087 (_ BitVec 32)) (currentBit!3082 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2008)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!54113 (= res!45186 (validate_offset_bits!1 ((_ sign_extend 32) (size!1160 (buf!1514 thiss!1379))) ((_ sign_extend 32) (currentByte!3087 thiss!1379)) ((_ sign_extend 32) (currentBit!3082 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun srcBuffer!2 () array!2542)

(declare-fun b!54114 () Bool)

(declare-datatypes ((Unit!3729 0))(
  ( (Unit!3730) )
))
(declare-datatypes ((tuple2!4926 0))(
  ( (tuple2!4927 (_1!2574 Unit!3729) (_2!2574 BitStream!2008)) )
))
(declare-fun lt!83716 () tuple2!4926)

(declare-fun e!36108 () Bool)

(declare-datatypes ((tuple2!4928 0))(
  ( (tuple2!4929 (_1!2575 BitStream!2008) (_2!2575 BitStream!2008)) )
))
(declare-fun lt!83713 () tuple2!4928)

(declare-datatypes ((List!579 0))(
  ( (Nil!576) (Cons!575 (h!694 Bool) (t!1329 List!579)) )
))
(declare-fun head!398 (List!579) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2008 array!2542 (_ BitVec 64) (_ BitVec 64)) List!579)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2008 BitStream!2008 (_ BitVec 64)) List!579)

(assert (=> b!54114 (= e!36108 (= (head!398 (byteArrayBitContentToList!0 (_2!2574 lt!83716) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!398 (bitStreamReadBitsIntoList!0 (_2!2574 lt!83716) (_1!2575 lt!83713) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!54115 () Bool)

(declare-fun e!36106 () Bool)

(declare-fun e!36109 () Bool)

(assert (=> b!54115 (= e!36106 e!36109)))

(declare-fun res!45184 () Bool)

(assert (=> b!54115 (=> res!45184 e!36109)))

(declare-fun isPrefixOf!0 (BitStream!2008 BitStream!2008) Bool)

(assert (=> b!54115 (= res!45184 (not (isPrefixOf!0 thiss!1379 (_2!2574 lt!83716))))))

(assert (=> b!54115 (validate_offset_bits!1 ((_ sign_extend 32) (size!1160 (buf!1514 (_2!2574 lt!83716)))) ((_ sign_extend 32) (currentByte!3087 (_2!2574 lt!83716))) ((_ sign_extend 32) (currentBit!3082 (_2!2574 lt!83716))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!83719 () Unit!3729)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2008 BitStream!2008 (_ BitVec 64) (_ BitVec 64)) Unit!3729)

(assert (=> b!54115 (= lt!83719 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2574 lt!83716) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2008 (_ BitVec 8) (_ BitVec 32)) tuple2!4926)

(assert (=> b!54115 (= lt!83716 (appendBitFromByte!0 thiss!1379 (select (arr!1697 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!54116 () Bool)

(assert (=> b!54116 (= e!36110 (not e!36106))))

(declare-fun res!45183 () Bool)

(assert (=> b!54116 (=> res!45183 e!36106)))

(assert (=> b!54116 (= res!45183 (bvsge i!635 to!314))))

(assert (=> b!54116 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!83717 () Unit!3729)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2008) Unit!3729)

(assert (=> b!54116 (= lt!83717 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!83715 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!54116 (= lt!83715 (bitIndex!0 (size!1160 (buf!1514 thiss!1379)) (currentByte!3087 thiss!1379) (currentBit!3082 thiss!1379)))))

(declare-fun b!54117 () Bool)

(assert (=> b!54117 (= e!36109 true)))

(declare-fun lt!83714 () tuple2!4926)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2008 array!2542 (_ BitVec 64) (_ BitVec 64)) tuple2!4926)

(assert (=> b!54117 (= lt!83714 (appendBitsMSBFirstLoop!0 (_2!2574 lt!83716) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!54117 e!36108))

(declare-fun res!45185 () Bool)

(assert (=> b!54117 (=> (not res!45185) (not e!36108))))

(assert (=> b!54117 (= res!45185 (validate_offset_bits!1 ((_ sign_extend 32) (size!1160 (buf!1514 (_2!2574 lt!83716)))) ((_ sign_extend 32) (currentByte!3087 thiss!1379)) ((_ sign_extend 32) (currentBit!3082 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!83718 () Unit!3729)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2008 array!2542 (_ BitVec 64)) Unit!3729)

(assert (=> b!54117 (= lt!83718 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1514 (_2!2574 lt!83716)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!2008 BitStream!2008) tuple2!4928)

(assert (=> b!54117 (= lt!83713 (reader!0 thiss!1379 (_2!2574 lt!83716)))))

(declare-fun b!54118 () Bool)

(declare-fun e!36104 () Bool)

(declare-fun array_inv!1063 (array!2542) Bool)

(assert (=> b!54118 (= e!36104 (array_inv!1063 (buf!1514 thiss!1379)))))

(declare-fun res!45182 () Bool)

(assert (=> start!10872 (=> (not res!45182) (not e!36110))))

(assert (=> start!10872 (= res!45182 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1160 srcBuffer!2))))))))

(assert (=> start!10872 e!36110))

(assert (=> start!10872 true))

(assert (=> start!10872 (array_inv!1063 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2008) Bool)

(assert (=> start!10872 (and (inv!12 thiss!1379) e!36104)))

(assert (= (and start!10872 res!45182) b!54113))

(assert (= (and b!54113 res!45186) b!54116))

(assert (= (and b!54116 (not res!45183)) b!54115))

(assert (= (and b!54115 (not res!45184)) b!54117))

(assert (= (and b!54117 res!45185) b!54114))

(assert (= start!10872 b!54118))

(declare-fun m!85021 () Bool)

(assert (=> b!54117 m!85021))

(declare-fun m!85023 () Bool)

(assert (=> b!54117 m!85023))

(declare-fun m!85025 () Bool)

(assert (=> b!54117 m!85025))

(declare-fun m!85027 () Bool)

(assert (=> b!54117 m!85027))

(declare-fun m!85029 () Bool)

(assert (=> b!54114 m!85029))

(assert (=> b!54114 m!85029))

(declare-fun m!85031 () Bool)

(assert (=> b!54114 m!85031))

(declare-fun m!85033 () Bool)

(assert (=> b!54114 m!85033))

(assert (=> b!54114 m!85033))

(declare-fun m!85035 () Bool)

(assert (=> b!54114 m!85035))

(declare-fun m!85037 () Bool)

(assert (=> b!54118 m!85037))

(declare-fun m!85039 () Bool)

(assert (=> b!54115 m!85039))

(declare-fun m!85041 () Bool)

(assert (=> b!54115 m!85041))

(declare-fun m!85043 () Bool)

(assert (=> b!54115 m!85043))

(assert (=> b!54115 m!85039))

(declare-fun m!85045 () Bool)

(assert (=> b!54115 m!85045))

(declare-fun m!85047 () Bool)

(assert (=> b!54115 m!85047))

(declare-fun m!85049 () Bool)

(assert (=> b!54113 m!85049))

(declare-fun m!85051 () Bool)

(assert (=> b!54116 m!85051))

(declare-fun m!85053 () Bool)

(assert (=> b!54116 m!85053))

(declare-fun m!85055 () Bool)

(assert (=> b!54116 m!85055))

(declare-fun m!85057 () Bool)

(assert (=> start!10872 m!85057))

(declare-fun m!85059 () Bool)

(assert (=> start!10872 m!85059))

(push 1)

(assert (not b!54117))

(assert (not b!54113))

(assert (not b!54114))

(assert (not b!54115))

(assert (not b!54116))

(assert (not b!54118))

(assert (not start!10872))

(check-sat)

(pop 1)

