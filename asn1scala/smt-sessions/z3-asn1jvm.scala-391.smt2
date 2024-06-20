; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10162 () Bool)

(assert start!10162)

(declare-fun b!51481 () Bool)

(declare-fun e!33993 () Bool)

(declare-fun e!33992 () Bool)

(assert (=> b!51481 (= e!33993 e!33992)))

(declare-fun res!43098 () Bool)

(assert (=> b!51481 (=> res!43098 e!33992)))

(declare-datatypes ((array!2355 0))(
  ( (array!2356 (arr!1605 (Array (_ BitVec 32) (_ BitVec 8))) (size!1073 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1854 0))(
  ( (BitStream!1855 (buf!1428 array!2355) (currentByte!2957 (_ BitVec 32)) (currentBit!2952 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1854)

(declare-datatypes ((Unit!3545 0))(
  ( (Unit!3546) )
))
(declare-datatypes ((tuple2!4722 0))(
  ( (tuple2!4723 (_1!2466 Unit!3545) (_2!2466 BitStream!1854)) )
))
(declare-fun lt!80013 () tuple2!4722)

(declare-fun isPrefixOf!0 (BitStream!1854 BitStream!1854) Bool)

(assert (=> b!51481 (= res!43098 (not (isPrefixOf!0 thiss!1379 (_2!2466 lt!80013))))))

(declare-fun lt!80011 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!51481 (validate_offset_bits!1 ((_ sign_extend 32) (size!1073 (buf!1428 (_2!2466 lt!80013)))) ((_ sign_extend 32) (currentByte!2957 (_2!2466 lt!80013))) ((_ sign_extend 32) (currentBit!2952 (_2!2466 lt!80013))) lt!80011)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!51481 (= lt!80011 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!79992 () Unit!3545)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1854 BitStream!1854 (_ BitVec 64) (_ BitVec 64)) Unit!3545)

(assert (=> b!51481 (= lt!79992 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2466 lt!80013) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2355)

(declare-fun appendBitFromByte!0 (BitStream!1854 (_ BitVec 8) (_ BitVec 32)) tuple2!4722)

(assert (=> b!51481 (= lt!80013 (appendBitFromByte!0 thiss!1379 (select (arr!1605 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!51482 () Bool)

(declare-fun e!34003 () Bool)

(assert (=> b!51482 (= e!34003 (not e!33993))))

(declare-fun res!43100 () Bool)

(assert (=> b!51482 (=> res!43100 e!33993)))

(assert (=> b!51482 (= res!43100 (bvsge i!635 to!314))))

(assert (=> b!51482 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!80007 () Unit!3545)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1854) Unit!3545)

(assert (=> b!51482 (= lt!80007 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!79999 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!51482 (= lt!79999 (bitIndex!0 (size!1073 (buf!1428 thiss!1379)) (currentByte!2957 thiss!1379) (currentBit!2952 thiss!1379)))))

(declare-fun b!51483 () Bool)

(declare-fun e!33995 () Bool)

(declare-fun e!33999 () Bool)

(assert (=> b!51483 (= e!33995 e!33999)))

(declare-fun res!43094 () Bool)

(assert (=> b!51483 (=> res!43094 e!33999)))

(declare-datatypes ((List!568 0))(
  ( (Nil!565) (Cons!564 (h!683 Bool) (t!1318 List!568)) )
))
(declare-fun lt!80005 () List!568)

(declare-fun lt!80017 () List!568)

(assert (=> b!51483 (= res!43094 (not (= lt!80005 lt!80017)))))

(assert (=> b!51483 (= lt!80017 lt!80005)))

(declare-fun lt!80016 () List!568)

(declare-fun tail!254 (List!568) List!568)

(assert (=> b!51483 (= lt!80005 (tail!254 lt!80016))))

(declare-fun lt!79994 () tuple2!4722)

(declare-datatypes ((tuple2!4724 0))(
  ( (tuple2!4725 (_1!2467 BitStream!1854) (_2!2467 BitStream!1854)) )
))
(declare-fun lt!79995 () tuple2!4724)

(declare-fun lt!80003 () tuple2!4724)

(declare-fun lt!80009 () Unit!3545)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1854 BitStream!1854 BitStream!1854 BitStream!1854 (_ BitVec 64) List!568) Unit!3545)

(assert (=> b!51483 (= lt!80009 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2466 lt!79994) (_2!2466 lt!79994) (_1!2467 lt!79995) (_1!2467 lt!80003) (bvsub to!314 i!635) lt!80016))))

(declare-fun b!51484 () Bool)

(declare-fun res!43087 () Bool)

(declare-fun e!34002 () Bool)

(assert (=> b!51484 (=> res!43087 e!34002)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!51484 (= res!43087 (not (invariant!0 (currentBit!2952 (_2!2466 lt!80013)) (currentByte!2957 (_2!2466 lt!80013)) (size!1073 (buf!1428 (_2!2466 lt!79994))))))))

(declare-fun b!51485 () Bool)

(declare-fun e!34007 () Bool)

(declare-fun e!34001 () Bool)

(assert (=> b!51485 (= e!34007 e!34001)))

(declare-fun res!43097 () Bool)

(assert (=> b!51485 (=> res!43097 e!34001)))

(declare-fun lt!80008 () Bool)

(declare-fun lt!80000 () Bool)

(assert (=> b!51485 (= res!43097 (not (= lt!80008 lt!80000)))))

(declare-fun head!387 (List!568) Bool)

(assert (=> b!51485 (= lt!80008 (head!387 lt!80016))))

(declare-fun b!51486 () Bool)

(declare-fun e!33994 () Bool)

(declare-fun array_inv!980 (array!2355) Bool)

(assert (=> b!51486 (= e!33994 (array_inv!980 (buf!1428 thiss!1379)))))

(declare-fun b!51487 () Bool)

(declare-fun res!43088 () Bool)

(declare-fun e!34004 () Bool)

(assert (=> b!51487 (=> res!43088 e!34004)))

(assert (=> b!51487 (= res!43088 (not (= (size!1073 (buf!1428 thiss!1379)) (size!1073 (buf!1428 (_2!2466 lt!79994))))))))

(declare-fun b!51488 () Bool)

(declare-fun e!34005 () Bool)

(assert (=> b!51488 (= e!34005 e!34004)))

(declare-fun res!43096 () Bool)

(assert (=> b!51488 (=> res!43096 e!34004)))

(declare-fun lt!79997 () (_ BitVec 64))

(assert (=> b!51488 (= res!43096 (not (= lt!79997 (bvsub (bvadd lt!79999 to!314) i!635))))))

(assert (=> b!51488 (= lt!79997 (bitIndex!0 (size!1073 (buf!1428 (_2!2466 lt!79994))) (currentByte!2957 (_2!2466 lt!79994)) (currentBit!2952 (_2!2466 lt!79994))))))

(declare-fun b!51489 () Bool)

(assert (=> b!51489 (= e!34004 e!34002)))

(declare-fun res!43091 () Bool)

(assert (=> b!51489 (=> res!43091 e!34002)))

(assert (=> b!51489 (= res!43091 (not (= (size!1073 (buf!1428 (_2!2466 lt!80013))) (size!1073 (buf!1428 (_2!2466 lt!79994))))))))

(declare-fun lt!79993 () (_ BitVec 64))

(assert (=> b!51489 (= lt!79997 (bvsub (bvsub (bvadd lt!79993 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!51489 (= lt!79993 (bitIndex!0 (size!1073 (buf!1428 (_2!2466 lt!80013))) (currentByte!2957 (_2!2466 lt!80013)) (currentBit!2952 (_2!2466 lt!80013))))))

(assert (=> b!51489 (= (size!1073 (buf!1428 (_2!2466 lt!79994))) (size!1073 (buf!1428 thiss!1379)))))

(declare-fun b!51490 () Bool)

(declare-fun res!43089 () Bool)

(assert (=> b!51490 (=> res!43089 e!34002)))

(assert (=> b!51490 (= res!43089 (not (invariant!0 (currentBit!2952 (_2!2466 lt!80013)) (currentByte!2957 (_2!2466 lt!80013)) (size!1073 (buf!1428 (_2!2466 lt!80013))))))))

(declare-fun b!51491 () Bool)

(declare-fun e!33998 () Bool)

(assert (=> b!51491 (= e!34001 e!33998)))

(declare-fun res!43106 () Bool)

(assert (=> b!51491 (=> res!43106 e!33998)))

(declare-fun lt!80001 () Bool)

(declare-fun lt!80014 () Bool)

(assert (=> b!51491 (= res!43106 (not (= lt!80001 lt!80014)))))

(declare-fun bitAt!0 (array!2355 (_ BitVec 64)) Bool)

(assert (=> b!51491 (= lt!80014 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun byteArrayBitContentToList!0 (BitStream!1854 array!2355 (_ BitVec 64) (_ BitVec 64)) List!568)

(assert (=> b!51491 (= lt!80001 (head!387 (byteArrayBitContentToList!0 (_2!2466 lt!79994) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(declare-fun b!51492 () Bool)

(declare-fun res!43101 () Bool)

(assert (=> b!51492 (=> (not res!43101) (not e!34003))))

(assert (=> b!51492 (= res!43101 (validate_offset_bits!1 ((_ sign_extend 32) (size!1073 (buf!1428 thiss!1379))) ((_ sign_extend 32) (currentByte!2957 thiss!1379)) ((_ sign_extend 32) (currentBit!2952 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!51493 () Bool)

(declare-fun e!34006 () Bool)

(assert (=> b!51493 (= e!33998 e!34006)))

(declare-fun res!43093 () Bool)

(assert (=> b!51493 (=> res!43093 e!34006)))

(declare-fun lt!80004 () Bool)

(assert (=> b!51493 (= res!43093 (not (= lt!80004 lt!80014)))))

(assert (=> b!51493 (= lt!80004 (bitAt!0 (buf!1428 (_2!2466 lt!80013)) lt!79999))))

(declare-fun res!43092 () Bool)

(assert (=> start!10162 (=> (not res!43092) (not e!34003))))

(assert (=> start!10162 (= res!43092 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1073 srcBuffer!2))))))))

(assert (=> start!10162 e!34003))

(assert (=> start!10162 true))

(assert (=> start!10162 (array_inv!980 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1854) Bool)

(assert (=> start!10162 (and (inv!12 thiss!1379) e!33994)))

(declare-fun b!51494 () Bool)

(assert (=> b!51494 (= e!33992 e!34005)))

(declare-fun res!43099 () Bool)

(assert (=> b!51494 (=> res!43099 e!34005)))

(assert (=> b!51494 (= res!43099 (not (isPrefixOf!0 (_2!2466 lt!80013) (_2!2466 lt!79994))))))

(assert (=> b!51494 (isPrefixOf!0 thiss!1379 (_2!2466 lt!79994))))

(declare-fun lt!80015 () Unit!3545)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1854 BitStream!1854 BitStream!1854) Unit!3545)

(assert (=> b!51494 (= lt!80015 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2466 lt!80013) (_2!2466 lt!79994)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1854 array!2355 (_ BitVec 64) (_ BitVec 64)) tuple2!4722)

(assert (=> b!51494 (= lt!79994 (appendBitsMSBFirstLoop!0 (_2!2466 lt!80013) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!34000 () Bool)

(assert (=> b!51494 e!34000))

(declare-fun res!43107 () Bool)

(assert (=> b!51494 (=> (not res!43107) (not e!34000))))

(assert (=> b!51494 (= res!43107 (validate_offset_bits!1 ((_ sign_extend 32) (size!1073 (buf!1428 (_2!2466 lt!80013)))) ((_ sign_extend 32) (currentByte!2957 thiss!1379)) ((_ sign_extend 32) (currentBit!2952 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!79996 () Unit!3545)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1854 array!2355 (_ BitVec 64)) Unit!3545)

(assert (=> b!51494 (= lt!79996 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1428 (_2!2466 lt!80013)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!80006 () tuple2!4724)

(declare-fun reader!0 (BitStream!1854 BitStream!1854) tuple2!4724)

(assert (=> b!51494 (= lt!80006 (reader!0 thiss!1379 (_2!2466 lt!80013)))))

(declare-fun b!51495 () Bool)

(declare-fun e!33997 () Bool)

(assert (=> b!51495 (= e!34006 e!33997)))

(declare-fun res!43104 () Bool)

(assert (=> b!51495 (=> res!43104 e!33997)))

(declare-fun lt!80002 () Bool)

(assert (=> b!51495 (= res!43104 (not (= lt!80002 lt!80014)))))

(assert (=> b!51495 (= lt!80004 lt!80002)))

(assert (=> b!51495 (= lt!80002 (bitAt!0 (buf!1428 (_2!2466 lt!79994)) lt!79999))))

(declare-fun lt!80010 () Unit!3545)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2355 array!2355 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3545)

(assert (=> b!51495 (= lt!80010 (arrayBitRangesEqImpliesEq!0 (buf!1428 (_2!2466 lt!80013)) (buf!1428 (_2!2466 lt!79994)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!79999 lt!79993))))

(declare-fun b!51496 () Bool)

(assert (=> b!51496 (= e!33997 (= lt!80008 lt!80001))))

(declare-fun b!51497 () Bool)

(assert (=> b!51497 (= e!34002 e!33995)))

(declare-fun res!43103 () Bool)

(assert (=> b!51497 (=> res!43103 e!33995)))

(assert (=> b!51497 (= res!43103 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1854 BitStream!1854 (_ BitVec 64)) List!568)

(assert (=> b!51497 (= lt!80017 (bitStreamReadBitsIntoList!0 (_2!2466 lt!79994) (_1!2467 lt!80003) lt!80011))))

(assert (=> b!51497 (= lt!80016 (bitStreamReadBitsIntoList!0 (_2!2466 lt!79994) (_1!2467 lt!79995) (bvsub to!314 i!635)))))

(assert (=> b!51497 (validate_offset_bits!1 ((_ sign_extend 32) (size!1073 (buf!1428 (_2!2466 lt!79994)))) ((_ sign_extend 32) (currentByte!2957 (_2!2466 lt!80013))) ((_ sign_extend 32) (currentBit!2952 (_2!2466 lt!80013))) lt!80011)))

(declare-fun lt!80012 () Unit!3545)

(assert (=> b!51497 (= lt!80012 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2466 lt!80013) (buf!1428 (_2!2466 lt!79994)) lt!80011))))

(assert (=> b!51497 (= lt!80003 (reader!0 (_2!2466 lt!80013) (_2!2466 lt!79994)))))

(assert (=> b!51497 (validate_offset_bits!1 ((_ sign_extend 32) (size!1073 (buf!1428 (_2!2466 lt!79994)))) ((_ sign_extend 32) (currentByte!2957 thiss!1379)) ((_ sign_extend 32) (currentBit!2952 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!79998 () Unit!3545)

(assert (=> b!51497 (= lt!79998 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1428 (_2!2466 lt!79994)) (bvsub to!314 i!635)))))

(assert (=> b!51497 (= lt!79995 (reader!0 thiss!1379 (_2!2466 lt!79994)))))

(declare-fun b!51498 () Bool)

(assert (=> b!51498 (= e!34000 (= (head!387 (byteArrayBitContentToList!0 (_2!2466 lt!80013) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!387 (bitStreamReadBitsIntoList!0 (_2!2466 lt!80013) (_1!2467 lt!80006) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!51499 () Bool)

(assert (=> b!51499 (= e!33999 e!34007)))

(declare-fun res!43090 () Bool)

(assert (=> b!51499 (=> res!43090 e!34007)))

(assert (=> b!51499 (= res!43090 (not (= lt!80000 (bitAt!0 (buf!1428 (_1!2467 lt!80003)) lt!79999))))))

(assert (=> b!51499 (= lt!80000 (bitAt!0 (buf!1428 (_1!2467 lt!79995)) lt!79999))))

(declare-fun b!51500 () Bool)

(declare-fun res!43102 () Bool)

(assert (=> b!51500 (=> res!43102 e!34004)))

(assert (=> b!51500 (= res!43102 (not (invariant!0 (currentBit!2952 (_2!2466 lt!79994)) (currentByte!2957 (_2!2466 lt!79994)) (size!1073 (buf!1428 (_2!2466 lt!79994))))))))

(declare-fun b!51501 () Bool)

(declare-fun res!43095 () Bool)

(assert (=> b!51501 (=> res!43095 e!33997)))

(declare-datatypes ((tuple2!4726 0))(
  ( (tuple2!4727 (_1!2468 BitStream!1854) (_2!2468 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!1854) tuple2!4726)

(assert (=> b!51501 (= res!43095 (not (= (_2!2468 (readBitPure!0 (_1!2467 lt!79995))) lt!80014)))))

(declare-fun b!51502 () Bool)

(declare-fun res!43105 () Bool)

(assert (=> b!51502 (=> res!43105 e!33995)))

(declare-fun length!263 (List!568) Int)

(assert (=> b!51502 (= res!43105 (<= (length!263 lt!80016) 0))))

(assert (= (and start!10162 res!43092) b!51492))

(assert (= (and b!51492 res!43101) b!51482))

(assert (= (and b!51482 (not res!43100)) b!51481))

(assert (= (and b!51481 (not res!43098)) b!51494))

(assert (= (and b!51494 res!43107) b!51498))

(assert (= (and b!51494 (not res!43099)) b!51488))

(assert (= (and b!51488 (not res!43096)) b!51500))

(assert (= (and b!51500 (not res!43102)) b!51487))

(assert (= (and b!51487 (not res!43088)) b!51489))

(assert (= (and b!51489 (not res!43091)) b!51490))

(assert (= (and b!51490 (not res!43089)) b!51484))

(assert (= (and b!51484 (not res!43087)) b!51497))

(assert (= (and b!51497 (not res!43103)) b!51502))

(assert (= (and b!51502 (not res!43105)) b!51483))

(assert (= (and b!51483 (not res!43094)) b!51499))

(assert (= (and b!51499 (not res!43090)) b!51485))

(assert (= (and b!51485 (not res!43097)) b!51491))

(assert (= (and b!51491 (not res!43106)) b!51493))

(assert (= (and b!51493 (not res!43093)) b!51495))

(assert (= (and b!51495 (not res!43104)) b!51501))

(assert (= (and b!51501 (not res!43095)) b!51496))

(assert (= start!10162 b!51486))

(declare-fun m!81149 () Bool)

(assert (=> b!51483 m!81149))

(declare-fun m!81151 () Bool)

(assert (=> b!51483 m!81151))

(declare-fun m!81153 () Bool)

(assert (=> b!51498 m!81153))

(assert (=> b!51498 m!81153))

(declare-fun m!81155 () Bool)

(assert (=> b!51498 m!81155))

(declare-fun m!81157 () Bool)

(assert (=> b!51498 m!81157))

(assert (=> b!51498 m!81157))

(declare-fun m!81159 () Bool)

(assert (=> b!51498 m!81159))

(declare-fun m!81161 () Bool)

(assert (=> b!51491 m!81161))

(declare-fun m!81163 () Bool)

(assert (=> b!51491 m!81163))

(assert (=> b!51491 m!81163))

(declare-fun m!81165 () Bool)

(assert (=> b!51491 m!81165))

(declare-fun m!81167 () Bool)

(assert (=> b!51501 m!81167))

(declare-fun m!81169 () Bool)

(assert (=> b!51493 m!81169))

(declare-fun m!81171 () Bool)

(assert (=> b!51495 m!81171))

(declare-fun m!81173 () Bool)

(assert (=> b!51495 m!81173))

(declare-fun m!81175 () Bool)

(assert (=> b!51500 m!81175))

(declare-fun m!81177 () Bool)

(assert (=> b!51488 m!81177))

(declare-fun m!81179 () Bool)

(assert (=> b!51481 m!81179))

(declare-fun m!81181 () Bool)

(assert (=> b!51481 m!81181))

(declare-fun m!81183 () Bool)

(assert (=> b!51481 m!81183))

(declare-fun m!81185 () Bool)

(assert (=> b!51481 m!81185))

(assert (=> b!51481 m!81181))

(declare-fun m!81187 () Bool)

(assert (=> b!51481 m!81187))

(declare-fun m!81189 () Bool)

(assert (=> b!51502 m!81189))

(declare-fun m!81191 () Bool)

(assert (=> start!10162 m!81191))

(declare-fun m!81193 () Bool)

(assert (=> start!10162 m!81193))

(declare-fun m!81195 () Bool)

(assert (=> b!51490 m!81195))

(declare-fun m!81197 () Bool)

(assert (=> b!51486 m!81197))

(declare-fun m!81199 () Bool)

(assert (=> b!51485 m!81199))

(declare-fun m!81201 () Bool)

(assert (=> b!51489 m!81201))

(declare-fun m!81203 () Bool)

(assert (=> b!51499 m!81203))

(declare-fun m!81205 () Bool)

(assert (=> b!51499 m!81205))

(declare-fun m!81207 () Bool)

(assert (=> b!51492 m!81207))

(declare-fun m!81209 () Bool)

(assert (=> b!51484 m!81209))

(declare-fun m!81211 () Bool)

(assert (=> b!51482 m!81211))

(declare-fun m!81213 () Bool)

(assert (=> b!51482 m!81213))

(declare-fun m!81215 () Bool)

(assert (=> b!51482 m!81215))

(declare-fun m!81217 () Bool)

(assert (=> b!51494 m!81217))

(declare-fun m!81219 () Bool)

(assert (=> b!51494 m!81219))

(declare-fun m!81221 () Bool)

(assert (=> b!51494 m!81221))

(declare-fun m!81223 () Bool)

(assert (=> b!51494 m!81223))

(declare-fun m!81225 () Bool)

(assert (=> b!51494 m!81225))

(declare-fun m!81227 () Bool)

(assert (=> b!51494 m!81227))

(declare-fun m!81229 () Bool)

(assert (=> b!51494 m!81229))

(declare-fun m!81231 () Bool)

(assert (=> b!51497 m!81231))

(declare-fun m!81233 () Bool)

(assert (=> b!51497 m!81233))

(declare-fun m!81235 () Bool)

(assert (=> b!51497 m!81235))

(declare-fun m!81237 () Bool)

(assert (=> b!51497 m!81237))

(declare-fun m!81239 () Bool)

(assert (=> b!51497 m!81239))

(declare-fun m!81241 () Bool)

(assert (=> b!51497 m!81241))

(declare-fun m!81243 () Bool)

(assert (=> b!51497 m!81243))

(declare-fun m!81245 () Bool)

(assert (=> b!51497 m!81245))

(check-sat (not b!51495) (not b!51493) (not b!51501) (not b!51497) (not b!51491) (not b!51483) (not start!10162) (not b!51492) (not b!51484) (not b!51498) (not b!51482) (not b!51489) (not b!51500) (not b!51488) (not b!51485) (not b!51494) (not b!51499) (not b!51486) (not b!51502) (not b!51490) (not b!51481))
(check-sat)
(get-model)

(declare-fun d!16264 () Bool)

(declare-fun res!43177 () Bool)

(declare-fun e!34064 () Bool)

(assert (=> d!16264 (=> (not res!43177) (not e!34064))))

(assert (=> d!16264 (= res!43177 (= (size!1073 (buf!1428 thiss!1379)) (size!1073 (buf!1428 thiss!1379))))))

(assert (=> d!16264 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!34064)))

(declare-fun b!51575 () Bool)

(declare-fun res!43179 () Bool)

(assert (=> b!51575 (=> (not res!43179) (not e!34064))))

(assert (=> b!51575 (= res!43179 (bvsle (bitIndex!0 (size!1073 (buf!1428 thiss!1379)) (currentByte!2957 thiss!1379) (currentBit!2952 thiss!1379)) (bitIndex!0 (size!1073 (buf!1428 thiss!1379)) (currentByte!2957 thiss!1379) (currentBit!2952 thiss!1379))))))

(declare-fun b!51576 () Bool)

(declare-fun e!34063 () Bool)

(assert (=> b!51576 (= e!34064 e!34063)))

(declare-fun res!43178 () Bool)

(assert (=> b!51576 (=> res!43178 e!34063)))

(assert (=> b!51576 (= res!43178 (= (size!1073 (buf!1428 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!51577 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2355 array!2355 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!51577 (= e!34063 (arrayBitRangesEq!0 (buf!1428 thiss!1379) (buf!1428 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1073 (buf!1428 thiss!1379)) (currentByte!2957 thiss!1379) (currentBit!2952 thiss!1379))))))

(assert (= (and d!16264 res!43177) b!51575))

(assert (= (and b!51575 res!43179) b!51576))

(assert (= (and b!51576 (not res!43178)) b!51577))

(assert (=> b!51575 m!81215))

(assert (=> b!51575 m!81215))

(assert (=> b!51577 m!81215))

(assert (=> b!51577 m!81215))

(declare-fun m!81345 () Bool)

(assert (=> b!51577 m!81345))

(assert (=> b!51482 d!16264))

(declare-fun d!16266 () Bool)

(assert (=> d!16266 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!80098 () Unit!3545)

(declare-fun choose!11 (BitStream!1854) Unit!3545)

(assert (=> d!16266 (= lt!80098 (choose!11 thiss!1379))))

(assert (=> d!16266 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!80098)))

(declare-fun bs!4079 () Bool)

(assert (= bs!4079 d!16266))

(assert (=> bs!4079 m!81211))

(declare-fun m!81347 () Bool)

(assert (=> bs!4079 m!81347))

(assert (=> b!51482 d!16266))

(declare-fun d!16268 () Bool)

(declare-fun e!34067 () Bool)

(assert (=> d!16268 e!34067))

(declare-fun res!43185 () Bool)

(assert (=> d!16268 (=> (not res!43185) (not e!34067))))

(declare-fun lt!80112 () (_ BitVec 64))

(declare-fun lt!80115 () (_ BitVec 64))

(declare-fun lt!80114 () (_ BitVec 64))

(assert (=> d!16268 (= res!43185 (= lt!80112 (bvsub lt!80114 lt!80115)))))

(assert (=> d!16268 (or (= (bvand lt!80114 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!80115 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!80114 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!80114 lt!80115) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!16268 (= lt!80115 (remainingBits!0 ((_ sign_extend 32) (size!1073 (buf!1428 thiss!1379))) ((_ sign_extend 32) (currentByte!2957 thiss!1379)) ((_ sign_extend 32) (currentBit!2952 thiss!1379))))))

(declare-fun lt!80113 () (_ BitVec 64))

(declare-fun lt!80116 () (_ BitVec 64))

(assert (=> d!16268 (= lt!80114 (bvmul lt!80113 lt!80116))))

(assert (=> d!16268 (or (= lt!80113 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!80116 (bvsdiv (bvmul lt!80113 lt!80116) lt!80113)))))

(assert (=> d!16268 (= lt!80116 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!16268 (= lt!80113 ((_ sign_extend 32) (size!1073 (buf!1428 thiss!1379))))))

(assert (=> d!16268 (= lt!80112 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2957 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2952 thiss!1379))))))

(assert (=> d!16268 (invariant!0 (currentBit!2952 thiss!1379) (currentByte!2957 thiss!1379) (size!1073 (buf!1428 thiss!1379)))))

(assert (=> d!16268 (= (bitIndex!0 (size!1073 (buf!1428 thiss!1379)) (currentByte!2957 thiss!1379) (currentBit!2952 thiss!1379)) lt!80112)))

(declare-fun b!51582 () Bool)

(declare-fun res!43184 () Bool)

(assert (=> b!51582 (=> (not res!43184) (not e!34067))))

(assert (=> b!51582 (= res!43184 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!80112))))

(declare-fun b!51583 () Bool)

(declare-fun lt!80111 () (_ BitVec 64))

(assert (=> b!51583 (= e!34067 (bvsle lt!80112 (bvmul lt!80111 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!51583 (or (= lt!80111 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!80111 #b0000000000000000000000000000000000000000000000000000000000001000) lt!80111)))))

(assert (=> b!51583 (= lt!80111 ((_ sign_extend 32) (size!1073 (buf!1428 thiss!1379))))))

(assert (= (and d!16268 res!43185) b!51582))

(assert (= (and b!51582 res!43184) b!51583))

(declare-fun m!81349 () Bool)

(assert (=> d!16268 m!81349))

(declare-fun m!81351 () Bool)

(assert (=> d!16268 m!81351))

(assert (=> b!51482 d!16268))

(declare-fun d!16270 () Bool)

(assert (=> d!16270 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1073 (buf!1428 thiss!1379))) ((_ sign_extend 32) (currentByte!2957 thiss!1379)) ((_ sign_extend 32) (currentBit!2952 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1073 (buf!1428 thiss!1379))) ((_ sign_extend 32) (currentByte!2957 thiss!1379)) ((_ sign_extend 32) (currentBit!2952 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4080 () Bool)

(assert (= bs!4080 d!16270))

(assert (=> bs!4080 m!81349))

(assert (=> b!51492 d!16270))

(declare-fun d!16272 () Bool)

(declare-fun res!43186 () Bool)

(declare-fun e!34069 () Bool)

(assert (=> d!16272 (=> (not res!43186) (not e!34069))))

(assert (=> d!16272 (= res!43186 (= (size!1073 (buf!1428 thiss!1379)) (size!1073 (buf!1428 (_2!2466 lt!80013)))))))

(assert (=> d!16272 (= (isPrefixOf!0 thiss!1379 (_2!2466 lt!80013)) e!34069)))

(declare-fun b!51584 () Bool)

(declare-fun res!43188 () Bool)

(assert (=> b!51584 (=> (not res!43188) (not e!34069))))

(assert (=> b!51584 (= res!43188 (bvsle (bitIndex!0 (size!1073 (buf!1428 thiss!1379)) (currentByte!2957 thiss!1379) (currentBit!2952 thiss!1379)) (bitIndex!0 (size!1073 (buf!1428 (_2!2466 lt!80013))) (currentByte!2957 (_2!2466 lt!80013)) (currentBit!2952 (_2!2466 lt!80013)))))))

(declare-fun b!51585 () Bool)

(declare-fun e!34068 () Bool)

(assert (=> b!51585 (= e!34069 e!34068)))

(declare-fun res!43187 () Bool)

(assert (=> b!51585 (=> res!43187 e!34068)))

(assert (=> b!51585 (= res!43187 (= (size!1073 (buf!1428 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!51586 () Bool)

(assert (=> b!51586 (= e!34068 (arrayBitRangesEq!0 (buf!1428 thiss!1379) (buf!1428 (_2!2466 lt!80013)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1073 (buf!1428 thiss!1379)) (currentByte!2957 thiss!1379) (currentBit!2952 thiss!1379))))))

(assert (= (and d!16272 res!43186) b!51584))

(assert (= (and b!51584 res!43188) b!51585))

(assert (= (and b!51585 (not res!43187)) b!51586))

(assert (=> b!51584 m!81215))

(assert (=> b!51584 m!81201))

(assert (=> b!51586 m!81215))

(assert (=> b!51586 m!81215))

(declare-fun m!81353 () Bool)

(assert (=> b!51586 m!81353))

(assert (=> b!51481 d!16272))

(declare-fun d!16274 () Bool)

(assert (=> d!16274 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1073 (buf!1428 (_2!2466 lt!80013)))) ((_ sign_extend 32) (currentByte!2957 (_2!2466 lt!80013))) ((_ sign_extend 32) (currentBit!2952 (_2!2466 lt!80013))) lt!80011) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1073 (buf!1428 (_2!2466 lt!80013)))) ((_ sign_extend 32) (currentByte!2957 (_2!2466 lt!80013))) ((_ sign_extend 32) (currentBit!2952 (_2!2466 lt!80013)))) lt!80011))))

(declare-fun bs!4081 () Bool)

(assert (= bs!4081 d!16274))

(declare-fun m!81355 () Bool)

(assert (=> bs!4081 m!81355))

(assert (=> b!51481 d!16274))

(declare-fun d!16276 () Bool)

(declare-fun e!34072 () Bool)

(assert (=> d!16276 e!34072))

(declare-fun res!43191 () Bool)

(assert (=> d!16276 (=> (not res!43191) (not e!34072))))

(assert (=> d!16276 (= res!43191 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!80119 () Unit!3545)

(declare-fun choose!27 (BitStream!1854 BitStream!1854 (_ BitVec 64) (_ BitVec 64)) Unit!3545)

(assert (=> d!16276 (= lt!80119 (choose!27 thiss!1379 (_2!2466 lt!80013) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!16276 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!16276 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2466 lt!80013) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!80119)))

(declare-fun b!51589 () Bool)

(assert (=> b!51589 (= e!34072 (validate_offset_bits!1 ((_ sign_extend 32) (size!1073 (buf!1428 (_2!2466 lt!80013)))) ((_ sign_extend 32) (currentByte!2957 (_2!2466 lt!80013))) ((_ sign_extend 32) (currentBit!2952 (_2!2466 lt!80013))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!16276 res!43191) b!51589))

(declare-fun m!81357 () Bool)

(assert (=> d!16276 m!81357))

(declare-fun m!81359 () Bool)

(assert (=> b!51589 m!81359))

(assert (=> b!51481 d!16276))

(declare-fun b!51607 () Bool)

(declare-fun res!43210 () Bool)

(declare-fun e!34082 () Bool)

(assert (=> b!51607 (=> (not res!43210) (not e!34082))))

(declare-fun lt!80149 () tuple2!4722)

(assert (=> b!51607 (= res!43210 (= (bitIndex!0 (size!1073 (buf!1428 (_2!2466 lt!80149))) (currentByte!2957 (_2!2466 lt!80149)) (currentBit!2952 (_2!2466 lt!80149))) (bvadd (bitIndex!0 (size!1073 (buf!1428 thiss!1379)) (currentByte!2957 thiss!1379) (currentBit!2952 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!51608 () Bool)

(declare-fun e!34083 () Bool)

(assert (=> b!51608 (= e!34082 e!34083)))

(declare-fun res!43209 () Bool)

(assert (=> b!51608 (=> (not res!43209) (not e!34083))))

(declare-fun lt!80152 () tuple2!4726)

(declare-fun lt!80155 () Bool)

(assert (=> b!51608 (= res!43209 (and (= (_2!2468 lt!80152) lt!80155) (= (_1!2468 lt!80152) (_2!2466 lt!80149))))))

(declare-fun readerFrom!0 (BitStream!1854 (_ BitVec 32) (_ BitVec 32)) BitStream!1854)

(assert (=> b!51608 (= lt!80152 (readBitPure!0 (readerFrom!0 (_2!2466 lt!80149) (currentBit!2952 thiss!1379) (currentByte!2957 thiss!1379))))))

(declare-fun b!51609 () Bool)

(declare-fun e!34081 () Bool)

(declare-fun lt!80154 () tuple2!4726)

(declare-fun lt!80148 () tuple2!4722)

(assert (=> b!51609 (= e!34081 (= (bitIndex!0 (size!1073 (buf!1428 (_1!2468 lt!80154))) (currentByte!2957 (_1!2468 lt!80154)) (currentBit!2952 (_1!2468 lt!80154))) (bitIndex!0 (size!1073 (buf!1428 (_2!2466 lt!80148))) (currentByte!2957 (_2!2466 lt!80148)) (currentBit!2952 (_2!2466 lt!80148)))))))

(declare-fun b!51610 () Bool)

(declare-fun res!43214 () Bool)

(assert (=> b!51610 (=> (not res!43214) (not e!34082))))

(assert (=> b!51610 (= res!43214 (isPrefixOf!0 thiss!1379 (_2!2466 lt!80149)))))

(declare-fun b!51611 () Bool)

(declare-fun e!34084 () Bool)

(assert (=> b!51611 (= e!34084 e!34081)))

(declare-fun res!43212 () Bool)

(assert (=> b!51611 (=> (not res!43212) (not e!34081))))

(declare-fun lt!80145 () (_ BitVec 8))

(assert (=> b!51611 (= res!43212 (and (= (_2!2468 lt!80154) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1605 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!80145)) #b00000000000000000000000000000000))) (= (_1!2468 lt!80154) (_2!2466 lt!80148))))))

(declare-datatypes ((tuple2!4734 0))(
  ( (tuple2!4735 (_1!2472 array!2355) (_2!2472 BitStream!1854)) )
))
(declare-fun lt!80153 () tuple2!4734)

(declare-fun lt!80144 () BitStream!1854)

(declare-fun readBits!0 (BitStream!1854 (_ BitVec 64)) tuple2!4734)

(assert (=> b!51611 (= lt!80153 (readBits!0 lt!80144 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!51611 (= lt!80154 (readBitPure!0 lt!80144))))

(assert (=> b!51611 (= lt!80144 (readerFrom!0 (_2!2466 lt!80148) (currentBit!2952 thiss!1379) (currentByte!2957 thiss!1379)))))

(declare-fun d!16278 () Bool)

(assert (=> d!16278 e!34084))

(declare-fun res!43211 () Bool)

(assert (=> d!16278 (=> (not res!43211) (not e!34084))))

(assert (=> d!16278 (= res!43211 (= (size!1073 (buf!1428 (_2!2466 lt!80148))) (size!1073 (buf!1428 thiss!1379))))))

(declare-fun lt!80146 () array!2355)

(assert (=> d!16278 (= lt!80145 (select (arr!1605 lt!80146) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!16278 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1073 lt!80146)))))

(assert (=> d!16278 (= lt!80146 (array!2356 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!80150 () tuple2!4722)

(assert (=> d!16278 (= lt!80148 (tuple2!4723 (_1!2466 lt!80150) (_2!2466 lt!80150)))))

(assert (=> d!16278 (= lt!80150 lt!80149)))

(assert (=> d!16278 e!34082))

(declare-fun res!43215 () Bool)

(assert (=> d!16278 (=> (not res!43215) (not e!34082))))

(assert (=> d!16278 (= res!43215 (= (size!1073 (buf!1428 thiss!1379)) (size!1073 (buf!1428 (_2!2466 lt!80149)))))))

(declare-fun appendBit!0 (BitStream!1854 Bool) tuple2!4722)

(assert (=> d!16278 (= lt!80149 (appendBit!0 thiss!1379 lt!80155))))

(assert (=> d!16278 (= lt!80155 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1605 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!16278 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!16278 (= (appendBitFromByte!0 thiss!1379 (select (arr!1605 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!80148)))

(declare-fun b!51612 () Bool)

(declare-fun res!43208 () Bool)

(assert (=> b!51612 (=> (not res!43208) (not e!34084))))

(declare-fun lt!80151 () (_ BitVec 64))

(declare-fun lt!80147 () (_ BitVec 64))

(assert (=> b!51612 (= res!43208 (= (bitIndex!0 (size!1073 (buf!1428 (_2!2466 lt!80148))) (currentByte!2957 (_2!2466 lt!80148)) (currentBit!2952 (_2!2466 lt!80148))) (bvadd lt!80151 lt!80147)))))

(assert (=> b!51612 (or (not (= (bvand lt!80151 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!80147 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!80151 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!80151 lt!80147) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!51612 (= lt!80147 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!51612 (= lt!80151 (bitIndex!0 (size!1073 (buf!1428 thiss!1379)) (currentByte!2957 thiss!1379) (currentBit!2952 thiss!1379)))))

(declare-fun b!51613 () Bool)

(declare-fun res!43213 () Bool)

(assert (=> b!51613 (=> (not res!43213) (not e!34084))))

(assert (=> b!51613 (= res!43213 (isPrefixOf!0 thiss!1379 (_2!2466 lt!80148)))))

(declare-fun b!51614 () Bool)

(assert (=> b!51614 (= e!34083 (= (bitIndex!0 (size!1073 (buf!1428 (_1!2468 lt!80152))) (currentByte!2957 (_1!2468 lt!80152)) (currentBit!2952 (_1!2468 lt!80152))) (bitIndex!0 (size!1073 (buf!1428 (_2!2466 lt!80149))) (currentByte!2957 (_2!2466 lt!80149)) (currentBit!2952 (_2!2466 lt!80149)))))))

(assert (= (and d!16278 res!43215) b!51607))

(assert (= (and b!51607 res!43210) b!51610))

(assert (= (and b!51610 res!43214) b!51608))

(assert (= (and b!51608 res!43209) b!51614))

(assert (= (and d!16278 res!43211) b!51612))

(assert (= (and b!51612 res!43208) b!51613))

(assert (= (and b!51613 res!43213) b!51611))

(assert (= (and b!51611 res!43212) b!51609))

(declare-fun m!81361 () Bool)

(assert (=> b!51607 m!81361))

(assert (=> b!51607 m!81215))

(declare-fun m!81363 () Bool)

(assert (=> b!51613 m!81363))

(declare-fun m!81365 () Bool)

(assert (=> b!51614 m!81365))

(assert (=> b!51614 m!81361))

(declare-fun m!81367 () Bool)

(assert (=> b!51609 m!81367))

(declare-fun m!81369 () Bool)

(assert (=> b!51609 m!81369))

(declare-fun m!81371 () Bool)

(assert (=> b!51611 m!81371))

(declare-fun m!81373 () Bool)

(assert (=> b!51611 m!81373))

(declare-fun m!81375 () Bool)

(assert (=> b!51611 m!81375))

(declare-fun m!81377 () Bool)

(assert (=> b!51610 m!81377))

(assert (=> b!51612 m!81369))

(assert (=> b!51612 m!81215))

(declare-fun m!81379 () Bool)

(assert (=> d!16278 m!81379))

(declare-fun m!81381 () Bool)

(assert (=> d!16278 m!81381))

(declare-fun m!81383 () Bool)

(assert (=> d!16278 m!81383))

(declare-fun m!81385 () Bool)

(assert (=> b!51608 m!81385))

(assert (=> b!51608 m!81385))

(declare-fun m!81387 () Bool)

(assert (=> b!51608 m!81387))

(assert (=> b!51481 d!16278))

(declare-fun d!16280 () Bool)

(declare-fun res!43216 () Bool)

(declare-fun e!34086 () Bool)

(assert (=> d!16280 (=> (not res!43216) (not e!34086))))

(assert (=> d!16280 (= res!43216 (= (size!1073 (buf!1428 thiss!1379)) (size!1073 (buf!1428 (_2!2466 lt!79994)))))))

(assert (=> d!16280 (= (isPrefixOf!0 thiss!1379 (_2!2466 lt!79994)) e!34086)))

(declare-fun b!51615 () Bool)

(declare-fun res!43218 () Bool)

(assert (=> b!51615 (=> (not res!43218) (not e!34086))))

(assert (=> b!51615 (= res!43218 (bvsle (bitIndex!0 (size!1073 (buf!1428 thiss!1379)) (currentByte!2957 thiss!1379) (currentBit!2952 thiss!1379)) (bitIndex!0 (size!1073 (buf!1428 (_2!2466 lt!79994))) (currentByte!2957 (_2!2466 lt!79994)) (currentBit!2952 (_2!2466 lt!79994)))))))

(declare-fun b!51616 () Bool)

(declare-fun e!34085 () Bool)

(assert (=> b!51616 (= e!34086 e!34085)))

(declare-fun res!43217 () Bool)

(assert (=> b!51616 (=> res!43217 e!34085)))

(assert (=> b!51616 (= res!43217 (= (size!1073 (buf!1428 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!51617 () Bool)

(assert (=> b!51617 (= e!34085 (arrayBitRangesEq!0 (buf!1428 thiss!1379) (buf!1428 (_2!2466 lt!79994)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1073 (buf!1428 thiss!1379)) (currentByte!2957 thiss!1379) (currentBit!2952 thiss!1379))))))

(assert (= (and d!16280 res!43216) b!51615))

(assert (= (and b!51615 res!43218) b!51616))

(assert (= (and b!51616 (not res!43217)) b!51617))

(assert (=> b!51615 m!81215))

(assert (=> b!51615 m!81177))

(assert (=> b!51617 m!81215))

(assert (=> b!51617 m!81215))

(declare-fun m!81389 () Bool)

(assert (=> b!51617 m!81389))

(assert (=> b!51494 d!16280))

(declare-fun d!16282 () Bool)

(declare-fun res!43219 () Bool)

(declare-fun e!34088 () Bool)

(assert (=> d!16282 (=> (not res!43219) (not e!34088))))

(assert (=> d!16282 (= res!43219 (= (size!1073 (buf!1428 (_2!2466 lt!80013))) (size!1073 (buf!1428 (_2!2466 lt!79994)))))))

(assert (=> d!16282 (= (isPrefixOf!0 (_2!2466 lt!80013) (_2!2466 lt!79994)) e!34088)))

(declare-fun b!51618 () Bool)

(declare-fun res!43221 () Bool)

(assert (=> b!51618 (=> (not res!43221) (not e!34088))))

(assert (=> b!51618 (= res!43221 (bvsle (bitIndex!0 (size!1073 (buf!1428 (_2!2466 lt!80013))) (currentByte!2957 (_2!2466 lt!80013)) (currentBit!2952 (_2!2466 lt!80013))) (bitIndex!0 (size!1073 (buf!1428 (_2!2466 lt!79994))) (currentByte!2957 (_2!2466 lt!79994)) (currentBit!2952 (_2!2466 lt!79994)))))))

(declare-fun b!51619 () Bool)

(declare-fun e!34087 () Bool)

(assert (=> b!51619 (= e!34088 e!34087)))

(declare-fun res!43220 () Bool)

(assert (=> b!51619 (=> res!43220 e!34087)))

(assert (=> b!51619 (= res!43220 (= (size!1073 (buf!1428 (_2!2466 lt!80013))) #b00000000000000000000000000000000))))

(declare-fun b!51620 () Bool)

(assert (=> b!51620 (= e!34087 (arrayBitRangesEq!0 (buf!1428 (_2!2466 lt!80013)) (buf!1428 (_2!2466 lt!79994)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1073 (buf!1428 (_2!2466 lt!80013))) (currentByte!2957 (_2!2466 lt!80013)) (currentBit!2952 (_2!2466 lt!80013)))))))

(assert (= (and d!16282 res!43219) b!51618))

(assert (= (and b!51618 res!43221) b!51619))

(assert (= (and b!51619 (not res!43220)) b!51620))

(assert (=> b!51618 m!81201))

(assert (=> b!51618 m!81177))

(assert (=> b!51620 m!81201))

(assert (=> b!51620 m!81201))

(declare-fun m!81391 () Bool)

(assert (=> b!51620 m!81391))

(assert (=> b!51494 d!16282))

(declare-fun b!51637 () Bool)

(declare-fun res!43234 () Bool)

(declare-fun e!34095 () Bool)

(assert (=> b!51637 (=> (not res!43234) (not e!34095))))

(declare-fun lt!80277 () tuple2!4722)

(assert (=> b!51637 (= res!43234 (invariant!0 (currentBit!2952 (_2!2466 lt!80277)) (currentByte!2957 (_2!2466 lt!80277)) (size!1073 (buf!1428 (_2!2466 lt!80277)))))))

(declare-fun b!51638 () Bool)

(declare-fun e!34097 () tuple2!4722)

(declare-fun Unit!3549 () Unit!3545)

(assert (=> b!51638 (= e!34097 (tuple2!4723 Unit!3549 (_2!2466 lt!80013)))))

(assert (=> b!51638 (= (size!1073 (buf!1428 (_2!2466 lt!80013))) (size!1073 (buf!1428 (_2!2466 lt!80013))))))

(declare-fun lt!80273 () Unit!3545)

(declare-fun Unit!3550 () Unit!3545)

(assert (=> b!51638 (= lt!80273 Unit!3550)))

(declare-fun call!661 () tuple2!4724)

(declare-fun checkByteArrayBitContent!0 (BitStream!1854 array!2355 array!2355 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!51638 (checkByteArrayBitContent!0 (_2!2466 lt!80013) srcBuffer!2 (_1!2472 (readBits!0 (_1!2467 call!661) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun c!3681 () Bool)

(declare-fun bm!658 () Bool)

(declare-fun lt!80281 () tuple2!4722)

(assert (=> bm!658 (= call!661 (reader!0 (_2!2466 lt!80013) (ite c!3681 (_2!2466 lt!80281) (_2!2466 lt!80013))))))

(declare-fun b!51639 () Bool)

(declare-fun e!34096 () Bool)

(declare-fun lt!80284 () (_ BitVec 64))

(assert (=> b!51639 (= e!34096 (validate_offset_bits!1 ((_ sign_extend 32) (size!1073 (buf!1428 (_2!2466 lt!80013)))) ((_ sign_extend 32) (currentByte!2957 (_2!2466 lt!80013))) ((_ sign_extend 32) (currentBit!2952 (_2!2466 lt!80013))) lt!80284))))

(declare-fun b!51641 () Bool)

(declare-fun res!43238 () Bool)

(assert (=> b!51641 (=> (not res!43238) (not e!34095))))

(assert (=> b!51641 (= res!43238 (= (size!1073 (buf!1428 (_2!2466 lt!80013))) (size!1073 (buf!1428 (_2!2466 lt!80277)))))))

(declare-fun b!51642 () Bool)

(declare-fun Unit!3551 () Unit!3545)

(assert (=> b!51642 (= e!34097 (tuple2!4723 Unit!3551 (_2!2466 lt!80281)))))

(declare-fun lt!80271 () tuple2!4722)

(assert (=> b!51642 (= lt!80271 (appendBitFromByte!0 (_2!2466 lt!80013) (select (arr!1605 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!80251 () (_ BitVec 64))

(assert (=> b!51642 (= lt!80251 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!80287 () (_ BitVec 64))

(assert (=> b!51642 (= lt!80287 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!80245 () Unit!3545)

(assert (=> b!51642 (= lt!80245 (validateOffsetBitsIneqLemma!0 (_2!2466 lt!80013) (_2!2466 lt!80271) lt!80251 lt!80287))))

(assert (=> b!51642 (validate_offset_bits!1 ((_ sign_extend 32) (size!1073 (buf!1428 (_2!2466 lt!80271)))) ((_ sign_extend 32) (currentByte!2957 (_2!2466 lt!80271))) ((_ sign_extend 32) (currentBit!2952 (_2!2466 lt!80271))) (bvsub lt!80251 lt!80287))))

(declare-fun lt!80260 () Unit!3545)

(assert (=> b!51642 (= lt!80260 lt!80245)))

(declare-fun lt!80278 () tuple2!4724)

(assert (=> b!51642 (= lt!80278 (reader!0 (_2!2466 lt!80013) (_2!2466 lt!80271)))))

(declare-fun lt!80244 () (_ BitVec 64))

(assert (=> b!51642 (= lt!80244 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!80256 () Unit!3545)

(assert (=> b!51642 (= lt!80256 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2466 lt!80013) (buf!1428 (_2!2466 lt!80271)) lt!80244))))

(assert (=> b!51642 (validate_offset_bits!1 ((_ sign_extend 32) (size!1073 (buf!1428 (_2!2466 lt!80271)))) ((_ sign_extend 32) (currentByte!2957 (_2!2466 lt!80013))) ((_ sign_extend 32) (currentBit!2952 (_2!2466 lt!80013))) lt!80244)))

(declare-fun lt!80272 () Unit!3545)

(assert (=> b!51642 (= lt!80272 lt!80256)))

(assert (=> b!51642 (= (head!387 (byteArrayBitContentToList!0 (_2!2466 lt!80271) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!387 (bitStreamReadBitsIntoList!0 (_2!2466 lt!80271) (_1!2467 lt!80278) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!80270 () Unit!3545)

(declare-fun Unit!3552 () Unit!3545)

(assert (=> b!51642 (= lt!80270 Unit!3552)))

(assert (=> b!51642 (= lt!80281 (appendBitsMSBFirstLoop!0 (_2!2466 lt!80271) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!80266 () Unit!3545)

(assert (=> b!51642 (= lt!80266 (lemmaIsPrefixTransitive!0 (_2!2466 lt!80013) (_2!2466 lt!80271) (_2!2466 lt!80281)))))

(assert (=> b!51642 (isPrefixOf!0 (_2!2466 lt!80013) (_2!2466 lt!80281))))

(declare-fun lt!80262 () Unit!3545)

(assert (=> b!51642 (= lt!80262 lt!80266)))

(assert (=> b!51642 (= (size!1073 (buf!1428 (_2!2466 lt!80281))) (size!1073 (buf!1428 (_2!2466 lt!80013))))))

(declare-fun lt!80280 () Unit!3545)

(declare-fun Unit!3553 () Unit!3545)

(assert (=> b!51642 (= lt!80280 Unit!3553)))

(assert (=> b!51642 (= (bitIndex!0 (size!1073 (buf!1428 (_2!2466 lt!80281))) (currentByte!2957 (_2!2466 lt!80281)) (currentBit!2952 (_2!2466 lt!80281))) (bvsub (bvadd (bitIndex!0 (size!1073 (buf!1428 (_2!2466 lt!80013))) (currentByte!2957 (_2!2466 lt!80013)) (currentBit!2952 (_2!2466 lt!80013))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!80279 () Unit!3545)

(declare-fun Unit!3554 () Unit!3545)

(assert (=> b!51642 (= lt!80279 Unit!3554)))

(assert (=> b!51642 (= (bitIndex!0 (size!1073 (buf!1428 (_2!2466 lt!80281))) (currentByte!2957 (_2!2466 lt!80281)) (currentBit!2952 (_2!2466 lt!80281))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1073 (buf!1428 (_2!2466 lt!80271))) (currentByte!2957 (_2!2466 lt!80271)) (currentBit!2952 (_2!2466 lt!80271))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!80265 () Unit!3545)

(declare-fun Unit!3555 () Unit!3545)

(assert (=> b!51642 (= lt!80265 Unit!3555)))

(declare-fun lt!80246 () tuple2!4724)

(assert (=> b!51642 (= lt!80246 call!661)))

(declare-fun lt!80275 () (_ BitVec 64))

(assert (=> b!51642 (= lt!80275 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!80250 () Unit!3545)

(assert (=> b!51642 (= lt!80250 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2466 lt!80013) (buf!1428 (_2!2466 lt!80281)) lt!80275))))

(assert (=> b!51642 (validate_offset_bits!1 ((_ sign_extend 32) (size!1073 (buf!1428 (_2!2466 lt!80281)))) ((_ sign_extend 32) (currentByte!2957 (_2!2466 lt!80013))) ((_ sign_extend 32) (currentBit!2952 (_2!2466 lt!80013))) lt!80275)))

(declare-fun lt!80257 () Unit!3545)

(assert (=> b!51642 (= lt!80257 lt!80250)))

(declare-fun lt!80253 () tuple2!4724)

(assert (=> b!51642 (= lt!80253 (reader!0 (_2!2466 lt!80271) (_2!2466 lt!80281)))))

(declare-fun lt!80255 () (_ BitVec 64))

(assert (=> b!51642 (= lt!80255 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!80269 () Unit!3545)

(assert (=> b!51642 (= lt!80269 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2466 lt!80271) (buf!1428 (_2!2466 lt!80281)) lt!80255))))

(assert (=> b!51642 (validate_offset_bits!1 ((_ sign_extend 32) (size!1073 (buf!1428 (_2!2466 lt!80281)))) ((_ sign_extend 32) (currentByte!2957 (_2!2466 lt!80271))) ((_ sign_extend 32) (currentBit!2952 (_2!2466 lt!80271))) lt!80255)))

(declare-fun lt!80268 () Unit!3545)

(assert (=> b!51642 (= lt!80268 lt!80269)))

(declare-fun lt!80286 () List!568)

(assert (=> b!51642 (= lt!80286 (byteArrayBitContentToList!0 (_2!2466 lt!80281) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!80249 () List!568)

(assert (=> b!51642 (= lt!80249 (byteArrayBitContentToList!0 (_2!2466 lt!80281) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!80258 () List!568)

(assert (=> b!51642 (= lt!80258 (bitStreamReadBitsIntoList!0 (_2!2466 lt!80281) (_1!2467 lt!80246) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!80283 () List!568)

(assert (=> b!51642 (= lt!80283 (bitStreamReadBitsIntoList!0 (_2!2466 lt!80281) (_1!2467 lt!80253) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!80259 () (_ BitVec 64))

(assert (=> b!51642 (= lt!80259 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!80261 () Unit!3545)

(assert (=> b!51642 (= lt!80261 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2466 lt!80281) (_2!2466 lt!80281) (_1!2467 lt!80246) (_1!2467 lt!80253) lt!80259 lt!80258))))

(assert (=> b!51642 (= (bitStreamReadBitsIntoList!0 (_2!2466 lt!80281) (_1!2467 lt!80253) (bvsub lt!80259 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!254 lt!80258))))

(declare-fun lt!80254 () Unit!3545)

(assert (=> b!51642 (= lt!80254 lt!80261)))

(declare-fun lt!80248 () Unit!3545)

(declare-fun lt!80285 () (_ BitVec 64))

(assert (=> b!51642 (= lt!80248 (arrayBitRangesEqImpliesEq!0 (buf!1428 (_2!2466 lt!80271)) (buf!1428 (_2!2466 lt!80281)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!80285 (bitIndex!0 (size!1073 (buf!1428 (_2!2466 lt!80271))) (currentByte!2957 (_2!2466 lt!80271)) (currentBit!2952 (_2!2466 lt!80271)))))))

(assert (=> b!51642 (= (bitAt!0 (buf!1428 (_2!2466 lt!80271)) lt!80285) (bitAt!0 (buf!1428 (_2!2466 lt!80281)) lt!80285))))

(declare-fun lt!80276 () Unit!3545)

(assert (=> b!51642 (= lt!80276 lt!80248)))

(declare-fun b!51643 () Bool)

(declare-fun lt!80264 () tuple2!4724)

(assert (=> b!51643 (= e!34095 (= (bitStreamReadBitsIntoList!0 (_2!2466 lt!80277) (_1!2467 lt!80264) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2466 lt!80277) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!51643 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!51643 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!80267 () Unit!3545)

(declare-fun lt!80247 () Unit!3545)

(assert (=> b!51643 (= lt!80267 lt!80247)))

(assert (=> b!51643 (validate_offset_bits!1 ((_ sign_extend 32) (size!1073 (buf!1428 (_2!2466 lt!80277)))) ((_ sign_extend 32) (currentByte!2957 (_2!2466 lt!80013))) ((_ sign_extend 32) (currentBit!2952 (_2!2466 lt!80013))) lt!80284)))

(assert (=> b!51643 (= lt!80247 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2466 lt!80013) (buf!1428 (_2!2466 lt!80277)) lt!80284))))

(assert (=> b!51643 e!34096))

(declare-fun res!43235 () Bool)

(assert (=> b!51643 (=> (not res!43235) (not e!34096))))

(assert (=> b!51643 (= res!43235 (and (= (size!1073 (buf!1428 (_2!2466 lt!80013))) (size!1073 (buf!1428 (_2!2466 lt!80277)))) (bvsge lt!80284 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!51643 (= lt!80284 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!51643 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!51643 (= lt!80264 (reader!0 (_2!2466 lt!80013) (_2!2466 lt!80277)))))

(declare-fun b!51644 () Bool)

(declare-fun res!43237 () Bool)

(assert (=> b!51644 (=> (not res!43237) (not e!34095))))

(assert (=> b!51644 (= res!43237 (isPrefixOf!0 (_2!2466 lt!80013) (_2!2466 lt!80277)))))

(declare-fun d!16284 () Bool)

(assert (=> d!16284 e!34095))

(declare-fun res!43236 () Bool)

(assert (=> d!16284 (=> (not res!43236) (not e!34095))))

(declare-fun lt!80282 () (_ BitVec 64))

(assert (=> d!16284 (= res!43236 (= (bitIndex!0 (size!1073 (buf!1428 (_2!2466 lt!80277))) (currentByte!2957 (_2!2466 lt!80277)) (currentBit!2952 (_2!2466 lt!80277))) (bvsub lt!80282 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!16284 (or (= (bvand lt!80282 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!80282 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!80282 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!80263 () (_ BitVec 64))

(assert (=> d!16284 (= lt!80282 (bvadd lt!80263 to!314))))

(assert (=> d!16284 (or (not (= (bvand lt!80263 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!80263 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!80263 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!16284 (= lt!80263 (bitIndex!0 (size!1073 (buf!1428 (_2!2466 lt!80013))) (currentByte!2957 (_2!2466 lt!80013)) (currentBit!2952 (_2!2466 lt!80013))))))

(assert (=> d!16284 (= lt!80277 e!34097)))

(assert (=> d!16284 (= c!3681 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!80274 () Unit!3545)

(declare-fun lt!80252 () Unit!3545)

(assert (=> d!16284 (= lt!80274 lt!80252)))

(assert (=> d!16284 (isPrefixOf!0 (_2!2466 lt!80013) (_2!2466 lt!80013))))

(assert (=> d!16284 (= lt!80252 (lemmaIsPrefixRefl!0 (_2!2466 lt!80013)))))

(assert (=> d!16284 (= lt!80285 (bitIndex!0 (size!1073 (buf!1428 (_2!2466 lt!80013))) (currentByte!2957 (_2!2466 lt!80013)) (currentBit!2952 (_2!2466 lt!80013))))))

(assert (=> d!16284 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!16284 (= (appendBitsMSBFirstLoop!0 (_2!2466 lt!80013) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!80277)))

(declare-fun b!51640 () Bool)

(declare-fun res!43239 () Bool)

(assert (=> b!51640 (=> (not res!43239) (not e!34095))))

(assert (=> b!51640 (= res!43239 (= (size!1073 (buf!1428 (_2!2466 lt!80277))) (size!1073 (buf!1428 (_2!2466 lt!80013)))))))

(assert (= (and d!16284 c!3681) b!51642))

(assert (= (and d!16284 (not c!3681)) b!51638))

(assert (= (or b!51642 b!51638) bm!658))

(assert (= (and d!16284 res!43236) b!51637))

(assert (= (and b!51637 res!43234) b!51641))

(assert (= (and b!51641 res!43238) b!51644))

(assert (= (and b!51644 res!43237) b!51640))

(assert (= (and b!51640 res!43239) b!51643))

(assert (= (and b!51643 res!43235) b!51639))

(declare-fun m!81393 () Bool)

(assert (=> b!51643 m!81393))

(declare-fun m!81395 () Bool)

(assert (=> b!51643 m!81395))

(declare-fun m!81397 () Bool)

(assert (=> b!51643 m!81397))

(declare-fun m!81399 () Bool)

(assert (=> b!51643 m!81399))

(declare-fun m!81401 () Bool)

(assert (=> b!51643 m!81401))

(declare-fun m!81403 () Bool)

(assert (=> b!51644 m!81403))

(declare-fun m!81405 () Bool)

(assert (=> b!51642 m!81405))

(declare-fun m!81407 () Bool)

(assert (=> b!51642 m!81407))

(declare-fun m!81409 () Bool)

(assert (=> b!51642 m!81409))

(declare-fun m!81411 () Bool)

(assert (=> b!51642 m!81411))

(declare-fun m!81413 () Bool)

(assert (=> b!51642 m!81413))

(declare-fun m!81415 () Bool)

(assert (=> b!51642 m!81415))

(declare-fun m!81417 () Bool)

(assert (=> b!51642 m!81417))

(declare-fun m!81419 () Bool)

(assert (=> b!51642 m!81419))

(declare-fun m!81421 () Bool)

(assert (=> b!51642 m!81421))

(declare-fun m!81423 () Bool)

(assert (=> b!51642 m!81423))

(declare-fun m!81425 () Bool)

(assert (=> b!51642 m!81425))

(declare-fun m!81427 () Bool)

(assert (=> b!51642 m!81427))

(assert (=> b!51642 m!81201))

(declare-fun m!81429 () Bool)

(assert (=> b!51642 m!81429))

(declare-fun m!81431 () Bool)

(assert (=> b!51642 m!81431))

(assert (=> b!51642 m!81425))

(declare-fun m!81433 () Bool)

(assert (=> b!51642 m!81433))

(declare-fun m!81435 () Bool)

(assert (=> b!51642 m!81435))

(declare-fun m!81437 () Bool)

(assert (=> b!51642 m!81437))

(declare-fun m!81439 () Bool)

(assert (=> b!51642 m!81439))

(declare-fun m!81441 () Bool)

(assert (=> b!51642 m!81441))

(declare-fun m!81443 () Bool)

(assert (=> b!51642 m!81443))

(declare-fun m!81445 () Bool)

(assert (=> b!51642 m!81445))

(declare-fun m!81447 () Bool)

(assert (=> b!51642 m!81447))

(declare-fun m!81449 () Bool)

(assert (=> b!51642 m!81449))

(declare-fun m!81451 () Bool)

(assert (=> b!51642 m!81451))

(declare-fun m!81453 () Bool)

(assert (=> b!51642 m!81453))

(declare-fun m!81455 () Bool)

(assert (=> b!51642 m!81455))

(assert (=> b!51642 m!81409))

(declare-fun m!81457 () Bool)

(assert (=> b!51642 m!81457))

(declare-fun m!81459 () Bool)

(assert (=> b!51642 m!81459))

(assert (=> b!51642 m!81411))

(declare-fun m!81461 () Bool)

(assert (=> b!51642 m!81461))

(assert (=> b!51642 m!81435))

(declare-fun m!81463 () Bool)

(assert (=> b!51642 m!81463))

(declare-fun m!81465 () Bool)

(assert (=> b!51642 m!81465))

(declare-fun m!81467 () Bool)

(assert (=> d!16284 m!81467))

(assert (=> d!16284 m!81201))

(declare-fun m!81469 () Bool)

(assert (=> d!16284 m!81469))

(declare-fun m!81471 () Bool)

(assert (=> d!16284 m!81471))

(declare-fun m!81473 () Bool)

(assert (=> b!51639 m!81473))

(declare-fun m!81475 () Bool)

(assert (=> b!51638 m!81475))

(declare-fun m!81477 () Bool)

(assert (=> b!51638 m!81477))

(declare-fun m!81479 () Bool)

(assert (=> b!51637 m!81479))

(declare-fun m!81481 () Bool)

(assert (=> bm!658 m!81481))

(assert (=> b!51494 d!16284))

(declare-fun d!16286 () Bool)

(assert (=> d!16286 (validate_offset_bits!1 ((_ sign_extend 32) (size!1073 (buf!1428 (_2!2466 lt!80013)))) ((_ sign_extend 32) (currentByte!2957 thiss!1379)) ((_ sign_extend 32) (currentBit!2952 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!80290 () Unit!3545)

(declare-fun choose!9 (BitStream!1854 array!2355 (_ BitVec 64) BitStream!1854) Unit!3545)

(assert (=> d!16286 (= lt!80290 (choose!9 thiss!1379 (buf!1428 (_2!2466 lt!80013)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1855 (buf!1428 (_2!2466 lt!80013)) (currentByte!2957 thiss!1379) (currentBit!2952 thiss!1379))))))

(assert (=> d!16286 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1428 (_2!2466 lt!80013)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!80290)))

(declare-fun bs!4082 () Bool)

(assert (= bs!4082 d!16286))

(assert (=> bs!4082 m!81225))

(declare-fun m!81483 () Bool)

(assert (=> bs!4082 m!81483))

(assert (=> b!51494 d!16286))

(declare-fun b!51655 () Bool)

(declare-fun e!34103 () Unit!3545)

(declare-fun Unit!3556 () Unit!3545)

(assert (=> b!51655 (= e!34103 Unit!3556)))

(declare-fun b!51656 () Bool)

(declare-fun lt!80340 () Unit!3545)

(assert (=> b!51656 (= e!34103 lt!80340)))

(declare-fun lt!80334 () (_ BitVec 64))

(assert (=> b!51656 (= lt!80334 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80332 () (_ BitVec 64))

(assert (=> b!51656 (= lt!80332 (bitIndex!0 (size!1073 (buf!1428 thiss!1379)) (currentByte!2957 thiss!1379) (currentBit!2952 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2355 array!2355 (_ BitVec 64) (_ BitVec 64)) Unit!3545)

(assert (=> b!51656 (= lt!80340 (arrayBitRangesEqSymmetric!0 (buf!1428 thiss!1379) (buf!1428 (_2!2466 lt!80013)) lt!80334 lt!80332))))

(assert (=> b!51656 (arrayBitRangesEq!0 (buf!1428 (_2!2466 lt!80013)) (buf!1428 thiss!1379) lt!80334 lt!80332)))

(declare-fun e!34102 () Bool)

(declare-fun lt!80348 () (_ BitVec 64))

(declare-fun b!51657 () Bool)

(declare-fun lt!80347 () tuple2!4724)

(declare-fun lt!80344 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1854 (_ BitVec 64)) BitStream!1854)

(assert (=> b!51657 (= e!34102 (= (_1!2467 lt!80347) (withMovedBitIndex!0 (_2!2467 lt!80347) (bvsub lt!80348 lt!80344))))))

(assert (=> b!51657 (or (= (bvand lt!80348 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!80344 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!80348 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!80348 lt!80344) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!51657 (= lt!80344 (bitIndex!0 (size!1073 (buf!1428 (_2!2466 lt!80013))) (currentByte!2957 (_2!2466 lt!80013)) (currentBit!2952 (_2!2466 lt!80013))))))

(assert (=> b!51657 (= lt!80348 (bitIndex!0 (size!1073 (buf!1428 thiss!1379)) (currentByte!2957 thiss!1379) (currentBit!2952 thiss!1379)))))

(declare-fun b!51658 () Bool)

(declare-fun res!43246 () Bool)

(assert (=> b!51658 (=> (not res!43246) (not e!34102))))

(assert (=> b!51658 (= res!43246 (isPrefixOf!0 (_2!2467 lt!80347) (_2!2466 lt!80013)))))

(declare-fun d!16288 () Bool)

(assert (=> d!16288 e!34102))

(declare-fun res!43247 () Bool)

(assert (=> d!16288 (=> (not res!43247) (not e!34102))))

(assert (=> d!16288 (= res!43247 (isPrefixOf!0 (_1!2467 lt!80347) (_2!2467 lt!80347)))))

(declare-fun lt!80342 () BitStream!1854)

(assert (=> d!16288 (= lt!80347 (tuple2!4725 lt!80342 (_2!2466 lt!80013)))))

(declare-fun lt!80331 () Unit!3545)

(declare-fun lt!80346 () Unit!3545)

(assert (=> d!16288 (= lt!80331 lt!80346)))

(assert (=> d!16288 (isPrefixOf!0 lt!80342 (_2!2466 lt!80013))))

(assert (=> d!16288 (= lt!80346 (lemmaIsPrefixTransitive!0 lt!80342 (_2!2466 lt!80013) (_2!2466 lt!80013)))))

(declare-fun lt!80341 () Unit!3545)

(declare-fun lt!80339 () Unit!3545)

(assert (=> d!16288 (= lt!80341 lt!80339)))

(assert (=> d!16288 (isPrefixOf!0 lt!80342 (_2!2466 lt!80013))))

(assert (=> d!16288 (= lt!80339 (lemmaIsPrefixTransitive!0 lt!80342 thiss!1379 (_2!2466 lt!80013)))))

(declare-fun lt!80338 () Unit!3545)

(assert (=> d!16288 (= lt!80338 e!34103)))

(declare-fun c!3684 () Bool)

(assert (=> d!16288 (= c!3684 (not (= (size!1073 (buf!1428 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!80350 () Unit!3545)

(declare-fun lt!80335 () Unit!3545)

(assert (=> d!16288 (= lt!80350 lt!80335)))

(assert (=> d!16288 (isPrefixOf!0 (_2!2466 lt!80013) (_2!2466 lt!80013))))

(assert (=> d!16288 (= lt!80335 (lemmaIsPrefixRefl!0 (_2!2466 lt!80013)))))

(declare-fun lt!80336 () Unit!3545)

(declare-fun lt!80349 () Unit!3545)

(assert (=> d!16288 (= lt!80336 lt!80349)))

(assert (=> d!16288 (= lt!80349 (lemmaIsPrefixRefl!0 (_2!2466 lt!80013)))))

(declare-fun lt!80343 () Unit!3545)

(declare-fun lt!80337 () Unit!3545)

(assert (=> d!16288 (= lt!80343 lt!80337)))

(assert (=> d!16288 (isPrefixOf!0 lt!80342 lt!80342)))

(assert (=> d!16288 (= lt!80337 (lemmaIsPrefixRefl!0 lt!80342))))

(declare-fun lt!80345 () Unit!3545)

(declare-fun lt!80333 () Unit!3545)

(assert (=> d!16288 (= lt!80345 lt!80333)))

(assert (=> d!16288 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!16288 (= lt!80333 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!16288 (= lt!80342 (BitStream!1855 (buf!1428 (_2!2466 lt!80013)) (currentByte!2957 thiss!1379) (currentBit!2952 thiss!1379)))))

(assert (=> d!16288 (isPrefixOf!0 thiss!1379 (_2!2466 lt!80013))))

(assert (=> d!16288 (= (reader!0 thiss!1379 (_2!2466 lt!80013)) lt!80347)))

(declare-fun b!51659 () Bool)

(declare-fun res!43248 () Bool)

(assert (=> b!51659 (=> (not res!43248) (not e!34102))))

(assert (=> b!51659 (= res!43248 (isPrefixOf!0 (_1!2467 lt!80347) thiss!1379))))

(assert (= (and d!16288 c!3684) b!51656))

(assert (= (and d!16288 (not c!3684)) b!51655))

(assert (= (and d!16288 res!43247) b!51659))

(assert (= (and b!51659 res!43248) b!51658))

(assert (= (and b!51658 res!43246) b!51657))

(declare-fun m!81485 () Bool)

(assert (=> b!51659 m!81485))

(declare-fun m!81487 () Bool)

(assert (=> d!16288 m!81487))

(declare-fun m!81489 () Bool)

(assert (=> d!16288 m!81489))

(assert (=> d!16288 m!81469))

(assert (=> d!16288 m!81211))

(declare-fun m!81491 () Bool)

(assert (=> d!16288 m!81491))

(declare-fun m!81493 () Bool)

(assert (=> d!16288 m!81493))

(declare-fun m!81495 () Bool)

(assert (=> d!16288 m!81495))

(assert (=> d!16288 m!81213))

(assert (=> d!16288 m!81471))

(declare-fun m!81497 () Bool)

(assert (=> d!16288 m!81497))

(assert (=> d!16288 m!81179))

(assert (=> b!51656 m!81215))

(declare-fun m!81499 () Bool)

(assert (=> b!51656 m!81499))

(declare-fun m!81501 () Bool)

(assert (=> b!51656 m!81501))

(declare-fun m!81503 () Bool)

(assert (=> b!51657 m!81503))

(assert (=> b!51657 m!81201))

(assert (=> b!51657 m!81215))

(declare-fun m!81505 () Bool)

(assert (=> b!51658 m!81505))

(assert (=> b!51494 d!16288))

(declare-fun d!16290 () Bool)

(assert (=> d!16290 (isPrefixOf!0 thiss!1379 (_2!2466 lt!79994))))

(declare-fun lt!80353 () Unit!3545)

(declare-fun choose!30 (BitStream!1854 BitStream!1854 BitStream!1854) Unit!3545)

(assert (=> d!16290 (= lt!80353 (choose!30 thiss!1379 (_2!2466 lt!80013) (_2!2466 lt!79994)))))

(assert (=> d!16290 (isPrefixOf!0 thiss!1379 (_2!2466 lt!80013))))

(assert (=> d!16290 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2466 lt!80013) (_2!2466 lt!79994)) lt!80353)))

(declare-fun bs!4083 () Bool)

(assert (= bs!4083 d!16290))

(assert (=> bs!4083 m!81219))

(declare-fun m!81507 () Bool)

(assert (=> bs!4083 m!81507))

(assert (=> bs!4083 m!81179))

(assert (=> b!51494 d!16290))

(declare-fun d!16292 () Bool)

(assert (=> d!16292 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1073 (buf!1428 (_2!2466 lt!80013)))) ((_ sign_extend 32) (currentByte!2957 thiss!1379)) ((_ sign_extend 32) (currentBit!2952 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1073 (buf!1428 (_2!2466 lt!80013)))) ((_ sign_extend 32) (currentByte!2957 thiss!1379)) ((_ sign_extend 32) (currentBit!2952 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4084 () Bool)

(assert (= bs!4084 d!16292))

(declare-fun m!81509 () Bool)

(assert (=> bs!4084 m!81509))

(assert (=> b!51494 d!16292))

(declare-fun d!16294 () Bool)

(assert (=> d!16294 (= (tail!254 lt!80016) (t!1318 lt!80016))))

(assert (=> b!51483 d!16294))

(declare-fun d!16296 () Bool)

(declare-fun e!34106 () Bool)

(assert (=> d!16296 e!34106))

(declare-fun res!43251 () Bool)

(assert (=> d!16296 (=> (not res!43251) (not e!34106))))

(declare-fun lt!80359 () (_ BitVec 64))

(assert (=> d!16296 (= res!43251 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!80359 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!80359) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!16296 (= lt!80359 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!80358 () Unit!3545)

(declare-fun choose!42 (BitStream!1854 BitStream!1854 BitStream!1854 BitStream!1854 (_ BitVec 64) List!568) Unit!3545)

(assert (=> d!16296 (= lt!80358 (choose!42 (_2!2466 lt!79994) (_2!2466 lt!79994) (_1!2467 lt!79995) (_1!2467 lt!80003) (bvsub to!314 i!635) lt!80016))))

(assert (=> d!16296 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!16296 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2466 lt!79994) (_2!2466 lt!79994) (_1!2467 lt!79995) (_1!2467 lt!80003) (bvsub to!314 i!635) lt!80016) lt!80358)))

(declare-fun b!51662 () Bool)

(assert (=> b!51662 (= e!34106 (= (bitStreamReadBitsIntoList!0 (_2!2466 lt!79994) (_1!2467 lt!80003) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!254 lt!80016)))))

(assert (= (and d!16296 res!43251) b!51662))

(declare-fun m!81511 () Bool)

(assert (=> d!16296 m!81511))

(declare-fun m!81513 () Bool)

(assert (=> b!51662 m!81513))

(assert (=> b!51662 m!81149))

(assert (=> b!51483 d!16296))

(declare-fun d!16298 () Bool)

(assert (=> d!16298 (= (bitAt!0 (buf!1428 (_2!2466 lt!80013)) lt!79999) (not (= (bvand ((_ sign_extend 24) (select (arr!1605 (buf!1428 (_2!2466 lt!80013))) ((_ extract 31 0) (bvsdiv lt!79999 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!79999 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!4085 () Bool)

(assert (= bs!4085 d!16298))

(declare-fun m!81515 () Bool)

(assert (=> bs!4085 m!81515))

(declare-fun m!81517 () Bool)

(assert (=> bs!4085 m!81517))

(assert (=> b!51493 d!16298))

(declare-fun d!16300 () Bool)

(assert (=> d!16300 (= (invariant!0 (currentBit!2952 (_2!2466 lt!80013)) (currentByte!2957 (_2!2466 lt!80013)) (size!1073 (buf!1428 (_2!2466 lt!80013)))) (and (bvsge (currentBit!2952 (_2!2466 lt!80013)) #b00000000000000000000000000000000) (bvslt (currentBit!2952 (_2!2466 lt!80013)) #b00000000000000000000000000001000) (bvsge (currentByte!2957 (_2!2466 lt!80013)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2957 (_2!2466 lt!80013)) (size!1073 (buf!1428 (_2!2466 lt!80013)))) (and (= (currentBit!2952 (_2!2466 lt!80013)) #b00000000000000000000000000000000) (= (currentByte!2957 (_2!2466 lt!80013)) (size!1073 (buf!1428 (_2!2466 lt!80013))))))))))

(assert (=> b!51490 d!16300))

(declare-fun d!16302 () Bool)

(assert (=> d!16302 (= (invariant!0 (currentBit!2952 (_2!2466 lt!79994)) (currentByte!2957 (_2!2466 lt!79994)) (size!1073 (buf!1428 (_2!2466 lt!79994)))) (and (bvsge (currentBit!2952 (_2!2466 lt!79994)) #b00000000000000000000000000000000) (bvslt (currentBit!2952 (_2!2466 lt!79994)) #b00000000000000000000000000001000) (bvsge (currentByte!2957 (_2!2466 lt!79994)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2957 (_2!2466 lt!79994)) (size!1073 (buf!1428 (_2!2466 lt!79994)))) (and (= (currentBit!2952 (_2!2466 lt!79994)) #b00000000000000000000000000000000) (= (currentByte!2957 (_2!2466 lt!79994)) (size!1073 (buf!1428 (_2!2466 lt!79994))))))))))

(assert (=> b!51500 d!16302))

(declare-fun d!16304 () Bool)

(assert (=> d!16304 (= (array_inv!980 srcBuffer!2) (bvsge (size!1073 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!10162 d!16304))

(declare-fun d!16306 () Bool)

(assert (=> d!16306 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2952 thiss!1379) (currentByte!2957 thiss!1379) (size!1073 (buf!1428 thiss!1379))))))

(declare-fun bs!4086 () Bool)

(assert (= bs!4086 d!16306))

(assert (=> bs!4086 m!81351))

(assert (=> start!10162 d!16306))

(declare-fun d!16308 () Bool)

(declare-fun e!34107 () Bool)

(assert (=> d!16308 e!34107))

(declare-fun res!43253 () Bool)

(assert (=> d!16308 (=> (not res!43253) (not e!34107))))

(declare-fun lt!80361 () (_ BitVec 64))

(declare-fun lt!80363 () (_ BitVec 64))

(declare-fun lt!80364 () (_ BitVec 64))

(assert (=> d!16308 (= res!43253 (= lt!80361 (bvsub lt!80363 lt!80364)))))

(assert (=> d!16308 (or (= (bvand lt!80363 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!80364 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!80363 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!80363 lt!80364) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!16308 (= lt!80364 (remainingBits!0 ((_ sign_extend 32) (size!1073 (buf!1428 (_2!2466 lt!80013)))) ((_ sign_extend 32) (currentByte!2957 (_2!2466 lt!80013))) ((_ sign_extend 32) (currentBit!2952 (_2!2466 lt!80013)))))))

(declare-fun lt!80362 () (_ BitVec 64))

(declare-fun lt!80365 () (_ BitVec 64))

(assert (=> d!16308 (= lt!80363 (bvmul lt!80362 lt!80365))))

(assert (=> d!16308 (or (= lt!80362 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!80365 (bvsdiv (bvmul lt!80362 lt!80365) lt!80362)))))

(assert (=> d!16308 (= lt!80365 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!16308 (= lt!80362 ((_ sign_extend 32) (size!1073 (buf!1428 (_2!2466 lt!80013)))))))

(assert (=> d!16308 (= lt!80361 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2957 (_2!2466 lt!80013))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2952 (_2!2466 lt!80013)))))))

(assert (=> d!16308 (invariant!0 (currentBit!2952 (_2!2466 lt!80013)) (currentByte!2957 (_2!2466 lt!80013)) (size!1073 (buf!1428 (_2!2466 lt!80013))))))

(assert (=> d!16308 (= (bitIndex!0 (size!1073 (buf!1428 (_2!2466 lt!80013))) (currentByte!2957 (_2!2466 lt!80013)) (currentBit!2952 (_2!2466 lt!80013))) lt!80361)))

(declare-fun b!51663 () Bool)

(declare-fun res!43252 () Bool)

(assert (=> b!51663 (=> (not res!43252) (not e!34107))))

(assert (=> b!51663 (= res!43252 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!80361))))

(declare-fun b!51664 () Bool)

(declare-fun lt!80360 () (_ BitVec 64))

(assert (=> b!51664 (= e!34107 (bvsle lt!80361 (bvmul lt!80360 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!51664 (or (= lt!80360 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!80360 #b0000000000000000000000000000000000000000000000000000000000001000) lt!80360)))))

(assert (=> b!51664 (= lt!80360 ((_ sign_extend 32) (size!1073 (buf!1428 (_2!2466 lt!80013)))))))

(assert (= (and d!16308 res!43253) b!51663))

(assert (= (and b!51663 res!43252) b!51664))

(assert (=> d!16308 m!81355))

(assert (=> d!16308 m!81195))

(assert (=> b!51489 d!16308))

(declare-fun d!16310 () Bool)

(declare-fun size!1075 (List!568) Int)

(assert (=> d!16310 (= (length!263 lt!80016) (size!1075 lt!80016))))

(declare-fun bs!4087 () Bool)

(assert (= bs!4087 d!16310))

(declare-fun m!81519 () Bool)

(assert (=> bs!4087 m!81519))

(assert (=> b!51502 d!16310))

(declare-fun d!16312 () Bool)

(assert (=> d!16312 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1605 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!4088 () Bool)

(assert (= bs!4088 d!16312))

(assert (=> bs!4088 m!81181))

(assert (=> bs!4088 m!81383))

(assert (=> b!51491 d!16312))

(declare-fun d!16314 () Bool)

(assert (=> d!16314 (= (head!387 (byteArrayBitContentToList!0 (_2!2466 lt!79994) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!683 (byteArrayBitContentToList!0 (_2!2466 lt!79994) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!51491 d!16314))

(declare-fun d!16316 () Bool)

(declare-fun c!3687 () Bool)

(assert (=> d!16316 (= c!3687 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!34110 () List!568)

(assert (=> d!16316 (= (byteArrayBitContentToList!0 (_2!2466 lt!79994) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!34110)))

(declare-fun b!51669 () Bool)

(assert (=> b!51669 (= e!34110 Nil!565)))

(declare-fun b!51670 () Bool)

(assert (=> b!51670 (= e!34110 (Cons!564 (not (= (bvand ((_ sign_extend 24) (select (arr!1605 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2466 lt!79994) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!16316 c!3687) b!51669))

(assert (= (and d!16316 (not c!3687)) b!51670))

(assert (=> b!51670 m!81181))

(assert (=> b!51670 m!81383))

(declare-fun m!81521 () Bool)

(assert (=> b!51670 m!81521))

(assert (=> b!51491 d!16316))

(declare-fun d!16318 () Bool)

(declare-datatypes ((tuple2!4736 0))(
  ( (tuple2!4737 (_1!2473 Bool) (_2!2473 BitStream!1854)) )
))
(declare-fun lt!80368 () tuple2!4736)

(declare-fun readBit!0 (BitStream!1854) tuple2!4736)

(assert (=> d!16318 (= lt!80368 (readBit!0 (_1!2467 lt!79995)))))

(assert (=> d!16318 (= (readBitPure!0 (_1!2467 lt!79995)) (tuple2!4727 (_2!2473 lt!80368) (_1!2473 lt!80368)))))

(declare-fun bs!4089 () Bool)

(assert (= bs!4089 d!16318))

(declare-fun m!81523 () Bool)

(assert (=> bs!4089 m!81523))

(assert (=> b!51501 d!16318))

(declare-fun d!16320 () Bool)

(assert (=> d!16320 (= (head!387 (byteArrayBitContentToList!0 (_2!2466 lt!80013) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!683 (byteArrayBitContentToList!0 (_2!2466 lt!80013) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!51498 d!16320))

(declare-fun d!16322 () Bool)

(declare-fun c!3688 () Bool)

(assert (=> d!16322 (= c!3688 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!34111 () List!568)

(assert (=> d!16322 (= (byteArrayBitContentToList!0 (_2!2466 lt!80013) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!34111)))

(declare-fun b!51671 () Bool)

(assert (=> b!51671 (= e!34111 Nil!565)))

(declare-fun b!51672 () Bool)

(assert (=> b!51672 (= e!34111 (Cons!564 (not (= (bvand ((_ sign_extend 24) (select (arr!1605 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2466 lt!80013) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!16322 c!3688) b!51671))

(assert (= (and d!16322 (not c!3688)) b!51672))

(assert (=> b!51672 m!81181))

(assert (=> b!51672 m!81383))

(declare-fun m!81525 () Bool)

(assert (=> b!51672 m!81525))

(assert (=> b!51498 d!16322))

(declare-fun d!16324 () Bool)

(assert (=> d!16324 (= (head!387 (bitStreamReadBitsIntoList!0 (_2!2466 lt!80013) (_1!2467 lt!80006) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!683 (bitStreamReadBitsIntoList!0 (_2!2466 lt!80013) (_1!2467 lt!80006) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!51498 d!16324))

(declare-fun b!51683 () Bool)

(declare-fun e!34118 () Bool)

(declare-fun lt!80386 () List!568)

(declare-fun isEmpty!149 (List!568) Bool)

(assert (=> b!51683 (= e!34118 (isEmpty!149 lt!80386))))

(declare-fun b!51684 () Bool)

(assert (=> b!51684 (= e!34118 (> (length!263 lt!80386) 0))))

(declare-fun b!51681 () Bool)

(declare-datatypes ((tuple2!4738 0))(
  ( (tuple2!4739 (_1!2474 List!568) (_2!2474 BitStream!1854)) )
))
(declare-fun e!34119 () tuple2!4738)

(assert (=> b!51681 (= e!34119 (tuple2!4739 Nil!565 (_1!2467 lt!80006)))))

(declare-fun lt!80387 () tuple2!4736)

(declare-fun lt!80385 () (_ BitVec 64))

(declare-fun b!51682 () Bool)

(assert (=> b!51682 (= e!34119 (tuple2!4739 (Cons!564 (_1!2473 lt!80387) (bitStreamReadBitsIntoList!0 (_2!2466 lt!80013) (_2!2473 lt!80387) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!80385))) (_2!2473 lt!80387)))))

(assert (=> b!51682 (= lt!80387 (readBit!0 (_1!2467 lt!80006)))))

(assert (=> b!51682 (= lt!80385 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!16328 () Bool)

(assert (=> d!16328 e!34118))

(declare-fun c!3693 () Bool)

(assert (=> d!16328 (= c!3693 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!16328 (= lt!80386 (_1!2474 e!34119))))

(declare-fun c!3694 () Bool)

(assert (=> d!16328 (= c!3694 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!16328 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!16328 (= (bitStreamReadBitsIntoList!0 (_2!2466 lt!80013) (_1!2467 lt!80006) #b0000000000000000000000000000000000000000000000000000000000000001) lt!80386)))

(assert (= (and d!16328 c!3694) b!51681))

(assert (= (and d!16328 (not c!3694)) b!51682))

(assert (= (and d!16328 c!3693) b!51683))

(assert (= (and d!16328 (not c!3693)) b!51684))

(declare-fun m!81529 () Bool)

(assert (=> b!51683 m!81529))

(declare-fun m!81531 () Bool)

(assert (=> b!51684 m!81531))

(declare-fun m!81533 () Bool)

(assert (=> b!51682 m!81533))

(declare-fun m!81535 () Bool)

(assert (=> b!51682 m!81535))

(assert (=> b!51498 d!16328))

(declare-fun b!51689 () Bool)

(declare-fun e!34121 () Unit!3545)

(declare-fun Unit!3557 () Unit!3545)

(assert (=> b!51689 (= e!34121 Unit!3557)))

(declare-fun b!51690 () Bool)

(declare-fun lt!80399 () Unit!3545)

(assert (=> b!51690 (= e!34121 lt!80399)))

(declare-fun lt!80393 () (_ BitVec 64))

(assert (=> b!51690 (= lt!80393 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80391 () (_ BitVec 64))

(assert (=> b!51690 (= lt!80391 (bitIndex!0 (size!1073 (buf!1428 (_2!2466 lt!80013))) (currentByte!2957 (_2!2466 lt!80013)) (currentBit!2952 (_2!2466 lt!80013))))))

(assert (=> b!51690 (= lt!80399 (arrayBitRangesEqSymmetric!0 (buf!1428 (_2!2466 lt!80013)) (buf!1428 (_2!2466 lt!79994)) lt!80393 lt!80391))))

(assert (=> b!51690 (arrayBitRangesEq!0 (buf!1428 (_2!2466 lt!79994)) (buf!1428 (_2!2466 lt!80013)) lt!80393 lt!80391)))

(declare-fun b!51691 () Bool)

(declare-fun e!34120 () Bool)

(declare-fun lt!80403 () (_ BitVec 64))

(declare-fun lt!80406 () tuple2!4724)

(declare-fun lt!80407 () (_ BitVec 64))

(assert (=> b!51691 (= e!34120 (= (_1!2467 lt!80406) (withMovedBitIndex!0 (_2!2467 lt!80406) (bvsub lt!80407 lt!80403))))))

(assert (=> b!51691 (or (= (bvand lt!80407 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!80403 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!80407 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!80407 lt!80403) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!51691 (= lt!80403 (bitIndex!0 (size!1073 (buf!1428 (_2!2466 lt!79994))) (currentByte!2957 (_2!2466 lt!79994)) (currentBit!2952 (_2!2466 lt!79994))))))

(assert (=> b!51691 (= lt!80407 (bitIndex!0 (size!1073 (buf!1428 (_2!2466 lt!80013))) (currentByte!2957 (_2!2466 lt!80013)) (currentBit!2952 (_2!2466 lt!80013))))))

(declare-fun b!51692 () Bool)

(declare-fun res!43258 () Bool)

(assert (=> b!51692 (=> (not res!43258) (not e!34120))))

(assert (=> b!51692 (= res!43258 (isPrefixOf!0 (_2!2467 lt!80406) (_2!2466 lt!79994)))))

(declare-fun d!16332 () Bool)

(assert (=> d!16332 e!34120))

(declare-fun res!43259 () Bool)

(assert (=> d!16332 (=> (not res!43259) (not e!34120))))

(assert (=> d!16332 (= res!43259 (isPrefixOf!0 (_1!2467 lt!80406) (_2!2467 lt!80406)))))

(declare-fun lt!80401 () BitStream!1854)

(assert (=> d!16332 (= lt!80406 (tuple2!4725 lt!80401 (_2!2466 lt!79994)))))

(declare-fun lt!80390 () Unit!3545)

(declare-fun lt!80405 () Unit!3545)

(assert (=> d!16332 (= lt!80390 lt!80405)))

(assert (=> d!16332 (isPrefixOf!0 lt!80401 (_2!2466 lt!79994))))

(assert (=> d!16332 (= lt!80405 (lemmaIsPrefixTransitive!0 lt!80401 (_2!2466 lt!79994) (_2!2466 lt!79994)))))

(declare-fun lt!80400 () Unit!3545)

(declare-fun lt!80398 () Unit!3545)

(assert (=> d!16332 (= lt!80400 lt!80398)))

(assert (=> d!16332 (isPrefixOf!0 lt!80401 (_2!2466 lt!79994))))

(assert (=> d!16332 (= lt!80398 (lemmaIsPrefixTransitive!0 lt!80401 (_2!2466 lt!80013) (_2!2466 lt!79994)))))

(declare-fun lt!80397 () Unit!3545)

(assert (=> d!16332 (= lt!80397 e!34121)))

(declare-fun c!3695 () Bool)

(assert (=> d!16332 (= c!3695 (not (= (size!1073 (buf!1428 (_2!2466 lt!80013))) #b00000000000000000000000000000000)))))

(declare-fun lt!80409 () Unit!3545)

(declare-fun lt!80394 () Unit!3545)

(assert (=> d!16332 (= lt!80409 lt!80394)))

(assert (=> d!16332 (isPrefixOf!0 (_2!2466 lt!79994) (_2!2466 lt!79994))))

(assert (=> d!16332 (= lt!80394 (lemmaIsPrefixRefl!0 (_2!2466 lt!79994)))))

(declare-fun lt!80395 () Unit!3545)

(declare-fun lt!80408 () Unit!3545)

(assert (=> d!16332 (= lt!80395 lt!80408)))

(assert (=> d!16332 (= lt!80408 (lemmaIsPrefixRefl!0 (_2!2466 lt!79994)))))

(declare-fun lt!80402 () Unit!3545)

(declare-fun lt!80396 () Unit!3545)

(assert (=> d!16332 (= lt!80402 lt!80396)))

(assert (=> d!16332 (isPrefixOf!0 lt!80401 lt!80401)))

(assert (=> d!16332 (= lt!80396 (lemmaIsPrefixRefl!0 lt!80401))))

(declare-fun lt!80404 () Unit!3545)

(declare-fun lt!80392 () Unit!3545)

(assert (=> d!16332 (= lt!80404 lt!80392)))

(assert (=> d!16332 (isPrefixOf!0 (_2!2466 lt!80013) (_2!2466 lt!80013))))

(assert (=> d!16332 (= lt!80392 (lemmaIsPrefixRefl!0 (_2!2466 lt!80013)))))

(assert (=> d!16332 (= lt!80401 (BitStream!1855 (buf!1428 (_2!2466 lt!79994)) (currentByte!2957 (_2!2466 lt!80013)) (currentBit!2952 (_2!2466 lt!80013))))))

(assert (=> d!16332 (isPrefixOf!0 (_2!2466 lt!80013) (_2!2466 lt!79994))))

(assert (=> d!16332 (= (reader!0 (_2!2466 lt!80013) (_2!2466 lt!79994)) lt!80406)))

(declare-fun b!51693 () Bool)

(declare-fun res!43260 () Bool)

(assert (=> b!51693 (=> (not res!43260) (not e!34120))))

(assert (=> b!51693 (= res!43260 (isPrefixOf!0 (_1!2467 lt!80406) (_2!2466 lt!80013)))))

(assert (= (and d!16332 c!3695) b!51690))

(assert (= (and d!16332 (not c!3695)) b!51689))

(assert (= (and d!16332 res!43259) b!51693))

(assert (= (and b!51693 res!43260) b!51692))

(assert (= (and b!51692 res!43258) b!51691))

(declare-fun m!81537 () Bool)

(assert (=> b!51693 m!81537))

(declare-fun m!81539 () Bool)

(assert (=> d!16332 m!81539))

(declare-fun m!81541 () Bool)

(assert (=> d!16332 m!81541))

(declare-fun m!81543 () Bool)

(assert (=> d!16332 m!81543))

(assert (=> d!16332 m!81469))

(declare-fun m!81545 () Bool)

(assert (=> d!16332 m!81545))

(declare-fun m!81547 () Bool)

(assert (=> d!16332 m!81547))

(declare-fun m!81549 () Bool)

(assert (=> d!16332 m!81549))

(assert (=> d!16332 m!81471))

(declare-fun m!81551 () Bool)

(assert (=> d!16332 m!81551))

(declare-fun m!81553 () Bool)

(assert (=> d!16332 m!81553))

(assert (=> d!16332 m!81221))

(assert (=> b!51690 m!81201))

(declare-fun m!81555 () Bool)

(assert (=> b!51690 m!81555))

(declare-fun m!81557 () Bool)

(assert (=> b!51690 m!81557))

(declare-fun m!81559 () Bool)

(assert (=> b!51691 m!81559))

(assert (=> b!51691 m!81177))

(assert (=> b!51691 m!81201))

(declare-fun m!81561 () Bool)

(assert (=> b!51692 m!81561))

(assert (=> b!51497 d!16332))

(declare-fun b!51696 () Bool)

(declare-fun e!34124 () Unit!3545)

(declare-fun Unit!3558 () Unit!3545)

(assert (=> b!51696 (= e!34124 Unit!3558)))

(declare-fun b!51697 () Bool)

(declare-fun lt!80425 () Unit!3545)

(assert (=> b!51697 (= e!34124 lt!80425)))

(declare-fun lt!80419 () (_ BitVec 64))

(assert (=> b!51697 (= lt!80419 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!80417 () (_ BitVec 64))

(assert (=> b!51697 (= lt!80417 (bitIndex!0 (size!1073 (buf!1428 thiss!1379)) (currentByte!2957 thiss!1379) (currentBit!2952 thiss!1379)))))

(assert (=> b!51697 (= lt!80425 (arrayBitRangesEqSymmetric!0 (buf!1428 thiss!1379) (buf!1428 (_2!2466 lt!79994)) lt!80419 lt!80417))))

(assert (=> b!51697 (arrayBitRangesEq!0 (buf!1428 (_2!2466 lt!79994)) (buf!1428 thiss!1379) lt!80419 lt!80417)))

(declare-fun b!51698 () Bool)

(declare-fun lt!80432 () tuple2!4724)

(declare-fun lt!80429 () (_ BitVec 64))

(declare-fun e!34123 () Bool)

(declare-fun lt!80433 () (_ BitVec 64))

(assert (=> b!51698 (= e!34123 (= (_1!2467 lt!80432) (withMovedBitIndex!0 (_2!2467 lt!80432) (bvsub lt!80433 lt!80429))))))

(assert (=> b!51698 (or (= (bvand lt!80433 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!80429 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!80433 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!80433 lt!80429) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!51698 (= lt!80429 (bitIndex!0 (size!1073 (buf!1428 (_2!2466 lt!79994))) (currentByte!2957 (_2!2466 lt!79994)) (currentBit!2952 (_2!2466 lt!79994))))))

(assert (=> b!51698 (= lt!80433 (bitIndex!0 (size!1073 (buf!1428 thiss!1379)) (currentByte!2957 thiss!1379) (currentBit!2952 thiss!1379)))))

(declare-fun b!51699 () Bool)

(declare-fun res!43263 () Bool)

(assert (=> b!51699 (=> (not res!43263) (not e!34123))))

(assert (=> b!51699 (= res!43263 (isPrefixOf!0 (_2!2467 lt!80432) (_2!2466 lt!79994)))))

(declare-fun d!16334 () Bool)

(assert (=> d!16334 e!34123))

(declare-fun res!43264 () Bool)

(assert (=> d!16334 (=> (not res!43264) (not e!34123))))

(assert (=> d!16334 (= res!43264 (isPrefixOf!0 (_1!2467 lt!80432) (_2!2467 lt!80432)))))

(declare-fun lt!80427 () BitStream!1854)

(assert (=> d!16334 (= lt!80432 (tuple2!4725 lt!80427 (_2!2466 lt!79994)))))

(declare-fun lt!80416 () Unit!3545)

(declare-fun lt!80431 () Unit!3545)

(assert (=> d!16334 (= lt!80416 lt!80431)))

(assert (=> d!16334 (isPrefixOf!0 lt!80427 (_2!2466 lt!79994))))

(assert (=> d!16334 (= lt!80431 (lemmaIsPrefixTransitive!0 lt!80427 (_2!2466 lt!79994) (_2!2466 lt!79994)))))

(declare-fun lt!80426 () Unit!3545)

(declare-fun lt!80424 () Unit!3545)

(assert (=> d!16334 (= lt!80426 lt!80424)))

(assert (=> d!16334 (isPrefixOf!0 lt!80427 (_2!2466 lt!79994))))

(assert (=> d!16334 (= lt!80424 (lemmaIsPrefixTransitive!0 lt!80427 thiss!1379 (_2!2466 lt!79994)))))

(declare-fun lt!80423 () Unit!3545)

(assert (=> d!16334 (= lt!80423 e!34124)))

(declare-fun c!3696 () Bool)

(assert (=> d!16334 (= c!3696 (not (= (size!1073 (buf!1428 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!80435 () Unit!3545)

(declare-fun lt!80420 () Unit!3545)

(assert (=> d!16334 (= lt!80435 lt!80420)))

(assert (=> d!16334 (isPrefixOf!0 (_2!2466 lt!79994) (_2!2466 lt!79994))))

(assert (=> d!16334 (= lt!80420 (lemmaIsPrefixRefl!0 (_2!2466 lt!79994)))))

(declare-fun lt!80421 () Unit!3545)

(declare-fun lt!80434 () Unit!3545)

(assert (=> d!16334 (= lt!80421 lt!80434)))

(assert (=> d!16334 (= lt!80434 (lemmaIsPrefixRefl!0 (_2!2466 lt!79994)))))

(declare-fun lt!80428 () Unit!3545)

(declare-fun lt!80422 () Unit!3545)

(assert (=> d!16334 (= lt!80428 lt!80422)))

(assert (=> d!16334 (isPrefixOf!0 lt!80427 lt!80427)))

(assert (=> d!16334 (= lt!80422 (lemmaIsPrefixRefl!0 lt!80427))))

(declare-fun lt!80430 () Unit!3545)

(declare-fun lt!80418 () Unit!3545)

(assert (=> d!16334 (= lt!80430 lt!80418)))

(assert (=> d!16334 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!16334 (= lt!80418 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!16334 (= lt!80427 (BitStream!1855 (buf!1428 (_2!2466 lt!79994)) (currentByte!2957 thiss!1379) (currentBit!2952 thiss!1379)))))

(assert (=> d!16334 (isPrefixOf!0 thiss!1379 (_2!2466 lt!79994))))

(assert (=> d!16334 (= (reader!0 thiss!1379 (_2!2466 lt!79994)) lt!80432)))

(declare-fun b!51700 () Bool)

(declare-fun res!43265 () Bool)

(assert (=> b!51700 (=> (not res!43265) (not e!34123))))

(assert (=> b!51700 (= res!43265 (isPrefixOf!0 (_1!2467 lt!80432) thiss!1379))))

(assert (= (and d!16334 c!3696) b!51697))

(assert (= (and d!16334 (not c!3696)) b!51696))

(assert (= (and d!16334 res!43264) b!51700))

(assert (= (and b!51700 res!43265) b!51699))

(assert (= (and b!51699 res!43263) b!51698))

(declare-fun m!81565 () Bool)

(assert (=> b!51700 m!81565))

(declare-fun m!81567 () Bool)

(assert (=> d!16334 m!81567))

(declare-fun m!81569 () Bool)

(assert (=> d!16334 m!81569))

(assert (=> d!16334 m!81543))

(assert (=> d!16334 m!81211))

(declare-fun m!81571 () Bool)

(assert (=> d!16334 m!81571))

(declare-fun m!81573 () Bool)

(assert (=> d!16334 m!81573))

(declare-fun m!81575 () Bool)

(assert (=> d!16334 m!81575))

(assert (=> d!16334 m!81213))

(assert (=> d!16334 m!81551))

(declare-fun m!81577 () Bool)

(assert (=> d!16334 m!81577))

(assert (=> d!16334 m!81219))

(assert (=> b!51697 m!81215))

(declare-fun m!81579 () Bool)

(assert (=> b!51697 m!81579))

(declare-fun m!81581 () Bool)

(assert (=> b!51697 m!81581))

(declare-fun m!81583 () Bool)

(assert (=> b!51698 m!81583))

(assert (=> b!51698 m!81177))

(assert (=> b!51698 m!81215))

(declare-fun m!81585 () Bool)

(assert (=> b!51699 m!81585))

(assert (=> b!51497 d!16334))

(declare-fun d!16338 () Bool)

(assert (=> d!16338 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1073 (buf!1428 (_2!2466 lt!79994)))) ((_ sign_extend 32) (currentByte!2957 thiss!1379)) ((_ sign_extend 32) (currentBit!2952 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1073 (buf!1428 (_2!2466 lt!79994)))) ((_ sign_extend 32) (currentByte!2957 thiss!1379)) ((_ sign_extend 32) (currentBit!2952 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4091 () Bool)

(assert (= bs!4091 d!16338))

(declare-fun m!81587 () Bool)

(assert (=> bs!4091 m!81587))

(assert (=> b!51497 d!16338))

(declare-fun d!16340 () Bool)

(assert (=> d!16340 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1073 (buf!1428 (_2!2466 lt!79994)))) ((_ sign_extend 32) (currentByte!2957 (_2!2466 lt!80013))) ((_ sign_extend 32) (currentBit!2952 (_2!2466 lt!80013))) lt!80011) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1073 (buf!1428 (_2!2466 lt!79994)))) ((_ sign_extend 32) (currentByte!2957 (_2!2466 lt!80013))) ((_ sign_extend 32) (currentBit!2952 (_2!2466 lt!80013)))) lt!80011))))

(declare-fun bs!4092 () Bool)

(assert (= bs!4092 d!16340))

(declare-fun m!81589 () Bool)

(assert (=> bs!4092 m!81589))

(assert (=> b!51497 d!16340))

(declare-fun d!16342 () Bool)

(assert (=> d!16342 (validate_offset_bits!1 ((_ sign_extend 32) (size!1073 (buf!1428 (_2!2466 lt!79994)))) ((_ sign_extend 32) (currentByte!2957 (_2!2466 lt!80013))) ((_ sign_extend 32) (currentBit!2952 (_2!2466 lt!80013))) lt!80011)))

(declare-fun lt!80436 () Unit!3545)

(assert (=> d!16342 (= lt!80436 (choose!9 (_2!2466 lt!80013) (buf!1428 (_2!2466 lt!79994)) lt!80011 (BitStream!1855 (buf!1428 (_2!2466 lt!79994)) (currentByte!2957 (_2!2466 lt!80013)) (currentBit!2952 (_2!2466 lt!80013)))))))

(assert (=> d!16342 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2466 lt!80013) (buf!1428 (_2!2466 lt!79994)) lt!80011) lt!80436)))

(declare-fun bs!4093 () Bool)

(assert (= bs!4093 d!16342))

(assert (=> bs!4093 m!81245))

(declare-fun m!81591 () Bool)

(assert (=> bs!4093 m!81591))

(assert (=> b!51497 d!16342))

(declare-fun b!51703 () Bool)

(declare-fun e!34125 () Bool)

(declare-fun lt!80440 () List!568)

(assert (=> b!51703 (= e!34125 (isEmpty!149 lt!80440))))

(declare-fun b!51704 () Bool)

(assert (=> b!51704 (= e!34125 (> (length!263 lt!80440) 0))))

(declare-fun b!51701 () Bool)

(declare-fun e!34126 () tuple2!4738)

(assert (=> b!51701 (= e!34126 (tuple2!4739 Nil!565 (_1!2467 lt!80003)))))

(declare-fun lt!80439 () (_ BitVec 64))

(declare-fun lt!80441 () tuple2!4736)

(declare-fun b!51702 () Bool)

(assert (=> b!51702 (= e!34126 (tuple2!4739 (Cons!564 (_1!2473 lt!80441) (bitStreamReadBitsIntoList!0 (_2!2466 lt!79994) (_2!2473 lt!80441) (bvsub lt!80011 lt!80439))) (_2!2473 lt!80441)))))

(assert (=> b!51702 (= lt!80441 (readBit!0 (_1!2467 lt!80003)))))

(assert (=> b!51702 (= lt!80439 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!16344 () Bool)

(assert (=> d!16344 e!34125))

(declare-fun c!3697 () Bool)

(assert (=> d!16344 (= c!3697 (= lt!80011 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!16344 (= lt!80440 (_1!2474 e!34126))))

(declare-fun c!3698 () Bool)

(assert (=> d!16344 (= c!3698 (= lt!80011 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!16344 (bvsge lt!80011 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!16344 (= (bitStreamReadBitsIntoList!0 (_2!2466 lt!79994) (_1!2467 lt!80003) lt!80011) lt!80440)))

(assert (= (and d!16344 c!3698) b!51701))

(assert (= (and d!16344 (not c!3698)) b!51702))

(assert (= (and d!16344 c!3697) b!51703))

(assert (= (and d!16344 (not c!3697)) b!51704))

(declare-fun m!81595 () Bool)

(assert (=> b!51703 m!81595))

(declare-fun m!81597 () Bool)

(assert (=> b!51704 m!81597))

(declare-fun m!81599 () Bool)

(assert (=> b!51702 m!81599))

(declare-fun m!81601 () Bool)

(assert (=> b!51702 m!81601))

(assert (=> b!51497 d!16344))

(declare-fun d!16348 () Bool)

(assert (=> d!16348 (validate_offset_bits!1 ((_ sign_extend 32) (size!1073 (buf!1428 (_2!2466 lt!79994)))) ((_ sign_extend 32) (currentByte!2957 thiss!1379)) ((_ sign_extend 32) (currentBit!2952 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!80443 () Unit!3545)

(assert (=> d!16348 (= lt!80443 (choose!9 thiss!1379 (buf!1428 (_2!2466 lt!79994)) (bvsub to!314 i!635) (BitStream!1855 (buf!1428 (_2!2466 lt!79994)) (currentByte!2957 thiss!1379) (currentBit!2952 thiss!1379))))))

(assert (=> d!16348 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1428 (_2!2466 lt!79994)) (bvsub to!314 i!635)) lt!80443)))

(declare-fun bs!4095 () Bool)

(assert (= bs!4095 d!16348))

(assert (=> bs!4095 m!81239))

(declare-fun m!81603 () Bool)

(assert (=> bs!4095 m!81603))

(assert (=> b!51497 d!16348))

(declare-fun b!51707 () Bool)

(declare-fun e!34127 () Bool)

(declare-fun lt!80445 () List!568)

(assert (=> b!51707 (= e!34127 (isEmpty!149 lt!80445))))

(declare-fun b!51708 () Bool)

(assert (=> b!51708 (= e!34127 (> (length!263 lt!80445) 0))))

(declare-fun b!51705 () Bool)

(declare-fun e!34128 () tuple2!4738)

(assert (=> b!51705 (= e!34128 (tuple2!4739 Nil!565 (_1!2467 lt!79995)))))

(declare-fun b!51706 () Bool)

(declare-fun lt!80444 () (_ BitVec 64))

(declare-fun lt!80446 () tuple2!4736)

(assert (=> b!51706 (= e!34128 (tuple2!4739 (Cons!564 (_1!2473 lt!80446) (bitStreamReadBitsIntoList!0 (_2!2466 lt!79994) (_2!2473 lt!80446) (bvsub (bvsub to!314 i!635) lt!80444))) (_2!2473 lt!80446)))))

(assert (=> b!51706 (= lt!80446 (readBit!0 (_1!2467 lt!79995)))))

(assert (=> b!51706 (= lt!80444 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!16350 () Bool)

(assert (=> d!16350 e!34127))

(declare-fun c!3699 () Bool)

(assert (=> d!16350 (= c!3699 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!16350 (= lt!80445 (_1!2474 e!34128))))

(declare-fun c!3700 () Bool)

(assert (=> d!16350 (= c!3700 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!16350 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!16350 (= (bitStreamReadBitsIntoList!0 (_2!2466 lt!79994) (_1!2467 lt!79995) (bvsub to!314 i!635)) lt!80445)))

(assert (= (and d!16350 c!3700) b!51705))

(assert (= (and d!16350 (not c!3700)) b!51706))

(assert (= (and d!16350 c!3699) b!51707))

(assert (= (and d!16350 (not c!3699)) b!51708))

(declare-fun m!81605 () Bool)

(assert (=> b!51707 m!81605))

(declare-fun m!81607 () Bool)

(assert (=> b!51708 m!81607))

(declare-fun m!81609 () Bool)

(assert (=> b!51706 m!81609))

(assert (=> b!51706 m!81523))

(assert (=> b!51497 d!16350))

(declare-fun d!16354 () Bool)

(assert (=> d!16354 (= (bitAt!0 (buf!1428 (_1!2467 lt!80003)) lt!79999) (not (= (bvand ((_ sign_extend 24) (select (arr!1605 (buf!1428 (_1!2467 lt!80003))) ((_ extract 31 0) (bvsdiv lt!79999 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!79999 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!4096 () Bool)

(assert (= bs!4096 d!16354))

(declare-fun m!81611 () Bool)

(assert (=> bs!4096 m!81611))

(assert (=> bs!4096 m!81517))

(assert (=> b!51499 d!16354))

(declare-fun d!16356 () Bool)

(assert (=> d!16356 (= (bitAt!0 (buf!1428 (_1!2467 lt!79995)) lt!79999) (not (= (bvand ((_ sign_extend 24) (select (arr!1605 (buf!1428 (_1!2467 lt!79995))) ((_ extract 31 0) (bvsdiv lt!79999 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!79999 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!4097 () Bool)

(assert (= bs!4097 d!16356))

(declare-fun m!81613 () Bool)

(assert (=> bs!4097 m!81613))

(assert (=> bs!4097 m!81517))

(assert (=> b!51499 d!16356))

(declare-fun d!16358 () Bool)

(declare-fun e!34129 () Bool)

(assert (=> d!16358 e!34129))

(declare-fun res!43267 () Bool)

(assert (=> d!16358 (=> (not res!43267) (not e!34129))))

(declare-fun lt!80451 () (_ BitVec 64))

(declare-fun lt!80450 () (_ BitVec 64))

(declare-fun lt!80448 () (_ BitVec 64))

(assert (=> d!16358 (= res!43267 (= lt!80448 (bvsub lt!80450 lt!80451)))))

(assert (=> d!16358 (or (= (bvand lt!80450 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!80451 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!80450 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!80450 lt!80451) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!16358 (= lt!80451 (remainingBits!0 ((_ sign_extend 32) (size!1073 (buf!1428 (_2!2466 lt!79994)))) ((_ sign_extend 32) (currentByte!2957 (_2!2466 lt!79994))) ((_ sign_extend 32) (currentBit!2952 (_2!2466 lt!79994)))))))

(declare-fun lt!80449 () (_ BitVec 64))

(declare-fun lt!80452 () (_ BitVec 64))

(assert (=> d!16358 (= lt!80450 (bvmul lt!80449 lt!80452))))

(assert (=> d!16358 (or (= lt!80449 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!80452 (bvsdiv (bvmul lt!80449 lt!80452) lt!80449)))))

(assert (=> d!16358 (= lt!80452 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!16358 (= lt!80449 ((_ sign_extend 32) (size!1073 (buf!1428 (_2!2466 lt!79994)))))))

(assert (=> d!16358 (= lt!80448 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2957 (_2!2466 lt!79994))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2952 (_2!2466 lt!79994)))))))

(assert (=> d!16358 (invariant!0 (currentBit!2952 (_2!2466 lt!79994)) (currentByte!2957 (_2!2466 lt!79994)) (size!1073 (buf!1428 (_2!2466 lt!79994))))))

(assert (=> d!16358 (= (bitIndex!0 (size!1073 (buf!1428 (_2!2466 lt!79994))) (currentByte!2957 (_2!2466 lt!79994)) (currentBit!2952 (_2!2466 lt!79994))) lt!80448)))

(declare-fun b!51709 () Bool)

(declare-fun res!43266 () Bool)

(assert (=> b!51709 (=> (not res!43266) (not e!34129))))

(assert (=> b!51709 (= res!43266 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!80448))))

(declare-fun b!51710 () Bool)

(declare-fun lt!80447 () (_ BitVec 64))

(assert (=> b!51710 (= e!34129 (bvsle lt!80448 (bvmul lt!80447 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!51710 (or (= lt!80447 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!80447 #b0000000000000000000000000000000000000000000000000000000000001000) lt!80447)))))

(assert (=> b!51710 (= lt!80447 ((_ sign_extend 32) (size!1073 (buf!1428 (_2!2466 lt!79994)))))))

(assert (= (and d!16358 res!43267) b!51709))

(assert (= (and b!51709 res!43266) b!51710))

(declare-fun m!81615 () Bool)

(assert (=> d!16358 m!81615))

(assert (=> d!16358 m!81175))

(assert (=> b!51488 d!16358))

(declare-fun d!16360 () Bool)

(assert (=> d!16360 (= (bitAt!0 (buf!1428 (_2!2466 lt!79994)) lt!79999) (not (= (bvand ((_ sign_extend 24) (select (arr!1605 (buf!1428 (_2!2466 lt!79994))) ((_ extract 31 0) (bvsdiv lt!79999 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!79999 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!4098 () Bool)

(assert (= bs!4098 d!16360))

(declare-fun m!81617 () Bool)

(assert (=> bs!4098 m!81617))

(assert (=> bs!4098 m!81517))

(assert (=> b!51495 d!16360))

(declare-fun d!16362 () Bool)

(assert (=> d!16362 (= (bitAt!0 (buf!1428 (_2!2466 lt!80013)) lt!79999) (bitAt!0 (buf!1428 (_2!2466 lt!79994)) lt!79999))))

(declare-fun lt!80458 () Unit!3545)

(declare-fun choose!31 (array!2355 array!2355 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3545)

(assert (=> d!16362 (= lt!80458 (choose!31 (buf!1428 (_2!2466 lt!80013)) (buf!1428 (_2!2466 lt!79994)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!79999 lt!79993))))

(assert (=> d!16362 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!79993))))

(assert (=> d!16362 (= (arrayBitRangesEqImpliesEq!0 (buf!1428 (_2!2466 lt!80013)) (buf!1428 (_2!2466 lt!79994)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!79999 lt!79993) lt!80458)))

(declare-fun bs!4100 () Bool)

(assert (= bs!4100 d!16362))

(assert (=> bs!4100 m!81169))

(assert (=> bs!4100 m!81171))

(declare-fun m!81621 () Bool)

(assert (=> bs!4100 m!81621))

(assert (=> b!51495 d!16362))

(declare-fun d!16366 () Bool)

(assert (=> d!16366 (= (invariant!0 (currentBit!2952 (_2!2466 lt!80013)) (currentByte!2957 (_2!2466 lt!80013)) (size!1073 (buf!1428 (_2!2466 lt!79994)))) (and (bvsge (currentBit!2952 (_2!2466 lt!80013)) #b00000000000000000000000000000000) (bvslt (currentBit!2952 (_2!2466 lt!80013)) #b00000000000000000000000000001000) (bvsge (currentByte!2957 (_2!2466 lt!80013)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2957 (_2!2466 lt!80013)) (size!1073 (buf!1428 (_2!2466 lt!79994)))) (and (= (currentBit!2952 (_2!2466 lt!80013)) #b00000000000000000000000000000000) (= (currentByte!2957 (_2!2466 lt!80013)) (size!1073 (buf!1428 (_2!2466 lt!79994))))))))))

(assert (=> b!51484 d!16366))

(declare-fun d!16368 () Bool)

(assert (=> d!16368 (= (array_inv!980 (buf!1428 thiss!1379)) (bvsge (size!1073 (buf!1428 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!51486 d!16368))

(declare-fun d!16370 () Bool)

(assert (=> d!16370 (= (head!387 lt!80016) (h!683 lt!80016))))

(assert (=> b!51485 d!16370))

(check-sat (not d!16278) (not d!16362) (not d!16296) (not b!51690) (not b!51706) (not b!51575) (not b!51662) (not d!16334) (not b!51639) (not d!16274) (not b!51609) (not d!16270) (not b!51613) (not d!16292) (not b!51698) (not b!51683) (not d!16342) (not d!16288) (not b!51699) (not b!51638) (not b!51659) (not b!51707) (not d!16332) (not b!51643) (not b!51703) (not b!51708) (not d!16306) (not b!51657) (not d!16276) (not d!16310) (not b!51611) (not d!16268) (not b!51615) (not b!51692) (not b!51577) (not b!51656) (not d!16284) (not b!51704) (not b!51608) (not b!51584) (not b!51670) (not b!51672) (not d!16286) (not b!51607) (not b!51610) (not b!51618) (not b!51586) (not d!16340) (not b!51612) (not b!51642) (not b!51691) (not b!51700) (not d!16348) (not b!51620) (not d!16338) (not b!51614) (not b!51693) (not b!51589) (not b!51702) (not bm!658) (not d!16266) (not b!51697) (not b!51684) (not b!51637) (not d!16318) (not d!16358) (not b!51658) (not d!16290) (not b!51617) (not b!51682) (not b!51644) (not d!16308))
(check-sat)
