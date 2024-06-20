; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6886 () Bool)

(assert start!6886)

(declare-fun b!32486 () Bool)

(declare-fun e!21484 () Bool)

(declare-fun e!21474 () Bool)

(assert (=> b!32486 (= e!21484 e!21474)))

(declare-fun res!27754 () Bool)

(assert (=> b!32486 (=> (not res!27754) (not e!21474))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!48161 () (_ BitVec 64))

(assert (=> b!32486 (= res!27754 (bvsle to!314 lt!48161))))

(declare-datatypes ((array!1822 0))(
  ( (array!1823 (arr!1278 (Array (_ BitVec 32) (_ BitVec 8))) (size!803 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1822)

(assert (=> b!32486 (= lt!48161 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!803 srcBuffer!2))))))

(declare-fun b!32487 () Bool)

(declare-fun e!21475 () Bool)

(declare-fun e!21482 () Bool)

(assert (=> b!32487 (= e!21475 e!21482)))

(declare-fun res!27750 () Bool)

(assert (=> b!32487 (=> res!27750 e!21482)))

(declare-datatypes ((BitStream!1398 0))(
  ( (BitStream!1399 (buf!1131 array!1822) (currentByte!2498 (_ BitVec 32)) (currentBit!2493 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1398)

(declare-datatypes ((Unit!2461 0))(
  ( (Unit!2462) )
))
(declare-datatypes ((tuple2!3326 0))(
  ( (tuple2!3327 (_1!1750 Unit!2461) (_2!1750 BitStream!1398)) )
))
(declare-fun lt!48159 () tuple2!3326)

(declare-fun isPrefixOf!0 (BitStream!1398 BitStream!1398) Bool)

(assert (=> b!32487 (= res!27750 (not (isPrefixOf!0 thiss!1379 (_2!1750 lt!48159))))))

(declare-fun lt!48165 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!32487 (validate_offset_bits!1 ((_ sign_extend 32) (size!803 (buf!1131 (_2!1750 lt!48159)))) ((_ sign_extend 32) (currentByte!2498 (_2!1750 lt!48159))) ((_ sign_extend 32) (currentBit!2493 (_2!1750 lt!48159))) lt!48165)))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!32487 (= lt!48165 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48156 () Unit!2461)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1398 BitStream!1398 (_ BitVec 64) (_ BitVec 64)) Unit!2461)

(assert (=> b!32487 (= lt!48156 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1750 lt!48159) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1398 (_ BitVec 8) (_ BitVec 32)) tuple2!3326)

(assert (=> b!32487 (= lt!48159 (appendBitFromByte!0 thiss!1379 (select (arr!1278 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!32488 () Bool)

(declare-fun res!27753 () Bool)

(declare-fun e!21470 () Bool)

(assert (=> b!32488 (=> res!27753 e!21470)))

(declare-fun lt!48157 () tuple2!3326)

(declare-datatypes ((List!400 0))(
  ( (Nil!397) (Cons!396 (h!515 Bool) (t!1150 List!400)) )
))
(declare-fun head!237 (List!400) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1398 array!1822 (_ BitVec 64) (_ BitVec 64)) List!400)

(declare-fun bitAt!0 (array!1822 (_ BitVec 64)) Bool)

(assert (=> b!32488 (= res!27753 (not (= (head!237 (byteArrayBitContentToList!0 (_2!1750 lt!48157) srcBuffer!2 i!635 (bvsub to!314 i!635))) (bitAt!0 srcBuffer!2 i!635))))))

(declare-fun e!21472 () Bool)

(declare-fun b!32490 () Bool)

(declare-datatypes ((tuple2!3328 0))(
  ( (tuple2!3329 (_1!1751 BitStream!1398) (_2!1751 BitStream!1398)) )
))
(declare-fun lt!48163 () tuple2!3328)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1398 BitStream!1398 (_ BitVec 64)) List!400)

(assert (=> b!32490 (= e!21472 (= (head!237 (byteArrayBitContentToList!0 (_2!1750 lt!48159) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!237 (bitStreamReadBitsIntoList!0 (_2!1750 lt!48159) (_1!1751 lt!48163) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!32491 () Bool)

(declare-fun res!27755 () Bool)

(assert (=> b!32491 (=> res!27755 e!21470)))

(declare-fun lt!48154 () List!400)

(declare-fun lt!48149 () Bool)

(assert (=> b!32491 (= res!27755 (not (= (head!237 lt!48154) lt!48149)))))

(declare-fun b!32492 () Bool)

(declare-fun res!27757 () Bool)

(declare-fun e!21483 () Bool)

(assert (=> b!32492 (=> res!27757 e!21483)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!32492 (= res!27757 (not (invariant!0 (currentBit!2493 (_2!1750 lt!48157)) (currentByte!2498 (_2!1750 lt!48157)) (size!803 (buf!1131 (_2!1750 lt!48157))))))))

(declare-fun b!32493 () Bool)

(declare-fun e!21480 () Bool)

(declare-fun array_inv!752 (array!1822) Bool)

(assert (=> b!32493 (= e!21480 (array_inv!752 (buf!1131 thiss!1379)))))

(declare-fun b!32494 () Bool)

(declare-fun e!21481 () Bool)

(declare-fun e!21476 () Bool)

(assert (=> b!32494 (= e!21481 e!21476)))

(declare-fun res!27758 () Bool)

(assert (=> b!32494 (=> res!27758 e!21476)))

(declare-fun lt!48166 () List!400)

(declare-fun lt!48155 () List!400)

(assert (=> b!32494 (= res!27758 (not (= lt!48166 lt!48155)))))

(assert (=> b!32494 (= lt!48155 lt!48166)))

(declare-fun tail!117 (List!400) List!400)

(assert (=> b!32494 (= lt!48166 (tail!117 lt!48154))))

(declare-fun lt!48148 () tuple2!3328)

(declare-fun lt!48158 () Unit!2461)

(declare-fun lt!48150 () tuple2!3328)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1398 BitStream!1398 BitStream!1398 BitStream!1398 (_ BitVec 64) List!400) Unit!2461)

(assert (=> b!32494 (= lt!48158 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1750 lt!48157) (_2!1750 lt!48157) (_1!1751 lt!48150) (_1!1751 lt!48148) (bvsub to!314 i!635) lt!48154))))

(declare-fun b!32495 () Bool)

(assert (=> b!32495 (= e!21476 e!21470)))

(declare-fun res!27765 () Bool)

(assert (=> b!32495 (=> res!27765 e!21470)))

(declare-fun lt!48147 () (_ BitVec 64))

(assert (=> b!32495 (= res!27765 (not (= lt!48149 (bitAt!0 (buf!1131 (_1!1751 lt!48148)) lt!48147))))))

(assert (=> b!32495 (= lt!48149 (bitAt!0 (buf!1131 (_1!1751 lt!48150)) lt!48147))))

(declare-fun res!27767 () Bool)

(assert (=> start!6886 (=> (not res!27767) (not e!21484))))

(assert (=> start!6886 (= res!27767 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111)))))

(assert (=> start!6886 e!21484))

(assert (=> start!6886 true))

(declare-fun inv!12 (BitStream!1398) Bool)

(assert (=> start!6886 (and (inv!12 thiss!1379) e!21480)))

(assert (=> start!6886 (array_inv!752 srcBuffer!2)))

(declare-fun b!32489 () Bool)

(declare-fun res!27749 () Bool)

(assert (=> b!32489 (=> res!27749 e!21481)))

(declare-fun length!126 (List!400) Int)

(assert (=> b!32489 (= res!27749 (<= (length!126 lt!48154) 0))))

(declare-fun b!32496 () Bool)

(declare-fun res!27766 () Bool)

(declare-fun e!21478 () Bool)

(assert (=> b!32496 (=> res!27766 e!21478)))

(assert (=> b!32496 (= res!27766 (not (invariant!0 (currentBit!2493 (_2!1750 lt!48159)) (currentByte!2498 (_2!1750 lt!48159)) (size!803 (buf!1131 (_2!1750 lt!48159))))))))

(declare-fun b!32497 () Bool)

(declare-fun res!27761 () Bool)

(assert (=> b!32497 (=> (not res!27761) (not e!21474))))

(assert (=> b!32497 (= res!27761 (validate_offset_bits!1 ((_ sign_extend 32) (size!803 (buf!1131 thiss!1379))) ((_ sign_extend 32) (currentByte!2498 thiss!1379)) ((_ sign_extend 32) (currentBit!2493 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!32498 () Bool)

(declare-fun res!27760 () Bool)

(assert (=> b!32498 (=> res!27760 e!21478)))

(assert (=> b!32498 (= res!27760 (not (invariant!0 (currentBit!2493 (_2!1750 lt!48159)) (currentByte!2498 (_2!1750 lt!48159)) (size!803 (buf!1131 (_2!1750 lt!48157))))))))

(declare-fun b!32499 () Bool)

(assert (=> b!32499 (= e!21474 (not e!21475))))

(declare-fun res!27751 () Bool)

(assert (=> b!32499 (=> res!27751 e!21475)))

(assert (=> b!32499 (= res!27751 (bvsge i!635 to!314))))

(assert (=> b!32499 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!48151 () Unit!2461)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1398) Unit!2461)

(assert (=> b!32499 (= lt!48151 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!32499 (= lt!48147 (bitIndex!0 (size!803 (buf!1131 thiss!1379)) (currentByte!2498 thiss!1379) (currentBit!2493 thiss!1379)))))

(declare-fun b!32500 () Bool)

(declare-fun res!27764 () Bool)

(assert (=> b!32500 (=> res!27764 e!21483)))

(assert (=> b!32500 (= res!27764 (not (= (size!803 (buf!1131 thiss!1379)) (size!803 (buf!1131 (_2!1750 lt!48157))))))))

(declare-fun b!32501 () Bool)

(assert (=> b!32501 (= e!21478 e!21481)))

(declare-fun res!27768 () Bool)

(assert (=> b!32501 (=> res!27768 e!21481)))

(assert (=> b!32501 (= res!27768 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!32501 (= lt!48155 (bitStreamReadBitsIntoList!0 (_2!1750 lt!48157) (_1!1751 lt!48148) lt!48165))))

(assert (=> b!32501 (= lt!48154 (bitStreamReadBitsIntoList!0 (_2!1750 lt!48157) (_1!1751 lt!48150) (bvsub to!314 i!635)))))

(assert (=> b!32501 (validate_offset_bits!1 ((_ sign_extend 32) (size!803 (buf!1131 (_2!1750 lt!48157)))) ((_ sign_extend 32) (currentByte!2498 (_2!1750 lt!48159))) ((_ sign_extend 32) (currentBit!2493 (_2!1750 lt!48159))) lt!48165)))

(declare-fun lt!48162 () Unit!2461)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1398 array!1822 (_ BitVec 64)) Unit!2461)

(assert (=> b!32501 (= lt!48162 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1750 lt!48159) (buf!1131 (_2!1750 lt!48157)) lt!48165))))

(declare-fun reader!0 (BitStream!1398 BitStream!1398) tuple2!3328)

(assert (=> b!32501 (= lt!48148 (reader!0 (_2!1750 lt!48159) (_2!1750 lt!48157)))))

(assert (=> b!32501 (validate_offset_bits!1 ((_ sign_extend 32) (size!803 (buf!1131 (_2!1750 lt!48157)))) ((_ sign_extend 32) (currentByte!2498 thiss!1379)) ((_ sign_extend 32) (currentBit!2493 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!48164 () Unit!2461)

(assert (=> b!32501 (= lt!48164 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1131 (_2!1750 lt!48157)) (bvsub to!314 i!635)))))

(assert (=> b!32501 (= lt!48150 (reader!0 thiss!1379 (_2!1750 lt!48157)))))

(declare-fun lt!48153 () (_ BitVec 64))

(declare-fun b!32502 () Bool)

(declare-fun e!21479 () Bool)

(assert (=> b!32502 (= e!21479 (= lt!48153 (bvsub (bvsub (bvadd (bitIndex!0 (size!803 (buf!1131 (_2!1750 lt!48159))) (currentByte!2498 (_2!1750 lt!48159)) (currentBit!2493 (_2!1750 lt!48159))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!32503 () Bool)

(assert (=> b!32503 (= e!21470 (bvslt i!635 lt!48161))))

(declare-fun b!32504 () Bool)

(declare-fun e!21477 () Bool)

(assert (=> b!32504 (= e!21482 e!21477)))

(declare-fun res!27759 () Bool)

(assert (=> b!32504 (=> res!27759 e!21477)))

(assert (=> b!32504 (= res!27759 (not (isPrefixOf!0 (_2!1750 lt!48159) (_2!1750 lt!48157))))))

(assert (=> b!32504 (isPrefixOf!0 thiss!1379 (_2!1750 lt!48157))))

(declare-fun lt!48152 () Unit!2461)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1398 BitStream!1398 BitStream!1398) Unit!2461)

(assert (=> b!32504 (= lt!48152 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1750 lt!48159) (_2!1750 lt!48157)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1398 array!1822 (_ BitVec 64) (_ BitVec 64)) tuple2!3326)

(assert (=> b!32504 (= lt!48157 (appendBitsMSBFirstLoop!0 (_2!1750 lt!48159) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!32504 e!21472))

(declare-fun res!27762 () Bool)

(assert (=> b!32504 (=> (not res!27762) (not e!21472))))

(assert (=> b!32504 (= res!27762 (validate_offset_bits!1 ((_ sign_extend 32) (size!803 (buf!1131 (_2!1750 lt!48159)))) ((_ sign_extend 32) (currentByte!2498 thiss!1379)) ((_ sign_extend 32) (currentBit!2493 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48160 () Unit!2461)

(assert (=> b!32504 (= lt!48160 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1131 (_2!1750 lt!48159)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!32504 (= lt!48163 (reader!0 thiss!1379 (_2!1750 lt!48159)))))

(declare-fun b!32505 () Bool)

(assert (=> b!32505 (= e!21477 e!21483)))

(declare-fun res!27756 () Bool)

(assert (=> b!32505 (=> res!27756 e!21483)))

(assert (=> b!32505 (= res!27756 (not (= lt!48153 (bvsub (bvadd lt!48147 to!314) i!635))))))

(assert (=> b!32505 (= lt!48153 (bitIndex!0 (size!803 (buf!1131 (_2!1750 lt!48157))) (currentByte!2498 (_2!1750 lt!48157)) (currentBit!2493 (_2!1750 lt!48157))))))

(declare-fun b!32506 () Bool)

(assert (=> b!32506 (= e!21483 e!21478)))

(declare-fun res!27752 () Bool)

(assert (=> b!32506 (=> res!27752 e!21478)))

(assert (=> b!32506 (= res!27752 (not (= (size!803 (buf!1131 (_2!1750 lt!48159))) (size!803 (buf!1131 (_2!1750 lt!48157))))))))

(assert (=> b!32506 e!21479))

(declare-fun res!27763 () Bool)

(assert (=> b!32506 (=> (not res!27763) (not e!21479))))

(assert (=> b!32506 (= res!27763 (= (size!803 (buf!1131 (_2!1750 lt!48157))) (size!803 (buf!1131 thiss!1379))))))

(assert (= (and start!6886 res!27767) b!32486))

(assert (= (and b!32486 res!27754) b!32497))

(assert (= (and b!32497 res!27761) b!32499))

(assert (= (and b!32499 (not res!27751)) b!32487))

(assert (= (and b!32487 (not res!27750)) b!32504))

(assert (= (and b!32504 res!27762) b!32490))

(assert (= (and b!32504 (not res!27759)) b!32505))

(assert (= (and b!32505 (not res!27756)) b!32492))

(assert (= (and b!32492 (not res!27757)) b!32500))

(assert (= (and b!32500 (not res!27764)) b!32506))

(assert (= (and b!32506 res!27763) b!32502))

(assert (= (and b!32506 (not res!27752)) b!32496))

(assert (= (and b!32496 (not res!27766)) b!32498))

(assert (= (and b!32498 (not res!27760)) b!32501))

(assert (= (and b!32501 (not res!27768)) b!32489))

(assert (= (and b!32489 (not res!27749)) b!32494))

(assert (= (and b!32494 (not res!27758)) b!32495))

(assert (= (and b!32495 (not res!27765)) b!32491))

(assert (= (and b!32491 (not res!27755)) b!32488))

(assert (= (and b!32488 (not res!27753)) b!32503))

(assert (= start!6886 b!32493))

(declare-fun m!48057 () Bool)

(assert (=> b!32498 m!48057))

(declare-fun m!48059 () Bool)

(assert (=> b!32492 m!48059))

(declare-fun m!48061 () Bool)

(assert (=> b!32497 m!48061))

(declare-fun m!48063 () Bool)

(assert (=> b!32488 m!48063))

(assert (=> b!32488 m!48063))

(declare-fun m!48065 () Bool)

(assert (=> b!32488 m!48065))

(declare-fun m!48067 () Bool)

(assert (=> b!32488 m!48067))

(declare-fun m!48069 () Bool)

(assert (=> b!32491 m!48069))

(declare-fun m!48071 () Bool)

(assert (=> start!6886 m!48071))

(declare-fun m!48073 () Bool)

(assert (=> start!6886 m!48073))

(declare-fun m!48075 () Bool)

(assert (=> b!32489 m!48075))

(declare-fun m!48077 () Bool)

(assert (=> b!32494 m!48077))

(declare-fun m!48079 () Bool)

(assert (=> b!32494 m!48079))

(declare-fun m!48081 () Bool)

(assert (=> b!32493 m!48081))

(declare-fun m!48083 () Bool)

(assert (=> b!32501 m!48083))

(declare-fun m!48085 () Bool)

(assert (=> b!32501 m!48085))

(declare-fun m!48087 () Bool)

(assert (=> b!32501 m!48087))

(declare-fun m!48089 () Bool)

(assert (=> b!32501 m!48089))

(declare-fun m!48091 () Bool)

(assert (=> b!32501 m!48091))

(declare-fun m!48093 () Bool)

(assert (=> b!32501 m!48093))

(declare-fun m!48095 () Bool)

(assert (=> b!32501 m!48095))

(declare-fun m!48097 () Bool)

(assert (=> b!32501 m!48097))

(declare-fun m!48099 () Bool)

(assert (=> b!32495 m!48099))

(declare-fun m!48101 () Bool)

(assert (=> b!32495 m!48101))

(declare-fun m!48103 () Bool)

(assert (=> b!32487 m!48103))

(declare-fun m!48105 () Bool)

(assert (=> b!32487 m!48105))

(declare-fun m!48107 () Bool)

(assert (=> b!32487 m!48107))

(declare-fun m!48109 () Bool)

(assert (=> b!32487 m!48109))

(assert (=> b!32487 m!48107))

(declare-fun m!48111 () Bool)

(assert (=> b!32487 m!48111))

(declare-fun m!48113 () Bool)

(assert (=> b!32490 m!48113))

(assert (=> b!32490 m!48113))

(declare-fun m!48115 () Bool)

(assert (=> b!32490 m!48115))

(declare-fun m!48117 () Bool)

(assert (=> b!32490 m!48117))

(assert (=> b!32490 m!48117))

(declare-fun m!48119 () Bool)

(assert (=> b!32490 m!48119))

(declare-fun m!48121 () Bool)

(assert (=> b!32499 m!48121))

(declare-fun m!48123 () Bool)

(assert (=> b!32499 m!48123))

(declare-fun m!48125 () Bool)

(assert (=> b!32499 m!48125))

(declare-fun m!48127 () Bool)

(assert (=> b!32505 m!48127))

(declare-fun m!48129 () Bool)

(assert (=> b!32502 m!48129))

(declare-fun m!48131 () Bool)

(assert (=> b!32504 m!48131))

(declare-fun m!48133 () Bool)

(assert (=> b!32504 m!48133))

(declare-fun m!48135 () Bool)

(assert (=> b!32504 m!48135))

(declare-fun m!48137 () Bool)

(assert (=> b!32504 m!48137))

(declare-fun m!48139 () Bool)

(assert (=> b!32504 m!48139))

(declare-fun m!48141 () Bool)

(assert (=> b!32504 m!48141))

(declare-fun m!48143 () Bool)

(assert (=> b!32504 m!48143))

(declare-fun m!48145 () Bool)

(assert (=> b!32496 m!48145))

(check-sat (not b!32495) (not b!32497) (not b!32493) (not b!32505) (not b!32492) (not b!32496) (not b!32501) (not b!32498) (not b!32504) (not b!32499) (not b!32502) (not b!32487) (not start!6886) (not b!32490) (not b!32494) (not b!32491) (not b!32489) (not b!32488))
(check-sat)
