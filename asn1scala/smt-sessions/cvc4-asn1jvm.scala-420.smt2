; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10876 () Bool)

(assert start!10876)

(declare-fun b!54149 () Bool)

(declare-fun res!45215 () Bool)

(declare-fun e!36147 () Bool)

(assert (=> b!54149 (=> (not res!45215) (not e!36147))))

(declare-datatypes ((array!2546 0))(
  ( (array!2547 (arr!1699 (Array (_ BitVec 32) (_ BitVec 8))) (size!1162 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2012 0))(
  ( (BitStream!2013 (buf!1516 array!2546) (currentByte!3089 (_ BitVec 32)) (currentBit!3084 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2012)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!54149 (= res!45215 (validate_offset_bits!1 ((_ sign_extend 32) (size!1162 (buf!1516 thiss!1379))) ((_ sign_extend 32) (currentByte!3089 thiss!1379)) ((_ sign_extend 32) (currentBit!3084 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun srcBuffer!2 () array!2546)

(declare-fun e!36151 () Bool)

(declare-datatypes ((tuple2!4934 0))(
  ( (tuple2!4935 (_1!2578 BitStream!2012) (_2!2578 BitStream!2012)) )
))
(declare-fun lt!83761 () tuple2!4934)

(declare-fun b!54150 () Bool)

(declare-datatypes ((Unit!3733 0))(
  ( (Unit!3734) )
))
(declare-datatypes ((tuple2!4936 0))(
  ( (tuple2!4937 (_1!2579 Unit!3733) (_2!2579 BitStream!2012)) )
))
(declare-fun lt!83759 () tuple2!4936)

(declare-datatypes ((List!581 0))(
  ( (Nil!578) (Cons!577 (h!696 Bool) (t!1331 List!581)) )
))
(declare-fun head!400 (List!581) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2012 array!2546 (_ BitVec 64) (_ BitVec 64)) List!581)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2012 BitStream!2012 (_ BitVec 64)) List!581)

(assert (=> b!54150 (= e!36151 (= (head!400 (byteArrayBitContentToList!0 (_2!2579 lt!83759) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!400 (bitStreamReadBitsIntoList!0 (_2!2579 lt!83759) (_1!2578 lt!83761) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!54151 () Bool)

(declare-fun e!36152 () Bool)

(assert (=> b!54151 (= e!36152 true)))

(declare-fun lt!83758 () tuple2!4936)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2012 array!2546 (_ BitVec 64) (_ BitVec 64)) tuple2!4936)

(assert (=> b!54151 (= lt!83758 (appendBitsMSBFirstLoop!0 (_2!2579 lt!83759) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!54151 e!36151))

(declare-fun res!45212 () Bool)

(assert (=> b!54151 (=> (not res!45212) (not e!36151))))

(assert (=> b!54151 (= res!45212 (validate_offset_bits!1 ((_ sign_extend 32) (size!1162 (buf!1516 (_2!2579 lt!83759)))) ((_ sign_extend 32) (currentByte!3089 thiss!1379)) ((_ sign_extend 32) (currentBit!3084 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!83757 () Unit!3733)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2012 array!2546 (_ BitVec 64)) Unit!3733)

(assert (=> b!54151 (= lt!83757 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1516 (_2!2579 lt!83759)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!2012 BitStream!2012) tuple2!4934)

(assert (=> b!54151 (= lt!83761 (reader!0 thiss!1379 (_2!2579 lt!83759)))))

(declare-fun b!54152 () Bool)

(declare-fun e!36149 () Bool)

(assert (=> b!54152 (= e!36149 e!36152)))

(declare-fun res!45214 () Bool)

(assert (=> b!54152 (=> res!45214 e!36152)))

(declare-fun isPrefixOf!0 (BitStream!2012 BitStream!2012) Bool)

(assert (=> b!54152 (= res!45214 (not (isPrefixOf!0 thiss!1379 (_2!2579 lt!83759))))))

(assert (=> b!54152 (validate_offset_bits!1 ((_ sign_extend 32) (size!1162 (buf!1516 (_2!2579 lt!83759)))) ((_ sign_extend 32) (currentByte!3089 (_2!2579 lt!83759))) ((_ sign_extend 32) (currentBit!3084 (_2!2579 lt!83759))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!83760 () Unit!3733)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2012 BitStream!2012 (_ BitVec 64) (_ BitVec 64)) Unit!3733)

(assert (=> b!54152 (= lt!83760 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2579 lt!83759) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2012 (_ BitVec 8) (_ BitVec 32)) tuple2!4936)

(assert (=> b!54152 (= lt!83759 (appendBitFromByte!0 thiss!1379 (select (arr!1699 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!45216 () Bool)

(assert (=> start!10876 (=> (not res!45216) (not e!36147))))

(assert (=> start!10876 (= res!45216 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1162 srcBuffer!2))))))))

(assert (=> start!10876 e!36147))

(assert (=> start!10876 true))

(declare-fun array_inv!1065 (array!2546) Bool)

(assert (=> start!10876 (array_inv!1065 srcBuffer!2)))

(declare-fun e!36150 () Bool)

(declare-fun inv!12 (BitStream!2012) Bool)

(assert (=> start!10876 (and (inv!12 thiss!1379) e!36150)))

(declare-fun b!54153 () Bool)

(assert (=> b!54153 (= e!36150 (array_inv!1065 (buf!1516 thiss!1379)))))

(declare-fun b!54154 () Bool)

(assert (=> b!54154 (= e!36147 (not e!36149))))

(declare-fun res!45213 () Bool)

(assert (=> b!54154 (=> res!45213 e!36149)))

(assert (=> b!54154 (= res!45213 (bvsge i!635 to!314))))

(assert (=> b!54154 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!83755 () Unit!3733)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2012) Unit!3733)

(assert (=> b!54154 (= lt!83755 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!83756 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!54154 (= lt!83756 (bitIndex!0 (size!1162 (buf!1516 thiss!1379)) (currentByte!3089 thiss!1379) (currentBit!3084 thiss!1379)))))

(assert (= (and start!10876 res!45216) b!54149))

(assert (= (and b!54149 res!45215) b!54154))

(assert (= (and b!54154 (not res!45213)) b!54152))

(assert (= (and b!54152 (not res!45214)) b!54151))

(assert (= (and b!54151 res!45212) b!54150))

(assert (= start!10876 b!54153))

(declare-fun m!85101 () Bool)

(assert (=> b!54153 m!85101))

(declare-fun m!85103 () Bool)

(assert (=> b!54150 m!85103))

(assert (=> b!54150 m!85103))

(declare-fun m!85105 () Bool)

(assert (=> b!54150 m!85105))

(declare-fun m!85107 () Bool)

(assert (=> b!54150 m!85107))

(assert (=> b!54150 m!85107))

(declare-fun m!85109 () Bool)

(assert (=> b!54150 m!85109))

(declare-fun m!85111 () Bool)

(assert (=> b!54151 m!85111))

(declare-fun m!85113 () Bool)

(assert (=> b!54151 m!85113))

(declare-fun m!85115 () Bool)

(assert (=> b!54151 m!85115))

(declare-fun m!85117 () Bool)

(assert (=> b!54151 m!85117))

(declare-fun m!85119 () Bool)

(assert (=> b!54154 m!85119))

(declare-fun m!85121 () Bool)

(assert (=> b!54154 m!85121))

(declare-fun m!85123 () Bool)

(assert (=> b!54154 m!85123))

(declare-fun m!85125 () Bool)

(assert (=> b!54149 m!85125))

(declare-fun m!85127 () Bool)

(assert (=> b!54152 m!85127))

(declare-fun m!85129 () Bool)

(assert (=> b!54152 m!85129))

(assert (=> b!54152 m!85127))

(declare-fun m!85131 () Bool)

(assert (=> b!54152 m!85131))

(declare-fun m!85133 () Bool)

(assert (=> b!54152 m!85133))

(declare-fun m!85135 () Bool)

(assert (=> b!54152 m!85135))

(declare-fun m!85137 () Bool)

(assert (=> start!10876 m!85137))

(declare-fun m!85139 () Bool)

(assert (=> start!10876 m!85139))

(push 1)

(assert (not b!54149))

(assert (not b!54151))

(assert (not start!10876))

(assert (not b!54152))

(assert (not b!54150))

(assert (not b!54154))

(assert (not b!54153))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

