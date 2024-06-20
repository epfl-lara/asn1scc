; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10862 () Bool)

(assert start!10862)

(declare-fun b!54023 () Bool)

(declare-fun e!36000 () Bool)

(declare-fun e!36005 () Bool)

(assert (=> b!54023 (= e!36000 (not e!36005))))

(declare-fun res!45109 () Bool)

(assert (=> b!54023 (=> res!45109 e!36005)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!54023 (= res!45109 (bvsge i!635 to!314))))

(declare-datatypes ((array!2532 0))(
  ( (array!2533 (arr!1692 (Array (_ BitVec 32) (_ BitVec 8))) (size!1155 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1998 0))(
  ( (BitStream!1999 (buf!1509 array!2532) (currentByte!3082 (_ BitVec 32)) (currentBit!3077 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1998)

(declare-fun isPrefixOf!0 (BitStream!1998 BitStream!1998) Bool)

(assert (=> b!54023 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3719 0))(
  ( (Unit!3720) )
))
(declare-fun lt!83624 () Unit!3719)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1998) Unit!3719)

(assert (=> b!54023 (= lt!83624 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!83626 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!54023 (= lt!83626 (bitIndex!0 (size!1155 (buf!1509 thiss!1379)) (currentByte!3082 thiss!1379) (currentBit!3077 thiss!1379)))))

(declare-fun srcBuffer!2 () array!2532)

(declare-datatypes ((tuple2!4906 0))(
  ( (tuple2!4907 (_1!2564 Unit!3719) (_2!2564 BitStream!1998)) )
))
(declare-fun lt!83622 () tuple2!4906)

(declare-fun b!54024 () Bool)

(declare-datatypes ((tuple2!4908 0))(
  ( (tuple2!4909 (_1!2565 BitStream!1998) (_2!2565 BitStream!1998)) )
))
(declare-fun lt!83623 () tuple2!4908)

(declare-fun e!35999 () Bool)

(declare-datatypes ((List!574 0))(
  ( (Nil!571) (Cons!570 (h!689 Bool) (t!1324 List!574)) )
))
(declare-fun head!393 (List!574) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1998 array!2532 (_ BitVec 64) (_ BitVec 64)) List!574)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1998 BitStream!1998 (_ BitVec 64)) List!574)

(assert (=> b!54024 (= e!35999 (= (head!393 (byteArrayBitContentToList!0 (_2!2564 lt!83622) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!393 (bitStreamReadBitsIntoList!0 (_2!2564 lt!83622) (_1!2565 lt!83623) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun res!45107 () Bool)

(assert (=> start!10862 (=> (not res!45107) (not e!36000))))

(assert (=> start!10862 (= res!45107 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1155 srcBuffer!2))))))))

(assert (=> start!10862 e!36000))

(assert (=> start!10862 true))

(declare-fun array_inv!1058 (array!2532) Bool)

(assert (=> start!10862 (array_inv!1058 srcBuffer!2)))

(declare-fun e!36003 () Bool)

(declare-fun inv!12 (BitStream!1998) Bool)

(assert (=> start!10862 (and (inv!12 thiss!1379) e!36003)))

(declare-fun b!54025 () Bool)

(declare-fun e!36002 () Bool)

(assert (=> b!54025 (= e!36005 e!36002)))

(declare-fun res!45111 () Bool)

(assert (=> b!54025 (=> res!45111 e!36002)))

(assert (=> b!54025 (= res!45111 (not (isPrefixOf!0 thiss!1379 (_2!2564 lt!83622))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!54025 (validate_offset_bits!1 ((_ sign_extend 32) (size!1155 (buf!1509 (_2!2564 lt!83622)))) ((_ sign_extend 32) (currentByte!3082 (_2!2564 lt!83622))) ((_ sign_extend 32) (currentBit!3077 (_2!2564 lt!83622))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!83621 () Unit!3719)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1998 BitStream!1998 (_ BitVec 64) (_ BitVec 64)) Unit!3719)

(assert (=> b!54025 (= lt!83621 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2564 lt!83622) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1998 (_ BitVec 8) (_ BitVec 32)) tuple2!4906)

(assert (=> b!54025 (= lt!83622 (appendBitFromByte!0 thiss!1379 (select (arr!1692 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!54026 () Bool)

(assert (=> b!54026 (= e!36002 (or (not (= (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!54026 e!35999))

(declare-fun res!45108 () Bool)

(assert (=> b!54026 (=> (not res!45108) (not e!35999))))

(assert (=> b!54026 (= res!45108 (validate_offset_bits!1 ((_ sign_extend 32) (size!1155 (buf!1509 (_2!2564 lt!83622)))) ((_ sign_extend 32) (currentByte!3082 thiss!1379)) ((_ sign_extend 32) (currentBit!3077 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!83625 () Unit!3719)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1998 array!2532 (_ BitVec 64)) Unit!3719)

(assert (=> b!54026 (= lt!83625 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1509 (_2!2564 lt!83622)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1998 BitStream!1998) tuple2!4908)

(assert (=> b!54026 (= lt!83623 (reader!0 thiss!1379 (_2!2564 lt!83622)))))

(declare-fun b!54027 () Bool)

(assert (=> b!54027 (= e!36003 (array_inv!1058 (buf!1509 thiss!1379)))))

(declare-fun b!54028 () Bool)

(declare-fun res!45110 () Bool)

(assert (=> b!54028 (=> (not res!45110) (not e!36000))))

(assert (=> b!54028 (= res!45110 (validate_offset_bits!1 ((_ sign_extend 32) (size!1155 (buf!1509 thiss!1379))) ((_ sign_extend 32) (currentByte!3082 thiss!1379)) ((_ sign_extend 32) (currentBit!3077 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!10862 res!45107) b!54028))

(assert (= (and b!54028 res!45110) b!54023))

(assert (= (and b!54023 (not res!45109)) b!54025))

(assert (= (and b!54025 (not res!45111)) b!54026))

(assert (= (and b!54026 res!45108) b!54024))

(assert (= start!10862 b!54027))

(declare-fun m!84831 () Bool)

(assert (=> b!54025 m!84831))

(declare-fun m!84833 () Bool)

(assert (=> b!54025 m!84833))

(declare-fun m!84835 () Bool)

(assert (=> b!54025 m!84835))

(assert (=> b!54025 m!84831))

(declare-fun m!84837 () Bool)

(assert (=> b!54025 m!84837))

(declare-fun m!84839 () Bool)

(assert (=> b!54025 m!84839))

(declare-fun m!84841 () Bool)

(assert (=> start!10862 m!84841))

(declare-fun m!84843 () Bool)

(assert (=> start!10862 m!84843))

(declare-fun m!84845 () Bool)

(assert (=> b!54027 m!84845))

(declare-fun m!84847 () Bool)

(assert (=> b!54026 m!84847))

(declare-fun m!84849 () Bool)

(assert (=> b!54026 m!84849))

(declare-fun m!84851 () Bool)

(assert (=> b!54026 m!84851))

(declare-fun m!84853 () Bool)

(assert (=> b!54023 m!84853))

(declare-fun m!84855 () Bool)

(assert (=> b!54023 m!84855))

(declare-fun m!84857 () Bool)

(assert (=> b!54023 m!84857))

(declare-fun m!84859 () Bool)

(assert (=> b!54028 m!84859))

(declare-fun m!84861 () Bool)

(assert (=> b!54024 m!84861))

(assert (=> b!54024 m!84861))

(declare-fun m!84863 () Bool)

(assert (=> b!54024 m!84863))

(declare-fun m!84865 () Bool)

(assert (=> b!54024 m!84865))

(assert (=> b!54024 m!84865))

(declare-fun m!84867 () Bool)

(assert (=> b!54024 m!84867))

(check-sat (not b!54025) (not b!54028) (not start!10862) (not b!54026) (not b!54024) (not b!54023) (not b!54027))
(check-sat)
