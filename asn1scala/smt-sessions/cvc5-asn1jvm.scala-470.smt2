; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13776 () Bool)

(assert start!13776)

(declare-fun b!70481 () Bool)

(declare-fun e!45943 () Bool)

(declare-fun e!45938 () Bool)

(assert (=> b!70481 (= e!45943 e!45938)))

(declare-fun res!58147 () Bool)

(assert (=> b!70481 (=> res!58147 e!45938)))

(declare-datatypes ((array!2917 0))(
  ( (array!2918 (arr!1943 (Array (_ BitVec 32) (_ BitVec 8))) (size!1358 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2308 0))(
  ( (BitStream!2309 (buf!1739 array!2917) (currentByte!3453 (_ BitVec 32)) (currentBit!3448 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4721 0))(
  ( (Unit!4722) )
))
(declare-datatypes ((tuple2!6120 0))(
  ( (tuple2!6121 (_1!3174 Unit!4721) (_2!3174 BitStream!2308)) )
))
(declare-fun lt!113481 () tuple2!6120)

(declare-fun lt!113498 () tuple2!6120)

(assert (=> b!70481 (= res!58147 (not (= (size!1358 (buf!1739 (_2!3174 lt!113481))) (size!1358 (buf!1739 (_2!3174 lt!113498))))))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!113485 () (_ BitVec 64))

(declare-fun lt!113504 () (_ BitVec 64))

(assert (=> b!70481 (= lt!113485 (bvsub (bvsub (bvadd lt!113504 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!70481 (= lt!113504 (bitIndex!0 (size!1358 (buf!1739 (_2!3174 lt!113481))) (currentByte!3453 (_2!3174 lt!113481)) (currentBit!3448 (_2!3174 lt!113481))))))

(declare-fun thiss!1379 () BitStream!2308)

(assert (=> b!70481 (= (size!1358 (buf!1739 (_2!3174 lt!113498))) (size!1358 (buf!1739 thiss!1379)))))

(declare-fun b!70482 () Bool)

(declare-fun res!58140 () Bool)

(assert (=> b!70482 (=> res!58140 e!45938)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!70482 (= res!58140 (not (invariant!0 (currentBit!3448 (_2!3174 lt!113481)) (currentByte!3453 (_2!3174 lt!113481)) (size!1358 (buf!1739 (_2!3174 lt!113498))))))))

(declare-fun b!70483 () Bool)

(declare-fun e!45941 () Bool)

(declare-fun e!45936 () Bool)

(assert (=> b!70483 (= e!45941 e!45936)))

(declare-fun res!58157 () Bool)

(assert (=> b!70483 (=> res!58157 e!45936)))

(declare-datatypes ((List!729 0))(
  ( (Nil!726) (Cons!725 (h!844 Bool) (t!1479 List!729)) )
))
(declare-fun lt!113497 () List!729)

(declare-fun lt!113487 () List!729)

(assert (=> b!70483 (= res!58157 (not (= lt!113497 lt!113487)))))

(assert (=> b!70483 (= lt!113487 lt!113497)))

(declare-fun lt!113500 () List!729)

(declare-fun tail!333 (List!729) List!729)

(assert (=> b!70483 (= lt!113497 (tail!333 lt!113500))))

(declare-datatypes ((tuple2!6122 0))(
  ( (tuple2!6123 (_1!3175 BitStream!2308) (_2!3175 BitStream!2308)) )
))
(declare-fun lt!113483 () tuple2!6122)

(declare-fun lt!113502 () tuple2!6122)

(declare-fun lt!113501 () Unit!4721)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2308 BitStream!2308 BitStream!2308 BitStream!2308 (_ BitVec 64) List!729) Unit!4721)

(assert (=> b!70483 (= lt!113501 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3174 lt!113498) (_2!3174 lt!113498) (_1!3175 lt!113483) (_1!3175 lt!113502) (bvsub to!314 i!635) lt!113500))))

(declare-fun b!70484 () Bool)

(declare-fun res!58144 () Bool)

(declare-fun e!45935 () Bool)

(assert (=> b!70484 (=> (not res!58144) (not e!45935))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!70484 (= res!58144 (validate_offset_bits!1 ((_ sign_extend 32) (size!1358 (buf!1739 thiss!1379))) ((_ sign_extend 32) (currentByte!3453 thiss!1379)) ((_ sign_extend 32) (currentBit!3448 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!70485 () Bool)

(declare-fun e!45930 () Bool)

(assert (=> b!70485 (= e!45936 e!45930)))

(declare-fun res!58143 () Bool)

(assert (=> b!70485 (=> res!58143 e!45930)))

(declare-fun lt!113486 () (_ BitVec 64))

(declare-fun lt!113506 () Bool)

(declare-fun bitAt!0 (array!2917 (_ BitVec 64)) Bool)

(assert (=> b!70485 (= res!58143 (not (= lt!113506 (bitAt!0 (buf!1739 (_1!3175 lt!113502)) lt!113486))))))

(assert (=> b!70485 (= lt!113506 (bitAt!0 (buf!1739 (_1!3175 lt!113483)) lt!113486))))

(declare-fun b!70486 () Bool)

(declare-fun res!58138 () Bool)

(assert (=> b!70486 (=> res!58138 e!45941)))

(declare-fun length!357 (List!729) Int)

(assert (=> b!70486 (= res!58138 (<= (length!357 lt!113500) 0))))

(declare-fun e!45928 () Bool)

(declare-fun lt!113499 () Bool)

(declare-fun lt!113489 () (_ BitVec 64))

(declare-fun lt!113505 () Bool)

(declare-fun b!70487 () Bool)

(assert (=> b!70487 (= e!45928 (or (not (= lt!113499 lt!113505)) (let ((bdg!3309 (bvand lt!113486 #b1000000000000000000000000000000000000000000000000000000000000000))) (or (not (= bdg!3309 (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= bdg!3309 (bvand lt!113489 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun res!58142 () Bool)

(assert (=> start!13776 (=> (not res!58142) (not e!45935))))

(declare-fun srcBuffer!2 () array!2917)

(assert (=> start!13776 (= res!58142 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1358 srcBuffer!2))))))))

(assert (=> start!13776 e!45935))

(assert (=> start!13776 true))

(declare-fun array_inv!1213 (array!2917) Bool)

(assert (=> start!13776 (array_inv!1213 srcBuffer!2)))

(declare-fun e!45944 () Bool)

(declare-fun inv!12 (BitStream!2308) Bool)

(assert (=> start!13776 (and (inv!12 thiss!1379) e!45944)))

(declare-fun b!70480 () Bool)

(declare-fun res!58146 () Bool)

(assert (=> b!70480 (=> res!58146 e!45938)))

(assert (=> b!70480 (= res!58146 (not (invariant!0 (currentBit!3448 (_2!3174 lt!113481)) (currentByte!3453 (_2!3174 lt!113481)) (size!1358 (buf!1739 (_2!3174 lt!113481))))))))

(declare-fun b!70488 () Bool)

(declare-fun e!45940 () Bool)

(assert (=> b!70488 (= e!45940 e!45928)))

(declare-fun res!58156 () Bool)

(assert (=> b!70488 (=> res!58156 e!45928)))

(declare-fun lt!113480 () Bool)

(declare-fun lt!113484 () Bool)

(assert (=> b!70488 (= res!58156 (not (= lt!113480 lt!113484)))))

(declare-fun lt!113488 () Bool)

(assert (=> b!70488 (= lt!113488 lt!113480)))

(assert (=> b!70488 (= lt!113480 (bitAt!0 (buf!1739 (_2!3174 lt!113498)) lt!113486))))

(declare-fun lt!113492 () Unit!4721)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2917 array!2917 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4721)

(assert (=> b!70488 (= lt!113492 (arrayBitRangesEqImpliesEq!0 (buf!1739 (_2!3174 lt!113481)) (buf!1739 (_2!3174 lt!113498)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!113486 lt!113504))))

(declare-fun b!70489 () Bool)

(declare-fun e!45933 () Bool)

(assert (=> b!70489 (= e!45933 e!45943)))

(declare-fun res!58149 () Bool)

(assert (=> b!70489 (=> res!58149 e!45943)))

(assert (=> b!70489 (= res!58149 (not (= lt!113485 (bvsub lt!113489 i!635))))))

(assert (=> b!70489 (= lt!113485 (bitIndex!0 (size!1358 (buf!1739 (_2!3174 lt!113498))) (currentByte!3453 (_2!3174 lt!113498)) (currentBit!3448 (_2!3174 lt!113498))))))

(assert (=> b!70489 (= lt!113489 (bvadd lt!113486 to!314))))

(declare-fun b!70490 () Bool)

(declare-fun e!45942 () Bool)

(assert (=> b!70490 (= e!45930 e!45942)))

(declare-fun res!58151 () Bool)

(assert (=> b!70490 (=> res!58151 e!45942)))

(assert (=> b!70490 (= res!58151 (not (= lt!113499 lt!113506)))))

(declare-fun head!548 (List!729) Bool)

(assert (=> b!70490 (= lt!113499 (head!548 lt!113500))))

(declare-fun b!70491 () Bool)

(declare-fun res!58148 () Bool)

(assert (=> b!70491 (=> res!58148 e!45943)))

(assert (=> b!70491 (= res!58148 (not (= (size!1358 (buf!1739 thiss!1379)) (size!1358 (buf!1739 (_2!3174 lt!113498))))))))

(declare-fun b!70492 () Bool)

(declare-fun e!45929 () Bool)

(declare-fun e!45934 () Bool)

(assert (=> b!70492 (= e!45929 e!45934)))

(declare-fun res!58153 () Bool)

(assert (=> b!70492 (=> res!58153 e!45934)))

(declare-fun isPrefixOf!0 (BitStream!2308 BitStream!2308) Bool)

(assert (=> b!70492 (= res!58153 (not (isPrefixOf!0 thiss!1379 (_2!3174 lt!113481))))))

(declare-fun lt!113482 () (_ BitVec 64))

(assert (=> b!70492 (validate_offset_bits!1 ((_ sign_extend 32) (size!1358 (buf!1739 (_2!3174 lt!113481)))) ((_ sign_extend 32) (currentByte!3453 (_2!3174 lt!113481))) ((_ sign_extend 32) (currentBit!3448 (_2!3174 lt!113481))) lt!113482)))

(assert (=> b!70492 (= lt!113482 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!113496 () Unit!4721)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2308 BitStream!2308 (_ BitVec 64) (_ BitVec 64)) Unit!4721)

(assert (=> b!70492 (= lt!113496 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3174 lt!113481) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2308 (_ BitVec 8) (_ BitVec 32)) tuple2!6120)

(assert (=> b!70492 (= lt!113481 (appendBitFromByte!0 thiss!1379 (select (arr!1943 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!70493 () Bool)

(assert (=> b!70493 (= e!45938 e!45941)))

(declare-fun res!58150 () Bool)

(assert (=> b!70493 (=> res!58150 e!45941)))

(assert (=> b!70493 (= res!58150 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2308 BitStream!2308 (_ BitVec 64)) List!729)

(assert (=> b!70493 (= lt!113487 (bitStreamReadBitsIntoList!0 (_2!3174 lt!113498) (_1!3175 lt!113502) lt!113482))))

(assert (=> b!70493 (= lt!113500 (bitStreamReadBitsIntoList!0 (_2!3174 lt!113498) (_1!3175 lt!113483) (bvsub to!314 i!635)))))

(assert (=> b!70493 (validate_offset_bits!1 ((_ sign_extend 32) (size!1358 (buf!1739 (_2!3174 lt!113498)))) ((_ sign_extend 32) (currentByte!3453 (_2!3174 lt!113481))) ((_ sign_extend 32) (currentBit!3448 (_2!3174 lt!113481))) lt!113482)))

(declare-fun lt!113494 () Unit!4721)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2308 array!2917 (_ BitVec 64)) Unit!4721)

(assert (=> b!70493 (= lt!113494 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3174 lt!113481) (buf!1739 (_2!3174 lt!113498)) lt!113482))))

(declare-fun reader!0 (BitStream!2308 BitStream!2308) tuple2!6122)

(assert (=> b!70493 (= lt!113502 (reader!0 (_2!3174 lt!113481) (_2!3174 lt!113498)))))

(assert (=> b!70493 (validate_offset_bits!1 ((_ sign_extend 32) (size!1358 (buf!1739 (_2!3174 lt!113498)))) ((_ sign_extend 32) (currentByte!3453 thiss!1379)) ((_ sign_extend 32) (currentBit!3448 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!113495 () Unit!4721)

(assert (=> b!70493 (= lt!113495 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1739 (_2!3174 lt!113498)) (bvsub to!314 i!635)))))

(assert (=> b!70493 (= lt!113483 (reader!0 thiss!1379 (_2!3174 lt!113498)))))

(declare-fun b!70494 () Bool)

(assert (=> b!70494 (= e!45944 (array_inv!1213 (buf!1739 thiss!1379)))))

(declare-fun lt!113493 () tuple2!6122)

(declare-fun b!70495 () Bool)

(declare-fun e!45932 () Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2308 array!2917 (_ BitVec 64) (_ BitVec 64)) List!729)

(assert (=> b!70495 (= e!45932 (= (head!548 (byteArrayBitContentToList!0 (_2!3174 lt!113481) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!548 (bitStreamReadBitsIntoList!0 (_2!3174 lt!113481) (_1!3175 lt!113493) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!70496 () Bool)

(assert (=> b!70496 (= e!45935 (not e!45929))))

(declare-fun res!58154 () Bool)

(assert (=> b!70496 (=> res!58154 e!45929)))

(assert (=> b!70496 (= res!58154 (bvsge i!635 to!314))))

(assert (=> b!70496 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!113490 () Unit!4721)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2308) Unit!4721)

(assert (=> b!70496 (= lt!113490 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!70496 (= lt!113486 (bitIndex!0 (size!1358 (buf!1739 thiss!1379)) (currentByte!3453 thiss!1379) (currentBit!3448 thiss!1379)))))

(declare-fun b!70497 () Bool)

(declare-fun e!45931 () Bool)

(assert (=> b!70497 (= e!45931 e!45940)))

(declare-fun res!58145 () Bool)

(assert (=> b!70497 (=> res!58145 e!45940)))

(assert (=> b!70497 (= res!58145 (not (= lt!113488 lt!113484)))))

(assert (=> b!70497 (= lt!113488 (bitAt!0 (buf!1739 (_2!3174 lt!113481)) lt!113486))))

(declare-fun b!70498 () Bool)

(assert (=> b!70498 (= e!45934 e!45933)))

(declare-fun res!58139 () Bool)

(assert (=> b!70498 (=> res!58139 e!45933)))

(assert (=> b!70498 (= res!58139 (not (isPrefixOf!0 (_2!3174 lt!113481) (_2!3174 lt!113498))))))

(assert (=> b!70498 (isPrefixOf!0 thiss!1379 (_2!3174 lt!113498))))

(declare-fun lt!113503 () Unit!4721)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2308 BitStream!2308 BitStream!2308) Unit!4721)

(assert (=> b!70498 (= lt!113503 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3174 lt!113481) (_2!3174 lt!113498)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2308 array!2917 (_ BitVec 64) (_ BitVec 64)) tuple2!6120)

(assert (=> b!70498 (= lt!113498 (appendBitsMSBFirstLoop!0 (_2!3174 lt!113481) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!70498 e!45932))

(declare-fun res!58155 () Bool)

(assert (=> b!70498 (=> (not res!58155) (not e!45932))))

(assert (=> b!70498 (= res!58155 (validate_offset_bits!1 ((_ sign_extend 32) (size!1358 (buf!1739 (_2!3174 lt!113481)))) ((_ sign_extend 32) (currentByte!3453 thiss!1379)) ((_ sign_extend 32) (currentBit!3448 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!113491 () Unit!4721)

(assert (=> b!70498 (= lt!113491 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1739 (_2!3174 lt!113481)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!70498 (= lt!113493 (reader!0 thiss!1379 (_2!3174 lt!113481)))))

(declare-fun b!70499 () Bool)

(declare-fun res!58158 () Bool)

(assert (=> b!70499 (=> res!58158 e!45943)))

(assert (=> b!70499 (= res!58158 (not (invariant!0 (currentBit!3448 (_2!3174 lt!113498)) (currentByte!3453 (_2!3174 lt!113498)) (size!1358 (buf!1739 (_2!3174 lt!113498))))))))

(declare-fun b!70500 () Bool)

(assert (=> b!70500 (= e!45942 e!45931)))

(declare-fun res!58141 () Bool)

(assert (=> b!70500 (=> res!58141 e!45931)))

(assert (=> b!70500 (= res!58141 (not (= lt!113505 lt!113484)))))

(assert (=> b!70500 (= lt!113484 (bitAt!0 srcBuffer!2 i!635))))

(assert (=> b!70500 (= lt!113505 (head!548 (byteArrayBitContentToList!0 (_2!3174 lt!113498) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(declare-fun b!70501 () Bool)

(declare-fun res!58152 () Bool)

(assert (=> b!70501 (=> res!58152 e!45928)))

(declare-datatypes ((tuple2!6124 0))(
  ( (tuple2!6125 (_1!3176 BitStream!2308) (_2!3176 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!2308) tuple2!6124)

(assert (=> b!70501 (= res!58152 (not (= (_2!3176 (readBitPure!0 (_1!3175 lt!113483))) lt!113484)))))

(assert (= (and start!13776 res!58142) b!70484))

(assert (= (and b!70484 res!58144) b!70496))

(assert (= (and b!70496 (not res!58154)) b!70492))

(assert (= (and b!70492 (not res!58153)) b!70498))

(assert (= (and b!70498 res!58155) b!70495))

(assert (= (and b!70498 (not res!58139)) b!70489))

(assert (= (and b!70489 (not res!58149)) b!70499))

(assert (= (and b!70499 (not res!58158)) b!70491))

(assert (= (and b!70491 (not res!58148)) b!70481))

(assert (= (and b!70481 (not res!58147)) b!70480))

(assert (= (and b!70480 (not res!58146)) b!70482))

(assert (= (and b!70482 (not res!58140)) b!70493))

(assert (= (and b!70493 (not res!58150)) b!70486))

(assert (= (and b!70486 (not res!58138)) b!70483))

(assert (= (and b!70483 (not res!58157)) b!70485))

(assert (= (and b!70485 (not res!58143)) b!70490))

(assert (= (and b!70490 (not res!58151)) b!70500))

(assert (= (and b!70500 (not res!58141)) b!70497))

(assert (= (and b!70497 (not res!58145)) b!70488))

(assert (= (and b!70488 (not res!58156)) b!70501))

(assert (= (and b!70501 (not res!58152)) b!70487))

(assert (= start!13776 b!70494))

(declare-fun m!112879 () Bool)

(assert (=> b!70492 m!112879))

(declare-fun m!112881 () Bool)

(assert (=> b!70492 m!112881))

(declare-fun m!112883 () Bool)

(assert (=> b!70492 m!112883))

(declare-fun m!112885 () Bool)

(assert (=> b!70492 m!112885))

(assert (=> b!70492 m!112879))

(declare-fun m!112887 () Bool)

(assert (=> b!70492 m!112887))

(declare-fun m!112889 () Bool)

(assert (=> b!70490 m!112889))

(declare-fun m!112891 () Bool)

(assert (=> b!70500 m!112891))

(declare-fun m!112893 () Bool)

(assert (=> b!70500 m!112893))

(assert (=> b!70500 m!112893))

(declare-fun m!112895 () Bool)

(assert (=> b!70500 m!112895))

(declare-fun m!112897 () Bool)

(assert (=> b!70501 m!112897))

(declare-fun m!112899 () Bool)

(assert (=> b!70496 m!112899))

(declare-fun m!112901 () Bool)

(assert (=> b!70496 m!112901))

(declare-fun m!112903 () Bool)

(assert (=> b!70496 m!112903))

(declare-fun m!112905 () Bool)

(assert (=> b!70489 m!112905))

(declare-fun m!112907 () Bool)

(assert (=> b!70498 m!112907))

(declare-fun m!112909 () Bool)

(assert (=> b!70498 m!112909))

(declare-fun m!112911 () Bool)

(assert (=> b!70498 m!112911))

(declare-fun m!112913 () Bool)

(assert (=> b!70498 m!112913))

(declare-fun m!112915 () Bool)

(assert (=> b!70498 m!112915))

(declare-fun m!112917 () Bool)

(assert (=> b!70498 m!112917))

(declare-fun m!112919 () Bool)

(assert (=> b!70498 m!112919))

(declare-fun m!112921 () Bool)

(assert (=> b!70499 m!112921))

(declare-fun m!112923 () Bool)

(assert (=> b!70480 m!112923))

(declare-fun m!112925 () Bool)

(assert (=> b!70484 m!112925))

(declare-fun m!112927 () Bool)

(assert (=> b!70481 m!112927))

(declare-fun m!112929 () Bool)

(assert (=> b!70483 m!112929))

(declare-fun m!112931 () Bool)

(assert (=> b!70483 m!112931))

(declare-fun m!112933 () Bool)

(assert (=> b!70493 m!112933))

(declare-fun m!112935 () Bool)

(assert (=> b!70493 m!112935))

(declare-fun m!112937 () Bool)

(assert (=> b!70493 m!112937))

(declare-fun m!112939 () Bool)

(assert (=> b!70493 m!112939))

(declare-fun m!112941 () Bool)

(assert (=> b!70493 m!112941))

(declare-fun m!112943 () Bool)

(assert (=> b!70493 m!112943))

(declare-fun m!112945 () Bool)

(assert (=> b!70493 m!112945))

(declare-fun m!112947 () Bool)

(assert (=> b!70493 m!112947))

(declare-fun m!112949 () Bool)

(assert (=> b!70494 m!112949))

(declare-fun m!112951 () Bool)

(assert (=> b!70485 m!112951))

(declare-fun m!112953 () Bool)

(assert (=> b!70485 m!112953))

(declare-fun m!112955 () Bool)

(assert (=> b!70495 m!112955))

(assert (=> b!70495 m!112955))

(declare-fun m!112957 () Bool)

(assert (=> b!70495 m!112957))

(declare-fun m!112959 () Bool)

(assert (=> b!70495 m!112959))

(assert (=> b!70495 m!112959))

(declare-fun m!112961 () Bool)

(assert (=> b!70495 m!112961))

(declare-fun m!112963 () Bool)

(assert (=> b!70486 m!112963))

(declare-fun m!112965 () Bool)

(assert (=> b!70488 m!112965))

(declare-fun m!112967 () Bool)

(assert (=> b!70488 m!112967))

(declare-fun m!112969 () Bool)

(assert (=> start!13776 m!112969))

(declare-fun m!112971 () Bool)

(assert (=> start!13776 m!112971))

(declare-fun m!112973 () Bool)

(assert (=> b!70482 m!112973))

(declare-fun m!112975 () Bool)

(assert (=> b!70497 m!112975))

(push 1)

(assert (not b!70486))

(assert (not b!70484))

(assert (not b!70492))

(assert (not b!70483))

(assert (not b!70499))

(assert (not b!70494))

(assert (not b!70480))

(assert (not b!70501))

(assert (not b!70500))

(assert (not b!70490))

(assert (not b!70496))

(assert (not start!13776))

(assert (not b!70481))

(assert (not b!70497))

(assert (not b!70493))

(assert (not b!70489))

(assert (not b!70498))

(assert (not b!70488))

(assert (not b!70485))

(assert (not b!70482))

(assert (not b!70495))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!22776 () Bool)

(declare-fun res!58396 () Bool)

(declare-fun e!46134 () Bool)

(assert (=> d!22776 (=> (not res!58396) (not e!46134))))

(assert (=> d!22776 (= res!58396 (= (size!1358 (buf!1739 thiss!1379)) (size!1358 (buf!1739 (_2!3174 lt!113481)))))))

(assert (=> d!22776 (= (isPrefixOf!0 thiss!1379 (_2!3174 lt!113481)) e!46134)))

(declare-fun b!70795 () Bool)

(declare-fun res!58397 () Bool)

(assert (=> b!70795 (=> (not res!58397) (not e!46134))))

(assert (=> b!70795 (= res!58397 (bvsle (bitIndex!0 (size!1358 (buf!1739 thiss!1379)) (currentByte!3453 thiss!1379) (currentBit!3448 thiss!1379)) (bitIndex!0 (size!1358 (buf!1739 (_2!3174 lt!113481))) (currentByte!3453 (_2!3174 lt!113481)) (currentBit!3448 (_2!3174 lt!113481)))))))

(declare-fun b!70796 () Bool)

(declare-fun e!46135 () Bool)

(assert (=> b!70796 (= e!46134 e!46135)))

(declare-fun res!58398 () Bool)

(assert (=> b!70796 (=> res!58398 e!46135)))

(assert (=> b!70796 (= res!58398 (= (size!1358 (buf!1739 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!70797 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2917 array!2917 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!70797 (= e!46135 (arrayBitRangesEq!0 (buf!1739 thiss!1379) (buf!1739 (_2!3174 lt!113481)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1358 (buf!1739 thiss!1379)) (currentByte!3453 thiss!1379) (currentBit!3448 thiss!1379))))))

(assert (= (and d!22776 res!58396) b!70795))

(assert (= (and b!70795 res!58397) b!70796))

(assert (= (and b!70796 (not res!58398)) b!70797))

(assert (=> b!70795 m!112903))

(assert (=> b!70795 m!112927))

(assert (=> b!70797 m!112903))

(assert (=> b!70797 m!112903))

(declare-fun m!113413 () Bool)

(assert (=> b!70797 m!113413))

(assert (=> b!70492 d!22776))

(declare-fun d!22778 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!22778 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1358 (buf!1739 (_2!3174 lt!113481)))) ((_ sign_extend 32) (currentByte!3453 (_2!3174 lt!113481))) ((_ sign_extend 32) (currentBit!3448 (_2!3174 lt!113481))) lt!113482) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1358 (buf!1739 (_2!3174 lt!113481)))) ((_ sign_extend 32) (currentByte!3453 (_2!3174 lt!113481))) ((_ sign_extend 32) (currentBit!3448 (_2!3174 lt!113481)))) lt!113482))))

(declare-fun bs!5463 () Bool)

(assert (= bs!5463 d!22778))

(declare-fun m!113415 () Bool)

(assert (=> bs!5463 m!113415))

(assert (=> b!70492 d!22778))

(declare-fun d!22780 () Bool)

(declare-fun e!46138 () Bool)

(assert (=> d!22780 e!46138))

(declare-fun res!58401 () Bool)

(assert (=> d!22780 (=> (not res!58401) (not e!46138))))

(assert (=> d!22780 (= res!58401 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!113917 () Unit!4721)

(declare-fun choose!27 (BitStream!2308 BitStream!2308 (_ BitVec 64) (_ BitVec 64)) Unit!4721)

(assert (=> d!22780 (= lt!113917 (choose!27 thiss!1379 (_2!3174 lt!113481) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!22780 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!22780 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3174 lt!113481) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!113917)))

(declare-fun b!70800 () Bool)

(assert (=> b!70800 (= e!46138 (validate_offset_bits!1 ((_ sign_extend 32) (size!1358 (buf!1739 (_2!3174 lt!113481)))) ((_ sign_extend 32) (currentByte!3453 (_2!3174 lt!113481))) ((_ sign_extend 32) (currentBit!3448 (_2!3174 lt!113481))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!22780 res!58401) b!70800))

(declare-fun m!113417 () Bool)

(assert (=> d!22780 m!113417))

(declare-fun m!113419 () Bool)

(assert (=> b!70800 m!113419))

(assert (=> b!70492 d!22780))

(declare-fun b!70865 () Bool)

(declare-fun e!46170 () Bool)

(declare-fun e!46172 () Bool)

(assert (=> b!70865 (= e!46170 e!46172)))

(declare-fun res!58454 () Bool)

(assert (=> b!70865 (=> (not res!58454) (not e!46172))))

(declare-fun lt!114093 () (_ BitVec 8))

(declare-fun lt!114089 () tuple2!6124)

(declare-fun lt!114097 () tuple2!6120)

(assert (=> b!70865 (= res!58454 (and (= (_2!3176 lt!114089) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1943 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!114093)) #b00000000000000000000000000000000))) (= (_1!3176 lt!114089) (_2!3174 lt!114097))))))

(declare-datatypes ((tuple2!6150 0))(
  ( (tuple2!6151 (_1!3189 array!2917) (_2!3189 BitStream!2308)) )
))
(declare-fun lt!114087 () tuple2!6150)

(declare-fun lt!114096 () BitStream!2308)

(declare-fun readBits!0 (BitStream!2308 (_ BitVec 64)) tuple2!6150)

(assert (=> b!70865 (= lt!114087 (readBits!0 lt!114096 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!70865 (= lt!114089 (readBitPure!0 lt!114096))))

(declare-fun readerFrom!0 (BitStream!2308 (_ BitVec 32) (_ BitVec 32)) BitStream!2308)

(assert (=> b!70865 (= lt!114096 (readerFrom!0 (_2!3174 lt!114097) (currentBit!3448 thiss!1379) (currentByte!3453 thiss!1379)))))

(declare-fun b!70866 () Bool)

(declare-fun res!58450 () Bool)

(declare-fun e!46173 () Bool)

(assert (=> b!70866 (=> (not res!58450) (not e!46173))))

(declare-fun lt!114092 () tuple2!6120)

(assert (=> b!70866 (= res!58450 (isPrefixOf!0 thiss!1379 (_2!3174 lt!114092)))))

(declare-fun b!70867 () Bool)

(declare-fun e!46171 () Bool)

(declare-fun lt!114090 () tuple2!6124)

(assert (=> b!70867 (= e!46171 (= (bitIndex!0 (size!1358 (buf!1739 (_1!3176 lt!114090))) (currentByte!3453 (_1!3176 lt!114090)) (currentBit!3448 (_1!3176 lt!114090))) (bitIndex!0 (size!1358 (buf!1739 (_2!3174 lt!114092))) (currentByte!3453 (_2!3174 lt!114092)) (currentBit!3448 (_2!3174 lt!114092)))))))

(declare-fun d!22782 () Bool)

(assert (=> d!22782 e!46170))

(declare-fun res!58449 () Bool)

(assert (=> d!22782 (=> (not res!58449) (not e!46170))))

(assert (=> d!22782 (= res!58449 (= (size!1358 (buf!1739 (_2!3174 lt!114097))) (size!1358 (buf!1739 thiss!1379))))))

(declare-fun lt!114088 () array!2917)

(assert (=> d!22782 (= lt!114093 (select (arr!1943 lt!114088) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!22782 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1358 lt!114088)))))

(assert (=> d!22782 (= lt!114088 (array!2918 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!114094 () tuple2!6120)

(assert (=> d!22782 (= lt!114097 (tuple2!6121 (_1!3174 lt!114094) (_2!3174 lt!114094)))))

(assert (=> d!22782 (= lt!114094 lt!114092)))

(assert (=> d!22782 e!46173))

(declare-fun res!58452 () Bool)

(assert (=> d!22782 (=> (not res!58452) (not e!46173))))

(assert (=> d!22782 (= res!58452 (= (size!1358 (buf!1739 thiss!1379)) (size!1358 (buf!1739 (_2!3174 lt!114092)))))))

(declare-fun lt!114095 () Bool)

(declare-fun appendBit!0 (BitStream!2308 Bool) tuple2!6120)

(assert (=> d!22782 (= lt!114092 (appendBit!0 thiss!1379 lt!114095))))

(assert (=> d!22782 (= lt!114095 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1943 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!22782 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!22782 (= (appendBitFromByte!0 thiss!1379 (select (arr!1943 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!114097)))

(declare-fun b!70868 () Bool)

(assert (=> b!70868 (= e!46172 (= (bitIndex!0 (size!1358 (buf!1739 (_1!3176 lt!114089))) (currentByte!3453 (_1!3176 lt!114089)) (currentBit!3448 (_1!3176 lt!114089))) (bitIndex!0 (size!1358 (buf!1739 (_2!3174 lt!114097))) (currentByte!3453 (_2!3174 lt!114097)) (currentBit!3448 (_2!3174 lt!114097)))))))

(declare-fun b!70869 () Bool)

(assert (=> b!70869 (= e!46173 e!46171)))

(declare-fun res!58453 () Bool)

(assert (=> b!70869 (=> (not res!58453) (not e!46171))))

(assert (=> b!70869 (= res!58453 (and (= (_2!3176 lt!114090) lt!114095) (= (_1!3176 lt!114090) (_2!3174 lt!114092))))))

(assert (=> b!70869 (= lt!114090 (readBitPure!0 (readerFrom!0 (_2!3174 lt!114092) (currentBit!3448 thiss!1379) (currentByte!3453 thiss!1379))))))

(declare-fun b!70870 () Bool)

(declare-fun res!58455 () Bool)

(assert (=> b!70870 (=> (not res!58455) (not e!46173))))

(assert (=> b!70870 (= res!58455 (= (bitIndex!0 (size!1358 (buf!1739 (_2!3174 lt!114092))) (currentByte!3453 (_2!3174 lt!114092)) (currentBit!3448 (_2!3174 lt!114092))) (bvadd (bitIndex!0 (size!1358 (buf!1739 thiss!1379)) (currentByte!3453 thiss!1379) (currentBit!3448 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!70871 () Bool)

(declare-fun res!58451 () Bool)

(assert (=> b!70871 (=> (not res!58451) (not e!46170))))

(declare-fun lt!114091 () (_ BitVec 64))

(declare-fun lt!114098 () (_ BitVec 64))

(assert (=> b!70871 (= res!58451 (= (bitIndex!0 (size!1358 (buf!1739 (_2!3174 lt!114097))) (currentByte!3453 (_2!3174 lt!114097)) (currentBit!3448 (_2!3174 lt!114097))) (bvadd lt!114091 lt!114098)))))

(assert (=> b!70871 (or (not (= (bvand lt!114091 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!114098 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!114091 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!114091 lt!114098) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!70871 (= lt!114098 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!70871 (= lt!114091 (bitIndex!0 (size!1358 (buf!1739 thiss!1379)) (currentByte!3453 thiss!1379) (currentBit!3448 thiss!1379)))))

(declare-fun b!70872 () Bool)

(declare-fun res!58456 () Bool)

(assert (=> b!70872 (=> (not res!58456) (not e!46170))))

(assert (=> b!70872 (= res!58456 (isPrefixOf!0 thiss!1379 (_2!3174 lt!114097)))))

(assert (= (and d!22782 res!58452) b!70870))

(assert (= (and b!70870 res!58455) b!70866))

(assert (= (and b!70866 res!58450) b!70869))

(assert (= (and b!70869 res!58453) b!70867))

(assert (= (and d!22782 res!58449) b!70871))

(assert (= (and b!70871 res!58451) b!70872))

(assert (= (and b!70872 res!58456) b!70865))

(assert (= (and b!70865 res!58454) b!70868))

(declare-fun m!113523 () Bool)

(assert (=> b!70872 m!113523))

(declare-fun m!113525 () Bool)

(assert (=> b!70866 m!113525))

(declare-fun m!113527 () Bool)

(assert (=> b!70871 m!113527))

(assert (=> b!70871 m!112903))

(declare-fun m!113529 () Bool)

(assert (=> b!70867 m!113529))

(declare-fun m!113531 () Bool)

(assert (=> b!70867 m!113531))

(declare-fun m!113533 () Bool)

(assert (=> b!70868 m!113533))

(assert (=> b!70868 m!113527))

(declare-fun m!113535 () Bool)

(assert (=> b!70865 m!113535))

(declare-fun m!113537 () Bool)

(assert (=> b!70865 m!113537))

(declare-fun m!113539 () Bool)

(assert (=> b!70865 m!113539))

(declare-fun m!113541 () Bool)

(assert (=> b!70869 m!113541))

(assert (=> b!70869 m!113541))

(declare-fun m!113543 () Bool)

(assert (=> b!70869 m!113543))

(declare-fun m!113545 () Bool)

(assert (=> d!22782 m!113545))

(declare-fun m!113547 () Bool)

(assert (=> d!22782 m!113547))

(declare-fun m!113549 () Bool)

(assert (=> d!22782 m!113549))

(assert (=> b!70870 m!113531))

(assert (=> b!70870 m!112903))

(assert (=> b!70492 d!22782))

(declare-fun d!22830 () Bool)

(declare-fun e!46176 () Bool)

(assert (=> d!22830 e!46176))

(declare-fun res!58461 () Bool)

(assert (=> d!22830 (=> (not res!58461) (not e!46176))))

(declare-fun lt!114114 () (_ BitVec 64))

(declare-fun lt!114116 () (_ BitVec 64))

(declare-fun lt!114113 () (_ BitVec 64))

(assert (=> d!22830 (= res!58461 (= lt!114116 (bvsub lt!114114 lt!114113)))))

(assert (=> d!22830 (or (= (bvand lt!114114 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!114113 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!114114 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!114114 lt!114113) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!22830 (= lt!114113 (remainingBits!0 ((_ sign_extend 32) (size!1358 (buf!1739 (_2!3174 lt!113481)))) ((_ sign_extend 32) (currentByte!3453 (_2!3174 lt!113481))) ((_ sign_extend 32) (currentBit!3448 (_2!3174 lt!113481)))))))

(declare-fun lt!114111 () (_ BitVec 64))

(declare-fun lt!114115 () (_ BitVec 64))

(assert (=> d!22830 (= lt!114114 (bvmul lt!114111 lt!114115))))

(assert (=> d!22830 (or (= lt!114111 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!114115 (bvsdiv (bvmul lt!114111 lt!114115) lt!114111)))))

(assert (=> d!22830 (= lt!114115 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!22830 (= lt!114111 ((_ sign_extend 32) (size!1358 (buf!1739 (_2!3174 lt!113481)))))))

(assert (=> d!22830 (= lt!114116 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3453 (_2!3174 lt!113481))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3448 (_2!3174 lt!113481)))))))

(assert (=> d!22830 (invariant!0 (currentBit!3448 (_2!3174 lt!113481)) (currentByte!3453 (_2!3174 lt!113481)) (size!1358 (buf!1739 (_2!3174 lt!113481))))))

(assert (=> d!22830 (= (bitIndex!0 (size!1358 (buf!1739 (_2!3174 lt!113481))) (currentByte!3453 (_2!3174 lt!113481)) (currentBit!3448 (_2!3174 lt!113481))) lt!114116)))

(declare-fun b!70877 () Bool)

(declare-fun res!58462 () Bool)

(assert (=> b!70877 (=> (not res!58462) (not e!46176))))

(assert (=> b!70877 (= res!58462 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!114116))))

(declare-fun b!70878 () Bool)

(declare-fun lt!114112 () (_ BitVec 64))

(assert (=> b!70878 (= e!46176 (bvsle lt!114116 (bvmul lt!114112 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!70878 (or (= lt!114112 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!114112 #b0000000000000000000000000000000000000000000000000000000000001000) lt!114112)))))

(assert (=> b!70878 (= lt!114112 ((_ sign_extend 32) (size!1358 (buf!1739 (_2!3174 lt!113481)))))))

(assert (= (and d!22830 res!58461) b!70877))

(assert (= (and b!70877 res!58462) b!70878))

(assert (=> d!22830 m!113415))

(assert (=> d!22830 m!112923))

(assert (=> b!70481 d!22830))

(declare-fun d!22832 () Bool)

(assert (=> d!22832 (= (invariant!0 (currentBit!3448 (_2!3174 lt!113481)) (currentByte!3453 (_2!3174 lt!113481)) (size!1358 (buf!1739 (_2!3174 lt!113498)))) (and (bvsge (currentBit!3448 (_2!3174 lt!113481)) #b00000000000000000000000000000000) (bvslt (currentBit!3448 (_2!3174 lt!113481)) #b00000000000000000000000000001000) (bvsge (currentByte!3453 (_2!3174 lt!113481)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3453 (_2!3174 lt!113481)) (size!1358 (buf!1739 (_2!3174 lt!113498)))) (and (= (currentBit!3448 (_2!3174 lt!113481)) #b00000000000000000000000000000000) (= (currentByte!3453 (_2!3174 lt!113481)) (size!1358 (buf!1739 (_2!3174 lt!113498))))))))))

(assert (=> b!70482 d!22832))

(declare-fun b!70889 () Bool)

(declare-fun res!58469 () Bool)

(declare-fun e!46181 () Bool)

(assert (=> b!70889 (=> (not res!58469) (not e!46181))))

(declare-fun lt!114161 () tuple2!6122)

(assert (=> b!70889 (= res!58469 (isPrefixOf!0 (_1!3175 lt!114161) (_2!3174 lt!113481)))))

(declare-fun d!22834 () Bool)

(assert (=> d!22834 e!46181))

(declare-fun res!58470 () Bool)

(assert (=> d!22834 (=> (not res!58470) (not e!46181))))

(assert (=> d!22834 (= res!58470 (isPrefixOf!0 (_1!3175 lt!114161) (_2!3175 lt!114161)))))

(declare-fun lt!114159 () BitStream!2308)

(assert (=> d!22834 (= lt!114161 (tuple2!6123 lt!114159 (_2!3174 lt!113498)))))

(declare-fun lt!114170 () Unit!4721)

(declare-fun lt!114172 () Unit!4721)

(assert (=> d!22834 (= lt!114170 lt!114172)))

(assert (=> d!22834 (isPrefixOf!0 lt!114159 (_2!3174 lt!113498))))

(assert (=> d!22834 (= lt!114172 (lemmaIsPrefixTransitive!0 lt!114159 (_2!3174 lt!113498) (_2!3174 lt!113498)))))

(declare-fun lt!114175 () Unit!4721)

(declare-fun lt!114166 () Unit!4721)

(assert (=> d!22834 (= lt!114175 lt!114166)))

(assert (=> d!22834 (isPrefixOf!0 lt!114159 (_2!3174 lt!113498))))

(assert (=> d!22834 (= lt!114166 (lemmaIsPrefixTransitive!0 lt!114159 (_2!3174 lt!113481) (_2!3174 lt!113498)))))

(declare-fun lt!114167 () Unit!4721)

(declare-fun e!46182 () Unit!4721)

(assert (=> d!22834 (= lt!114167 e!46182)))

(declare-fun c!5300 () Bool)

(assert (=> d!22834 (= c!5300 (not (= (size!1358 (buf!1739 (_2!3174 lt!113481))) #b00000000000000000000000000000000)))))

(declare-fun lt!114171 () Unit!4721)

(declare-fun lt!114158 () Unit!4721)

(assert (=> d!22834 (= lt!114171 lt!114158)))

(assert (=> d!22834 (isPrefixOf!0 (_2!3174 lt!113498) (_2!3174 lt!113498))))

(assert (=> d!22834 (= lt!114158 (lemmaIsPrefixRefl!0 (_2!3174 lt!113498)))))

(declare-fun lt!114160 () Unit!4721)

(declare-fun lt!114157 () Unit!4721)

(assert (=> d!22834 (= lt!114160 lt!114157)))

(assert (=> d!22834 (= lt!114157 (lemmaIsPrefixRefl!0 (_2!3174 lt!113498)))))

(declare-fun lt!114168 () Unit!4721)

(declare-fun lt!114174 () Unit!4721)

(assert (=> d!22834 (= lt!114168 lt!114174)))

(assert (=> d!22834 (isPrefixOf!0 lt!114159 lt!114159)))

(assert (=> d!22834 (= lt!114174 (lemmaIsPrefixRefl!0 lt!114159))))

(declare-fun lt!114165 () Unit!4721)

(declare-fun lt!114164 () Unit!4721)

(assert (=> d!22834 (= lt!114165 lt!114164)))

(assert (=> d!22834 (isPrefixOf!0 (_2!3174 lt!113481) (_2!3174 lt!113481))))

(assert (=> d!22834 (= lt!114164 (lemmaIsPrefixRefl!0 (_2!3174 lt!113481)))))

(assert (=> d!22834 (= lt!114159 (BitStream!2309 (buf!1739 (_2!3174 lt!113498)) (currentByte!3453 (_2!3174 lt!113481)) (currentBit!3448 (_2!3174 lt!113481))))))

(assert (=> d!22834 (isPrefixOf!0 (_2!3174 lt!113481) (_2!3174 lt!113498))))

(assert (=> d!22834 (= (reader!0 (_2!3174 lt!113481) (_2!3174 lt!113498)) lt!114161)))

(declare-fun b!70890 () Bool)

(declare-fun lt!114176 () (_ BitVec 64))

(declare-fun lt!114163 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2308 (_ BitVec 64)) BitStream!2308)

(assert (=> b!70890 (= e!46181 (= (_1!3175 lt!114161) (withMovedBitIndex!0 (_2!3175 lt!114161) (bvsub lt!114176 lt!114163))))))

(assert (=> b!70890 (or (= (bvand lt!114176 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!114163 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!114176 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!114176 lt!114163) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!70890 (= lt!114163 (bitIndex!0 (size!1358 (buf!1739 (_2!3174 lt!113498))) (currentByte!3453 (_2!3174 lt!113498)) (currentBit!3448 (_2!3174 lt!113498))))))

(assert (=> b!70890 (= lt!114176 (bitIndex!0 (size!1358 (buf!1739 (_2!3174 lt!113481))) (currentByte!3453 (_2!3174 lt!113481)) (currentBit!3448 (_2!3174 lt!113481))))))

(declare-fun b!70891 () Bool)

(declare-fun lt!114173 () Unit!4721)

(assert (=> b!70891 (= e!46182 lt!114173)))

(declare-fun lt!114169 () (_ BitVec 64))

(assert (=> b!70891 (= lt!114169 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!114162 () (_ BitVec 64))

(assert (=> b!70891 (= lt!114162 (bitIndex!0 (size!1358 (buf!1739 (_2!3174 lt!113481))) (currentByte!3453 (_2!3174 lt!113481)) (currentBit!3448 (_2!3174 lt!113481))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2917 array!2917 (_ BitVec 64) (_ BitVec 64)) Unit!4721)

(assert (=> b!70891 (= lt!114173 (arrayBitRangesEqSymmetric!0 (buf!1739 (_2!3174 lt!113481)) (buf!1739 (_2!3174 lt!113498)) lt!114169 lt!114162))))

(assert (=> b!70891 (arrayBitRangesEq!0 (buf!1739 (_2!3174 lt!113498)) (buf!1739 (_2!3174 lt!113481)) lt!114169 lt!114162)))

(declare-fun b!70892 () Bool)

(declare-fun Unit!4739 () Unit!4721)

(assert (=> b!70892 (= e!46182 Unit!4739)))

(declare-fun b!70893 () Bool)

(declare-fun res!58471 () Bool)

(assert (=> b!70893 (=> (not res!58471) (not e!46181))))

(assert (=> b!70893 (= res!58471 (isPrefixOf!0 (_2!3175 lt!114161) (_2!3174 lt!113498)))))

(assert (= (and d!22834 c!5300) b!70891))

(assert (= (and d!22834 (not c!5300)) b!70892))

(assert (= (and d!22834 res!58470) b!70889))

(assert (= (and b!70889 res!58469) b!70893))

(assert (= (and b!70893 res!58471) b!70890))

(declare-fun m!113551 () Bool)

(assert (=> b!70889 m!113551))

(declare-fun m!113553 () Bool)

(assert (=> d!22834 m!113553))

(declare-fun m!113555 () Bool)

(assert (=> d!22834 m!113555))

(declare-fun m!113557 () Bool)

(assert (=> d!22834 m!113557))

(declare-fun m!113559 () Bool)

(assert (=> d!22834 m!113559))

(declare-fun m!113561 () Bool)

(assert (=> d!22834 m!113561))

(assert (=> d!22834 m!112919))

(declare-fun m!113563 () Bool)

(assert (=> d!22834 m!113563))

(declare-fun m!113565 () Bool)

(assert (=> d!22834 m!113565))

(declare-fun m!113567 () Bool)

(assert (=> d!22834 m!113567))

(declare-fun m!113569 () Bool)

(assert (=> d!22834 m!113569))

(declare-fun m!113571 () Bool)

(assert (=> d!22834 m!113571))

(declare-fun m!113573 () Bool)

(assert (=> b!70890 m!113573))

(assert (=> b!70890 m!112905))

(assert (=> b!70890 m!112927))

(assert (=> b!70891 m!112927))

(declare-fun m!113575 () Bool)

(assert (=> b!70891 m!113575))

(declare-fun m!113577 () Bool)

(assert (=> b!70891 m!113577))

(declare-fun m!113579 () Bool)

(assert (=> b!70893 m!113579))

(assert (=> b!70493 d!22834))

(declare-fun d!22836 () Bool)

(assert (=> d!22836 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1358 (buf!1739 (_2!3174 lt!113498)))) ((_ sign_extend 32) (currentByte!3453 thiss!1379)) ((_ sign_extend 32) (currentBit!3448 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1358 (buf!1739 (_2!3174 lt!113498)))) ((_ sign_extend 32) (currentByte!3453 thiss!1379)) ((_ sign_extend 32) (currentBit!3448 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5471 () Bool)

(assert (= bs!5471 d!22836))

(declare-fun m!113581 () Bool)

(assert (=> bs!5471 m!113581))

(assert (=> b!70493 d!22836))

(declare-fun d!22838 () Bool)

(assert (=> d!22838 (validate_offset_bits!1 ((_ sign_extend 32) (size!1358 (buf!1739 (_2!3174 lt!113498)))) ((_ sign_extend 32) (currentByte!3453 thiss!1379)) ((_ sign_extend 32) (currentBit!3448 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!114179 () Unit!4721)

(declare-fun choose!9 (BitStream!2308 array!2917 (_ BitVec 64) BitStream!2308) Unit!4721)

(assert (=> d!22838 (= lt!114179 (choose!9 thiss!1379 (buf!1739 (_2!3174 lt!113498)) (bvsub to!314 i!635) (BitStream!2309 (buf!1739 (_2!3174 lt!113498)) (currentByte!3453 thiss!1379) (currentBit!3448 thiss!1379))))))

(assert (=> d!22838 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1739 (_2!3174 lt!113498)) (bvsub to!314 i!635)) lt!114179)))

(declare-fun bs!5472 () Bool)

(assert (= bs!5472 d!22838))

(assert (=> bs!5472 m!112933))

(declare-fun m!113583 () Bool)

(assert (=> bs!5472 m!113583))

(assert (=> b!70493 d!22838))

(declare-fun d!22840 () Bool)

(assert (=> d!22840 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1358 (buf!1739 (_2!3174 lt!113498)))) ((_ sign_extend 32) (currentByte!3453 (_2!3174 lt!113481))) ((_ sign_extend 32) (currentBit!3448 (_2!3174 lt!113481))) lt!113482) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1358 (buf!1739 (_2!3174 lt!113498)))) ((_ sign_extend 32) (currentByte!3453 (_2!3174 lt!113481))) ((_ sign_extend 32) (currentBit!3448 (_2!3174 lt!113481)))) lt!113482))))

(declare-fun bs!5473 () Bool)

(assert (= bs!5473 d!22840))

(declare-fun m!113585 () Bool)

(assert (=> bs!5473 m!113585))

(assert (=> b!70493 d!22840))

(declare-datatypes ((tuple2!6152 0))(
  ( (tuple2!6153 (_1!3190 List!729) (_2!3190 BitStream!2308)) )
))
(declare-fun e!46188 () tuple2!6152)

(declare-fun b!70903 () Bool)

(declare-datatypes ((tuple2!6154 0))(
  ( (tuple2!6155 (_1!3191 Bool) (_2!3191 BitStream!2308)) )
))
(declare-fun lt!114187 () tuple2!6154)

(declare-fun lt!114186 () (_ BitVec 64))

(assert (=> b!70903 (= e!46188 (tuple2!6153 (Cons!725 (_1!3191 lt!114187) (bitStreamReadBitsIntoList!0 (_2!3174 lt!113498) (_2!3191 lt!114187) (bvsub lt!113482 lt!114186))) (_2!3191 lt!114187)))))

(declare-fun readBit!0 (BitStream!2308) tuple2!6154)

(assert (=> b!70903 (= lt!114187 (readBit!0 (_1!3175 lt!113502)))))

(assert (=> b!70903 (= lt!114186 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!70904 () Bool)

(declare-fun e!46187 () Bool)

(declare-fun lt!114188 () List!729)

(declare-fun isEmpty!230 (List!729) Bool)

(assert (=> b!70904 (= e!46187 (isEmpty!230 lt!114188))))

(declare-fun b!70905 () Bool)

(assert (=> b!70905 (= e!46187 (> (length!357 lt!114188) 0))))

(declare-fun d!22842 () Bool)

(assert (=> d!22842 e!46187))

(declare-fun c!5306 () Bool)

(assert (=> d!22842 (= c!5306 (= lt!113482 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22842 (= lt!114188 (_1!3190 e!46188))))

(declare-fun c!5305 () Bool)

(assert (=> d!22842 (= c!5305 (= lt!113482 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22842 (bvsge lt!113482 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22842 (= (bitStreamReadBitsIntoList!0 (_2!3174 lt!113498) (_1!3175 lt!113502) lt!113482) lt!114188)))

(declare-fun b!70902 () Bool)

(assert (=> b!70902 (= e!46188 (tuple2!6153 Nil!726 (_1!3175 lt!113502)))))

(assert (= (and d!22842 c!5305) b!70902))

(assert (= (and d!22842 (not c!5305)) b!70903))

(assert (= (and d!22842 c!5306) b!70904))

(assert (= (and d!22842 (not c!5306)) b!70905))

(declare-fun m!113587 () Bool)

(assert (=> b!70903 m!113587))

(declare-fun m!113589 () Bool)

(assert (=> b!70903 m!113589))

(declare-fun m!113591 () Bool)

(assert (=> b!70904 m!113591))

(declare-fun m!113593 () Bool)

(assert (=> b!70905 m!113593))

(assert (=> b!70493 d!22842))

(declare-fun lt!114190 () tuple2!6154)

(declare-fun lt!114189 () (_ BitVec 64))

(declare-fun b!70907 () Bool)

(declare-fun e!46190 () tuple2!6152)

(assert (=> b!70907 (= e!46190 (tuple2!6153 (Cons!725 (_1!3191 lt!114190) (bitStreamReadBitsIntoList!0 (_2!3174 lt!113498) (_2!3191 lt!114190) (bvsub (bvsub to!314 i!635) lt!114189))) (_2!3191 lt!114190)))))

(assert (=> b!70907 (= lt!114190 (readBit!0 (_1!3175 lt!113483)))))

(assert (=> b!70907 (= lt!114189 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!70908 () Bool)

(declare-fun e!46189 () Bool)

(declare-fun lt!114191 () List!729)

(assert (=> b!70908 (= e!46189 (isEmpty!230 lt!114191))))

(declare-fun b!70909 () Bool)

(assert (=> b!70909 (= e!46189 (> (length!357 lt!114191) 0))))

(declare-fun d!22844 () Bool)

(assert (=> d!22844 e!46189))

(declare-fun c!5308 () Bool)

(assert (=> d!22844 (= c!5308 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22844 (= lt!114191 (_1!3190 e!46190))))

(declare-fun c!5307 () Bool)

(assert (=> d!22844 (= c!5307 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22844 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22844 (= (bitStreamReadBitsIntoList!0 (_2!3174 lt!113498) (_1!3175 lt!113483) (bvsub to!314 i!635)) lt!114191)))

(declare-fun b!70906 () Bool)

(assert (=> b!70906 (= e!46190 (tuple2!6153 Nil!726 (_1!3175 lt!113483)))))

(assert (= (and d!22844 c!5307) b!70906))

(assert (= (and d!22844 (not c!5307)) b!70907))

(assert (= (and d!22844 c!5308) b!70908))

(assert (= (and d!22844 (not c!5308)) b!70909))

(declare-fun m!113595 () Bool)

(assert (=> b!70907 m!113595))

(declare-fun m!113597 () Bool)

(assert (=> b!70907 m!113597))

(declare-fun m!113599 () Bool)

(assert (=> b!70908 m!113599))

(declare-fun m!113601 () Bool)

(assert (=> b!70909 m!113601))

(assert (=> b!70493 d!22844))

(declare-fun b!70910 () Bool)

(declare-fun res!58472 () Bool)

(declare-fun e!46191 () Bool)

(assert (=> b!70910 (=> (not res!58472) (not e!46191))))

(declare-fun lt!114196 () tuple2!6122)

(assert (=> b!70910 (= res!58472 (isPrefixOf!0 (_1!3175 lt!114196) thiss!1379))))

(declare-fun d!22846 () Bool)

(assert (=> d!22846 e!46191))

(declare-fun res!58473 () Bool)

(assert (=> d!22846 (=> (not res!58473) (not e!46191))))

(assert (=> d!22846 (= res!58473 (isPrefixOf!0 (_1!3175 lt!114196) (_2!3175 lt!114196)))))

(declare-fun lt!114194 () BitStream!2308)

(assert (=> d!22846 (= lt!114196 (tuple2!6123 lt!114194 (_2!3174 lt!113498)))))

(declare-fun lt!114205 () Unit!4721)

(declare-fun lt!114207 () Unit!4721)

(assert (=> d!22846 (= lt!114205 lt!114207)))

(assert (=> d!22846 (isPrefixOf!0 lt!114194 (_2!3174 lt!113498))))

(assert (=> d!22846 (= lt!114207 (lemmaIsPrefixTransitive!0 lt!114194 (_2!3174 lt!113498) (_2!3174 lt!113498)))))

(declare-fun lt!114210 () Unit!4721)

(declare-fun lt!114201 () Unit!4721)

(assert (=> d!22846 (= lt!114210 lt!114201)))

(assert (=> d!22846 (isPrefixOf!0 lt!114194 (_2!3174 lt!113498))))

(assert (=> d!22846 (= lt!114201 (lemmaIsPrefixTransitive!0 lt!114194 thiss!1379 (_2!3174 lt!113498)))))

(declare-fun lt!114202 () Unit!4721)

(declare-fun e!46192 () Unit!4721)

(assert (=> d!22846 (= lt!114202 e!46192)))

(declare-fun c!5309 () Bool)

(assert (=> d!22846 (= c!5309 (not (= (size!1358 (buf!1739 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!114206 () Unit!4721)

(declare-fun lt!114193 () Unit!4721)

(assert (=> d!22846 (= lt!114206 lt!114193)))

(assert (=> d!22846 (isPrefixOf!0 (_2!3174 lt!113498) (_2!3174 lt!113498))))

(assert (=> d!22846 (= lt!114193 (lemmaIsPrefixRefl!0 (_2!3174 lt!113498)))))

(declare-fun lt!114195 () Unit!4721)

(declare-fun lt!114192 () Unit!4721)

(assert (=> d!22846 (= lt!114195 lt!114192)))

(assert (=> d!22846 (= lt!114192 (lemmaIsPrefixRefl!0 (_2!3174 lt!113498)))))

(declare-fun lt!114203 () Unit!4721)

(declare-fun lt!114209 () Unit!4721)

(assert (=> d!22846 (= lt!114203 lt!114209)))

(assert (=> d!22846 (isPrefixOf!0 lt!114194 lt!114194)))

(assert (=> d!22846 (= lt!114209 (lemmaIsPrefixRefl!0 lt!114194))))

(declare-fun lt!114200 () Unit!4721)

(declare-fun lt!114199 () Unit!4721)

(assert (=> d!22846 (= lt!114200 lt!114199)))

(assert (=> d!22846 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!22846 (= lt!114199 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!22846 (= lt!114194 (BitStream!2309 (buf!1739 (_2!3174 lt!113498)) (currentByte!3453 thiss!1379) (currentBit!3448 thiss!1379)))))

(assert (=> d!22846 (isPrefixOf!0 thiss!1379 (_2!3174 lt!113498))))

(assert (=> d!22846 (= (reader!0 thiss!1379 (_2!3174 lt!113498)) lt!114196)))

(declare-fun b!70911 () Bool)

(declare-fun lt!114198 () (_ BitVec 64))

(declare-fun lt!114211 () (_ BitVec 64))

(assert (=> b!70911 (= e!46191 (= (_1!3175 lt!114196) (withMovedBitIndex!0 (_2!3175 lt!114196) (bvsub lt!114211 lt!114198))))))

(assert (=> b!70911 (or (= (bvand lt!114211 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!114198 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!114211 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!114211 lt!114198) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!70911 (= lt!114198 (bitIndex!0 (size!1358 (buf!1739 (_2!3174 lt!113498))) (currentByte!3453 (_2!3174 lt!113498)) (currentBit!3448 (_2!3174 lt!113498))))))

(assert (=> b!70911 (= lt!114211 (bitIndex!0 (size!1358 (buf!1739 thiss!1379)) (currentByte!3453 thiss!1379) (currentBit!3448 thiss!1379)))))

(declare-fun b!70912 () Bool)

(declare-fun lt!114208 () Unit!4721)

(assert (=> b!70912 (= e!46192 lt!114208)))

(declare-fun lt!114204 () (_ BitVec 64))

(assert (=> b!70912 (= lt!114204 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!114197 () (_ BitVec 64))

(assert (=> b!70912 (= lt!114197 (bitIndex!0 (size!1358 (buf!1739 thiss!1379)) (currentByte!3453 thiss!1379) (currentBit!3448 thiss!1379)))))

(assert (=> b!70912 (= lt!114208 (arrayBitRangesEqSymmetric!0 (buf!1739 thiss!1379) (buf!1739 (_2!3174 lt!113498)) lt!114204 lt!114197))))

(assert (=> b!70912 (arrayBitRangesEq!0 (buf!1739 (_2!3174 lt!113498)) (buf!1739 thiss!1379) lt!114204 lt!114197)))

(declare-fun b!70913 () Bool)

(declare-fun Unit!4741 () Unit!4721)

(assert (=> b!70913 (= e!46192 Unit!4741)))

(declare-fun b!70914 () Bool)

(declare-fun res!58474 () Bool)

(assert (=> b!70914 (=> (not res!58474) (not e!46191))))

(assert (=> b!70914 (= res!58474 (isPrefixOf!0 (_2!3175 lt!114196) (_2!3174 lt!113498)))))

(assert (= (and d!22846 c!5309) b!70912))

(assert (= (and d!22846 (not c!5309)) b!70913))

(assert (= (and d!22846 res!58473) b!70910))

(assert (= (and b!70910 res!58472) b!70914))

(assert (= (and b!70914 res!58474) b!70911))

(declare-fun m!113603 () Bool)

(assert (=> b!70910 m!113603))

(assert (=> d!22846 m!113553))

(declare-fun m!113605 () Bool)

(assert (=> d!22846 m!113605))

(assert (=> d!22846 m!113557))

(assert (=> d!22846 m!112901))

(declare-fun m!113607 () Bool)

(assert (=> d!22846 m!113607))

(assert (=> d!22846 m!112917))

(assert (=> d!22846 m!112899))

(declare-fun m!113609 () Bool)

(assert (=> d!22846 m!113609))

(declare-fun m!113611 () Bool)

(assert (=> d!22846 m!113611))

(declare-fun m!113613 () Bool)

(assert (=> d!22846 m!113613))

(declare-fun m!113615 () Bool)

(assert (=> d!22846 m!113615))

(declare-fun m!113617 () Bool)

(assert (=> b!70911 m!113617))

(assert (=> b!70911 m!112905))

(assert (=> b!70911 m!112903))

(assert (=> b!70912 m!112903))

(declare-fun m!113619 () Bool)

(assert (=> b!70912 m!113619))

(declare-fun m!113621 () Bool)

(assert (=> b!70912 m!113621))

(declare-fun m!113623 () Bool)

(assert (=> b!70914 m!113623))

(assert (=> b!70493 d!22846))

(declare-fun d!22848 () Bool)

(assert (=> d!22848 (validate_offset_bits!1 ((_ sign_extend 32) (size!1358 (buf!1739 (_2!3174 lt!113498)))) ((_ sign_extend 32) (currentByte!3453 (_2!3174 lt!113481))) ((_ sign_extend 32) (currentBit!3448 (_2!3174 lt!113481))) lt!113482)))

(declare-fun lt!114212 () Unit!4721)

(assert (=> d!22848 (= lt!114212 (choose!9 (_2!3174 lt!113481) (buf!1739 (_2!3174 lt!113498)) lt!113482 (BitStream!2309 (buf!1739 (_2!3174 lt!113498)) (currentByte!3453 (_2!3174 lt!113481)) (currentBit!3448 (_2!3174 lt!113481)))))))

(assert (=> d!22848 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3174 lt!113481) (buf!1739 (_2!3174 lt!113498)) lt!113482) lt!114212)))

(declare-fun bs!5474 () Bool)

(assert (= bs!5474 d!22848))

(assert (=> bs!5474 m!112947))

(declare-fun m!113625 () Bool)

(assert (=> bs!5474 m!113625))

(assert (=> b!70493 d!22848))

(declare-fun d!22850 () Bool)

(assert (=> d!22850 (= (array_inv!1213 (buf!1739 thiss!1379)) (bvsge (size!1358 (buf!1739 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!70494 d!22850))

(declare-fun d!22852 () Bool)

(assert (=> d!22852 (= (tail!333 lt!113500) (t!1479 lt!113500))))

(assert (=> b!70483 d!22852))

(declare-fun d!22854 () Bool)

(declare-fun e!46195 () Bool)

(assert (=> d!22854 e!46195))

(declare-fun res!58477 () Bool)

(assert (=> d!22854 (=> (not res!58477) (not e!46195))))

(declare-fun lt!114218 () (_ BitVec 64))

(assert (=> d!22854 (= res!58477 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!114218 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!114218) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!22854 (= lt!114218 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!114217 () Unit!4721)

(declare-fun choose!42 (BitStream!2308 BitStream!2308 BitStream!2308 BitStream!2308 (_ BitVec 64) List!729) Unit!4721)

(assert (=> d!22854 (= lt!114217 (choose!42 (_2!3174 lt!113498) (_2!3174 lt!113498) (_1!3175 lt!113483) (_1!3175 lt!113502) (bvsub to!314 i!635) lt!113500))))

(assert (=> d!22854 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22854 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3174 lt!113498) (_2!3174 lt!113498) (_1!3175 lt!113483) (_1!3175 lt!113502) (bvsub to!314 i!635) lt!113500) lt!114217)))

(declare-fun b!70917 () Bool)

(assert (=> b!70917 (= e!46195 (= (bitStreamReadBitsIntoList!0 (_2!3174 lt!113498) (_1!3175 lt!113502) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!333 lt!113500)))))

(assert (= (and d!22854 res!58477) b!70917))

(declare-fun m!113627 () Bool)

(assert (=> d!22854 m!113627))

(declare-fun m!113629 () Bool)

(assert (=> b!70917 m!113629))

(assert (=> b!70917 m!112929))

(assert (=> b!70483 d!22854))

(declare-fun d!22856 () Bool)

(assert (=> d!22856 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1358 (buf!1739 thiss!1379))) ((_ sign_extend 32) (currentByte!3453 thiss!1379)) ((_ sign_extend 32) (currentBit!3448 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1358 (buf!1739 thiss!1379))) ((_ sign_extend 32) (currentByte!3453 thiss!1379)) ((_ sign_extend 32) (currentBit!3448 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5475 () Bool)

(assert (= bs!5475 d!22856))

(declare-fun m!113631 () Bool)

(assert (=> bs!5475 m!113631))

(assert (=> b!70484 d!22856))

(declare-fun d!22858 () Bool)

(assert (=> d!22858 (= (head!548 (byteArrayBitContentToList!0 (_2!3174 lt!113481) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!844 (byteArrayBitContentToList!0 (_2!3174 lt!113481) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!70495 d!22858))

(declare-fun d!22860 () Bool)

(declare-fun c!5312 () Bool)

(assert (=> d!22860 (= c!5312 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!46198 () List!729)

(assert (=> d!22860 (= (byteArrayBitContentToList!0 (_2!3174 lt!113481) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!46198)))

(declare-fun b!70922 () Bool)

(assert (=> b!70922 (= e!46198 Nil!726)))

(declare-fun b!70923 () Bool)

(assert (=> b!70923 (= e!46198 (Cons!725 (not (= (bvand ((_ sign_extend 24) (select (arr!1943 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3174 lt!113481) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!22860 c!5312) b!70922))

(assert (= (and d!22860 (not c!5312)) b!70923))

(assert (=> b!70923 m!112879))

(assert (=> b!70923 m!113549))

(declare-fun m!113633 () Bool)

(assert (=> b!70923 m!113633))

(assert (=> b!70495 d!22860))

(declare-fun d!22862 () Bool)

(assert (=> d!22862 (= (head!548 (bitStreamReadBitsIntoList!0 (_2!3174 lt!113481) (_1!3175 lt!113493) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!844 (bitStreamReadBitsIntoList!0 (_2!3174 lt!113481) (_1!3175 lt!113493) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!70495 d!22862))

(declare-fun lt!114219 () (_ BitVec 64))

(declare-fun e!46200 () tuple2!6152)

(declare-fun lt!114220 () tuple2!6154)

(declare-fun b!70925 () Bool)

(assert (=> b!70925 (= e!46200 (tuple2!6153 (Cons!725 (_1!3191 lt!114220) (bitStreamReadBitsIntoList!0 (_2!3174 lt!113481) (_2!3191 lt!114220) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!114219))) (_2!3191 lt!114220)))))

(assert (=> b!70925 (= lt!114220 (readBit!0 (_1!3175 lt!113493)))))

(assert (=> b!70925 (= lt!114219 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!70926 () Bool)

(declare-fun e!46199 () Bool)

(declare-fun lt!114221 () List!729)

(assert (=> b!70926 (= e!46199 (isEmpty!230 lt!114221))))

(declare-fun b!70927 () Bool)

(assert (=> b!70927 (= e!46199 (> (length!357 lt!114221) 0))))

(declare-fun d!22864 () Bool)

(assert (=> d!22864 e!46199))

(declare-fun c!5314 () Bool)

(assert (=> d!22864 (= c!5314 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22864 (= lt!114221 (_1!3190 e!46200))))

(declare-fun c!5313 () Bool)

(assert (=> d!22864 (= c!5313 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22864 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22864 (= (bitStreamReadBitsIntoList!0 (_2!3174 lt!113481) (_1!3175 lt!113493) #b0000000000000000000000000000000000000000000000000000000000000001) lt!114221)))

(declare-fun b!70924 () Bool)

(assert (=> b!70924 (= e!46200 (tuple2!6153 Nil!726 (_1!3175 lt!113493)))))

(assert (= (and d!22864 c!5313) b!70924))

(assert (= (and d!22864 (not c!5313)) b!70925))

(assert (= (and d!22864 c!5314) b!70926))

(assert (= (and d!22864 (not c!5314)) b!70927))

(declare-fun m!113635 () Bool)

(assert (=> b!70925 m!113635))

(declare-fun m!113637 () Bool)

(assert (=> b!70925 m!113637))

(declare-fun m!113639 () Bool)

(assert (=> b!70926 m!113639))

(declare-fun m!113641 () Bool)

(assert (=> b!70927 m!113641))

(assert (=> b!70495 d!22864))

(declare-fun d!22866 () Bool)

(declare-fun res!58478 () Bool)

(declare-fun e!46201 () Bool)

(assert (=> d!22866 (=> (not res!58478) (not e!46201))))

(assert (=> d!22866 (= res!58478 (= (size!1358 (buf!1739 thiss!1379)) (size!1358 (buf!1739 thiss!1379))))))

(assert (=> d!22866 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!46201)))

(declare-fun b!70928 () Bool)

(declare-fun res!58479 () Bool)

(assert (=> b!70928 (=> (not res!58479) (not e!46201))))

(assert (=> b!70928 (= res!58479 (bvsle (bitIndex!0 (size!1358 (buf!1739 thiss!1379)) (currentByte!3453 thiss!1379) (currentBit!3448 thiss!1379)) (bitIndex!0 (size!1358 (buf!1739 thiss!1379)) (currentByte!3453 thiss!1379) (currentBit!3448 thiss!1379))))))

(declare-fun b!70929 () Bool)

(declare-fun e!46202 () Bool)

(assert (=> b!70929 (= e!46201 e!46202)))

(declare-fun res!58480 () Bool)

(assert (=> b!70929 (=> res!58480 e!46202)))

(assert (=> b!70929 (= res!58480 (= (size!1358 (buf!1739 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!70930 () Bool)

(assert (=> b!70930 (= e!46202 (arrayBitRangesEq!0 (buf!1739 thiss!1379) (buf!1739 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1358 (buf!1739 thiss!1379)) (currentByte!3453 thiss!1379) (currentBit!3448 thiss!1379))))))

(assert (= (and d!22866 res!58478) b!70928))

(assert (= (and b!70928 res!58479) b!70929))

(assert (= (and b!70929 (not res!58480)) b!70930))

(assert (=> b!70928 m!112903))

(assert (=> b!70928 m!112903))

(assert (=> b!70930 m!112903))

(assert (=> b!70930 m!112903))

(declare-fun m!113643 () Bool)

(assert (=> b!70930 m!113643))

(assert (=> b!70496 d!22866))

(declare-fun d!22868 () Bool)

(assert (=> d!22868 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!114232 () Unit!4721)

(declare-fun choose!11 (BitStream!2308) Unit!4721)

(assert (=> d!22868 (= lt!114232 (choose!11 thiss!1379))))

(assert (=> d!22868 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!114232)))

(declare-fun bs!5477 () Bool)

(assert (= bs!5477 d!22868))

(assert (=> bs!5477 m!112899))

(declare-fun m!113645 () Bool)

(assert (=> bs!5477 m!113645))

(assert (=> b!70496 d!22868))

(declare-fun d!22870 () Bool)

(declare-fun e!46203 () Bool)

(assert (=> d!22870 e!46203))

(declare-fun res!58481 () Bool)

(assert (=> d!22870 (=> (not res!58481) (not e!46203))))

(declare-fun lt!114238 () (_ BitVec 64))

(declare-fun lt!114236 () (_ BitVec 64))

(declare-fun lt!114235 () (_ BitVec 64))

(assert (=> d!22870 (= res!58481 (= lt!114238 (bvsub lt!114236 lt!114235)))))

(assert (=> d!22870 (or (= (bvand lt!114236 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!114235 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!114236 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!114236 lt!114235) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!22870 (= lt!114235 (remainingBits!0 ((_ sign_extend 32) (size!1358 (buf!1739 thiss!1379))) ((_ sign_extend 32) (currentByte!3453 thiss!1379)) ((_ sign_extend 32) (currentBit!3448 thiss!1379))))))

(declare-fun lt!114233 () (_ BitVec 64))

(declare-fun lt!114237 () (_ BitVec 64))

(assert (=> d!22870 (= lt!114236 (bvmul lt!114233 lt!114237))))

(assert (=> d!22870 (or (= lt!114233 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!114237 (bvsdiv (bvmul lt!114233 lt!114237) lt!114233)))))

(assert (=> d!22870 (= lt!114237 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!22870 (= lt!114233 ((_ sign_extend 32) (size!1358 (buf!1739 thiss!1379))))))

(assert (=> d!22870 (= lt!114238 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3453 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3448 thiss!1379))))))

(assert (=> d!22870 (invariant!0 (currentBit!3448 thiss!1379) (currentByte!3453 thiss!1379) (size!1358 (buf!1739 thiss!1379)))))

(assert (=> d!22870 (= (bitIndex!0 (size!1358 (buf!1739 thiss!1379)) (currentByte!3453 thiss!1379) (currentBit!3448 thiss!1379)) lt!114238)))

(declare-fun b!70931 () Bool)

(declare-fun res!58482 () Bool)

(assert (=> b!70931 (=> (not res!58482) (not e!46203))))

(assert (=> b!70931 (= res!58482 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!114238))))

(declare-fun b!70932 () Bool)

(declare-fun lt!114234 () (_ BitVec 64))

(assert (=> b!70932 (= e!46203 (bvsle lt!114238 (bvmul lt!114234 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!70932 (or (= lt!114234 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!114234 #b0000000000000000000000000000000000000000000000000000000000001000) lt!114234)))))

(assert (=> b!70932 (= lt!114234 ((_ sign_extend 32) (size!1358 (buf!1739 thiss!1379))))))

(assert (= (and d!22870 res!58481) b!70931))

(assert (= (and b!70931 res!58482) b!70932))

(assert (=> d!22870 m!113631))

(declare-fun m!113647 () Bool)

(assert (=> d!22870 m!113647))

(assert (=> b!70496 d!22870))

(declare-fun d!22872 () Bool)

(assert (=> d!22872 (= (bitAt!0 (buf!1739 (_1!3175 lt!113502)) lt!113486) (not (= (bvand ((_ sign_extend 24) (select (arr!1943 (buf!1739 (_1!3175 lt!113502))) ((_ extract 31 0) (bvsdiv lt!113486 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!113486 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5478 () Bool)

(assert (= bs!5478 d!22872))

(declare-fun m!113649 () Bool)

(assert (=> bs!5478 m!113649))

(declare-fun m!113651 () Bool)

(assert (=> bs!5478 m!113651))

(assert (=> b!70485 d!22872))

(declare-fun d!22874 () Bool)

(assert (=> d!22874 (= (bitAt!0 (buf!1739 (_1!3175 lt!113483)) lt!113486) (not (= (bvand ((_ sign_extend 24) (select (arr!1943 (buf!1739 (_1!3175 lt!113483))) ((_ extract 31 0) (bvsdiv lt!113486 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!113486 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5479 () Bool)

(assert (= bs!5479 d!22874))

(declare-fun m!113653 () Bool)

(assert (=> bs!5479 m!113653))

(assert (=> bs!5479 m!113651))

(assert (=> b!70485 d!22874))

(declare-fun d!22876 () Bool)

(declare-fun size!1363 (List!729) Int)

(assert (=> d!22876 (= (length!357 lt!113500) (size!1363 lt!113500))))

(declare-fun bs!5480 () Bool)

(assert (= bs!5480 d!22876))

(declare-fun m!113655 () Bool)

(assert (=> bs!5480 m!113655))

(assert (=> b!70486 d!22876))

(declare-fun d!22878 () Bool)

(assert (=> d!22878 (= (array_inv!1213 srcBuffer!2) (bvsge (size!1358 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!13776 d!22878))

(declare-fun d!22880 () Bool)

(assert (=> d!22880 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3448 thiss!1379) (currentByte!3453 thiss!1379) (size!1358 (buf!1739 thiss!1379))))))

(declare-fun bs!5481 () Bool)

(assert (= bs!5481 d!22880))

(assert (=> bs!5481 m!113647))

(assert (=> start!13776 d!22880))

(declare-fun d!22882 () Bool)

(assert (=> d!22882 (= (bitAt!0 (buf!1739 (_2!3174 lt!113481)) lt!113486) (not (= (bvand ((_ sign_extend 24) (select (arr!1943 (buf!1739 (_2!3174 lt!113481))) ((_ extract 31 0) (bvsdiv lt!113486 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!113486 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5482 () Bool)

(assert (= bs!5482 d!22882))

(declare-fun m!113657 () Bool)

(assert (=> bs!5482 m!113657))

(assert (=> bs!5482 m!113651))

(assert (=> b!70497 d!22882))

(declare-fun d!22884 () Bool)

(assert (=> d!22884 (validate_offset_bits!1 ((_ sign_extend 32) (size!1358 (buf!1739 (_2!3174 lt!113481)))) ((_ sign_extend 32) (currentByte!3453 thiss!1379)) ((_ sign_extend 32) (currentBit!3448 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!114295 () Unit!4721)

(assert (=> d!22884 (= lt!114295 (choose!9 thiss!1379 (buf!1739 (_2!3174 lt!113481)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2309 (buf!1739 (_2!3174 lt!113481)) (currentByte!3453 thiss!1379) (currentBit!3448 thiss!1379))))))

(assert (=> d!22884 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1739 (_2!3174 lt!113481)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!114295)))

(declare-fun bs!5483 () Bool)

(assert (= bs!5483 d!22884))

(assert (=> bs!5483 m!112909))

(declare-fun m!113659 () Bool)

(assert (=> bs!5483 m!113659))

(assert (=> b!70498 d!22884))

(declare-fun call!925 () tuple2!6122)

(declare-fun c!5329 () Bool)

(declare-fun lt!114634 () tuple2!6120)

(declare-fun bm!922 () Bool)

(assert (=> bm!922 (= call!925 (reader!0 (_2!3174 lt!113481) (ite c!5329 (_2!3174 lt!114634) (_2!3174 lt!113481))))))

(declare-fun b!71019 () Bool)

(declare-fun e!46241 () Bool)

(declare-fun lt!114648 () tuple2!6122)

(declare-fun lt!114620 () tuple2!6120)

(assert (=> b!71019 (= e!46241 (= (bitStreamReadBitsIntoList!0 (_2!3174 lt!114620) (_1!3175 lt!114648) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!3174 lt!114620) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!71019 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!71019 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!114649 () Unit!4721)

(declare-fun lt!114617 () Unit!4721)

(assert (=> b!71019 (= lt!114649 lt!114617)))

(declare-fun lt!114607 () (_ BitVec 64))

(assert (=> b!71019 (validate_offset_bits!1 ((_ sign_extend 32) (size!1358 (buf!1739 (_2!3174 lt!114620)))) ((_ sign_extend 32) (currentByte!3453 (_2!3174 lt!113481))) ((_ sign_extend 32) (currentBit!3448 (_2!3174 lt!113481))) lt!114607)))

(assert (=> b!71019 (= lt!114617 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3174 lt!113481) (buf!1739 (_2!3174 lt!114620)) lt!114607))))

(declare-fun e!46240 () Bool)

(assert (=> b!71019 e!46240))

(declare-fun res!58546 () Bool)

(assert (=> b!71019 (=> (not res!58546) (not e!46240))))

(assert (=> b!71019 (= res!58546 (and (= (size!1358 (buf!1739 (_2!3174 lt!113481))) (size!1358 (buf!1739 (_2!3174 lt!114620)))) (bvsge lt!114607 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!71019 (= lt!114607 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!71019 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!71019 (= lt!114648 (reader!0 (_2!3174 lt!113481) (_2!3174 lt!114620)))))

(declare-fun b!71020 () Bool)

(assert (=> b!71020 (= e!46240 (validate_offset_bits!1 ((_ sign_extend 32) (size!1358 (buf!1739 (_2!3174 lt!113481)))) ((_ sign_extend 32) (currentByte!3453 (_2!3174 lt!113481))) ((_ sign_extend 32) (currentBit!3448 (_2!3174 lt!113481))) lt!114607))))

(declare-fun b!71021 () Bool)

(declare-fun res!58542 () Bool)

(assert (=> b!71021 (=> (not res!58542) (not e!46241))))

(assert (=> b!71021 (= res!58542 (invariant!0 (currentBit!3448 (_2!3174 lt!114620)) (currentByte!3453 (_2!3174 lt!114620)) (size!1358 (buf!1739 (_2!3174 lt!114620)))))))

(declare-fun b!71022 () Bool)

(declare-fun res!58544 () Bool)

(assert (=> b!71022 (=> (not res!58544) (not e!46241))))

(assert (=> b!71022 (= res!58544 (isPrefixOf!0 (_2!3174 lt!113481) (_2!3174 lt!114620)))))

(declare-fun b!71023 () Bool)

(declare-fun e!46242 () tuple2!6120)

(declare-fun Unit!4749 () Unit!4721)

(assert (=> b!71023 (= e!46242 (tuple2!6121 Unit!4749 (_2!3174 lt!114634)))))

(declare-fun lt!114644 () tuple2!6120)

(assert (=> b!71023 (= lt!114644 (appendBitFromByte!0 (_2!3174 lt!113481) (select (arr!1943 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!114614 () (_ BitVec 64))

(assert (=> b!71023 (= lt!114614 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!114645 () (_ BitVec 64))

(assert (=> b!71023 (= lt!114645 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!114613 () Unit!4721)

(assert (=> b!71023 (= lt!114613 (validateOffsetBitsIneqLemma!0 (_2!3174 lt!113481) (_2!3174 lt!114644) lt!114614 lt!114645))))

(assert (=> b!71023 (validate_offset_bits!1 ((_ sign_extend 32) (size!1358 (buf!1739 (_2!3174 lt!114644)))) ((_ sign_extend 32) (currentByte!3453 (_2!3174 lt!114644))) ((_ sign_extend 32) (currentBit!3448 (_2!3174 lt!114644))) (bvsub lt!114614 lt!114645))))

(declare-fun lt!114638 () Unit!4721)

(assert (=> b!71023 (= lt!114638 lt!114613)))

(declare-fun lt!114643 () tuple2!6122)

(assert (=> b!71023 (= lt!114643 (reader!0 (_2!3174 lt!113481) (_2!3174 lt!114644)))))

(declare-fun lt!114611 () (_ BitVec 64))

(assert (=> b!71023 (= lt!114611 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!114625 () Unit!4721)

(assert (=> b!71023 (= lt!114625 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3174 lt!113481) (buf!1739 (_2!3174 lt!114644)) lt!114611))))

(assert (=> b!71023 (validate_offset_bits!1 ((_ sign_extend 32) (size!1358 (buf!1739 (_2!3174 lt!114644)))) ((_ sign_extend 32) (currentByte!3453 (_2!3174 lt!113481))) ((_ sign_extend 32) (currentBit!3448 (_2!3174 lt!113481))) lt!114611)))

(declare-fun lt!114632 () Unit!4721)

(assert (=> b!71023 (= lt!114632 lt!114625)))

(assert (=> b!71023 (= (head!548 (byteArrayBitContentToList!0 (_2!3174 lt!114644) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!548 (bitStreamReadBitsIntoList!0 (_2!3174 lt!114644) (_1!3175 lt!114643) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!114646 () Unit!4721)

(declare-fun Unit!4750 () Unit!4721)

(assert (=> b!71023 (= lt!114646 Unit!4750)))

(assert (=> b!71023 (= lt!114634 (appendBitsMSBFirstLoop!0 (_2!3174 lt!114644) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!114609 () Unit!4721)

(assert (=> b!71023 (= lt!114609 (lemmaIsPrefixTransitive!0 (_2!3174 lt!113481) (_2!3174 lt!114644) (_2!3174 lt!114634)))))

(assert (=> b!71023 (isPrefixOf!0 (_2!3174 lt!113481) (_2!3174 lt!114634))))

(declare-fun lt!114650 () Unit!4721)

(assert (=> b!71023 (= lt!114650 lt!114609)))

(assert (=> b!71023 (= (size!1358 (buf!1739 (_2!3174 lt!114634))) (size!1358 (buf!1739 (_2!3174 lt!113481))))))

(declare-fun lt!114621 () Unit!4721)

(declare-fun Unit!4751 () Unit!4721)

(assert (=> b!71023 (= lt!114621 Unit!4751)))

(assert (=> b!71023 (= (bitIndex!0 (size!1358 (buf!1739 (_2!3174 lt!114634))) (currentByte!3453 (_2!3174 lt!114634)) (currentBit!3448 (_2!3174 lt!114634))) (bvsub (bvadd (bitIndex!0 (size!1358 (buf!1739 (_2!3174 lt!113481))) (currentByte!3453 (_2!3174 lt!113481)) (currentBit!3448 (_2!3174 lt!113481))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!114647 () Unit!4721)

(declare-fun Unit!4752 () Unit!4721)

(assert (=> b!71023 (= lt!114647 Unit!4752)))

(assert (=> b!71023 (= (bitIndex!0 (size!1358 (buf!1739 (_2!3174 lt!114634))) (currentByte!3453 (_2!3174 lt!114634)) (currentBit!3448 (_2!3174 lt!114634))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1358 (buf!1739 (_2!3174 lt!114644))) (currentByte!3453 (_2!3174 lt!114644)) (currentBit!3448 (_2!3174 lt!114644))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!114637 () Unit!4721)

(declare-fun Unit!4753 () Unit!4721)

(assert (=> b!71023 (= lt!114637 Unit!4753)))

(declare-fun lt!114635 () tuple2!6122)

(assert (=> b!71023 (= lt!114635 call!925)))

(declare-fun lt!114636 () (_ BitVec 64))

(assert (=> b!71023 (= lt!114636 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!114612 () Unit!4721)

(assert (=> b!71023 (= lt!114612 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3174 lt!113481) (buf!1739 (_2!3174 lt!114634)) lt!114636))))

(assert (=> b!71023 (validate_offset_bits!1 ((_ sign_extend 32) (size!1358 (buf!1739 (_2!3174 lt!114634)))) ((_ sign_extend 32) (currentByte!3453 (_2!3174 lt!113481))) ((_ sign_extend 32) (currentBit!3448 (_2!3174 lt!113481))) lt!114636)))

(declare-fun lt!114616 () Unit!4721)

(assert (=> b!71023 (= lt!114616 lt!114612)))

(declare-fun lt!114627 () tuple2!6122)

(assert (=> b!71023 (= lt!114627 (reader!0 (_2!3174 lt!114644) (_2!3174 lt!114634)))))

(declare-fun lt!114626 () (_ BitVec 64))

(assert (=> b!71023 (= lt!114626 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!114642 () Unit!4721)

(assert (=> b!71023 (= lt!114642 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3174 lt!114644) (buf!1739 (_2!3174 lt!114634)) lt!114626))))

(assert (=> b!71023 (validate_offset_bits!1 ((_ sign_extend 32) (size!1358 (buf!1739 (_2!3174 lt!114634)))) ((_ sign_extend 32) (currentByte!3453 (_2!3174 lt!114644))) ((_ sign_extend 32) (currentBit!3448 (_2!3174 lt!114644))) lt!114626)))

(declare-fun lt!114631 () Unit!4721)

(assert (=> b!71023 (= lt!114631 lt!114642)))

(declare-fun lt!114639 () List!729)

(assert (=> b!71023 (= lt!114639 (byteArrayBitContentToList!0 (_2!3174 lt!114634) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!114628 () List!729)

(assert (=> b!71023 (= lt!114628 (byteArrayBitContentToList!0 (_2!3174 lt!114634) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!114629 () List!729)

(assert (=> b!71023 (= lt!114629 (bitStreamReadBitsIntoList!0 (_2!3174 lt!114634) (_1!3175 lt!114635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!114633 () List!729)

(assert (=> b!71023 (= lt!114633 (bitStreamReadBitsIntoList!0 (_2!3174 lt!114634) (_1!3175 lt!114627) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!114630 () (_ BitVec 64))

(assert (=> b!71023 (= lt!114630 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!114622 () Unit!4721)

(assert (=> b!71023 (= lt!114622 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3174 lt!114634) (_2!3174 lt!114634) (_1!3175 lt!114635) (_1!3175 lt!114627) lt!114630 lt!114629))))

(assert (=> b!71023 (= (bitStreamReadBitsIntoList!0 (_2!3174 lt!114634) (_1!3175 lt!114627) (bvsub lt!114630 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!333 lt!114629))))

(declare-fun lt!114619 () Unit!4721)

(assert (=> b!71023 (= lt!114619 lt!114622)))

(declare-fun lt!114618 () (_ BitVec 64))

(declare-fun lt!114608 () Unit!4721)

(assert (=> b!71023 (= lt!114608 (arrayBitRangesEqImpliesEq!0 (buf!1739 (_2!3174 lt!114644)) (buf!1739 (_2!3174 lt!114634)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!114618 (bitIndex!0 (size!1358 (buf!1739 (_2!3174 lt!114644))) (currentByte!3453 (_2!3174 lt!114644)) (currentBit!3448 (_2!3174 lt!114644)))))))

(assert (=> b!71023 (= (bitAt!0 (buf!1739 (_2!3174 lt!114644)) lt!114618) (bitAt!0 (buf!1739 (_2!3174 lt!114634)) lt!114618))))

(declare-fun lt!114623 () Unit!4721)

(assert (=> b!71023 (= lt!114623 lt!114608)))

(declare-fun d!22886 () Bool)

(assert (=> d!22886 e!46241))

(declare-fun res!58541 () Bool)

(assert (=> d!22886 (=> (not res!58541) (not e!46241))))

(declare-fun lt!114610 () (_ BitVec 64))

(assert (=> d!22886 (= res!58541 (= (bitIndex!0 (size!1358 (buf!1739 (_2!3174 lt!114620))) (currentByte!3453 (_2!3174 lt!114620)) (currentBit!3448 (_2!3174 lt!114620))) (bvsub lt!114610 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!22886 (or (= (bvand lt!114610 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!114610 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!114610 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!114641 () (_ BitVec 64))

(assert (=> d!22886 (= lt!114610 (bvadd lt!114641 to!314))))

(assert (=> d!22886 (or (not (= (bvand lt!114641 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!114641 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!114641 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!22886 (= lt!114641 (bitIndex!0 (size!1358 (buf!1739 (_2!3174 lt!113481))) (currentByte!3453 (_2!3174 lt!113481)) (currentBit!3448 (_2!3174 lt!113481))))))

(assert (=> d!22886 (= lt!114620 e!46242)))

(assert (=> d!22886 (= c!5329 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!114624 () Unit!4721)

(declare-fun lt!114615 () Unit!4721)

(assert (=> d!22886 (= lt!114624 lt!114615)))

(assert (=> d!22886 (isPrefixOf!0 (_2!3174 lt!113481) (_2!3174 lt!113481))))

(assert (=> d!22886 (= lt!114615 (lemmaIsPrefixRefl!0 (_2!3174 lt!113481)))))

(assert (=> d!22886 (= lt!114618 (bitIndex!0 (size!1358 (buf!1739 (_2!3174 lt!113481))) (currentByte!3453 (_2!3174 lt!113481)) (currentBit!3448 (_2!3174 lt!113481))))))

(assert (=> d!22886 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22886 (= (appendBitsMSBFirstLoop!0 (_2!3174 lt!113481) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!114620)))

(declare-fun b!71024 () Bool)

(declare-fun Unit!4754 () Unit!4721)

(assert (=> b!71024 (= e!46242 (tuple2!6121 Unit!4754 (_2!3174 lt!113481)))))

(assert (=> b!71024 (= (size!1358 (buf!1739 (_2!3174 lt!113481))) (size!1358 (buf!1739 (_2!3174 lt!113481))))))

(declare-fun lt!114640 () Unit!4721)

(declare-fun Unit!4755 () Unit!4721)

(assert (=> b!71024 (= lt!114640 Unit!4755)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2308 array!2917 array!2917 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!71024 (checkByteArrayBitContent!0 (_2!3174 lt!113481) srcBuffer!2 (_1!3189 (readBits!0 (_1!3175 call!925) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!71025 () Bool)

(declare-fun res!58543 () Bool)

(assert (=> b!71025 (=> (not res!58543) (not e!46241))))

(assert (=> b!71025 (= res!58543 (= (size!1358 (buf!1739 (_2!3174 lt!113481))) (size!1358 (buf!1739 (_2!3174 lt!114620)))))))

(declare-fun b!71026 () Bool)

(declare-fun res!58545 () Bool)

(assert (=> b!71026 (=> (not res!58545) (not e!46241))))

(assert (=> b!71026 (= res!58545 (= (size!1358 (buf!1739 (_2!3174 lt!114620))) (size!1358 (buf!1739 (_2!3174 lt!113481)))))))

(assert (= (and d!22886 c!5329) b!71023))

(assert (= (and d!22886 (not c!5329)) b!71024))

(assert (= (or b!71023 b!71024) bm!922))

(assert (= (and d!22886 res!58541) b!71021))

(assert (= (and b!71021 res!58542) b!71025))

(assert (= (and b!71025 res!58543) b!71022))

(assert (= (and b!71022 res!58544) b!71026))

(assert (= (and b!71026 res!58545) b!71019))

(assert (= (and b!71019 res!58546) b!71020))

(declare-fun m!113859 () Bool)

(assert (=> b!71019 m!113859))

(declare-fun m!113861 () Bool)

(assert (=> b!71019 m!113861))

(declare-fun m!113863 () Bool)

(assert (=> b!71019 m!113863))

(declare-fun m!113865 () Bool)

(assert (=> b!71019 m!113865))

(declare-fun m!113867 () Bool)

(assert (=> b!71019 m!113867))

(declare-fun m!113869 () Bool)

(assert (=> b!71024 m!113869))

(declare-fun m!113871 () Bool)

(assert (=> b!71024 m!113871))

(declare-fun m!113873 () Bool)

(assert (=> bm!922 m!113873))

(declare-fun m!113875 () Bool)

(assert (=> b!71023 m!113875))

(declare-fun m!113877 () Bool)

(assert (=> b!71023 m!113877))

(declare-fun m!113879 () Bool)

(assert (=> b!71023 m!113879))

(declare-fun m!113881 () Bool)

(assert (=> b!71023 m!113881))

(declare-fun m!113883 () Bool)

(assert (=> b!71023 m!113883))

(declare-fun m!113885 () Bool)

(assert (=> b!71023 m!113885))

(declare-fun m!113887 () Bool)

(assert (=> b!71023 m!113887))

(declare-fun m!113889 () Bool)

(assert (=> b!71023 m!113889))

(declare-fun m!113891 () Bool)

(assert (=> b!71023 m!113891))

(declare-fun m!113893 () Bool)

(assert (=> b!71023 m!113893))

(declare-fun m!113895 () Bool)

(assert (=> b!71023 m!113895))

(declare-fun m!113897 () Bool)

(assert (=> b!71023 m!113897))

(declare-fun m!113899 () Bool)

(assert (=> b!71023 m!113899))

(declare-fun m!113901 () Bool)

(assert (=> b!71023 m!113901))

(declare-fun m!113903 () Bool)

(assert (=> b!71023 m!113903))

(declare-fun m!113905 () Bool)

(assert (=> b!71023 m!113905))

(declare-fun m!113907 () Bool)

(assert (=> b!71023 m!113907))

(declare-fun m!113909 () Bool)

(assert (=> b!71023 m!113909))

(declare-fun m!113911 () Bool)

(assert (=> b!71023 m!113911))

(declare-fun m!113913 () Bool)

(assert (=> b!71023 m!113913))

(declare-fun m!113915 () Bool)

(assert (=> b!71023 m!113915))

(declare-fun m!113917 () Bool)

(assert (=> b!71023 m!113917))

(declare-fun m!113919 () Bool)

(assert (=> b!71023 m!113919))

(declare-fun m!113921 () Bool)

(assert (=> b!71023 m!113921))

(assert (=> b!71023 m!112927))

(assert (=> b!71023 m!113909))

(declare-fun m!113923 () Bool)

(assert (=> b!71023 m!113923))

(declare-fun m!113925 () Bool)

(assert (=> b!71023 m!113925))

(assert (=> b!71023 m!113877))

(declare-fun m!113927 () Bool)

(assert (=> b!71023 m!113927))

(declare-fun m!113929 () Bool)

(assert (=> b!71023 m!113929))

(declare-fun m!113931 () Bool)

(assert (=> b!71023 m!113931))

(declare-fun m!113933 () Bool)

(assert (=> b!71023 m!113933))

(assert (=> b!71023 m!113899))

(declare-fun m!113935 () Bool)

(assert (=> b!71023 m!113935))

(assert (=> b!71023 m!113905))

(declare-fun m!113937 () Bool)

(assert (=> b!71022 m!113937))

(declare-fun m!113939 () Bool)

(assert (=> b!71021 m!113939))

(declare-fun m!113941 () Bool)

(assert (=> d!22886 m!113941))

(assert (=> d!22886 m!112927))

(assert (=> d!22886 m!113563))

(assert (=> d!22886 m!113559))

(declare-fun m!113943 () Bool)

(assert (=> b!71020 m!113943))

(assert (=> b!70498 d!22886))

(declare-fun d!22924 () Bool)

(assert (=> d!22924 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1358 (buf!1739 (_2!3174 lt!113481)))) ((_ sign_extend 32) (currentByte!3453 thiss!1379)) ((_ sign_extend 32) (currentBit!3448 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1358 (buf!1739 (_2!3174 lt!113481)))) ((_ sign_extend 32) (currentByte!3453 thiss!1379)) ((_ sign_extend 32) (currentBit!3448 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!5490 () Bool)

(assert (= bs!5490 d!22924))

(declare-fun m!113945 () Bool)

(assert (=> bs!5490 m!113945))

(assert (=> b!70498 d!22924))

(declare-fun b!71027 () Bool)

(declare-fun res!58547 () Bool)

(declare-fun e!46243 () Bool)

(assert (=> b!71027 (=> (not res!58547) (not e!46243))))

(declare-fun lt!114655 () tuple2!6122)

(assert (=> b!71027 (= res!58547 (isPrefixOf!0 (_1!3175 lt!114655) thiss!1379))))

(declare-fun d!22926 () Bool)

(assert (=> d!22926 e!46243))

(declare-fun res!58548 () Bool)

(assert (=> d!22926 (=> (not res!58548) (not e!46243))))

(assert (=> d!22926 (= res!58548 (isPrefixOf!0 (_1!3175 lt!114655) (_2!3175 lt!114655)))))

(declare-fun lt!114653 () BitStream!2308)

(assert (=> d!22926 (= lt!114655 (tuple2!6123 lt!114653 (_2!3174 lt!113481)))))

(declare-fun lt!114664 () Unit!4721)

(declare-fun lt!114666 () Unit!4721)

(assert (=> d!22926 (= lt!114664 lt!114666)))

(assert (=> d!22926 (isPrefixOf!0 lt!114653 (_2!3174 lt!113481))))

(assert (=> d!22926 (= lt!114666 (lemmaIsPrefixTransitive!0 lt!114653 (_2!3174 lt!113481) (_2!3174 lt!113481)))))

(declare-fun lt!114669 () Unit!4721)

(declare-fun lt!114660 () Unit!4721)

(assert (=> d!22926 (= lt!114669 lt!114660)))

(assert (=> d!22926 (isPrefixOf!0 lt!114653 (_2!3174 lt!113481))))

(assert (=> d!22926 (= lt!114660 (lemmaIsPrefixTransitive!0 lt!114653 thiss!1379 (_2!3174 lt!113481)))))

(declare-fun lt!114661 () Unit!4721)

(declare-fun e!46244 () Unit!4721)

(assert (=> d!22926 (= lt!114661 e!46244)))

(declare-fun c!5330 () Bool)

(assert (=> d!22926 (= c!5330 (not (= (size!1358 (buf!1739 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!114665 () Unit!4721)

(declare-fun lt!114652 () Unit!4721)

(assert (=> d!22926 (= lt!114665 lt!114652)))

(assert (=> d!22926 (isPrefixOf!0 (_2!3174 lt!113481) (_2!3174 lt!113481))))

(assert (=> d!22926 (= lt!114652 (lemmaIsPrefixRefl!0 (_2!3174 lt!113481)))))

(declare-fun lt!114654 () Unit!4721)

(declare-fun lt!114651 () Unit!4721)

(assert (=> d!22926 (= lt!114654 lt!114651)))

(assert (=> d!22926 (= lt!114651 (lemmaIsPrefixRefl!0 (_2!3174 lt!113481)))))

(declare-fun lt!114662 () Unit!4721)

(declare-fun lt!114668 () Unit!4721)

(assert (=> d!22926 (= lt!114662 lt!114668)))

(assert (=> d!22926 (isPrefixOf!0 lt!114653 lt!114653)))

(assert (=> d!22926 (= lt!114668 (lemmaIsPrefixRefl!0 lt!114653))))

(declare-fun lt!114659 () Unit!4721)

(declare-fun lt!114658 () Unit!4721)

(assert (=> d!22926 (= lt!114659 lt!114658)))

(assert (=> d!22926 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!22926 (= lt!114658 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!22926 (= lt!114653 (BitStream!2309 (buf!1739 (_2!3174 lt!113481)) (currentByte!3453 thiss!1379) (currentBit!3448 thiss!1379)))))

(assert (=> d!22926 (isPrefixOf!0 thiss!1379 (_2!3174 lt!113481))))

(assert (=> d!22926 (= (reader!0 thiss!1379 (_2!3174 lt!113481)) lt!114655)))

(declare-fun lt!114657 () (_ BitVec 64))

(declare-fun lt!114670 () (_ BitVec 64))

(declare-fun b!71028 () Bool)

(assert (=> b!71028 (= e!46243 (= (_1!3175 lt!114655) (withMovedBitIndex!0 (_2!3175 lt!114655) (bvsub lt!114670 lt!114657))))))

(assert (=> b!71028 (or (= (bvand lt!114670 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!114657 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!114670 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!114670 lt!114657) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!71028 (= lt!114657 (bitIndex!0 (size!1358 (buf!1739 (_2!3174 lt!113481))) (currentByte!3453 (_2!3174 lt!113481)) (currentBit!3448 (_2!3174 lt!113481))))))

(assert (=> b!71028 (= lt!114670 (bitIndex!0 (size!1358 (buf!1739 thiss!1379)) (currentByte!3453 thiss!1379) (currentBit!3448 thiss!1379)))))

(declare-fun b!71029 () Bool)

(declare-fun lt!114667 () Unit!4721)

(assert (=> b!71029 (= e!46244 lt!114667)))

(declare-fun lt!114663 () (_ BitVec 64))

(assert (=> b!71029 (= lt!114663 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!114656 () (_ BitVec 64))

(assert (=> b!71029 (= lt!114656 (bitIndex!0 (size!1358 (buf!1739 thiss!1379)) (currentByte!3453 thiss!1379) (currentBit!3448 thiss!1379)))))

(assert (=> b!71029 (= lt!114667 (arrayBitRangesEqSymmetric!0 (buf!1739 thiss!1379) (buf!1739 (_2!3174 lt!113481)) lt!114663 lt!114656))))

(assert (=> b!71029 (arrayBitRangesEq!0 (buf!1739 (_2!3174 lt!113481)) (buf!1739 thiss!1379) lt!114663 lt!114656)))

(declare-fun b!71030 () Bool)

(declare-fun Unit!4756 () Unit!4721)

(assert (=> b!71030 (= e!46244 Unit!4756)))

(declare-fun b!71031 () Bool)

(declare-fun res!58549 () Bool)

(assert (=> b!71031 (=> (not res!58549) (not e!46243))))

(assert (=> b!71031 (= res!58549 (isPrefixOf!0 (_2!3175 lt!114655) (_2!3174 lt!113481)))))

(assert (= (and d!22926 c!5330) b!71029))

(assert (= (and d!22926 (not c!5330)) b!71030))

(assert (= (and d!22926 res!58548) b!71027))

(assert (= (and b!71027 res!58547) b!71031))

(assert (= (and b!71031 res!58549) b!71028))

(declare-fun m!113947 () Bool)

(assert (=> b!71027 m!113947))

(assert (=> d!22926 m!113563))

(declare-fun m!113949 () Bool)

(assert (=> d!22926 m!113949))

(assert (=> d!22926 m!113559))

(assert (=> d!22926 m!112901))

(declare-fun m!113951 () Bool)

(assert (=> d!22926 m!113951))

(assert (=> d!22926 m!112885))

(assert (=> d!22926 m!112899))

(declare-fun m!113953 () Bool)

(assert (=> d!22926 m!113953))

(declare-fun m!113955 () Bool)

(assert (=> d!22926 m!113955))

(declare-fun m!113957 () Bool)

(assert (=> d!22926 m!113957))

(declare-fun m!113959 () Bool)

(assert (=> d!22926 m!113959))

(declare-fun m!113961 () Bool)

(assert (=> b!71028 m!113961))

(assert (=> b!71028 m!112927))

(assert (=> b!71028 m!112903))

(assert (=> b!71029 m!112903))

(declare-fun m!113963 () Bool)

(assert (=> b!71029 m!113963))

(declare-fun m!113965 () Bool)

(assert (=> b!71029 m!113965))

(declare-fun m!113967 () Bool)

(assert (=> b!71031 m!113967))

(assert (=> b!70498 d!22926))

(declare-fun d!22928 () Bool)

(declare-fun res!58550 () Bool)

(declare-fun e!46245 () Bool)

(assert (=> d!22928 (=> (not res!58550) (not e!46245))))

(assert (=> d!22928 (= res!58550 (= (size!1358 (buf!1739 thiss!1379)) (size!1358 (buf!1739 (_2!3174 lt!113498)))))))

(assert (=> d!22928 (= (isPrefixOf!0 thiss!1379 (_2!3174 lt!113498)) e!46245)))

(declare-fun b!71032 () Bool)

(declare-fun res!58551 () Bool)

(assert (=> b!71032 (=> (not res!58551) (not e!46245))))

(assert (=> b!71032 (= res!58551 (bvsle (bitIndex!0 (size!1358 (buf!1739 thiss!1379)) (currentByte!3453 thiss!1379) (currentBit!3448 thiss!1379)) (bitIndex!0 (size!1358 (buf!1739 (_2!3174 lt!113498))) (currentByte!3453 (_2!3174 lt!113498)) (currentBit!3448 (_2!3174 lt!113498)))))))

(declare-fun b!71033 () Bool)

(declare-fun e!46246 () Bool)

(assert (=> b!71033 (= e!46245 e!46246)))

(declare-fun res!58552 () Bool)

(assert (=> b!71033 (=> res!58552 e!46246)))

(assert (=> b!71033 (= res!58552 (= (size!1358 (buf!1739 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!71034 () Bool)

(assert (=> b!71034 (= e!46246 (arrayBitRangesEq!0 (buf!1739 thiss!1379) (buf!1739 (_2!3174 lt!113498)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1358 (buf!1739 thiss!1379)) (currentByte!3453 thiss!1379) (currentBit!3448 thiss!1379))))))

(assert (= (and d!22928 res!58550) b!71032))

(assert (= (and b!71032 res!58551) b!71033))

(assert (= (and b!71033 (not res!58552)) b!71034))

(assert (=> b!71032 m!112903))

(assert (=> b!71032 m!112905))

(assert (=> b!71034 m!112903))

(assert (=> b!71034 m!112903))

(declare-fun m!113969 () Bool)

(assert (=> b!71034 m!113969))

(assert (=> b!70498 d!22928))

(declare-fun d!22930 () Bool)

(assert (=> d!22930 (isPrefixOf!0 thiss!1379 (_2!3174 lt!113498))))

(declare-fun lt!114673 () Unit!4721)

(declare-fun choose!30 (BitStream!2308 BitStream!2308 BitStream!2308) Unit!4721)

(assert (=> d!22930 (= lt!114673 (choose!30 thiss!1379 (_2!3174 lt!113481) (_2!3174 lt!113498)))))

(assert (=> d!22930 (isPrefixOf!0 thiss!1379 (_2!3174 lt!113481))))

(assert (=> d!22930 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3174 lt!113481) (_2!3174 lt!113498)) lt!114673)))

(declare-fun bs!5491 () Bool)

(assert (= bs!5491 d!22930))

(assert (=> bs!5491 m!112917))

(declare-fun m!113971 () Bool)

(assert (=> bs!5491 m!113971))

(assert (=> bs!5491 m!112885))

(assert (=> b!70498 d!22930))

(declare-fun d!22932 () Bool)

(declare-fun res!58553 () Bool)

(declare-fun e!46247 () Bool)

(assert (=> d!22932 (=> (not res!58553) (not e!46247))))

(assert (=> d!22932 (= res!58553 (= (size!1358 (buf!1739 (_2!3174 lt!113481))) (size!1358 (buf!1739 (_2!3174 lt!113498)))))))

(assert (=> d!22932 (= (isPrefixOf!0 (_2!3174 lt!113481) (_2!3174 lt!113498)) e!46247)))

(declare-fun b!71035 () Bool)

(declare-fun res!58554 () Bool)

(assert (=> b!71035 (=> (not res!58554) (not e!46247))))

(assert (=> b!71035 (= res!58554 (bvsle (bitIndex!0 (size!1358 (buf!1739 (_2!3174 lt!113481))) (currentByte!3453 (_2!3174 lt!113481)) (currentBit!3448 (_2!3174 lt!113481))) (bitIndex!0 (size!1358 (buf!1739 (_2!3174 lt!113498))) (currentByte!3453 (_2!3174 lt!113498)) (currentBit!3448 (_2!3174 lt!113498)))))))

(declare-fun b!71036 () Bool)

(declare-fun e!46248 () Bool)

(assert (=> b!71036 (= e!46247 e!46248)))

(declare-fun res!58555 () Bool)

(assert (=> b!71036 (=> res!58555 e!46248)))

(assert (=> b!71036 (= res!58555 (= (size!1358 (buf!1739 (_2!3174 lt!113481))) #b00000000000000000000000000000000))))

(declare-fun b!71037 () Bool)

(assert (=> b!71037 (= e!46248 (arrayBitRangesEq!0 (buf!1739 (_2!3174 lt!113481)) (buf!1739 (_2!3174 lt!113498)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1358 (buf!1739 (_2!3174 lt!113481))) (currentByte!3453 (_2!3174 lt!113481)) (currentBit!3448 (_2!3174 lt!113481)))))))

(assert (= (and d!22932 res!58553) b!71035))

(assert (= (and b!71035 res!58554) b!71036))

(assert (= (and b!71036 (not res!58555)) b!71037))

(assert (=> b!71035 m!112927))

(assert (=> b!71035 m!112905))

(assert (=> b!71037 m!112927))

(assert (=> b!71037 m!112927))

(declare-fun m!113973 () Bool)

(assert (=> b!71037 m!113973))

(assert (=> b!70498 d!22932))

(declare-fun d!22934 () Bool)

(assert (=> d!22934 (= (bitAt!0 (buf!1739 (_2!3174 lt!113498)) lt!113486) (not (= (bvand ((_ sign_extend 24) (select (arr!1943 (buf!1739 (_2!3174 lt!113498))) ((_ extract 31 0) (bvsdiv lt!113486 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!113486 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5492 () Bool)

(assert (= bs!5492 d!22934))

(declare-fun m!113975 () Bool)

(assert (=> bs!5492 m!113975))

(assert (=> bs!5492 m!113651))

(assert (=> b!70488 d!22934))

(declare-fun d!22936 () Bool)

(assert (=> d!22936 (= (bitAt!0 (buf!1739 (_2!3174 lt!113481)) lt!113486) (bitAt!0 (buf!1739 (_2!3174 lt!113498)) lt!113486))))

(declare-fun lt!114676 () Unit!4721)

(declare-fun choose!31 (array!2917 array!2917 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4721)

(assert (=> d!22936 (= lt!114676 (choose!31 (buf!1739 (_2!3174 lt!113481)) (buf!1739 (_2!3174 lt!113498)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!113486 lt!113504))))

(assert (=> d!22936 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!113504))))

(assert (=> d!22936 (= (arrayBitRangesEqImpliesEq!0 (buf!1739 (_2!3174 lt!113481)) (buf!1739 (_2!3174 lt!113498)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!113486 lt!113504) lt!114676)))

(declare-fun bs!5493 () Bool)

(assert (= bs!5493 d!22936))

(assert (=> bs!5493 m!112975))

(assert (=> bs!5493 m!112965))

(declare-fun m!113977 () Bool)

(assert (=> bs!5493 m!113977))

(assert (=> b!70488 d!22936))

(declare-fun d!22938 () Bool)

(assert (=> d!22938 (= (invariant!0 (currentBit!3448 (_2!3174 lt!113498)) (currentByte!3453 (_2!3174 lt!113498)) (size!1358 (buf!1739 (_2!3174 lt!113498)))) (and (bvsge (currentBit!3448 (_2!3174 lt!113498)) #b00000000000000000000000000000000) (bvslt (currentBit!3448 (_2!3174 lt!113498)) #b00000000000000000000000000001000) (bvsge (currentByte!3453 (_2!3174 lt!113498)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3453 (_2!3174 lt!113498)) (size!1358 (buf!1739 (_2!3174 lt!113498)))) (and (= (currentBit!3448 (_2!3174 lt!113498)) #b00000000000000000000000000000000) (= (currentByte!3453 (_2!3174 lt!113498)) (size!1358 (buf!1739 (_2!3174 lt!113498))))))))))

(assert (=> b!70499 d!22938))

(declare-fun d!22940 () Bool)

(assert (=> d!22940 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1943 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5494 () Bool)

(assert (= bs!5494 d!22940))

(assert (=> bs!5494 m!112879))

(assert (=> bs!5494 m!113549))

(assert (=> b!70500 d!22940))

(declare-fun d!22942 () Bool)

(assert (=> d!22942 (= (head!548 (byteArrayBitContentToList!0 (_2!3174 lt!113498) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!844 (byteArrayBitContentToList!0 (_2!3174 lt!113498) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!70500 d!22942))

(declare-fun d!22944 () Bool)

(declare-fun c!5331 () Bool)

(assert (=> d!22944 (= c!5331 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!46249 () List!729)

(assert (=> d!22944 (= (byteArrayBitContentToList!0 (_2!3174 lt!113498) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!46249)))

(declare-fun b!71038 () Bool)

(assert (=> b!71038 (= e!46249 Nil!726)))

(declare-fun b!71039 () Bool)

(assert (=> b!71039 (= e!46249 (Cons!725 (not (= (bvand ((_ sign_extend 24) (select (arr!1943 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3174 lt!113498) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!22944 c!5331) b!71038))

(assert (= (and d!22944 (not c!5331)) b!71039))

(assert (=> b!71039 m!112879))

(assert (=> b!71039 m!113549))

(declare-fun m!113979 () Bool)

(assert (=> b!71039 m!113979))

(assert (=> b!70500 d!22944))

(declare-fun d!22946 () Bool)

(declare-fun e!46250 () Bool)

(assert (=> d!22946 e!46250))

(declare-fun res!58556 () Bool)

(assert (=> d!22946 (=> (not res!58556) (not e!46250))))

(declare-fun lt!114682 () (_ BitVec 64))

(declare-fun lt!114679 () (_ BitVec 64))

(declare-fun lt!114680 () (_ BitVec 64))

(assert (=> d!22946 (= res!58556 (= lt!114682 (bvsub lt!114680 lt!114679)))))

(assert (=> d!22946 (or (= (bvand lt!114680 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!114679 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!114680 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!114680 lt!114679) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!22946 (= lt!114679 (remainingBits!0 ((_ sign_extend 32) (size!1358 (buf!1739 (_2!3174 lt!113498)))) ((_ sign_extend 32) (currentByte!3453 (_2!3174 lt!113498))) ((_ sign_extend 32) (currentBit!3448 (_2!3174 lt!113498)))))))

(declare-fun lt!114677 () (_ BitVec 64))

(declare-fun lt!114681 () (_ BitVec 64))

(assert (=> d!22946 (= lt!114680 (bvmul lt!114677 lt!114681))))

(assert (=> d!22946 (or (= lt!114677 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!114681 (bvsdiv (bvmul lt!114677 lt!114681) lt!114677)))))

(assert (=> d!22946 (= lt!114681 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!22946 (= lt!114677 ((_ sign_extend 32) (size!1358 (buf!1739 (_2!3174 lt!113498)))))))

(assert (=> d!22946 (= lt!114682 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3453 (_2!3174 lt!113498))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3448 (_2!3174 lt!113498)))))))

(assert (=> d!22946 (invariant!0 (currentBit!3448 (_2!3174 lt!113498)) (currentByte!3453 (_2!3174 lt!113498)) (size!1358 (buf!1739 (_2!3174 lt!113498))))))

(assert (=> d!22946 (= (bitIndex!0 (size!1358 (buf!1739 (_2!3174 lt!113498))) (currentByte!3453 (_2!3174 lt!113498)) (currentBit!3448 (_2!3174 lt!113498))) lt!114682)))

(declare-fun b!71040 () Bool)

(declare-fun res!58557 () Bool)

(assert (=> b!71040 (=> (not res!58557) (not e!46250))))

(assert (=> b!71040 (= res!58557 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!114682))))

(declare-fun b!71041 () Bool)

(declare-fun lt!114678 () (_ BitVec 64))

(assert (=> b!71041 (= e!46250 (bvsle lt!114682 (bvmul lt!114678 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!71041 (or (= lt!114678 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!114678 #b0000000000000000000000000000000000000000000000000000000000001000) lt!114678)))))

(assert (=> b!71041 (= lt!114678 ((_ sign_extend 32) (size!1358 (buf!1739 (_2!3174 lt!113498)))))))

(assert (= (and d!22946 res!58556) b!71040))

(assert (= (and b!71040 res!58557) b!71041))

(declare-fun m!113981 () Bool)

(assert (=> d!22946 m!113981))

(assert (=> d!22946 m!112921))

(assert (=> b!70489 d!22946))

(declare-fun d!22948 () Bool)

(assert (=> d!22948 (= (head!548 lt!113500) (h!844 lt!113500))))

(assert (=> b!70490 d!22948))

(declare-fun d!22950 () Bool)

(assert (=> d!22950 (= (invariant!0 (currentBit!3448 (_2!3174 lt!113481)) (currentByte!3453 (_2!3174 lt!113481)) (size!1358 (buf!1739 (_2!3174 lt!113481)))) (and (bvsge (currentBit!3448 (_2!3174 lt!113481)) #b00000000000000000000000000000000) (bvslt (currentBit!3448 (_2!3174 lt!113481)) #b00000000000000000000000000001000) (bvsge (currentByte!3453 (_2!3174 lt!113481)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3453 (_2!3174 lt!113481)) (size!1358 (buf!1739 (_2!3174 lt!113481)))) (and (= (currentBit!3448 (_2!3174 lt!113481)) #b00000000000000000000000000000000) (= (currentByte!3453 (_2!3174 lt!113481)) (size!1358 (buf!1739 (_2!3174 lt!113481))))))))))

(assert (=> b!70480 d!22950))

(declare-fun d!22952 () Bool)

(declare-fun lt!114685 () tuple2!6154)

(assert (=> d!22952 (= lt!114685 (readBit!0 (_1!3175 lt!113483)))))

(assert (=> d!22952 (= (readBitPure!0 (_1!3175 lt!113483)) (tuple2!6125 (_2!3191 lt!114685) (_1!3191 lt!114685)))))

(declare-fun bs!5495 () Bool)

(assert (= bs!5495 d!22952))

(assert (=> bs!5495 m!113597))

(assert (=> b!70501 d!22952))

(push 1)

(assert (not d!22836))

(assert (not b!70866))

(assert (not b!71028))

(assert (not d!22886))

(assert (not d!22830))

(assert (not b!71031))

(assert (not d!22782))

(assert (not b!70917))

(assert (not b!70871))

(assert (not b!71024))

(assert (not b!70904))

(assert (not d!22936))

(assert (not d!22952))

(assert (not b!71034))

(assert (not d!22834))

(assert (not b!70893))

(assert (not b!71039))

(assert (not d!22848))

(assert (not b!70925))

(assert (not b!70891))

(assert (not b!70914))

(assert (not b!70912))

(assert (not b!70800))

(assert (not b!71019))

(assert (not b!71022))

(assert (not d!22856))

(assert (not d!22854))

(assert (not b!71035))

(assert (not b!70890))

(assert (not d!22840))

(assert (not d!22876))

(assert (not d!22780))

(assert (not b!70870))

(assert (not d!22778))

(assert (not b!70889))

(assert (not d!22926))

(assert (not b!70905))

(assert (not b!71021))

(assert (not b!70930))

(assert (not b!70926))

(assert (not b!71037))

(assert (not d!22884))

(assert (not b!70927))

(assert (not b!71032))

(assert (not d!22930))

(assert (not b!70923))

(assert (not d!22924))

(assert (not b!70797))

(assert (not b!70872))

(assert (not b!70868))

(assert (not d!22838))

(assert (not b!71029))

(assert (not b!71020))

(assert (not b!71023))

(assert (not b!70928))

(assert (not b!70908))

(assert (not b!70795))

(assert (not b!70865))

(assert (not b!70907))

(assert (not b!70911))

(assert (not b!70869))

(assert (not b!70867))

(assert (not b!71027))

(assert (not b!70909))

(assert (not bm!922))

(assert (not d!22946))

(assert (not d!22846))

(assert (not d!22868))

(assert (not b!70910))

(assert (not d!22870))

(assert (not d!22880))

(assert (not b!70903))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

