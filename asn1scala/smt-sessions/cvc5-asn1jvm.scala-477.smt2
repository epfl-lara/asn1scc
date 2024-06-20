; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14082 () Bool)

(assert start!14082)

(declare-fun res!59981 () Bool)

(declare-fun e!47385 () Bool)

(assert (=> start!14082 (=> (not res!59981) (not e!47385))))

(declare-datatypes ((array!2965 0))(
  ( (array!2966 (arr!1976 (Array (_ BitVec 32) (_ BitVec 8))) (size!1385 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2965)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!14082 (= res!59981 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1385 srcBuffer!2))))))))

(assert (=> start!14082 e!47385))

(assert (=> start!14082 true))

(declare-fun array_inv!1234 (array!2965) Bool)

(assert (=> start!14082 (array_inv!1234 srcBuffer!2)))

(declare-datatypes ((BitStream!2350 0))(
  ( (BitStream!2351 (buf!1766 array!2965) (currentByte!3492 (_ BitVec 32)) (currentBit!3487 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2350)

(declare-fun e!47380 () Bool)

(declare-fun inv!12 (BitStream!2350) Bool)

(assert (=> start!14082 (and (inv!12 thiss!1379) e!47380)))

(declare-fun b!72655 () Bool)

(declare-fun e!47390 () Bool)

(declare-fun e!47388 () Bool)

(assert (=> b!72655 (= e!47390 e!47388)))

(declare-fun res!59998 () Bool)

(assert (=> b!72655 (=> res!59998 e!47388)))

(declare-fun lt!117174 () Bool)

(declare-fun lt!117169 () Bool)

(assert (=> b!72655 (= res!59998 (not (= lt!117174 lt!117169)))))

(declare-fun bitAt!0 (array!2965 (_ BitVec 64)) Bool)

(assert (=> b!72655 (= lt!117169 (bitAt!0 srcBuffer!2 i!635))))

(declare-datatypes ((Unit!4823 0))(
  ( (Unit!4824) )
))
(declare-datatypes ((tuple2!6282 0))(
  ( (tuple2!6283 (_1!3255 Unit!4823) (_2!3255 BitStream!2350)) )
))
(declare-fun lt!117170 () tuple2!6282)

(declare-datatypes ((List!750 0))(
  ( (Nil!747) (Cons!746 (h!865 Bool) (t!1500 List!750)) )
))
(declare-fun head!569 (List!750) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2350 array!2965 (_ BitVec 64) (_ BitVec 64)) List!750)

(assert (=> b!72655 (= lt!117174 (head!569 (byteArrayBitContentToList!0 (_2!3255 lt!117170) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(declare-fun b!72656 () Bool)

(declare-fun res!59996 () Bool)

(declare-fun e!47387 () Bool)

(assert (=> b!72656 (=> res!59996 e!47387)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!72656 (= res!59996 (not (invariant!0 (currentBit!3487 (_2!3255 lt!117170)) (currentByte!3492 (_2!3255 lt!117170)) (size!1385 (buf!1766 (_2!3255 lt!117170))))))))

(declare-fun b!72657 () Bool)

(declare-fun e!47382 () Bool)

(declare-fun e!47386 () Bool)

(assert (=> b!72657 (= e!47382 e!47386)))

(declare-fun res!59991 () Bool)

(assert (=> b!72657 (=> res!59991 e!47386)))

(declare-fun lt!117150 () List!750)

(declare-fun lt!117151 () List!750)

(assert (=> b!72657 (= res!59991 (not (= lt!117150 lt!117151)))))

(assert (=> b!72657 (= lt!117151 lt!117150)))

(declare-fun lt!117153 () List!750)

(declare-fun tail!354 (List!750) List!750)

(assert (=> b!72657 (= lt!117150 (tail!354 lt!117153))))

(declare-datatypes ((tuple2!6284 0))(
  ( (tuple2!6285 (_1!3256 BitStream!2350) (_2!3256 BitStream!2350)) )
))
(declare-fun lt!117175 () tuple2!6284)

(declare-fun lt!117173 () tuple2!6284)

(declare-fun lt!117165 () Unit!4823)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2350 BitStream!2350 BitStream!2350 BitStream!2350 (_ BitVec 64) List!750) Unit!4823)

(assert (=> b!72657 (= lt!117165 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3255 lt!117170) (_2!3255 lt!117170) (_1!3256 lt!117175) (_1!3256 lt!117173) (bvsub to!314 i!635) lt!117153))))

(declare-fun b!72658 () Bool)

(declare-fun e!47395 () Bool)

(declare-fun e!47383 () Bool)

(assert (=> b!72658 (= e!47395 e!47383)))

(declare-fun res!59984 () Bool)

(assert (=> b!72658 (=> res!59984 e!47383)))

(declare-fun lt!117160 () Bool)

(assert (=> b!72658 (= res!59984 (not (= lt!117160 lt!117169)))))

(declare-fun lt!117163 () Bool)

(assert (=> b!72658 (= lt!117163 lt!117160)))

(declare-fun lt!117161 () (_ BitVec 64))

(assert (=> b!72658 (= lt!117160 (bitAt!0 (buf!1766 (_2!3255 lt!117170)) lt!117161))))

(declare-fun lt!117159 () tuple2!6282)

(declare-fun lt!117171 () Unit!4823)

(declare-fun lt!117164 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2965 array!2965 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4823)

(assert (=> b!72658 (= lt!117171 (arrayBitRangesEqImpliesEq!0 (buf!1766 (_2!3255 lt!117159)) (buf!1766 (_2!3255 lt!117170)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!117161 lt!117164))))

(declare-fun b!72659 () Bool)

(assert (=> b!72659 (= e!47380 (array_inv!1234 (buf!1766 thiss!1379)))))

(declare-fun b!72660 () Bool)

(declare-fun res!59982 () Bool)

(assert (=> b!72660 (=> res!59982 e!47383)))

(declare-datatypes ((tuple2!6286 0))(
  ( (tuple2!6287 (_1!3257 BitStream!2350) (_2!3257 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!2350) tuple2!6286)

(assert (=> b!72660 (= res!59982 (not (= (_2!3257 (readBitPure!0 (_1!3256 lt!117175))) lt!117169)))))

(declare-fun b!72661 () Bool)

(declare-fun e!47391 () Bool)

(assert (=> b!72661 (= e!47391 e!47390)))

(declare-fun res!59986 () Bool)

(assert (=> b!72661 (=> res!59986 e!47390)))

(declare-fun lt!117167 () Bool)

(declare-fun lt!117152 () Bool)

(assert (=> b!72661 (= res!59986 (not (= lt!117167 lt!117152)))))

(assert (=> b!72661 (= lt!117167 (head!569 lt!117153))))

(declare-fun b!72662 () Bool)

(declare-fun res!60000 () Bool)

(assert (=> b!72662 (=> (not res!60000) (not e!47385))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!72662 (= res!60000 (validate_offset_bits!1 ((_ sign_extend 32) (size!1385 (buf!1766 thiss!1379))) ((_ sign_extend 32) (currentByte!3492 thiss!1379)) ((_ sign_extend 32) (currentBit!3487 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!72663 () Bool)

(declare-fun e!47384 () Bool)

(declare-fun e!47381 () Bool)

(assert (=> b!72663 (= e!47384 e!47381)))

(declare-fun res!59993 () Bool)

(assert (=> b!72663 (=> res!59993 e!47381)))

(declare-fun isPrefixOf!0 (BitStream!2350 BitStream!2350) Bool)

(assert (=> b!72663 (= res!59993 (not (isPrefixOf!0 (_2!3255 lt!117159) (_2!3255 lt!117170))))))

(assert (=> b!72663 (isPrefixOf!0 thiss!1379 (_2!3255 lt!117170))))

(declare-fun lt!117166 () Unit!4823)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2350 BitStream!2350 BitStream!2350) Unit!4823)

(assert (=> b!72663 (= lt!117166 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3255 lt!117159) (_2!3255 lt!117170)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2350 array!2965 (_ BitVec 64) (_ BitVec 64)) tuple2!6282)

(assert (=> b!72663 (= lt!117170 (appendBitsMSBFirstLoop!0 (_2!3255 lt!117159) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!47392 () Bool)

(assert (=> b!72663 e!47392))

(declare-fun res!59988 () Bool)

(assert (=> b!72663 (=> (not res!59988) (not e!47392))))

(assert (=> b!72663 (= res!59988 (validate_offset_bits!1 ((_ sign_extend 32) (size!1385 (buf!1766 (_2!3255 lt!117159)))) ((_ sign_extend 32) (currentByte!3492 thiss!1379)) ((_ sign_extend 32) (currentBit!3487 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!117154 () Unit!4823)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2350 array!2965 (_ BitVec 64)) Unit!4823)

(assert (=> b!72663 (= lt!117154 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1766 (_2!3255 lt!117159)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!117162 () tuple2!6284)

(declare-fun reader!0 (BitStream!2350 BitStream!2350) tuple2!6284)

(assert (=> b!72663 (= lt!117162 (reader!0 thiss!1379 (_2!3255 lt!117159)))))

(declare-fun b!72664 () Bool)

(declare-fun res!59992 () Bool)

(declare-fun e!47394 () Bool)

(assert (=> b!72664 (=> res!59992 e!47394)))

(assert (=> b!72664 (= res!59992 (not (invariant!0 (currentBit!3487 (_2!3255 lt!117159)) (currentByte!3492 (_2!3255 lt!117159)) (size!1385 (buf!1766 (_2!3255 lt!117159))))))))

(declare-fun b!72665 () Bool)

(assert (=> b!72665 (= e!47387 e!47394)))

(declare-fun res!59997 () Bool)

(assert (=> b!72665 (=> res!59997 e!47394)))

(assert (=> b!72665 (= res!59997 (not (= (size!1385 (buf!1766 (_2!3255 lt!117159))) (size!1385 (buf!1766 (_2!3255 lt!117170))))))))

(declare-fun lt!117157 () (_ BitVec 64))

(assert (=> b!72665 (= lt!117157 (bvsub (bvsub (bvadd lt!117164 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!72665 (= lt!117164 (bitIndex!0 (size!1385 (buf!1766 (_2!3255 lt!117159))) (currentByte!3492 (_2!3255 lt!117159)) (currentBit!3487 (_2!3255 lt!117159))))))

(assert (=> b!72665 (= (size!1385 (buf!1766 (_2!3255 lt!117170))) (size!1385 (buf!1766 thiss!1379)))))

(declare-fun b!72666 () Bool)

(assert (=> b!72666 (= e!47381 e!47387)))

(declare-fun res!59983 () Bool)

(assert (=> b!72666 (=> res!59983 e!47387)))

(assert (=> b!72666 (= res!59983 (not (= lt!117157 (bvsub (bvadd lt!117161 to!314) i!635))))))

(assert (=> b!72666 (= lt!117157 (bitIndex!0 (size!1385 (buf!1766 (_2!3255 lt!117170))) (currentByte!3492 (_2!3255 lt!117170)) (currentBit!3487 (_2!3255 lt!117170))))))

(declare-fun b!72667 () Bool)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2350 BitStream!2350 (_ BitVec 64)) List!750)

(assert (=> b!72667 (= e!47392 (= (head!569 (byteArrayBitContentToList!0 (_2!3255 lt!117159) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!569 (bitStreamReadBitsIntoList!0 (_2!3255 lt!117159) (_1!3256 lt!117162) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!72668 () Bool)

(declare-fun e!47393 () Bool)

(assert (=> b!72668 (= e!47393 e!47384)))

(declare-fun res!59995 () Bool)

(assert (=> b!72668 (=> res!59995 e!47384)))

(assert (=> b!72668 (= res!59995 (not (isPrefixOf!0 thiss!1379 (_2!3255 lt!117159))))))

(declare-fun lt!117158 () (_ BitVec 64))

(assert (=> b!72668 (validate_offset_bits!1 ((_ sign_extend 32) (size!1385 (buf!1766 (_2!3255 lt!117159)))) ((_ sign_extend 32) (currentByte!3492 (_2!3255 lt!117159))) ((_ sign_extend 32) (currentBit!3487 (_2!3255 lt!117159))) lt!117158)))

(assert (=> b!72668 (= lt!117158 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!117172 () Unit!4823)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2350 BitStream!2350 (_ BitVec 64) (_ BitVec 64)) Unit!4823)

(assert (=> b!72668 (= lt!117172 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3255 lt!117159) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2350 (_ BitVec 8) (_ BitVec 32)) tuple2!6282)

(assert (=> b!72668 (= lt!117159 (appendBitFromByte!0 thiss!1379 (select (arr!1976 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!72669 () Bool)

(assert (=> b!72669 (= e!47394 e!47382)))

(declare-fun res!59987 () Bool)

(assert (=> b!72669 (=> res!59987 e!47382)))

(assert (=> b!72669 (= res!59987 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!72669 (= lt!117151 (bitStreamReadBitsIntoList!0 (_2!3255 lt!117170) (_1!3256 lt!117173) lt!117158))))

(assert (=> b!72669 (= lt!117153 (bitStreamReadBitsIntoList!0 (_2!3255 lt!117170) (_1!3256 lt!117175) (bvsub to!314 i!635)))))

(assert (=> b!72669 (validate_offset_bits!1 ((_ sign_extend 32) (size!1385 (buf!1766 (_2!3255 lt!117170)))) ((_ sign_extend 32) (currentByte!3492 (_2!3255 lt!117159))) ((_ sign_extend 32) (currentBit!3487 (_2!3255 lt!117159))) lt!117158)))

(declare-fun lt!117155 () Unit!4823)

(assert (=> b!72669 (= lt!117155 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3255 lt!117159) (buf!1766 (_2!3255 lt!117170)) lt!117158))))

(assert (=> b!72669 (= lt!117173 (reader!0 (_2!3255 lt!117159) (_2!3255 lt!117170)))))

(assert (=> b!72669 (validate_offset_bits!1 ((_ sign_extend 32) (size!1385 (buf!1766 (_2!3255 lt!117170)))) ((_ sign_extend 32) (currentByte!3492 thiss!1379)) ((_ sign_extend 32) (currentBit!3487 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!117156 () Unit!4823)

(assert (=> b!72669 (= lt!117156 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1766 (_2!3255 lt!117170)) (bvsub to!314 i!635)))))

(assert (=> b!72669 (= lt!117175 (reader!0 thiss!1379 (_2!3255 lt!117170)))))

(declare-fun b!72670 () Bool)

(declare-fun res!59999 () Bool)

(assert (=> b!72670 (=> res!59999 e!47394)))

(assert (=> b!72670 (= res!59999 (not (invariant!0 (currentBit!3487 (_2!3255 lt!117159)) (currentByte!3492 (_2!3255 lt!117159)) (size!1385 (buf!1766 (_2!3255 lt!117170))))))))

(declare-fun b!72671 () Bool)

(assert (=> b!72671 (= e!47383 (or (not (= lt!117167 lt!117174)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!72672 () Bool)

(declare-fun res!59985 () Bool)

(assert (=> b!72672 (=> res!59985 e!47387)))

(assert (=> b!72672 (= res!59985 (not (= (size!1385 (buf!1766 thiss!1379)) (size!1385 (buf!1766 (_2!3255 lt!117170))))))))

(declare-fun b!72673 () Bool)

(assert (=> b!72673 (= e!47385 (not e!47393))))

(declare-fun res!59994 () Bool)

(assert (=> b!72673 (=> res!59994 e!47393)))

(assert (=> b!72673 (= res!59994 (bvsge i!635 to!314))))

(assert (=> b!72673 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!117168 () Unit!4823)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2350) Unit!4823)

(assert (=> b!72673 (= lt!117168 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!72673 (= lt!117161 (bitIndex!0 (size!1385 (buf!1766 thiss!1379)) (currentByte!3492 thiss!1379) (currentBit!3487 thiss!1379)))))

(declare-fun b!72674 () Bool)

(declare-fun res!59989 () Bool)

(assert (=> b!72674 (=> res!59989 e!47382)))

(declare-fun length!378 (List!750) Int)

(assert (=> b!72674 (= res!59989 (<= (length!378 lt!117153) 0))))

(declare-fun b!72675 () Bool)

(assert (=> b!72675 (= e!47386 e!47391)))

(declare-fun res!59990 () Bool)

(assert (=> b!72675 (=> res!59990 e!47391)))

(assert (=> b!72675 (= res!59990 (not (= lt!117152 (bitAt!0 (buf!1766 (_1!3256 lt!117173)) lt!117161))))))

(assert (=> b!72675 (= lt!117152 (bitAt!0 (buf!1766 (_1!3256 lt!117175)) lt!117161))))

(declare-fun b!72676 () Bool)

(assert (=> b!72676 (= e!47388 e!47395)))

(declare-fun res!59980 () Bool)

(assert (=> b!72676 (=> res!59980 e!47395)))

(assert (=> b!72676 (= res!59980 (not (= lt!117163 lt!117169)))))

(assert (=> b!72676 (= lt!117163 (bitAt!0 (buf!1766 (_2!3255 lt!117159)) lt!117161))))

(assert (= (and start!14082 res!59981) b!72662))

(assert (= (and b!72662 res!60000) b!72673))

(assert (= (and b!72673 (not res!59994)) b!72668))

(assert (= (and b!72668 (not res!59995)) b!72663))

(assert (= (and b!72663 res!59988) b!72667))

(assert (= (and b!72663 (not res!59993)) b!72666))

(assert (= (and b!72666 (not res!59983)) b!72656))

(assert (= (and b!72656 (not res!59996)) b!72672))

(assert (= (and b!72672 (not res!59985)) b!72665))

(assert (= (and b!72665 (not res!59997)) b!72664))

(assert (= (and b!72664 (not res!59992)) b!72670))

(assert (= (and b!72670 (not res!59999)) b!72669))

(assert (= (and b!72669 (not res!59987)) b!72674))

(assert (= (and b!72674 (not res!59989)) b!72657))

(assert (= (and b!72657 (not res!59991)) b!72675))

(assert (= (and b!72675 (not res!59990)) b!72661))

(assert (= (and b!72661 (not res!59986)) b!72655))

(assert (= (and b!72655 (not res!59998)) b!72676))

(assert (= (and b!72676 (not res!59980)) b!72658))

(assert (= (and b!72658 (not res!59984)) b!72660))

(assert (= (and b!72660 (not res!59982)) b!72671))

(assert (= start!14082 b!72659))

(declare-fun m!116557 () Bool)

(assert (=> b!72668 m!116557))

(declare-fun m!116559 () Bool)

(assert (=> b!72668 m!116559))

(declare-fun m!116561 () Bool)

(assert (=> b!72668 m!116561))

(declare-fun m!116563 () Bool)

(assert (=> b!72668 m!116563))

(assert (=> b!72668 m!116557))

(declare-fun m!116565 () Bool)

(assert (=> b!72668 m!116565))

(declare-fun m!116567 () Bool)

(assert (=> b!72676 m!116567))

(declare-fun m!116569 () Bool)

(assert (=> b!72673 m!116569))

(declare-fun m!116571 () Bool)

(assert (=> b!72673 m!116571))

(declare-fun m!116573 () Bool)

(assert (=> b!72673 m!116573))

(declare-fun m!116575 () Bool)

(assert (=> start!14082 m!116575))

(declare-fun m!116577 () Bool)

(assert (=> start!14082 m!116577))

(declare-fun m!116579 () Bool)

(assert (=> b!72662 m!116579))

(declare-fun m!116581 () Bool)

(assert (=> b!72655 m!116581))

(declare-fun m!116583 () Bool)

(assert (=> b!72655 m!116583))

(assert (=> b!72655 m!116583))

(declare-fun m!116585 () Bool)

(assert (=> b!72655 m!116585))

(declare-fun m!116587 () Bool)

(assert (=> b!72665 m!116587))

(declare-fun m!116589 () Bool)

(assert (=> b!72669 m!116589))

(declare-fun m!116591 () Bool)

(assert (=> b!72669 m!116591))

(declare-fun m!116593 () Bool)

(assert (=> b!72669 m!116593))

(declare-fun m!116595 () Bool)

(assert (=> b!72669 m!116595))

(declare-fun m!116597 () Bool)

(assert (=> b!72669 m!116597))

(declare-fun m!116599 () Bool)

(assert (=> b!72669 m!116599))

(declare-fun m!116601 () Bool)

(assert (=> b!72669 m!116601))

(declare-fun m!116603 () Bool)

(assert (=> b!72669 m!116603))

(declare-fun m!116605 () Bool)

(assert (=> b!72675 m!116605))

(declare-fun m!116607 () Bool)

(assert (=> b!72675 m!116607))

(declare-fun m!116609 () Bool)

(assert (=> b!72667 m!116609))

(assert (=> b!72667 m!116609))

(declare-fun m!116611 () Bool)

(assert (=> b!72667 m!116611))

(declare-fun m!116613 () Bool)

(assert (=> b!72667 m!116613))

(assert (=> b!72667 m!116613))

(declare-fun m!116615 () Bool)

(assert (=> b!72667 m!116615))

(declare-fun m!116617 () Bool)

(assert (=> b!72661 m!116617))

(declare-fun m!116619 () Bool)

(assert (=> b!72657 m!116619))

(declare-fun m!116621 () Bool)

(assert (=> b!72657 m!116621))

(declare-fun m!116623 () Bool)

(assert (=> b!72658 m!116623))

(declare-fun m!116625 () Bool)

(assert (=> b!72658 m!116625))

(declare-fun m!116627 () Bool)

(assert (=> b!72670 m!116627))

(declare-fun m!116629 () Bool)

(assert (=> b!72674 m!116629))

(declare-fun m!116631 () Bool)

(assert (=> b!72656 m!116631))

(declare-fun m!116633 () Bool)

(assert (=> b!72663 m!116633))

(declare-fun m!116635 () Bool)

(assert (=> b!72663 m!116635))

(declare-fun m!116637 () Bool)

(assert (=> b!72663 m!116637))

(declare-fun m!116639 () Bool)

(assert (=> b!72663 m!116639))

(declare-fun m!116641 () Bool)

(assert (=> b!72663 m!116641))

(declare-fun m!116643 () Bool)

(assert (=> b!72663 m!116643))

(declare-fun m!116645 () Bool)

(assert (=> b!72663 m!116645))

(declare-fun m!116647 () Bool)

(assert (=> b!72666 m!116647))

(declare-fun m!116649 () Bool)

(assert (=> b!72659 m!116649))

(declare-fun m!116651 () Bool)

(assert (=> b!72660 m!116651))

(declare-fun m!116653 () Bool)

(assert (=> b!72664 m!116653))

(push 1)

(assert (not b!72665))

(assert (not b!72664))

(assert (not b!72676))

(assert (not b!72658))

(assert (not b!72662))

(assert (not b!72670))

(assert (not b!72663))

(assert (not b!72655))

(assert (not b!72660))

(assert (not b!72667))

(assert (not b!72675))

(assert (not b!72669))

(assert (not b!72673))

(assert (not b!72661))

(assert (not b!72666))

(assert (not b!72657))

(assert (not b!72668))

(assert (not b!72674))

(assert (not b!72656))

(assert (not b!72659))

(assert (not start!14082))

(check-sat)

(pop 1)

(push 1)

(check-sat)

