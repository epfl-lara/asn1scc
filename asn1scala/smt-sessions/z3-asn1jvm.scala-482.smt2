; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14114 () Bool)

(assert start!14114)

(declare-fun b!73675 () Bool)

(declare-fun e!48167 () Bool)

(declare-fun e!48165 () Bool)

(assert (=> b!73675 (= e!48167 e!48165)))

(declare-fun res!60953 () Bool)

(assert (=> b!73675 (=> res!60953 e!48165)))

(declare-datatypes ((array!2997 0))(
  ( (array!2998 (arr!1992 (Array (_ BitVec 32) (_ BitVec 8))) (size!1401 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2382 0))(
  ( (BitStream!2383 (buf!1782 array!2997) (currentByte!3508 (_ BitVec 32)) (currentBit!3503 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4855 0))(
  ( (Unit!4856) )
))
(declare-datatypes ((tuple2!6378 0))(
  ( (tuple2!6379 (_1!3303 Unit!4855) (_2!3303 BitStream!2382)) )
))
(declare-fun lt!118391 () tuple2!6378)

(declare-fun lt!118384 () tuple2!6378)

(assert (=> b!73675 (= res!60953 (not (= (size!1401 (buf!1782 (_2!3303 lt!118391))) (size!1401 (buf!1782 (_2!3303 lt!118384))))))))

(declare-fun lt!118386 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!118368 () (_ BitVec 64))

(assert (=> b!73675 (= lt!118386 (bvsub (bvsub (bvadd lt!118368 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!73675 (= lt!118368 (bitIndex!0 (size!1401 (buf!1782 (_2!3303 lt!118391))) (currentByte!3508 (_2!3303 lt!118391)) (currentBit!3503 (_2!3303 lt!118391))))))

(declare-fun thiss!1379 () BitStream!2382)

(assert (=> b!73675 (= (size!1401 (buf!1782 (_2!3303 lt!118384))) (size!1401 (buf!1782 thiss!1379)))))

(declare-fun b!73676 () Bool)

(declare-fun res!60952 () Bool)

(declare-fun e!48163 () Bool)

(assert (=> b!73676 (=> res!60952 e!48163)))

(declare-datatypes ((List!766 0))(
  ( (Nil!763) (Cons!762 (h!881 Bool) (t!1516 List!766)) )
))
(declare-fun lt!118392 () List!766)

(declare-fun length!394 (List!766) Int)

(assert (=> b!73676 (= res!60952 (<= (length!394 lt!118392) 0))))

(declare-fun b!73677 () Bool)

(declare-fun res!60958 () Bool)

(declare-fun e!48175 () Bool)

(assert (=> b!73677 (=> (not res!60958) (not e!48175))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!73677 (= res!60958 (validate_offset_bits!1 ((_ sign_extend 32) (size!1401 (buf!1782 thiss!1379))) ((_ sign_extend 32) (currentByte!3508 thiss!1379)) ((_ sign_extend 32) (currentBit!3503 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!73678 () Bool)

(declare-fun e!48161 () Bool)

(declare-fun array_inv!1250 (array!2997) Bool)

(assert (=> b!73678 (= e!48161 (array_inv!1250 (buf!1782 thiss!1379)))))

(declare-fun b!73679 () Bool)

(declare-fun e!48170 () Bool)

(assert (=> b!73679 (= e!48175 (not e!48170))))

(declare-fun res!60961 () Bool)

(assert (=> b!73679 (=> res!60961 e!48170)))

(assert (=> b!73679 (= res!60961 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2382 BitStream!2382) Bool)

(assert (=> b!73679 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!118369 () Unit!4855)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2382) Unit!4855)

(assert (=> b!73679 (= lt!118369 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!118387 () (_ BitVec 64))

(assert (=> b!73679 (= lt!118387 (bitIndex!0 (size!1401 (buf!1782 thiss!1379)) (currentByte!3508 thiss!1379) (currentBit!3503 thiss!1379)))))

(declare-fun b!73680 () Bool)

(declare-fun res!60954 () Bool)

(assert (=> b!73680 (=> res!60954 e!48165)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!73680 (= res!60954 (not (invariant!0 (currentBit!3503 (_2!3303 lt!118391)) (currentByte!3508 (_2!3303 lt!118391)) (size!1401 (buf!1782 (_2!3303 lt!118391))))))))

(declare-fun b!73681 () Bool)

(declare-fun e!48171 () Bool)

(declare-fun e!48172 () Bool)

(assert (=> b!73681 (= e!48171 e!48172)))

(declare-fun res!60962 () Bool)

(assert (=> b!73681 (=> res!60962 e!48172)))

(assert (=> b!73681 (= res!60962 (not (isPrefixOf!0 (_2!3303 lt!118391) (_2!3303 lt!118384))))))

(assert (=> b!73681 (isPrefixOf!0 thiss!1379 (_2!3303 lt!118384))))

(declare-fun lt!118383 () Unit!4855)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2382 BitStream!2382 BitStream!2382) Unit!4855)

(assert (=> b!73681 (= lt!118383 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3303 lt!118391) (_2!3303 lt!118384)))))

(declare-fun srcBuffer!2 () array!2997)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2382 array!2997 (_ BitVec 64) (_ BitVec 64)) tuple2!6378)

(assert (=> b!73681 (= lt!118384 (appendBitsMSBFirstLoop!0 (_2!3303 lt!118391) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!48160 () Bool)

(assert (=> b!73681 e!48160))

(declare-fun res!60970 () Bool)

(assert (=> b!73681 (=> (not res!60970) (not e!48160))))

(assert (=> b!73681 (= res!60970 (validate_offset_bits!1 ((_ sign_extend 32) (size!1401 (buf!1782 (_2!3303 lt!118391)))) ((_ sign_extend 32) (currentByte!3508 thiss!1379)) ((_ sign_extend 32) (currentBit!3503 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!118371 () Unit!4855)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2382 array!2997 (_ BitVec 64)) Unit!4855)

(assert (=> b!73681 (= lt!118371 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1782 (_2!3303 lt!118391)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!6380 0))(
  ( (tuple2!6381 (_1!3304 BitStream!2382) (_2!3304 BitStream!2382)) )
))
(declare-fun lt!118372 () tuple2!6380)

(declare-fun reader!0 (BitStream!2382 BitStream!2382) tuple2!6380)

(assert (=> b!73681 (= lt!118372 (reader!0 thiss!1379 (_2!3303 lt!118391)))))

(declare-fun b!73682 () Bool)

(declare-fun head!585 (List!766) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2382 array!2997 (_ BitVec 64) (_ BitVec 64)) List!766)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2382 BitStream!2382 (_ BitVec 64)) List!766)

(assert (=> b!73682 (= e!48160 (= (head!585 (byteArrayBitContentToList!0 (_2!3303 lt!118391) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!585 (bitStreamReadBitsIntoList!0 (_2!3303 lt!118391) (_1!3304 lt!118372) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!118379 () Bool)

(declare-fun b!73683 () Bool)

(declare-fun e!48169 () Bool)

(declare-fun lt!118393 () Bool)

(declare-fun lt!118375 () List!766)

(assert (=> b!73683 (= e!48169 (or (not (= lt!118379 lt!118393)) (= lt!118392 lt!118375)))))

(declare-fun res!60972 () Bool)

(assert (=> start!14114 (=> (not res!60972) (not e!48175))))

(assert (=> start!14114 (= res!60972 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1401 srcBuffer!2))))))))

(assert (=> start!14114 e!48175))

(assert (=> start!14114 true))

(assert (=> start!14114 (array_inv!1250 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2382) Bool)

(assert (=> start!14114 (and (inv!12 thiss!1379) e!48161)))

(declare-fun b!73684 () Bool)

(declare-fun res!60960 () Bool)

(assert (=> b!73684 (=> res!60960 e!48167)))

(assert (=> b!73684 (= res!60960 (not (= (size!1401 (buf!1782 thiss!1379)) (size!1401 (buf!1782 (_2!3303 lt!118384))))))))

(declare-fun b!73685 () Bool)

(assert (=> b!73685 (= e!48172 e!48167)))

(declare-fun res!60968 () Bool)

(assert (=> b!73685 (=> res!60968 e!48167)))

(assert (=> b!73685 (= res!60968 (not (= lt!118386 (bvsub (bvadd lt!118387 to!314) i!635))))))

(assert (=> b!73685 (= lt!118386 (bitIndex!0 (size!1401 (buf!1782 (_2!3303 lt!118384))) (currentByte!3508 (_2!3303 lt!118384)) (currentBit!3503 (_2!3303 lt!118384))))))

(declare-fun b!73686 () Bool)

(declare-fun e!48164 () Bool)

(assert (=> b!73686 (= e!48163 e!48164)))

(declare-fun res!60963 () Bool)

(assert (=> b!73686 (=> res!60963 e!48164)))

(declare-fun lt!118385 () List!766)

(declare-fun lt!118373 () List!766)

(assert (=> b!73686 (= res!60963 (not (= lt!118385 lt!118373)))))

(assert (=> b!73686 (= lt!118373 lt!118385)))

(declare-fun tail!370 (List!766) List!766)

(assert (=> b!73686 (= lt!118385 (tail!370 lt!118392))))

(declare-fun lt!118370 () Unit!4855)

(declare-fun lt!118381 () tuple2!6380)

(declare-fun lt!118390 () tuple2!6380)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2382 BitStream!2382 BitStream!2382 BitStream!2382 (_ BitVec 64) List!766) Unit!4855)

(assert (=> b!73686 (= lt!118370 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3303 lt!118384) (_2!3303 lt!118384) (_1!3304 lt!118390) (_1!3304 lt!118381) (bvsub to!314 i!635) lt!118392))))

(declare-fun b!73687 () Bool)

(assert (=> b!73687 (= e!48165 e!48163)))

(declare-fun res!60959 () Bool)

(assert (=> b!73687 (=> res!60959 e!48163)))

(assert (=> b!73687 (= res!60959 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!118388 () (_ BitVec 64))

(assert (=> b!73687 (= lt!118373 (bitStreamReadBitsIntoList!0 (_2!3303 lt!118384) (_1!3304 lt!118381) lt!118388))))

(assert (=> b!73687 (= lt!118392 (bitStreamReadBitsIntoList!0 (_2!3303 lt!118384) (_1!3304 lt!118390) (bvsub to!314 i!635)))))

(assert (=> b!73687 (= lt!118375 (byteArrayBitContentToList!0 (_2!3303 lt!118384) srcBuffer!2 i!635 (bvsub to!314 i!635)))))

(assert (=> b!73687 (validate_offset_bits!1 ((_ sign_extend 32) (size!1401 (buf!1782 (_2!3303 lt!118384)))) ((_ sign_extend 32) (currentByte!3508 (_2!3303 lt!118391))) ((_ sign_extend 32) (currentBit!3503 (_2!3303 lt!118391))) lt!118388)))

(declare-fun lt!118380 () Unit!4855)

(assert (=> b!73687 (= lt!118380 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3303 lt!118391) (buf!1782 (_2!3303 lt!118384)) lt!118388))))

(assert (=> b!73687 (= lt!118381 (reader!0 (_2!3303 lt!118391) (_2!3303 lt!118384)))))

(assert (=> b!73687 (validate_offset_bits!1 ((_ sign_extend 32) (size!1401 (buf!1782 (_2!3303 lt!118384)))) ((_ sign_extend 32) (currentByte!3508 thiss!1379)) ((_ sign_extend 32) (currentBit!3503 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!118376 () Unit!4855)

(assert (=> b!73687 (= lt!118376 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1782 (_2!3303 lt!118384)) (bvsub to!314 i!635)))))

(assert (=> b!73687 (= lt!118390 (reader!0 thiss!1379 (_2!3303 lt!118384)))))

(declare-fun b!73688 () Bool)

(declare-fun e!48162 () Bool)

(declare-fun e!48168 () Bool)

(assert (=> b!73688 (= e!48162 e!48168)))

(declare-fun res!60971 () Bool)

(assert (=> b!73688 (=> res!60971 e!48168)))

(declare-fun lt!118378 () Bool)

(declare-fun lt!118389 () Bool)

(assert (=> b!73688 (= res!60971 (not (= lt!118378 lt!118389)))))

(declare-fun bitAt!0 (array!2997 (_ BitVec 64)) Bool)

(assert (=> b!73688 (= lt!118378 (bitAt!0 (buf!1782 (_2!3303 lt!118391)) lt!118387))))

(declare-fun b!73689 () Bool)

(assert (=> b!73689 (= e!48168 e!48169)))

(declare-fun res!60967 () Bool)

(assert (=> b!73689 (=> res!60967 e!48169)))

(declare-fun lt!118377 () Bool)

(assert (=> b!73689 (= res!60967 (not (= lt!118377 lt!118389)))))

(assert (=> b!73689 (= lt!118378 lt!118377)))

(assert (=> b!73689 (= lt!118377 (bitAt!0 (buf!1782 (_2!3303 lt!118384)) lt!118387))))

(declare-fun lt!118374 () Unit!4855)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2997 array!2997 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4855)

(assert (=> b!73689 (= lt!118374 (arrayBitRangesEqImpliesEq!0 (buf!1782 (_2!3303 lt!118391)) (buf!1782 (_2!3303 lt!118384)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!118387 lt!118368))))

(declare-fun b!73690 () Bool)

(declare-fun e!48176 () Bool)

(assert (=> b!73690 (= e!48164 e!48176)))

(declare-fun res!60969 () Bool)

(assert (=> b!73690 (=> res!60969 e!48176)))

(declare-fun lt!118367 () Bool)

(assert (=> b!73690 (= res!60969 (not (= lt!118367 (bitAt!0 (buf!1782 (_1!3304 lt!118381)) lt!118387))))))

(assert (=> b!73690 (= lt!118367 (bitAt!0 (buf!1782 (_1!3304 lt!118390)) lt!118387))))

(declare-fun b!73691 () Bool)

(declare-fun e!48174 () Bool)

(assert (=> b!73691 (= e!48176 e!48174)))

(declare-fun res!60966 () Bool)

(assert (=> b!73691 (=> res!60966 e!48174)))

(assert (=> b!73691 (= res!60966 (not (= lt!118379 lt!118367)))))

(assert (=> b!73691 (= lt!118379 (head!585 lt!118392))))

(declare-fun b!73692 () Bool)

(declare-fun res!60957 () Bool)

(assert (=> b!73692 (=> res!60957 e!48167)))

(assert (=> b!73692 (= res!60957 (not (invariant!0 (currentBit!3503 (_2!3303 lt!118384)) (currentByte!3508 (_2!3303 lt!118384)) (size!1401 (buf!1782 (_2!3303 lt!118384))))))))

(declare-fun b!73693 () Bool)

(declare-fun res!60965 () Bool)

(assert (=> b!73693 (=> res!60965 e!48169)))

(declare-datatypes ((tuple2!6382 0))(
  ( (tuple2!6383 (_1!3305 BitStream!2382) (_2!3305 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!2382) tuple2!6382)

(assert (=> b!73693 (= res!60965 (not (= (_2!3305 (readBitPure!0 (_1!3304 lt!118390))) lt!118389)))))

(declare-fun b!73694 () Bool)

(assert (=> b!73694 (= e!48170 e!48171)))

(declare-fun res!60955 () Bool)

(assert (=> b!73694 (=> res!60955 e!48171)))

(assert (=> b!73694 (= res!60955 (not (isPrefixOf!0 thiss!1379 (_2!3303 lt!118391))))))

(assert (=> b!73694 (validate_offset_bits!1 ((_ sign_extend 32) (size!1401 (buf!1782 (_2!3303 lt!118391)))) ((_ sign_extend 32) (currentByte!3508 (_2!3303 lt!118391))) ((_ sign_extend 32) (currentBit!3503 (_2!3303 lt!118391))) lt!118388)))

(assert (=> b!73694 (= lt!118388 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!118382 () Unit!4855)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2382 BitStream!2382 (_ BitVec 64) (_ BitVec 64)) Unit!4855)

(assert (=> b!73694 (= lt!118382 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3303 lt!118391) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2382 (_ BitVec 8) (_ BitVec 32)) tuple2!6378)

(assert (=> b!73694 (= lt!118391 (appendBitFromByte!0 thiss!1379 (select (arr!1992 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!73695 () Bool)

(declare-fun res!60964 () Bool)

(assert (=> b!73695 (=> res!60964 e!48165)))

(assert (=> b!73695 (= res!60964 (not (invariant!0 (currentBit!3503 (_2!3303 lt!118391)) (currentByte!3508 (_2!3303 lt!118391)) (size!1401 (buf!1782 (_2!3303 lt!118384))))))))

(declare-fun b!73696 () Bool)

(assert (=> b!73696 (= e!48174 e!48162)))

(declare-fun res!60956 () Bool)

(assert (=> b!73696 (=> res!60956 e!48162)))

(assert (=> b!73696 (= res!60956 (not (= lt!118393 lt!118389)))))

(assert (=> b!73696 (= lt!118389 (bitAt!0 srcBuffer!2 i!635))))

(assert (=> b!73696 (= lt!118393 (head!585 lt!118375))))

(assert (= (and start!14114 res!60972) b!73677))

(assert (= (and b!73677 res!60958) b!73679))

(assert (= (and b!73679 (not res!60961)) b!73694))

(assert (= (and b!73694 (not res!60955)) b!73681))

(assert (= (and b!73681 res!60970) b!73682))

(assert (= (and b!73681 (not res!60962)) b!73685))

(assert (= (and b!73685 (not res!60968)) b!73692))

(assert (= (and b!73692 (not res!60957)) b!73684))

(assert (= (and b!73684 (not res!60960)) b!73675))

(assert (= (and b!73675 (not res!60953)) b!73680))

(assert (= (and b!73680 (not res!60954)) b!73695))

(assert (= (and b!73695 (not res!60964)) b!73687))

(assert (= (and b!73687 (not res!60959)) b!73676))

(assert (= (and b!73676 (not res!60952)) b!73686))

(assert (= (and b!73686 (not res!60963)) b!73690))

(assert (= (and b!73690 (not res!60969)) b!73691))

(assert (= (and b!73691 (not res!60966)) b!73696))

(assert (= (and b!73696 (not res!60956)) b!73688))

(assert (= (and b!73688 (not res!60971)) b!73689))

(assert (= (and b!73689 (not res!60967)) b!73693))

(assert (= (and b!73693 (not res!60965)) b!73683))

(assert (= start!14114 b!73678))

(declare-fun m!118125 () Bool)

(assert (=> b!73675 m!118125))

(declare-fun m!118127 () Bool)

(assert (=> b!73687 m!118127))

(declare-fun m!118129 () Bool)

(assert (=> b!73687 m!118129))

(declare-fun m!118131 () Bool)

(assert (=> b!73687 m!118131))

(declare-fun m!118133 () Bool)

(assert (=> b!73687 m!118133))

(declare-fun m!118135 () Bool)

(assert (=> b!73687 m!118135))

(declare-fun m!118137 () Bool)

(assert (=> b!73687 m!118137))

(declare-fun m!118139 () Bool)

(assert (=> b!73687 m!118139))

(declare-fun m!118141 () Bool)

(assert (=> b!73687 m!118141))

(declare-fun m!118143 () Bool)

(assert (=> b!73687 m!118143))

(declare-fun m!118145 () Bool)

(assert (=> b!73685 m!118145))

(declare-fun m!118147 () Bool)

(assert (=> b!73692 m!118147))

(declare-fun m!118149 () Bool)

(assert (=> b!73689 m!118149))

(declare-fun m!118151 () Bool)

(assert (=> b!73689 m!118151))

(declare-fun m!118153 () Bool)

(assert (=> b!73688 m!118153))

(declare-fun m!118155 () Bool)

(assert (=> start!14114 m!118155))

(declare-fun m!118157 () Bool)

(assert (=> start!14114 m!118157))

(declare-fun m!118159 () Bool)

(assert (=> b!73694 m!118159))

(declare-fun m!118161 () Bool)

(assert (=> b!73694 m!118161))

(declare-fun m!118163 () Bool)

(assert (=> b!73694 m!118163))

(declare-fun m!118165 () Bool)

(assert (=> b!73694 m!118165))

(declare-fun m!118167 () Bool)

(assert (=> b!73694 m!118167))

(assert (=> b!73694 m!118161))

(declare-fun m!118169 () Bool)

(assert (=> b!73676 m!118169))

(declare-fun m!118171 () Bool)

(assert (=> b!73696 m!118171))

(declare-fun m!118173 () Bool)

(assert (=> b!73696 m!118173))

(declare-fun m!118175 () Bool)

(assert (=> b!73678 m!118175))

(declare-fun m!118177 () Bool)

(assert (=> b!73677 m!118177))

(declare-fun m!118179 () Bool)

(assert (=> b!73680 m!118179))

(declare-fun m!118181 () Bool)

(assert (=> b!73693 m!118181))

(declare-fun m!118183 () Bool)

(assert (=> b!73681 m!118183))

(declare-fun m!118185 () Bool)

(assert (=> b!73681 m!118185))

(declare-fun m!118187 () Bool)

(assert (=> b!73681 m!118187))

(declare-fun m!118189 () Bool)

(assert (=> b!73681 m!118189))

(declare-fun m!118191 () Bool)

(assert (=> b!73681 m!118191))

(declare-fun m!118193 () Bool)

(assert (=> b!73681 m!118193))

(declare-fun m!118195 () Bool)

(assert (=> b!73681 m!118195))

(declare-fun m!118197 () Bool)

(assert (=> b!73690 m!118197))

(declare-fun m!118199 () Bool)

(assert (=> b!73690 m!118199))

(declare-fun m!118201 () Bool)

(assert (=> b!73695 m!118201))

(declare-fun m!118203 () Bool)

(assert (=> b!73691 m!118203))

(declare-fun m!118205 () Bool)

(assert (=> b!73686 m!118205))

(declare-fun m!118207 () Bool)

(assert (=> b!73686 m!118207))

(declare-fun m!118209 () Bool)

(assert (=> b!73679 m!118209))

(declare-fun m!118211 () Bool)

(assert (=> b!73679 m!118211))

(declare-fun m!118213 () Bool)

(assert (=> b!73679 m!118213))

(declare-fun m!118215 () Bool)

(assert (=> b!73682 m!118215))

(assert (=> b!73682 m!118215))

(declare-fun m!118217 () Bool)

(assert (=> b!73682 m!118217))

(declare-fun m!118219 () Bool)

(assert (=> b!73682 m!118219))

(assert (=> b!73682 m!118219))

(declare-fun m!118221 () Bool)

(assert (=> b!73682 m!118221))

(check-sat (not b!73691) (not b!73685) (not b!73695) (not b!73682) (not b!73679) (not b!73693) (not b!73681) (not b!73689) (not b!73692) (not b!73678) (not b!73675) (not b!73676) (not start!14114) (not b!73688) (not b!73687) (not b!73686) (not b!73694) (not b!73690) (not b!73677) (not b!73696) (not b!73680))
(check-sat)
(get-model)

(declare-fun d!23266 () Bool)

(declare-fun size!1403 (List!766) Int)

(assert (=> d!23266 (= (length!394 lt!118392) (size!1403 lt!118392))))

(declare-fun bs!5592 () Bool)

(assert (= bs!5592 d!23266))

(declare-fun m!118321 () Bool)

(assert (=> bs!5592 m!118321))

(assert (=> b!73676 d!23266))

(declare-fun b!73773 () Bool)

(declare-fun e!48232 () Unit!4855)

(declare-fun lt!118528 () Unit!4855)

(assert (=> b!73773 (= e!48232 lt!118528)))

(declare-fun lt!118521 () (_ BitVec 64))

(assert (=> b!73773 (= lt!118521 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118523 () (_ BitVec 64))

(assert (=> b!73773 (= lt!118523 (bitIndex!0 (size!1401 (buf!1782 (_2!3303 lt!118391))) (currentByte!3508 (_2!3303 lt!118391)) (currentBit!3503 (_2!3303 lt!118391))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2997 array!2997 (_ BitVec 64) (_ BitVec 64)) Unit!4855)

(assert (=> b!73773 (= lt!118528 (arrayBitRangesEqSymmetric!0 (buf!1782 (_2!3303 lt!118391)) (buf!1782 (_2!3303 lt!118384)) lt!118521 lt!118523))))

(declare-fun arrayBitRangesEq!0 (array!2997 array!2997 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!73773 (arrayBitRangesEq!0 (buf!1782 (_2!3303 lt!118384)) (buf!1782 (_2!3303 lt!118391)) lt!118521 lt!118523)))

(declare-fun e!48233 () Bool)

(declare-fun lt!118517 () (_ BitVec 64))

(declare-fun lt!118526 () (_ BitVec 64))

(declare-fun lt!118527 () tuple2!6380)

(declare-fun b!73774 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!2382 (_ BitVec 64)) BitStream!2382)

(assert (=> b!73774 (= e!48233 (= (_1!3304 lt!118527) (withMovedBitIndex!0 (_2!3304 lt!118527) (bvsub lt!118517 lt!118526))))))

(assert (=> b!73774 (or (= (bvand lt!118517 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!118526 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!118517 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!118517 lt!118526) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!73774 (= lt!118526 (bitIndex!0 (size!1401 (buf!1782 (_2!3303 lt!118384))) (currentByte!3508 (_2!3303 lt!118384)) (currentBit!3503 (_2!3303 lt!118384))))))

(assert (=> b!73774 (= lt!118517 (bitIndex!0 (size!1401 (buf!1782 (_2!3303 lt!118391))) (currentByte!3508 (_2!3303 lt!118391)) (currentBit!3503 (_2!3303 lt!118391))))))

(declare-fun b!73775 () Bool)

(declare-fun res!61043 () Bool)

(assert (=> b!73775 (=> (not res!61043) (not e!48233))))

(assert (=> b!73775 (= res!61043 (isPrefixOf!0 (_1!3304 lt!118527) (_2!3303 lt!118391)))))

(declare-fun b!73776 () Bool)

(declare-fun Unit!4860 () Unit!4855)

(assert (=> b!73776 (= e!48232 Unit!4860)))

(declare-fun d!23268 () Bool)

(assert (=> d!23268 e!48233))

(declare-fun res!61044 () Bool)

(assert (=> d!23268 (=> (not res!61044) (not e!48233))))

(assert (=> d!23268 (= res!61044 (isPrefixOf!0 (_1!3304 lt!118527) (_2!3304 lt!118527)))))

(declare-fun lt!118530 () BitStream!2382)

(assert (=> d!23268 (= lt!118527 (tuple2!6381 lt!118530 (_2!3303 lt!118384)))))

(declare-fun lt!118533 () Unit!4855)

(declare-fun lt!118522 () Unit!4855)

(assert (=> d!23268 (= lt!118533 lt!118522)))

(assert (=> d!23268 (isPrefixOf!0 lt!118530 (_2!3303 lt!118384))))

(assert (=> d!23268 (= lt!118522 (lemmaIsPrefixTransitive!0 lt!118530 (_2!3303 lt!118384) (_2!3303 lt!118384)))))

(declare-fun lt!118524 () Unit!4855)

(declare-fun lt!118529 () Unit!4855)

(assert (=> d!23268 (= lt!118524 lt!118529)))

(assert (=> d!23268 (isPrefixOf!0 lt!118530 (_2!3303 lt!118384))))

(assert (=> d!23268 (= lt!118529 (lemmaIsPrefixTransitive!0 lt!118530 (_2!3303 lt!118391) (_2!3303 lt!118384)))))

(declare-fun lt!118518 () Unit!4855)

(assert (=> d!23268 (= lt!118518 e!48232)))

(declare-fun c!5400 () Bool)

(assert (=> d!23268 (= c!5400 (not (= (size!1401 (buf!1782 (_2!3303 lt!118391))) #b00000000000000000000000000000000)))))

(declare-fun lt!118519 () Unit!4855)

(declare-fun lt!118531 () Unit!4855)

(assert (=> d!23268 (= lt!118519 lt!118531)))

(assert (=> d!23268 (isPrefixOf!0 (_2!3303 lt!118384) (_2!3303 lt!118384))))

(assert (=> d!23268 (= lt!118531 (lemmaIsPrefixRefl!0 (_2!3303 lt!118384)))))

(declare-fun lt!118534 () Unit!4855)

(declare-fun lt!118516 () Unit!4855)

(assert (=> d!23268 (= lt!118534 lt!118516)))

(assert (=> d!23268 (= lt!118516 (lemmaIsPrefixRefl!0 (_2!3303 lt!118384)))))

(declare-fun lt!118532 () Unit!4855)

(declare-fun lt!118525 () Unit!4855)

(assert (=> d!23268 (= lt!118532 lt!118525)))

(assert (=> d!23268 (isPrefixOf!0 lt!118530 lt!118530)))

(assert (=> d!23268 (= lt!118525 (lemmaIsPrefixRefl!0 lt!118530))))

(declare-fun lt!118520 () Unit!4855)

(declare-fun lt!118515 () Unit!4855)

(assert (=> d!23268 (= lt!118520 lt!118515)))

(assert (=> d!23268 (isPrefixOf!0 (_2!3303 lt!118391) (_2!3303 lt!118391))))

(assert (=> d!23268 (= lt!118515 (lemmaIsPrefixRefl!0 (_2!3303 lt!118391)))))

(assert (=> d!23268 (= lt!118530 (BitStream!2383 (buf!1782 (_2!3303 lt!118384)) (currentByte!3508 (_2!3303 lt!118391)) (currentBit!3503 (_2!3303 lt!118391))))))

(assert (=> d!23268 (isPrefixOf!0 (_2!3303 lt!118391) (_2!3303 lt!118384))))

(assert (=> d!23268 (= (reader!0 (_2!3303 lt!118391) (_2!3303 lt!118384)) lt!118527)))

(declare-fun b!73777 () Bool)

(declare-fun res!61042 () Bool)

(assert (=> b!73777 (=> (not res!61042) (not e!48233))))

(assert (=> b!73777 (= res!61042 (isPrefixOf!0 (_2!3304 lt!118527) (_2!3303 lt!118384)))))

(assert (= (and d!23268 c!5400) b!73773))

(assert (= (and d!23268 (not c!5400)) b!73776))

(assert (= (and d!23268 res!61044) b!73775))

(assert (= (and b!73775 res!61043) b!73777))

(assert (= (and b!73777 res!61042) b!73774))

(declare-fun m!118323 () Bool)

(assert (=> b!73774 m!118323))

(assert (=> b!73774 m!118145))

(assert (=> b!73774 m!118125))

(assert (=> b!73773 m!118125))

(declare-fun m!118325 () Bool)

(assert (=> b!73773 m!118325))

(declare-fun m!118327 () Bool)

(assert (=> b!73773 m!118327))

(declare-fun m!118329 () Bool)

(assert (=> b!73777 m!118329))

(declare-fun m!118331 () Bool)

(assert (=> d!23268 m!118331))

(declare-fun m!118333 () Bool)

(assert (=> d!23268 m!118333))

(declare-fun m!118335 () Bool)

(assert (=> d!23268 m!118335))

(declare-fun m!118337 () Bool)

(assert (=> d!23268 m!118337))

(declare-fun m!118339 () Bool)

(assert (=> d!23268 m!118339))

(declare-fun m!118341 () Bool)

(assert (=> d!23268 m!118341))

(declare-fun m!118343 () Bool)

(assert (=> d!23268 m!118343))

(assert (=> d!23268 m!118183))

(declare-fun m!118345 () Bool)

(assert (=> d!23268 m!118345))

(declare-fun m!118347 () Bool)

(assert (=> d!23268 m!118347))

(declare-fun m!118349 () Bool)

(assert (=> d!23268 m!118349))

(declare-fun m!118351 () Bool)

(assert (=> b!73775 m!118351))

(assert (=> b!73687 d!23268))

(declare-fun b!73778 () Bool)

(declare-fun e!48234 () Unit!4855)

(declare-fun lt!118548 () Unit!4855)

(assert (=> b!73778 (= e!48234 lt!118548)))

(declare-fun lt!118541 () (_ BitVec 64))

(assert (=> b!73778 (= lt!118541 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118543 () (_ BitVec 64))

(assert (=> b!73778 (= lt!118543 (bitIndex!0 (size!1401 (buf!1782 thiss!1379)) (currentByte!3508 thiss!1379) (currentBit!3503 thiss!1379)))))

(assert (=> b!73778 (= lt!118548 (arrayBitRangesEqSymmetric!0 (buf!1782 thiss!1379) (buf!1782 (_2!3303 lt!118384)) lt!118541 lt!118543))))

(assert (=> b!73778 (arrayBitRangesEq!0 (buf!1782 (_2!3303 lt!118384)) (buf!1782 thiss!1379) lt!118541 lt!118543)))

(declare-fun lt!118537 () (_ BitVec 64))

(declare-fun lt!118546 () (_ BitVec 64))

(declare-fun e!48235 () Bool)

(declare-fun lt!118547 () tuple2!6380)

(declare-fun b!73779 () Bool)

(assert (=> b!73779 (= e!48235 (= (_1!3304 lt!118547) (withMovedBitIndex!0 (_2!3304 lt!118547) (bvsub lt!118537 lt!118546))))))

(assert (=> b!73779 (or (= (bvand lt!118537 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!118546 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!118537 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!118537 lt!118546) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!73779 (= lt!118546 (bitIndex!0 (size!1401 (buf!1782 (_2!3303 lt!118384))) (currentByte!3508 (_2!3303 lt!118384)) (currentBit!3503 (_2!3303 lt!118384))))))

(assert (=> b!73779 (= lt!118537 (bitIndex!0 (size!1401 (buf!1782 thiss!1379)) (currentByte!3508 thiss!1379) (currentBit!3503 thiss!1379)))))

(declare-fun b!73780 () Bool)

(declare-fun res!61046 () Bool)

(assert (=> b!73780 (=> (not res!61046) (not e!48235))))

(assert (=> b!73780 (= res!61046 (isPrefixOf!0 (_1!3304 lt!118547) thiss!1379))))

(declare-fun b!73781 () Bool)

(declare-fun Unit!4862 () Unit!4855)

(assert (=> b!73781 (= e!48234 Unit!4862)))

(declare-fun d!23270 () Bool)

(assert (=> d!23270 e!48235))

(declare-fun res!61047 () Bool)

(assert (=> d!23270 (=> (not res!61047) (not e!48235))))

(assert (=> d!23270 (= res!61047 (isPrefixOf!0 (_1!3304 lt!118547) (_2!3304 lt!118547)))))

(declare-fun lt!118550 () BitStream!2382)

(assert (=> d!23270 (= lt!118547 (tuple2!6381 lt!118550 (_2!3303 lt!118384)))))

(declare-fun lt!118553 () Unit!4855)

(declare-fun lt!118542 () Unit!4855)

(assert (=> d!23270 (= lt!118553 lt!118542)))

(assert (=> d!23270 (isPrefixOf!0 lt!118550 (_2!3303 lt!118384))))

(assert (=> d!23270 (= lt!118542 (lemmaIsPrefixTransitive!0 lt!118550 (_2!3303 lt!118384) (_2!3303 lt!118384)))))

(declare-fun lt!118544 () Unit!4855)

(declare-fun lt!118549 () Unit!4855)

(assert (=> d!23270 (= lt!118544 lt!118549)))

(assert (=> d!23270 (isPrefixOf!0 lt!118550 (_2!3303 lt!118384))))

(assert (=> d!23270 (= lt!118549 (lemmaIsPrefixTransitive!0 lt!118550 thiss!1379 (_2!3303 lt!118384)))))

(declare-fun lt!118538 () Unit!4855)

(assert (=> d!23270 (= lt!118538 e!48234)))

(declare-fun c!5401 () Bool)

(assert (=> d!23270 (= c!5401 (not (= (size!1401 (buf!1782 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!118539 () Unit!4855)

(declare-fun lt!118551 () Unit!4855)

(assert (=> d!23270 (= lt!118539 lt!118551)))

(assert (=> d!23270 (isPrefixOf!0 (_2!3303 lt!118384) (_2!3303 lt!118384))))

(assert (=> d!23270 (= lt!118551 (lemmaIsPrefixRefl!0 (_2!3303 lt!118384)))))

(declare-fun lt!118554 () Unit!4855)

(declare-fun lt!118536 () Unit!4855)

(assert (=> d!23270 (= lt!118554 lt!118536)))

(assert (=> d!23270 (= lt!118536 (lemmaIsPrefixRefl!0 (_2!3303 lt!118384)))))

(declare-fun lt!118552 () Unit!4855)

(declare-fun lt!118545 () Unit!4855)

(assert (=> d!23270 (= lt!118552 lt!118545)))

(assert (=> d!23270 (isPrefixOf!0 lt!118550 lt!118550)))

(assert (=> d!23270 (= lt!118545 (lemmaIsPrefixRefl!0 lt!118550))))

(declare-fun lt!118540 () Unit!4855)

(declare-fun lt!118535 () Unit!4855)

(assert (=> d!23270 (= lt!118540 lt!118535)))

(assert (=> d!23270 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23270 (= lt!118535 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!23270 (= lt!118550 (BitStream!2383 (buf!1782 (_2!3303 lt!118384)) (currentByte!3508 thiss!1379) (currentBit!3503 thiss!1379)))))

(assert (=> d!23270 (isPrefixOf!0 thiss!1379 (_2!3303 lt!118384))))

(assert (=> d!23270 (= (reader!0 thiss!1379 (_2!3303 lt!118384)) lt!118547)))

(declare-fun b!73782 () Bool)

(declare-fun res!61045 () Bool)

(assert (=> b!73782 (=> (not res!61045) (not e!48235))))

(assert (=> b!73782 (= res!61045 (isPrefixOf!0 (_2!3304 lt!118547) (_2!3303 lt!118384)))))

(assert (= (and d!23270 c!5401) b!73778))

(assert (= (and d!23270 (not c!5401)) b!73781))

(assert (= (and d!23270 res!61047) b!73780))

(assert (= (and b!73780 res!61046) b!73782))

(assert (= (and b!73782 res!61045) b!73779))

(declare-fun m!118353 () Bool)

(assert (=> b!73779 m!118353))

(assert (=> b!73779 m!118145))

(assert (=> b!73779 m!118213))

(assert (=> b!73778 m!118213))

(declare-fun m!118355 () Bool)

(assert (=> b!73778 m!118355))

(declare-fun m!118357 () Bool)

(assert (=> b!73778 m!118357))

(declare-fun m!118359 () Bool)

(assert (=> b!73782 m!118359))

(assert (=> d!23270 m!118331))

(assert (=> d!23270 m!118211))

(declare-fun m!118361 () Bool)

(assert (=> d!23270 m!118361))

(declare-fun m!118363 () Bool)

(assert (=> d!23270 m!118363))

(declare-fun m!118365 () Bool)

(assert (=> d!23270 m!118365))

(assert (=> d!23270 m!118341))

(assert (=> d!23270 m!118209))

(assert (=> d!23270 m!118193))

(declare-fun m!118367 () Bool)

(assert (=> d!23270 m!118367))

(declare-fun m!118369 () Bool)

(assert (=> d!23270 m!118369))

(declare-fun m!118371 () Bool)

(assert (=> d!23270 m!118371))

(declare-fun m!118373 () Bool)

(assert (=> b!73780 m!118373))

(assert (=> b!73687 d!23270))

(declare-fun d!23272 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!23272 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1401 (buf!1782 (_2!3303 lt!118384)))) ((_ sign_extend 32) (currentByte!3508 (_2!3303 lt!118391))) ((_ sign_extend 32) (currentBit!3503 (_2!3303 lt!118391))) lt!118388) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1401 (buf!1782 (_2!3303 lt!118384)))) ((_ sign_extend 32) (currentByte!3508 (_2!3303 lt!118391))) ((_ sign_extend 32) (currentBit!3503 (_2!3303 lt!118391)))) lt!118388))))

(declare-fun bs!5593 () Bool)

(assert (= bs!5593 d!23272))

(declare-fun m!118375 () Bool)

(assert (=> bs!5593 m!118375))

(assert (=> b!73687 d!23272))

(declare-fun b!73794 () Bool)

(declare-fun e!48241 () Bool)

(declare-fun lt!118561 () List!766)

(assert (=> b!73794 (= e!48241 (> (length!394 lt!118561) 0))))

(declare-fun b!73791 () Bool)

(declare-datatypes ((tuple2!6394 0))(
  ( (tuple2!6395 (_1!3311 List!766) (_2!3311 BitStream!2382)) )
))
(declare-fun e!48240 () tuple2!6394)

(assert (=> b!73791 (= e!48240 (tuple2!6395 Nil!763 (_1!3304 lt!118381)))))

(declare-fun b!73793 () Bool)

(declare-fun isEmpty!235 (List!766) Bool)

(assert (=> b!73793 (= e!48241 (isEmpty!235 lt!118561))))

(declare-datatypes ((tuple2!6396 0))(
  ( (tuple2!6397 (_1!3312 Bool) (_2!3312 BitStream!2382)) )
))
(declare-fun lt!118562 () tuple2!6396)

(declare-fun b!73792 () Bool)

(declare-fun lt!118563 () (_ BitVec 64))

(assert (=> b!73792 (= e!48240 (tuple2!6395 (Cons!762 (_1!3312 lt!118562) (bitStreamReadBitsIntoList!0 (_2!3303 lt!118384) (_2!3312 lt!118562) (bvsub lt!118388 lt!118563))) (_2!3312 lt!118562)))))

(declare-fun readBit!0 (BitStream!2382) tuple2!6396)

(assert (=> b!73792 (= lt!118562 (readBit!0 (_1!3304 lt!118381)))))

(assert (=> b!73792 (= lt!118563 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!23274 () Bool)

(assert (=> d!23274 e!48241))

(declare-fun c!5407 () Bool)

(assert (=> d!23274 (= c!5407 (= lt!118388 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23274 (= lt!118561 (_1!3311 e!48240))))

(declare-fun c!5406 () Bool)

(assert (=> d!23274 (= c!5406 (= lt!118388 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23274 (bvsge lt!118388 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!23274 (= (bitStreamReadBitsIntoList!0 (_2!3303 lt!118384) (_1!3304 lt!118381) lt!118388) lt!118561)))

(assert (= (and d!23274 c!5406) b!73791))

(assert (= (and d!23274 (not c!5406)) b!73792))

(assert (= (and d!23274 c!5407) b!73793))

(assert (= (and d!23274 (not c!5407)) b!73794))

(declare-fun m!118377 () Bool)

(assert (=> b!73794 m!118377))

(declare-fun m!118379 () Bool)

(assert (=> b!73793 m!118379))

(declare-fun m!118381 () Bool)

(assert (=> b!73792 m!118381))

(declare-fun m!118383 () Bool)

(assert (=> b!73792 m!118383))

(assert (=> b!73687 d!23274))

(declare-fun d!23276 () Bool)

(declare-fun c!5410 () Bool)

(assert (=> d!23276 (= c!5410 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!48244 () List!766)

(assert (=> d!23276 (= (byteArrayBitContentToList!0 (_2!3303 lt!118384) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!48244)))

(declare-fun b!73799 () Bool)

(assert (=> b!73799 (= e!48244 Nil!763)))

(declare-fun b!73800 () Bool)

(assert (=> b!73800 (= e!48244 (Cons!762 (not (= (bvand ((_ sign_extend 24) (select (arr!1992 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3303 lt!118384) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!23276 c!5410) b!73799))

(assert (= (and d!23276 (not c!5410)) b!73800))

(assert (=> b!73800 m!118161))

(declare-fun m!118385 () Bool)

(assert (=> b!73800 m!118385))

(declare-fun m!118387 () Bool)

(assert (=> b!73800 m!118387))

(assert (=> b!73687 d!23276))

(declare-fun d!23278 () Bool)

(assert (=> d!23278 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1401 (buf!1782 (_2!3303 lt!118384)))) ((_ sign_extend 32) (currentByte!3508 thiss!1379)) ((_ sign_extend 32) (currentBit!3503 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1401 (buf!1782 (_2!3303 lt!118384)))) ((_ sign_extend 32) (currentByte!3508 thiss!1379)) ((_ sign_extend 32) (currentBit!3503 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5594 () Bool)

(assert (= bs!5594 d!23278))

(declare-fun m!118389 () Bool)

(assert (=> bs!5594 m!118389))

(assert (=> b!73687 d!23278))

(declare-fun d!23280 () Bool)

(assert (=> d!23280 (validate_offset_bits!1 ((_ sign_extend 32) (size!1401 (buf!1782 (_2!3303 lt!118384)))) ((_ sign_extend 32) (currentByte!3508 thiss!1379)) ((_ sign_extend 32) (currentBit!3503 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!118566 () Unit!4855)

(declare-fun choose!9 (BitStream!2382 array!2997 (_ BitVec 64) BitStream!2382) Unit!4855)

(assert (=> d!23280 (= lt!118566 (choose!9 thiss!1379 (buf!1782 (_2!3303 lt!118384)) (bvsub to!314 i!635) (BitStream!2383 (buf!1782 (_2!3303 lt!118384)) (currentByte!3508 thiss!1379) (currentBit!3503 thiss!1379))))))

(assert (=> d!23280 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1782 (_2!3303 lt!118384)) (bvsub to!314 i!635)) lt!118566)))

(declare-fun bs!5595 () Bool)

(assert (= bs!5595 d!23280))

(assert (=> bs!5595 m!118141))

(declare-fun m!118391 () Bool)

(assert (=> bs!5595 m!118391))

(assert (=> b!73687 d!23280))

(declare-fun b!73804 () Bool)

(declare-fun e!48246 () Bool)

(declare-fun lt!118567 () List!766)

(assert (=> b!73804 (= e!48246 (> (length!394 lt!118567) 0))))

(declare-fun b!73801 () Bool)

(declare-fun e!48245 () tuple2!6394)

(assert (=> b!73801 (= e!48245 (tuple2!6395 Nil!763 (_1!3304 lt!118390)))))

(declare-fun b!73803 () Bool)

(assert (=> b!73803 (= e!48246 (isEmpty!235 lt!118567))))

(declare-fun lt!118568 () tuple2!6396)

(declare-fun b!73802 () Bool)

(declare-fun lt!118569 () (_ BitVec 64))

(assert (=> b!73802 (= e!48245 (tuple2!6395 (Cons!762 (_1!3312 lt!118568) (bitStreamReadBitsIntoList!0 (_2!3303 lt!118384) (_2!3312 lt!118568) (bvsub (bvsub to!314 i!635) lt!118569))) (_2!3312 lt!118568)))))

(assert (=> b!73802 (= lt!118568 (readBit!0 (_1!3304 lt!118390)))))

(assert (=> b!73802 (= lt!118569 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!23282 () Bool)

(assert (=> d!23282 e!48246))

(declare-fun c!5412 () Bool)

(assert (=> d!23282 (= c!5412 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23282 (= lt!118567 (_1!3311 e!48245))))

(declare-fun c!5411 () Bool)

(assert (=> d!23282 (= c!5411 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23282 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!23282 (= (bitStreamReadBitsIntoList!0 (_2!3303 lt!118384) (_1!3304 lt!118390) (bvsub to!314 i!635)) lt!118567)))

(assert (= (and d!23282 c!5411) b!73801))

(assert (= (and d!23282 (not c!5411)) b!73802))

(assert (= (and d!23282 c!5412) b!73803))

(assert (= (and d!23282 (not c!5412)) b!73804))

(declare-fun m!118393 () Bool)

(assert (=> b!73804 m!118393))

(declare-fun m!118395 () Bool)

(assert (=> b!73803 m!118395))

(declare-fun m!118397 () Bool)

(assert (=> b!73802 m!118397))

(declare-fun m!118399 () Bool)

(assert (=> b!73802 m!118399))

(assert (=> b!73687 d!23282))

(declare-fun d!23284 () Bool)

(assert (=> d!23284 (validate_offset_bits!1 ((_ sign_extend 32) (size!1401 (buf!1782 (_2!3303 lt!118384)))) ((_ sign_extend 32) (currentByte!3508 (_2!3303 lt!118391))) ((_ sign_extend 32) (currentBit!3503 (_2!3303 lt!118391))) lt!118388)))

(declare-fun lt!118570 () Unit!4855)

(assert (=> d!23284 (= lt!118570 (choose!9 (_2!3303 lt!118391) (buf!1782 (_2!3303 lt!118384)) lt!118388 (BitStream!2383 (buf!1782 (_2!3303 lt!118384)) (currentByte!3508 (_2!3303 lt!118391)) (currentBit!3503 (_2!3303 lt!118391)))))))

(assert (=> d!23284 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3303 lt!118391) (buf!1782 (_2!3303 lt!118384)) lt!118388) lt!118570)))

(declare-fun bs!5596 () Bool)

(assert (= bs!5596 d!23284))

(assert (=> bs!5596 m!118137))

(declare-fun m!118401 () Bool)

(assert (=> bs!5596 m!118401))

(assert (=> b!73687 d!23284))

(declare-fun d!23286 () Bool)

(declare-fun e!48249 () Bool)

(assert (=> d!23286 e!48249))

(declare-fun res!61052 () Bool)

(assert (=> d!23286 (=> (not res!61052) (not e!48249))))

(declare-fun lt!118586 () (_ BitVec 64))

(declare-fun lt!118588 () (_ BitVec 64))

(declare-fun lt!118584 () (_ BitVec 64))

(assert (=> d!23286 (= res!61052 (= lt!118586 (bvsub lt!118588 lt!118584)))))

(assert (=> d!23286 (or (= (bvand lt!118588 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!118584 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!118588 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!118588 lt!118584) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23286 (= lt!118584 (remainingBits!0 ((_ sign_extend 32) (size!1401 (buf!1782 (_2!3303 lt!118384)))) ((_ sign_extend 32) (currentByte!3508 (_2!3303 lt!118384))) ((_ sign_extend 32) (currentBit!3503 (_2!3303 lt!118384)))))))

(declare-fun lt!118583 () (_ BitVec 64))

(declare-fun lt!118585 () (_ BitVec 64))

(assert (=> d!23286 (= lt!118588 (bvmul lt!118583 lt!118585))))

(assert (=> d!23286 (or (= lt!118583 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!118585 (bvsdiv (bvmul lt!118583 lt!118585) lt!118583)))))

(assert (=> d!23286 (= lt!118585 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!23286 (= lt!118583 ((_ sign_extend 32) (size!1401 (buf!1782 (_2!3303 lt!118384)))))))

(assert (=> d!23286 (= lt!118586 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3508 (_2!3303 lt!118384))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3503 (_2!3303 lt!118384)))))))

(assert (=> d!23286 (invariant!0 (currentBit!3503 (_2!3303 lt!118384)) (currentByte!3508 (_2!3303 lt!118384)) (size!1401 (buf!1782 (_2!3303 lt!118384))))))

(assert (=> d!23286 (= (bitIndex!0 (size!1401 (buf!1782 (_2!3303 lt!118384))) (currentByte!3508 (_2!3303 lt!118384)) (currentBit!3503 (_2!3303 lt!118384))) lt!118586)))

(declare-fun b!73809 () Bool)

(declare-fun res!61053 () Bool)

(assert (=> b!73809 (=> (not res!61053) (not e!48249))))

(assert (=> b!73809 (= res!61053 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!118586))))

(declare-fun b!73810 () Bool)

(declare-fun lt!118587 () (_ BitVec 64))

(assert (=> b!73810 (= e!48249 (bvsle lt!118586 (bvmul lt!118587 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!73810 (or (= lt!118587 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!118587 #b0000000000000000000000000000000000000000000000000000000000001000) lt!118587)))))

(assert (=> b!73810 (= lt!118587 ((_ sign_extend 32) (size!1401 (buf!1782 (_2!3303 lt!118384)))))))

(assert (= (and d!23286 res!61052) b!73809))

(assert (= (and b!73809 res!61053) b!73810))

(declare-fun m!118403 () Bool)

(assert (=> d!23286 m!118403))

(assert (=> d!23286 m!118147))

(assert (=> b!73685 d!23286))

(declare-fun d!23288 () Bool)

(assert (=> d!23288 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1992 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5597 () Bool)

(assert (= bs!5597 d!23288))

(assert (=> bs!5597 m!118161))

(assert (=> bs!5597 m!118385))

(assert (=> b!73696 d!23288))

(declare-fun d!23290 () Bool)

(assert (=> d!23290 (= (head!585 lt!118375) (h!881 lt!118375))))

(assert (=> b!73696 d!23290))

(declare-fun d!23292 () Bool)

(declare-fun e!48250 () Bool)

(assert (=> d!23292 e!48250))

(declare-fun res!61054 () Bool)

(assert (=> d!23292 (=> (not res!61054) (not e!48250))))

(declare-fun lt!118592 () (_ BitVec 64))

(declare-fun lt!118590 () (_ BitVec 64))

(declare-fun lt!118594 () (_ BitVec 64))

(assert (=> d!23292 (= res!61054 (= lt!118592 (bvsub lt!118594 lt!118590)))))

(assert (=> d!23292 (or (= (bvand lt!118594 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!118590 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!118594 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!118594 lt!118590) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23292 (= lt!118590 (remainingBits!0 ((_ sign_extend 32) (size!1401 (buf!1782 (_2!3303 lt!118391)))) ((_ sign_extend 32) (currentByte!3508 (_2!3303 lt!118391))) ((_ sign_extend 32) (currentBit!3503 (_2!3303 lt!118391)))))))

(declare-fun lt!118589 () (_ BitVec 64))

(declare-fun lt!118591 () (_ BitVec 64))

(assert (=> d!23292 (= lt!118594 (bvmul lt!118589 lt!118591))))

(assert (=> d!23292 (or (= lt!118589 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!118591 (bvsdiv (bvmul lt!118589 lt!118591) lt!118589)))))

(assert (=> d!23292 (= lt!118591 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!23292 (= lt!118589 ((_ sign_extend 32) (size!1401 (buf!1782 (_2!3303 lt!118391)))))))

(assert (=> d!23292 (= lt!118592 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3508 (_2!3303 lt!118391))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3503 (_2!3303 lt!118391)))))))

(assert (=> d!23292 (invariant!0 (currentBit!3503 (_2!3303 lt!118391)) (currentByte!3508 (_2!3303 lt!118391)) (size!1401 (buf!1782 (_2!3303 lt!118391))))))

(assert (=> d!23292 (= (bitIndex!0 (size!1401 (buf!1782 (_2!3303 lt!118391))) (currentByte!3508 (_2!3303 lt!118391)) (currentBit!3503 (_2!3303 lt!118391))) lt!118592)))

(declare-fun b!73811 () Bool)

(declare-fun res!61055 () Bool)

(assert (=> b!73811 (=> (not res!61055) (not e!48250))))

(assert (=> b!73811 (= res!61055 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!118592))))

(declare-fun b!73812 () Bool)

(declare-fun lt!118593 () (_ BitVec 64))

(assert (=> b!73812 (= e!48250 (bvsle lt!118592 (bvmul lt!118593 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!73812 (or (= lt!118593 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!118593 #b0000000000000000000000000000000000000000000000000000000000001000) lt!118593)))))

(assert (=> b!73812 (= lt!118593 ((_ sign_extend 32) (size!1401 (buf!1782 (_2!3303 lt!118391)))))))

(assert (= (and d!23292 res!61054) b!73811))

(assert (= (and b!73811 res!61055) b!73812))

(declare-fun m!118405 () Bool)

(assert (=> d!23292 m!118405))

(assert (=> d!23292 m!118179))

(assert (=> b!73675 d!23292))

(declare-fun d!23294 () Bool)

(assert (=> d!23294 (= (tail!370 lt!118392) (t!1516 lt!118392))))

(assert (=> b!73686 d!23294))

(declare-fun d!23296 () Bool)

(declare-fun e!48253 () Bool)

(assert (=> d!23296 e!48253))

(declare-fun res!61058 () Bool)

(assert (=> d!23296 (=> (not res!61058) (not e!48253))))

(declare-fun lt!118600 () (_ BitVec 64))

(assert (=> d!23296 (= res!61058 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!118600 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!118600) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!23296 (= lt!118600 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!118599 () Unit!4855)

(declare-fun choose!42 (BitStream!2382 BitStream!2382 BitStream!2382 BitStream!2382 (_ BitVec 64) List!766) Unit!4855)

(assert (=> d!23296 (= lt!118599 (choose!42 (_2!3303 lt!118384) (_2!3303 lt!118384) (_1!3304 lt!118390) (_1!3304 lt!118381) (bvsub to!314 i!635) lt!118392))))

(assert (=> d!23296 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!23296 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3303 lt!118384) (_2!3303 lt!118384) (_1!3304 lt!118390) (_1!3304 lt!118381) (bvsub to!314 i!635) lt!118392) lt!118599)))

(declare-fun b!73815 () Bool)

(assert (=> b!73815 (= e!48253 (= (bitStreamReadBitsIntoList!0 (_2!3303 lt!118384) (_1!3304 lt!118381) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!370 lt!118392)))))

(assert (= (and d!23296 res!61058) b!73815))

(declare-fun m!118407 () Bool)

(assert (=> d!23296 m!118407))

(declare-fun m!118409 () Bool)

(assert (=> b!73815 m!118409))

(assert (=> b!73815 m!118205))

(assert (=> b!73686 d!23296))

(declare-fun d!23298 () Bool)

(assert (=> d!23298 (= (invariant!0 (currentBit!3503 (_2!3303 lt!118391)) (currentByte!3508 (_2!3303 lt!118391)) (size!1401 (buf!1782 (_2!3303 lt!118384)))) (and (bvsge (currentBit!3503 (_2!3303 lt!118391)) #b00000000000000000000000000000000) (bvslt (currentBit!3503 (_2!3303 lt!118391)) #b00000000000000000000000000001000) (bvsge (currentByte!3508 (_2!3303 lt!118391)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3508 (_2!3303 lt!118391)) (size!1401 (buf!1782 (_2!3303 lt!118384)))) (and (= (currentBit!3503 (_2!3303 lt!118391)) #b00000000000000000000000000000000) (= (currentByte!3508 (_2!3303 lt!118391)) (size!1401 (buf!1782 (_2!3303 lt!118384))))))))))

(assert (=> b!73695 d!23298))

(declare-fun d!23300 () Bool)

(declare-fun lt!118603 () tuple2!6396)

(assert (=> d!23300 (= lt!118603 (readBit!0 (_1!3304 lt!118390)))))

(assert (=> d!23300 (= (readBitPure!0 (_1!3304 lt!118390)) (tuple2!6383 (_2!3312 lt!118603) (_1!3312 lt!118603)))))

(declare-fun bs!5598 () Bool)

(assert (= bs!5598 d!23300))

(assert (=> bs!5598 m!118399))

(assert (=> b!73693 d!23300))

(declare-fun d!23302 () Bool)

(declare-fun res!61065 () Bool)

(declare-fun e!48258 () Bool)

(assert (=> d!23302 (=> (not res!61065) (not e!48258))))

(assert (=> d!23302 (= res!61065 (= (size!1401 (buf!1782 thiss!1379)) (size!1401 (buf!1782 (_2!3303 lt!118391)))))))

(assert (=> d!23302 (= (isPrefixOf!0 thiss!1379 (_2!3303 lt!118391)) e!48258)))

(declare-fun b!73822 () Bool)

(declare-fun res!61066 () Bool)

(assert (=> b!73822 (=> (not res!61066) (not e!48258))))

(assert (=> b!73822 (= res!61066 (bvsle (bitIndex!0 (size!1401 (buf!1782 thiss!1379)) (currentByte!3508 thiss!1379) (currentBit!3503 thiss!1379)) (bitIndex!0 (size!1401 (buf!1782 (_2!3303 lt!118391))) (currentByte!3508 (_2!3303 lt!118391)) (currentBit!3503 (_2!3303 lt!118391)))))))

(declare-fun b!73823 () Bool)

(declare-fun e!48259 () Bool)

(assert (=> b!73823 (= e!48258 e!48259)))

(declare-fun res!61067 () Bool)

(assert (=> b!73823 (=> res!61067 e!48259)))

(assert (=> b!73823 (= res!61067 (= (size!1401 (buf!1782 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!73824 () Bool)

(assert (=> b!73824 (= e!48259 (arrayBitRangesEq!0 (buf!1782 thiss!1379) (buf!1782 (_2!3303 lt!118391)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1401 (buf!1782 thiss!1379)) (currentByte!3508 thiss!1379) (currentBit!3503 thiss!1379))))))

(assert (= (and d!23302 res!61065) b!73822))

(assert (= (and b!73822 res!61066) b!73823))

(assert (= (and b!73823 (not res!61067)) b!73824))

(assert (=> b!73822 m!118213))

(assert (=> b!73822 m!118125))

(assert (=> b!73824 m!118213))

(assert (=> b!73824 m!118213))

(declare-fun m!118411 () Bool)

(assert (=> b!73824 m!118411))

(assert (=> b!73694 d!23302))

(declare-fun d!23304 () Bool)

(assert (=> d!23304 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1401 (buf!1782 (_2!3303 lt!118391)))) ((_ sign_extend 32) (currentByte!3508 (_2!3303 lt!118391))) ((_ sign_extend 32) (currentBit!3503 (_2!3303 lt!118391))) lt!118388) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1401 (buf!1782 (_2!3303 lt!118391)))) ((_ sign_extend 32) (currentByte!3508 (_2!3303 lt!118391))) ((_ sign_extend 32) (currentBit!3503 (_2!3303 lt!118391)))) lt!118388))))

(declare-fun bs!5599 () Bool)

(assert (= bs!5599 d!23304))

(assert (=> bs!5599 m!118405))

(assert (=> b!73694 d!23304))

(declare-fun d!23306 () Bool)

(declare-fun e!48262 () Bool)

(assert (=> d!23306 e!48262))

(declare-fun res!61070 () Bool)

(assert (=> d!23306 (=> (not res!61070) (not e!48262))))

(assert (=> d!23306 (= res!61070 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!118606 () Unit!4855)

(declare-fun choose!27 (BitStream!2382 BitStream!2382 (_ BitVec 64) (_ BitVec 64)) Unit!4855)

(assert (=> d!23306 (= lt!118606 (choose!27 thiss!1379 (_2!3303 lt!118391) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!23306 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!23306 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3303 lt!118391) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!118606)))

(declare-fun b!73827 () Bool)

(assert (=> b!73827 (= e!48262 (validate_offset_bits!1 ((_ sign_extend 32) (size!1401 (buf!1782 (_2!3303 lt!118391)))) ((_ sign_extend 32) (currentByte!3508 (_2!3303 lt!118391))) ((_ sign_extend 32) (currentBit!3503 (_2!3303 lt!118391))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!23306 res!61070) b!73827))

(declare-fun m!118413 () Bool)

(assert (=> d!23306 m!118413))

(declare-fun m!118415 () Bool)

(assert (=> b!73827 m!118415))

(assert (=> b!73694 d!23306))

(declare-fun b!73937 () Bool)

(declare-fun res!61140 () Bool)

(declare-fun e!48318 () Bool)

(assert (=> b!73937 (=> (not res!61140) (not e!48318))))

(declare-fun lt!118826 () tuple2!6378)

(assert (=> b!73937 (= res!61140 (= (bitIndex!0 (size!1401 (buf!1782 (_2!3303 lt!118826))) (currentByte!3508 (_2!3303 lt!118826)) (currentBit!3503 (_2!3303 lt!118826))) (bvadd (bitIndex!0 (size!1401 (buf!1782 thiss!1379)) (currentByte!3508 thiss!1379) (currentBit!3503 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!73938 () Bool)

(declare-fun e!48320 () Bool)

(declare-fun lt!118830 () tuple2!6382)

(assert (=> b!73938 (= e!48320 (= (bitIndex!0 (size!1401 (buf!1782 (_1!3305 lt!118830))) (currentByte!3508 (_1!3305 lt!118830)) (currentBit!3503 (_1!3305 lt!118830))) (bitIndex!0 (size!1401 (buf!1782 (_2!3303 lt!118826))) (currentByte!3508 (_2!3303 lt!118826)) (currentBit!3503 (_2!3303 lt!118826)))))))

(declare-fun d!23312 () Bool)

(declare-fun e!48319 () Bool)

(assert (=> d!23312 e!48319))

(declare-fun res!61139 () Bool)

(assert (=> d!23312 (=> (not res!61139) (not e!48319))))

(declare-fun lt!118829 () tuple2!6378)

(assert (=> d!23312 (= res!61139 (= (size!1401 (buf!1782 (_2!3303 lt!118829))) (size!1401 (buf!1782 thiss!1379))))))

(declare-fun lt!118828 () (_ BitVec 8))

(declare-fun lt!118827 () array!2997)

(assert (=> d!23312 (= lt!118828 (select (arr!1992 lt!118827) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!23312 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1401 lt!118827)))))

(assert (=> d!23312 (= lt!118827 (array!2998 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!118832 () tuple2!6378)

(assert (=> d!23312 (= lt!118829 (tuple2!6379 (_1!3303 lt!118832) (_2!3303 lt!118832)))))

(assert (=> d!23312 (= lt!118832 lt!118826)))

(assert (=> d!23312 e!48318))

(declare-fun res!61137 () Bool)

(assert (=> d!23312 (=> (not res!61137) (not e!48318))))

(assert (=> d!23312 (= res!61137 (= (size!1401 (buf!1782 thiss!1379)) (size!1401 (buf!1782 (_2!3303 lt!118826)))))))

(declare-fun lt!118836 () Bool)

(declare-fun appendBit!0 (BitStream!2382 Bool) tuple2!6378)

(assert (=> d!23312 (= lt!118826 (appendBit!0 thiss!1379 lt!118836))))

(assert (=> d!23312 (= lt!118836 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1992 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!23312 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!23312 (= (appendBitFromByte!0 thiss!1379 (select (arr!1992 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!118829)))

(declare-fun b!73939 () Bool)

(declare-fun e!48317 () Bool)

(assert (=> b!73939 (= e!48319 e!48317)))

(declare-fun res!61138 () Bool)

(assert (=> b!73939 (=> (not res!61138) (not e!48317))))

(declare-fun lt!118835 () tuple2!6382)

(assert (=> b!73939 (= res!61138 (and (= (_2!3305 lt!118835) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1992 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!118828)) #b00000000000000000000000000000000))) (= (_1!3305 lt!118835) (_2!3303 lt!118829))))))

(declare-datatypes ((tuple2!6402 0))(
  ( (tuple2!6403 (_1!3315 array!2997) (_2!3315 BitStream!2382)) )
))
(declare-fun lt!118833 () tuple2!6402)

(declare-fun lt!118834 () BitStream!2382)

(declare-fun readBits!0 (BitStream!2382 (_ BitVec 64)) tuple2!6402)

(assert (=> b!73939 (= lt!118833 (readBits!0 lt!118834 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!73939 (= lt!118835 (readBitPure!0 lt!118834))))

(declare-fun readerFrom!0 (BitStream!2382 (_ BitVec 32) (_ BitVec 32)) BitStream!2382)

(assert (=> b!73939 (= lt!118834 (readerFrom!0 (_2!3303 lt!118829) (currentBit!3503 thiss!1379) (currentByte!3508 thiss!1379)))))

(declare-fun b!73940 () Bool)

(declare-fun res!61144 () Bool)

(assert (=> b!73940 (=> (not res!61144) (not e!48319))))

(assert (=> b!73940 (= res!61144 (isPrefixOf!0 thiss!1379 (_2!3303 lt!118829)))))

(declare-fun b!73941 () Bool)

(assert (=> b!73941 (= e!48318 e!48320)))

(declare-fun res!61141 () Bool)

(assert (=> b!73941 (=> (not res!61141) (not e!48320))))

(assert (=> b!73941 (= res!61141 (and (= (_2!3305 lt!118830) lt!118836) (= (_1!3305 lt!118830) (_2!3303 lt!118826))))))

(assert (=> b!73941 (= lt!118830 (readBitPure!0 (readerFrom!0 (_2!3303 lt!118826) (currentBit!3503 thiss!1379) (currentByte!3508 thiss!1379))))))

(declare-fun b!73942 () Bool)

(declare-fun res!61143 () Bool)

(assert (=> b!73942 (=> (not res!61143) (not e!48319))))

(declare-fun lt!118831 () (_ BitVec 64))

(declare-fun lt!118837 () (_ BitVec 64))

(assert (=> b!73942 (= res!61143 (= (bitIndex!0 (size!1401 (buf!1782 (_2!3303 lt!118829))) (currentByte!3508 (_2!3303 lt!118829)) (currentBit!3503 (_2!3303 lt!118829))) (bvadd lt!118831 lt!118837)))))

(assert (=> b!73942 (or (not (= (bvand lt!118831 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!118837 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!118831 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!118831 lt!118837) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!73942 (= lt!118837 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!73942 (= lt!118831 (bitIndex!0 (size!1401 (buf!1782 thiss!1379)) (currentByte!3508 thiss!1379) (currentBit!3503 thiss!1379)))))

(declare-fun b!73943 () Bool)

(assert (=> b!73943 (= e!48317 (= (bitIndex!0 (size!1401 (buf!1782 (_1!3305 lt!118835))) (currentByte!3508 (_1!3305 lt!118835)) (currentBit!3503 (_1!3305 lt!118835))) (bitIndex!0 (size!1401 (buf!1782 (_2!3303 lt!118829))) (currentByte!3508 (_2!3303 lt!118829)) (currentBit!3503 (_2!3303 lt!118829)))))))

(declare-fun b!73944 () Bool)

(declare-fun res!61142 () Bool)

(assert (=> b!73944 (=> (not res!61142) (not e!48318))))

(assert (=> b!73944 (= res!61142 (isPrefixOf!0 thiss!1379 (_2!3303 lt!118826)))))

(assert (= (and d!23312 res!61137) b!73937))

(assert (= (and b!73937 res!61140) b!73944))

(assert (= (and b!73944 res!61142) b!73941))

(assert (= (and b!73941 res!61141) b!73938))

(assert (= (and d!23312 res!61139) b!73942))

(assert (= (and b!73942 res!61143) b!73940))

(assert (= (and b!73940 res!61144) b!73939))

(assert (= (and b!73939 res!61138) b!73943))

(declare-fun m!118563 () Bool)

(assert (=> b!73937 m!118563))

(assert (=> b!73937 m!118213))

(declare-fun m!118565 () Bool)

(assert (=> b!73944 m!118565))

(declare-fun m!118567 () Bool)

(assert (=> b!73943 m!118567))

(declare-fun m!118569 () Bool)

(assert (=> b!73943 m!118569))

(declare-fun m!118571 () Bool)

(assert (=> b!73941 m!118571))

(assert (=> b!73941 m!118571))

(declare-fun m!118573 () Bool)

(assert (=> b!73941 m!118573))

(declare-fun m!118575 () Bool)

(assert (=> b!73938 m!118575))

(assert (=> b!73938 m!118563))

(declare-fun m!118577 () Bool)

(assert (=> d!23312 m!118577))

(declare-fun m!118579 () Bool)

(assert (=> d!23312 m!118579))

(assert (=> d!23312 m!118385))

(assert (=> b!73942 m!118569))

(assert (=> b!73942 m!118213))

(declare-fun m!118581 () Bool)

(assert (=> b!73940 m!118581))

(declare-fun m!118583 () Bool)

(assert (=> b!73939 m!118583))

(declare-fun m!118587 () Bool)

(assert (=> b!73939 m!118587))

(declare-fun m!118589 () Bool)

(assert (=> b!73939 m!118589))

(assert (=> b!73694 d!23312))

(declare-fun d!23392 () Bool)

(assert (=> d!23392 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1401 (buf!1782 (_2!3303 lt!118391)))) ((_ sign_extend 32) (currentByte!3508 thiss!1379)) ((_ sign_extend 32) (currentBit!3503 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1401 (buf!1782 (_2!3303 lt!118391)))) ((_ sign_extend 32) (currentByte!3508 thiss!1379)) ((_ sign_extend 32) (currentBit!3503 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!5618 () Bool)

(assert (= bs!5618 d!23392))

(declare-fun m!118591 () Bool)

(assert (=> bs!5618 m!118591))

(assert (=> b!73681 d!23392))

(declare-fun d!23394 () Bool)

(declare-fun res!61145 () Bool)

(declare-fun e!48321 () Bool)

(assert (=> d!23394 (=> (not res!61145) (not e!48321))))

(assert (=> d!23394 (= res!61145 (= (size!1401 (buf!1782 (_2!3303 lt!118391))) (size!1401 (buf!1782 (_2!3303 lt!118384)))))))

(assert (=> d!23394 (= (isPrefixOf!0 (_2!3303 lt!118391) (_2!3303 lt!118384)) e!48321)))

(declare-fun b!73945 () Bool)

(declare-fun res!61146 () Bool)

(assert (=> b!73945 (=> (not res!61146) (not e!48321))))

(assert (=> b!73945 (= res!61146 (bvsle (bitIndex!0 (size!1401 (buf!1782 (_2!3303 lt!118391))) (currentByte!3508 (_2!3303 lt!118391)) (currentBit!3503 (_2!3303 lt!118391))) (bitIndex!0 (size!1401 (buf!1782 (_2!3303 lt!118384))) (currentByte!3508 (_2!3303 lt!118384)) (currentBit!3503 (_2!3303 lt!118384)))))))

(declare-fun b!73946 () Bool)

(declare-fun e!48322 () Bool)

(assert (=> b!73946 (= e!48321 e!48322)))

(declare-fun res!61147 () Bool)

(assert (=> b!73946 (=> res!61147 e!48322)))

(assert (=> b!73946 (= res!61147 (= (size!1401 (buf!1782 (_2!3303 lt!118391))) #b00000000000000000000000000000000))))

(declare-fun b!73947 () Bool)

(assert (=> b!73947 (= e!48322 (arrayBitRangesEq!0 (buf!1782 (_2!3303 lt!118391)) (buf!1782 (_2!3303 lt!118384)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1401 (buf!1782 (_2!3303 lt!118391))) (currentByte!3508 (_2!3303 lt!118391)) (currentBit!3503 (_2!3303 lt!118391)))))))

(assert (= (and d!23394 res!61145) b!73945))

(assert (= (and b!73945 res!61146) b!73946))

(assert (= (and b!73946 (not res!61147)) b!73947))

(assert (=> b!73945 m!118125))

(assert (=> b!73945 m!118145))

(assert (=> b!73947 m!118125))

(assert (=> b!73947 m!118125))

(declare-fun m!118593 () Bool)

(assert (=> b!73947 m!118593))

(assert (=> b!73681 d!23394))

(declare-fun d!23396 () Bool)

(declare-fun res!61148 () Bool)

(declare-fun e!48323 () Bool)

(assert (=> d!23396 (=> (not res!61148) (not e!48323))))

(assert (=> d!23396 (= res!61148 (= (size!1401 (buf!1782 thiss!1379)) (size!1401 (buf!1782 (_2!3303 lt!118384)))))))

(assert (=> d!23396 (= (isPrefixOf!0 thiss!1379 (_2!3303 lt!118384)) e!48323)))

(declare-fun b!73948 () Bool)

(declare-fun res!61149 () Bool)

(assert (=> b!73948 (=> (not res!61149) (not e!48323))))

(assert (=> b!73948 (= res!61149 (bvsle (bitIndex!0 (size!1401 (buf!1782 thiss!1379)) (currentByte!3508 thiss!1379) (currentBit!3503 thiss!1379)) (bitIndex!0 (size!1401 (buf!1782 (_2!3303 lt!118384))) (currentByte!3508 (_2!3303 lt!118384)) (currentBit!3503 (_2!3303 lt!118384)))))))

(declare-fun b!73949 () Bool)

(declare-fun e!48324 () Bool)

(assert (=> b!73949 (= e!48323 e!48324)))

(declare-fun res!61150 () Bool)

(assert (=> b!73949 (=> res!61150 e!48324)))

(assert (=> b!73949 (= res!61150 (= (size!1401 (buf!1782 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!73950 () Bool)

(assert (=> b!73950 (= e!48324 (arrayBitRangesEq!0 (buf!1782 thiss!1379) (buf!1782 (_2!3303 lt!118384)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1401 (buf!1782 thiss!1379)) (currentByte!3508 thiss!1379) (currentBit!3503 thiss!1379))))))

(assert (= (and d!23396 res!61148) b!73948))

(assert (= (and b!73948 res!61149) b!73949))

(assert (= (and b!73949 (not res!61150)) b!73950))

(assert (=> b!73948 m!118213))

(assert (=> b!73948 m!118145))

(assert (=> b!73950 m!118213))

(assert (=> b!73950 m!118213))

(declare-fun m!118595 () Bool)

(assert (=> b!73950 m!118595))

(assert (=> b!73681 d!23396))

(declare-fun b!74122 () Bool)

(declare-fun res!61273 () Bool)

(declare-fun e!48410 () Bool)

(assert (=> b!74122 (=> (not res!61273) (not e!48410))))

(declare-fun lt!119378 () tuple2!6378)

(assert (=> b!74122 (= res!61273 (isPrefixOf!0 (_2!3303 lt!118391) (_2!3303 lt!119378)))))

(declare-fun b!74123 () Bool)

(declare-fun e!48411 () tuple2!6378)

(declare-fun lt!119382 () tuple2!6378)

(declare-fun Unit!4871 () Unit!4855)

(assert (=> b!74123 (= e!48411 (tuple2!6379 Unit!4871 (_2!3303 lt!119382)))))

(declare-fun lt!119385 () tuple2!6378)

(assert (=> b!74123 (= lt!119385 (appendBitFromByte!0 (_2!3303 lt!118391) (select (arr!1992 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!119411 () (_ BitVec 64))

(assert (=> b!74123 (= lt!119411 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!119392 () (_ BitVec 64))

(assert (=> b!74123 (= lt!119392 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!119383 () Unit!4855)

(assert (=> b!74123 (= lt!119383 (validateOffsetBitsIneqLemma!0 (_2!3303 lt!118391) (_2!3303 lt!119385) lt!119411 lt!119392))))

(assert (=> b!74123 (validate_offset_bits!1 ((_ sign_extend 32) (size!1401 (buf!1782 (_2!3303 lt!119385)))) ((_ sign_extend 32) (currentByte!3508 (_2!3303 lt!119385))) ((_ sign_extend 32) (currentBit!3503 (_2!3303 lt!119385))) (bvsub lt!119411 lt!119392))))

(declare-fun lt!119395 () Unit!4855)

(assert (=> b!74123 (= lt!119395 lt!119383)))

(declare-fun lt!119416 () tuple2!6380)

(declare-fun call!943 () tuple2!6380)

(assert (=> b!74123 (= lt!119416 call!943)))

(declare-fun lt!119413 () (_ BitVec 64))

(assert (=> b!74123 (= lt!119413 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!119381 () Unit!4855)

(assert (=> b!74123 (= lt!119381 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3303 lt!118391) (buf!1782 (_2!3303 lt!119385)) lt!119413))))

(assert (=> b!74123 (validate_offset_bits!1 ((_ sign_extend 32) (size!1401 (buf!1782 (_2!3303 lt!119385)))) ((_ sign_extend 32) (currentByte!3508 (_2!3303 lt!118391))) ((_ sign_extend 32) (currentBit!3503 (_2!3303 lt!118391))) lt!119413)))

(declare-fun lt!119401 () Unit!4855)

(assert (=> b!74123 (= lt!119401 lt!119381)))

(assert (=> b!74123 (= (head!585 (byteArrayBitContentToList!0 (_2!3303 lt!119385) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!585 (bitStreamReadBitsIntoList!0 (_2!3303 lt!119385) (_1!3304 lt!119416) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!119390 () Unit!4855)

(declare-fun Unit!4873 () Unit!4855)

(assert (=> b!74123 (= lt!119390 Unit!4873)))

(assert (=> b!74123 (= lt!119382 (appendBitsMSBFirstLoop!0 (_2!3303 lt!119385) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!119384 () Unit!4855)

(assert (=> b!74123 (= lt!119384 (lemmaIsPrefixTransitive!0 (_2!3303 lt!118391) (_2!3303 lt!119385) (_2!3303 lt!119382)))))

(assert (=> b!74123 (isPrefixOf!0 (_2!3303 lt!118391) (_2!3303 lt!119382))))

(declare-fun lt!119398 () Unit!4855)

(assert (=> b!74123 (= lt!119398 lt!119384)))

(assert (=> b!74123 (= (size!1401 (buf!1782 (_2!3303 lt!119382))) (size!1401 (buf!1782 (_2!3303 lt!118391))))))

(declare-fun lt!119391 () Unit!4855)

(declare-fun Unit!4874 () Unit!4855)

(assert (=> b!74123 (= lt!119391 Unit!4874)))

(assert (=> b!74123 (= (bitIndex!0 (size!1401 (buf!1782 (_2!3303 lt!119382))) (currentByte!3508 (_2!3303 lt!119382)) (currentBit!3503 (_2!3303 lt!119382))) (bvsub (bvadd (bitIndex!0 (size!1401 (buf!1782 (_2!3303 lt!118391))) (currentByte!3508 (_2!3303 lt!118391)) (currentBit!3503 (_2!3303 lt!118391))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!119403 () Unit!4855)

(declare-fun Unit!4875 () Unit!4855)

(assert (=> b!74123 (= lt!119403 Unit!4875)))

(assert (=> b!74123 (= (bitIndex!0 (size!1401 (buf!1782 (_2!3303 lt!119382))) (currentByte!3508 (_2!3303 lt!119382)) (currentBit!3503 (_2!3303 lt!119382))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1401 (buf!1782 (_2!3303 lt!119385))) (currentByte!3508 (_2!3303 lt!119385)) (currentBit!3503 (_2!3303 lt!119385))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!119373 () Unit!4855)

(declare-fun Unit!4877 () Unit!4855)

(assert (=> b!74123 (= lt!119373 Unit!4877)))

(declare-fun lt!119414 () tuple2!6380)

(assert (=> b!74123 (= lt!119414 (reader!0 (_2!3303 lt!118391) (_2!3303 lt!119382)))))

(declare-fun lt!119399 () (_ BitVec 64))

(assert (=> b!74123 (= lt!119399 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!119396 () Unit!4855)

(assert (=> b!74123 (= lt!119396 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3303 lt!118391) (buf!1782 (_2!3303 lt!119382)) lt!119399))))

(assert (=> b!74123 (validate_offset_bits!1 ((_ sign_extend 32) (size!1401 (buf!1782 (_2!3303 lt!119382)))) ((_ sign_extend 32) (currentByte!3508 (_2!3303 lt!118391))) ((_ sign_extend 32) (currentBit!3503 (_2!3303 lt!118391))) lt!119399)))

(declare-fun lt!119415 () Unit!4855)

(assert (=> b!74123 (= lt!119415 lt!119396)))

(declare-fun lt!119393 () tuple2!6380)

(assert (=> b!74123 (= lt!119393 (reader!0 (_2!3303 lt!119385) (_2!3303 lt!119382)))))

(declare-fun lt!119412 () (_ BitVec 64))

(assert (=> b!74123 (= lt!119412 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!119389 () Unit!4855)

(assert (=> b!74123 (= lt!119389 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3303 lt!119385) (buf!1782 (_2!3303 lt!119382)) lt!119412))))

(assert (=> b!74123 (validate_offset_bits!1 ((_ sign_extend 32) (size!1401 (buf!1782 (_2!3303 lt!119382)))) ((_ sign_extend 32) (currentByte!3508 (_2!3303 lt!119385))) ((_ sign_extend 32) (currentBit!3503 (_2!3303 lt!119385))) lt!119412)))

(declare-fun lt!119387 () Unit!4855)

(assert (=> b!74123 (= lt!119387 lt!119389)))

(declare-fun lt!119374 () List!766)

(assert (=> b!74123 (= lt!119374 (byteArrayBitContentToList!0 (_2!3303 lt!119382) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!119397 () List!766)

(assert (=> b!74123 (= lt!119397 (byteArrayBitContentToList!0 (_2!3303 lt!119382) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!119402 () List!766)

(assert (=> b!74123 (= lt!119402 (bitStreamReadBitsIntoList!0 (_2!3303 lt!119382) (_1!3304 lt!119414) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!119379 () List!766)

(assert (=> b!74123 (= lt!119379 (bitStreamReadBitsIntoList!0 (_2!3303 lt!119382) (_1!3304 lt!119393) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!119400 () (_ BitVec 64))

(assert (=> b!74123 (= lt!119400 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!119388 () Unit!4855)

(assert (=> b!74123 (= lt!119388 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3303 lt!119382) (_2!3303 lt!119382) (_1!3304 lt!119414) (_1!3304 lt!119393) lt!119400 lt!119402))))

(assert (=> b!74123 (= (bitStreamReadBitsIntoList!0 (_2!3303 lt!119382) (_1!3304 lt!119393) (bvsub lt!119400 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!370 lt!119402))))

(declare-fun lt!119406 () Unit!4855)

(assert (=> b!74123 (= lt!119406 lt!119388)))

(declare-fun lt!119377 () Unit!4855)

(declare-fun lt!119407 () (_ BitVec 64))

(assert (=> b!74123 (= lt!119377 (arrayBitRangesEqImpliesEq!0 (buf!1782 (_2!3303 lt!119385)) (buf!1782 (_2!3303 lt!119382)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!119407 (bitIndex!0 (size!1401 (buf!1782 (_2!3303 lt!119385))) (currentByte!3508 (_2!3303 lt!119385)) (currentBit!3503 (_2!3303 lt!119385)))))))

(assert (=> b!74123 (= (bitAt!0 (buf!1782 (_2!3303 lt!119385)) lt!119407) (bitAt!0 (buf!1782 (_2!3303 lt!119382)) lt!119407))))

(declare-fun lt!119376 () Unit!4855)

(assert (=> b!74123 (= lt!119376 lt!119377)))

(declare-fun b!74124 () Bool)

(declare-fun Unit!4881 () Unit!4855)

(assert (=> b!74124 (= e!48411 (tuple2!6379 Unit!4881 (_2!3303 lt!118391)))))

(assert (=> b!74124 (= (size!1401 (buf!1782 (_2!3303 lt!118391))) (size!1401 (buf!1782 (_2!3303 lt!118391))))))

(declare-fun lt!119409 () Unit!4855)

(declare-fun Unit!4882 () Unit!4855)

(assert (=> b!74124 (= lt!119409 Unit!4882)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2382 array!2997 array!2997 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!74124 (checkByteArrayBitContent!0 (_2!3303 lt!118391) srcBuffer!2 (_1!3315 (readBits!0 (_1!3304 call!943) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!74125 () Bool)

(declare-fun e!48409 () Bool)

(declare-fun lt!119405 () (_ BitVec 64))

(assert (=> b!74125 (= e!48409 (validate_offset_bits!1 ((_ sign_extend 32) (size!1401 (buf!1782 (_2!3303 lt!118391)))) ((_ sign_extend 32) (currentByte!3508 (_2!3303 lt!118391))) ((_ sign_extend 32) (currentBit!3503 (_2!3303 lt!118391))) lt!119405))))

(declare-fun bm!940 () Bool)

(declare-fun c!5459 () Bool)

(assert (=> bm!940 (= call!943 (reader!0 (_2!3303 lt!118391) (ite c!5459 (_2!3303 lt!119385) (_2!3303 lt!118391))))))

(declare-fun d!23398 () Bool)

(assert (=> d!23398 e!48410))

(declare-fun res!61276 () Bool)

(assert (=> d!23398 (=> (not res!61276) (not e!48410))))

(declare-fun lt!119410 () (_ BitVec 64))

(assert (=> d!23398 (= res!61276 (= (bitIndex!0 (size!1401 (buf!1782 (_2!3303 lt!119378))) (currentByte!3508 (_2!3303 lt!119378)) (currentBit!3503 (_2!3303 lt!119378))) (bvsub lt!119410 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!23398 (or (= (bvand lt!119410 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!119410 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!119410 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!119375 () (_ BitVec 64))

(assert (=> d!23398 (= lt!119410 (bvadd lt!119375 to!314))))

(assert (=> d!23398 (or (not (= (bvand lt!119375 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!119375 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!119375 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23398 (= lt!119375 (bitIndex!0 (size!1401 (buf!1782 (_2!3303 lt!118391))) (currentByte!3508 (_2!3303 lt!118391)) (currentBit!3503 (_2!3303 lt!118391))))))

(assert (=> d!23398 (= lt!119378 e!48411)))

(assert (=> d!23398 (= c!5459 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!119386 () Unit!4855)

(declare-fun lt!119408 () Unit!4855)

(assert (=> d!23398 (= lt!119386 lt!119408)))

(assert (=> d!23398 (isPrefixOf!0 (_2!3303 lt!118391) (_2!3303 lt!118391))))

(assert (=> d!23398 (= lt!119408 (lemmaIsPrefixRefl!0 (_2!3303 lt!118391)))))

(assert (=> d!23398 (= lt!119407 (bitIndex!0 (size!1401 (buf!1782 (_2!3303 lt!118391))) (currentByte!3508 (_2!3303 lt!118391)) (currentBit!3503 (_2!3303 lt!118391))))))

(assert (=> d!23398 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!23398 (= (appendBitsMSBFirstLoop!0 (_2!3303 lt!118391) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!119378)))

(declare-fun b!74126 () Bool)

(declare-fun res!61271 () Bool)

(assert (=> b!74126 (=> (not res!61271) (not e!48410))))

(assert (=> b!74126 (= res!61271 (= (size!1401 (buf!1782 (_2!3303 lt!119378))) (size!1401 (buf!1782 (_2!3303 lt!118391)))))))

(declare-fun lt!119380 () tuple2!6380)

(declare-fun b!74127 () Bool)

(assert (=> b!74127 (= e!48410 (= (bitStreamReadBitsIntoList!0 (_2!3303 lt!119378) (_1!3304 lt!119380) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!3303 lt!119378) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!74127 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!74127 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!119404 () Unit!4855)

(declare-fun lt!119394 () Unit!4855)

(assert (=> b!74127 (= lt!119404 lt!119394)))

(assert (=> b!74127 (validate_offset_bits!1 ((_ sign_extend 32) (size!1401 (buf!1782 (_2!3303 lt!119378)))) ((_ sign_extend 32) (currentByte!3508 (_2!3303 lt!118391))) ((_ sign_extend 32) (currentBit!3503 (_2!3303 lt!118391))) lt!119405)))

(assert (=> b!74127 (= lt!119394 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3303 lt!118391) (buf!1782 (_2!3303 lt!119378)) lt!119405))))

(assert (=> b!74127 e!48409))

(declare-fun res!61275 () Bool)

(assert (=> b!74127 (=> (not res!61275) (not e!48409))))

(assert (=> b!74127 (= res!61275 (and (= (size!1401 (buf!1782 (_2!3303 lt!118391))) (size!1401 (buf!1782 (_2!3303 lt!119378)))) (bvsge lt!119405 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!74127 (= lt!119405 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!74127 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!74127 (= lt!119380 (reader!0 (_2!3303 lt!118391) (_2!3303 lt!119378)))))

(declare-fun b!74128 () Bool)

(declare-fun res!61274 () Bool)

(assert (=> b!74128 (=> (not res!61274) (not e!48410))))

(assert (=> b!74128 (= res!61274 (invariant!0 (currentBit!3503 (_2!3303 lt!119378)) (currentByte!3508 (_2!3303 lt!119378)) (size!1401 (buf!1782 (_2!3303 lt!119378)))))))

(declare-fun b!74129 () Bool)

(declare-fun res!61272 () Bool)

(assert (=> b!74129 (=> (not res!61272) (not e!48410))))

(assert (=> b!74129 (= res!61272 (= (size!1401 (buf!1782 (_2!3303 lt!118391))) (size!1401 (buf!1782 (_2!3303 lt!119378)))))))

(assert (= (and d!23398 c!5459) b!74123))

(assert (= (and d!23398 (not c!5459)) b!74124))

(assert (= (or b!74123 b!74124) bm!940))

(assert (= (and d!23398 res!61276) b!74128))

(assert (= (and b!74128 res!61274) b!74129))

(assert (= (and b!74129 res!61272) b!74122))

(assert (= (and b!74122 res!61273) b!74126))

(assert (= (and b!74126 res!61271) b!74127))

(assert (= (and b!74127 res!61275) b!74125))

(declare-fun m!118961 () Bool)

(assert (=> d!23398 m!118961))

(assert (=> d!23398 m!118125))

(assert (=> d!23398 m!118343))

(assert (=> d!23398 m!118333))

(declare-fun m!118963 () Bool)

(assert (=> bm!940 m!118963))

(declare-fun m!118965 () Bool)

(assert (=> b!74127 m!118965))

(declare-fun m!118967 () Bool)

(assert (=> b!74127 m!118967))

(declare-fun m!118969 () Bool)

(assert (=> b!74127 m!118969))

(declare-fun m!118971 () Bool)

(assert (=> b!74127 m!118971))

(declare-fun m!118973 () Bool)

(assert (=> b!74127 m!118973))

(declare-fun m!118975 () Bool)

(assert (=> b!74124 m!118975))

(declare-fun m!118977 () Bool)

(assert (=> b!74124 m!118977))

(declare-fun m!118979 () Bool)

(assert (=> b!74125 m!118979))

(declare-fun m!118981 () Bool)

(assert (=> b!74128 m!118981))

(declare-fun m!118983 () Bool)

(assert (=> b!74123 m!118983))

(declare-fun m!118985 () Bool)

(assert (=> b!74123 m!118985))

(declare-fun m!118987 () Bool)

(assert (=> b!74123 m!118987))

(declare-fun m!118989 () Bool)

(assert (=> b!74123 m!118989))

(declare-fun m!118991 () Bool)

(assert (=> b!74123 m!118991))

(declare-fun m!118993 () Bool)

(assert (=> b!74123 m!118993))

(declare-fun m!118995 () Bool)

(assert (=> b!74123 m!118995))

(declare-fun m!118997 () Bool)

(assert (=> b!74123 m!118997))

(assert (=> b!74123 m!118991))

(declare-fun m!118999 () Bool)

(assert (=> b!74123 m!118999))

(declare-fun m!119001 () Bool)

(assert (=> b!74123 m!119001))

(declare-fun m!119003 () Bool)

(assert (=> b!74123 m!119003))

(declare-fun m!119005 () Bool)

(assert (=> b!74123 m!119005))

(assert (=> b!74123 m!118125))

(declare-fun m!119007 () Bool)

(assert (=> b!74123 m!119007))

(declare-fun m!119009 () Bool)

(assert (=> b!74123 m!119009))

(assert (=> b!74123 m!118987))

(declare-fun m!119011 () Bool)

(assert (=> b!74123 m!119011))

(declare-fun m!119013 () Bool)

(assert (=> b!74123 m!119013))

(declare-fun m!119015 () Bool)

(assert (=> b!74123 m!119015))

(declare-fun m!119017 () Bool)

(assert (=> b!74123 m!119017))

(declare-fun m!119019 () Bool)

(assert (=> b!74123 m!119019))

(declare-fun m!119021 () Bool)

(assert (=> b!74123 m!119021))

(declare-fun m!119023 () Bool)

(assert (=> b!74123 m!119023))

(assert (=> b!74123 m!118997))

(declare-fun m!119025 () Bool)

(assert (=> b!74123 m!119025))

(declare-fun m!119027 () Bool)

(assert (=> b!74123 m!119027))

(declare-fun m!119029 () Bool)

(assert (=> b!74123 m!119029))

(assert (=> b!74123 m!119023))

(declare-fun m!119031 () Bool)

(assert (=> b!74123 m!119031))

(declare-fun m!119033 () Bool)

(assert (=> b!74123 m!119033))

(declare-fun m!119035 () Bool)

(assert (=> b!74123 m!119035))

(declare-fun m!119037 () Bool)

(assert (=> b!74123 m!119037))

(declare-fun m!119039 () Bool)

(assert (=> b!74123 m!119039))

(declare-fun m!119041 () Bool)

(assert (=> b!74123 m!119041))

(declare-fun m!119043 () Bool)

(assert (=> b!74123 m!119043))

(declare-fun m!119045 () Bool)

(assert (=> b!74122 m!119045))

(assert (=> b!73681 d!23398))

(declare-fun b!74130 () Bool)

(declare-fun e!48412 () Unit!4855)

(declare-fun lt!119430 () Unit!4855)

(assert (=> b!74130 (= e!48412 lt!119430)))

(declare-fun lt!119423 () (_ BitVec 64))

(assert (=> b!74130 (= lt!119423 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119425 () (_ BitVec 64))

(assert (=> b!74130 (= lt!119425 (bitIndex!0 (size!1401 (buf!1782 thiss!1379)) (currentByte!3508 thiss!1379) (currentBit!3503 thiss!1379)))))

(assert (=> b!74130 (= lt!119430 (arrayBitRangesEqSymmetric!0 (buf!1782 thiss!1379) (buf!1782 (_2!3303 lt!118391)) lt!119423 lt!119425))))

(assert (=> b!74130 (arrayBitRangesEq!0 (buf!1782 (_2!3303 lt!118391)) (buf!1782 thiss!1379) lt!119423 lt!119425)))

(declare-fun lt!119428 () (_ BitVec 64))

(declare-fun lt!119429 () tuple2!6380)

(declare-fun lt!119419 () (_ BitVec 64))

(declare-fun e!48413 () Bool)

(declare-fun b!74131 () Bool)

(assert (=> b!74131 (= e!48413 (= (_1!3304 lt!119429) (withMovedBitIndex!0 (_2!3304 lt!119429) (bvsub lt!119419 lt!119428))))))

(assert (=> b!74131 (or (= (bvand lt!119419 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!119428 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!119419 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!119419 lt!119428) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!74131 (= lt!119428 (bitIndex!0 (size!1401 (buf!1782 (_2!3303 lt!118391))) (currentByte!3508 (_2!3303 lt!118391)) (currentBit!3503 (_2!3303 lt!118391))))))

(assert (=> b!74131 (= lt!119419 (bitIndex!0 (size!1401 (buf!1782 thiss!1379)) (currentByte!3508 thiss!1379) (currentBit!3503 thiss!1379)))))

(declare-fun b!74132 () Bool)

(declare-fun res!61278 () Bool)

(assert (=> b!74132 (=> (not res!61278) (not e!48413))))

(assert (=> b!74132 (= res!61278 (isPrefixOf!0 (_1!3304 lt!119429) thiss!1379))))

(declare-fun b!74133 () Bool)

(declare-fun Unit!4885 () Unit!4855)

(assert (=> b!74133 (= e!48412 Unit!4885)))

(declare-fun d!23496 () Bool)

(assert (=> d!23496 e!48413))

(declare-fun res!61279 () Bool)

(assert (=> d!23496 (=> (not res!61279) (not e!48413))))

(assert (=> d!23496 (= res!61279 (isPrefixOf!0 (_1!3304 lt!119429) (_2!3304 lt!119429)))))

(declare-fun lt!119432 () BitStream!2382)

(assert (=> d!23496 (= lt!119429 (tuple2!6381 lt!119432 (_2!3303 lt!118391)))))

(declare-fun lt!119435 () Unit!4855)

(declare-fun lt!119424 () Unit!4855)

(assert (=> d!23496 (= lt!119435 lt!119424)))

(assert (=> d!23496 (isPrefixOf!0 lt!119432 (_2!3303 lt!118391))))

(assert (=> d!23496 (= lt!119424 (lemmaIsPrefixTransitive!0 lt!119432 (_2!3303 lt!118391) (_2!3303 lt!118391)))))

(declare-fun lt!119426 () Unit!4855)

(declare-fun lt!119431 () Unit!4855)

(assert (=> d!23496 (= lt!119426 lt!119431)))

(assert (=> d!23496 (isPrefixOf!0 lt!119432 (_2!3303 lt!118391))))

(assert (=> d!23496 (= lt!119431 (lemmaIsPrefixTransitive!0 lt!119432 thiss!1379 (_2!3303 lt!118391)))))

(declare-fun lt!119420 () Unit!4855)

(assert (=> d!23496 (= lt!119420 e!48412)))

(declare-fun c!5460 () Bool)

(assert (=> d!23496 (= c!5460 (not (= (size!1401 (buf!1782 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!119421 () Unit!4855)

(declare-fun lt!119433 () Unit!4855)

(assert (=> d!23496 (= lt!119421 lt!119433)))

(assert (=> d!23496 (isPrefixOf!0 (_2!3303 lt!118391) (_2!3303 lt!118391))))

(assert (=> d!23496 (= lt!119433 (lemmaIsPrefixRefl!0 (_2!3303 lt!118391)))))

(declare-fun lt!119436 () Unit!4855)

(declare-fun lt!119418 () Unit!4855)

(assert (=> d!23496 (= lt!119436 lt!119418)))

(assert (=> d!23496 (= lt!119418 (lemmaIsPrefixRefl!0 (_2!3303 lt!118391)))))

(declare-fun lt!119434 () Unit!4855)

(declare-fun lt!119427 () Unit!4855)

(assert (=> d!23496 (= lt!119434 lt!119427)))

(assert (=> d!23496 (isPrefixOf!0 lt!119432 lt!119432)))

(assert (=> d!23496 (= lt!119427 (lemmaIsPrefixRefl!0 lt!119432))))

(declare-fun lt!119422 () Unit!4855)

(declare-fun lt!119417 () Unit!4855)

(assert (=> d!23496 (= lt!119422 lt!119417)))

(assert (=> d!23496 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23496 (= lt!119417 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!23496 (= lt!119432 (BitStream!2383 (buf!1782 (_2!3303 lt!118391)) (currentByte!3508 thiss!1379) (currentBit!3503 thiss!1379)))))

(assert (=> d!23496 (isPrefixOf!0 thiss!1379 (_2!3303 lt!118391))))

(assert (=> d!23496 (= (reader!0 thiss!1379 (_2!3303 lt!118391)) lt!119429)))

(declare-fun b!74134 () Bool)

(declare-fun res!61277 () Bool)

(assert (=> b!74134 (=> (not res!61277) (not e!48413))))

(assert (=> b!74134 (= res!61277 (isPrefixOf!0 (_2!3304 lt!119429) (_2!3303 lt!118391)))))

(assert (= (and d!23496 c!5460) b!74130))

(assert (= (and d!23496 (not c!5460)) b!74133))

(assert (= (and d!23496 res!61279) b!74132))

(assert (= (and b!74132 res!61278) b!74134))

(assert (= (and b!74134 res!61277) b!74131))

(declare-fun m!119047 () Bool)

(assert (=> b!74131 m!119047))

(assert (=> b!74131 m!118125))

(assert (=> b!74131 m!118213))

(assert (=> b!74130 m!118213))

(declare-fun m!119049 () Bool)

(assert (=> b!74130 m!119049))

(declare-fun m!119051 () Bool)

(assert (=> b!74130 m!119051))

(declare-fun m!119053 () Bool)

(assert (=> b!74134 m!119053))

(assert (=> d!23496 m!118333))

(assert (=> d!23496 m!118211))

(declare-fun m!119055 () Bool)

(assert (=> d!23496 m!119055))

(declare-fun m!119057 () Bool)

(assert (=> d!23496 m!119057))

(declare-fun m!119059 () Bool)

(assert (=> d!23496 m!119059))

(assert (=> d!23496 m!118343))

(assert (=> d!23496 m!118209))

(assert (=> d!23496 m!118167))

(declare-fun m!119061 () Bool)

(assert (=> d!23496 m!119061))

(declare-fun m!119063 () Bool)

(assert (=> d!23496 m!119063))

(declare-fun m!119065 () Bool)

(assert (=> d!23496 m!119065))

(declare-fun m!119067 () Bool)

(assert (=> b!74132 m!119067))

(assert (=> b!73681 d!23496))

(declare-fun d!23498 () Bool)

(assert (=> d!23498 (validate_offset_bits!1 ((_ sign_extend 32) (size!1401 (buf!1782 (_2!3303 lt!118391)))) ((_ sign_extend 32) (currentByte!3508 thiss!1379)) ((_ sign_extend 32) (currentBit!3503 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!119437 () Unit!4855)

(assert (=> d!23498 (= lt!119437 (choose!9 thiss!1379 (buf!1782 (_2!3303 lt!118391)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2383 (buf!1782 (_2!3303 lt!118391)) (currentByte!3508 thiss!1379) (currentBit!3503 thiss!1379))))))

(assert (=> d!23498 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1782 (_2!3303 lt!118391)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!119437)))

(declare-fun bs!5638 () Bool)

(assert (= bs!5638 d!23498))

(assert (=> bs!5638 m!118195))

(declare-fun m!119069 () Bool)

(assert (=> bs!5638 m!119069))

(assert (=> b!73681 d!23498))

(declare-fun d!23500 () Bool)

(assert (=> d!23500 (isPrefixOf!0 thiss!1379 (_2!3303 lt!118384))))

(declare-fun lt!119440 () Unit!4855)

(declare-fun choose!30 (BitStream!2382 BitStream!2382 BitStream!2382) Unit!4855)

(assert (=> d!23500 (= lt!119440 (choose!30 thiss!1379 (_2!3303 lt!118391) (_2!3303 lt!118384)))))

(assert (=> d!23500 (isPrefixOf!0 thiss!1379 (_2!3303 lt!118391))))

(assert (=> d!23500 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3303 lt!118391) (_2!3303 lt!118384)) lt!119440)))

(declare-fun bs!5639 () Bool)

(assert (= bs!5639 d!23500))

(assert (=> bs!5639 m!118193))

(declare-fun m!119071 () Bool)

(assert (=> bs!5639 m!119071))

(assert (=> bs!5639 m!118167))

(assert (=> b!73681 d!23500))

(declare-fun d!23502 () Bool)

(assert (=> d!23502 (= (invariant!0 (currentBit!3503 (_2!3303 lt!118384)) (currentByte!3508 (_2!3303 lt!118384)) (size!1401 (buf!1782 (_2!3303 lt!118384)))) (and (bvsge (currentBit!3503 (_2!3303 lt!118384)) #b00000000000000000000000000000000) (bvslt (currentBit!3503 (_2!3303 lt!118384)) #b00000000000000000000000000001000) (bvsge (currentByte!3508 (_2!3303 lt!118384)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3508 (_2!3303 lt!118384)) (size!1401 (buf!1782 (_2!3303 lt!118384)))) (and (= (currentBit!3503 (_2!3303 lt!118384)) #b00000000000000000000000000000000) (= (currentByte!3508 (_2!3303 lt!118384)) (size!1401 (buf!1782 (_2!3303 lt!118384))))))))))

(assert (=> b!73692 d!23502))

(declare-fun d!23504 () Bool)

(assert (=> d!23504 (= (head!585 (byteArrayBitContentToList!0 (_2!3303 lt!118391) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!881 (byteArrayBitContentToList!0 (_2!3303 lt!118391) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!73682 d!23504))

(declare-fun d!23506 () Bool)

(declare-fun c!5461 () Bool)

(assert (=> d!23506 (= c!5461 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!48414 () List!766)

(assert (=> d!23506 (= (byteArrayBitContentToList!0 (_2!3303 lt!118391) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!48414)))

(declare-fun b!74135 () Bool)

(assert (=> b!74135 (= e!48414 Nil!763)))

(declare-fun b!74136 () Bool)

(assert (=> b!74136 (= e!48414 (Cons!762 (not (= (bvand ((_ sign_extend 24) (select (arr!1992 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3303 lt!118391) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!23506 c!5461) b!74135))

(assert (= (and d!23506 (not c!5461)) b!74136))

(assert (=> b!74136 m!118161))

(assert (=> b!74136 m!118385))

(declare-fun m!119073 () Bool)

(assert (=> b!74136 m!119073))

(assert (=> b!73682 d!23506))

(declare-fun d!23508 () Bool)

(assert (=> d!23508 (= (head!585 (bitStreamReadBitsIntoList!0 (_2!3303 lt!118391) (_1!3304 lt!118372) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!881 (bitStreamReadBitsIntoList!0 (_2!3303 lt!118391) (_1!3304 lt!118372) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!73682 d!23508))

(declare-fun b!74140 () Bool)

(declare-fun e!48416 () Bool)

(declare-fun lt!119441 () List!766)

(assert (=> b!74140 (= e!48416 (> (length!394 lt!119441) 0))))

(declare-fun b!74137 () Bool)

(declare-fun e!48415 () tuple2!6394)

(assert (=> b!74137 (= e!48415 (tuple2!6395 Nil!763 (_1!3304 lt!118372)))))

(declare-fun b!74139 () Bool)

(assert (=> b!74139 (= e!48416 (isEmpty!235 lt!119441))))

(declare-fun lt!119443 () (_ BitVec 64))

(declare-fun b!74138 () Bool)

(declare-fun lt!119442 () tuple2!6396)

(assert (=> b!74138 (= e!48415 (tuple2!6395 (Cons!762 (_1!3312 lt!119442) (bitStreamReadBitsIntoList!0 (_2!3303 lt!118391) (_2!3312 lt!119442) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!119443))) (_2!3312 lt!119442)))))

(assert (=> b!74138 (= lt!119442 (readBit!0 (_1!3304 lt!118372)))))

(assert (=> b!74138 (= lt!119443 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!23510 () Bool)

(assert (=> d!23510 e!48416))

(declare-fun c!5463 () Bool)

(assert (=> d!23510 (= c!5463 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23510 (= lt!119441 (_1!3311 e!48415))))

(declare-fun c!5462 () Bool)

(assert (=> d!23510 (= c!5462 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23510 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!23510 (= (bitStreamReadBitsIntoList!0 (_2!3303 lt!118391) (_1!3304 lt!118372) #b0000000000000000000000000000000000000000000000000000000000000001) lt!119441)))

(assert (= (and d!23510 c!5462) b!74137))

(assert (= (and d!23510 (not c!5462)) b!74138))

(assert (= (and d!23510 c!5463) b!74139))

(assert (= (and d!23510 (not c!5463)) b!74140))

(declare-fun m!119075 () Bool)

(assert (=> b!74140 m!119075))

(declare-fun m!119077 () Bool)

(assert (=> b!74139 m!119077))

(declare-fun m!119079 () Bool)

(assert (=> b!74138 m!119079))

(declare-fun m!119081 () Bool)

(assert (=> b!74138 m!119081))

(assert (=> b!73682 d!23510))

(declare-fun d!23512 () Bool)

(assert (=> d!23512 (= (invariant!0 (currentBit!3503 (_2!3303 lt!118391)) (currentByte!3508 (_2!3303 lt!118391)) (size!1401 (buf!1782 (_2!3303 lt!118391)))) (and (bvsge (currentBit!3503 (_2!3303 lt!118391)) #b00000000000000000000000000000000) (bvslt (currentBit!3503 (_2!3303 lt!118391)) #b00000000000000000000000000001000) (bvsge (currentByte!3508 (_2!3303 lt!118391)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3508 (_2!3303 lt!118391)) (size!1401 (buf!1782 (_2!3303 lt!118391)))) (and (= (currentBit!3503 (_2!3303 lt!118391)) #b00000000000000000000000000000000) (= (currentByte!3508 (_2!3303 lt!118391)) (size!1401 (buf!1782 (_2!3303 lt!118391))))))))))

(assert (=> b!73680 d!23512))

(declare-fun d!23514 () Bool)

(assert (=> d!23514 (= (head!585 lt!118392) (h!881 lt!118392))))

(assert (=> b!73691 d!23514))

(declare-fun d!23516 () Bool)

(assert (=> d!23516 (= (array_inv!1250 srcBuffer!2) (bvsge (size!1401 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!14114 d!23516))

(declare-fun d!23518 () Bool)

(assert (=> d!23518 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3503 thiss!1379) (currentByte!3508 thiss!1379) (size!1401 (buf!1782 thiss!1379))))))

(declare-fun bs!5640 () Bool)

(assert (= bs!5640 d!23518))

(declare-fun m!119083 () Bool)

(assert (=> bs!5640 m!119083))

(assert (=> start!14114 d!23518))

(declare-fun d!23520 () Bool)

(assert (=> d!23520 (= (bitAt!0 (buf!1782 (_2!3303 lt!118384)) lt!118387) (not (= (bvand ((_ sign_extend 24) (select (arr!1992 (buf!1782 (_2!3303 lt!118384))) ((_ extract 31 0) (bvsdiv lt!118387 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!118387 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5641 () Bool)

(assert (= bs!5641 d!23520))

(declare-fun m!119085 () Bool)

(assert (=> bs!5641 m!119085))

(declare-fun m!119087 () Bool)

(assert (=> bs!5641 m!119087))

(assert (=> b!73689 d!23520))

(declare-fun d!23522 () Bool)

(assert (=> d!23522 (= (bitAt!0 (buf!1782 (_2!3303 lt!118391)) lt!118387) (bitAt!0 (buf!1782 (_2!3303 lt!118384)) lt!118387))))

(declare-fun lt!119454 () Unit!4855)

(declare-fun choose!31 (array!2997 array!2997 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4855)

(assert (=> d!23522 (= lt!119454 (choose!31 (buf!1782 (_2!3303 lt!118391)) (buf!1782 (_2!3303 lt!118384)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!118387 lt!118368))))

(assert (=> d!23522 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!118368))))

(assert (=> d!23522 (= (arrayBitRangesEqImpliesEq!0 (buf!1782 (_2!3303 lt!118391)) (buf!1782 (_2!3303 lt!118384)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!118387 lt!118368) lt!119454)))

(declare-fun bs!5642 () Bool)

(assert (= bs!5642 d!23522))

(assert (=> bs!5642 m!118153))

(assert (=> bs!5642 m!118149))

(declare-fun m!119089 () Bool)

(assert (=> bs!5642 m!119089))

(assert (=> b!73689 d!23522))

(declare-fun d!23524 () Bool)

(declare-fun res!61286 () Bool)

(declare-fun e!48421 () Bool)

(assert (=> d!23524 (=> (not res!61286) (not e!48421))))

(assert (=> d!23524 (= res!61286 (= (size!1401 (buf!1782 thiss!1379)) (size!1401 (buf!1782 thiss!1379))))))

(assert (=> d!23524 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!48421)))

(declare-fun b!74148 () Bool)

(declare-fun res!61287 () Bool)

(assert (=> b!74148 (=> (not res!61287) (not e!48421))))

(assert (=> b!74148 (= res!61287 (bvsle (bitIndex!0 (size!1401 (buf!1782 thiss!1379)) (currentByte!3508 thiss!1379) (currentBit!3503 thiss!1379)) (bitIndex!0 (size!1401 (buf!1782 thiss!1379)) (currentByte!3508 thiss!1379) (currentBit!3503 thiss!1379))))))

(declare-fun b!74149 () Bool)

(declare-fun e!48422 () Bool)

(assert (=> b!74149 (= e!48421 e!48422)))

(declare-fun res!61288 () Bool)

(assert (=> b!74149 (=> res!61288 e!48422)))

(assert (=> b!74149 (= res!61288 (= (size!1401 (buf!1782 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!74150 () Bool)

(assert (=> b!74150 (= e!48422 (arrayBitRangesEq!0 (buf!1782 thiss!1379) (buf!1782 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1401 (buf!1782 thiss!1379)) (currentByte!3508 thiss!1379) (currentBit!3503 thiss!1379))))))

(assert (= (and d!23524 res!61286) b!74148))

(assert (= (and b!74148 res!61287) b!74149))

(assert (= (and b!74149 (not res!61288)) b!74150))

(assert (=> b!74148 m!118213))

(assert (=> b!74148 m!118213))

(assert (=> b!74150 m!118213))

(assert (=> b!74150 m!118213))

(declare-fun m!119091 () Bool)

(assert (=> b!74150 m!119091))

(assert (=> b!73679 d!23524))

(declare-fun d!23526 () Bool)

(assert (=> d!23526 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!119473 () Unit!4855)

(declare-fun choose!11 (BitStream!2382) Unit!4855)

(assert (=> d!23526 (= lt!119473 (choose!11 thiss!1379))))

(assert (=> d!23526 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!119473)))

(declare-fun bs!5644 () Bool)

(assert (= bs!5644 d!23526))

(assert (=> bs!5644 m!118209))

(declare-fun m!119093 () Bool)

(assert (=> bs!5644 m!119093))

(assert (=> b!73679 d!23526))

(declare-fun d!23528 () Bool)

(declare-fun e!48427 () Bool)

(assert (=> d!23528 e!48427))

(declare-fun res!61299 () Bool)

(assert (=> d!23528 (=> (not res!61299) (not e!48427))))

(declare-fun lt!119477 () (_ BitVec 64))

(declare-fun lt!119475 () (_ BitVec 64))

(declare-fun lt!119479 () (_ BitVec 64))

(assert (=> d!23528 (= res!61299 (= lt!119477 (bvsub lt!119479 lt!119475)))))

(assert (=> d!23528 (or (= (bvand lt!119479 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!119475 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!119479 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!119479 lt!119475) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23528 (= lt!119475 (remainingBits!0 ((_ sign_extend 32) (size!1401 (buf!1782 thiss!1379))) ((_ sign_extend 32) (currentByte!3508 thiss!1379)) ((_ sign_extend 32) (currentBit!3503 thiss!1379))))))

(declare-fun lt!119474 () (_ BitVec 64))

(declare-fun lt!119476 () (_ BitVec 64))

(assert (=> d!23528 (= lt!119479 (bvmul lt!119474 lt!119476))))

(assert (=> d!23528 (or (= lt!119474 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!119476 (bvsdiv (bvmul lt!119474 lt!119476) lt!119474)))))

(assert (=> d!23528 (= lt!119476 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!23528 (= lt!119474 ((_ sign_extend 32) (size!1401 (buf!1782 thiss!1379))))))

(assert (=> d!23528 (= lt!119477 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3508 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3503 thiss!1379))))))

(assert (=> d!23528 (invariant!0 (currentBit!3503 thiss!1379) (currentByte!3508 thiss!1379) (size!1401 (buf!1782 thiss!1379)))))

(assert (=> d!23528 (= (bitIndex!0 (size!1401 (buf!1782 thiss!1379)) (currentByte!3508 thiss!1379) (currentBit!3503 thiss!1379)) lt!119477)))

(declare-fun b!74161 () Bool)

(declare-fun res!61300 () Bool)

(assert (=> b!74161 (=> (not res!61300) (not e!48427))))

(assert (=> b!74161 (= res!61300 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!119477))))

(declare-fun b!74162 () Bool)

(declare-fun lt!119478 () (_ BitVec 64))

(assert (=> b!74162 (= e!48427 (bvsle lt!119477 (bvmul lt!119478 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!74162 (or (= lt!119478 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!119478 #b0000000000000000000000000000000000000000000000000000000000001000) lt!119478)))))

(assert (=> b!74162 (= lt!119478 ((_ sign_extend 32) (size!1401 (buf!1782 thiss!1379))))))

(assert (= (and d!23528 res!61299) b!74161))

(assert (= (and b!74161 res!61300) b!74162))

(declare-fun m!119095 () Bool)

(assert (=> d!23528 m!119095))

(assert (=> d!23528 m!119083))

(assert (=> b!73679 d!23528))

(declare-fun d!23530 () Bool)

(assert (=> d!23530 (= (bitAt!0 (buf!1782 (_1!3304 lt!118381)) lt!118387) (not (= (bvand ((_ sign_extend 24) (select (arr!1992 (buf!1782 (_1!3304 lt!118381))) ((_ extract 31 0) (bvsdiv lt!118387 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!118387 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5645 () Bool)

(assert (= bs!5645 d!23530))

(declare-fun m!119097 () Bool)

(assert (=> bs!5645 m!119097))

(assert (=> bs!5645 m!119087))

(assert (=> b!73690 d!23530))

(declare-fun d!23532 () Bool)

(assert (=> d!23532 (= (bitAt!0 (buf!1782 (_1!3304 lt!118390)) lt!118387) (not (= (bvand ((_ sign_extend 24) (select (arr!1992 (buf!1782 (_1!3304 lt!118390))) ((_ extract 31 0) (bvsdiv lt!118387 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!118387 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5646 () Bool)

(assert (= bs!5646 d!23532))

(declare-fun m!119099 () Bool)

(assert (=> bs!5646 m!119099))

(assert (=> bs!5646 m!119087))

(assert (=> b!73690 d!23532))

(declare-fun d!23534 () Bool)

(assert (=> d!23534 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1401 (buf!1782 thiss!1379))) ((_ sign_extend 32) (currentByte!3508 thiss!1379)) ((_ sign_extend 32) (currentBit!3503 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1401 (buf!1782 thiss!1379))) ((_ sign_extend 32) (currentByte!3508 thiss!1379)) ((_ sign_extend 32) (currentBit!3503 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5647 () Bool)

(assert (= bs!5647 d!23534))

(assert (=> bs!5647 m!119095))

(assert (=> b!73677 d!23534))

(declare-fun d!23536 () Bool)

(assert (=> d!23536 (= (bitAt!0 (buf!1782 (_2!3303 lt!118391)) lt!118387) (not (= (bvand ((_ sign_extend 24) (select (arr!1992 (buf!1782 (_2!3303 lt!118391))) ((_ extract 31 0) (bvsdiv lt!118387 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!118387 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5648 () Bool)

(assert (= bs!5648 d!23536))

(declare-fun m!119101 () Bool)

(assert (=> bs!5648 m!119101))

(assert (=> bs!5648 m!119087))

(assert (=> b!73688 d!23536))

(declare-fun d!23538 () Bool)

(assert (=> d!23538 (= (array_inv!1250 (buf!1782 thiss!1379)) (bvsge (size!1401 (buf!1782 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!73678 d!23538))

(check-sat (not b!73773) (not b!73945) (not b!73794) (not d!23272) (not b!73804) (not d!23266) (not b!73827) (not b!73780) (not b!74150) (not d!23312) (not b!73778) (not d!23278) (not d!23500) (not b!74124) (not bm!940) (not d!23300) (not b!73939) (not d!23526) (not b!73948) (not d!23284) (not b!74140) (not b!74127) (not d!23296) (not b!73944) (not d!23286) (not b!74134) (not b!73782) (not b!73943) (not d!23306) (not b!73800) (not d!23518) (not d!23534) (not b!73779) (not b!73815) (not d!23522) (not d!23392) (not b!73937) (not d!23280) (not b!74125) (not b!73940) (not b!73947) (not b!73950) (not b!73802) (not b!73941) (not b!73775) (not b!74128) (not b!73803) (not d!23398) (not b!74148) (not b!74132) (not d!23292) (not b!74122) (not d!23496) (not b!74139) (not b!73938) (not b!74130) (not d!23268) (not d!23498) (not b!74131) (not b!74136) (not b!73792) (not b!73822) (not b!73777) (not b!73824) (not b!74138) (not d!23304) (not b!73774) (not b!73793) (not d!23528) (not b!74123) (not d!23270) (not b!73942))
(check-sat)
