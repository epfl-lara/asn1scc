; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5718 () Bool)

(assert start!5718)

(declare-fun b!24714 () Bool)

(declare-fun e!16871 () Bool)

(declare-datatypes ((array!1641 0))(
  ( (array!1642 (arr!1162 (Array (_ BitVec 32) (_ BitVec 8))) (size!706 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1244 0))(
  ( (BitStream!1245 (buf!1027 array!1641) (currentByte!2340 (_ BitVec 32)) (currentBit!2335 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1244)

(declare-fun array_inv!675 (array!1641) Bool)

(assert (=> b!24714 (= e!16871 (array_inv!675 (buf!1027 thiss!1379)))))

(declare-fun b!24715 () Bool)

(declare-fun res!21353 () Bool)

(declare-fun e!16879 () Bool)

(assert (=> b!24715 (=> res!21353 e!16879)))

(declare-datatypes ((Unit!2055 0))(
  ( (Unit!2056) )
))
(declare-datatypes ((tuple2!2806 0))(
  ( (tuple2!2807 (_1!1490 Unit!2055) (_2!1490 BitStream!1244)) )
))
(declare-fun lt!35203 () tuple2!2806)

(declare-fun lt!35190 () tuple2!2806)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!24715 (= res!21353 (not (invariant!0 (currentBit!2335 (_2!1490 lt!35203)) (currentByte!2340 (_2!1490 lt!35203)) (size!706 (buf!1027 (_2!1490 lt!35190))))))))

(declare-fun b!24716 () Bool)

(declare-fun res!21351 () Bool)

(declare-fun e!16873 () Bool)

(assert (=> b!24716 (=> res!21351 e!16873)))

(assert (=> b!24716 (= res!21351 (not (invariant!0 (currentBit!2335 (_2!1490 lt!35190)) (currentByte!2340 (_2!1490 lt!35190)) (size!706 (buf!1027 (_2!1490 lt!35190))))))))

(declare-fun res!21346 () Bool)

(declare-fun e!16875 () Bool)

(assert (=> start!5718 (=> (not res!21346) (not e!16875))))

(declare-fun srcBuffer!2 () array!1641)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!5718 (= res!21346 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!706 srcBuffer!2))))))))

(assert (=> start!5718 e!16875))

(assert (=> start!5718 true))

(assert (=> start!5718 (array_inv!675 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1244) Bool)

(assert (=> start!5718 (and (inv!12 thiss!1379) e!16871)))

(declare-fun b!24717 () Bool)

(declare-fun e!16878 () Bool)

(declare-fun e!16874 () Bool)

(assert (=> b!24717 (= e!16878 e!16874)))

(declare-fun res!21352 () Bool)

(assert (=> b!24717 (=> res!21352 e!16874)))

(declare-fun isPrefixOf!0 (BitStream!1244 BitStream!1244) Bool)

(assert (=> b!24717 (= res!21352 (not (isPrefixOf!0 thiss!1379 (_2!1490 lt!35203))))))

(declare-fun lt!35196 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!24717 (validate_offset_bits!1 ((_ sign_extend 32) (size!706 (buf!1027 (_2!1490 lt!35203)))) ((_ sign_extend 32) (currentByte!2340 (_2!1490 lt!35203))) ((_ sign_extend 32) (currentBit!2335 (_2!1490 lt!35203))) lt!35196)))

(assert (=> b!24717 (= lt!35196 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!35202 () Unit!2055)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1244 BitStream!1244 (_ BitVec 64) (_ BitVec 64)) Unit!2055)

(assert (=> b!24717 (= lt!35202 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1490 lt!35203) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1244 (_ BitVec 8) (_ BitVec 32)) tuple2!2806)

(assert (=> b!24717 (= lt!35203 (appendBitFromByte!0 thiss!1379 (select (arr!1162 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!24718 () Bool)

(declare-fun res!21355 () Bool)

(assert (=> b!24718 (=> res!21355 e!16879)))

(assert (=> b!24718 (= res!21355 (not (invariant!0 (currentBit!2335 (_2!1490 lt!35203)) (currentByte!2340 (_2!1490 lt!35203)) (size!706 (buf!1027 (_2!1490 lt!35203))))))))

(declare-fun b!24719 () Bool)

(declare-fun res!21347 () Bool)

(assert (=> b!24719 (=> (not res!21347) (not e!16875))))

(assert (=> b!24719 (= res!21347 (validate_offset_bits!1 ((_ sign_extend 32) (size!706 (buf!1027 thiss!1379))) ((_ sign_extend 32) (currentByte!2340 thiss!1379)) ((_ sign_extend 32) (currentBit!2335 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!24720 () Bool)

(assert (=> b!24720 (= e!16875 (not e!16878))))

(declare-fun res!21357 () Bool)

(assert (=> b!24720 (=> res!21357 e!16878)))

(assert (=> b!24720 (= res!21357 (bvsge i!635 to!314))))

(assert (=> b!24720 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!35200 () Unit!2055)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1244) Unit!2055)

(assert (=> b!24720 (= lt!35200 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!35199 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!24720 (= lt!35199 (bitIndex!0 (size!706 (buf!1027 thiss!1379)) (currentByte!2340 thiss!1379) (currentBit!2335 thiss!1379)))))

(declare-fun e!16876 () Bool)

(declare-fun b!24721 () Bool)

(declare-fun lt!35198 () (_ BitVec 64))

(assert (=> b!24721 (= e!16876 (= lt!35198 (bvsub (bvsub (bvadd (bitIndex!0 (size!706 (buf!1027 (_2!1490 lt!35203))) (currentByte!2340 (_2!1490 lt!35203)) (currentBit!2335 (_2!1490 lt!35203))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!24722 () Bool)

(declare-fun e!16869 () Bool)

(declare-datatypes ((tuple2!2808 0))(
  ( (tuple2!2809 (_1!1491 BitStream!1244) (_2!1491 BitStream!1244)) )
))
(declare-fun lt!35195 () tuple2!2808)

(declare-datatypes ((List!323 0))(
  ( (Nil!320) (Cons!319 (h!438 Bool) (t!1073 List!323)) )
))
(declare-fun head!160 (List!323) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1244 array!1641 (_ BitVec 64) (_ BitVec 64)) List!323)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1244 BitStream!1244 (_ BitVec 64)) List!323)

(assert (=> b!24722 (= e!16869 (= (head!160 (byteArrayBitContentToList!0 (_2!1490 lt!35203) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!160 (bitStreamReadBitsIntoList!0 (_2!1490 lt!35203) (_1!1491 lt!35195) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!24723 () Bool)

(declare-fun res!21345 () Bool)

(assert (=> b!24723 (=> res!21345 e!16873)))

(assert (=> b!24723 (= res!21345 (not (= (size!706 (buf!1027 thiss!1379)) (size!706 (buf!1027 (_2!1490 lt!35190))))))))

(declare-fun b!24724 () Bool)

(declare-fun e!16872 () Bool)

(assert (=> b!24724 (= e!16874 e!16872)))

(declare-fun res!21348 () Bool)

(assert (=> b!24724 (=> res!21348 e!16872)))

(assert (=> b!24724 (= res!21348 (not (isPrefixOf!0 (_2!1490 lt!35203) (_2!1490 lt!35190))))))

(assert (=> b!24724 (isPrefixOf!0 thiss!1379 (_2!1490 lt!35190))))

(declare-fun lt!35193 () Unit!2055)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1244 BitStream!1244 BitStream!1244) Unit!2055)

(assert (=> b!24724 (= lt!35193 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1490 lt!35203) (_2!1490 lt!35190)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1244 array!1641 (_ BitVec 64) (_ BitVec 64)) tuple2!2806)

(assert (=> b!24724 (= lt!35190 (appendBitsMSBFirstLoop!0 (_2!1490 lt!35203) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!24724 e!16869))

(declare-fun res!21349 () Bool)

(assert (=> b!24724 (=> (not res!21349) (not e!16869))))

(assert (=> b!24724 (= res!21349 (validate_offset_bits!1 ((_ sign_extend 32) (size!706 (buf!1027 (_2!1490 lt!35203)))) ((_ sign_extend 32) (currentByte!2340 thiss!1379)) ((_ sign_extend 32) (currentBit!2335 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!35192 () Unit!2055)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1244 array!1641 (_ BitVec 64)) Unit!2055)

(assert (=> b!24724 (= lt!35192 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1027 (_2!1490 lt!35203)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1244 BitStream!1244) tuple2!2808)

(assert (=> b!24724 (= lt!35195 (reader!0 thiss!1379 (_2!1490 lt!35203)))))

(declare-fun b!24725 () Bool)

(assert (=> b!24725 (= e!16879 true)))

(assert (=> b!24725 (validate_offset_bits!1 ((_ sign_extend 32) (size!706 (buf!1027 (_2!1490 lt!35190)))) ((_ sign_extend 32) (currentByte!2340 (_2!1490 lt!35203))) ((_ sign_extend 32) (currentBit!2335 (_2!1490 lt!35203))) lt!35196)))

(declare-fun lt!35197 () Unit!2055)

(assert (=> b!24725 (= lt!35197 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1490 lt!35203) (buf!1027 (_2!1490 lt!35190)) lt!35196))))

(declare-fun lt!35191 () tuple2!2808)

(assert (=> b!24725 (= lt!35191 (reader!0 (_2!1490 lt!35203) (_2!1490 lt!35190)))))

(assert (=> b!24725 (validate_offset_bits!1 ((_ sign_extend 32) (size!706 (buf!1027 (_2!1490 lt!35190)))) ((_ sign_extend 32) (currentByte!2340 thiss!1379)) ((_ sign_extend 32) (currentBit!2335 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!35201 () Unit!2055)

(assert (=> b!24725 (= lt!35201 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1027 (_2!1490 lt!35190)) (bvsub to!314 i!635)))))

(declare-fun lt!35194 () tuple2!2808)

(assert (=> b!24725 (= lt!35194 (reader!0 thiss!1379 (_2!1490 lt!35190)))))

(declare-fun b!24726 () Bool)

(assert (=> b!24726 (= e!16873 e!16879)))

(declare-fun res!21350 () Bool)

(assert (=> b!24726 (=> res!21350 e!16879)))

(assert (=> b!24726 (= res!21350 (not (= (size!706 (buf!1027 (_2!1490 lt!35203))) (size!706 (buf!1027 (_2!1490 lt!35190))))))))

(assert (=> b!24726 e!16876))

(declare-fun res!21354 () Bool)

(assert (=> b!24726 (=> (not res!21354) (not e!16876))))

(assert (=> b!24726 (= res!21354 (= (size!706 (buf!1027 (_2!1490 lt!35190))) (size!706 (buf!1027 thiss!1379))))))

(declare-fun b!24727 () Bool)

(assert (=> b!24727 (= e!16872 e!16873)))

(declare-fun res!21356 () Bool)

(assert (=> b!24727 (=> res!21356 e!16873)))

(assert (=> b!24727 (= res!21356 (not (= lt!35198 (bvsub (bvadd lt!35199 to!314) i!635))))))

(assert (=> b!24727 (= lt!35198 (bitIndex!0 (size!706 (buf!1027 (_2!1490 lt!35190))) (currentByte!2340 (_2!1490 lt!35190)) (currentBit!2335 (_2!1490 lt!35190))))))

(assert (= (and start!5718 res!21346) b!24719))

(assert (= (and b!24719 res!21347) b!24720))

(assert (= (and b!24720 (not res!21357)) b!24717))

(assert (= (and b!24717 (not res!21352)) b!24724))

(assert (= (and b!24724 res!21349) b!24722))

(assert (= (and b!24724 (not res!21348)) b!24727))

(assert (= (and b!24727 (not res!21356)) b!24716))

(assert (= (and b!24716 (not res!21351)) b!24723))

(assert (= (and b!24723 (not res!21345)) b!24726))

(assert (= (and b!24726 res!21354) b!24721))

(assert (= (and b!24726 (not res!21350)) b!24718))

(assert (= (and b!24718 (not res!21355)) b!24715))

(assert (= (and b!24715 (not res!21353)) b!24725))

(assert (= start!5718 b!24714))

(declare-fun m!34957 () Bool)

(assert (=> b!24727 m!34957))

(declare-fun m!34959 () Bool)

(assert (=> b!24719 m!34959))

(declare-fun m!34961 () Bool)

(assert (=> b!24725 m!34961))

(declare-fun m!34963 () Bool)

(assert (=> b!24725 m!34963))

(declare-fun m!34965 () Bool)

(assert (=> b!24725 m!34965))

(declare-fun m!34967 () Bool)

(assert (=> b!24725 m!34967))

(declare-fun m!34969 () Bool)

(assert (=> b!24725 m!34969))

(declare-fun m!34971 () Bool)

(assert (=> b!24725 m!34971))

(declare-fun m!34973 () Bool)

(assert (=> b!24716 m!34973))

(declare-fun m!34975 () Bool)

(assert (=> b!24722 m!34975))

(assert (=> b!24722 m!34975))

(declare-fun m!34977 () Bool)

(assert (=> b!24722 m!34977))

(declare-fun m!34979 () Bool)

(assert (=> b!24722 m!34979))

(assert (=> b!24722 m!34979))

(declare-fun m!34981 () Bool)

(assert (=> b!24722 m!34981))

(declare-fun m!34983 () Bool)

(assert (=> b!24724 m!34983))

(declare-fun m!34985 () Bool)

(assert (=> b!24724 m!34985))

(declare-fun m!34987 () Bool)

(assert (=> b!24724 m!34987))

(declare-fun m!34989 () Bool)

(assert (=> b!24724 m!34989))

(declare-fun m!34991 () Bool)

(assert (=> b!24724 m!34991))

(declare-fun m!34993 () Bool)

(assert (=> b!24724 m!34993))

(declare-fun m!34995 () Bool)

(assert (=> b!24724 m!34995))

(declare-fun m!34997 () Bool)

(assert (=> b!24721 m!34997))

(declare-fun m!34999 () Bool)

(assert (=> b!24718 m!34999))

(declare-fun m!35001 () Bool)

(assert (=> b!24717 m!35001))

(declare-fun m!35003 () Bool)

(assert (=> b!24717 m!35003))

(declare-fun m!35005 () Bool)

(assert (=> b!24717 m!35005))

(declare-fun m!35007 () Bool)

(assert (=> b!24717 m!35007))

(assert (=> b!24717 m!35001))

(declare-fun m!35009 () Bool)

(assert (=> b!24717 m!35009))

(declare-fun m!35011 () Bool)

(assert (=> start!5718 m!35011))

(declare-fun m!35013 () Bool)

(assert (=> start!5718 m!35013))

(declare-fun m!35015 () Bool)

(assert (=> b!24715 m!35015))

(declare-fun m!35017 () Bool)

(assert (=> b!24720 m!35017))

(declare-fun m!35019 () Bool)

(assert (=> b!24720 m!35019))

(declare-fun m!35021 () Bool)

(assert (=> b!24720 m!35021))

(declare-fun m!35023 () Bool)

(assert (=> b!24714 m!35023))

(push 1)

(assert (not b!24719))

(assert (not b!24715))

(assert (not b!24727))

(assert (not b!24722))

(assert (not b!24714))

(assert (not b!24717))

(assert (not b!24720))

(assert (not b!24724))

(assert (not b!24716))

(assert (not b!24725))

(assert (not b!24721))

(assert (not b!24718))

(assert (not start!5718))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

