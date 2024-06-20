; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10874 () Bool)

(assert start!10874)

(declare-fun b!54131 () Bool)

(declare-fun e!36131 () Bool)

(declare-datatypes ((array!2544 0))(
  ( (array!2545 (arr!1698 (Array (_ BitVec 32) (_ BitVec 8))) (size!1161 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2010 0))(
  ( (BitStream!2011 (buf!1515 array!2544) (currentByte!3088 (_ BitVec 32)) (currentBit!3083 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2010)

(declare-fun array_inv!1064 (array!2544) Bool)

(assert (=> b!54131 (= e!36131 (array_inv!1064 (buf!1515 thiss!1379)))))

(declare-fun b!54132 () Bool)

(declare-fun e!36126 () Bool)

(declare-fun e!36127 () Bool)

(assert (=> b!54132 (= e!36126 (not e!36127))))

(declare-fun res!45201 () Bool)

(assert (=> b!54132 (=> res!45201 e!36127)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!54132 (= res!45201 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2010 BitStream!2010) Bool)

(assert (=> b!54132 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3731 0))(
  ( (Unit!3732) )
))
(declare-fun lt!83735 () Unit!3731)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2010) Unit!3731)

(assert (=> b!54132 (= lt!83735 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!83738 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!54132 (= lt!83738 (bitIndex!0 (size!1161 (buf!1515 thiss!1379)) (currentByte!3088 thiss!1379) (currentBit!3083 thiss!1379)))))

(declare-fun b!54133 () Bool)

(declare-fun e!36129 () Bool)

(assert (=> b!54133 (= e!36127 e!36129)))

(declare-fun res!45199 () Bool)

(assert (=> b!54133 (=> res!45199 e!36129)))

(declare-datatypes ((tuple2!4930 0))(
  ( (tuple2!4931 (_1!2576 Unit!3731) (_2!2576 BitStream!2010)) )
))
(declare-fun lt!83740 () tuple2!4930)

(assert (=> b!54133 (= res!45199 (not (isPrefixOf!0 thiss!1379 (_2!2576 lt!83740))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!54133 (validate_offset_bits!1 ((_ sign_extend 32) (size!1161 (buf!1515 (_2!2576 lt!83740)))) ((_ sign_extend 32) (currentByte!3088 (_2!2576 lt!83740))) ((_ sign_extend 32) (currentBit!3083 (_2!2576 lt!83740))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!83734 () Unit!3731)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2010 BitStream!2010 (_ BitVec 64) (_ BitVec 64)) Unit!3731)

(assert (=> b!54133 (= lt!83734 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2576 lt!83740) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2544)

(declare-fun appendBitFromByte!0 (BitStream!2010 (_ BitVec 8) (_ BitVec 32)) tuple2!4930)

(assert (=> b!54133 (= lt!83740 (appendBitFromByte!0 thiss!1379 (select (arr!1698 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!54134 () Bool)

(assert (=> b!54134 (= e!36129 true)))

(declare-fun lt!83736 () tuple2!4930)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2010 array!2544 (_ BitVec 64) (_ BitVec 64)) tuple2!4930)

(assert (=> b!54134 (= lt!83736 (appendBitsMSBFirstLoop!0 (_2!2576 lt!83740) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!36130 () Bool)

(assert (=> b!54134 e!36130))

(declare-fun res!45198 () Bool)

(assert (=> b!54134 (=> (not res!45198) (not e!36130))))

(assert (=> b!54134 (= res!45198 (validate_offset_bits!1 ((_ sign_extend 32) (size!1161 (buf!1515 (_2!2576 lt!83740)))) ((_ sign_extend 32) (currentByte!3088 thiss!1379)) ((_ sign_extend 32) (currentBit!3083 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!83739 () Unit!3731)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2010 array!2544 (_ BitVec 64)) Unit!3731)

(assert (=> b!54134 (= lt!83739 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1515 (_2!2576 lt!83740)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!4932 0))(
  ( (tuple2!4933 (_1!2577 BitStream!2010) (_2!2577 BitStream!2010)) )
))
(declare-fun lt!83737 () tuple2!4932)

(declare-fun reader!0 (BitStream!2010 BitStream!2010) tuple2!4932)

(assert (=> b!54134 (= lt!83737 (reader!0 thiss!1379 (_2!2576 lt!83740)))))

(declare-fun res!45197 () Bool)

(assert (=> start!10874 (=> (not res!45197) (not e!36126))))

(assert (=> start!10874 (= res!45197 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1161 srcBuffer!2))))))))

(assert (=> start!10874 e!36126))

(assert (=> start!10874 true))

(assert (=> start!10874 (array_inv!1064 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2010) Bool)

(assert (=> start!10874 (and (inv!12 thiss!1379) e!36131)))

(declare-fun b!54135 () Bool)

(declare-datatypes ((List!580 0))(
  ( (Nil!577) (Cons!576 (h!695 Bool) (t!1330 List!580)) )
))
(declare-fun head!399 (List!580) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2010 array!2544 (_ BitVec 64) (_ BitVec 64)) List!580)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2010 BitStream!2010 (_ BitVec 64)) List!580)

(assert (=> b!54135 (= e!36130 (= (head!399 (byteArrayBitContentToList!0 (_2!2576 lt!83740) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!399 (bitStreamReadBitsIntoList!0 (_2!2576 lt!83740) (_1!2577 lt!83737) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!54136 () Bool)

(declare-fun res!45200 () Bool)

(assert (=> b!54136 (=> (not res!45200) (not e!36126))))

(assert (=> b!54136 (= res!45200 (validate_offset_bits!1 ((_ sign_extend 32) (size!1161 (buf!1515 thiss!1379))) ((_ sign_extend 32) (currentByte!3088 thiss!1379)) ((_ sign_extend 32) (currentBit!3083 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!10874 res!45197) b!54136))

(assert (= (and b!54136 res!45200) b!54132))

(assert (= (and b!54132 (not res!45201)) b!54133))

(assert (= (and b!54133 (not res!45199)) b!54134))

(assert (= (and b!54134 res!45198) b!54135))

(assert (= start!10874 b!54131))

(declare-fun m!85061 () Bool)

(assert (=> b!54131 m!85061))

(declare-fun m!85063 () Bool)

(assert (=> b!54135 m!85063))

(assert (=> b!54135 m!85063))

(declare-fun m!85065 () Bool)

(assert (=> b!54135 m!85065))

(declare-fun m!85067 () Bool)

(assert (=> b!54135 m!85067))

(assert (=> b!54135 m!85067))

(declare-fun m!85069 () Bool)

(assert (=> b!54135 m!85069))

(declare-fun m!85071 () Bool)

(assert (=> b!54133 m!85071))

(declare-fun m!85073 () Bool)

(assert (=> b!54133 m!85073))

(declare-fun m!85075 () Bool)

(assert (=> b!54133 m!85075))

(assert (=> b!54133 m!85073))

(declare-fun m!85077 () Bool)

(assert (=> b!54133 m!85077))

(declare-fun m!85079 () Bool)

(assert (=> b!54133 m!85079))

(declare-fun m!85081 () Bool)

(assert (=> b!54134 m!85081))

(declare-fun m!85083 () Bool)

(assert (=> b!54134 m!85083))

(declare-fun m!85085 () Bool)

(assert (=> b!54134 m!85085))

(declare-fun m!85087 () Bool)

(assert (=> b!54134 m!85087))

(declare-fun m!85089 () Bool)

(assert (=> start!10874 m!85089))

(declare-fun m!85091 () Bool)

(assert (=> start!10874 m!85091))

(declare-fun m!85093 () Bool)

(assert (=> b!54132 m!85093))

(declare-fun m!85095 () Bool)

(assert (=> b!54132 m!85095))

(declare-fun m!85097 () Bool)

(assert (=> b!54132 m!85097))

(declare-fun m!85099 () Bool)

(assert (=> b!54136 m!85099))

(check-sat (not start!10874) (not b!54133) (not b!54135) (not b!54131) (not b!54136) (not b!54132) (not b!54134))
