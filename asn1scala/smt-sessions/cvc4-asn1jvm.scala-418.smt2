; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10864 () Bool)

(assert start!10864)

(declare-fun b!54041 () Bool)

(declare-fun e!36025 () Bool)

(declare-fun e!36024 () Bool)

(assert (=> b!54041 (= e!36025 e!36024)))

(declare-fun res!45122 () Bool)

(assert (=> b!54041 (=> res!45122 e!36024)))

(declare-datatypes ((array!2534 0))(
  ( (array!2535 (arr!1693 (Array (_ BitVec 32) (_ BitVec 8))) (size!1156 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2000 0))(
  ( (BitStream!2001 (buf!1510 array!2534) (currentByte!3083 (_ BitVec 32)) (currentBit!3078 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2000)

(declare-datatypes ((Unit!3721 0))(
  ( (Unit!3722) )
))
(declare-datatypes ((tuple2!4910 0))(
  ( (tuple2!4911 (_1!2566 Unit!3721) (_2!2566 BitStream!2000)) )
))
(declare-fun lt!83641 () tuple2!4910)

(declare-fun isPrefixOf!0 (BitStream!2000 BitStream!2000) Bool)

(assert (=> b!54041 (= res!45122 (not (isPrefixOf!0 thiss!1379 (_2!2566 lt!83641))))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!54041 (validate_offset_bits!1 ((_ sign_extend 32) (size!1156 (buf!1510 (_2!2566 lt!83641)))) ((_ sign_extend 32) (currentByte!3083 (_2!2566 lt!83641))) ((_ sign_extend 32) (currentBit!3078 (_2!2566 lt!83641))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!83642 () Unit!3721)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2000 BitStream!2000 (_ BitVec 64) (_ BitVec 64)) Unit!3721)

(assert (=> b!54041 (= lt!83642 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2566 lt!83641) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2534)

(declare-fun appendBitFromByte!0 (BitStream!2000 (_ BitVec 8) (_ BitVec 32)) tuple2!4910)

(assert (=> b!54041 (= lt!83641 (appendBitFromByte!0 thiss!1379 (select (arr!1693 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!54042 () Bool)

(assert (=> b!54042 (= e!36024 (or (not (= (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!36026 () Bool)

(assert (=> b!54042 e!36026))

(declare-fun res!45123 () Bool)

(assert (=> b!54042 (=> (not res!45123) (not e!36026))))

(assert (=> b!54042 (= res!45123 (validate_offset_bits!1 ((_ sign_extend 32) (size!1156 (buf!1510 (_2!2566 lt!83641)))) ((_ sign_extend 32) (currentByte!3083 thiss!1379)) ((_ sign_extend 32) (currentBit!3078 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!83643 () Unit!3721)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2000 array!2534 (_ BitVec 64)) Unit!3721)

(assert (=> b!54042 (= lt!83643 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1510 (_2!2566 lt!83641)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!4912 0))(
  ( (tuple2!4913 (_1!2567 BitStream!2000) (_2!2567 BitStream!2000)) )
))
(declare-fun lt!83644 () tuple2!4912)

(declare-fun reader!0 (BitStream!2000 BitStream!2000) tuple2!4912)

(assert (=> b!54042 (= lt!83644 (reader!0 thiss!1379 (_2!2566 lt!83641)))))

(declare-fun b!54043 () Bool)

(declare-fun res!45126 () Bool)

(declare-fun e!36023 () Bool)

(assert (=> b!54043 (=> (not res!45126) (not e!36023))))

(assert (=> b!54043 (= res!45126 (validate_offset_bits!1 ((_ sign_extend 32) (size!1156 (buf!1510 thiss!1379))) ((_ sign_extend 32) (currentByte!3083 thiss!1379)) ((_ sign_extend 32) (currentBit!3078 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!45124 () Bool)

(assert (=> start!10864 (=> (not res!45124) (not e!36023))))

(assert (=> start!10864 (= res!45124 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1156 srcBuffer!2))))))))

(assert (=> start!10864 e!36023))

(assert (=> start!10864 true))

(declare-fun array_inv!1059 (array!2534) Bool)

(assert (=> start!10864 (array_inv!1059 srcBuffer!2)))

(declare-fun e!36021 () Bool)

(declare-fun inv!12 (BitStream!2000) Bool)

(assert (=> start!10864 (and (inv!12 thiss!1379) e!36021)))

(declare-fun b!54044 () Bool)

(declare-datatypes ((List!575 0))(
  ( (Nil!572) (Cons!571 (h!690 Bool) (t!1325 List!575)) )
))
(declare-fun head!394 (List!575) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2000 array!2534 (_ BitVec 64) (_ BitVec 64)) List!575)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2000 BitStream!2000 (_ BitVec 64)) List!575)

(assert (=> b!54044 (= e!36026 (= (head!394 (byteArrayBitContentToList!0 (_2!2566 lt!83641) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!394 (bitStreamReadBitsIntoList!0 (_2!2566 lt!83641) (_1!2567 lt!83644) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!54045 () Bool)

(assert (=> b!54045 (= e!36023 (not e!36025))))

(declare-fun res!45125 () Bool)

(assert (=> b!54045 (=> res!45125 e!36025)))

(assert (=> b!54045 (= res!45125 (bvsge i!635 to!314))))

(assert (=> b!54045 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!83639 () Unit!3721)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2000) Unit!3721)

(assert (=> b!54045 (= lt!83639 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!83640 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!54045 (= lt!83640 (bitIndex!0 (size!1156 (buf!1510 thiss!1379)) (currentByte!3083 thiss!1379) (currentBit!3078 thiss!1379)))))

(declare-fun b!54046 () Bool)

(assert (=> b!54046 (= e!36021 (array_inv!1059 (buf!1510 thiss!1379)))))

(assert (= (and start!10864 res!45124) b!54043))

(assert (= (and b!54043 res!45126) b!54045))

(assert (= (and b!54045 (not res!45125)) b!54041))

(assert (= (and b!54041 (not res!45122)) b!54042))

(assert (= (and b!54042 res!45123) b!54044))

(assert (= start!10864 b!54046))

(declare-fun m!84869 () Bool)

(assert (=> b!54041 m!84869))

(declare-fun m!84871 () Bool)

(assert (=> b!54041 m!84871))

(declare-fun m!84873 () Bool)

(assert (=> b!54041 m!84873))

(declare-fun m!84875 () Bool)

(assert (=> b!54041 m!84875))

(assert (=> b!54041 m!84871))

(declare-fun m!84877 () Bool)

(assert (=> b!54041 m!84877))

(declare-fun m!84879 () Bool)

(assert (=> b!54044 m!84879))

(assert (=> b!54044 m!84879))

(declare-fun m!84881 () Bool)

(assert (=> b!54044 m!84881))

(declare-fun m!84883 () Bool)

(assert (=> b!54044 m!84883))

(assert (=> b!54044 m!84883))

(declare-fun m!84885 () Bool)

(assert (=> b!54044 m!84885))

(declare-fun m!84887 () Bool)

(assert (=> b!54046 m!84887))

(declare-fun m!84889 () Bool)

(assert (=> start!10864 m!84889))

(declare-fun m!84891 () Bool)

(assert (=> start!10864 m!84891))

(declare-fun m!84893 () Bool)

(assert (=> b!54043 m!84893))

(declare-fun m!84895 () Bool)

(assert (=> b!54045 m!84895))

(declare-fun m!84897 () Bool)

(assert (=> b!54045 m!84897))

(declare-fun m!84899 () Bool)

(assert (=> b!54045 m!84899))

(declare-fun m!84901 () Bool)

(assert (=> b!54042 m!84901))

(declare-fun m!84903 () Bool)

(assert (=> b!54042 m!84903))

(declare-fun m!84905 () Bool)

(assert (=> b!54042 m!84905))

(push 1)

(assert (not start!10864))

(assert (not b!54043))

(assert (not b!54042))

(assert (not b!54044))

(assert (not b!54046))

(assert (not b!54041))

(assert (not b!54045))

(check-sat)

(pop 1)

(push 1)

(check-sat)

