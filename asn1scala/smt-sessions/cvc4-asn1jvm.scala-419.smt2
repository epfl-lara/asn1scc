; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10870 () Bool)

(assert start!10870)

(declare-datatypes ((array!2540 0))(
  ( (array!2541 (arr!1696 (Array (_ BitVec 32) (_ BitVec 8))) (size!1159 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2540)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun e!36088 () Bool)

(declare-datatypes ((BitStream!2006 0))(
  ( (BitStream!2007 (buf!1513 array!2540) (currentByte!3086 (_ BitVec 32)) (currentBit!3081 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!4922 0))(
  ( (tuple2!4923 (_1!2572 BitStream!2006) (_2!2572 BitStream!2006)) )
))
(declare-fun lt!83696 () tuple2!4922)

(declare-datatypes ((Unit!3727 0))(
  ( (Unit!3728) )
))
(declare-datatypes ((tuple2!4924 0))(
  ( (tuple2!4925 (_1!2573 Unit!3727) (_2!2573 BitStream!2006)) )
))
(declare-fun lt!83694 () tuple2!4924)

(declare-fun b!54095 () Bool)

(declare-datatypes ((List!578 0))(
  ( (Nil!575) (Cons!574 (h!693 Bool) (t!1328 List!578)) )
))
(declare-fun head!397 (List!578) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2006 array!2540 (_ BitVec 64) (_ BitVec 64)) List!578)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2006 BitStream!2006 (_ BitVec 64)) List!578)

(assert (=> b!54095 (= e!36088 (= (head!397 (byteArrayBitContentToList!0 (_2!2573 lt!83694) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!397 (bitStreamReadBitsIntoList!0 (_2!2573 lt!83694) (_1!2572 lt!83696) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!54096 () Bool)

(declare-fun e!36089 () Bool)

(declare-fun e!36085 () Bool)

(assert (=> b!54096 (= e!36089 (not e!36085))))

(declare-fun res!45170 () Bool)

(assert (=> b!54096 (=> res!45170 e!36085)))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!54096 (= res!45170 (bvsge i!635 to!314))))

(declare-fun thiss!1379 () BitStream!2006)

(declare-fun isPrefixOf!0 (BitStream!2006 BitStream!2006) Bool)

(assert (=> b!54096 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!83693 () Unit!3727)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2006) Unit!3727)

(assert (=> b!54096 (= lt!83693 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!83695 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!54096 (= lt!83695 (bitIndex!0 (size!1159 (buf!1513 thiss!1379)) (currentByte!3086 thiss!1379) (currentBit!3081 thiss!1379)))))

(declare-fun b!54097 () Bool)

(declare-fun e!36087 () Bool)

(assert (=> b!54097 (= e!36085 e!36087)))

(declare-fun res!45169 () Bool)

(assert (=> b!54097 (=> res!45169 e!36087)))

(assert (=> b!54097 (= res!45169 (not (isPrefixOf!0 thiss!1379 (_2!2573 lt!83694))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!54097 (validate_offset_bits!1 ((_ sign_extend 32) (size!1159 (buf!1513 (_2!2573 lt!83694)))) ((_ sign_extend 32) (currentByte!3086 (_2!2573 lt!83694))) ((_ sign_extend 32) (currentBit!3081 (_2!2573 lt!83694))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!83698 () Unit!3727)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2006 BitStream!2006 (_ BitVec 64) (_ BitVec 64)) Unit!3727)

(assert (=> b!54097 (= lt!83698 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2573 lt!83694) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2006 (_ BitVec 8) (_ BitVec 32)) tuple2!4924)

(assert (=> b!54097 (= lt!83694 (appendBitFromByte!0 thiss!1379 (select (arr!1696 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!54098 () Bool)

(declare-fun res!45167 () Bool)

(assert (=> b!54098 (=> (not res!45167) (not e!36089))))

(assert (=> b!54098 (= res!45167 (validate_offset_bits!1 ((_ sign_extend 32) (size!1159 (buf!1513 thiss!1379))) ((_ sign_extend 32) (currentByte!3086 thiss!1379)) ((_ sign_extend 32) (currentBit!3081 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!54099 () Bool)

(declare-fun e!36084 () Bool)

(declare-fun array_inv!1062 (array!2540) Bool)

(assert (=> b!54099 (= e!36084 (array_inv!1062 (buf!1513 thiss!1379)))))

(declare-fun b!54100 () Bool)

(assert (=> b!54100 (= e!36087 (bvslt (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) (bvsub to!314 i!635)))))

(assert (=> b!54100 e!36088))

(declare-fun res!45168 () Bool)

(assert (=> b!54100 (=> (not res!45168) (not e!36088))))

(assert (=> b!54100 (= res!45168 (validate_offset_bits!1 ((_ sign_extend 32) (size!1159 (buf!1513 (_2!2573 lt!83694)))) ((_ sign_extend 32) (currentByte!3086 thiss!1379)) ((_ sign_extend 32) (currentBit!3081 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!83697 () Unit!3727)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2006 array!2540 (_ BitVec 64)) Unit!3727)

(assert (=> b!54100 (= lt!83697 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1513 (_2!2573 lt!83694)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!2006 BitStream!2006) tuple2!4922)

(assert (=> b!54100 (= lt!83696 (reader!0 thiss!1379 (_2!2573 lt!83694)))))

(declare-fun res!45171 () Bool)

(assert (=> start!10870 (=> (not res!45171) (not e!36089))))

(assert (=> start!10870 (= res!45171 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1159 srcBuffer!2))))))))

(assert (=> start!10870 e!36089))

(assert (=> start!10870 true))

(assert (=> start!10870 (array_inv!1062 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2006) Bool)

(assert (=> start!10870 (and (inv!12 thiss!1379) e!36084)))

(assert (= (and start!10870 res!45171) b!54098))

(assert (= (and b!54098 res!45167) b!54096))

(assert (= (and b!54096 (not res!45170)) b!54097))

(assert (= (and b!54097 (not res!45169)) b!54100))

(assert (= (and b!54100 res!45168) b!54095))

(assert (= start!10870 b!54099))

(declare-fun m!84983 () Bool)

(assert (=> b!54098 m!84983))

(declare-fun m!84985 () Bool)

(assert (=> b!54100 m!84985))

(declare-fun m!84987 () Bool)

(assert (=> b!54100 m!84987))

(declare-fun m!84989 () Bool)

(assert (=> b!54100 m!84989))

(declare-fun m!84991 () Bool)

(assert (=> b!54099 m!84991))

(declare-fun m!84993 () Bool)

(assert (=> b!54095 m!84993))

(assert (=> b!54095 m!84993))

(declare-fun m!84995 () Bool)

(assert (=> b!54095 m!84995))

(declare-fun m!84997 () Bool)

(assert (=> b!54095 m!84997))

(assert (=> b!54095 m!84997))

(declare-fun m!84999 () Bool)

(assert (=> b!54095 m!84999))

(declare-fun m!85001 () Bool)

(assert (=> b!54097 m!85001))

(declare-fun m!85003 () Bool)

(assert (=> b!54097 m!85003))

(declare-fun m!85005 () Bool)

(assert (=> b!54097 m!85005))

(declare-fun m!85007 () Bool)

(assert (=> b!54097 m!85007))

(assert (=> b!54097 m!85001))

(declare-fun m!85009 () Bool)

(assert (=> b!54097 m!85009))

(declare-fun m!85011 () Bool)

(assert (=> b!54096 m!85011))

(declare-fun m!85013 () Bool)

(assert (=> b!54096 m!85013))

(declare-fun m!85015 () Bool)

(assert (=> b!54096 m!85015))

(declare-fun m!85017 () Bool)

(assert (=> start!10870 m!85017))

(declare-fun m!85019 () Bool)

(assert (=> start!10870 m!85019))

(push 1)

(assert (not b!54099))

(assert (not start!10870))

(assert (not b!54095))

(assert (not b!54098))

(assert (not b!54097))

(assert (not b!54096))

(assert (not b!54100))

(check-sat)

(pop 1)

(push 1)

(check-sat)

