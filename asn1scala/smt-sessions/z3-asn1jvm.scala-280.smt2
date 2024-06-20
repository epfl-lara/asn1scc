; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5662 () Bool)

(assert start!5662)

(declare-fun res!20264 () Bool)

(declare-fun e!15955 () Bool)

(assert (=> start!5662 (=> (not res!20264) (not e!15955))))

(declare-datatypes ((array!1585 0))(
  ( (array!1586 (arr!1134 (Array (_ BitVec 32) (_ BitVec 8))) (size!678 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1585)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> start!5662 (= res!20264 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!678 srcBuffer!2))))))))

(assert (=> start!5662 e!15955))

(assert (=> start!5662 true))

(declare-fun array_inv!647 (array!1585) Bool)

(assert (=> start!5662 (array_inv!647 srcBuffer!2)))

(declare-datatypes ((BitStream!1188 0))(
  ( (BitStream!1189 (buf!999 array!1585) (currentByte!2312 (_ BitVec 32)) (currentBit!2307 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1188)

(declare-fun e!15948 () Bool)

(declare-fun inv!12 (BitStream!1188) Bool)

(assert (=> start!5662 (and (inv!12 thiss!1379) e!15948)))

(declare-fun b!23538 () Bool)

(declare-fun e!15945 () Bool)

(assert (=> b!23538 (= e!15955 (not e!15945))))

(declare-fun res!20253 () Bool)

(assert (=> b!23538 (=> res!20253 e!15945)))

(assert (=> b!23538 (= res!20253 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1188 BitStream!1188) Bool)

(assert (=> b!23538 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!1999 0))(
  ( (Unit!2000) )
))
(declare-fun lt!34060 () Unit!1999)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1188) Unit!1999)

(assert (=> b!23538 (= lt!34060 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!34064 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!23538 (= lt!34064 (bitIndex!0 (size!678 (buf!999 thiss!1379)) (currentByte!2312 thiss!1379) (currentBit!2307 thiss!1379)))))

(declare-fun b!23539 () Bool)

(declare-fun e!15954 () Bool)

(assert (=> b!23539 (= e!15954 true)))

(declare-datatypes ((tuple2!2694 0))(
  ( (tuple2!2695 (_1!1434 BitStream!1188) (_2!1434 BitStream!1188)) )
))
(declare-fun lt!34067 () tuple2!2694)

(declare-datatypes ((tuple2!2696 0))(
  ( (tuple2!2697 (_1!1435 Unit!1999) (_2!1435 BitStream!1188)) )
))
(declare-fun lt!34066 () tuple2!2696)

(declare-fun lt!34058 () tuple2!2696)

(declare-fun reader!0 (BitStream!1188 BitStream!1188) tuple2!2694)

(assert (=> b!23539 (= lt!34067 (reader!0 (_2!1435 lt!34066) (_2!1435 lt!34058)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!23539 (validate_offset_bits!1 ((_ sign_extend 32) (size!678 (buf!999 (_2!1435 lt!34058)))) ((_ sign_extend 32) (currentByte!2312 thiss!1379)) ((_ sign_extend 32) (currentBit!2307 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!34068 () Unit!1999)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1188 array!1585 (_ BitVec 64)) Unit!1999)

(assert (=> b!23539 (= lt!34068 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!999 (_2!1435 lt!34058)) (bvsub to!314 i!635)))))

(declare-fun lt!34065 () tuple2!2694)

(assert (=> b!23539 (= lt!34065 (reader!0 thiss!1379 (_2!1435 lt!34058)))))

(declare-fun lt!34062 () tuple2!2694)

(declare-fun e!15950 () Bool)

(declare-fun b!23540 () Bool)

(declare-datatypes ((List!295 0))(
  ( (Nil!292) (Cons!291 (h!410 Bool) (t!1045 List!295)) )
))
(declare-fun head!132 (List!295) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1188 array!1585 (_ BitVec 64) (_ BitVec 64)) List!295)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1188 BitStream!1188 (_ BitVec 64)) List!295)

(assert (=> b!23540 (= e!15950 (= (head!132 (byteArrayBitContentToList!0 (_2!1435 lt!34066) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!132 (bitStreamReadBitsIntoList!0 (_2!1435 lt!34066) (_1!1434 lt!34062) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!23541 () Bool)

(declare-fun res!20262 () Bool)

(assert (=> b!23541 (=> res!20262 e!15954)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!23541 (= res!20262 (not (invariant!0 (currentBit!2307 (_2!1435 lt!34066)) (currentByte!2312 (_2!1435 lt!34066)) (size!678 (buf!999 (_2!1435 lt!34058))))))))

(declare-fun b!23542 () Bool)

(declare-fun e!15953 () Bool)

(declare-fun e!15951 () Bool)

(assert (=> b!23542 (= e!15953 e!15951)))

(declare-fun res!20261 () Bool)

(assert (=> b!23542 (=> res!20261 e!15951)))

(declare-fun lt!34063 () (_ BitVec 64))

(assert (=> b!23542 (= res!20261 (not (= lt!34063 (bvsub (bvadd lt!34064 to!314) i!635))))))

(assert (=> b!23542 (= lt!34063 (bitIndex!0 (size!678 (buf!999 (_2!1435 lt!34058))) (currentByte!2312 (_2!1435 lt!34058)) (currentBit!2307 (_2!1435 lt!34058))))))

(declare-fun b!23543 () Bool)

(declare-fun res!20260 () Bool)

(assert (=> b!23543 (=> res!20260 e!15951)))

(assert (=> b!23543 (= res!20260 (not (invariant!0 (currentBit!2307 (_2!1435 lt!34058)) (currentByte!2312 (_2!1435 lt!34058)) (size!678 (buf!999 (_2!1435 lt!34058))))))))

(declare-fun b!23544 () Bool)

(assert (=> b!23544 (= e!15951 e!15954)))

(declare-fun res!20257 () Bool)

(assert (=> b!23544 (=> res!20257 e!15954)))

(assert (=> b!23544 (= res!20257 (not (= (size!678 (buf!999 (_2!1435 lt!34066))) (size!678 (buf!999 (_2!1435 lt!34058))))))))

(declare-fun e!15952 () Bool)

(assert (=> b!23544 e!15952))

(declare-fun res!20254 () Bool)

(assert (=> b!23544 (=> (not res!20254) (not e!15952))))

(assert (=> b!23544 (= res!20254 (= (size!678 (buf!999 (_2!1435 lt!34058))) (size!678 (buf!999 thiss!1379))))))

(declare-fun b!23545 () Bool)

(declare-fun e!15947 () Bool)

(assert (=> b!23545 (= e!15947 e!15953)))

(declare-fun res!20258 () Bool)

(assert (=> b!23545 (=> res!20258 e!15953)))

(assert (=> b!23545 (= res!20258 (not (isPrefixOf!0 (_2!1435 lt!34066) (_2!1435 lt!34058))))))

(assert (=> b!23545 (isPrefixOf!0 thiss!1379 (_2!1435 lt!34058))))

(declare-fun lt!34059 () Unit!1999)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1188 BitStream!1188 BitStream!1188) Unit!1999)

(assert (=> b!23545 (= lt!34059 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1435 lt!34066) (_2!1435 lt!34058)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1188 array!1585 (_ BitVec 64) (_ BitVec 64)) tuple2!2696)

(assert (=> b!23545 (= lt!34058 (appendBitsMSBFirstLoop!0 (_2!1435 lt!34066) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!23545 e!15950))

(declare-fun res!20263 () Bool)

(assert (=> b!23545 (=> (not res!20263) (not e!15950))))

(assert (=> b!23545 (= res!20263 (validate_offset_bits!1 ((_ sign_extend 32) (size!678 (buf!999 (_2!1435 lt!34066)))) ((_ sign_extend 32) (currentByte!2312 thiss!1379)) ((_ sign_extend 32) (currentBit!2307 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34069 () Unit!1999)

(assert (=> b!23545 (= lt!34069 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!999 (_2!1435 lt!34066)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!23545 (= lt!34062 (reader!0 thiss!1379 (_2!1435 lt!34066)))))

(declare-fun b!23546 () Bool)

(declare-fun res!20265 () Bool)

(assert (=> b!23546 (=> res!20265 e!15951)))

(assert (=> b!23546 (= res!20265 (not (= (size!678 (buf!999 thiss!1379)) (size!678 (buf!999 (_2!1435 lt!34058))))))))

(declare-fun b!23547 () Bool)

(assert (=> b!23547 (= e!15948 (array_inv!647 (buf!999 thiss!1379)))))

(declare-fun b!23548 () Bool)

(declare-fun res!20256 () Bool)

(assert (=> b!23548 (=> res!20256 e!15954)))

(assert (=> b!23548 (= res!20256 (not (invariant!0 (currentBit!2307 (_2!1435 lt!34066)) (currentByte!2312 (_2!1435 lt!34066)) (size!678 (buf!999 (_2!1435 lt!34066))))))))

(declare-fun b!23549 () Bool)

(assert (=> b!23549 (= e!15945 e!15947)))

(declare-fun res!20259 () Bool)

(assert (=> b!23549 (=> res!20259 e!15947)))

(assert (=> b!23549 (= res!20259 (not (isPrefixOf!0 thiss!1379 (_2!1435 lt!34066))))))

(assert (=> b!23549 (validate_offset_bits!1 ((_ sign_extend 32) (size!678 (buf!999 (_2!1435 lt!34066)))) ((_ sign_extend 32) (currentByte!2312 (_2!1435 lt!34066))) ((_ sign_extend 32) (currentBit!2307 (_2!1435 lt!34066))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34061 () Unit!1999)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1188 BitStream!1188 (_ BitVec 64) (_ BitVec 64)) Unit!1999)

(assert (=> b!23549 (= lt!34061 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1435 lt!34066) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1188 (_ BitVec 8) (_ BitVec 32)) tuple2!2696)

(assert (=> b!23549 (= lt!34066 (appendBitFromByte!0 thiss!1379 (select (arr!1134 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!23550 () Bool)

(declare-fun res!20255 () Bool)

(assert (=> b!23550 (=> (not res!20255) (not e!15955))))

(assert (=> b!23550 (= res!20255 (validate_offset_bits!1 ((_ sign_extend 32) (size!678 (buf!999 thiss!1379))) ((_ sign_extend 32) (currentByte!2312 thiss!1379)) ((_ sign_extend 32) (currentBit!2307 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!23551 () Bool)

(assert (=> b!23551 (= e!15952 (= lt!34063 (bvsub (bvsub (bvadd (bitIndex!0 (size!678 (buf!999 (_2!1435 lt!34066))) (currentByte!2312 (_2!1435 lt!34066)) (currentBit!2307 (_2!1435 lt!34066))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and start!5662 res!20264) b!23550))

(assert (= (and b!23550 res!20255) b!23538))

(assert (= (and b!23538 (not res!20253)) b!23549))

(assert (= (and b!23549 (not res!20259)) b!23545))

(assert (= (and b!23545 res!20263) b!23540))

(assert (= (and b!23545 (not res!20258)) b!23542))

(assert (= (and b!23542 (not res!20261)) b!23543))

(assert (= (and b!23543 (not res!20260)) b!23546))

(assert (= (and b!23546 (not res!20265)) b!23544))

(assert (= (and b!23544 res!20254) b!23551))

(assert (= (and b!23544 (not res!20257)) b!23548))

(assert (= (and b!23548 (not res!20256)) b!23541))

(assert (= (and b!23541 (not res!20262)) b!23539))

(assert (= start!5662 b!23547))

(declare-fun m!33085 () Bool)

(assert (=> b!23540 m!33085))

(assert (=> b!23540 m!33085))

(declare-fun m!33087 () Bool)

(assert (=> b!23540 m!33087))

(declare-fun m!33089 () Bool)

(assert (=> b!23540 m!33089))

(assert (=> b!23540 m!33089))

(declare-fun m!33091 () Bool)

(assert (=> b!23540 m!33091))

(declare-fun m!33093 () Bool)

(assert (=> b!23542 m!33093))

(declare-fun m!33095 () Bool)

(assert (=> b!23548 m!33095))

(declare-fun m!33097 () Bool)

(assert (=> b!23551 m!33097))

(declare-fun m!33099 () Bool)

(assert (=> b!23547 m!33099))

(declare-fun m!33101 () Bool)

(assert (=> b!23539 m!33101))

(declare-fun m!33103 () Bool)

(assert (=> b!23539 m!33103))

(declare-fun m!33105 () Bool)

(assert (=> b!23539 m!33105))

(declare-fun m!33107 () Bool)

(assert (=> b!23539 m!33107))

(declare-fun m!33109 () Bool)

(assert (=> b!23538 m!33109))

(declare-fun m!33111 () Bool)

(assert (=> b!23538 m!33111))

(declare-fun m!33113 () Bool)

(assert (=> b!23538 m!33113))

(declare-fun m!33115 () Bool)

(assert (=> b!23545 m!33115))

(declare-fun m!33117 () Bool)

(assert (=> b!23545 m!33117))

(declare-fun m!33119 () Bool)

(assert (=> b!23545 m!33119))

(declare-fun m!33121 () Bool)

(assert (=> b!23545 m!33121))

(declare-fun m!33123 () Bool)

(assert (=> b!23545 m!33123))

(declare-fun m!33125 () Bool)

(assert (=> b!23545 m!33125))

(declare-fun m!33127 () Bool)

(assert (=> b!23545 m!33127))

(declare-fun m!33129 () Bool)

(assert (=> b!23550 m!33129))

(declare-fun m!33131 () Bool)

(assert (=> b!23541 m!33131))

(declare-fun m!33133 () Bool)

(assert (=> start!5662 m!33133))

(declare-fun m!33135 () Bool)

(assert (=> start!5662 m!33135))

(declare-fun m!33137 () Bool)

(assert (=> b!23543 m!33137))

(declare-fun m!33139 () Bool)

(assert (=> b!23549 m!33139))

(declare-fun m!33141 () Bool)

(assert (=> b!23549 m!33141))

(assert (=> b!23549 m!33139))

(declare-fun m!33143 () Bool)

(assert (=> b!23549 m!33143))

(declare-fun m!33145 () Bool)

(assert (=> b!23549 m!33145))

(declare-fun m!33147 () Bool)

(assert (=> b!23549 m!33147))

(check-sat (not start!5662) (not b!23547) (not b!23550) (not b!23540) (not b!23539) (not b!23543) (not b!23538) (not b!23541) (not b!23549) (not b!23551) (not b!23548) (not b!23542) (not b!23545))
