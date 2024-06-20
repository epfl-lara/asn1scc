; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29078 () Bool)

(assert start!29078)

(declare-fun b!150937 () Bool)

(declare-fun res!126557 () Bool)

(declare-fun e!100801 () Bool)

(assert (=> b!150937 (=> (not res!126557) (not e!100801))))

(declare-datatypes ((array!6742 0))(
  ( (array!6743 (arr!3852 (Array (_ BitVec 32) (_ BitVec 8))) (size!3050 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5358 0))(
  ( (BitStream!5359 (buf!3537 array!6742) (currentByte!6463 (_ BitVec 32)) (currentBit!6458 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!9509 0))(
  ( (Unit!9510) )
))
(declare-datatypes ((tuple2!13490 0))(
  ( (tuple2!13491 (_1!7115 Unit!9509) (_2!7115 BitStream!5358)) )
))
(declare-fun lt!236193 () tuple2!13490)

(declare-fun thiss!1634 () BitStream!5358)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!150937 (= res!126557 (= (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236193))) (currentByte!6463 (_2!7115 lt!236193)) (currentBit!6458 (_2!7115 lt!236193))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3050 (buf!3537 thiss!1634)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634)))))))

(declare-fun b!150938 () Bool)

(declare-fun e!100798 () Bool)

(declare-fun e!100792 () Bool)

(assert (=> b!150938 (= e!100798 e!100792)))

(declare-fun res!126569 () Bool)

(assert (=> b!150938 (=> (not res!126569) (not e!100792))))

(declare-fun lt!236195 () tuple2!13490)

(declare-fun lt!236180 () (_ BitVec 64))

(assert (=> b!150938 (= res!126569 (= (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236195))) (currentByte!6463 (_2!7115 lt!236195)) (currentBit!6458 (_2!7115 lt!236195))) (bvadd (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236193))) (currentByte!6463 (_2!7115 lt!236193)) (currentBit!6458 (_2!7115 lt!236193))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!236180))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!150938 (= lt!236180 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!150939 () Bool)

(declare-fun e!100803 () Bool)

(declare-datatypes ((tuple2!13492 0))(
  ( (tuple2!13493 (_1!7116 BitStream!5358) (_2!7116 array!6742)) )
))
(declare-fun lt!236179 () tuple2!13492)

(declare-fun arr!237 () array!6742)

(assert (=> b!150939 (= e!100803 (not (not (= (size!3050 (_2!7116 lt!236179)) (size!3050 arr!237)))))))

(declare-fun lt!236178 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!150939 (validate_offset_bits!1 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236195)))) ((_ sign_extend 32) (currentByte!6463 thiss!1634)) ((_ sign_extend 32) (currentBit!6458 thiss!1634)) lt!236178)))

(declare-fun lt!236190 () Unit!9509)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5358 array!6742 (_ BitVec 64)) Unit!9509)

(assert (=> b!150939 (= lt!236190 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1634 (buf!3537 (_2!7115 lt!236195)) lt!236178))))

(declare-fun b!150940 () Bool)

(declare-fun e!100793 () Bool)

(declare-fun e!100794 () Bool)

(assert (=> b!150940 (= e!100793 (not e!100794))))

(declare-fun res!126556 () Bool)

(assert (=> b!150940 (=> res!126556 e!100794)))

(declare-fun lt!236199 () tuple2!13492)

(declare-fun arrayRangesEq!366 (array!6742 array!6742 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!150940 (= res!126556 (not (arrayRangesEq!366 (_2!7116 lt!236179) (_2!7116 lt!236199) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!236173 () tuple2!13492)

(assert (=> b!150940 (arrayRangesEq!366 (_2!7116 lt!236179) (_2!7116 lt!236173) #b00000000000000000000000000000000 to!404)))

(declare-datatypes ((tuple2!13494 0))(
  ( (tuple2!13495 (_1!7117 BitStream!5358) (_2!7117 BitStream!5358)) )
))
(declare-fun lt!236184 () tuple2!13494)

(declare-fun lt!236185 () Unit!9509)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5358 array!6742 (_ BitVec 32) (_ BitVec 32)) Unit!9509)

(assert (=> b!150940 (= lt!236185 (readByteArrayLoopArrayPrefixLemma!0 (_1!7117 lt!236184) arr!237 from!447 to!404))))

(declare-fun lt!236176 () array!6742)

(declare-fun readByteArrayLoopPure!0 (BitStream!5358 array!6742 (_ BitVec 32) (_ BitVec 32)) tuple2!13492)

(declare-fun withMovedByteIndex!0 (BitStream!5358 (_ BitVec 32)) BitStream!5358)

(assert (=> b!150940 (= lt!236173 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!7117 lt!236184) #b00000000000000000000000000000001) lt!236176 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!236181 () tuple2!13494)

(assert (=> b!150940 (= lt!236199 (readByteArrayLoopPure!0 (_1!7117 lt!236181) lt!236176 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((tuple2!13496 0))(
  ( (tuple2!13497 (_1!7118 BitStream!5358) (_2!7118 (_ BitVec 8))) )
))
(declare-fun lt!236182 () tuple2!13496)

(assert (=> b!150940 (= lt!236176 (array!6743 (store (arr!3852 arr!237) from!447 (_2!7118 lt!236182)) (size!3050 arr!237)))))

(declare-fun lt!236172 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!150940 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236195)))) ((_ sign_extend 32) (currentByte!6463 (_2!7115 lt!236193))) ((_ sign_extend 32) (currentBit!6458 (_2!7115 lt!236193))) lt!236172)))

(declare-fun lt!236191 () Unit!9509)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5358 array!6742 (_ BitVec 32)) Unit!9509)

(assert (=> b!150940 (= lt!236191 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!7115 lt!236193) (buf!3537 (_2!7115 lt!236195)) lt!236172))))

(assert (=> b!150940 (= (_1!7116 lt!236179) (_2!7117 lt!236184))))

(assert (=> b!150940 (= lt!236179 (readByteArrayLoopPure!0 (_1!7117 lt!236184) arr!237 from!447 to!404))))

(assert (=> b!150940 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236195)))) ((_ sign_extend 32) (currentByte!6463 thiss!1634)) ((_ sign_extend 32) (currentBit!6458 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!236171 () Unit!9509)

(assert (=> b!150940 (= lt!236171 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3537 (_2!7115 lt!236195)) (bvsub to!404 from!447)))))

(assert (=> b!150940 (= (_2!7118 lt!236182) (select (arr!3852 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!5358) tuple2!13496)

(assert (=> b!150940 (= lt!236182 (readBytePure!0 (_1!7117 lt!236184)))))

(declare-fun reader!0 (BitStream!5358 BitStream!5358) tuple2!13494)

(assert (=> b!150940 (= lt!236181 (reader!0 (_2!7115 lt!236193) (_2!7115 lt!236195)))))

(assert (=> b!150940 (= lt!236184 (reader!0 thiss!1634 (_2!7115 lt!236195)))))

(declare-fun e!100799 () Bool)

(assert (=> b!150940 e!100799))

(declare-fun res!126567 () Bool)

(assert (=> b!150940 (=> (not res!126567) (not e!100799))))

(declare-fun lt!236177 () tuple2!13496)

(declare-fun lt!236192 () tuple2!13496)

(assert (=> b!150940 (= res!126567 (= (bitIndex!0 (size!3050 (buf!3537 (_1!7118 lt!236177))) (currentByte!6463 (_1!7118 lt!236177)) (currentBit!6458 (_1!7118 lt!236177))) (bitIndex!0 (size!3050 (buf!3537 (_1!7118 lt!236192))) (currentByte!6463 (_1!7118 lt!236192)) (currentBit!6458 (_1!7118 lt!236192)))))))

(declare-fun lt!236197 () Unit!9509)

(declare-fun lt!236196 () BitStream!5358)

(declare-fun readBytePrefixLemma!0 (BitStream!5358 BitStream!5358) Unit!9509)

(assert (=> b!150940 (= lt!236197 (readBytePrefixLemma!0 lt!236196 (_2!7115 lt!236195)))))

(assert (=> b!150940 (= lt!236192 (readBytePure!0 (BitStream!5359 (buf!3537 (_2!7115 lt!236195)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634))))))

(assert (=> b!150940 (= lt!236177 (readBytePure!0 lt!236196))))

(assert (=> b!150940 (= lt!236196 (BitStream!5359 (buf!3537 (_2!7115 lt!236193)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634)))))

(declare-fun e!100796 () Bool)

(assert (=> b!150940 e!100796))

(declare-fun res!126561 () Bool)

(assert (=> b!150940 (=> (not res!126561) (not e!100796))))

(declare-fun isPrefixOf!0 (BitStream!5358 BitStream!5358) Bool)

(assert (=> b!150940 (= res!126561 (isPrefixOf!0 thiss!1634 (_2!7115 lt!236195)))))

(declare-fun lt!236183 () Unit!9509)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5358 BitStream!5358 BitStream!5358) Unit!9509)

(assert (=> b!150940 (= lt!236183 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!7115 lt!236193) (_2!7115 lt!236195)))))

(assert (=> b!150940 e!100798))

(declare-fun res!126558 () Bool)

(assert (=> b!150940 (=> (not res!126558) (not e!100798))))

(assert (=> b!150940 (= res!126558 (= (size!3050 (buf!3537 (_2!7115 lt!236193))) (size!3050 (buf!3537 (_2!7115 lt!236195)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5358 array!6742 (_ BitVec 32) (_ BitVec 32)) tuple2!13490)

(assert (=> b!150940 (= lt!236195 (appendByteArrayLoop!0 (_2!7115 lt!236193) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!150940 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236193)))) ((_ sign_extend 32) (currentByte!6463 (_2!7115 lt!236193))) ((_ sign_extend 32) (currentBit!6458 (_2!7115 lt!236193))) lt!236172)))

(assert (=> b!150940 (= lt!236172 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!236189 () Unit!9509)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5358 BitStream!5358 (_ BitVec 64) (_ BitVec 32)) Unit!9509)

(assert (=> b!150940 (= lt!236189 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!7115 lt!236193) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!150940 e!100801))

(declare-fun res!126554 () Bool)

(assert (=> b!150940 (=> (not res!126554) (not e!100801))))

(assert (=> b!150940 (= res!126554 (= (size!3050 (buf!3537 thiss!1634)) (size!3050 (buf!3537 (_2!7115 lt!236193)))))))

(declare-fun appendByte!0 (BitStream!5358 (_ BitVec 8)) tuple2!13490)

(assert (=> b!150940 (= lt!236193 (appendByte!0 thiss!1634 (select (arr!3852 arr!237) from!447)))))

(declare-fun b!150941 () Bool)

(assert (=> b!150941 (= e!100799 (= (_2!7118 lt!236177) (_2!7118 lt!236192)))))

(declare-fun b!150942 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!150942 (= e!100796 (invariant!0 (currentBit!6458 thiss!1634) (currentByte!6463 thiss!1634) (size!3050 (buf!3537 (_2!7115 lt!236193)))))))

(declare-fun b!150944 () Bool)

(declare-fun res!126562 () Bool)

(assert (=> b!150944 (=> (not res!126562) (not e!100793))))

(assert (=> b!150944 (= res!126562 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3050 (buf!3537 thiss!1634))) ((_ sign_extend 32) (currentByte!6463 thiss!1634)) ((_ sign_extend 32) (currentBit!6458 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!150945 () Bool)

(declare-fun res!126559 () Bool)

(assert (=> b!150945 (=> (not res!126559) (not e!100792))))

(assert (=> b!150945 (= res!126559 (isPrefixOf!0 (_2!7115 lt!236193) (_2!7115 lt!236195)))))

(declare-fun b!150946 () Bool)

(declare-fun e!100800 () Bool)

(assert (=> b!150946 (= e!100794 e!100800)))

(declare-fun res!126560 () Bool)

(assert (=> b!150946 (=> (not res!126560) (not e!100800))))

(assert (=> b!150946 (= res!126560 (= (size!3050 (buf!3537 thiss!1634)) (size!3050 (buf!3537 (_2!7115 lt!236195)))))))

(assert (=> b!150946 (arrayRangesEq!366 arr!237 (_2!7116 lt!236179) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!236174 () Unit!9509)

(declare-fun arrayRangesEqTransitive!81 (array!6742 array!6742 array!6742 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9509)

(assert (=> b!150946 (= lt!236174 (arrayRangesEqTransitive!81 arr!237 (_2!7116 lt!236199) (_2!7116 lt!236179) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> b!150946 (arrayRangesEq!366 (_2!7116 lt!236199) (_2!7116 lt!236179) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!236194 () Unit!9509)

(declare-fun arrayRangesEqSymmetricLemma!98 (array!6742 array!6742 (_ BitVec 32) (_ BitVec 32)) Unit!9509)

(assert (=> b!150946 (= lt!236194 (arrayRangesEqSymmetricLemma!98 (_2!7116 lt!236179) (_2!7116 lt!236199) #b00000000000000000000000000000000 to!404))))

(declare-fun b!150947 () Bool)

(declare-fun e!100797 () Bool)

(assert (=> b!150947 (= e!100792 (not e!100797))))

(declare-fun res!126563 () Bool)

(assert (=> b!150947 (=> res!126563 e!100797)))

(declare-fun lt!236188 () tuple2!13492)

(declare-fun lt!236187 () tuple2!13494)

(assert (=> b!150947 (= res!126563 (or (not (= (size!3050 (_2!7116 lt!236188)) (size!3050 arr!237))) (not (= (_1!7116 lt!236188) (_2!7117 lt!236187)))))))

(assert (=> b!150947 (= lt!236188 (readByteArrayLoopPure!0 (_1!7117 lt!236187) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!150947 (validate_offset_bits!1 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236195)))) ((_ sign_extend 32) (currentByte!6463 (_2!7115 lt!236193))) ((_ sign_extend 32) (currentBit!6458 (_2!7115 lt!236193))) lt!236180)))

(declare-fun lt!236175 () Unit!9509)

(assert (=> b!150947 (= lt!236175 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!7115 lt!236193) (buf!3537 (_2!7115 lt!236195)) lt!236180))))

(assert (=> b!150947 (= lt!236187 (reader!0 (_2!7115 lt!236193) (_2!7115 lt!236195)))))

(declare-fun b!150948 () Bool)

(assert (=> b!150948 (= e!100797 (not (arrayRangesEq!366 arr!237 (_2!7116 lt!236188) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!150949 () Bool)

(declare-fun e!100804 () Bool)

(declare-fun array_inv!2839 (array!6742) Bool)

(assert (=> b!150949 (= e!100804 (array_inv!2839 (buf!3537 thiss!1634)))))

(declare-fun res!126564 () Bool)

(assert (=> start!29078 (=> (not res!126564) (not e!100793))))

(assert (=> start!29078 (= res!126564 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3050 arr!237))))))

(assert (=> start!29078 e!100793))

(assert (=> start!29078 true))

(assert (=> start!29078 (array_inv!2839 arr!237)))

(declare-fun inv!12 (BitStream!5358) Bool)

(assert (=> start!29078 (and (inv!12 thiss!1634) e!100804)))

(declare-fun b!150943 () Bool)

(declare-fun res!126565 () Bool)

(assert (=> b!150943 (=> (not res!126565) (not e!100801))))

(assert (=> b!150943 (= res!126565 (isPrefixOf!0 thiss!1634 (_2!7115 lt!236193)))))

(declare-fun b!150950 () Bool)

(declare-fun res!126566 () Bool)

(assert (=> b!150950 (=> (not res!126566) (not e!100793))))

(assert (=> b!150950 (= res!126566 (invariant!0 (currentBit!6458 thiss!1634) (currentByte!6463 thiss!1634) (size!3050 (buf!3537 thiss!1634))))))

(declare-fun b!150951 () Bool)

(assert (=> b!150951 (= e!100800 e!100803)))

(declare-fun res!126555 () Bool)

(assert (=> b!150951 (=> (not res!126555) (not e!100803))))

(assert (=> b!150951 (= res!126555 (= (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236195))) (currentByte!6463 (_2!7115 lt!236195)) (currentBit!6458 (_2!7115 lt!236195))) (bvadd (bitIndex!0 (size!3050 (buf!3537 thiss!1634)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!236178))))))

(assert (=> b!150951 (= lt!236178 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun b!150952 () Bool)

(declare-fun res!126568 () Bool)

(assert (=> b!150952 (=> (not res!126568) (not e!100793))))

(assert (=> b!150952 (= res!126568 (bvslt from!447 to!404))))

(declare-fun b!150953 () Bool)

(declare-fun lt!236198 () tuple2!13496)

(declare-fun lt!236186 () tuple2!13494)

(assert (=> b!150953 (= e!100801 (and (= (_2!7118 lt!236198) (select (arr!3852 arr!237) from!447)) (= (_1!7118 lt!236198) (_2!7117 lt!236186))))))

(assert (=> b!150953 (= lt!236198 (readBytePure!0 (_1!7117 lt!236186)))))

(assert (=> b!150953 (= lt!236186 (reader!0 thiss!1634 (_2!7115 lt!236193)))))

(assert (= (and start!29078 res!126564) b!150944))

(assert (= (and b!150944 res!126562) b!150952))

(assert (= (and b!150952 res!126568) b!150950))

(assert (= (and b!150950 res!126566) b!150940))

(assert (= (and b!150940 res!126554) b!150937))

(assert (= (and b!150937 res!126557) b!150943))

(assert (= (and b!150943 res!126565) b!150953))

(assert (= (and b!150940 res!126558) b!150938))

(assert (= (and b!150938 res!126569) b!150945))

(assert (= (and b!150945 res!126559) b!150947))

(assert (= (and b!150947 (not res!126563)) b!150948))

(assert (= (and b!150940 res!126561) b!150942))

(assert (= (and b!150940 res!126567) b!150941))

(assert (= (and b!150940 (not res!126556)) b!150946))

(assert (= (and b!150946 res!126560) b!150951))

(assert (= (and b!150951 res!126555) b!150939))

(assert (= start!29078 b!150949))

(declare-fun m!235501 () Bool)

(assert (=> b!150949 m!235501))

(declare-fun m!235503 () Bool)

(assert (=> b!150946 m!235503))

(declare-fun m!235505 () Bool)

(assert (=> b!150946 m!235505))

(declare-fun m!235507 () Bool)

(assert (=> b!150946 m!235507))

(declare-fun m!235509 () Bool)

(assert (=> b!150946 m!235509))

(declare-fun m!235511 () Bool)

(assert (=> b!150951 m!235511))

(declare-fun m!235513 () Bool)

(assert (=> b!150951 m!235513))

(declare-fun m!235515 () Bool)

(assert (=> b!150940 m!235515))

(declare-fun m!235517 () Bool)

(assert (=> b!150940 m!235517))

(declare-fun m!235519 () Bool)

(assert (=> b!150940 m!235519))

(declare-fun m!235521 () Bool)

(assert (=> b!150940 m!235521))

(declare-fun m!235523 () Bool)

(assert (=> b!150940 m!235523))

(declare-fun m!235525 () Bool)

(assert (=> b!150940 m!235525))

(declare-fun m!235527 () Bool)

(assert (=> b!150940 m!235527))

(declare-fun m!235529 () Bool)

(assert (=> b!150940 m!235529))

(declare-fun m!235531 () Bool)

(assert (=> b!150940 m!235531))

(declare-fun m!235533 () Bool)

(assert (=> b!150940 m!235533))

(declare-fun m!235535 () Bool)

(assert (=> b!150940 m!235535))

(declare-fun m!235537 () Bool)

(assert (=> b!150940 m!235537))

(declare-fun m!235539 () Bool)

(assert (=> b!150940 m!235539))

(declare-fun m!235541 () Bool)

(assert (=> b!150940 m!235541))

(declare-fun m!235543 () Bool)

(assert (=> b!150940 m!235543))

(declare-fun m!235545 () Bool)

(assert (=> b!150940 m!235545))

(declare-fun m!235547 () Bool)

(assert (=> b!150940 m!235547))

(declare-fun m!235549 () Bool)

(assert (=> b!150940 m!235549))

(declare-fun m!235551 () Bool)

(assert (=> b!150940 m!235551))

(declare-fun m!235553 () Bool)

(assert (=> b!150940 m!235553))

(declare-fun m!235555 () Bool)

(assert (=> b!150940 m!235555))

(declare-fun m!235557 () Bool)

(assert (=> b!150940 m!235557))

(declare-fun m!235559 () Bool)

(assert (=> b!150940 m!235559))

(assert (=> b!150940 m!235531))

(declare-fun m!235561 () Bool)

(assert (=> b!150940 m!235561))

(declare-fun m!235563 () Bool)

(assert (=> b!150940 m!235563))

(declare-fun m!235565 () Bool)

(assert (=> b!150940 m!235565))

(declare-fun m!235567 () Bool)

(assert (=> b!150940 m!235567))

(assert (=> b!150940 m!235563))

(declare-fun m!235569 () Bool)

(assert (=> b!150947 m!235569))

(declare-fun m!235571 () Bool)

(assert (=> b!150947 m!235571))

(declare-fun m!235573 () Bool)

(assert (=> b!150947 m!235573))

(assert (=> b!150947 m!235553))

(declare-fun m!235575 () Bool)

(assert (=> b!150937 m!235575))

(assert (=> b!150937 m!235513))

(assert (=> b!150953 m!235563))

(declare-fun m!235577 () Bool)

(assert (=> b!150953 m!235577))

(declare-fun m!235579 () Bool)

(assert (=> b!150953 m!235579))

(declare-fun m!235581 () Bool)

(assert (=> b!150939 m!235581))

(declare-fun m!235583 () Bool)

(assert (=> b!150939 m!235583))

(declare-fun m!235585 () Bool)

(assert (=> b!150945 m!235585))

(assert (=> b!150938 m!235511))

(assert (=> b!150938 m!235575))

(declare-fun m!235587 () Bool)

(assert (=> b!150943 m!235587))

(declare-fun m!235589 () Bool)

(assert (=> start!29078 m!235589))

(declare-fun m!235591 () Bool)

(assert (=> start!29078 m!235591))

(declare-fun m!235593 () Bool)

(assert (=> b!150944 m!235593))

(declare-fun m!235595 () Bool)

(assert (=> b!150942 m!235595))

(declare-fun m!235597 () Bool)

(assert (=> b!150948 m!235597))

(declare-fun m!235599 () Bool)

(assert (=> b!150950 m!235599))

(check-sat (not b!150951) (not b!150943) (not b!150939) (not b!150946) (not b!150942) (not b!150937) (not b!150940) (not b!150949) (not b!150945) (not b!150950) (not b!150947) (not b!150948) (not start!29078) (not b!150938) (not b!150944) (not b!150953))
(check-sat)
(get-model)

(declare-fun d!49169 () Bool)

(assert (=> d!49169 (= (invariant!0 (currentBit!6458 thiss!1634) (currentByte!6463 thiss!1634) (size!3050 (buf!3537 thiss!1634))) (and (bvsge (currentBit!6458 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6458 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6463 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6463 thiss!1634) (size!3050 (buf!3537 thiss!1634))) (and (= (currentBit!6458 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6463 thiss!1634) (size!3050 (buf!3537 thiss!1634)))))))))

(assert (=> b!150950 d!49169))

(declare-fun d!49171 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!49171 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236195)))) ((_ sign_extend 32) (currentByte!6463 thiss!1634)) ((_ sign_extend 32) (currentBit!6458 thiss!1634)) lt!236178) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236195)))) ((_ sign_extend 32) (currentByte!6463 thiss!1634)) ((_ sign_extend 32) (currentBit!6458 thiss!1634))) lt!236178))))

(declare-fun bs!12026 () Bool)

(assert (= bs!12026 d!49171))

(declare-fun m!235785 () Bool)

(assert (=> bs!12026 m!235785))

(assert (=> b!150939 d!49171))

(declare-fun d!49175 () Bool)

(assert (=> d!49175 (validate_offset_bits!1 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236195)))) ((_ sign_extend 32) (currentByte!6463 thiss!1634)) ((_ sign_extend 32) (currentBit!6458 thiss!1634)) lt!236178)))

(declare-fun lt!236413 () Unit!9509)

(declare-fun choose!9 (BitStream!5358 array!6742 (_ BitVec 64) BitStream!5358) Unit!9509)

(assert (=> d!49175 (= lt!236413 (choose!9 thiss!1634 (buf!3537 (_2!7115 lt!236195)) lt!236178 (BitStream!5359 (buf!3537 (_2!7115 lt!236195)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634))))))

(assert (=> d!49175 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1634 (buf!3537 (_2!7115 lt!236195)) lt!236178) lt!236413)))

(declare-fun bs!12027 () Bool)

(assert (= bs!12027 d!49175))

(assert (=> bs!12027 m!235581))

(declare-fun m!235793 () Bool)

(assert (=> bs!12027 m!235793))

(assert (=> b!150939 d!49175))

(declare-fun d!49179 () Bool)

(assert (=> d!49179 (= (array_inv!2839 (buf!3537 thiss!1634)) (bvsge (size!3050 (buf!3537 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!150949 d!49179))

(declare-fun d!49183 () Bool)

(declare-fun e!100868 () Bool)

(assert (=> d!49183 e!100868))

(declare-fun res!126653 () Bool)

(assert (=> d!49183 (=> (not res!126653) (not e!100868))))

(declare-fun lt!236436 () (_ BitVec 64))

(declare-fun lt!236437 () (_ BitVec 64))

(declare-fun lt!236441 () (_ BitVec 64))

(assert (=> d!49183 (= res!126653 (= lt!236436 (bvsub lt!236437 lt!236441)))))

(assert (=> d!49183 (or (= (bvand lt!236437 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!236441 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!236437 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!236437 lt!236441) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!49183 (= lt!236441 (remainingBits!0 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236195)))) ((_ sign_extend 32) (currentByte!6463 (_2!7115 lt!236195))) ((_ sign_extend 32) (currentBit!6458 (_2!7115 lt!236195)))))))

(declare-fun lt!236440 () (_ BitVec 64))

(declare-fun lt!236439 () (_ BitVec 64))

(assert (=> d!49183 (= lt!236437 (bvmul lt!236440 lt!236439))))

(assert (=> d!49183 (or (= lt!236440 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!236439 (bvsdiv (bvmul lt!236440 lt!236439) lt!236440)))))

(assert (=> d!49183 (= lt!236439 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!49183 (= lt!236440 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236195)))))))

(assert (=> d!49183 (= lt!236436 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6463 (_2!7115 lt!236195))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6458 (_2!7115 lt!236195)))))))

(assert (=> d!49183 (invariant!0 (currentBit!6458 (_2!7115 lt!236195)) (currentByte!6463 (_2!7115 lt!236195)) (size!3050 (buf!3537 (_2!7115 lt!236195))))))

(assert (=> d!49183 (= (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236195))) (currentByte!6463 (_2!7115 lt!236195)) (currentBit!6458 (_2!7115 lt!236195))) lt!236436)))

(declare-fun b!151048 () Bool)

(declare-fun res!126654 () Bool)

(assert (=> b!151048 (=> (not res!126654) (not e!100868))))

(assert (=> b!151048 (= res!126654 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!236436))))

(declare-fun b!151049 () Bool)

(declare-fun lt!236438 () (_ BitVec 64))

(assert (=> b!151049 (= e!100868 (bvsle lt!236436 (bvmul lt!236438 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!151049 (or (= lt!236438 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!236438 #b0000000000000000000000000000000000000000000000000000000000001000) lt!236438)))))

(assert (=> b!151049 (= lt!236438 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236195)))))))

(assert (= (and d!49183 res!126653) b!151048))

(assert (= (and b!151048 res!126654) b!151049))

(declare-fun m!235801 () Bool)

(assert (=> d!49183 m!235801))

(declare-fun m!235803 () Bool)

(assert (=> d!49183 m!235803))

(assert (=> b!150938 d!49183))

(declare-fun d!49190 () Bool)

(declare-fun e!100869 () Bool)

(assert (=> d!49190 e!100869))

(declare-fun res!126655 () Bool)

(assert (=> d!49190 (=> (not res!126655) (not e!100869))))

(declare-fun lt!236443 () (_ BitVec 64))

(declare-fun lt!236442 () (_ BitVec 64))

(declare-fun lt!236447 () (_ BitVec 64))

(assert (=> d!49190 (= res!126655 (= lt!236442 (bvsub lt!236443 lt!236447)))))

(assert (=> d!49190 (or (= (bvand lt!236443 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!236447 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!236443 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!236443 lt!236447) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!49190 (= lt!236447 (remainingBits!0 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236193)))) ((_ sign_extend 32) (currentByte!6463 (_2!7115 lt!236193))) ((_ sign_extend 32) (currentBit!6458 (_2!7115 lt!236193)))))))

(declare-fun lt!236446 () (_ BitVec 64))

(declare-fun lt!236445 () (_ BitVec 64))

(assert (=> d!49190 (= lt!236443 (bvmul lt!236446 lt!236445))))

(assert (=> d!49190 (or (= lt!236446 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!236445 (bvsdiv (bvmul lt!236446 lt!236445) lt!236446)))))

(assert (=> d!49190 (= lt!236445 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!49190 (= lt!236446 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236193)))))))

(assert (=> d!49190 (= lt!236442 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6463 (_2!7115 lt!236193))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6458 (_2!7115 lt!236193)))))))

(assert (=> d!49190 (invariant!0 (currentBit!6458 (_2!7115 lt!236193)) (currentByte!6463 (_2!7115 lt!236193)) (size!3050 (buf!3537 (_2!7115 lt!236193))))))

(assert (=> d!49190 (= (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236193))) (currentByte!6463 (_2!7115 lt!236193)) (currentBit!6458 (_2!7115 lt!236193))) lt!236442)))

(declare-fun b!151050 () Bool)

(declare-fun res!126656 () Bool)

(assert (=> b!151050 (=> (not res!126656) (not e!100869))))

(assert (=> b!151050 (= res!126656 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!236442))))

(declare-fun b!151051 () Bool)

(declare-fun lt!236444 () (_ BitVec 64))

(assert (=> b!151051 (= e!100869 (bvsle lt!236442 (bvmul lt!236444 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!151051 (or (= lt!236444 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!236444 #b0000000000000000000000000000000000000000000000000000000000001000) lt!236444)))))

(assert (=> b!151051 (= lt!236444 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236193)))))))

(assert (= (and d!49190 res!126655) b!151050))

(assert (= (and b!151050 res!126656) b!151051))

(declare-fun m!235805 () Bool)

(assert (=> d!49190 m!235805))

(declare-fun m!235807 () Bool)

(assert (=> d!49190 m!235807))

(assert (=> b!150938 d!49190))

(declare-fun d!49192 () Bool)

(declare-fun res!126661 () Bool)

(declare-fun e!100874 () Bool)

(assert (=> d!49192 (=> res!126661 e!100874)))

(assert (=> d!49192 (= res!126661 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!49192 (= (arrayRangesEq!366 arr!237 (_2!7116 lt!236188) #b00000000000000000000000000000000 to!404) e!100874)))

(declare-fun b!151056 () Bool)

(declare-fun e!100875 () Bool)

(assert (=> b!151056 (= e!100874 e!100875)))

(declare-fun res!126662 () Bool)

(assert (=> b!151056 (=> (not res!126662) (not e!100875))))

(assert (=> b!151056 (= res!126662 (= (select (arr!3852 arr!237) #b00000000000000000000000000000000) (select (arr!3852 (_2!7116 lt!236188)) #b00000000000000000000000000000000)))))

(declare-fun b!151057 () Bool)

(assert (=> b!151057 (= e!100875 (arrayRangesEq!366 arr!237 (_2!7116 lt!236188) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!49192 (not res!126661)) b!151056))

(assert (= (and b!151056 res!126662) b!151057))

(declare-fun m!235809 () Bool)

(assert (=> b!151056 m!235809))

(declare-fun m!235811 () Bool)

(assert (=> b!151056 m!235811))

(declare-fun m!235813 () Bool)

(assert (=> b!151057 m!235813))

(assert (=> b!150948 d!49192))

(assert (=> b!150937 d!49190))

(declare-fun d!49194 () Bool)

(declare-fun e!100876 () Bool)

(assert (=> d!49194 e!100876))

(declare-fun res!126663 () Bool)

(assert (=> d!49194 (=> (not res!126663) (not e!100876))))

(declare-fun lt!236448 () (_ BitVec 64))

(declare-fun lt!236449 () (_ BitVec 64))

(declare-fun lt!236453 () (_ BitVec 64))

(assert (=> d!49194 (= res!126663 (= lt!236448 (bvsub lt!236449 lt!236453)))))

(assert (=> d!49194 (or (= (bvand lt!236449 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!236453 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!236449 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!236449 lt!236453) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!49194 (= lt!236453 (remainingBits!0 ((_ sign_extend 32) (size!3050 (buf!3537 thiss!1634))) ((_ sign_extend 32) (currentByte!6463 thiss!1634)) ((_ sign_extend 32) (currentBit!6458 thiss!1634))))))

(declare-fun lt!236452 () (_ BitVec 64))

(declare-fun lt!236451 () (_ BitVec 64))

(assert (=> d!49194 (= lt!236449 (bvmul lt!236452 lt!236451))))

(assert (=> d!49194 (or (= lt!236452 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!236451 (bvsdiv (bvmul lt!236452 lt!236451) lt!236452)))))

(assert (=> d!49194 (= lt!236451 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!49194 (= lt!236452 ((_ sign_extend 32) (size!3050 (buf!3537 thiss!1634))))))

(assert (=> d!49194 (= lt!236448 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6463 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6458 thiss!1634))))))

(assert (=> d!49194 (invariant!0 (currentBit!6458 thiss!1634) (currentByte!6463 thiss!1634) (size!3050 (buf!3537 thiss!1634)))))

(assert (=> d!49194 (= (bitIndex!0 (size!3050 (buf!3537 thiss!1634)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634)) lt!236448)))

(declare-fun b!151058 () Bool)

(declare-fun res!126664 () Bool)

(assert (=> b!151058 (=> (not res!126664) (not e!100876))))

(assert (=> b!151058 (= res!126664 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!236448))))

(declare-fun b!151059 () Bool)

(declare-fun lt!236450 () (_ BitVec 64))

(assert (=> b!151059 (= e!100876 (bvsle lt!236448 (bvmul lt!236450 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!151059 (or (= lt!236450 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!236450 #b0000000000000000000000000000000000000000000000000000000000001000) lt!236450)))))

(assert (=> b!151059 (= lt!236450 ((_ sign_extend 32) (size!3050 (buf!3537 thiss!1634))))))

(assert (= (and d!49194 res!126663) b!151058))

(assert (= (and b!151058 res!126664) b!151059))

(declare-fun m!235815 () Bool)

(assert (=> d!49194 m!235815))

(assert (=> d!49194 m!235599))

(assert (=> b!150937 d!49194))

(declare-datatypes ((tuple3!596 0))(
  ( (tuple3!597 (_1!7125 Unit!9509) (_2!7125 BitStream!5358) (_3!371 array!6742)) )
))
(declare-fun lt!236468 () tuple3!596)

(declare-fun d!49196 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!5358 array!6742 (_ BitVec 32) (_ BitVec 32)) tuple3!596)

(assert (=> d!49196 (= lt!236468 (readByteArrayLoop!0 (_1!7117 lt!236187) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!49196 (= (readByteArrayLoopPure!0 (_1!7117 lt!236187) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13493 (_2!7125 lt!236468) (_3!371 lt!236468)))))

(declare-fun bs!12031 () Bool)

(assert (= bs!12031 d!49196))

(declare-fun m!235819 () Bool)

(assert (=> bs!12031 m!235819))

(assert (=> b!150947 d!49196))

(declare-fun d!49198 () Bool)

(assert (=> d!49198 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236195)))) ((_ sign_extend 32) (currentByte!6463 (_2!7115 lt!236193))) ((_ sign_extend 32) (currentBit!6458 (_2!7115 lt!236193))) lt!236180) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236195)))) ((_ sign_extend 32) (currentByte!6463 (_2!7115 lt!236193))) ((_ sign_extend 32) (currentBit!6458 (_2!7115 lt!236193)))) lt!236180))))

(declare-fun bs!12032 () Bool)

(assert (= bs!12032 d!49198))

(declare-fun m!235825 () Bool)

(assert (=> bs!12032 m!235825))

(assert (=> b!150947 d!49198))

(declare-fun d!49200 () Bool)

(assert (=> d!49200 (validate_offset_bits!1 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236195)))) ((_ sign_extend 32) (currentByte!6463 (_2!7115 lt!236193))) ((_ sign_extend 32) (currentBit!6458 (_2!7115 lt!236193))) lt!236180)))

(declare-fun lt!236469 () Unit!9509)

(assert (=> d!49200 (= lt!236469 (choose!9 (_2!7115 lt!236193) (buf!3537 (_2!7115 lt!236195)) lt!236180 (BitStream!5359 (buf!3537 (_2!7115 lt!236195)) (currentByte!6463 (_2!7115 lt!236193)) (currentBit!6458 (_2!7115 lt!236193)))))))

(assert (=> d!49200 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!7115 lt!236193) (buf!3537 (_2!7115 lt!236195)) lt!236180) lt!236469)))

(declare-fun bs!12034 () Bool)

(assert (= bs!12034 d!49200))

(assert (=> bs!12034 m!235571))

(declare-fun m!235829 () Bool)

(assert (=> bs!12034 m!235829))

(assert (=> b!150947 d!49200))

(declare-fun b!151091 () Bool)

(declare-fun e!100895 () Unit!9509)

(declare-fun lt!236569 () Unit!9509)

(assert (=> b!151091 (= e!100895 lt!236569)))

(declare-fun lt!236568 () (_ BitVec 64))

(assert (=> b!151091 (= lt!236568 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!236562 () (_ BitVec 64))

(assert (=> b!151091 (= lt!236562 (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236193))) (currentByte!6463 (_2!7115 lt!236193)) (currentBit!6458 (_2!7115 lt!236193))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6742 array!6742 (_ BitVec 64) (_ BitVec 64)) Unit!9509)

(assert (=> b!151091 (= lt!236569 (arrayBitRangesEqSymmetric!0 (buf!3537 (_2!7115 lt!236193)) (buf!3537 (_2!7115 lt!236195)) lt!236568 lt!236562))))

(declare-fun arrayBitRangesEq!0 (array!6742 array!6742 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!151091 (arrayBitRangesEq!0 (buf!3537 (_2!7115 lt!236195)) (buf!3537 (_2!7115 lt!236193)) lt!236568 lt!236562)))

(declare-fun d!49206 () Bool)

(declare-fun e!100896 () Bool)

(assert (=> d!49206 e!100896))

(declare-fun res!126690 () Bool)

(assert (=> d!49206 (=> (not res!126690) (not e!100896))))

(declare-fun lt!236557 () tuple2!13494)

(assert (=> d!49206 (= res!126690 (isPrefixOf!0 (_1!7117 lt!236557) (_2!7117 lt!236557)))))

(declare-fun lt!236572 () BitStream!5358)

(assert (=> d!49206 (= lt!236557 (tuple2!13495 lt!236572 (_2!7115 lt!236195)))))

(declare-fun lt!236558 () Unit!9509)

(declare-fun lt!236570 () Unit!9509)

(assert (=> d!49206 (= lt!236558 lt!236570)))

(assert (=> d!49206 (isPrefixOf!0 lt!236572 (_2!7115 lt!236195))))

(assert (=> d!49206 (= lt!236570 (lemmaIsPrefixTransitive!0 lt!236572 (_2!7115 lt!236195) (_2!7115 lt!236195)))))

(declare-fun lt!236561 () Unit!9509)

(declare-fun lt!236575 () Unit!9509)

(assert (=> d!49206 (= lt!236561 lt!236575)))

(assert (=> d!49206 (isPrefixOf!0 lt!236572 (_2!7115 lt!236195))))

(assert (=> d!49206 (= lt!236575 (lemmaIsPrefixTransitive!0 lt!236572 (_2!7115 lt!236193) (_2!7115 lt!236195)))))

(declare-fun lt!236563 () Unit!9509)

(assert (=> d!49206 (= lt!236563 e!100895)))

(declare-fun c!8079 () Bool)

(assert (=> d!49206 (= c!8079 (not (= (size!3050 (buf!3537 (_2!7115 lt!236193))) #b00000000000000000000000000000000)))))

(declare-fun lt!236566 () Unit!9509)

(declare-fun lt!236564 () Unit!9509)

(assert (=> d!49206 (= lt!236566 lt!236564)))

(assert (=> d!49206 (isPrefixOf!0 (_2!7115 lt!236195) (_2!7115 lt!236195))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5358) Unit!9509)

(assert (=> d!49206 (= lt!236564 (lemmaIsPrefixRefl!0 (_2!7115 lt!236195)))))

(declare-fun lt!236574 () Unit!9509)

(declare-fun lt!236565 () Unit!9509)

(assert (=> d!49206 (= lt!236574 lt!236565)))

(assert (=> d!49206 (= lt!236565 (lemmaIsPrefixRefl!0 (_2!7115 lt!236195)))))

(declare-fun lt!236573 () Unit!9509)

(declare-fun lt!236571 () Unit!9509)

(assert (=> d!49206 (= lt!236573 lt!236571)))

(assert (=> d!49206 (isPrefixOf!0 lt!236572 lt!236572)))

(assert (=> d!49206 (= lt!236571 (lemmaIsPrefixRefl!0 lt!236572))))

(declare-fun lt!236559 () Unit!9509)

(declare-fun lt!236556 () Unit!9509)

(assert (=> d!49206 (= lt!236559 lt!236556)))

(assert (=> d!49206 (isPrefixOf!0 (_2!7115 lt!236193) (_2!7115 lt!236193))))

(assert (=> d!49206 (= lt!236556 (lemmaIsPrefixRefl!0 (_2!7115 lt!236193)))))

(assert (=> d!49206 (= lt!236572 (BitStream!5359 (buf!3537 (_2!7115 lt!236195)) (currentByte!6463 (_2!7115 lt!236193)) (currentBit!6458 (_2!7115 lt!236193))))))

(assert (=> d!49206 (isPrefixOf!0 (_2!7115 lt!236193) (_2!7115 lt!236195))))

(assert (=> d!49206 (= (reader!0 (_2!7115 lt!236193) (_2!7115 lt!236195)) lt!236557)))

(declare-fun b!151092 () Bool)

(declare-fun Unit!9516 () Unit!9509)

(assert (=> b!151092 (= e!100895 Unit!9516)))

(declare-fun b!151093 () Bool)

(declare-fun res!126692 () Bool)

(assert (=> b!151093 (=> (not res!126692) (not e!100896))))

(assert (=> b!151093 (= res!126692 (isPrefixOf!0 (_2!7117 lt!236557) (_2!7115 lt!236195)))))

(declare-fun b!151094 () Bool)

(declare-fun lt!236567 () (_ BitVec 64))

(declare-fun lt!236560 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!5358 (_ BitVec 64)) BitStream!5358)

(assert (=> b!151094 (= e!100896 (= (_1!7117 lt!236557) (withMovedBitIndex!0 (_2!7117 lt!236557) (bvsub lt!236567 lt!236560))))))

(assert (=> b!151094 (or (= (bvand lt!236567 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!236560 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!236567 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!236567 lt!236560) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!151094 (= lt!236560 (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236195))) (currentByte!6463 (_2!7115 lt!236195)) (currentBit!6458 (_2!7115 lt!236195))))))

(assert (=> b!151094 (= lt!236567 (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236193))) (currentByte!6463 (_2!7115 lt!236193)) (currentBit!6458 (_2!7115 lt!236193))))))

(declare-fun b!151095 () Bool)

(declare-fun res!126691 () Bool)

(assert (=> b!151095 (=> (not res!126691) (not e!100896))))

(assert (=> b!151095 (= res!126691 (isPrefixOf!0 (_1!7117 lt!236557) (_2!7115 lt!236193)))))

(assert (= (and d!49206 c!8079) b!151091))

(assert (= (and d!49206 (not c!8079)) b!151092))

(assert (= (and d!49206 res!126690) b!151095))

(assert (= (and b!151095 res!126691) b!151093))

(assert (= (and b!151093 res!126692) b!151094))

(declare-fun m!235881 () Bool)

(assert (=> b!151094 m!235881))

(assert (=> b!151094 m!235511))

(assert (=> b!151094 m!235575))

(declare-fun m!235883 () Bool)

(assert (=> b!151093 m!235883))

(declare-fun m!235885 () Bool)

(assert (=> d!49206 m!235885))

(declare-fun m!235887 () Bool)

(assert (=> d!49206 m!235887))

(declare-fun m!235889 () Bool)

(assert (=> d!49206 m!235889))

(assert (=> d!49206 m!235585))

(declare-fun m!235891 () Bool)

(assert (=> d!49206 m!235891))

(declare-fun m!235893 () Bool)

(assert (=> d!49206 m!235893))

(declare-fun m!235895 () Bool)

(assert (=> d!49206 m!235895))

(declare-fun m!235897 () Bool)

(assert (=> d!49206 m!235897))

(declare-fun m!235899 () Bool)

(assert (=> d!49206 m!235899))

(declare-fun m!235901 () Bool)

(assert (=> d!49206 m!235901))

(declare-fun m!235903 () Bool)

(assert (=> d!49206 m!235903))

(assert (=> b!151091 m!235575))

(declare-fun m!235905 () Bool)

(assert (=> b!151091 m!235905))

(declare-fun m!235907 () Bool)

(assert (=> b!151091 m!235907))

(declare-fun m!235909 () Bool)

(assert (=> b!151095 m!235909))

(assert (=> b!150947 d!49206))

(declare-fun d!49228 () Bool)

(declare-fun res!126693 () Bool)

(declare-fun e!100897 () Bool)

(assert (=> d!49228 (=> res!126693 e!100897)))

(assert (=> d!49228 (= res!126693 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!49228 (= (arrayRangesEq!366 arr!237 (_2!7116 lt!236179) #b00000000000000000000000000000000 to!404) e!100897)))

(declare-fun b!151096 () Bool)

(declare-fun e!100898 () Bool)

(assert (=> b!151096 (= e!100897 e!100898)))

(declare-fun res!126694 () Bool)

(assert (=> b!151096 (=> (not res!126694) (not e!100898))))

(assert (=> b!151096 (= res!126694 (= (select (arr!3852 arr!237) #b00000000000000000000000000000000) (select (arr!3852 (_2!7116 lt!236179)) #b00000000000000000000000000000000)))))

(declare-fun b!151097 () Bool)

(assert (=> b!151097 (= e!100898 (arrayRangesEq!366 arr!237 (_2!7116 lt!236179) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!49228 (not res!126693)) b!151096))

(assert (= (and b!151096 res!126694) b!151097))

(assert (=> b!151096 m!235809))

(declare-fun m!235911 () Bool)

(assert (=> b!151096 m!235911))

(declare-fun m!235913 () Bool)

(assert (=> b!151097 m!235913))

(assert (=> b!150946 d!49228))

(declare-fun d!49230 () Bool)

(assert (=> d!49230 (arrayRangesEq!366 arr!237 (_2!7116 lt!236179) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!236578 () Unit!9509)

(declare-fun choose!98 (array!6742 array!6742 array!6742 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9509)

(assert (=> d!49230 (= lt!236578 (choose!98 arr!237 (_2!7116 lt!236199) (_2!7116 lt!236179) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> d!49230 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 to!404) (bvsle to!404 to!404))))

(assert (=> d!49230 (= (arrayRangesEqTransitive!81 arr!237 (_2!7116 lt!236199) (_2!7116 lt!236179) #b00000000000000000000000000000000 to!404 to!404) lt!236578)))

(declare-fun bs!12040 () Bool)

(assert (= bs!12040 d!49230))

(assert (=> bs!12040 m!235503))

(declare-fun m!235915 () Bool)

(assert (=> bs!12040 m!235915))

(assert (=> b!150946 d!49230))

(declare-fun d!49232 () Bool)

(declare-fun res!126695 () Bool)

(declare-fun e!100899 () Bool)

(assert (=> d!49232 (=> res!126695 e!100899)))

(assert (=> d!49232 (= res!126695 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!49232 (= (arrayRangesEq!366 (_2!7116 lt!236199) (_2!7116 lt!236179) #b00000000000000000000000000000000 to!404) e!100899)))

(declare-fun b!151098 () Bool)

(declare-fun e!100900 () Bool)

(assert (=> b!151098 (= e!100899 e!100900)))

(declare-fun res!126696 () Bool)

(assert (=> b!151098 (=> (not res!126696) (not e!100900))))

(assert (=> b!151098 (= res!126696 (= (select (arr!3852 (_2!7116 lt!236199)) #b00000000000000000000000000000000) (select (arr!3852 (_2!7116 lt!236179)) #b00000000000000000000000000000000)))))

(declare-fun b!151099 () Bool)

(assert (=> b!151099 (= e!100900 (arrayRangesEq!366 (_2!7116 lt!236199) (_2!7116 lt!236179) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!49232 (not res!126695)) b!151098))

(assert (= (and b!151098 res!126696) b!151099))

(declare-fun m!235917 () Bool)

(assert (=> b!151098 m!235917))

(assert (=> b!151098 m!235911))

(declare-fun m!235919 () Bool)

(assert (=> b!151099 m!235919))

(assert (=> b!150946 d!49232))

(declare-fun d!49234 () Bool)

(assert (=> d!49234 (arrayRangesEq!366 (_2!7116 lt!236199) (_2!7116 lt!236179) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!236581 () Unit!9509)

(declare-fun choose!99 (array!6742 array!6742 (_ BitVec 32) (_ BitVec 32)) Unit!9509)

(assert (=> d!49234 (= lt!236581 (choose!99 (_2!7116 lt!236179) (_2!7116 lt!236199) #b00000000000000000000000000000000 to!404))))

(assert (=> d!49234 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 to!404) (bvsle to!404 (size!3050 (_2!7116 lt!236179))))))

(assert (=> d!49234 (= (arrayRangesEqSymmetricLemma!98 (_2!7116 lt!236179) (_2!7116 lt!236199) #b00000000000000000000000000000000 to!404) lt!236581)))

(declare-fun bs!12041 () Bool)

(assert (= bs!12041 d!49234))

(assert (=> bs!12041 m!235507))

(declare-fun m!235921 () Bool)

(assert (=> bs!12041 m!235921))

(assert (=> b!150946 d!49234))

(declare-fun d!49236 () Bool)

(declare-fun res!126703 () Bool)

(declare-fun e!100906 () Bool)

(assert (=> d!49236 (=> (not res!126703) (not e!100906))))

(assert (=> d!49236 (= res!126703 (= (size!3050 (buf!3537 (_2!7115 lt!236193))) (size!3050 (buf!3537 (_2!7115 lt!236195)))))))

(assert (=> d!49236 (= (isPrefixOf!0 (_2!7115 lt!236193) (_2!7115 lt!236195)) e!100906)))

(declare-fun b!151106 () Bool)

(declare-fun res!126705 () Bool)

(assert (=> b!151106 (=> (not res!126705) (not e!100906))))

(assert (=> b!151106 (= res!126705 (bvsle (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236193))) (currentByte!6463 (_2!7115 lt!236193)) (currentBit!6458 (_2!7115 lt!236193))) (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236195))) (currentByte!6463 (_2!7115 lt!236195)) (currentBit!6458 (_2!7115 lt!236195)))))))

(declare-fun b!151107 () Bool)

(declare-fun e!100905 () Bool)

(assert (=> b!151107 (= e!100906 e!100905)))

(declare-fun res!126704 () Bool)

(assert (=> b!151107 (=> res!126704 e!100905)))

(assert (=> b!151107 (= res!126704 (= (size!3050 (buf!3537 (_2!7115 lt!236193))) #b00000000000000000000000000000000))))

(declare-fun b!151108 () Bool)

(assert (=> b!151108 (= e!100905 (arrayBitRangesEq!0 (buf!3537 (_2!7115 lt!236193)) (buf!3537 (_2!7115 lt!236195)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236193))) (currentByte!6463 (_2!7115 lt!236193)) (currentBit!6458 (_2!7115 lt!236193)))))))

(assert (= (and d!49236 res!126703) b!151106))

(assert (= (and b!151106 res!126705) b!151107))

(assert (= (and b!151107 (not res!126704)) b!151108))

(assert (=> b!151106 m!235575))

(assert (=> b!151106 m!235511))

(assert (=> b!151108 m!235575))

(assert (=> b!151108 m!235575))

(declare-fun m!235923 () Bool)

(assert (=> b!151108 m!235923))

(assert (=> b!150945 d!49236))

(declare-fun d!49238 () Bool)

(assert (=> d!49238 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3050 (buf!3537 thiss!1634))) ((_ sign_extend 32) (currentByte!6463 thiss!1634)) ((_ sign_extend 32) (currentBit!6458 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3050 (buf!3537 thiss!1634))) ((_ sign_extend 32) (currentByte!6463 thiss!1634)) ((_ sign_extend 32) (currentBit!6458 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12042 () Bool)

(assert (= bs!12042 d!49238))

(assert (=> bs!12042 m!235815))

(assert (=> b!150944 d!49238))

(declare-fun d!49240 () Bool)

(declare-fun res!126706 () Bool)

(declare-fun e!100908 () Bool)

(assert (=> d!49240 (=> (not res!126706) (not e!100908))))

(assert (=> d!49240 (= res!126706 (= (size!3050 (buf!3537 thiss!1634)) (size!3050 (buf!3537 (_2!7115 lt!236193)))))))

(assert (=> d!49240 (= (isPrefixOf!0 thiss!1634 (_2!7115 lt!236193)) e!100908)))

(declare-fun b!151111 () Bool)

(declare-fun res!126708 () Bool)

(assert (=> b!151111 (=> (not res!126708) (not e!100908))))

(assert (=> b!151111 (= res!126708 (bvsle (bitIndex!0 (size!3050 (buf!3537 thiss!1634)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634)) (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236193))) (currentByte!6463 (_2!7115 lt!236193)) (currentBit!6458 (_2!7115 lt!236193)))))))

(declare-fun b!151112 () Bool)

(declare-fun e!100907 () Bool)

(assert (=> b!151112 (= e!100908 e!100907)))

(declare-fun res!126707 () Bool)

(assert (=> b!151112 (=> res!126707 e!100907)))

(assert (=> b!151112 (= res!126707 (= (size!3050 (buf!3537 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!151113 () Bool)

(assert (=> b!151113 (= e!100907 (arrayBitRangesEq!0 (buf!3537 thiss!1634) (buf!3537 (_2!7115 lt!236193)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3050 (buf!3537 thiss!1634)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634))))))

(assert (= (and d!49240 res!126706) b!151111))

(assert (= (and b!151111 res!126708) b!151112))

(assert (= (and b!151112 (not res!126707)) b!151113))

(assert (=> b!151111 m!235513))

(assert (=> b!151111 m!235575))

(assert (=> b!151113 m!235513))

(assert (=> b!151113 m!235513))

(declare-fun m!235925 () Bool)

(assert (=> b!151113 m!235925))

(assert (=> b!150943 d!49240))

(declare-fun d!49242 () Bool)

(declare-datatypes ((tuple2!13508 0))(
  ( (tuple2!13509 (_1!7126 (_ BitVec 8)) (_2!7126 BitStream!5358)) )
))
(declare-fun lt!236624 () tuple2!13508)

(declare-fun readByte!0 (BitStream!5358) tuple2!13508)

(assert (=> d!49242 (= lt!236624 (readByte!0 (_1!7117 lt!236186)))))

(assert (=> d!49242 (= (readBytePure!0 (_1!7117 lt!236186)) (tuple2!13497 (_2!7126 lt!236624) (_1!7126 lt!236624)))))

(declare-fun bs!12043 () Bool)

(assert (= bs!12043 d!49242))

(declare-fun m!235927 () Bool)

(assert (=> bs!12043 m!235927))

(assert (=> b!150953 d!49242))

(declare-fun b!151122 () Bool)

(declare-fun e!100913 () Unit!9509)

(declare-fun lt!236638 () Unit!9509)

(assert (=> b!151122 (= e!100913 lt!236638)))

(declare-fun lt!236637 () (_ BitVec 64))

(assert (=> b!151122 (= lt!236637 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!236631 () (_ BitVec 64))

(assert (=> b!151122 (= lt!236631 (bitIndex!0 (size!3050 (buf!3537 thiss!1634)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634)))))

(assert (=> b!151122 (= lt!236638 (arrayBitRangesEqSymmetric!0 (buf!3537 thiss!1634) (buf!3537 (_2!7115 lt!236193)) lt!236637 lt!236631))))

(assert (=> b!151122 (arrayBitRangesEq!0 (buf!3537 (_2!7115 lt!236193)) (buf!3537 thiss!1634) lt!236637 lt!236631)))

(declare-fun d!49244 () Bool)

(declare-fun e!100914 () Bool)

(assert (=> d!49244 e!100914))

(declare-fun res!126715 () Bool)

(assert (=> d!49244 (=> (not res!126715) (not e!100914))))

(declare-fun lt!236626 () tuple2!13494)

(assert (=> d!49244 (= res!126715 (isPrefixOf!0 (_1!7117 lt!236626) (_2!7117 lt!236626)))))

(declare-fun lt!236641 () BitStream!5358)

(assert (=> d!49244 (= lt!236626 (tuple2!13495 lt!236641 (_2!7115 lt!236193)))))

(declare-fun lt!236627 () Unit!9509)

(declare-fun lt!236639 () Unit!9509)

(assert (=> d!49244 (= lt!236627 lt!236639)))

(assert (=> d!49244 (isPrefixOf!0 lt!236641 (_2!7115 lt!236193))))

(assert (=> d!49244 (= lt!236639 (lemmaIsPrefixTransitive!0 lt!236641 (_2!7115 lt!236193) (_2!7115 lt!236193)))))

(declare-fun lt!236630 () Unit!9509)

(declare-fun lt!236644 () Unit!9509)

(assert (=> d!49244 (= lt!236630 lt!236644)))

(assert (=> d!49244 (isPrefixOf!0 lt!236641 (_2!7115 lt!236193))))

(assert (=> d!49244 (= lt!236644 (lemmaIsPrefixTransitive!0 lt!236641 thiss!1634 (_2!7115 lt!236193)))))

(declare-fun lt!236632 () Unit!9509)

(assert (=> d!49244 (= lt!236632 e!100913)))

(declare-fun c!8082 () Bool)

(assert (=> d!49244 (= c!8082 (not (= (size!3050 (buf!3537 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!236635 () Unit!9509)

(declare-fun lt!236633 () Unit!9509)

(assert (=> d!49244 (= lt!236635 lt!236633)))

(assert (=> d!49244 (isPrefixOf!0 (_2!7115 lt!236193) (_2!7115 lt!236193))))

(assert (=> d!49244 (= lt!236633 (lemmaIsPrefixRefl!0 (_2!7115 lt!236193)))))

(declare-fun lt!236643 () Unit!9509)

(declare-fun lt!236634 () Unit!9509)

(assert (=> d!49244 (= lt!236643 lt!236634)))

(assert (=> d!49244 (= lt!236634 (lemmaIsPrefixRefl!0 (_2!7115 lt!236193)))))

(declare-fun lt!236642 () Unit!9509)

(declare-fun lt!236640 () Unit!9509)

(assert (=> d!49244 (= lt!236642 lt!236640)))

(assert (=> d!49244 (isPrefixOf!0 lt!236641 lt!236641)))

(assert (=> d!49244 (= lt!236640 (lemmaIsPrefixRefl!0 lt!236641))))

(declare-fun lt!236628 () Unit!9509)

(declare-fun lt!236625 () Unit!9509)

(assert (=> d!49244 (= lt!236628 lt!236625)))

(assert (=> d!49244 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!49244 (= lt!236625 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!49244 (= lt!236641 (BitStream!5359 (buf!3537 (_2!7115 lt!236193)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634)))))

(assert (=> d!49244 (isPrefixOf!0 thiss!1634 (_2!7115 lt!236193))))

(assert (=> d!49244 (= (reader!0 thiss!1634 (_2!7115 lt!236193)) lt!236626)))

(declare-fun b!151123 () Bool)

(declare-fun Unit!9517 () Unit!9509)

(assert (=> b!151123 (= e!100913 Unit!9517)))

(declare-fun b!151124 () Bool)

(declare-fun res!126717 () Bool)

(assert (=> b!151124 (=> (not res!126717) (not e!100914))))

(assert (=> b!151124 (= res!126717 (isPrefixOf!0 (_2!7117 lt!236626) (_2!7115 lt!236193)))))

(declare-fun lt!236629 () (_ BitVec 64))

(declare-fun b!151125 () Bool)

(declare-fun lt!236636 () (_ BitVec 64))

(assert (=> b!151125 (= e!100914 (= (_1!7117 lt!236626) (withMovedBitIndex!0 (_2!7117 lt!236626) (bvsub lt!236636 lt!236629))))))

(assert (=> b!151125 (or (= (bvand lt!236636 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!236629 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!236636 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!236636 lt!236629) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!151125 (= lt!236629 (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236193))) (currentByte!6463 (_2!7115 lt!236193)) (currentBit!6458 (_2!7115 lt!236193))))))

(assert (=> b!151125 (= lt!236636 (bitIndex!0 (size!3050 (buf!3537 thiss!1634)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634)))))

(declare-fun b!151126 () Bool)

(declare-fun res!126716 () Bool)

(assert (=> b!151126 (=> (not res!126716) (not e!100914))))

(assert (=> b!151126 (= res!126716 (isPrefixOf!0 (_1!7117 lt!236626) thiss!1634))))

(assert (= (and d!49244 c!8082) b!151122))

(assert (= (and d!49244 (not c!8082)) b!151123))

(assert (= (and d!49244 res!126715) b!151126))

(assert (= (and b!151126 res!126716) b!151124))

(assert (= (and b!151124 res!126717) b!151125))

(declare-fun m!235929 () Bool)

(assert (=> b!151125 m!235929))

(assert (=> b!151125 m!235575))

(assert (=> b!151125 m!235513))

(declare-fun m!235931 () Bool)

(assert (=> b!151124 m!235931))

(declare-fun m!235933 () Bool)

(assert (=> d!49244 m!235933))

(declare-fun m!235935 () Bool)

(assert (=> d!49244 m!235935))

(declare-fun m!235937 () Bool)

(assert (=> d!49244 m!235937))

(assert (=> d!49244 m!235587))

(declare-fun m!235939 () Bool)

(assert (=> d!49244 m!235939))

(declare-fun m!235941 () Bool)

(assert (=> d!49244 m!235941))

(declare-fun m!235943 () Bool)

(assert (=> d!49244 m!235943))

(declare-fun m!235945 () Bool)

(assert (=> d!49244 m!235945))

(assert (=> d!49244 m!235895))

(declare-fun m!235947 () Bool)

(assert (=> d!49244 m!235947))

(assert (=> d!49244 m!235885))

(assert (=> b!151122 m!235513))

(declare-fun m!235949 () Bool)

(assert (=> b!151122 m!235949))

(declare-fun m!235951 () Bool)

(assert (=> b!151122 m!235951))

(declare-fun m!235953 () Bool)

(assert (=> b!151126 m!235953))

(assert (=> b!150953 d!49244))

(declare-fun d!49246 () Bool)

(assert (=> d!49246 (= (invariant!0 (currentBit!6458 thiss!1634) (currentByte!6463 thiss!1634) (size!3050 (buf!3537 (_2!7115 lt!236193)))) (and (bvsge (currentBit!6458 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6458 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6463 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6463 thiss!1634) (size!3050 (buf!3537 (_2!7115 lt!236193)))) (and (= (currentBit!6458 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6463 thiss!1634) (size!3050 (buf!3537 (_2!7115 lt!236193))))))))))

(assert (=> b!150942 d!49246))

(assert (=> b!150951 d!49183))

(assert (=> b!150951 d!49194))

(declare-fun d!49248 () Bool)

(assert (=> d!49248 (= (array_inv!2839 arr!237) (bvsge (size!3050 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!29078 d!49248))

(declare-fun d!49250 () Bool)

(assert (=> d!49250 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6458 thiss!1634) (currentByte!6463 thiss!1634) (size!3050 (buf!3537 thiss!1634))))))

(declare-fun bs!12044 () Bool)

(assert (= bs!12044 d!49250))

(assert (=> bs!12044 m!235599))

(assert (=> start!29078 d!49250))

(declare-fun lt!236645 () tuple3!596)

(declare-fun d!49252 () Bool)

(assert (=> d!49252 (= lt!236645 (readByteArrayLoop!0 (_1!7117 lt!236181) lt!236176 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!49252 (= (readByteArrayLoopPure!0 (_1!7117 lt!236181) lt!236176 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13493 (_2!7125 lt!236645) (_3!371 lt!236645)))))

(declare-fun bs!12045 () Bool)

(assert (= bs!12045 d!49252))

(declare-fun m!235955 () Bool)

(assert (=> bs!12045 m!235955))

(assert (=> b!150940 d!49252))

(declare-fun b!151127 () Bool)

(declare-fun e!100915 () Unit!9509)

(declare-fun lt!236659 () Unit!9509)

(assert (=> b!151127 (= e!100915 lt!236659)))

(declare-fun lt!236658 () (_ BitVec 64))

(assert (=> b!151127 (= lt!236658 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!236652 () (_ BitVec 64))

(assert (=> b!151127 (= lt!236652 (bitIndex!0 (size!3050 (buf!3537 thiss!1634)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634)))))

(assert (=> b!151127 (= lt!236659 (arrayBitRangesEqSymmetric!0 (buf!3537 thiss!1634) (buf!3537 (_2!7115 lt!236195)) lt!236658 lt!236652))))

(assert (=> b!151127 (arrayBitRangesEq!0 (buf!3537 (_2!7115 lt!236195)) (buf!3537 thiss!1634) lt!236658 lt!236652)))

(declare-fun d!49254 () Bool)

(declare-fun e!100916 () Bool)

(assert (=> d!49254 e!100916))

(declare-fun res!126718 () Bool)

(assert (=> d!49254 (=> (not res!126718) (not e!100916))))

(declare-fun lt!236647 () tuple2!13494)

(assert (=> d!49254 (= res!126718 (isPrefixOf!0 (_1!7117 lt!236647) (_2!7117 lt!236647)))))

(declare-fun lt!236662 () BitStream!5358)

(assert (=> d!49254 (= lt!236647 (tuple2!13495 lt!236662 (_2!7115 lt!236195)))))

(declare-fun lt!236648 () Unit!9509)

(declare-fun lt!236660 () Unit!9509)

(assert (=> d!49254 (= lt!236648 lt!236660)))

(assert (=> d!49254 (isPrefixOf!0 lt!236662 (_2!7115 lt!236195))))

(assert (=> d!49254 (= lt!236660 (lemmaIsPrefixTransitive!0 lt!236662 (_2!7115 lt!236195) (_2!7115 lt!236195)))))

(declare-fun lt!236651 () Unit!9509)

(declare-fun lt!236665 () Unit!9509)

(assert (=> d!49254 (= lt!236651 lt!236665)))

(assert (=> d!49254 (isPrefixOf!0 lt!236662 (_2!7115 lt!236195))))

(assert (=> d!49254 (= lt!236665 (lemmaIsPrefixTransitive!0 lt!236662 thiss!1634 (_2!7115 lt!236195)))))

(declare-fun lt!236653 () Unit!9509)

(assert (=> d!49254 (= lt!236653 e!100915)))

(declare-fun c!8083 () Bool)

(assert (=> d!49254 (= c!8083 (not (= (size!3050 (buf!3537 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!236656 () Unit!9509)

(declare-fun lt!236654 () Unit!9509)

(assert (=> d!49254 (= lt!236656 lt!236654)))

(assert (=> d!49254 (isPrefixOf!0 (_2!7115 lt!236195) (_2!7115 lt!236195))))

(assert (=> d!49254 (= lt!236654 (lemmaIsPrefixRefl!0 (_2!7115 lt!236195)))))

(declare-fun lt!236664 () Unit!9509)

(declare-fun lt!236655 () Unit!9509)

(assert (=> d!49254 (= lt!236664 lt!236655)))

(assert (=> d!49254 (= lt!236655 (lemmaIsPrefixRefl!0 (_2!7115 lt!236195)))))

(declare-fun lt!236663 () Unit!9509)

(declare-fun lt!236661 () Unit!9509)

(assert (=> d!49254 (= lt!236663 lt!236661)))

(assert (=> d!49254 (isPrefixOf!0 lt!236662 lt!236662)))

(assert (=> d!49254 (= lt!236661 (lemmaIsPrefixRefl!0 lt!236662))))

(declare-fun lt!236649 () Unit!9509)

(declare-fun lt!236646 () Unit!9509)

(assert (=> d!49254 (= lt!236649 lt!236646)))

(assert (=> d!49254 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!49254 (= lt!236646 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!49254 (= lt!236662 (BitStream!5359 (buf!3537 (_2!7115 lt!236195)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634)))))

(assert (=> d!49254 (isPrefixOf!0 thiss!1634 (_2!7115 lt!236195))))

(assert (=> d!49254 (= (reader!0 thiss!1634 (_2!7115 lt!236195)) lt!236647)))

(declare-fun b!151128 () Bool)

(declare-fun Unit!9519 () Unit!9509)

(assert (=> b!151128 (= e!100915 Unit!9519)))

(declare-fun b!151129 () Bool)

(declare-fun res!126720 () Bool)

(assert (=> b!151129 (=> (not res!126720) (not e!100916))))

(assert (=> b!151129 (= res!126720 (isPrefixOf!0 (_2!7117 lt!236647) (_2!7115 lt!236195)))))

(declare-fun lt!236650 () (_ BitVec 64))

(declare-fun b!151130 () Bool)

(declare-fun lt!236657 () (_ BitVec 64))

(assert (=> b!151130 (= e!100916 (= (_1!7117 lt!236647) (withMovedBitIndex!0 (_2!7117 lt!236647) (bvsub lt!236657 lt!236650))))))

(assert (=> b!151130 (or (= (bvand lt!236657 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!236650 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!236657 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!236657 lt!236650) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!151130 (= lt!236650 (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236195))) (currentByte!6463 (_2!7115 lt!236195)) (currentBit!6458 (_2!7115 lt!236195))))))

(assert (=> b!151130 (= lt!236657 (bitIndex!0 (size!3050 (buf!3537 thiss!1634)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634)))))

(declare-fun b!151131 () Bool)

(declare-fun res!126719 () Bool)

(assert (=> b!151131 (=> (not res!126719) (not e!100916))))

(assert (=> b!151131 (= res!126719 (isPrefixOf!0 (_1!7117 lt!236647) thiss!1634))))

(assert (= (and d!49254 c!8083) b!151127))

(assert (= (and d!49254 (not c!8083)) b!151128))

(assert (= (and d!49254 res!126718) b!151131))

(assert (= (and b!151131 res!126719) b!151129))

(assert (= (and b!151129 res!126720) b!151130))

(declare-fun m!235957 () Bool)

(assert (=> b!151130 m!235957))

(assert (=> b!151130 m!235511))

(assert (=> b!151130 m!235513))

(declare-fun m!235959 () Bool)

(assert (=> b!151129 m!235959))

(assert (=> d!49254 m!235933))

(declare-fun m!235961 () Bool)

(assert (=> d!49254 m!235961))

(declare-fun m!235963 () Bool)

(assert (=> d!49254 m!235963))

(assert (=> d!49254 m!235547))

(declare-fun m!235965 () Bool)

(assert (=> d!49254 m!235965))

(declare-fun m!235967 () Bool)

(assert (=> d!49254 m!235967))

(assert (=> d!49254 m!235943))

(declare-fun m!235969 () Bool)

(assert (=> d!49254 m!235969))

(assert (=> d!49254 m!235899))

(declare-fun m!235971 () Bool)

(assert (=> d!49254 m!235971))

(assert (=> d!49254 m!235903))

(assert (=> b!151127 m!235513))

(declare-fun m!235973 () Bool)

(assert (=> b!151127 m!235973))

(declare-fun m!235975 () Bool)

(assert (=> b!151127 m!235975))

(declare-fun m!235977 () Bool)

(assert (=> b!151131 m!235977))

(assert (=> b!150940 d!49254))

(declare-fun d!49256 () Bool)

(assert (=> d!49256 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236195)))) ((_ sign_extend 32) (currentByte!6463 thiss!1634)) ((_ sign_extend 32) (currentBit!6458 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!236688 () Unit!9509)

(declare-fun choose!26 (BitStream!5358 array!6742 (_ BitVec 32) BitStream!5358) Unit!9509)

(assert (=> d!49256 (= lt!236688 (choose!26 thiss!1634 (buf!3537 (_2!7115 lt!236195)) (bvsub to!404 from!447) (BitStream!5359 (buf!3537 (_2!7115 lt!236195)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634))))))

(assert (=> d!49256 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3537 (_2!7115 lt!236195)) (bvsub to!404 from!447)) lt!236688)))

(declare-fun bs!12046 () Bool)

(assert (= bs!12046 d!49256))

(assert (=> bs!12046 m!235539))

(declare-fun m!236009 () Bool)

(assert (=> bs!12046 m!236009))

(assert (=> b!150940 d!49256))

(declare-fun d!49260 () Bool)

(assert (=> d!49260 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236195)))) ((_ sign_extend 32) (currentByte!6463 (_2!7115 lt!236193))) ((_ sign_extend 32) (currentBit!6458 (_2!7115 lt!236193))) lt!236172) (bvsle ((_ sign_extend 32) lt!236172) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236195)))) ((_ sign_extend 32) (currentByte!6463 (_2!7115 lt!236193))) ((_ sign_extend 32) (currentBit!6458 (_2!7115 lt!236193)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12047 () Bool)

(assert (= bs!12047 d!49260))

(assert (=> bs!12047 m!235825))

(assert (=> b!150940 d!49260))

(declare-fun d!49262 () Bool)

(declare-fun res!126724 () Bool)

(declare-fun e!100919 () Bool)

(assert (=> d!49262 (=> res!126724 e!100919)))

(assert (=> d!49262 (= res!126724 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!49262 (= (arrayRangesEq!366 (_2!7116 lt!236179) (_2!7116 lt!236199) #b00000000000000000000000000000000 to!404) e!100919)))

(declare-fun b!151137 () Bool)

(declare-fun e!100920 () Bool)

(assert (=> b!151137 (= e!100919 e!100920)))

(declare-fun res!126725 () Bool)

(assert (=> b!151137 (=> (not res!126725) (not e!100920))))

(assert (=> b!151137 (= res!126725 (= (select (arr!3852 (_2!7116 lt!236179)) #b00000000000000000000000000000000) (select (arr!3852 (_2!7116 lt!236199)) #b00000000000000000000000000000000)))))

(declare-fun b!151138 () Bool)

(assert (=> b!151138 (= e!100920 (arrayRangesEq!366 (_2!7116 lt!236179) (_2!7116 lt!236199) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!49262 (not res!126724)) b!151137))

(assert (= (and b!151137 res!126725) b!151138))

(assert (=> b!151137 m!235911))

(assert (=> b!151137 m!235917))

(declare-fun m!236011 () Bool)

(assert (=> b!151138 m!236011))

(assert (=> b!150940 d!49262))

(declare-fun d!49266 () Bool)

(assert (=> d!49266 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236195)))) ((_ sign_extend 32) (currentByte!6463 (_2!7115 lt!236193))) ((_ sign_extend 32) (currentBit!6458 (_2!7115 lt!236193))) lt!236172)))

(declare-fun lt!236689 () Unit!9509)

(assert (=> d!49266 (= lt!236689 (choose!26 (_2!7115 lt!236193) (buf!3537 (_2!7115 lt!236195)) lt!236172 (BitStream!5359 (buf!3537 (_2!7115 lt!236195)) (currentByte!6463 (_2!7115 lt!236193)) (currentBit!6458 (_2!7115 lt!236193)))))))

(assert (=> d!49266 (= (validateOffsetBytesContentIrrelevancyLemma!0 (_2!7115 lt!236193) (buf!3537 (_2!7115 lt!236195)) lt!236172) lt!236689)))

(declare-fun bs!12048 () Bool)

(assert (= bs!12048 d!49266))

(assert (=> bs!12048 m!235555))

(declare-fun m!236013 () Bool)

(assert (=> bs!12048 m!236013))

(assert (=> b!150940 d!49266))

(declare-fun d!49268 () Bool)

(declare-fun moveByteIndex!0 (BitStream!5358 (_ BitVec 32)) tuple2!13490)

(assert (=> d!49268 (= (withMovedByteIndex!0 (_1!7117 lt!236184) #b00000000000000000000000000000001) (_2!7115 (moveByteIndex!0 (_1!7117 lt!236184) #b00000000000000000000000000000001)))))

(declare-fun bs!12049 () Bool)

(assert (= bs!12049 d!49268))

(declare-fun m!236015 () Bool)

(assert (=> bs!12049 m!236015))

(assert (=> b!150940 d!49268))

(declare-fun d!49270 () Bool)

(declare-fun res!126726 () Bool)

(declare-fun e!100921 () Bool)

(assert (=> d!49270 (=> res!126726 e!100921)))

(assert (=> d!49270 (= res!126726 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!49270 (= (arrayRangesEq!366 (_2!7116 lt!236179) (_2!7116 lt!236173) #b00000000000000000000000000000000 to!404) e!100921)))

(declare-fun b!151139 () Bool)

(declare-fun e!100922 () Bool)

(assert (=> b!151139 (= e!100921 e!100922)))

(declare-fun res!126727 () Bool)

(assert (=> b!151139 (=> (not res!126727) (not e!100922))))

(assert (=> b!151139 (= res!126727 (= (select (arr!3852 (_2!7116 lt!236179)) #b00000000000000000000000000000000) (select (arr!3852 (_2!7116 lt!236173)) #b00000000000000000000000000000000)))))

(declare-fun b!151140 () Bool)

(assert (=> b!151140 (= e!100922 (arrayRangesEq!366 (_2!7116 lt!236179) (_2!7116 lt!236173) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!49270 (not res!126726)) b!151139))

(assert (= (and b!151139 res!126727) b!151140))

(assert (=> b!151139 m!235911))

(declare-fun m!236017 () Bool)

(assert (=> b!151139 m!236017))

(declare-fun m!236019 () Bool)

(assert (=> b!151140 m!236019))

(assert (=> b!150940 d!49270))

(declare-fun d!49272 () Bool)

(declare-fun e!100923 () Bool)

(assert (=> d!49272 e!100923))

(declare-fun res!126728 () Bool)

(assert (=> d!49272 (=> (not res!126728) (not e!100923))))

(declare-fun lt!236695 () (_ BitVec 64))

(declare-fun lt!236691 () (_ BitVec 64))

(declare-fun lt!236690 () (_ BitVec 64))

(assert (=> d!49272 (= res!126728 (= lt!236690 (bvsub lt!236691 lt!236695)))))

(assert (=> d!49272 (or (= (bvand lt!236691 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!236695 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!236691 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!236691 lt!236695) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!49272 (= lt!236695 (remainingBits!0 ((_ sign_extend 32) (size!3050 (buf!3537 (_1!7118 lt!236177)))) ((_ sign_extend 32) (currentByte!6463 (_1!7118 lt!236177))) ((_ sign_extend 32) (currentBit!6458 (_1!7118 lt!236177)))))))

(declare-fun lt!236694 () (_ BitVec 64))

(declare-fun lt!236693 () (_ BitVec 64))

(assert (=> d!49272 (= lt!236691 (bvmul lt!236694 lt!236693))))

(assert (=> d!49272 (or (= lt!236694 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!236693 (bvsdiv (bvmul lt!236694 lt!236693) lt!236694)))))

(assert (=> d!49272 (= lt!236693 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!49272 (= lt!236694 ((_ sign_extend 32) (size!3050 (buf!3537 (_1!7118 lt!236177)))))))

(assert (=> d!49272 (= lt!236690 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6463 (_1!7118 lt!236177))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6458 (_1!7118 lt!236177)))))))

(assert (=> d!49272 (invariant!0 (currentBit!6458 (_1!7118 lt!236177)) (currentByte!6463 (_1!7118 lt!236177)) (size!3050 (buf!3537 (_1!7118 lt!236177))))))

(assert (=> d!49272 (= (bitIndex!0 (size!3050 (buf!3537 (_1!7118 lt!236177))) (currentByte!6463 (_1!7118 lt!236177)) (currentBit!6458 (_1!7118 lt!236177))) lt!236690)))

(declare-fun b!151141 () Bool)

(declare-fun res!126729 () Bool)

(assert (=> b!151141 (=> (not res!126729) (not e!100923))))

(assert (=> b!151141 (= res!126729 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!236690))))

(declare-fun b!151142 () Bool)

(declare-fun lt!236692 () (_ BitVec 64))

(assert (=> b!151142 (= e!100923 (bvsle lt!236690 (bvmul lt!236692 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!151142 (or (= lt!236692 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!236692 #b0000000000000000000000000000000000000000000000000000000000001000) lt!236692)))))

(assert (=> b!151142 (= lt!236692 ((_ sign_extend 32) (size!3050 (buf!3537 (_1!7118 lt!236177)))))))

(assert (= (and d!49272 res!126728) b!151141))

(assert (= (and b!151141 res!126729) b!151142))

(declare-fun m!236021 () Bool)

(assert (=> d!49272 m!236021))

(declare-fun m!236023 () Bool)

(assert (=> d!49272 m!236023))

(assert (=> b!150940 d!49272))

(declare-fun d!49274 () Bool)

(declare-fun res!126730 () Bool)

(declare-fun e!100925 () Bool)

(assert (=> d!49274 (=> (not res!126730) (not e!100925))))

(assert (=> d!49274 (= res!126730 (= (size!3050 (buf!3537 thiss!1634)) (size!3050 (buf!3537 (_2!7115 lt!236195)))))))

(assert (=> d!49274 (= (isPrefixOf!0 thiss!1634 (_2!7115 lt!236195)) e!100925)))

(declare-fun b!151143 () Bool)

(declare-fun res!126732 () Bool)

(assert (=> b!151143 (=> (not res!126732) (not e!100925))))

(assert (=> b!151143 (= res!126732 (bvsle (bitIndex!0 (size!3050 (buf!3537 thiss!1634)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634)) (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236195))) (currentByte!6463 (_2!7115 lt!236195)) (currentBit!6458 (_2!7115 lt!236195)))))))

(declare-fun b!151144 () Bool)

(declare-fun e!100924 () Bool)

(assert (=> b!151144 (= e!100925 e!100924)))

(declare-fun res!126731 () Bool)

(assert (=> b!151144 (=> res!126731 e!100924)))

(assert (=> b!151144 (= res!126731 (= (size!3050 (buf!3537 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!151145 () Bool)

(assert (=> b!151145 (= e!100924 (arrayBitRangesEq!0 (buf!3537 thiss!1634) (buf!3537 (_2!7115 lt!236195)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3050 (buf!3537 thiss!1634)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634))))))

(assert (= (and d!49274 res!126730) b!151143))

(assert (= (and b!151143 res!126732) b!151144))

(assert (= (and b!151144 (not res!126731)) b!151145))

(assert (=> b!151143 m!235513))

(assert (=> b!151143 m!235511))

(assert (=> b!151145 m!235513))

(assert (=> b!151145 m!235513))

(declare-fun m!236025 () Bool)

(assert (=> b!151145 m!236025))

(assert (=> b!150940 d!49274))

(declare-fun d!49276 () Bool)

(assert (=> d!49276 (isPrefixOf!0 thiss!1634 (_2!7115 lt!236195))))

(declare-fun lt!236698 () Unit!9509)

(declare-fun choose!30 (BitStream!5358 BitStream!5358 BitStream!5358) Unit!9509)

(assert (=> d!49276 (= lt!236698 (choose!30 thiss!1634 (_2!7115 lt!236193) (_2!7115 lt!236195)))))

(assert (=> d!49276 (isPrefixOf!0 thiss!1634 (_2!7115 lt!236193))))

(assert (=> d!49276 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!7115 lt!236193) (_2!7115 lt!236195)) lt!236698)))

(declare-fun bs!12050 () Bool)

(assert (= bs!12050 d!49276))

(assert (=> bs!12050 m!235547))

(declare-fun m!236029 () Bool)

(assert (=> bs!12050 m!236029))

(assert (=> bs!12050 m!235587))

(assert (=> b!150940 d!49276))

(declare-fun d!49280 () Bool)

(declare-fun e!100940 () Bool)

(assert (=> d!49280 e!100940))

(declare-fun res!126754 () Bool)

(assert (=> d!49280 (=> (not res!126754) (not e!100940))))

(declare-fun lt!236727 () tuple2!13496)

(declare-fun lt!236725 () tuple2!13496)

(assert (=> d!49280 (= res!126754 (= (bitIndex!0 (size!3050 (buf!3537 (_1!7118 lt!236727))) (currentByte!6463 (_1!7118 lt!236727)) (currentBit!6458 (_1!7118 lt!236727))) (bitIndex!0 (size!3050 (buf!3537 (_1!7118 lt!236725))) (currentByte!6463 (_1!7118 lt!236725)) (currentBit!6458 (_1!7118 lt!236725)))))))

(declare-fun lt!236728 () Unit!9509)

(declare-fun lt!236726 () BitStream!5358)

(declare-fun choose!14 (BitStream!5358 BitStream!5358 BitStream!5358 tuple2!13496 tuple2!13496 BitStream!5358 (_ BitVec 8) tuple2!13496 tuple2!13496 BitStream!5358 (_ BitVec 8)) Unit!9509)

(assert (=> d!49280 (= lt!236728 (choose!14 lt!236196 (_2!7115 lt!236195) lt!236726 lt!236727 (tuple2!13497 (_1!7118 lt!236727) (_2!7118 lt!236727)) (_1!7118 lt!236727) (_2!7118 lt!236727) lt!236725 (tuple2!13497 (_1!7118 lt!236725) (_2!7118 lt!236725)) (_1!7118 lt!236725) (_2!7118 lt!236725)))))

(assert (=> d!49280 (= lt!236725 (readBytePure!0 lt!236726))))

(assert (=> d!49280 (= lt!236727 (readBytePure!0 lt!236196))))

(assert (=> d!49280 (= lt!236726 (BitStream!5359 (buf!3537 (_2!7115 lt!236195)) (currentByte!6463 lt!236196) (currentBit!6458 lt!236196)))))

(assert (=> d!49280 (= (readBytePrefixLemma!0 lt!236196 (_2!7115 lt!236195)) lt!236728)))

(declare-fun b!151167 () Bool)

(assert (=> b!151167 (= e!100940 (= (_2!7118 lt!236727) (_2!7118 lt!236725)))))

(assert (= (and d!49280 res!126754) b!151167))

(declare-fun m!236031 () Bool)

(assert (=> d!49280 m!236031))

(declare-fun m!236033 () Bool)

(assert (=> d!49280 m!236033))

(declare-fun m!236035 () Bool)

(assert (=> d!49280 m!236035))

(declare-fun m!236037 () Bool)

(assert (=> d!49280 m!236037))

(assert (=> d!49280 m!235523))

(assert (=> b!150940 d!49280))

(declare-fun d!49282 () Bool)

(assert (=> d!49282 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236195)))) ((_ sign_extend 32) (currentByte!6463 thiss!1634)) ((_ sign_extend 32) (currentBit!6458 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236195)))) ((_ sign_extend 32) (currentByte!6463 thiss!1634)) ((_ sign_extend 32) (currentBit!6458 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12051 () Bool)

(assert (= bs!12051 d!49282))

(assert (=> bs!12051 m!235785))

(assert (=> b!150940 d!49282))

(declare-fun d!49284 () Bool)

(declare-fun lt!236729 () tuple2!13508)

(assert (=> d!49284 (= lt!236729 (readByte!0 (_1!7117 lt!236184)))))

(assert (=> d!49284 (= (readBytePure!0 (_1!7117 lt!236184)) (tuple2!13497 (_2!7126 lt!236729) (_1!7126 lt!236729)))))

(declare-fun bs!12052 () Bool)

(assert (= bs!12052 d!49284))

(declare-fun m!236039 () Bool)

(assert (=> bs!12052 m!236039))

(assert (=> b!150940 d!49284))

(declare-fun d!49286 () Bool)

(declare-fun lt!236730 () tuple2!13508)

(assert (=> d!49286 (= lt!236730 (readByte!0 (BitStream!5359 (buf!3537 (_2!7115 lt!236195)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634))))))

(assert (=> d!49286 (= (readBytePure!0 (BitStream!5359 (buf!3537 (_2!7115 lt!236195)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634))) (tuple2!13497 (_2!7126 lt!236730) (_1!7126 lt!236730)))))

(declare-fun bs!12053 () Bool)

(assert (= bs!12053 d!49286))

(declare-fun m!236041 () Bool)

(assert (=> bs!12053 m!236041))

(assert (=> b!150940 d!49286))

(declare-fun d!49288 () Bool)

(declare-fun lt!236772 () tuple2!13492)

(declare-fun lt!236774 () tuple2!13492)

(assert (=> d!49288 (arrayRangesEq!366 (_2!7116 lt!236772) (_2!7116 lt!236774) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!236775 () Unit!9509)

(declare-fun lt!236773 () BitStream!5358)

(declare-fun choose!35 (BitStream!5358 array!6742 (_ BitVec 32) (_ BitVec 32) tuple2!13492 array!6742 BitStream!5358 tuple2!13492 array!6742) Unit!9509)

(assert (=> d!49288 (= lt!236775 (choose!35 (_1!7117 lt!236184) arr!237 from!447 to!404 lt!236772 (_2!7116 lt!236772) lt!236773 lt!236774 (_2!7116 lt!236774)))))

(assert (=> d!49288 (= lt!236774 (readByteArrayLoopPure!0 lt!236773 (array!6743 (store (arr!3852 arr!237) from!447 (_2!7118 (readBytePure!0 (_1!7117 lt!236184)))) (size!3050 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!49288 (= lt!236773 (withMovedByteIndex!0 (_1!7117 lt!236184) #b00000000000000000000000000000001))))

(assert (=> d!49288 (= lt!236772 (readByteArrayLoopPure!0 (_1!7117 lt!236184) arr!237 from!447 to!404))))

(assert (=> d!49288 (= (readByteArrayLoopArrayPrefixLemma!0 (_1!7117 lt!236184) arr!237 from!447 to!404) lt!236775)))

(declare-fun bs!12057 () Bool)

(assert (= bs!12057 d!49288))

(assert (=> bs!12057 m!235531))

(declare-fun m!236067 () Bool)

(assert (=> bs!12057 m!236067))

(assert (=> bs!12057 m!235521))

(assert (=> bs!12057 m!235527))

(declare-fun m!236069 () Bool)

(assert (=> bs!12057 m!236069))

(declare-fun m!236071 () Bool)

(assert (=> bs!12057 m!236071))

(declare-fun m!236073 () Bool)

(assert (=> bs!12057 m!236073))

(assert (=> b!150940 d!49288))

(declare-fun d!49304 () Bool)

(assert (=> d!49304 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236193)))) ((_ sign_extend 32) (currentByte!6463 (_2!7115 lt!236193))) ((_ sign_extend 32) (currentBit!6458 (_2!7115 lt!236193))) lt!236172) (bvsle ((_ sign_extend 32) lt!236172) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236193)))) ((_ sign_extend 32) (currentByte!6463 (_2!7115 lt!236193))) ((_ sign_extend 32) (currentBit!6458 (_2!7115 lt!236193)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12058 () Bool)

(assert (= bs!12058 d!49304))

(assert (=> bs!12058 m!235805))

(assert (=> b!150940 d!49304))

(declare-fun d!49306 () Bool)

(declare-fun e!100979 () Bool)

(assert (=> d!49306 e!100979))

(declare-fun res!126814 () Bool)

(assert (=> d!49306 (=> (not res!126814) (not e!100979))))

(declare-fun lt!236872 () tuple2!13490)

(assert (=> d!49306 (= res!126814 (= (size!3050 (buf!3537 (_2!7115 lt!236193))) (size!3050 (buf!3537 (_2!7115 lt!236872)))))))

(declare-fun choose!64 (BitStream!5358 array!6742 (_ BitVec 32) (_ BitVec 32)) tuple2!13490)

(assert (=> d!49306 (= lt!236872 (choose!64 (_2!7115 lt!236193) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!49306 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!3050 arr!237)))))

(assert (=> d!49306 (= (appendByteArrayLoop!0 (_2!7115 lt!236193) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!236872)))

(declare-fun b!151228 () Bool)

(declare-fun res!126816 () Bool)

(assert (=> b!151228 (=> (not res!126816) (not e!100979))))

(declare-fun lt!236866 () (_ BitVec 64))

(declare-fun lt!236868 () (_ BitVec 64))

(assert (=> b!151228 (= res!126816 (= (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236872))) (currentByte!6463 (_2!7115 lt!236872)) (currentBit!6458 (_2!7115 lt!236872))) (bvadd lt!236868 lt!236866)))))

(assert (=> b!151228 (or (not (= (bvand lt!236868 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!236866 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!236868 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!236868 lt!236866) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!236864 () (_ BitVec 64))

(assert (=> b!151228 (= lt!236866 (bvmul lt!236864 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!151228 (or (= lt!236864 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!236864 #b0000000000000000000000000000000000000000000000000000000000001000) lt!236864)))))

(assert (=> b!151228 (= lt!236864 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!151228 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!151228 (= lt!236868 (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236193))) (currentByte!6463 (_2!7115 lt!236193)) (currentBit!6458 (_2!7115 lt!236193))))))

(declare-fun b!151229 () Bool)

(declare-fun e!100977 () Bool)

(declare-fun lt!236869 () (_ BitVec 64))

(assert (=> b!151229 (= e!100977 (validate_offset_bits!1 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236193)))) ((_ sign_extend 32) (currentByte!6463 (_2!7115 lt!236193))) ((_ sign_extend 32) (currentBit!6458 (_2!7115 lt!236193))) lt!236869))))

(declare-fun b!151230 () Bool)

(declare-fun e!100978 () Bool)

(assert (=> b!151230 (= e!100979 e!100978)))

(declare-fun res!126815 () Bool)

(assert (=> b!151230 (=> (not res!126815) (not e!100978))))

(declare-fun lt!236867 () tuple2!13492)

(declare-fun lt!236870 () tuple2!13494)

(assert (=> b!151230 (= res!126815 (and (= (size!3050 (_2!7116 lt!236867)) (size!3050 arr!237)) (= (_1!7116 lt!236867) (_2!7117 lt!236870))))))

(assert (=> b!151230 (= lt!236867 (readByteArrayLoopPure!0 (_1!7117 lt!236870) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!236865 () Unit!9509)

(declare-fun lt!236871 () Unit!9509)

(assert (=> b!151230 (= lt!236865 lt!236871)))

(assert (=> b!151230 (validate_offset_bits!1 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236872)))) ((_ sign_extend 32) (currentByte!6463 (_2!7115 lt!236193))) ((_ sign_extend 32) (currentBit!6458 (_2!7115 lt!236193))) lt!236869)))

(assert (=> b!151230 (= lt!236871 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!7115 lt!236193) (buf!3537 (_2!7115 lt!236872)) lt!236869))))

(assert (=> b!151230 e!100977))

(declare-fun res!126817 () Bool)

(assert (=> b!151230 (=> (not res!126817) (not e!100977))))

(assert (=> b!151230 (= res!126817 (and (= (size!3050 (buf!3537 (_2!7115 lt!236193))) (size!3050 (buf!3537 (_2!7115 lt!236872)))) (bvsge lt!236869 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!151230 (= lt!236869 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!151230 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!151230 (= lt!236870 (reader!0 (_2!7115 lt!236193) (_2!7115 lt!236872)))))

(declare-fun b!151231 () Bool)

(declare-fun res!126813 () Bool)

(assert (=> b!151231 (=> (not res!126813) (not e!100979))))

(assert (=> b!151231 (= res!126813 (isPrefixOf!0 (_2!7115 lt!236193) (_2!7115 lt!236872)))))

(declare-fun b!151232 () Bool)

(assert (=> b!151232 (= e!100978 (arrayRangesEq!366 arr!237 (_2!7116 lt!236867) #b00000000000000000000000000000000 to!404))))

(assert (= (and d!49306 res!126814) b!151228))

(assert (= (and b!151228 res!126816) b!151231))

(assert (= (and b!151231 res!126813) b!151230))

(assert (= (and b!151230 res!126817) b!151229))

(assert (= (and b!151230 res!126815) b!151232))

(declare-fun m!236161 () Bool)

(assert (=> b!151228 m!236161))

(assert (=> b!151228 m!235575))

(declare-fun m!236163 () Bool)

(assert (=> b!151232 m!236163))

(declare-fun m!236165 () Bool)

(assert (=> d!49306 m!236165))

(declare-fun m!236167 () Bool)

(assert (=> b!151229 m!236167))

(declare-fun m!236169 () Bool)

(assert (=> b!151230 m!236169))

(declare-fun m!236171 () Bool)

(assert (=> b!151230 m!236171))

(declare-fun m!236173 () Bool)

(assert (=> b!151230 m!236173))

(declare-fun m!236175 () Bool)

(assert (=> b!151230 m!236175))

(declare-fun m!236177 () Bool)

(assert (=> b!151231 m!236177))

(assert (=> b!150940 d!49306))

(declare-fun d!49360 () Bool)

(declare-fun lt!236873 () tuple3!596)

(assert (=> d!49360 (= lt!236873 (readByteArrayLoop!0 (_1!7117 lt!236184) arr!237 from!447 to!404))))

(assert (=> d!49360 (= (readByteArrayLoopPure!0 (_1!7117 lt!236184) arr!237 from!447 to!404) (tuple2!13493 (_2!7125 lt!236873) (_3!371 lt!236873)))))

(declare-fun bs!12071 () Bool)

(assert (= bs!12071 d!49360))

(declare-fun m!236179 () Bool)

(assert (=> bs!12071 m!236179))

(assert (=> b!150940 d!49360))

(declare-fun d!49362 () Bool)

(declare-fun lt!236874 () tuple2!13508)

(assert (=> d!49362 (= lt!236874 (readByte!0 lt!236196))))

(assert (=> d!49362 (= (readBytePure!0 lt!236196) (tuple2!13497 (_2!7126 lt!236874) (_1!7126 lt!236874)))))

(declare-fun bs!12072 () Bool)

(assert (= bs!12072 d!49362))

(declare-fun m!236181 () Bool)

(assert (=> bs!12072 m!236181))

(assert (=> b!150940 d!49362))

(declare-fun d!49364 () Bool)

(declare-fun e!100982 () Bool)

(assert (=> d!49364 e!100982))

(declare-fun res!126820 () Bool)

(assert (=> d!49364 (=> (not res!126820) (not e!100982))))

(assert (=> d!49364 (= res!126820 (and (or (let ((rhs!3298 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3298 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3298) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!49365 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!49365 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!49365 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3297 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3297) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!236881 () Unit!9509)

(declare-fun choose!57 (BitStream!5358 BitStream!5358 (_ BitVec 64) (_ BitVec 32)) Unit!9509)

(assert (=> d!49364 (= lt!236881 (choose!57 thiss!1634 (_2!7115 lt!236193) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!49364 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!7115 lt!236193) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!236881)))

(declare-fun lt!236883 () (_ BitVec 32))

(declare-fun b!151235 () Bool)

(assert (=> b!151235 (= e!100982 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236193)))) ((_ sign_extend 32) (currentByte!6463 (_2!7115 lt!236193))) ((_ sign_extend 32) (currentBit!6458 (_2!7115 lt!236193))) (bvsub (bvsub to!404 from!447) lt!236883)))))

(assert (=> b!151235 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!236883 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!236883) #b10000000000000000000000000000000)))))

(declare-fun lt!236882 () (_ BitVec 64))

(assert (=> b!151235 (= lt!236883 ((_ extract 31 0) lt!236882))))

(assert (=> b!151235 (and (bvslt lt!236882 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!236882 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!151235 (= lt!236882 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!49364 res!126820) b!151235))

(declare-fun m!236183 () Bool)

(assert (=> d!49364 m!236183))

(declare-fun m!236185 () Bool)

(assert (=> b!151235 m!236185))

(assert (=> b!150940 d!49364))

(declare-fun d!49367 () Bool)

(declare-fun e!100983 () Bool)

(assert (=> d!49367 e!100983))

(declare-fun res!126821 () Bool)

(assert (=> d!49367 (=> (not res!126821) (not e!100983))))

(declare-fun lt!236885 () (_ BitVec 64))

(declare-fun lt!236889 () (_ BitVec 64))

(declare-fun lt!236884 () (_ BitVec 64))

(assert (=> d!49367 (= res!126821 (= lt!236884 (bvsub lt!236885 lt!236889)))))

(assert (=> d!49367 (or (= (bvand lt!236885 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!236889 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!236885 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!236885 lt!236889) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!49367 (= lt!236889 (remainingBits!0 ((_ sign_extend 32) (size!3050 (buf!3537 (_1!7118 lt!236192)))) ((_ sign_extend 32) (currentByte!6463 (_1!7118 lt!236192))) ((_ sign_extend 32) (currentBit!6458 (_1!7118 lt!236192)))))))

(declare-fun lt!236888 () (_ BitVec 64))

(declare-fun lt!236887 () (_ BitVec 64))

(assert (=> d!49367 (= lt!236885 (bvmul lt!236888 lt!236887))))

(assert (=> d!49367 (or (= lt!236888 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!236887 (bvsdiv (bvmul lt!236888 lt!236887) lt!236888)))))

(assert (=> d!49367 (= lt!236887 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!49367 (= lt!236888 ((_ sign_extend 32) (size!3050 (buf!3537 (_1!7118 lt!236192)))))))

(assert (=> d!49367 (= lt!236884 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6463 (_1!7118 lt!236192))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6458 (_1!7118 lt!236192)))))))

(assert (=> d!49367 (invariant!0 (currentBit!6458 (_1!7118 lt!236192)) (currentByte!6463 (_1!7118 lt!236192)) (size!3050 (buf!3537 (_1!7118 lt!236192))))))

(assert (=> d!49367 (= (bitIndex!0 (size!3050 (buf!3537 (_1!7118 lt!236192))) (currentByte!6463 (_1!7118 lt!236192)) (currentBit!6458 (_1!7118 lt!236192))) lt!236884)))

(declare-fun b!151236 () Bool)

(declare-fun res!126822 () Bool)

(assert (=> b!151236 (=> (not res!126822) (not e!100983))))

(assert (=> b!151236 (= res!126822 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!236884))))

(declare-fun b!151237 () Bool)

(declare-fun lt!236886 () (_ BitVec 64))

(assert (=> b!151237 (= e!100983 (bvsle lt!236884 (bvmul lt!236886 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!151237 (or (= lt!236886 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!236886 #b0000000000000000000000000000000000000000000000000000000000001000) lt!236886)))))

(assert (=> b!151237 (= lt!236886 ((_ sign_extend 32) (size!3050 (buf!3537 (_1!7118 lt!236192)))))))

(assert (= (and d!49367 res!126821) b!151236))

(assert (= (and b!151236 res!126822) b!151237))

(declare-fun m!236187 () Bool)

(assert (=> d!49367 m!236187))

(declare-fun m!236189 () Bool)

(assert (=> d!49367 m!236189))

(assert (=> b!150940 d!49367))

(declare-fun d!49369 () Bool)

(declare-fun e!100995 () Bool)

(assert (=> d!49369 e!100995))

(declare-fun res!126845 () Bool)

(assert (=> d!49369 (=> (not res!126845) (not e!100995))))

(declare-fun lt!236928 () tuple2!13490)

(assert (=> d!49369 (= res!126845 (= (size!3050 (buf!3537 thiss!1634)) (size!3050 (buf!3537 (_2!7115 lt!236928)))))))

(declare-fun choose!6 (BitStream!5358 (_ BitVec 8)) tuple2!13490)

(assert (=> d!49369 (= lt!236928 (choose!6 thiss!1634 (select (arr!3852 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!49369 (validate_offset_byte!0 ((_ sign_extend 32) (size!3050 (buf!3537 thiss!1634))) ((_ sign_extend 32) (currentByte!6463 thiss!1634)) ((_ sign_extend 32) (currentBit!6458 thiss!1634)))))

(assert (=> d!49369 (= (appendByte!0 thiss!1634 (select (arr!3852 arr!237) from!447)) lt!236928)))

(declare-fun b!151259 () Bool)

(declare-fun res!126844 () Bool)

(assert (=> b!151259 (=> (not res!126844) (not e!100995))))

(declare-fun lt!236930 () (_ BitVec 64))

(declare-fun lt!236927 () (_ BitVec 64))

(assert (=> b!151259 (= res!126844 (= (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236928))) (currentByte!6463 (_2!7115 lt!236928)) (currentBit!6458 (_2!7115 lt!236928))) (bvadd lt!236930 lt!236927)))))

(assert (=> b!151259 (or (not (= (bvand lt!236930 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!236927 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!236930 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!236930 lt!236927) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!151259 (= lt!236927 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!151259 (= lt!236930 (bitIndex!0 (size!3050 (buf!3537 thiss!1634)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634)))))

(declare-fun b!151260 () Bool)

(declare-fun res!126846 () Bool)

(assert (=> b!151260 (=> (not res!126846) (not e!100995))))

(assert (=> b!151260 (= res!126846 (isPrefixOf!0 thiss!1634 (_2!7115 lt!236928)))))

(declare-fun b!151261 () Bool)

(declare-fun lt!236929 () tuple2!13494)

(declare-fun lt!236931 () tuple2!13496)

(assert (=> b!151261 (= e!100995 (and (= (_2!7118 lt!236931) (select (arr!3852 arr!237) from!447)) (= (_1!7118 lt!236931) (_2!7117 lt!236929))))))

(assert (=> b!151261 (= lt!236931 (readBytePure!0 (_1!7117 lt!236929)))))

(assert (=> b!151261 (= lt!236929 (reader!0 thiss!1634 (_2!7115 lt!236928)))))

(assert (= (and d!49369 res!126845) b!151259))

(assert (= (and b!151259 res!126844) b!151260))

(assert (= (and b!151260 res!126846) b!151261))

(assert (=> d!49369 m!235563))

(declare-fun m!236191 () Bool)

(assert (=> d!49369 m!236191))

(declare-fun m!236193 () Bool)

(assert (=> d!49369 m!236193))

(declare-fun m!236195 () Bool)

(assert (=> b!151259 m!236195))

(assert (=> b!151259 m!235513))

(declare-fun m!236199 () Bool)

(assert (=> b!151260 m!236199))

(declare-fun m!236201 () Bool)

(assert (=> b!151261 m!236201))

(declare-fun m!236203 () Bool)

(assert (=> b!151261 m!236203))

(assert (=> b!150940 d!49369))

(declare-fun d!49371 () Bool)

(declare-fun lt!236932 () tuple3!596)

(assert (=> d!49371 (= lt!236932 (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!7117 lt!236184) #b00000000000000000000000000000001) lt!236176 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!49371 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!7117 lt!236184) #b00000000000000000000000000000001) lt!236176 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13493 (_2!7125 lt!236932) (_3!371 lt!236932)))))

(declare-fun bs!12073 () Bool)

(assert (= bs!12073 d!49371))

(assert (=> bs!12073 m!235531))

(declare-fun m!236219 () Bool)

(assert (=> bs!12073 m!236219))

(assert (=> b!150940 d!49371))

(assert (=> b!150940 d!49206))

(check-sat (not d!49260) (not d!49367) (not b!151231) (not d!49276) (not d!49288) (not b!151125) (not b!151124) (not d!49194) (not d!49254) (not d!49238) (not d!49304) (not b!151130) (not d!49266) (not d!49198) (not b!151131) (not b!151108) (not b!151126) (not b!151127) (not b!151260) (not d!49360) (not b!151122) (not d!49256) (not d!49171) (not b!151097) (not b!151138) (not d!49242) (not b!151095) (not d!49364) (not b!151261) (not d!49282) (not d!49175) (not d!49183) (not d!49196) (not b!151099) (not d!49371) (not d!49230) (not d!49250) (not b!151106) (not b!151093) (not b!151091) (not b!151140) (not d!49280) (not b!151259) (not d!49206) (not d!49286) (not b!151143) (not b!151232) (not b!151113) (not d!49369) (not d!49252) (not d!49284) (not d!49200) (not b!151235) (not b!151229) (not b!151228) (not d!49244) (not d!49362) (not d!49190) (not d!49268) (not b!151094) (not d!49272) (not d!49306) (not b!151057) (not d!49234) (not b!151145) (not b!151129) (not b!151230) (not b!151111))
(check-sat)
(get-model)

(assert (=> d!49276 d!49274))

(declare-fun d!49626 () Bool)

(assert (=> d!49626 (isPrefixOf!0 thiss!1634 (_2!7115 lt!236195))))

(assert (=> d!49626 true))

(declare-fun _$15!249 () Unit!9509)

(assert (=> d!49626 (= (choose!30 thiss!1634 (_2!7115 lt!236193) (_2!7115 lt!236195)) _$15!249)))

(declare-fun bs!12126 () Bool)

(assert (= bs!12126 d!49626))

(assert (=> bs!12126 m!235547))

(assert (=> d!49276 d!49626))

(assert (=> d!49276 d!49240))

(declare-fun d!49628 () Bool)

(declare-fun res!127073 () Bool)

(declare-fun e!101193 () Bool)

(assert (=> d!49628 (=> res!127073 e!101193)))

(assert (=> d!49628 (= res!127073 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!49628 (= (arrayRangesEq!366 arr!237 (_2!7116 lt!236188) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!101193)))

(declare-fun b!151527 () Bool)

(declare-fun e!101194 () Bool)

(assert (=> b!151527 (= e!101193 e!101194)))

(declare-fun res!127074 () Bool)

(assert (=> b!151527 (=> (not res!127074) (not e!101194))))

(assert (=> b!151527 (= res!127074 (= (select (arr!3852 arr!237) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3852 (_2!7116 lt!236188)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!151528 () Bool)

(assert (=> b!151528 (= e!101194 (arrayRangesEq!366 arr!237 (_2!7116 lt!236188) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!49628 (not res!127073)) b!151527))

(assert (= (and b!151527 res!127074) b!151528))

(declare-fun m!236891 () Bool)

(assert (=> b!151527 m!236891))

(declare-fun m!236893 () Bool)

(assert (=> b!151527 m!236893))

(declare-fun m!236895 () Bool)

(assert (=> b!151528 m!236895))

(assert (=> b!151057 d!49628))

(declare-fun b!151537 () Bool)

(declare-fun e!101201 () Bool)

(declare-fun _$37!59 () tuple2!13490)

(assert (=> b!151537 (= e!101201 (array_inv!2839 (buf!3537 (_2!7115 _$37!59))))))

(declare-fun lt!237437 () tuple2!13494)

(declare-fun e!101202 () Bool)

(declare-fun lt!237436 () tuple2!13496)

(declare-fun b!151540 () Bool)

(assert (=> b!151540 (= e!101202 (and (= (_2!7118 lt!237436) (select (arr!3852 arr!237) from!447)) (= (_1!7118 lt!237436) (_2!7117 lt!237437))))))

(assert (=> b!151540 (= lt!237436 (readBytePure!0 (_1!7117 lt!237437)))))

(assert (=> b!151540 (= lt!237437 (reader!0 thiss!1634 (_2!7115 _$37!59)))))

(declare-fun b!151538 () Bool)

(declare-fun res!127082 () Bool)

(assert (=> b!151538 (=> (not res!127082) (not e!101202))))

(assert (=> b!151538 (= res!127082 (= (bitIndex!0 (size!3050 (buf!3537 (_2!7115 _$37!59))) (currentByte!6463 (_2!7115 _$37!59)) (currentBit!6458 (_2!7115 _$37!59))) (bvadd (bitIndex!0 (size!3050 (buf!3537 thiss!1634)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!151539 () Bool)

(declare-fun res!127081 () Bool)

(assert (=> b!151539 (=> (not res!127081) (not e!101202))))

(assert (=> b!151539 (= res!127081 (isPrefixOf!0 thiss!1634 (_2!7115 _$37!59)))))

(declare-fun d!49630 () Bool)

(assert (=> d!49630 e!101202))

(declare-fun res!127083 () Bool)

(assert (=> d!49630 (=> (not res!127083) (not e!101202))))

(assert (=> d!49630 (= res!127083 (= (size!3050 (buf!3537 thiss!1634)) (size!3050 (buf!3537 (_2!7115 _$37!59)))))))

(assert (=> d!49630 (and (inv!12 (_2!7115 _$37!59)) e!101201)))

(assert (=> d!49630 (= (choose!6 thiss!1634 (select (arr!3852 arr!237) from!447)) _$37!59)))

(assert (= d!49630 b!151537))

(assert (= (and d!49630 res!127083) b!151538))

(assert (= (and b!151538 res!127082) b!151539))

(assert (= (and b!151539 res!127081) b!151540))

(declare-fun m!236897 () Bool)

(assert (=> b!151539 m!236897))

(declare-fun m!236899 () Bool)

(assert (=> b!151538 m!236899))

(assert (=> b!151538 m!235513))

(declare-fun m!236901 () Bool)

(assert (=> b!151540 m!236901))

(declare-fun m!236903 () Bool)

(assert (=> b!151540 m!236903))

(declare-fun m!236905 () Bool)

(assert (=> b!151537 m!236905))

(declare-fun m!236907 () Bool)

(assert (=> d!49630 m!236907))

(assert (=> d!49369 d!49630))

(declare-fun d!49632 () Bool)

(assert (=> d!49632 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3050 (buf!3537 thiss!1634))) ((_ sign_extend 32) (currentByte!6463 thiss!1634)) ((_ sign_extend 32) (currentBit!6458 thiss!1634))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3050 (buf!3537 thiss!1634))) ((_ sign_extend 32) (currentByte!6463 thiss!1634)) ((_ sign_extend 32) (currentBit!6458 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!12127 () Bool)

(assert (= bs!12127 d!49632))

(assert (=> bs!12127 m!235815))

(assert (=> d!49369 d!49632))

(declare-fun d!49634 () Bool)

(assert (=> d!49634 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236193)))) ((_ sign_extend 32) (currentByte!6463 (_2!7115 lt!236193))) ((_ sign_extend 32) (currentBit!6458 (_2!7115 lt!236193))) (bvsub (bvsub to!404 from!447) lt!236883)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) lt!236883)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236193)))) ((_ sign_extend 32) (currentByte!6463 (_2!7115 lt!236193))) ((_ sign_extend 32) (currentBit!6458 (_2!7115 lt!236193)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12128 () Bool)

(assert (= bs!12128 d!49634))

(assert (=> bs!12128 m!235805))

(assert (=> b!151235 d!49634))

(declare-fun d!49636 () Bool)

(assert (=> d!49636 (= (remainingBits!0 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236195)))) ((_ sign_extend 32) (currentByte!6463 thiss!1634)) ((_ sign_extend 32) (currentBit!6458 thiss!1634))) (bvsub (bvmul ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236195)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6463 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6458 thiss!1634)))))))

(assert (=> d!49171 d!49636))

(declare-fun d!49638 () Bool)

(assert (=> d!49638 (isPrefixOf!0 lt!236641 (_2!7115 lt!236193))))

(declare-fun lt!237438 () Unit!9509)

(assert (=> d!49638 (= lt!237438 (choose!30 lt!236641 thiss!1634 (_2!7115 lt!236193)))))

(assert (=> d!49638 (isPrefixOf!0 lt!236641 thiss!1634)))

(assert (=> d!49638 (= (lemmaIsPrefixTransitive!0 lt!236641 thiss!1634 (_2!7115 lt!236193)) lt!237438)))

(declare-fun bs!12129 () Bool)

(assert (= bs!12129 d!49638))

(assert (=> bs!12129 m!235945))

(declare-fun m!236909 () Bool)

(assert (=> bs!12129 m!236909))

(declare-fun m!236911 () Bool)

(assert (=> bs!12129 m!236911))

(assert (=> d!49244 d!49638))

(assert (=> d!49244 d!49240))

(declare-fun d!49640 () Bool)

(assert (=> d!49640 (isPrefixOf!0 lt!236641 lt!236641)))

(declare-fun lt!237441 () Unit!9509)

(declare-fun choose!11 (BitStream!5358) Unit!9509)

(assert (=> d!49640 (= lt!237441 (choose!11 lt!236641))))

(assert (=> d!49640 (= (lemmaIsPrefixRefl!0 lt!236641) lt!237441)))

(declare-fun bs!12131 () Bool)

(assert (= bs!12131 d!49640))

(assert (=> bs!12131 m!235939))

(declare-fun m!236913 () Bool)

(assert (=> bs!12131 m!236913))

(assert (=> d!49244 d!49640))

(declare-fun d!49642 () Bool)

(declare-fun res!127084 () Bool)

(declare-fun e!101205 () Bool)

(assert (=> d!49642 (=> (not res!127084) (not e!101205))))

(assert (=> d!49642 (= res!127084 (= (size!3050 (buf!3537 (_1!7117 lt!236626))) (size!3050 (buf!3537 (_2!7117 lt!236626)))))))

(assert (=> d!49642 (= (isPrefixOf!0 (_1!7117 lt!236626) (_2!7117 lt!236626)) e!101205)))

(declare-fun b!151541 () Bool)

(declare-fun res!127086 () Bool)

(assert (=> b!151541 (=> (not res!127086) (not e!101205))))

(assert (=> b!151541 (= res!127086 (bvsle (bitIndex!0 (size!3050 (buf!3537 (_1!7117 lt!236626))) (currentByte!6463 (_1!7117 lt!236626)) (currentBit!6458 (_1!7117 lt!236626))) (bitIndex!0 (size!3050 (buf!3537 (_2!7117 lt!236626))) (currentByte!6463 (_2!7117 lt!236626)) (currentBit!6458 (_2!7117 lt!236626)))))))

(declare-fun b!151542 () Bool)

(declare-fun e!101204 () Bool)

(assert (=> b!151542 (= e!101205 e!101204)))

(declare-fun res!127085 () Bool)

(assert (=> b!151542 (=> res!127085 e!101204)))

(assert (=> b!151542 (= res!127085 (= (size!3050 (buf!3537 (_1!7117 lt!236626))) #b00000000000000000000000000000000))))

(declare-fun b!151543 () Bool)

(assert (=> b!151543 (= e!101204 (arrayBitRangesEq!0 (buf!3537 (_1!7117 lt!236626)) (buf!3537 (_2!7117 lt!236626)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3050 (buf!3537 (_1!7117 lt!236626))) (currentByte!6463 (_1!7117 lt!236626)) (currentBit!6458 (_1!7117 lt!236626)))))))

(assert (= (and d!49642 res!127084) b!151541))

(assert (= (and b!151541 res!127086) b!151542))

(assert (= (and b!151542 (not res!127085)) b!151543))

(declare-fun m!236915 () Bool)

(assert (=> b!151541 m!236915))

(declare-fun m!236917 () Bool)

(assert (=> b!151541 m!236917))

(assert (=> b!151543 m!236915))

(assert (=> b!151543 m!236915))

(declare-fun m!236919 () Bool)

(assert (=> b!151543 m!236919))

(assert (=> d!49244 d!49642))

(declare-fun d!49644 () Bool)

(declare-fun res!127087 () Bool)

(declare-fun e!101207 () Bool)

(assert (=> d!49644 (=> (not res!127087) (not e!101207))))

(assert (=> d!49644 (= res!127087 (= (size!3050 (buf!3537 (_2!7115 lt!236193))) (size!3050 (buf!3537 (_2!7115 lt!236193)))))))

(assert (=> d!49644 (= (isPrefixOf!0 (_2!7115 lt!236193) (_2!7115 lt!236193)) e!101207)))

(declare-fun b!151544 () Bool)

(declare-fun res!127089 () Bool)

(assert (=> b!151544 (=> (not res!127089) (not e!101207))))

(assert (=> b!151544 (= res!127089 (bvsle (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236193))) (currentByte!6463 (_2!7115 lt!236193)) (currentBit!6458 (_2!7115 lt!236193))) (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236193))) (currentByte!6463 (_2!7115 lt!236193)) (currentBit!6458 (_2!7115 lt!236193)))))))

(declare-fun b!151545 () Bool)

(declare-fun e!101206 () Bool)

(assert (=> b!151545 (= e!101207 e!101206)))

(declare-fun res!127088 () Bool)

(assert (=> b!151545 (=> res!127088 e!101206)))

(assert (=> b!151545 (= res!127088 (= (size!3050 (buf!3537 (_2!7115 lt!236193))) #b00000000000000000000000000000000))))

(declare-fun b!151546 () Bool)

(assert (=> b!151546 (= e!101206 (arrayBitRangesEq!0 (buf!3537 (_2!7115 lt!236193)) (buf!3537 (_2!7115 lt!236193)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236193))) (currentByte!6463 (_2!7115 lt!236193)) (currentBit!6458 (_2!7115 lt!236193)))))))

(assert (= (and d!49644 res!127087) b!151544))

(assert (= (and b!151544 res!127089) b!151545))

(assert (= (and b!151545 (not res!127088)) b!151546))

(assert (=> b!151544 m!235575))

(assert (=> b!151544 m!235575))

(assert (=> b!151546 m!235575))

(assert (=> b!151546 m!235575))

(declare-fun m!236921 () Bool)

(assert (=> b!151546 m!236921))

(assert (=> d!49244 d!49644))

(declare-fun d!49646 () Bool)

(declare-fun res!127090 () Bool)

(declare-fun e!101209 () Bool)

(assert (=> d!49646 (=> (not res!127090) (not e!101209))))

(assert (=> d!49646 (= res!127090 (= (size!3050 (buf!3537 thiss!1634)) (size!3050 (buf!3537 thiss!1634))))))

(assert (=> d!49646 (= (isPrefixOf!0 thiss!1634 thiss!1634) e!101209)))

(declare-fun b!151547 () Bool)

(declare-fun res!127092 () Bool)

(assert (=> b!151547 (=> (not res!127092) (not e!101209))))

(assert (=> b!151547 (= res!127092 (bvsle (bitIndex!0 (size!3050 (buf!3537 thiss!1634)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634)) (bitIndex!0 (size!3050 (buf!3537 thiss!1634)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634))))))

(declare-fun b!151548 () Bool)

(declare-fun e!101208 () Bool)

(assert (=> b!151548 (= e!101209 e!101208)))

(declare-fun res!127091 () Bool)

(assert (=> b!151548 (=> res!127091 e!101208)))

(assert (=> b!151548 (= res!127091 (= (size!3050 (buf!3537 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!151549 () Bool)

(assert (=> b!151549 (= e!101208 (arrayBitRangesEq!0 (buf!3537 thiss!1634) (buf!3537 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3050 (buf!3537 thiss!1634)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634))))))

(assert (= (and d!49646 res!127090) b!151547))

(assert (= (and b!151547 res!127092) b!151548))

(assert (= (and b!151548 (not res!127091)) b!151549))

(assert (=> b!151547 m!235513))

(assert (=> b!151547 m!235513))

(assert (=> b!151549 m!235513))

(assert (=> b!151549 m!235513))

(declare-fun m!236923 () Bool)

(assert (=> b!151549 m!236923))

(assert (=> d!49244 d!49646))

(declare-fun d!49648 () Bool)

(assert (=> d!49648 (isPrefixOf!0 lt!236641 (_2!7115 lt!236193))))

(declare-fun lt!237442 () Unit!9509)

(assert (=> d!49648 (= lt!237442 (choose!30 lt!236641 (_2!7115 lt!236193) (_2!7115 lt!236193)))))

(assert (=> d!49648 (isPrefixOf!0 lt!236641 (_2!7115 lt!236193))))

(assert (=> d!49648 (= (lemmaIsPrefixTransitive!0 lt!236641 (_2!7115 lt!236193) (_2!7115 lt!236193)) lt!237442)))

(declare-fun bs!12132 () Bool)

(assert (= bs!12132 d!49648))

(assert (=> bs!12132 m!235945))

(declare-fun m!236925 () Bool)

(assert (=> bs!12132 m!236925))

(assert (=> bs!12132 m!235945))

(assert (=> d!49244 d!49648))

(declare-fun d!49650 () Bool)

(assert (=> d!49650 (isPrefixOf!0 (_2!7115 lt!236193) (_2!7115 lt!236193))))

(declare-fun lt!237443 () Unit!9509)

(assert (=> d!49650 (= lt!237443 (choose!11 (_2!7115 lt!236193)))))

(assert (=> d!49650 (= (lemmaIsPrefixRefl!0 (_2!7115 lt!236193)) lt!237443)))

(declare-fun bs!12133 () Bool)

(assert (= bs!12133 d!49650))

(assert (=> bs!12133 m!235885))

(declare-fun m!236927 () Bool)

(assert (=> bs!12133 m!236927))

(assert (=> d!49244 d!49650))

(declare-fun d!49652 () Bool)

(assert (=> d!49652 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-fun lt!237444 () Unit!9509)

(assert (=> d!49652 (= lt!237444 (choose!11 thiss!1634))))

(assert (=> d!49652 (= (lemmaIsPrefixRefl!0 thiss!1634) lt!237444)))

(declare-fun bs!12134 () Bool)

(assert (= bs!12134 d!49652))

(assert (=> bs!12134 m!235933))

(declare-fun m!236929 () Bool)

(assert (=> bs!12134 m!236929))

(assert (=> d!49244 d!49652))

(declare-fun d!49654 () Bool)

(declare-fun res!127093 () Bool)

(declare-fun e!101211 () Bool)

(assert (=> d!49654 (=> (not res!127093) (not e!101211))))

(assert (=> d!49654 (= res!127093 (= (size!3050 (buf!3537 lt!236641)) (size!3050 (buf!3537 (_2!7115 lt!236193)))))))

(assert (=> d!49654 (= (isPrefixOf!0 lt!236641 (_2!7115 lt!236193)) e!101211)))

(declare-fun b!151550 () Bool)

(declare-fun res!127095 () Bool)

(assert (=> b!151550 (=> (not res!127095) (not e!101211))))

(assert (=> b!151550 (= res!127095 (bvsle (bitIndex!0 (size!3050 (buf!3537 lt!236641)) (currentByte!6463 lt!236641) (currentBit!6458 lt!236641)) (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236193))) (currentByte!6463 (_2!7115 lt!236193)) (currentBit!6458 (_2!7115 lt!236193)))))))

(declare-fun b!151551 () Bool)

(declare-fun e!101210 () Bool)

(assert (=> b!151551 (= e!101211 e!101210)))

(declare-fun res!127094 () Bool)

(assert (=> b!151551 (=> res!127094 e!101210)))

(assert (=> b!151551 (= res!127094 (= (size!3050 (buf!3537 lt!236641)) #b00000000000000000000000000000000))))

(declare-fun b!151552 () Bool)

(assert (=> b!151552 (= e!101210 (arrayBitRangesEq!0 (buf!3537 lt!236641) (buf!3537 (_2!7115 lt!236193)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3050 (buf!3537 lt!236641)) (currentByte!6463 lt!236641) (currentBit!6458 lt!236641))))))

(assert (= (and d!49654 res!127093) b!151550))

(assert (= (and b!151550 res!127095) b!151551))

(assert (= (and b!151551 (not res!127094)) b!151552))

(declare-fun m!236931 () Bool)

(assert (=> b!151550 m!236931))

(assert (=> b!151550 m!235575))

(assert (=> b!151552 m!236931))

(assert (=> b!151552 m!236931))

(declare-fun m!236933 () Bool)

(assert (=> b!151552 m!236933))

(assert (=> d!49244 d!49654))

(declare-fun d!49656 () Bool)

(declare-fun res!127096 () Bool)

(declare-fun e!101213 () Bool)

(assert (=> d!49656 (=> (not res!127096) (not e!101213))))

(assert (=> d!49656 (= res!127096 (= (size!3050 (buf!3537 lt!236641)) (size!3050 (buf!3537 lt!236641))))))

(assert (=> d!49656 (= (isPrefixOf!0 lt!236641 lt!236641) e!101213)))

(declare-fun b!151553 () Bool)

(declare-fun res!127098 () Bool)

(assert (=> b!151553 (=> (not res!127098) (not e!101213))))

(assert (=> b!151553 (= res!127098 (bvsle (bitIndex!0 (size!3050 (buf!3537 lt!236641)) (currentByte!6463 lt!236641) (currentBit!6458 lt!236641)) (bitIndex!0 (size!3050 (buf!3537 lt!236641)) (currentByte!6463 lt!236641) (currentBit!6458 lt!236641))))))

(declare-fun b!151554 () Bool)

(declare-fun e!101212 () Bool)

(assert (=> b!151554 (= e!101213 e!101212)))

(declare-fun res!127097 () Bool)

(assert (=> b!151554 (=> res!127097 e!101212)))

(assert (=> b!151554 (= res!127097 (= (size!3050 (buf!3537 lt!236641)) #b00000000000000000000000000000000))))

(declare-fun b!151555 () Bool)

(assert (=> b!151555 (= e!101212 (arrayBitRangesEq!0 (buf!3537 lt!236641) (buf!3537 lt!236641) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3050 (buf!3537 lt!236641)) (currentByte!6463 lt!236641) (currentBit!6458 lt!236641))))))

(assert (= (and d!49656 res!127096) b!151553))

(assert (= (and b!151553 res!127098) b!151554))

(assert (= (and b!151554 (not res!127097)) b!151555))

(assert (=> b!151553 m!236931))

(assert (=> b!151553 m!236931))

(assert (=> b!151555 m!236931))

(assert (=> b!151555 m!236931))

(declare-fun m!236935 () Bool)

(assert (=> b!151555 m!236935))

(assert (=> d!49244 d!49656))

(assert (=> d!49230 d!49228))

(declare-fun d!49658 () Bool)

(assert (=> d!49658 (arrayRangesEq!366 arr!237 (_2!7116 lt!236179) #b00000000000000000000000000000000 to!404)))

(assert (=> d!49658 true))

(declare-fun _$16!53 () Unit!9509)

(assert (=> d!49658 (= (choose!98 arr!237 (_2!7116 lt!236199) (_2!7116 lt!236179) #b00000000000000000000000000000000 to!404 to!404) _$16!53)))

(declare-fun bs!12135 () Bool)

(assert (= bs!12135 d!49658))

(assert (=> bs!12135 m!235503))

(assert (=> d!49230 d!49658))

(declare-fun d!49660 () Bool)

(declare-fun e!101216 () Bool)

(assert (=> d!49660 e!101216))

(declare-fun res!127101 () Bool)

(assert (=> d!49660 (=> (not res!127101) (not e!101216))))

(declare-fun lt!237450 () (_ BitVec 64))

(declare-fun lt!237449 () BitStream!5358)

(assert (=> d!49660 (= res!127101 (= (bvadd lt!237450 (bvsub lt!236657 lt!236650)) (bitIndex!0 (size!3050 (buf!3537 lt!237449)) (currentByte!6463 lt!237449) (currentBit!6458 lt!237449))))))

(assert (=> d!49660 (or (not (= (bvand lt!237450 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!236657 lt!236650) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!237450 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!237450 (bvsub lt!236657 lt!236650)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!49660 (= lt!237450 (bitIndex!0 (size!3050 (buf!3537 (_2!7117 lt!236647))) (currentByte!6463 (_2!7117 lt!236647)) (currentBit!6458 (_2!7117 lt!236647))))))

(declare-fun moveBitIndex!0 (BitStream!5358 (_ BitVec 64)) tuple2!13490)

(assert (=> d!49660 (= lt!237449 (_2!7115 (moveBitIndex!0 (_2!7117 lt!236647) (bvsub lt!236657 lt!236650))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!5358 (_ BitVec 64)) Bool)

(assert (=> d!49660 (moveBitIndexPrecond!0 (_2!7117 lt!236647) (bvsub lt!236657 lt!236650))))

(assert (=> d!49660 (= (withMovedBitIndex!0 (_2!7117 lt!236647) (bvsub lt!236657 lt!236650)) lt!237449)))

(declare-fun b!151558 () Bool)

(assert (=> b!151558 (= e!101216 (= (size!3050 (buf!3537 (_2!7117 lt!236647))) (size!3050 (buf!3537 lt!237449))))))

(assert (= (and d!49660 res!127101) b!151558))

(declare-fun m!236937 () Bool)

(assert (=> d!49660 m!236937))

(declare-fun m!236939 () Bool)

(assert (=> d!49660 m!236939))

(declare-fun m!236941 () Bool)

(assert (=> d!49660 m!236941))

(declare-fun m!236943 () Bool)

(assert (=> d!49660 m!236943))

(assert (=> b!151130 d!49660))

(assert (=> b!151130 d!49183))

(assert (=> b!151130 d!49194))

(declare-fun d!49662 () Bool)

(declare-fun res!127102 () Bool)

(declare-fun e!101217 () Bool)

(assert (=> d!49662 (=> res!127102 e!101217)))

(assert (=> d!49662 (= res!127102 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!49662 (= (arrayRangesEq!366 arr!237 (_2!7116 lt!236867) #b00000000000000000000000000000000 to!404) e!101217)))

(declare-fun b!151559 () Bool)

(declare-fun e!101218 () Bool)

(assert (=> b!151559 (= e!101217 e!101218)))

(declare-fun res!127103 () Bool)

(assert (=> b!151559 (=> (not res!127103) (not e!101218))))

(assert (=> b!151559 (= res!127103 (= (select (arr!3852 arr!237) #b00000000000000000000000000000000) (select (arr!3852 (_2!7116 lt!236867)) #b00000000000000000000000000000000)))))

(declare-fun b!151560 () Bool)

(assert (=> b!151560 (= e!101218 (arrayRangesEq!366 arr!237 (_2!7116 lt!236867) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!49662 (not res!127102)) b!151559))

(assert (= (and b!151559 res!127103) b!151560))

(assert (=> b!151559 m!235809))

(declare-fun m!236945 () Bool)

(assert (=> b!151559 m!236945))

(declare-fun m!236947 () Bool)

(assert (=> b!151560 m!236947))

(assert (=> b!151232 d!49662))

(assert (=> d!49250 d!49169))

(declare-fun d!49664 () Bool)

(declare-fun res!127104 () Bool)

(declare-fun e!101220 () Bool)

(assert (=> d!49664 (=> (not res!127104) (not e!101220))))

(assert (=> d!49664 (= res!127104 (= (size!3050 (buf!3537 (_1!7117 lt!236557))) (size!3050 (buf!3537 (_2!7115 lt!236193)))))))

(assert (=> d!49664 (= (isPrefixOf!0 (_1!7117 lt!236557) (_2!7115 lt!236193)) e!101220)))

(declare-fun b!151561 () Bool)

(declare-fun res!127106 () Bool)

(assert (=> b!151561 (=> (not res!127106) (not e!101220))))

(assert (=> b!151561 (= res!127106 (bvsle (bitIndex!0 (size!3050 (buf!3537 (_1!7117 lt!236557))) (currentByte!6463 (_1!7117 lt!236557)) (currentBit!6458 (_1!7117 lt!236557))) (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236193))) (currentByte!6463 (_2!7115 lt!236193)) (currentBit!6458 (_2!7115 lt!236193)))))))

(declare-fun b!151562 () Bool)

(declare-fun e!101219 () Bool)

(assert (=> b!151562 (= e!101220 e!101219)))

(declare-fun res!127105 () Bool)

(assert (=> b!151562 (=> res!127105 e!101219)))

(assert (=> b!151562 (= res!127105 (= (size!3050 (buf!3537 (_1!7117 lt!236557))) #b00000000000000000000000000000000))))

(declare-fun b!151563 () Bool)

(assert (=> b!151563 (= e!101219 (arrayBitRangesEq!0 (buf!3537 (_1!7117 lt!236557)) (buf!3537 (_2!7115 lt!236193)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3050 (buf!3537 (_1!7117 lt!236557))) (currentByte!6463 (_1!7117 lt!236557)) (currentBit!6458 (_1!7117 lt!236557)))))))

(assert (= (and d!49664 res!127104) b!151561))

(assert (= (and b!151561 res!127106) b!151562))

(assert (= (and b!151562 (not res!127105)) b!151563))

(declare-fun m!236949 () Bool)

(assert (=> b!151561 m!236949))

(assert (=> b!151561 m!235575))

(assert (=> b!151563 m!236949))

(assert (=> b!151563 m!236949))

(declare-fun m!236951 () Bool)

(assert (=> b!151563 m!236951))

(assert (=> b!151095 d!49664))

(assert (=> d!49175 d!49171))

(declare-fun d!49666 () Bool)

(assert (=> d!49666 (validate_offset_bits!1 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236195)))) ((_ sign_extend 32) (currentByte!6463 thiss!1634)) ((_ sign_extend 32) (currentBit!6458 thiss!1634)) lt!236178)))

(assert (=> d!49666 true))

(declare-fun _$6!338 () Unit!9509)

(assert (=> d!49666 (= (choose!9 thiss!1634 (buf!3537 (_2!7115 lt!236195)) lt!236178 (BitStream!5359 (buf!3537 (_2!7115 lt!236195)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634))) _$6!338)))

(declare-fun bs!12136 () Bool)

(assert (= bs!12136 d!49666))

(assert (=> bs!12136 m!235581))

(assert (=> d!49175 d!49666))

(declare-fun d!49668 () Bool)

(declare-fun res!127107 () Bool)

(declare-fun e!101222 () Bool)

(assert (=> d!49668 (=> (not res!127107) (not e!101222))))

(assert (=> d!49668 (= res!127107 (= (size!3050 (buf!3537 (_2!7117 lt!236557))) (size!3050 (buf!3537 (_2!7115 lt!236195)))))))

(assert (=> d!49668 (= (isPrefixOf!0 (_2!7117 lt!236557) (_2!7115 lt!236195)) e!101222)))

(declare-fun b!151564 () Bool)

(declare-fun res!127109 () Bool)

(assert (=> b!151564 (=> (not res!127109) (not e!101222))))

(assert (=> b!151564 (= res!127109 (bvsle (bitIndex!0 (size!3050 (buf!3537 (_2!7117 lt!236557))) (currentByte!6463 (_2!7117 lt!236557)) (currentBit!6458 (_2!7117 lt!236557))) (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236195))) (currentByte!6463 (_2!7115 lt!236195)) (currentBit!6458 (_2!7115 lt!236195)))))))

(declare-fun b!151565 () Bool)

(declare-fun e!101221 () Bool)

(assert (=> b!151565 (= e!101222 e!101221)))

(declare-fun res!127108 () Bool)

(assert (=> b!151565 (=> res!127108 e!101221)))

(assert (=> b!151565 (= res!127108 (= (size!3050 (buf!3537 (_2!7117 lt!236557))) #b00000000000000000000000000000000))))

(declare-fun b!151566 () Bool)

(assert (=> b!151566 (= e!101221 (arrayBitRangesEq!0 (buf!3537 (_2!7117 lt!236557)) (buf!3537 (_2!7115 lt!236195)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3050 (buf!3537 (_2!7117 lt!236557))) (currentByte!6463 (_2!7117 lt!236557)) (currentBit!6458 (_2!7117 lt!236557)))))))

(assert (= (and d!49668 res!127107) b!151564))

(assert (= (and b!151564 res!127109) b!151565))

(assert (= (and b!151565 (not res!127108)) b!151566))

(declare-fun m!236953 () Bool)

(assert (=> b!151564 m!236953))

(assert (=> b!151564 m!235511))

(assert (=> b!151566 m!236953))

(assert (=> b!151566 m!236953))

(declare-fun m!236955 () Bool)

(assert (=> b!151566 m!236955))

(assert (=> b!151093 d!49668))

(declare-fun lt!237451 () tuple3!596)

(declare-fun d!49670 () Bool)

(assert (=> d!49670 (= lt!237451 (readByteArrayLoop!0 (_1!7117 lt!236870) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!49670 (= (readByteArrayLoopPure!0 (_1!7117 lt!236870) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13493 (_2!7125 lt!237451) (_3!371 lt!237451)))))

(declare-fun bs!12137 () Bool)

(assert (= bs!12137 d!49670))

(declare-fun m!236957 () Bool)

(assert (=> bs!12137 m!236957))

(assert (=> b!151230 d!49670))

(declare-fun d!49672 () Bool)

(assert (=> d!49672 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236872)))) ((_ sign_extend 32) (currentByte!6463 (_2!7115 lt!236193))) ((_ sign_extend 32) (currentBit!6458 (_2!7115 lt!236193))) lt!236869) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236872)))) ((_ sign_extend 32) (currentByte!6463 (_2!7115 lt!236193))) ((_ sign_extend 32) (currentBit!6458 (_2!7115 lt!236193)))) lt!236869))))

(declare-fun bs!12138 () Bool)

(assert (= bs!12138 d!49672))

(declare-fun m!236959 () Bool)

(assert (=> bs!12138 m!236959))

(assert (=> b!151230 d!49672))

(declare-fun d!49674 () Bool)

(assert (=> d!49674 (validate_offset_bits!1 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236872)))) ((_ sign_extend 32) (currentByte!6463 (_2!7115 lt!236193))) ((_ sign_extend 32) (currentBit!6458 (_2!7115 lt!236193))) lt!236869)))

(declare-fun lt!237452 () Unit!9509)

(assert (=> d!49674 (= lt!237452 (choose!9 (_2!7115 lt!236193) (buf!3537 (_2!7115 lt!236872)) lt!236869 (BitStream!5359 (buf!3537 (_2!7115 lt!236872)) (currentByte!6463 (_2!7115 lt!236193)) (currentBit!6458 (_2!7115 lt!236193)))))))

(assert (=> d!49674 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!7115 lt!236193) (buf!3537 (_2!7115 lt!236872)) lt!236869) lt!237452)))

(declare-fun bs!12139 () Bool)

(assert (= bs!12139 d!49674))

(assert (=> bs!12139 m!236171))

(declare-fun m!236961 () Bool)

(assert (=> bs!12139 m!236961))

(assert (=> b!151230 d!49674))

(declare-fun b!151567 () Bool)

(declare-fun e!101223 () Unit!9509)

(declare-fun lt!237466 () Unit!9509)

(assert (=> b!151567 (= e!101223 lt!237466)))

(declare-fun lt!237465 () (_ BitVec 64))

(assert (=> b!151567 (= lt!237465 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!237459 () (_ BitVec 64))

(assert (=> b!151567 (= lt!237459 (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236193))) (currentByte!6463 (_2!7115 lt!236193)) (currentBit!6458 (_2!7115 lt!236193))))))

(assert (=> b!151567 (= lt!237466 (arrayBitRangesEqSymmetric!0 (buf!3537 (_2!7115 lt!236193)) (buf!3537 (_2!7115 lt!236872)) lt!237465 lt!237459))))

(assert (=> b!151567 (arrayBitRangesEq!0 (buf!3537 (_2!7115 lt!236872)) (buf!3537 (_2!7115 lt!236193)) lt!237465 lt!237459)))

(declare-fun d!49676 () Bool)

(declare-fun e!101224 () Bool)

(assert (=> d!49676 e!101224))

(declare-fun res!127110 () Bool)

(assert (=> d!49676 (=> (not res!127110) (not e!101224))))

(declare-fun lt!237454 () tuple2!13494)

(assert (=> d!49676 (= res!127110 (isPrefixOf!0 (_1!7117 lt!237454) (_2!7117 lt!237454)))))

(declare-fun lt!237469 () BitStream!5358)

(assert (=> d!49676 (= lt!237454 (tuple2!13495 lt!237469 (_2!7115 lt!236872)))))

(declare-fun lt!237455 () Unit!9509)

(declare-fun lt!237467 () Unit!9509)

(assert (=> d!49676 (= lt!237455 lt!237467)))

(assert (=> d!49676 (isPrefixOf!0 lt!237469 (_2!7115 lt!236872))))

(assert (=> d!49676 (= lt!237467 (lemmaIsPrefixTransitive!0 lt!237469 (_2!7115 lt!236872) (_2!7115 lt!236872)))))

(declare-fun lt!237458 () Unit!9509)

(declare-fun lt!237472 () Unit!9509)

(assert (=> d!49676 (= lt!237458 lt!237472)))

(assert (=> d!49676 (isPrefixOf!0 lt!237469 (_2!7115 lt!236872))))

(assert (=> d!49676 (= lt!237472 (lemmaIsPrefixTransitive!0 lt!237469 (_2!7115 lt!236193) (_2!7115 lt!236872)))))

(declare-fun lt!237460 () Unit!9509)

(assert (=> d!49676 (= lt!237460 e!101223)))

(declare-fun c!8103 () Bool)

(assert (=> d!49676 (= c!8103 (not (= (size!3050 (buf!3537 (_2!7115 lt!236193))) #b00000000000000000000000000000000)))))

(declare-fun lt!237463 () Unit!9509)

(declare-fun lt!237461 () Unit!9509)

(assert (=> d!49676 (= lt!237463 lt!237461)))

(assert (=> d!49676 (isPrefixOf!0 (_2!7115 lt!236872) (_2!7115 lt!236872))))

(assert (=> d!49676 (= lt!237461 (lemmaIsPrefixRefl!0 (_2!7115 lt!236872)))))

(declare-fun lt!237471 () Unit!9509)

(declare-fun lt!237462 () Unit!9509)

(assert (=> d!49676 (= lt!237471 lt!237462)))

(assert (=> d!49676 (= lt!237462 (lemmaIsPrefixRefl!0 (_2!7115 lt!236872)))))

(declare-fun lt!237470 () Unit!9509)

(declare-fun lt!237468 () Unit!9509)

(assert (=> d!49676 (= lt!237470 lt!237468)))

(assert (=> d!49676 (isPrefixOf!0 lt!237469 lt!237469)))

(assert (=> d!49676 (= lt!237468 (lemmaIsPrefixRefl!0 lt!237469))))

(declare-fun lt!237456 () Unit!9509)

(declare-fun lt!237453 () Unit!9509)

(assert (=> d!49676 (= lt!237456 lt!237453)))

(assert (=> d!49676 (isPrefixOf!0 (_2!7115 lt!236193) (_2!7115 lt!236193))))

(assert (=> d!49676 (= lt!237453 (lemmaIsPrefixRefl!0 (_2!7115 lt!236193)))))

(assert (=> d!49676 (= lt!237469 (BitStream!5359 (buf!3537 (_2!7115 lt!236872)) (currentByte!6463 (_2!7115 lt!236193)) (currentBit!6458 (_2!7115 lt!236193))))))

(assert (=> d!49676 (isPrefixOf!0 (_2!7115 lt!236193) (_2!7115 lt!236872))))

(assert (=> d!49676 (= (reader!0 (_2!7115 lt!236193) (_2!7115 lt!236872)) lt!237454)))

(declare-fun b!151568 () Bool)

(declare-fun Unit!9562 () Unit!9509)

(assert (=> b!151568 (= e!101223 Unit!9562)))

(declare-fun b!151569 () Bool)

(declare-fun res!127112 () Bool)

(assert (=> b!151569 (=> (not res!127112) (not e!101224))))

(assert (=> b!151569 (= res!127112 (isPrefixOf!0 (_2!7117 lt!237454) (_2!7115 lt!236872)))))

(declare-fun b!151570 () Bool)

(declare-fun lt!237464 () (_ BitVec 64))

(declare-fun lt!237457 () (_ BitVec 64))

(assert (=> b!151570 (= e!101224 (= (_1!7117 lt!237454) (withMovedBitIndex!0 (_2!7117 lt!237454) (bvsub lt!237464 lt!237457))))))

(assert (=> b!151570 (or (= (bvand lt!237464 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!237457 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!237464 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!237464 lt!237457) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!151570 (= lt!237457 (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236872))) (currentByte!6463 (_2!7115 lt!236872)) (currentBit!6458 (_2!7115 lt!236872))))))

(assert (=> b!151570 (= lt!237464 (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236193))) (currentByte!6463 (_2!7115 lt!236193)) (currentBit!6458 (_2!7115 lt!236193))))))

(declare-fun b!151571 () Bool)

(declare-fun res!127111 () Bool)

(assert (=> b!151571 (=> (not res!127111) (not e!101224))))

(assert (=> b!151571 (= res!127111 (isPrefixOf!0 (_1!7117 lt!237454) (_2!7115 lt!236193)))))

(assert (= (and d!49676 c!8103) b!151567))

(assert (= (and d!49676 (not c!8103)) b!151568))

(assert (= (and d!49676 res!127110) b!151571))

(assert (= (and b!151571 res!127111) b!151569))

(assert (= (and b!151569 res!127112) b!151570))

(declare-fun m!236963 () Bool)

(assert (=> b!151570 m!236963))

(assert (=> b!151570 m!236161))

(assert (=> b!151570 m!235575))

(declare-fun m!236965 () Bool)

(assert (=> b!151569 m!236965))

(assert (=> d!49676 m!235885))

(declare-fun m!236967 () Bool)

(assert (=> d!49676 m!236967))

(declare-fun m!236969 () Bool)

(assert (=> d!49676 m!236969))

(assert (=> d!49676 m!236177))

(declare-fun m!236971 () Bool)

(assert (=> d!49676 m!236971))

(declare-fun m!236973 () Bool)

(assert (=> d!49676 m!236973))

(assert (=> d!49676 m!235895))

(declare-fun m!236975 () Bool)

(assert (=> d!49676 m!236975))

(declare-fun m!236977 () Bool)

(assert (=> d!49676 m!236977))

(declare-fun m!236979 () Bool)

(assert (=> d!49676 m!236979))

(declare-fun m!236981 () Bool)

(assert (=> d!49676 m!236981))

(assert (=> b!151567 m!235575))

(declare-fun m!236983 () Bool)

(assert (=> b!151567 m!236983))

(declare-fun m!236985 () Bool)

(assert (=> b!151567 m!236985))

(declare-fun m!236987 () Bool)

(assert (=> b!151571 m!236987))

(assert (=> b!151230 d!49676))

(declare-fun d!49678 () Bool)

(declare-fun e!101225 () Bool)

(assert (=> d!49678 e!101225))

(declare-fun res!127113 () Bool)

(assert (=> d!49678 (=> (not res!127113) (not e!101225))))

(declare-fun lt!237473 () (_ BitVec 64))

(declare-fun lt!237474 () (_ BitVec 64))

(declare-fun lt!237478 () (_ BitVec 64))

(assert (=> d!49678 (= res!127113 (= lt!237473 (bvsub lt!237474 lt!237478)))))

(assert (=> d!49678 (or (= (bvand lt!237474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!237478 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!237474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!237474 lt!237478) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!49678 (= lt!237478 (remainingBits!0 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236872)))) ((_ sign_extend 32) (currentByte!6463 (_2!7115 lt!236872))) ((_ sign_extend 32) (currentBit!6458 (_2!7115 lt!236872)))))))

(declare-fun lt!237477 () (_ BitVec 64))

(declare-fun lt!237476 () (_ BitVec 64))

(assert (=> d!49678 (= lt!237474 (bvmul lt!237477 lt!237476))))

(assert (=> d!49678 (or (= lt!237477 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!237476 (bvsdiv (bvmul lt!237477 lt!237476) lt!237477)))))

(assert (=> d!49678 (= lt!237476 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!49678 (= lt!237477 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236872)))))))

(assert (=> d!49678 (= lt!237473 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6463 (_2!7115 lt!236872))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6458 (_2!7115 lt!236872)))))))

(assert (=> d!49678 (invariant!0 (currentBit!6458 (_2!7115 lt!236872)) (currentByte!6463 (_2!7115 lt!236872)) (size!3050 (buf!3537 (_2!7115 lt!236872))))))

(assert (=> d!49678 (= (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236872))) (currentByte!6463 (_2!7115 lt!236872)) (currentBit!6458 (_2!7115 lt!236872))) lt!237473)))

(declare-fun b!151572 () Bool)

(declare-fun res!127114 () Bool)

(assert (=> b!151572 (=> (not res!127114) (not e!101225))))

(assert (=> b!151572 (= res!127114 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!237473))))

(declare-fun b!151573 () Bool)

(declare-fun lt!237475 () (_ BitVec 64))

(assert (=> b!151573 (= e!101225 (bvsle lt!237473 (bvmul lt!237475 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!151573 (or (= lt!237475 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!237475 #b0000000000000000000000000000000000000000000000000000000000001000) lt!237475)))))

(assert (=> b!151573 (= lt!237475 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236872)))))))

(assert (= (and d!49678 res!127113) b!151572))

(assert (= (and b!151572 res!127114) b!151573))

(declare-fun m!236989 () Bool)

(assert (=> d!49678 m!236989))

(declare-fun m!236991 () Bool)

(assert (=> d!49678 m!236991))

(assert (=> b!151228 d!49678))

(assert (=> b!151228 d!49190))

(assert (=> b!151091 d!49190))

(declare-fun d!49680 () Bool)

(assert (=> d!49680 (arrayBitRangesEq!0 (buf!3537 (_2!7115 lt!236195)) (buf!3537 (_2!7115 lt!236193)) lt!236568 lt!236562)))

(declare-fun lt!237481 () Unit!9509)

(declare-fun choose!8 (array!6742 array!6742 (_ BitVec 64) (_ BitVec 64)) Unit!9509)

(assert (=> d!49680 (= lt!237481 (choose!8 (buf!3537 (_2!7115 lt!236193)) (buf!3537 (_2!7115 lt!236195)) lt!236568 lt!236562))))

(assert (=> d!49680 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!236568) (bvsle lt!236568 lt!236562))))

(assert (=> d!49680 (= (arrayBitRangesEqSymmetric!0 (buf!3537 (_2!7115 lt!236193)) (buf!3537 (_2!7115 lt!236195)) lt!236568 lt!236562) lt!237481)))

(declare-fun bs!12140 () Bool)

(assert (= bs!12140 d!49680))

(assert (=> bs!12140 m!235907))

(declare-fun m!236993 () Bool)

(assert (=> bs!12140 m!236993))

(assert (=> b!151091 d!49680))

(declare-fun b!151588 () Bool)

(declare-fun e!101240 () Bool)

(declare-fun e!101239 () Bool)

(assert (=> b!151588 (= e!101240 e!101239)))

(declare-fun c!8106 () Bool)

(declare-datatypes ((tuple4!148 0))(
  ( (tuple4!149 (_1!7131 (_ BitVec 32)) (_2!7131 (_ BitVec 32)) (_3!374 (_ BitVec 32)) (_4!74 (_ BitVec 32))) )
))
(declare-fun lt!237490 () tuple4!148)

(assert (=> b!151588 (= c!8106 (= (_3!374 lt!237490) (_4!74 lt!237490)))))

(declare-fun b!151589 () Bool)

(declare-fun res!127125 () Bool)

(declare-fun lt!237488 () (_ BitVec 32))

(assert (=> b!151589 (= res!127125 (= lt!237488 #b00000000000000000000000000000000))))

(declare-fun e!101243 () Bool)

(assert (=> b!151589 (=> res!127125 e!101243)))

(declare-fun e!101242 () Bool)

(assert (=> b!151589 (= e!101242 e!101243)))

(declare-fun call!2079 () Bool)

(declare-fun lt!237489 () (_ BitVec 32))

(declare-fun bm!2076 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2076 (= call!2079 (byteRangesEq!0 (ite c!8106 (select (arr!3852 (buf!3537 (_2!7115 lt!236195))) (_3!374 lt!237490)) (select (arr!3852 (buf!3537 (_2!7115 lt!236195))) (_4!74 lt!237490))) (ite c!8106 (select (arr!3852 (buf!3537 (_2!7115 lt!236193))) (_3!374 lt!237490)) (select (arr!3852 (buf!3537 (_2!7115 lt!236193))) (_4!74 lt!237490))) (ite c!8106 lt!237489 #b00000000000000000000000000000000) lt!237488))))

(declare-fun b!151590 () Bool)

(assert (=> b!151590 (= e!101239 e!101242)))

(declare-fun res!127127 () Bool)

(assert (=> b!151590 (= res!127127 (byteRangesEq!0 (select (arr!3852 (buf!3537 (_2!7115 lt!236195))) (_3!374 lt!237490)) (select (arr!3852 (buf!3537 (_2!7115 lt!236193))) (_3!374 lt!237490)) lt!237489 #b00000000000000000000000000001000))))

(assert (=> b!151590 (=> (not res!127127) (not e!101242))))

(declare-fun b!151591 () Bool)

(declare-fun e!101238 () Bool)

(assert (=> b!151591 (= e!101238 (arrayRangesEq!366 (buf!3537 (_2!7115 lt!236195)) (buf!3537 (_2!7115 lt!236193)) (_1!7131 lt!237490) (_2!7131 lt!237490)))))

(declare-fun d!49682 () Bool)

(declare-fun res!127129 () Bool)

(declare-fun e!101241 () Bool)

(assert (=> d!49682 (=> res!127129 e!101241)))

(assert (=> d!49682 (= res!127129 (bvsge lt!236568 lt!236562))))

(assert (=> d!49682 (= (arrayBitRangesEq!0 (buf!3537 (_2!7115 lt!236195)) (buf!3537 (_2!7115 lt!236193)) lt!236568 lt!236562) e!101241)))

(declare-fun b!151592 () Bool)

(assert (=> b!151592 (= e!101243 call!2079)))

(declare-fun b!151593 () Bool)

(assert (=> b!151593 (= e!101239 call!2079)))

(declare-fun b!151594 () Bool)

(assert (=> b!151594 (= e!101241 e!101240)))

(declare-fun res!127126 () Bool)

(assert (=> b!151594 (=> (not res!127126) (not e!101240))))

(assert (=> b!151594 (= res!127126 e!101238)))

(declare-fun res!127128 () Bool)

(assert (=> b!151594 (=> res!127128 e!101238)))

(assert (=> b!151594 (= res!127128 (bvsge (_1!7131 lt!237490) (_2!7131 lt!237490)))))

(assert (=> b!151594 (= lt!237488 ((_ extract 31 0) (bvsrem lt!236562 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!151594 (= lt!237489 ((_ extract 31 0) (bvsrem lt!236568 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!148)

(assert (=> b!151594 (= lt!237490 (arrayBitIndices!0 lt!236568 lt!236562))))

(assert (= (and d!49682 (not res!127129)) b!151594))

(assert (= (and b!151594 (not res!127128)) b!151591))

(assert (= (and b!151594 res!127126) b!151588))

(assert (= (and b!151588 c!8106) b!151593))

(assert (= (and b!151588 (not c!8106)) b!151590))

(assert (= (and b!151590 res!127127) b!151589))

(assert (= (and b!151589 (not res!127125)) b!151592))

(assert (= (or b!151593 b!151592) bm!2076))

(declare-fun m!236995 () Bool)

(assert (=> bm!2076 m!236995))

(declare-fun m!236997 () Bool)

(assert (=> bm!2076 m!236997))

(declare-fun m!236999 () Bool)

(assert (=> bm!2076 m!236999))

(declare-fun m!237001 () Bool)

(assert (=> bm!2076 m!237001))

(declare-fun m!237003 () Bool)

(assert (=> bm!2076 m!237003))

(assert (=> b!151590 m!237003))

(assert (=> b!151590 m!236999))

(assert (=> b!151590 m!237003))

(assert (=> b!151590 m!236999))

(declare-fun m!237005 () Bool)

(assert (=> b!151590 m!237005))

(declare-fun m!237007 () Bool)

(assert (=> b!151591 m!237007))

(declare-fun m!237009 () Bool)

(assert (=> b!151594 m!237009))

(assert (=> b!151091 d!49682))

(declare-fun b!151605 () Bool)

(declare-fun e!101255 () Bool)

(declare-fun e!101254 () Bool)

(assert (=> b!151605 (= e!101255 e!101254)))

(declare-fun res!127141 () Bool)

(assert (=> b!151605 (=> (not res!127141) (not e!101254))))

(declare-fun lt!237505 () tuple2!13492)

(declare-fun lt!237504 () tuple2!13494)

(assert (=> b!151605 (= res!127141 (and (= (size!3050 (_2!7116 lt!237505)) (size!3050 arr!237)) (= (_1!7116 lt!237505) (_2!7117 lt!237504))))))

(assert (=> b!151605 (= lt!237505 (readByteArrayLoopPure!0 (_1!7117 lt!237504) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!237501 () Unit!9509)

(declare-fun lt!237502 () Unit!9509)

(assert (=> b!151605 (= lt!237501 lt!237502)))

(declare-fun _$39!63 () tuple2!13490)

(declare-fun lt!237503 () (_ BitVec 64))

(assert (=> b!151605 (validate_offset_bits!1 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 _$39!63)))) ((_ sign_extend 32) (currentByte!6463 (_2!7115 lt!236193))) ((_ sign_extend 32) (currentBit!6458 (_2!7115 lt!236193))) lt!237503)))

(assert (=> b!151605 (= lt!237502 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!7115 lt!236193) (buf!3537 (_2!7115 _$39!63)) lt!237503))))

(assert (=> b!151605 (= lt!237503 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!151605 (= lt!237504 (reader!0 (_2!7115 lt!236193) (_2!7115 _$39!63)))))

(declare-fun d!49684 () Bool)

(assert (=> d!49684 e!101255))

(declare-fun res!127140 () Bool)

(assert (=> d!49684 (=> (not res!127140) (not e!101255))))

(assert (=> d!49684 (= res!127140 (= (size!3050 (buf!3537 (_2!7115 lt!236193))) (size!3050 (buf!3537 (_2!7115 _$39!63)))))))

(declare-fun e!101252 () Bool)

(assert (=> d!49684 (and (inv!12 (_2!7115 _$39!63)) e!101252)))

(assert (=> d!49684 (= (choose!64 (_2!7115 lt!236193) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) _$39!63)))

(declare-fun b!151606 () Bool)

(declare-fun res!127138 () Bool)

(assert (=> b!151606 (=> (not res!127138) (not e!101255))))

(assert (=> b!151606 (= res!127138 (isPrefixOf!0 (_2!7115 lt!236193) (_2!7115 _$39!63)))))

(declare-fun b!151607 () Bool)

(assert (=> b!151607 (= e!101252 (array_inv!2839 (buf!3537 (_2!7115 _$39!63))))))

(declare-fun b!151608 () Bool)

(assert (=> b!151608 (= e!101254 (arrayRangesEq!366 arr!237 (_2!7116 lt!237505) #b00000000000000000000000000000000 to!404))))

(declare-fun b!151609 () Bool)

(declare-fun res!127139 () Bool)

(assert (=> b!151609 (=> (not res!127139) (not e!101255))))

(assert (=> b!151609 (= res!127139 (= (bitIndex!0 (size!3050 (buf!3537 (_2!7115 _$39!63))) (currentByte!6463 (_2!7115 _$39!63)) (currentBit!6458 (_2!7115 _$39!63))) (bvadd (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236193))) (currentByte!6463 (_2!7115 lt!236193)) (currentBit!6458 (_2!7115 lt!236193))) (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= d!49684 b!151607))

(assert (= (and d!49684 res!127140) b!151609))

(assert (= (and b!151609 res!127139) b!151606))

(assert (= (and b!151606 res!127138) b!151605))

(assert (= (and b!151605 res!127141) b!151608))

(declare-fun m!237011 () Bool)

(assert (=> b!151609 m!237011))

(assert (=> b!151609 m!235575))

(declare-fun m!237013 () Bool)

(assert (=> b!151608 m!237013))

(declare-fun m!237015 () Bool)

(assert (=> d!49684 m!237015))

(declare-fun m!237017 () Bool)

(assert (=> b!151607 m!237017))

(declare-fun m!237019 () Bool)

(assert (=> b!151606 m!237019))

(declare-fun m!237021 () Bool)

(assert (=> b!151605 m!237021))

(declare-fun m!237023 () Bool)

(assert (=> b!151605 m!237023))

(declare-fun m!237025 () Bool)

(assert (=> b!151605 m!237025))

(declare-fun m!237027 () Bool)

(assert (=> b!151605 m!237027))

(assert (=> d!49306 d!49684))

(declare-fun d!49686 () Bool)

(declare-fun res!127142 () Bool)

(declare-fun e!101256 () Bool)

(assert (=> d!49686 (=> res!127142 e!101256)))

(assert (=> d!49686 (= res!127142 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!49686 (= (arrayRangesEq!366 arr!237 (_2!7116 lt!236179) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!101256)))

(declare-fun b!151610 () Bool)

(declare-fun e!101257 () Bool)

(assert (=> b!151610 (= e!101256 e!101257)))

(declare-fun res!127143 () Bool)

(assert (=> b!151610 (=> (not res!127143) (not e!101257))))

(assert (=> b!151610 (= res!127143 (= (select (arr!3852 arr!237) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3852 (_2!7116 lt!236179)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!151611 () Bool)

(assert (=> b!151611 (= e!101257 (arrayRangesEq!366 arr!237 (_2!7116 lt!236179) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!49686 (not res!127142)) b!151610))

(assert (= (and b!151610 res!127143) b!151611))

(assert (=> b!151610 m!236891))

(declare-fun m!237029 () Bool)

(assert (=> b!151610 m!237029))

(declare-fun m!237031 () Bool)

(assert (=> b!151611 m!237031))

(assert (=> b!151097 d!49686))

(declare-fun b!151612 () Bool)

(declare-fun e!101260 () Bool)

(declare-fun e!101259 () Bool)

(assert (=> b!151612 (= e!101260 e!101259)))

(declare-fun c!8107 () Bool)

(declare-fun lt!237508 () tuple4!148)

(assert (=> b!151612 (= c!8107 (= (_3!374 lt!237508) (_4!74 lt!237508)))))

(declare-fun b!151613 () Bool)

(declare-fun res!127144 () Bool)

(declare-fun lt!237506 () (_ BitVec 32))

(assert (=> b!151613 (= res!127144 (= lt!237506 #b00000000000000000000000000000000))))

(declare-fun e!101263 () Bool)

(assert (=> b!151613 (=> res!127144 e!101263)))

(declare-fun e!101262 () Bool)

(assert (=> b!151613 (= e!101262 e!101263)))

(declare-fun call!2080 () Bool)

(declare-fun lt!237507 () (_ BitVec 32))

(declare-fun bm!2077 () Bool)

(assert (=> bm!2077 (= call!2080 (byteRangesEq!0 (ite c!8107 (select (arr!3852 (buf!3537 thiss!1634)) (_3!374 lt!237508)) (select (arr!3852 (buf!3537 thiss!1634)) (_4!74 lt!237508))) (ite c!8107 (select (arr!3852 (buf!3537 (_2!7115 lt!236193))) (_3!374 lt!237508)) (select (arr!3852 (buf!3537 (_2!7115 lt!236193))) (_4!74 lt!237508))) (ite c!8107 lt!237507 #b00000000000000000000000000000000) lt!237506))))

(declare-fun b!151614 () Bool)

(assert (=> b!151614 (= e!101259 e!101262)))

(declare-fun res!127146 () Bool)

(assert (=> b!151614 (= res!127146 (byteRangesEq!0 (select (arr!3852 (buf!3537 thiss!1634)) (_3!374 lt!237508)) (select (arr!3852 (buf!3537 (_2!7115 lt!236193))) (_3!374 lt!237508)) lt!237507 #b00000000000000000000000000001000))))

(assert (=> b!151614 (=> (not res!127146) (not e!101262))))

(declare-fun b!151615 () Bool)

(declare-fun e!101258 () Bool)

(assert (=> b!151615 (= e!101258 (arrayRangesEq!366 (buf!3537 thiss!1634) (buf!3537 (_2!7115 lt!236193)) (_1!7131 lt!237508) (_2!7131 lt!237508)))))

(declare-fun d!49688 () Bool)

(declare-fun res!127148 () Bool)

(declare-fun e!101261 () Bool)

(assert (=> d!49688 (=> res!127148 e!101261)))

(assert (=> d!49688 (= res!127148 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3050 (buf!3537 thiss!1634)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634))))))

(assert (=> d!49688 (= (arrayBitRangesEq!0 (buf!3537 thiss!1634) (buf!3537 (_2!7115 lt!236193)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3050 (buf!3537 thiss!1634)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634))) e!101261)))

(declare-fun b!151616 () Bool)

(assert (=> b!151616 (= e!101263 call!2080)))

(declare-fun b!151617 () Bool)

(assert (=> b!151617 (= e!101259 call!2080)))

(declare-fun b!151618 () Bool)

(assert (=> b!151618 (= e!101261 e!101260)))

(declare-fun res!127145 () Bool)

(assert (=> b!151618 (=> (not res!127145) (not e!101260))))

(assert (=> b!151618 (= res!127145 e!101258)))

(declare-fun res!127147 () Bool)

(assert (=> b!151618 (=> res!127147 e!101258)))

(assert (=> b!151618 (= res!127147 (bvsge (_1!7131 lt!237508) (_2!7131 lt!237508)))))

(assert (=> b!151618 (= lt!237506 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3050 (buf!3537 thiss!1634)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!151618 (= lt!237507 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!151618 (= lt!237508 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3050 (buf!3537 thiss!1634)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634))))))

(assert (= (and d!49688 (not res!127148)) b!151618))

(assert (= (and b!151618 (not res!127147)) b!151615))

(assert (= (and b!151618 res!127145) b!151612))

(assert (= (and b!151612 c!8107) b!151617))

(assert (= (and b!151612 (not c!8107)) b!151614))

(assert (= (and b!151614 res!127146) b!151613))

(assert (= (and b!151613 (not res!127144)) b!151616))

(assert (= (or b!151617 b!151616) bm!2077))

(declare-fun m!237033 () Bool)

(assert (=> bm!2077 m!237033))

(declare-fun m!237035 () Bool)

(assert (=> bm!2077 m!237035))

(declare-fun m!237037 () Bool)

(assert (=> bm!2077 m!237037))

(declare-fun m!237039 () Bool)

(assert (=> bm!2077 m!237039))

(declare-fun m!237041 () Bool)

(assert (=> bm!2077 m!237041))

(assert (=> b!151614 m!237041))

(assert (=> b!151614 m!237037))

(assert (=> b!151614 m!237041))

(assert (=> b!151614 m!237037))

(declare-fun m!237043 () Bool)

(assert (=> b!151614 m!237043))

(declare-fun m!237045 () Bool)

(assert (=> b!151615 m!237045))

(assert (=> b!151618 m!235513))

(declare-fun m!237047 () Bool)

(assert (=> b!151618 m!237047))

(assert (=> b!151113 d!49688))

(assert (=> b!151113 d!49194))

(declare-fun d!49690 () Bool)

(assert (=> d!49690 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236193)))) ((_ sign_extend 32) (currentByte!6463 (_2!7115 lt!236193))) ((_ sign_extend 32) (currentBit!6458 (_2!7115 lt!236193))) (bvsub (bvsub to!404 from!447) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!49690 true))

(declare-fun _$7!94 () Unit!9509)

(assert (=> d!49690 (= (choose!57 thiss!1634 (_2!7115 lt!236193) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) _$7!94)))

(declare-fun bs!12141 () Bool)

(assert (= bs!12141 d!49690))

(declare-fun m!237049 () Bool)

(assert (=> bs!12141 m!237049))

(assert (=> d!49364 d!49690))

(declare-fun d!49692 () Bool)

(declare-fun e!101264 () Bool)

(assert (=> d!49692 e!101264))

(declare-fun res!127149 () Bool)

(assert (=> d!49692 (=> (not res!127149) (not e!101264))))

(declare-fun lt!237509 () BitStream!5358)

(declare-fun lt!237510 () (_ BitVec 64))

(assert (=> d!49692 (= res!127149 (= (bvadd lt!237510 (bvsub lt!236636 lt!236629)) (bitIndex!0 (size!3050 (buf!3537 lt!237509)) (currentByte!6463 lt!237509) (currentBit!6458 lt!237509))))))

(assert (=> d!49692 (or (not (= (bvand lt!237510 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!236636 lt!236629) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!237510 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!237510 (bvsub lt!236636 lt!236629)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!49692 (= lt!237510 (bitIndex!0 (size!3050 (buf!3537 (_2!7117 lt!236626))) (currentByte!6463 (_2!7117 lt!236626)) (currentBit!6458 (_2!7117 lt!236626))))))

(assert (=> d!49692 (= lt!237509 (_2!7115 (moveBitIndex!0 (_2!7117 lt!236626) (bvsub lt!236636 lt!236629))))))

(assert (=> d!49692 (moveBitIndexPrecond!0 (_2!7117 lt!236626) (bvsub lt!236636 lt!236629))))

(assert (=> d!49692 (= (withMovedBitIndex!0 (_2!7117 lt!236626) (bvsub lt!236636 lt!236629)) lt!237509)))

(declare-fun b!151619 () Bool)

(assert (=> b!151619 (= e!101264 (= (size!3050 (buf!3537 (_2!7117 lt!236626))) (size!3050 (buf!3537 lt!237509))))))

(assert (= (and d!49692 res!127149) b!151619))

(declare-fun m!237051 () Bool)

(assert (=> d!49692 m!237051))

(assert (=> d!49692 m!236917))

(declare-fun m!237053 () Bool)

(assert (=> d!49692 m!237053))

(declare-fun m!237055 () Bool)

(assert (=> d!49692 m!237055))

(assert (=> b!151125 d!49692))

(assert (=> b!151125 d!49190))

(assert (=> b!151125 d!49194))

(declare-fun d!49694 () Bool)

(assert (=> d!49694 (= (remainingBits!0 ((_ sign_extend 32) (size!3050 (buf!3537 thiss!1634))) ((_ sign_extend 32) (currentByte!6463 thiss!1634)) ((_ sign_extend 32) (currentBit!6458 thiss!1634))) (bvsub (bvmul ((_ sign_extend 32) (size!3050 (buf!3537 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6463 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6458 thiss!1634)))))))

(assert (=> d!49238 d!49694))

(declare-fun d!49696 () Bool)

(assert (=> d!49696 (isPrefixOf!0 lt!236572 (_2!7115 lt!236195))))

(declare-fun lt!237511 () Unit!9509)

(assert (=> d!49696 (= lt!237511 (choose!30 lt!236572 (_2!7115 lt!236193) (_2!7115 lt!236195)))))

(assert (=> d!49696 (isPrefixOf!0 lt!236572 (_2!7115 lt!236193))))

(assert (=> d!49696 (= (lemmaIsPrefixTransitive!0 lt!236572 (_2!7115 lt!236193) (_2!7115 lt!236195)) lt!237511)))

(declare-fun bs!12142 () Bool)

(assert (= bs!12142 d!49696))

(assert (=> bs!12142 m!235897))

(declare-fun m!237057 () Bool)

(assert (=> bs!12142 m!237057))

(declare-fun m!237059 () Bool)

(assert (=> bs!12142 m!237059))

(assert (=> d!49206 d!49696))

(declare-fun d!49698 () Bool)

(assert (=> d!49698 (isPrefixOf!0 lt!236572 lt!236572)))

(declare-fun lt!237512 () Unit!9509)

(assert (=> d!49698 (= lt!237512 (choose!11 lt!236572))))

(assert (=> d!49698 (= (lemmaIsPrefixRefl!0 lt!236572) lt!237512)))

(declare-fun bs!12143 () Bool)

(assert (= bs!12143 d!49698))

(assert (=> bs!12143 m!235891))

(declare-fun m!237061 () Bool)

(assert (=> bs!12143 m!237061))

(assert (=> d!49206 d!49698))

(declare-fun d!49700 () Bool)

(declare-fun res!127150 () Bool)

(declare-fun e!101266 () Bool)

(assert (=> d!49700 (=> (not res!127150) (not e!101266))))

(assert (=> d!49700 (= res!127150 (= (size!3050 (buf!3537 (_1!7117 lt!236557))) (size!3050 (buf!3537 (_2!7117 lt!236557)))))))

(assert (=> d!49700 (= (isPrefixOf!0 (_1!7117 lt!236557) (_2!7117 lt!236557)) e!101266)))

(declare-fun b!151620 () Bool)

(declare-fun res!127152 () Bool)

(assert (=> b!151620 (=> (not res!127152) (not e!101266))))

(assert (=> b!151620 (= res!127152 (bvsle (bitIndex!0 (size!3050 (buf!3537 (_1!7117 lt!236557))) (currentByte!6463 (_1!7117 lt!236557)) (currentBit!6458 (_1!7117 lt!236557))) (bitIndex!0 (size!3050 (buf!3537 (_2!7117 lt!236557))) (currentByte!6463 (_2!7117 lt!236557)) (currentBit!6458 (_2!7117 lt!236557)))))))

(declare-fun b!151621 () Bool)

(declare-fun e!101265 () Bool)

(assert (=> b!151621 (= e!101266 e!101265)))

(declare-fun res!127151 () Bool)

(assert (=> b!151621 (=> res!127151 e!101265)))

(assert (=> b!151621 (= res!127151 (= (size!3050 (buf!3537 (_1!7117 lt!236557))) #b00000000000000000000000000000000))))

(declare-fun b!151622 () Bool)

(assert (=> b!151622 (= e!101265 (arrayBitRangesEq!0 (buf!3537 (_1!7117 lt!236557)) (buf!3537 (_2!7117 lt!236557)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3050 (buf!3537 (_1!7117 lt!236557))) (currentByte!6463 (_1!7117 lt!236557)) (currentBit!6458 (_1!7117 lt!236557)))))))

(assert (= (and d!49700 res!127150) b!151620))

(assert (= (and b!151620 res!127152) b!151621))

(assert (= (and b!151621 (not res!127151)) b!151622))

(assert (=> b!151620 m!236949))

(assert (=> b!151620 m!236953))

(assert (=> b!151622 m!236949))

(assert (=> b!151622 m!236949))

(declare-fun m!237063 () Bool)

(assert (=> b!151622 m!237063))

(assert (=> d!49206 d!49700))

(declare-fun d!49702 () Bool)

(declare-fun res!127153 () Bool)

(declare-fun e!101268 () Bool)

(assert (=> d!49702 (=> (not res!127153) (not e!101268))))

(assert (=> d!49702 (= res!127153 (= (size!3050 (buf!3537 lt!236572)) (size!3050 (buf!3537 (_2!7115 lt!236195)))))))

(assert (=> d!49702 (= (isPrefixOf!0 lt!236572 (_2!7115 lt!236195)) e!101268)))

(declare-fun b!151623 () Bool)

(declare-fun res!127155 () Bool)

(assert (=> b!151623 (=> (not res!127155) (not e!101268))))

(assert (=> b!151623 (= res!127155 (bvsle (bitIndex!0 (size!3050 (buf!3537 lt!236572)) (currentByte!6463 lt!236572) (currentBit!6458 lt!236572)) (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236195))) (currentByte!6463 (_2!7115 lt!236195)) (currentBit!6458 (_2!7115 lt!236195)))))))

(declare-fun b!151624 () Bool)

(declare-fun e!101267 () Bool)

(assert (=> b!151624 (= e!101268 e!101267)))

(declare-fun res!127154 () Bool)

(assert (=> b!151624 (=> res!127154 e!101267)))

(assert (=> b!151624 (= res!127154 (= (size!3050 (buf!3537 lt!236572)) #b00000000000000000000000000000000))))

(declare-fun b!151625 () Bool)

(assert (=> b!151625 (= e!101267 (arrayBitRangesEq!0 (buf!3537 lt!236572) (buf!3537 (_2!7115 lt!236195)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3050 (buf!3537 lt!236572)) (currentByte!6463 lt!236572) (currentBit!6458 lt!236572))))))

(assert (= (and d!49702 res!127153) b!151623))

(assert (= (and b!151623 res!127155) b!151624))

(assert (= (and b!151624 (not res!127154)) b!151625))

(declare-fun m!237065 () Bool)

(assert (=> b!151623 m!237065))

(assert (=> b!151623 m!235511))

(assert (=> b!151625 m!237065))

(assert (=> b!151625 m!237065))

(declare-fun m!237067 () Bool)

(assert (=> b!151625 m!237067))

(assert (=> d!49206 d!49702))

(declare-fun d!49704 () Bool)

(declare-fun res!127156 () Bool)

(declare-fun e!101270 () Bool)

(assert (=> d!49704 (=> (not res!127156) (not e!101270))))

(assert (=> d!49704 (= res!127156 (= (size!3050 (buf!3537 lt!236572)) (size!3050 (buf!3537 lt!236572))))))

(assert (=> d!49704 (= (isPrefixOf!0 lt!236572 lt!236572) e!101270)))

(declare-fun b!151626 () Bool)

(declare-fun res!127158 () Bool)

(assert (=> b!151626 (=> (not res!127158) (not e!101270))))

(assert (=> b!151626 (= res!127158 (bvsle (bitIndex!0 (size!3050 (buf!3537 lt!236572)) (currentByte!6463 lt!236572) (currentBit!6458 lt!236572)) (bitIndex!0 (size!3050 (buf!3537 lt!236572)) (currentByte!6463 lt!236572) (currentBit!6458 lt!236572))))))

(declare-fun b!151627 () Bool)

(declare-fun e!101269 () Bool)

(assert (=> b!151627 (= e!101270 e!101269)))

(declare-fun res!127157 () Bool)

(assert (=> b!151627 (=> res!127157 e!101269)))

(assert (=> b!151627 (= res!127157 (= (size!3050 (buf!3537 lt!236572)) #b00000000000000000000000000000000))))

(declare-fun b!151628 () Bool)

(assert (=> b!151628 (= e!101269 (arrayBitRangesEq!0 (buf!3537 lt!236572) (buf!3537 lt!236572) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3050 (buf!3537 lt!236572)) (currentByte!6463 lt!236572) (currentBit!6458 lt!236572))))))

(assert (= (and d!49704 res!127156) b!151626))

(assert (= (and b!151626 res!127158) b!151627))

(assert (= (and b!151627 (not res!127157)) b!151628))

(assert (=> b!151626 m!237065))

(assert (=> b!151626 m!237065))

(assert (=> b!151628 m!237065))

(assert (=> b!151628 m!237065))

(declare-fun m!237069 () Bool)

(assert (=> b!151628 m!237069))

(assert (=> d!49206 d!49704))

(declare-fun d!49706 () Bool)

(declare-fun res!127159 () Bool)

(declare-fun e!101272 () Bool)

(assert (=> d!49706 (=> (not res!127159) (not e!101272))))

(assert (=> d!49706 (= res!127159 (= (size!3050 (buf!3537 (_2!7115 lt!236195))) (size!3050 (buf!3537 (_2!7115 lt!236195)))))))

(assert (=> d!49706 (= (isPrefixOf!0 (_2!7115 lt!236195) (_2!7115 lt!236195)) e!101272)))

(declare-fun b!151629 () Bool)

(declare-fun res!127161 () Bool)

(assert (=> b!151629 (=> (not res!127161) (not e!101272))))

(assert (=> b!151629 (= res!127161 (bvsle (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236195))) (currentByte!6463 (_2!7115 lt!236195)) (currentBit!6458 (_2!7115 lt!236195))) (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236195))) (currentByte!6463 (_2!7115 lt!236195)) (currentBit!6458 (_2!7115 lt!236195)))))))

(declare-fun b!151630 () Bool)

(declare-fun e!101271 () Bool)

(assert (=> b!151630 (= e!101272 e!101271)))

(declare-fun res!127160 () Bool)

(assert (=> b!151630 (=> res!127160 e!101271)))

(assert (=> b!151630 (= res!127160 (= (size!3050 (buf!3537 (_2!7115 lt!236195))) #b00000000000000000000000000000000))))

(declare-fun b!151631 () Bool)

(assert (=> b!151631 (= e!101271 (arrayBitRangesEq!0 (buf!3537 (_2!7115 lt!236195)) (buf!3537 (_2!7115 lt!236195)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236195))) (currentByte!6463 (_2!7115 lt!236195)) (currentBit!6458 (_2!7115 lt!236195)))))))

(assert (= (and d!49706 res!127159) b!151629))

(assert (= (and b!151629 res!127161) b!151630))

(assert (= (and b!151630 (not res!127160)) b!151631))

(assert (=> b!151629 m!235511))

(assert (=> b!151629 m!235511))

(assert (=> b!151631 m!235511))

(assert (=> b!151631 m!235511))

(declare-fun m!237071 () Bool)

(assert (=> b!151631 m!237071))

(assert (=> d!49206 d!49706))

(declare-fun d!49708 () Bool)

(assert (=> d!49708 (isPrefixOf!0 (_2!7115 lt!236195) (_2!7115 lt!236195))))

(declare-fun lt!237513 () Unit!9509)

(assert (=> d!49708 (= lt!237513 (choose!11 (_2!7115 lt!236195)))))

(assert (=> d!49708 (= (lemmaIsPrefixRefl!0 (_2!7115 lt!236195)) lt!237513)))

(declare-fun bs!12144 () Bool)

(assert (= bs!12144 d!49708))

(assert (=> bs!12144 m!235903))

(declare-fun m!237073 () Bool)

(assert (=> bs!12144 m!237073))

(assert (=> d!49206 d!49708))

(assert (=> d!49206 d!49236))

(assert (=> d!49206 d!49644))

(assert (=> d!49206 d!49650))

(declare-fun d!49710 () Bool)

(assert (=> d!49710 (isPrefixOf!0 lt!236572 (_2!7115 lt!236195))))

(declare-fun lt!237514 () Unit!9509)

(assert (=> d!49710 (= lt!237514 (choose!30 lt!236572 (_2!7115 lt!236195) (_2!7115 lt!236195)))))

(assert (=> d!49710 (isPrefixOf!0 lt!236572 (_2!7115 lt!236195))))

(assert (=> d!49710 (= (lemmaIsPrefixTransitive!0 lt!236572 (_2!7115 lt!236195) (_2!7115 lt!236195)) lt!237514)))

(declare-fun bs!12145 () Bool)

(assert (= bs!12145 d!49710))

(assert (=> bs!12145 m!235897))

(declare-fun m!237075 () Bool)

(assert (=> bs!12145 m!237075))

(assert (=> bs!12145 m!235897))

(assert (=> d!49206 d!49710))

(declare-fun d!49712 () Bool)

(declare-fun lt!237515 () tuple2!13508)

(assert (=> d!49712 (= lt!237515 (readByte!0 (_1!7117 lt!236929)))))

(assert (=> d!49712 (= (readBytePure!0 (_1!7117 lt!236929)) (tuple2!13497 (_2!7126 lt!237515) (_1!7126 lt!237515)))))

(declare-fun bs!12146 () Bool)

(assert (= bs!12146 d!49712))

(declare-fun m!237077 () Bool)

(assert (=> bs!12146 m!237077))

(assert (=> b!151261 d!49712))

(declare-fun b!151632 () Bool)

(declare-fun e!101273 () Unit!9509)

(declare-fun lt!237529 () Unit!9509)

(assert (=> b!151632 (= e!101273 lt!237529)))

(declare-fun lt!237528 () (_ BitVec 64))

(assert (=> b!151632 (= lt!237528 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!237522 () (_ BitVec 64))

(assert (=> b!151632 (= lt!237522 (bitIndex!0 (size!3050 (buf!3537 thiss!1634)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634)))))

(assert (=> b!151632 (= lt!237529 (arrayBitRangesEqSymmetric!0 (buf!3537 thiss!1634) (buf!3537 (_2!7115 lt!236928)) lt!237528 lt!237522))))

(assert (=> b!151632 (arrayBitRangesEq!0 (buf!3537 (_2!7115 lt!236928)) (buf!3537 thiss!1634) lt!237528 lt!237522)))

(declare-fun d!49714 () Bool)

(declare-fun e!101274 () Bool)

(assert (=> d!49714 e!101274))

(declare-fun res!127162 () Bool)

(assert (=> d!49714 (=> (not res!127162) (not e!101274))))

(declare-fun lt!237517 () tuple2!13494)

(assert (=> d!49714 (= res!127162 (isPrefixOf!0 (_1!7117 lt!237517) (_2!7117 lt!237517)))))

(declare-fun lt!237532 () BitStream!5358)

(assert (=> d!49714 (= lt!237517 (tuple2!13495 lt!237532 (_2!7115 lt!236928)))))

(declare-fun lt!237518 () Unit!9509)

(declare-fun lt!237530 () Unit!9509)

(assert (=> d!49714 (= lt!237518 lt!237530)))

(assert (=> d!49714 (isPrefixOf!0 lt!237532 (_2!7115 lt!236928))))

(assert (=> d!49714 (= lt!237530 (lemmaIsPrefixTransitive!0 lt!237532 (_2!7115 lt!236928) (_2!7115 lt!236928)))))

(declare-fun lt!237521 () Unit!9509)

(declare-fun lt!237535 () Unit!9509)

(assert (=> d!49714 (= lt!237521 lt!237535)))

(assert (=> d!49714 (isPrefixOf!0 lt!237532 (_2!7115 lt!236928))))

(assert (=> d!49714 (= lt!237535 (lemmaIsPrefixTransitive!0 lt!237532 thiss!1634 (_2!7115 lt!236928)))))

(declare-fun lt!237523 () Unit!9509)

(assert (=> d!49714 (= lt!237523 e!101273)))

(declare-fun c!8108 () Bool)

(assert (=> d!49714 (= c!8108 (not (= (size!3050 (buf!3537 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!237526 () Unit!9509)

(declare-fun lt!237524 () Unit!9509)

(assert (=> d!49714 (= lt!237526 lt!237524)))

(assert (=> d!49714 (isPrefixOf!0 (_2!7115 lt!236928) (_2!7115 lt!236928))))

(assert (=> d!49714 (= lt!237524 (lemmaIsPrefixRefl!0 (_2!7115 lt!236928)))))

(declare-fun lt!237534 () Unit!9509)

(declare-fun lt!237525 () Unit!9509)

(assert (=> d!49714 (= lt!237534 lt!237525)))

(assert (=> d!49714 (= lt!237525 (lemmaIsPrefixRefl!0 (_2!7115 lt!236928)))))

(declare-fun lt!237533 () Unit!9509)

(declare-fun lt!237531 () Unit!9509)

(assert (=> d!49714 (= lt!237533 lt!237531)))

(assert (=> d!49714 (isPrefixOf!0 lt!237532 lt!237532)))

(assert (=> d!49714 (= lt!237531 (lemmaIsPrefixRefl!0 lt!237532))))

(declare-fun lt!237519 () Unit!9509)

(declare-fun lt!237516 () Unit!9509)

(assert (=> d!49714 (= lt!237519 lt!237516)))

(assert (=> d!49714 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!49714 (= lt!237516 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!49714 (= lt!237532 (BitStream!5359 (buf!3537 (_2!7115 lt!236928)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634)))))

(assert (=> d!49714 (isPrefixOf!0 thiss!1634 (_2!7115 lt!236928))))

(assert (=> d!49714 (= (reader!0 thiss!1634 (_2!7115 lt!236928)) lt!237517)))

(declare-fun b!151633 () Bool)

(declare-fun Unit!9566 () Unit!9509)

(assert (=> b!151633 (= e!101273 Unit!9566)))

(declare-fun b!151634 () Bool)

(declare-fun res!127164 () Bool)

(assert (=> b!151634 (=> (not res!127164) (not e!101274))))

(assert (=> b!151634 (= res!127164 (isPrefixOf!0 (_2!7117 lt!237517) (_2!7115 lt!236928)))))

(declare-fun lt!237520 () (_ BitVec 64))

(declare-fun lt!237527 () (_ BitVec 64))

(declare-fun b!151635 () Bool)

(assert (=> b!151635 (= e!101274 (= (_1!7117 lt!237517) (withMovedBitIndex!0 (_2!7117 lt!237517) (bvsub lt!237527 lt!237520))))))

(assert (=> b!151635 (or (= (bvand lt!237527 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!237520 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!237527 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!237527 lt!237520) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!151635 (= lt!237520 (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236928))) (currentByte!6463 (_2!7115 lt!236928)) (currentBit!6458 (_2!7115 lt!236928))))))

(assert (=> b!151635 (= lt!237527 (bitIndex!0 (size!3050 (buf!3537 thiss!1634)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634)))))

(declare-fun b!151636 () Bool)

(declare-fun res!127163 () Bool)

(assert (=> b!151636 (=> (not res!127163) (not e!101274))))

(assert (=> b!151636 (= res!127163 (isPrefixOf!0 (_1!7117 lt!237517) thiss!1634))))

(assert (= (and d!49714 c!8108) b!151632))

(assert (= (and d!49714 (not c!8108)) b!151633))

(assert (= (and d!49714 res!127162) b!151636))

(assert (= (and b!151636 res!127163) b!151634))

(assert (= (and b!151634 res!127164) b!151635))

(declare-fun m!237079 () Bool)

(assert (=> b!151635 m!237079))

(assert (=> b!151635 m!236195))

(assert (=> b!151635 m!235513))

(declare-fun m!237081 () Bool)

(assert (=> b!151634 m!237081))

(assert (=> d!49714 m!235933))

(declare-fun m!237083 () Bool)

(assert (=> d!49714 m!237083))

(declare-fun m!237085 () Bool)

(assert (=> d!49714 m!237085))

(assert (=> d!49714 m!236199))

(declare-fun m!237087 () Bool)

(assert (=> d!49714 m!237087))

(declare-fun m!237089 () Bool)

(assert (=> d!49714 m!237089))

(assert (=> d!49714 m!235943))

(declare-fun m!237091 () Bool)

(assert (=> d!49714 m!237091))

(declare-fun m!237093 () Bool)

(assert (=> d!49714 m!237093))

(declare-fun m!237095 () Bool)

(assert (=> d!49714 m!237095))

(declare-fun m!237097 () Bool)

(assert (=> d!49714 m!237097))

(assert (=> b!151632 m!235513))

(declare-fun m!237099 () Bool)

(assert (=> b!151632 m!237099))

(declare-fun m!237101 () Bool)

(assert (=> b!151632 m!237101))

(declare-fun m!237103 () Bool)

(assert (=> b!151636 m!237103))

(assert (=> b!151261 d!49714))

(declare-fun d!49716 () Bool)

(declare-fun e!101275 () Bool)

(assert (=> d!49716 e!101275))

(declare-fun res!127165 () Bool)

(assert (=> d!49716 (=> (not res!127165) (not e!101275))))

(declare-fun lt!237537 () (_ BitVec 64))

(declare-fun lt!237536 () (_ BitVec 64))

(declare-fun lt!237541 () (_ BitVec 64))

(assert (=> d!49716 (= res!127165 (= lt!237536 (bvsub lt!237537 lt!237541)))))

(assert (=> d!49716 (or (= (bvand lt!237537 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!237541 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!237537 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!237537 lt!237541) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!49716 (= lt!237541 (remainingBits!0 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236928)))) ((_ sign_extend 32) (currentByte!6463 (_2!7115 lt!236928))) ((_ sign_extend 32) (currentBit!6458 (_2!7115 lt!236928)))))))

(declare-fun lt!237540 () (_ BitVec 64))

(declare-fun lt!237539 () (_ BitVec 64))

(assert (=> d!49716 (= lt!237537 (bvmul lt!237540 lt!237539))))

(assert (=> d!49716 (or (= lt!237540 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!237539 (bvsdiv (bvmul lt!237540 lt!237539) lt!237540)))))

(assert (=> d!49716 (= lt!237539 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!49716 (= lt!237540 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236928)))))))

(assert (=> d!49716 (= lt!237536 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6463 (_2!7115 lt!236928))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6458 (_2!7115 lt!236928)))))))

(assert (=> d!49716 (invariant!0 (currentBit!6458 (_2!7115 lt!236928)) (currentByte!6463 (_2!7115 lt!236928)) (size!3050 (buf!3537 (_2!7115 lt!236928))))))

(assert (=> d!49716 (= (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236928))) (currentByte!6463 (_2!7115 lt!236928)) (currentBit!6458 (_2!7115 lt!236928))) lt!237536)))

(declare-fun b!151637 () Bool)

(declare-fun res!127166 () Bool)

(assert (=> b!151637 (=> (not res!127166) (not e!101275))))

(assert (=> b!151637 (= res!127166 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!237536))))

(declare-fun b!151638 () Bool)

(declare-fun lt!237538 () (_ BitVec 64))

(assert (=> b!151638 (= e!101275 (bvsle lt!237536 (bvmul lt!237538 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!151638 (or (= lt!237538 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!237538 #b0000000000000000000000000000000000000000000000000000000000001000) lt!237538)))))

(assert (=> b!151638 (= lt!237538 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236928)))))))

(assert (= (and d!49716 res!127165) b!151637))

(assert (= (and b!151637 res!127166) b!151638))

(declare-fun m!237105 () Bool)

(assert (=> d!49716 m!237105))

(declare-fun m!237107 () Bool)

(assert (=> d!49716 m!237107))

(assert (=> b!151259 d!49716))

(assert (=> b!151259 d!49194))

(assert (=> d!49282 d!49636))

(assert (=> d!49234 d!49232))

(declare-fun d!49718 () Bool)

(assert (=> d!49718 (arrayRangesEq!366 (_2!7116 lt!236199) (_2!7116 lt!236179) #b00000000000000000000000000000000 to!404)))

(assert (=> d!49718 true))

(declare-fun _$6!341 () Unit!9509)

(assert (=> d!49718 (= (choose!99 (_2!7116 lt!236179) (_2!7116 lt!236199) #b00000000000000000000000000000000 to!404) _$6!341)))

(declare-fun bs!12147 () Bool)

(assert (= bs!12147 d!49718))

(assert (=> bs!12147 m!235507))

(assert (=> d!49234 d!49718))

(declare-fun b!151639 () Bool)

(declare-fun e!101278 () Bool)

(declare-fun e!101277 () Bool)

(assert (=> b!151639 (= e!101278 e!101277)))

(declare-fun c!8109 () Bool)

(declare-fun lt!237544 () tuple4!148)

(assert (=> b!151639 (= c!8109 (= (_3!374 lt!237544) (_4!74 lt!237544)))))

(declare-fun b!151640 () Bool)

(declare-fun res!127167 () Bool)

(declare-fun lt!237542 () (_ BitVec 32))

(assert (=> b!151640 (= res!127167 (= lt!237542 #b00000000000000000000000000000000))))

(declare-fun e!101281 () Bool)

(assert (=> b!151640 (=> res!127167 e!101281)))

(declare-fun e!101280 () Bool)

(assert (=> b!151640 (= e!101280 e!101281)))

(declare-fun bm!2078 () Bool)

(declare-fun lt!237543 () (_ BitVec 32))

(declare-fun call!2081 () Bool)

(assert (=> bm!2078 (= call!2081 (byteRangesEq!0 (ite c!8109 (select (arr!3852 (buf!3537 (_2!7115 lt!236193))) (_3!374 lt!237544)) (select (arr!3852 (buf!3537 (_2!7115 lt!236193))) (_4!74 lt!237544))) (ite c!8109 (select (arr!3852 (buf!3537 (_2!7115 lt!236195))) (_3!374 lt!237544)) (select (arr!3852 (buf!3537 (_2!7115 lt!236195))) (_4!74 lt!237544))) (ite c!8109 lt!237543 #b00000000000000000000000000000000) lt!237542))))

(declare-fun b!151641 () Bool)

(assert (=> b!151641 (= e!101277 e!101280)))

(declare-fun res!127169 () Bool)

(assert (=> b!151641 (= res!127169 (byteRangesEq!0 (select (arr!3852 (buf!3537 (_2!7115 lt!236193))) (_3!374 lt!237544)) (select (arr!3852 (buf!3537 (_2!7115 lt!236195))) (_3!374 lt!237544)) lt!237543 #b00000000000000000000000000001000))))

(assert (=> b!151641 (=> (not res!127169) (not e!101280))))

(declare-fun e!101276 () Bool)

(declare-fun b!151642 () Bool)

(assert (=> b!151642 (= e!101276 (arrayRangesEq!366 (buf!3537 (_2!7115 lt!236193)) (buf!3537 (_2!7115 lt!236195)) (_1!7131 lt!237544) (_2!7131 lt!237544)))))

(declare-fun d!49720 () Bool)

(declare-fun res!127171 () Bool)

(declare-fun e!101279 () Bool)

(assert (=> d!49720 (=> res!127171 e!101279)))

(assert (=> d!49720 (= res!127171 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236193))) (currentByte!6463 (_2!7115 lt!236193)) (currentBit!6458 (_2!7115 lt!236193)))))))

(assert (=> d!49720 (= (arrayBitRangesEq!0 (buf!3537 (_2!7115 lt!236193)) (buf!3537 (_2!7115 lt!236195)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236193))) (currentByte!6463 (_2!7115 lt!236193)) (currentBit!6458 (_2!7115 lt!236193)))) e!101279)))

(declare-fun b!151643 () Bool)

(assert (=> b!151643 (= e!101281 call!2081)))

(declare-fun b!151644 () Bool)

(assert (=> b!151644 (= e!101277 call!2081)))

(declare-fun b!151645 () Bool)

(assert (=> b!151645 (= e!101279 e!101278)))

(declare-fun res!127168 () Bool)

(assert (=> b!151645 (=> (not res!127168) (not e!101278))))

(assert (=> b!151645 (= res!127168 e!101276)))

(declare-fun res!127170 () Bool)

(assert (=> b!151645 (=> res!127170 e!101276)))

(assert (=> b!151645 (= res!127170 (bvsge (_1!7131 lt!237544) (_2!7131 lt!237544)))))

(assert (=> b!151645 (= lt!237542 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236193))) (currentByte!6463 (_2!7115 lt!236193)) (currentBit!6458 (_2!7115 lt!236193))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!151645 (= lt!237543 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!151645 (= lt!237544 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236193))) (currentByte!6463 (_2!7115 lt!236193)) (currentBit!6458 (_2!7115 lt!236193)))))))

(assert (= (and d!49720 (not res!127171)) b!151645))

(assert (= (and b!151645 (not res!127170)) b!151642))

(assert (= (and b!151645 res!127168) b!151639))

(assert (= (and b!151639 c!8109) b!151644))

(assert (= (and b!151639 (not c!8109)) b!151641))

(assert (= (and b!151641 res!127169) b!151640))

(assert (= (and b!151640 (not res!127167)) b!151643))

(assert (= (or b!151644 b!151643) bm!2078))

(declare-fun m!237109 () Bool)

(assert (=> bm!2078 m!237109))

(declare-fun m!237111 () Bool)

(assert (=> bm!2078 m!237111))

(declare-fun m!237113 () Bool)

(assert (=> bm!2078 m!237113))

(declare-fun m!237115 () Bool)

(assert (=> bm!2078 m!237115))

(declare-fun m!237117 () Bool)

(assert (=> bm!2078 m!237117))

(assert (=> b!151641 m!237117))

(assert (=> b!151641 m!237113))

(assert (=> b!151641 m!237117))

(assert (=> b!151641 m!237113))

(declare-fun m!237119 () Bool)

(assert (=> b!151641 m!237119))

(declare-fun m!237121 () Bool)

(assert (=> b!151642 m!237121))

(assert (=> b!151645 m!235575))

(declare-fun m!237123 () Bool)

(assert (=> b!151645 m!237123))

(assert (=> b!151108 d!49720))

(assert (=> b!151108 d!49190))

(declare-fun d!49722 () Bool)

(declare-fun lt!237560 () (_ BitVec 8))

(declare-fun lt!237564 () (_ BitVec 8))

(assert (=> d!49722 (= lt!237560 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3852 (buf!3537 (_1!7117 lt!236186))) (currentByte!6463 (_1!7117 lt!236186)))) ((_ sign_extend 24) lt!237564))))))

(assert (=> d!49722 (= lt!237564 ((_ extract 7 0) (currentBit!6458 (_1!7117 lt!236186))))))

(declare-fun e!101287 () Bool)

(assert (=> d!49722 e!101287))

(declare-fun res!127178 () Bool)

(assert (=> d!49722 (=> (not res!127178) (not e!101287))))

(assert (=> d!49722 (= res!127178 (validate_offset_bits!1 ((_ sign_extend 32) (size!3050 (buf!3537 (_1!7117 lt!236186)))) ((_ sign_extend 32) (currentByte!6463 (_1!7117 lt!236186))) ((_ sign_extend 32) (currentBit!6458 (_1!7117 lt!236186))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!13514 0))(
  ( (tuple2!13515 (_1!7132 Unit!9509) (_2!7132 (_ BitVec 8))) )
))
(declare-fun Unit!9571 () Unit!9509)

(declare-fun Unit!9572 () Unit!9509)

(assert (=> d!49722 (= (readByte!0 (_1!7117 lt!236186)) (tuple2!13509 (_2!7132 (ite (bvsgt ((_ sign_extend 24) lt!237564) #b00000000000000000000000000000000) (tuple2!13515 Unit!9571 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!237560) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3852 (buf!3537 (_1!7117 lt!236186))) (bvadd (currentByte!6463 (_1!7117 lt!236186)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!237564)))))))) (tuple2!13515 Unit!9572 lt!237560))) (BitStream!5359 (buf!3537 (_1!7117 lt!236186)) (bvadd (currentByte!6463 (_1!7117 lt!236186)) #b00000000000000000000000000000001) (currentBit!6458 (_1!7117 lt!236186)))))))

(declare-fun b!151650 () Bool)

(declare-fun e!101286 () Bool)

(assert (=> b!151650 (= e!101287 e!101286)))

(declare-fun res!127177 () Bool)

(assert (=> b!151650 (=> (not res!127177) (not e!101286))))

(declare-fun lt!237565 () tuple2!13508)

(assert (=> b!151650 (= res!127177 (= (buf!3537 (_2!7126 lt!237565)) (buf!3537 (_1!7117 lt!236186))))))

(declare-fun lt!237562 () (_ BitVec 8))

(declare-fun lt!237563 () (_ BitVec 8))

(declare-fun Unit!9573 () Unit!9509)

(declare-fun Unit!9574 () Unit!9509)

(assert (=> b!151650 (= lt!237565 (tuple2!13509 (_2!7132 (ite (bvsgt ((_ sign_extend 24) lt!237563) #b00000000000000000000000000000000) (tuple2!13515 Unit!9573 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!237562) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3852 (buf!3537 (_1!7117 lt!236186))) (bvadd (currentByte!6463 (_1!7117 lt!236186)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!237563)))))))) (tuple2!13515 Unit!9574 lt!237562))) (BitStream!5359 (buf!3537 (_1!7117 lt!236186)) (bvadd (currentByte!6463 (_1!7117 lt!236186)) #b00000000000000000000000000000001) (currentBit!6458 (_1!7117 lt!236186)))))))

(assert (=> b!151650 (= lt!237562 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3852 (buf!3537 (_1!7117 lt!236186))) (currentByte!6463 (_1!7117 lt!236186)))) ((_ sign_extend 24) lt!237563))))))

(assert (=> b!151650 (= lt!237563 ((_ extract 7 0) (currentBit!6458 (_1!7117 lt!236186))))))

(declare-fun lt!237561 () (_ BitVec 64))

(declare-fun b!151651 () Bool)

(declare-fun lt!237559 () (_ BitVec 64))

(assert (=> b!151651 (= e!101286 (= (bitIndex!0 (size!3050 (buf!3537 (_2!7126 lt!237565))) (currentByte!6463 (_2!7126 lt!237565)) (currentBit!6458 (_2!7126 lt!237565))) (bvadd lt!237561 lt!237559)))))

(assert (=> b!151651 (or (not (= (bvand lt!237561 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!237559 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!237561 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!237561 lt!237559) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!151651 (= lt!237559 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!151651 (= lt!237561 (bitIndex!0 (size!3050 (buf!3537 (_1!7117 lt!236186))) (currentByte!6463 (_1!7117 lt!236186)) (currentBit!6458 (_1!7117 lt!236186))))))

(assert (= (and d!49722 res!127178) b!151650))

(assert (= (and b!151650 res!127177) b!151651))

(declare-fun m!237125 () Bool)

(assert (=> d!49722 m!237125))

(declare-fun m!237127 () Bool)

(assert (=> d!49722 m!237127))

(declare-fun m!237129 () Bool)

(assert (=> d!49722 m!237129))

(assert (=> b!151650 m!237129))

(assert (=> b!151650 m!237125))

(declare-fun m!237131 () Bool)

(assert (=> b!151651 m!237131))

(declare-fun m!237133 () Bool)

(assert (=> b!151651 m!237133))

(assert (=> d!49242 d!49722))

(declare-fun d!49724 () Bool)

(assert (=> d!49724 (= (remainingBits!0 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236193)))) ((_ sign_extend 32) (currentByte!6463 (_2!7115 lt!236193))) ((_ sign_extend 32) (currentBit!6458 (_2!7115 lt!236193)))) (bvsub (bvmul ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236193)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6463 (_2!7115 lt!236193))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6458 (_2!7115 lt!236193))))))))

(assert (=> d!49190 d!49724))

(declare-fun d!49726 () Bool)

(assert (=> d!49726 (= (invariant!0 (currentBit!6458 (_2!7115 lt!236193)) (currentByte!6463 (_2!7115 lt!236193)) (size!3050 (buf!3537 (_2!7115 lt!236193)))) (and (bvsge (currentBit!6458 (_2!7115 lt!236193)) #b00000000000000000000000000000000) (bvslt (currentBit!6458 (_2!7115 lt!236193)) #b00000000000000000000000000001000) (bvsge (currentByte!6463 (_2!7115 lt!236193)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6463 (_2!7115 lt!236193)) (size!3050 (buf!3537 (_2!7115 lt!236193)))) (and (= (currentBit!6458 (_2!7115 lt!236193)) #b00000000000000000000000000000000) (= (currentByte!6463 (_2!7115 lt!236193)) (size!3050 (buf!3537 (_2!7115 lt!236193))))))))))

(assert (=> d!49190 d!49726))

(assert (=> b!151106 d!49190))

(assert (=> b!151106 d!49183))

(declare-fun d!49728 () Bool)

(declare-fun lt!237567 () (_ BitVec 8))

(declare-fun lt!237571 () (_ BitVec 8))

(assert (=> d!49728 (= lt!237567 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3852 (buf!3537 lt!236196)) (currentByte!6463 lt!236196))) ((_ sign_extend 24) lt!237571))))))

(assert (=> d!49728 (= lt!237571 ((_ extract 7 0) (currentBit!6458 lt!236196)))))

(declare-fun e!101289 () Bool)

(assert (=> d!49728 e!101289))

(declare-fun res!127180 () Bool)

(assert (=> d!49728 (=> (not res!127180) (not e!101289))))

(assert (=> d!49728 (= res!127180 (validate_offset_bits!1 ((_ sign_extend 32) (size!3050 (buf!3537 lt!236196))) ((_ sign_extend 32) (currentByte!6463 lt!236196)) ((_ sign_extend 32) (currentBit!6458 lt!236196)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!9575 () Unit!9509)

(declare-fun Unit!9576 () Unit!9509)

(assert (=> d!49728 (= (readByte!0 lt!236196) (tuple2!13509 (_2!7132 (ite (bvsgt ((_ sign_extend 24) lt!237571) #b00000000000000000000000000000000) (tuple2!13515 Unit!9575 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!237567) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3852 (buf!3537 lt!236196)) (bvadd (currentByte!6463 lt!236196) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!237571)))))))) (tuple2!13515 Unit!9576 lt!237567))) (BitStream!5359 (buf!3537 lt!236196) (bvadd (currentByte!6463 lt!236196) #b00000000000000000000000000000001) (currentBit!6458 lt!236196))))))

(declare-fun b!151652 () Bool)

(declare-fun e!101288 () Bool)

(assert (=> b!151652 (= e!101289 e!101288)))

(declare-fun res!127179 () Bool)

(assert (=> b!151652 (=> (not res!127179) (not e!101288))))

(declare-fun lt!237572 () tuple2!13508)

(assert (=> b!151652 (= res!127179 (= (buf!3537 (_2!7126 lt!237572)) (buf!3537 lt!236196)))))

(declare-fun lt!237570 () (_ BitVec 8))

(declare-fun lt!237569 () (_ BitVec 8))

(declare-fun Unit!9577 () Unit!9509)

(declare-fun Unit!9578 () Unit!9509)

(assert (=> b!151652 (= lt!237572 (tuple2!13509 (_2!7132 (ite (bvsgt ((_ sign_extend 24) lt!237570) #b00000000000000000000000000000000) (tuple2!13515 Unit!9577 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!237569) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3852 (buf!3537 lt!236196)) (bvadd (currentByte!6463 lt!236196) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!237570)))))))) (tuple2!13515 Unit!9578 lt!237569))) (BitStream!5359 (buf!3537 lt!236196) (bvadd (currentByte!6463 lt!236196) #b00000000000000000000000000000001) (currentBit!6458 lt!236196))))))

(assert (=> b!151652 (= lt!237569 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3852 (buf!3537 lt!236196)) (currentByte!6463 lt!236196))) ((_ sign_extend 24) lt!237570))))))

(assert (=> b!151652 (= lt!237570 ((_ extract 7 0) (currentBit!6458 lt!236196)))))

(declare-fun b!151653 () Bool)

(declare-fun lt!237568 () (_ BitVec 64))

(declare-fun lt!237566 () (_ BitVec 64))

(assert (=> b!151653 (= e!101288 (= (bitIndex!0 (size!3050 (buf!3537 (_2!7126 lt!237572))) (currentByte!6463 (_2!7126 lt!237572)) (currentBit!6458 (_2!7126 lt!237572))) (bvadd lt!237568 lt!237566)))))

(assert (=> b!151653 (or (not (= (bvand lt!237568 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!237566 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!237568 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!237568 lt!237566) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!151653 (= lt!237566 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!151653 (= lt!237568 (bitIndex!0 (size!3050 (buf!3537 lt!236196)) (currentByte!6463 lt!236196) (currentBit!6458 lt!236196)))))

(assert (= (and d!49728 res!127180) b!151652))

(assert (= (and b!151652 res!127179) b!151653))

(declare-fun m!237135 () Bool)

(assert (=> d!49728 m!237135))

(declare-fun m!237137 () Bool)

(assert (=> d!49728 m!237137))

(declare-fun m!237139 () Bool)

(assert (=> d!49728 m!237139))

(assert (=> b!151652 m!237139))

(assert (=> b!151652 m!237135))

(declare-fun m!237141 () Bool)

(assert (=> b!151653 m!237141))

(declare-fun m!237143 () Bool)

(assert (=> b!151653 m!237143))

(assert (=> d!49362 d!49728))

(declare-fun b!151654 () Bool)

(declare-fun e!101292 () Bool)

(declare-fun e!101291 () Bool)

(assert (=> b!151654 (= e!101292 e!101291)))

(declare-fun c!8110 () Bool)

(declare-fun lt!237575 () tuple4!148)

(assert (=> b!151654 (= c!8110 (= (_3!374 lt!237575) (_4!74 lt!237575)))))

(declare-fun b!151655 () Bool)

(declare-fun res!127181 () Bool)

(declare-fun lt!237573 () (_ BitVec 32))

(assert (=> b!151655 (= res!127181 (= lt!237573 #b00000000000000000000000000000000))))

(declare-fun e!101295 () Bool)

(assert (=> b!151655 (=> res!127181 e!101295)))

(declare-fun e!101294 () Bool)

(assert (=> b!151655 (= e!101294 e!101295)))

(declare-fun lt!237574 () (_ BitVec 32))

(declare-fun call!2082 () Bool)

(declare-fun bm!2079 () Bool)

(assert (=> bm!2079 (= call!2082 (byteRangesEq!0 (ite c!8110 (select (arr!3852 (buf!3537 thiss!1634)) (_3!374 lt!237575)) (select (arr!3852 (buf!3537 thiss!1634)) (_4!74 lt!237575))) (ite c!8110 (select (arr!3852 (buf!3537 (_2!7115 lt!236195))) (_3!374 lt!237575)) (select (arr!3852 (buf!3537 (_2!7115 lt!236195))) (_4!74 lt!237575))) (ite c!8110 lt!237574 #b00000000000000000000000000000000) lt!237573))))

(declare-fun b!151656 () Bool)

(assert (=> b!151656 (= e!101291 e!101294)))

(declare-fun res!127183 () Bool)

(assert (=> b!151656 (= res!127183 (byteRangesEq!0 (select (arr!3852 (buf!3537 thiss!1634)) (_3!374 lt!237575)) (select (arr!3852 (buf!3537 (_2!7115 lt!236195))) (_3!374 lt!237575)) lt!237574 #b00000000000000000000000000001000))))

(assert (=> b!151656 (=> (not res!127183) (not e!101294))))

(declare-fun b!151657 () Bool)

(declare-fun e!101290 () Bool)

(assert (=> b!151657 (= e!101290 (arrayRangesEq!366 (buf!3537 thiss!1634) (buf!3537 (_2!7115 lt!236195)) (_1!7131 lt!237575) (_2!7131 lt!237575)))))

(declare-fun d!49730 () Bool)

(declare-fun res!127185 () Bool)

(declare-fun e!101293 () Bool)

(assert (=> d!49730 (=> res!127185 e!101293)))

(assert (=> d!49730 (= res!127185 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3050 (buf!3537 thiss!1634)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634))))))

(assert (=> d!49730 (= (arrayBitRangesEq!0 (buf!3537 thiss!1634) (buf!3537 (_2!7115 lt!236195)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3050 (buf!3537 thiss!1634)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634))) e!101293)))

(declare-fun b!151658 () Bool)

(assert (=> b!151658 (= e!101295 call!2082)))

(declare-fun b!151659 () Bool)

(assert (=> b!151659 (= e!101291 call!2082)))

(declare-fun b!151660 () Bool)

(assert (=> b!151660 (= e!101293 e!101292)))

(declare-fun res!127182 () Bool)

(assert (=> b!151660 (=> (not res!127182) (not e!101292))))

(assert (=> b!151660 (= res!127182 e!101290)))

(declare-fun res!127184 () Bool)

(assert (=> b!151660 (=> res!127184 e!101290)))

(assert (=> b!151660 (= res!127184 (bvsge (_1!7131 lt!237575) (_2!7131 lt!237575)))))

(assert (=> b!151660 (= lt!237573 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3050 (buf!3537 thiss!1634)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!151660 (= lt!237574 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!151660 (= lt!237575 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3050 (buf!3537 thiss!1634)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634))))))

(assert (= (and d!49730 (not res!127185)) b!151660))

(assert (= (and b!151660 (not res!127184)) b!151657))

(assert (= (and b!151660 res!127182) b!151654))

(assert (= (and b!151654 c!8110) b!151659))

(assert (= (and b!151654 (not c!8110)) b!151656))

(assert (= (and b!151656 res!127183) b!151655))

(assert (= (and b!151655 (not res!127181)) b!151658))

(assert (= (or b!151659 b!151658) bm!2079))

(declare-fun m!237145 () Bool)

(assert (=> bm!2079 m!237145))

(declare-fun m!237147 () Bool)

(assert (=> bm!2079 m!237147))

(declare-fun m!237149 () Bool)

(assert (=> bm!2079 m!237149))

(declare-fun m!237151 () Bool)

(assert (=> bm!2079 m!237151))

(declare-fun m!237153 () Bool)

(assert (=> bm!2079 m!237153))

(assert (=> b!151656 m!237153))

(assert (=> b!151656 m!237149))

(assert (=> b!151656 m!237153))

(assert (=> b!151656 m!237149))

(declare-fun m!237155 () Bool)

(assert (=> b!151656 m!237155))

(declare-fun m!237157 () Bool)

(assert (=> b!151657 m!237157))

(assert (=> b!151660 m!235513))

(assert (=> b!151660 m!237047))

(assert (=> b!151145 d!49730))

(assert (=> b!151145 d!49194))

(declare-fun d!49732 () Bool)

(declare-fun res!127186 () Bool)

(declare-fun e!101297 () Bool)

(assert (=> d!49732 (=> (not res!127186) (not e!101297))))

(assert (=> d!49732 (= res!127186 (= (size!3050 (buf!3537 (_1!7117 lt!236647))) (size!3050 (buf!3537 thiss!1634))))))

(assert (=> d!49732 (= (isPrefixOf!0 (_1!7117 lt!236647) thiss!1634) e!101297)))

(declare-fun b!151661 () Bool)

(declare-fun res!127188 () Bool)

(assert (=> b!151661 (=> (not res!127188) (not e!101297))))

(assert (=> b!151661 (= res!127188 (bvsle (bitIndex!0 (size!3050 (buf!3537 (_1!7117 lt!236647))) (currentByte!6463 (_1!7117 lt!236647)) (currentBit!6458 (_1!7117 lt!236647))) (bitIndex!0 (size!3050 (buf!3537 thiss!1634)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634))))))

(declare-fun b!151662 () Bool)

(declare-fun e!101296 () Bool)

(assert (=> b!151662 (= e!101297 e!101296)))

(declare-fun res!127187 () Bool)

(assert (=> b!151662 (=> res!127187 e!101296)))

(assert (=> b!151662 (= res!127187 (= (size!3050 (buf!3537 (_1!7117 lt!236647))) #b00000000000000000000000000000000))))

(declare-fun b!151663 () Bool)

(assert (=> b!151663 (= e!101296 (arrayBitRangesEq!0 (buf!3537 (_1!7117 lt!236647)) (buf!3537 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3050 (buf!3537 (_1!7117 lt!236647))) (currentByte!6463 (_1!7117 lt!236647)) (currentBit!6458 (_1!7117 lt!236647)))))))

(assert (= (and d!49732 res!127186) b!151661))

(assert (= (and b!151661 res!127188) b!151662))

(assert (= (and b!151662 (not res!127187)) b!151663))

(declare-fun m!237159 () Bool)

(assert (=> b!151661 m!237159))

(assert (=> b!151661 m!235513))

(assert (=> b!151663 m!237159))

(assert (=> b!151663 m!237159))

(declare-fun m!237161 () Bool)

(assert (=> b!151663 m!237161))

(assert (=> b!151131 d!49732))

(declare-fun d!49734 () Bool)

(declare-fun res!127189 () Bool)

(declare-fun e!101298 () Bool)

(assert (=> d!49734 (=> res!127189 e!101298)))

(assert (=> d!49734 (= res!127189 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!49734 (= (arrayRangesEq!366 (_2!7116 lt!236199) (_2!7116 lt!236179) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!101298)))

(declare-fun b!151664 () Bool)

(declare-fun e!101299 () Bool)

(assert (=> b!151664 (= e!101298 e!101299)))

(declare-fun res!127190 () Bool)

(assert (=> b!151664 (=> (not res!127190) (not e!101299))))

(assert (=> b!151664 (= res!127190 (= (select (arr!3852 (_2!7116 lt!236199)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3852 (_2!7116 lt!236179)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!151665 () Bool)

(assert (=> b!151665 (= e!101299 (arrayRangesEq!366 (_2!7116 lt!236199) (_2!7116 lt!236179) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!49734 (not res!127189)) b!151664))

(assert (= (and b!151664 res!127190) b!151665))

(declare-fun m!237163 () Bool)

(assert (=> b!151664 m!237163))

(assert (=> b!151664 m!237029))

(declare-fun m!237165 () Bool)

(assert (=> b!151665 m!237165))

(assert (=> b!151099 d!49734))

(declare-fun d!49736 () Bool)

(declare-fun res!127191 () Bool)

(declare-fun e!101300 () Bool)

(assert (=> d!49736 (=> res!127191 e!101300)))

(assert (=> d!49736 (= res!127191 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!49736 (= (arrayRangesEq!366 (_2!7116 lt!236772) (_2!7116 lt!236774) #b00000000000000000000000000000000 to!404) e!101300)))

(declare-fun b!151666 () Bool)

(declare-fun e!101301 () Bool)

(assert (=> b!151666 (= e!101300 e!101301)))

(declare-fun res!127192 () Bool)

(assert (=> b!151666 (=> (not res!127192) (not e!101301))))

(assert (=> b!151666 (= res!127192 (= (select (arr!3852 (_2!7116 lt!236772)) #b00000000000000000000000000000000) (select (arr!3852 (_2!7116 lt!236774)) #b00000000000000000000000000000000)))))

(declare-fun b!151667 () Bool)

(assert (=> b!151667 (= e!101301 (arrayRangesEq!366 (_2!7116 lt!236772) (_2!7116 lt!236774) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!49736 (not res!127191)) b!151666))

(assert (= (and b!151666 res!127192) b!151667))

(declare-fun m!237167 () Bool)

(assert (=> b!151666 m!237167))

(declare-fun m!237169 () Bool)

(assert (=> b!151666 m!237169))

(declare-fun m!237171 () Bool)

(assert (=> b!151667 m!237171))

(assert (=> d!49288 d!49736))

(declare-fun lt!237576 () tuple3!596)

(declare-fun d!49738 () Bool)

(assert (=> d!49738 (= lt!237576 (readByteArrayLoop!0 lt!236773 (array!6743 (store (arr!3852 arr!237) from!447 (_2!7118 (readBytePure!0 (_1!7117 lt!236184)))) (size!3050 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!49738 (= (readByteArrayLoopPure!0 lt!236773 (array!6743 (store (arr!3852 arr!237) from!447 (_2!7118 (readBytePure!0 (_1!7117 lt!236184)))) (size!3050 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404) (tuple2!13493 (_2!7125 lt!237576) (_3!371 lt!237576)))))

(declare-fun bs!12148 () Bool)

(assert (= bs!12148 d!49738))

(declare-fun m!237173 () Bool)

(assert (=> bs!12148 m!237173))

(assert (=> d!49288 d!49738))

(declare-fun d!49740 () Bool)

(assert (=> d!49740 (arrayRangesEq!366 (_2!7116 (readByteArrayLoopPure!0 (_1!7117 lt!236184) arr!237 from!447 to!404)) (_2!7116 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!7117 lt!236184) #b00000000000000000000000000000001) (array!6743 (store (arr!3852 arr!237) from!447 (_2!7118 (readBytePure!0 (_1!7117 lt!236184)))) (size!3050 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404)) #b00000000000000000000000000000000 to!404)))

(assert (=> d!49740 true))

(declare-fun _$13!76 () Unit!9509)

(assert (=> d!49740 (= (choose!35 (_1!7117 lt!236184) arr!237 from!447 to!404 lt!236772 (_2!7116 lt!236772) lt!236773 lt!236774 (_2!7116 lt!236774)) _$13!76)))

(declare-fun bs!12150 () Bool)

(assert (= bs!12150 d!49740))

(declare-fun m!237175 () Bool)

(assert (=> bs!12150 m!237175))

(assert (=> bs!12150 m!235527))

(assert (=> bs!12150 m!235531))

(assert (=> bs!12150 m!235521))

(assert (=> bs!12150 m!235531))

(declare-fun m!237177 () Bool)

(assert (=> bs!12150 m!237177))

(assert (=> bs!12150 m!236067))

(assert (=> d!49288 d!49740))

(assert (=> d!49288 d!49268))

(assert (=> d!49288 d!49284))

(assert (=> d!49288 d!49360))

(assert (=> b!151143 d!49194))

(assert (=> b!151143 d!49183))

(declare-fun d!49742 () Bool)

(assert (=> d!49742 (= (remainingBits!0 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236195)))) ((_ sign_extend 32) (currentByte!6463 (_2!7115 lt!236193))) ((_ sign_extend 32) (currentBit!6458 (_2!7115 lt!236193)))) (bvsub (bvmul ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236195)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6463 (_2!7115 lt!236193))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6458 (_2!7115 lt!236193))))))))

(assert (=> d!49198 d!49742))

(declare-fun d!49744 () Bool)

(assert (=> d!49744 (= (remainingBits!0 ((_ sign_extend 32) (size!3050 (buf!3537 (_1!7118 lt!236177)))) ((_ sign_extend 32) (currentByte!6463 (_1!7118 lt!236177))) ((_ sign_extend 32) (currentBit!6458 (_1!7118 lt!236177)))) (bvsub (bvmul ((_ sign_extend 32) (size!3050 (buf!3537 (_1!7118 lt!236177)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6463 (_1!7118 lt!236177))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6458 (_1!7118 lt!236177))))))))

(assert (=> d!49272 d!49744))

(declare-fun d!49746 () Bool)

(assert (=> d!49746 (= (invariant!0 (currentBit!6458 (_1!7118 lt!236177)) (currentByte!6463 (_1!7118 lt!236177)) (size!3050 (buf!3537 (_1!7118 lt!236177)))) (and (bvsge (currentBit!6458 (_1!7118 lt!236177)) #b00000000000000000000000000000000) (bvslt (currentBit!6458 (_1!7118 lt!236177)) #b00000000000000000000000000001000) (bvsge (currentByte!6463 (_1!7118 lt!236177)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6463 (_1!7118 lt!236177)) (size!3050 (buf!3537 (_1!7118 lt!236177)))) (and (= (currentBit!6458 (_1!7118 lt!236177)) #b00000000000000000000000000000000) (= (currentByte!6463 (_1!7118 lt!236177)) (size!3050 (buf!3537 (_1!7118 lt!236177))))))))))

(assert (=> d!49272 d!49746))

(declare-fun e!101308 () tuple3!596)

(declare-fun b!151678 () Bool)

(declare-fun lt!237682 () Unit!9509)

(assert (=> b!151678 (= e!101308 (tuple3!597 lt!237682 (_1!7117 lt!236184) arr!237))))

(declare-fun call!2090 () (_ BitVec 64))

(assert (=> b!151678 (= call!2090 call!2090)))

(declare-fun lt!237656 () Unit!9509)

(declare-fun Unit!9579 () Unit!9509)

(assert (=> b!151678 (= lt!237656 Unit!9579)))

(declare-fun lt!237665 () Unit!9509)

(declare-fun arrayRangesEqReflexiveLemma!17 (array!6742) Unit!9509)

(assert (=> b!151678 (= lt!237665 (arrayRangesEqReflexiveLemma!17 arr!237))))

(declare-fun call!2089 () Bool)

(assert (=> b!151678 call!2089))

(declare-fun lt!237659 () Unit!9509)

(assert (=> b!151678 (= lt!237659 lt!237665)))

(declare-fun lt!237649 () array!6742)

(assert (=> b!151678 (= lt!237649 arr!237)))

(declare-fun lt!237674 () array!6742)

(assert (=> b!151678 (= lt!237674 arr!237)))

(declare-fun lt!237662 () (_ BitVec 32))

(assert (=> b!151678 (= lt!237662 #b00000000000000000000000000000000)))

(declare-fun lt!237671 () (_ BitVec 32))

(assert (=> b!151678 (= lt!237671 (size!3050 arr!237))))

(declare-fun lt!237678 () (_ BitVec 32))

(assert (=> b!151678 (= lt!237678 #b00000000000000000000000000000000)))

(declare-fun lt!237673 () (_ BitVec 32))

(assert (=> b!151678 (= lt!237673 from!447)))

(declare-fun arrayRangesEqSlicedLemma!17 (array!6742 array!6742 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9509)

(assert (=> b!151678 (= lt!237682 (arrayRangesEqSlicedLemma!17 lt!237649 lt!237674 lt!237662 lt!237671 lt!237678 lt!237673))))

(declare-fun call!2091 () Bool)

(assert (=> b!151678 call!2091))

(declare-fun d!49748 () Bool)

(declare-fun e!101310 () Bool)

(assert (=> d!49748 e!101310))

(declare-fun res!127201 () Bool)

(assert (=> d!49748 (=> res!127201 e!101310)))

(assert (=> d!49748 (= res!127201 (bvsge from!447 to!404))))

(declare-fun lt!237657 () Bool)

(declare-fun e!101309 () Bool)

(assert (=> d!49748 (= lt!237657 e!101309)))

(declare-fun res!127199 () Bool)

(assert (=> d!49748 (=> (not res!127199) (not e!101309))))

(declare-fun lt!237676 () (_ BitVec 64))

(declare-fun lt!237652 () (_ BitVec 64))

(declare-fun lt!237658 () tuple3!596)

(assert (=> d!49748 (= res!127199 (= (bvadd lt!237652 lt!237676) (bitIndex!0 (size!3050 (buf!3537 (_2!7125 lt!237658))) (currentByte!6463 (_2!7125 lt!237658)) (currentBit!6458 (_2!7125 lt!237658)))))))

(assert (=> d!49748 (or (not (= (bvand lt!237652 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!237676 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!237652 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!237652 lt!237676) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!237668 () (_ BitVec 64))

(assert (=> d!49748 (= lt!237676 (bvmul lt!237668 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!49748 (or (= lt!237668 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!237668 #b0000000000000000000000000000000000000000000000000000000000001000) lt!237668)))))

(assert (=> d!49748 (= lt!237668 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(assert (=> d!49748 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000)))))

(assert (=> d!49748 (= lt!237652 (bitIndex!0 (size!3050 (buf!3537 (_1!7117 lt!236184))) (currentByte!6463 (_1!7117 lt!236184)) (currentBit!6458 (_1!7117 lt!236184))))))

(assert (=> d!49748 (= lt!237658 e!101308)))

(declare-fun c!8113 () Bool)

(assert (=> d!49748 (= c!8113 (bvslt from!447 to!404))))

(assert (=> d!49748 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3050 arr!237)))))

(assert (=> d!49748 (= (readByteArrayLoop!0 (_1!7117 lt!236184) arr!237 from!447 to!404) lt!237658)))

(declare-fun b!151679 () Bool)

(declare-fun lt!237655 () Unit!9509)

(declare-fun lt!237654 () tuple3!596)

(assert (=> b!151679 (= e!101308 (tuple3!597 lt!237655 (_2!7125 lt!237654) (_3!371 lt!237654)))))

(declare-fun lt!237670 () tuple2!13508)

(assert (=> b!151679 (= lt!237670 (readByte!0 (_1!7117 lt!236184)))))

(declare-fun lt!237672 () array!6742)

(assert (=> b!151679 (= lt!237672 (array!6743 (store (arr!3852 arr!237) from!447 (_1!7126 lt!237670)) (size!3050 arr!237)))))

(declare-fun lt!237681 () (_ BitVec 64))

(assert (=> b!151679 (= lt!237681 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!237661 () (_ BitVec 32))

(assert (=> b!151679 (= lt!237661 (bvsub to!404 from!447))))

(declare-fun lt!237677 () Unit!9509)

(assert (=> b!151679 (= lt!237677 (validateOffsetBytesFromBitIndexLemma!0 (_1!7117 lt!236184) (_2!7126 lt!237670) lt!237681 lt!237661))))

(assert (=> b!151679 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7126 lt!237670)))) ((_ sign_extend 32) (currentByte!6463 (_2!7126 lt!237670))) ((_ sign_extend 32) (currentBit!6458 (_2!7126 lt!237670))) (bvsub lt!237661 ((_ extract 31 0) (bvsdiv (bvadd lt!237681 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!237650 () Unit!9509)

(assert (=> b!151679 (= lt!237650 lt!237677)))

(assert (=> b!151679 (= lt!237654 (readByteArrayLoop!0 (_2!7126 lt!237670) lt!237672 (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!151679 (= call!2090 (bvadd (bitIndex!0 (size!3050 (buf!3537 (_1!7117 lt!236184))) (currentByte!6463 (_1!7117 lt!236184)) (currentBit!6458 (_1!7117 lt!236184))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!237651 () Unit!9509)

(declare-fun Unit!9580 () Unit!9509)

(assert (=> b!151679 (= lt!237651 Unit!9580)))

(assert (=> b!151679 (= (bvadd call!2090 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3050 (buf!3537 (_2!7125 lt!237654))) (currentByte!6463 (_2!7125 lt!237654)) (currentBit!6458 (_2!7125 lt!237654))))))

(declare-fun lt!237666 () Unit!9509)

(declare-fun Unit!9581 () Unit!9509)

(assert (=> b!151679 (= lt!237666 Unit!9581)))

(assert (=> b!151679 (= (bvadd (bitIndex!0 (size!3050 (buf!3537 (_1!7117 lt!236184))) (currentByte!6463 (_1!7117 lt!236184)) (currentBit!6458 (_1!7117 lt!236184))) (bvmul ((_ sign_extend 32) (bvsub to!404 from!447)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3050 (buf!3537 (_2!7125 lt!237654))) (currentByte!6463 (_2!7125 lt!237654)) (currentBit!6458 (_2!7125 lt!237654))))))

(declare-fun lt!237679 () Unit!9509)

(declare-fun Unit!9582 () Unit!9509)

(assert (=> b!151679 (= lt!237679 Unit!9582)))

(assert (=> b!151679 (and (= (buf!3537 (_1!7117 lt!236184)) (buf!3537 (_2!7125 lt!237654))) (= (size!3050 arr!237) (size!3050 (_3!371 lt!237654))))))

(declare-fun lt!237667 () Unit!9509)

(declare-fun Unit!9583 () Unit!9509)

(assert (=> b!151679 (= lt!237667 Unit!9583)))

(declare-fun lt!237680 () Unit!9509)

(declare-fun arrayUpdatedAtPrefixLemma!17 (array!6742 (_ BitVec 32) (_ BitVec 8)) Unit!9509)

(assert (=> b!151679 (= lt!237680 (arrayUpdatedAtPrefixLemma!17 arr!237 from!447 (_1!7126 lt!237670)))))

(assert (=> b!151679 call!2089))

(declare-fun lt!237663 () Unit!9509)

(assert (=> b!151679 (= lt!237663 lt!237680)))

(declare-fun lt!237683 () (_ BitVec 32))

(assert (=> b!151679 (= lt!237683 #b00000000000000000000000000000000)))

(declare-fun lt!237675 () Unit!9509)

(assert (=> b!151679 (= lt!237675 (arrayRangesEqTransitive!81 arr!237 lt!237672 (_3!371 lt!237654) lt!237683 from!447 (bvadd from!447 #b00000000000000000000000000000001)))))

(assert (=> b!151679 call!2091))

(declare-fun lt!237664 () Unit!9509)

(assert (=> b!151679 (= lt!237664 lt!237675)))

(assert (=> b!151679 (arrayRangesEq!366 arr!237 (_3!371 lt!237654) #b00000000000000000000000000000000 from!447)))

(declare-fun lt!237669 () Unit!9509)

(declare-fun Unit!9584 () Unit!9509)

(assert (=> b!151679 (= lt!237669 Unit!9584)))

(declare-fun lt!237660 () Unit!9509)

(declare-fun arrayRangesEqImpliesEq!17 (array!6742 array!6742 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9509)

(assert (=> b!151679 (= lt!237660 (arrayRangesEqImpliesEq!17 lt!237672 (_3!371 lt!237654) #b00000000000000000000000000000000 from!447 (bvadd from!447 #b00000000000000000000000000000001)))))

(assert (=> b!151679 (= (select (store (arr!3852 arr!237) from!447 (_1!7126 lt!237670)) from!447) (select (arr!3852 (_3!371 lt!237654)) from!447))))

(declare-fun lt!237653 () Unit!9509)

(assert (=> b!151679 (= lt!237653 lt!237660)))

(declare-fun lt!237684 () Bool)

(assert (=> b!151679 (= lt!237684 (= (select (arr!3852 (_3!371 lt!237654)) from!447) (_1!7126 lt!237670)))))

(declare-fun Unit!9585 () Unit!9509)

(assert (=> b!151679 (= lt!237655 Unit!9585)))

(assert (=> b!151679 lt!237684))

(declare-fun bm!2086 () Bool)

(assert (=> bm!2086 (= call!2090 (bitIndex!0 (ite c!8113 (size!3050 (buf!3537 (_2!7126 lt!237670))) (size!3050 (buf!3537 (_1!7117 lt!236184)))) (ite c!8113 (currentByte!6463 (_2!7126 lt!237670)) (currentByte!6463 (_1!7117 lt!236184))) (ite c!8113 (currentBit!6458 (_2!7126 lt!237670)) (currentBit!6458 (_1!7117 lt!236184)))))))

(declare-fun b!151680 () Bool)

(assert (=> b!151680 (= e!101309 (arrayRangesEq!366 arr!237 (_3!371 lt!237658) #b00000000000000000000000000000000 from!447))))

(declare-fun b!151681 () Bool)

(declare-fun res!127200 () Bool)

(assert (=> b!151681 (=> (not res!127200) (not e!101309))))

(assert (=> b!151681 (= res!127200 (and (= (buf!3537 (_1!7117 lt!236184)) (buf!3537 (_2!7125 lt!237658))) (= (size!3050 arr!237) (size!3050 (_3!371 lt!237658)))))))

(declare-fun bm!2087 () Bool)

(assert (=> bm!2087 (= call!2089 (arrayRangesEq!366 arr!237 (ite c!8113 (array!6743 (store (arr!3852 arr!237) from!447 (_1!7126 lt!237670)) (size!3050 arr!237)) arr!237) #b00000000000000000000000000000000 (ite c!8113 from!447 (size!3050 arr!237))))))

(declare-fun bm!2088 () Bool)

(assert (=> bm!2088 (= call!2091 (arrayRangesEq!366 (ite c!8113 arr!237 lt!237649) (ite c!8113 (_3!371 lt!237654) lt!237674) (ite c!8113 lt!237683 lt!237678) (ite c!8113 from!447 lt!237673)))))

(declare-fun b!151682 () Bool)

(assert (=> b!151682 (= e!101310 (= (select (arr!3852 (_3!371 lt!237658)) from!447) (_2!7118 (readBytePure!0 (_1!7117 lt!236184)))))))

(assert (=> b!151682 (and (bvsge from!447 #b00000000000000000000000000000000) (bvslt from!447 (size!3050 (_3!371 lt!237658))))))

(assert (= (and d!49748 c!8113) b!151679))

(assert (= (and d!49748 (not c!8113)) b!151678))

(assert (= (or b!151679 b!151678) bm!2088))

(assert (= (or b!151679 b!151678) bm!2087))

(assert (= (or b!151679 b!151678) bm!2086))

(assert (= (and d!49748 res!127199) b!151681))

(assert (= (and b!151681 res!127200) b!151680))

(assert (= (and d!49748 (not res!127201)) b!151682))

(declare-fun m!237179 () Bool)

(assert (=> d!49748 m!237179))

(declare-fun m!237181 () Bool)

(assert (=> d!49748 m!237181))

(declare-fun m!237183 () Bool)

(assert (=> bm!2088 m!237183))

(declare-fun m!237185 () Bool)

(assert (=> b!151678 m!237185))

(declare-fun m!237187 () Bool)

(assert (=> b!151678 m!237187))

(declare-fun m!237189 () Bool)

(assert (=> b!151682 m!237189))

(assert (=> b!151682 m!235521))

(declare-fun m!237191 () Bool)

(assert (=> bm!2086 m!237191))

(declare-fun m!237193 () Bool)

(assert (=> b!151680 m!237193))

(declare-fun m!237195 () Bool)

(assert (=> bm!2087 m!237195))

(declare-fun m!237197 () Bool)

(assert (=> bm!2087 m!237197))

(declare-fun m!237199 () Bool)

(assert (=> b!151679 m!237199))

(declare-fun m!237201 () Bool)

(assert (=> b!151679 m!237201))

(assert (=> b!151679 m!236039))

(declare-fun m!237203 () Bool)

(assert (=> b!151679 m!237203))

(declare-fun m!237205 () Bool)

(assert (=> b!151679 m!237205))

(declare-fun m!237207 () Bool)

(assert (=> b!151679 m!237207))

(declare-fun m!237209 () Bool)

(assert (=> b!151679 m!237209))

(declare-fun m!237211 () Bool)

(assert (=> b!151679 m!237211))

(assert (=> b!151679 m!237181))

(declare-fun m!237213 () Bool)

(assert (=> b!151679 m!237213))

(declare-fun m!237215 () Bool)

(assert (=> b!151679 m!237215))

(assert (=> b!151679 m!237195))

(declare-fun m!237217 () Bool)

(assert (=> b!151679 m!237217))

(assert (=> d!49360 d!49748))

(declare-fun d!49750 () Bool)

(declare-fun res!127202 () Bool)

(declare-fun e!101312 () Bool)

(assert (=> d!49750 (=> (not res!127202) (not e!101312))))

(assert (=> d!49750 (= res!127202 (= (size!3050 (buf!3537 (_2!7115 lt!236193))) (size!3050 (buf!3537 (_2!7115 lt!236872)))))))

(assert (=> d!49750 (= (isPrefixOf!0 (_2!7115 lt!236193) (_2!7115 lt!236872)) e!101312)))

(declare-fun b!151683 () Bool)

(declare-fun res!127204 () Bool)

(assert (=> b!151683 (=> (not res!127204) (not e!101312))))

(assert (=> b!151683 (= res!127204 (bvsle (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236193))) (currentByte!6463 (_2!7115 lt!236193)) (currentBit!6458 (_2!7115 lt!236193))) (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236872))) (currentByte!6463 (_2!7115 lt!236872)) (currentBit!6458 (_2!7115 lt!236872)))))))

(declare-fun b!151684 () Bool)

(declare-fun e!101311 () Bool)

(assert (=> b!151684 (= e!101312 e!101311)))

(declare-fun res!127203 () Bool)

(assert (=> b!151684 (=> res!127203 e!101311)))

(assert (=> b!151684 (= res!127203 (= (size!3050 (buf!3537 (_2!7115 lt!236193))) #b00000000000000000000000000000000))))

(declare-fun b!151685 () Bool)

(assert (=> b!151685 (= e!101311 (arrayBitRangesEq!0 (buf!3537 (_2!7115 lt!236193)) (buf!3537 (_2!7115 lt!236872)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236193))) (currentByte!6463 (_2!7115 lt!236193)) (currentBit!6458 (_2!7115 lt!236193)))))))

(assert (= (and d!49750 res!127202) b!151683))

(assert (= (and b!151683 res!127204) b!151684))

(assert (= (and b!151684 (not res!127203)) b!151685))

(assert (=> b!151683 m!235575))

(assert (=> b!151683 m!236161))

(assert (=> b!151685 m!235575))

(assert (=> b!151685 m!235575))

(declare-fun m!237219 () Bool)

(assert (=> b!151685 m!237219))

(assert (=> b!151231 d!49750))

(assert (=> d!49260 d!49742))

(declare-fun d!49752 () Bool)

(declare-fun e!101315 () Bool)

(assert (=> d!49752 e!101315))

(declare-fun res!127207 () Bool)

(assert (=> d!49752 (=> (not res!127207) (not e!101315))))

(declare-fun moveByteIndexPrecond!0 (BitStream!5358 (_ BitVec 32)) Bool)

(assert (=> d!49752 (= res!127207 (moveByteIndexPrecond!0 (_1!7117 lt!236184) #b00000000000000000000000000000001))))

(declare-fun Unit!9586 () Unit!9509)

(assert (=> d!49752 (= (moveByteIndex!0 (_1!7117 lt!236184) #b00000000000000000000000000000001) (tuple2!13491 Unit!9586 (BitStream!5359 (buf!3537 (_1!7117 lt!236184)) (bvadd (currentByte!6463 (_1!7117 lt!236184)) #b00000000000000000000000000000001) (currentBit!6458 (_1!7117 lt!236184)))))))

(declare-fun b!151688 () Bool)

(assert (=> b!151688 (= e!101315 (and (or (not (= (bvand (currentByte!6463 (_1!7117 lt!236184)) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6463 (_1!7117 lt!236184)) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6463 (_1!7117 lt!236184)) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6463 (_1!7117 lt!236184)) #b00000000000000000000000000000001) (bvadd (currentByte!6463 (_1!7117 lt!236184)) #b00000000000000000000000000000001))))))

(assert (= (and d!49752 res!127207) b!151688))

(declare-fun m!237221 () Bool)

(assert (=> d!49752 m!237221))

(assert (=> d!49268 d!49752))

(declare-fun d!49754 () Bool)

(declare-fun res!127208 () Bool)

(declare-fun e!101317 () Bool)

(assert (=> d!49754 (=> (not res!127208) (not e!101317))))

(assert (=> d!49754 (= res!127208 (= (size!3050 (buf!3537 (_2!7117 lt!236647))) (size!3050 (buf!3537 (_2!7115 lt!236195)))))))

(assert (=> d!49754 (= (isPrefixOf!0 (_2!7117 lt!236647) (_2!7115 lt!236195)) e!101317)))

(declare-fun b!151689 () Bool)

(declare-fun res!127210 () Bool)

(assert (=> b!151689 (=> (not res!127210) (not e!101317))))

(assert (=> b!151689 (= res!127210 (bvsle (bitIndex!0 (size!3050 (buf!3537 (_2!7117 lt!236647))) (currentByte!6463 (_2!7117 lt!236647)) (currentBit!6458 (_2!7117 lt!236647))) (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236195))) (currentByte!6463 (_2!7115 lt!236195)) (currentBit!6458 (_2!7115 lt!236195)))))))

(declare-fun b!151690 () Bool)

(declare-fun e!101316 () Bool)

(assert (=> b!151690 (= e!101317 e!101316)))

(declare-fun res!127209 () Bool)

(assert (=> b!151690 (=> res!127209 e!101316)))

(assert (=> b!151690 (= res!127209 (= (size!3050 (buf!3537 (_2!7117 lt!236647))) #b00000000000000000000000000000000))))

(declare-fun b!151691 () Bool)

(assert (=> b!151691 (= e!101316 (arrayBitRangesEq!0 (buf!3537 (_2!7117 lt!236647)) (buf!3537 (_2!7115 lt!236195)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3050 (buf!3537 (_2!7117 lt!236647))) (currentByte!6463 (_2!7117 lt!236647)) (currentBit!6458 (_2!7117 lt!236647)))))))

(assert (= (and d!49754 res!127208) b!151689))

(assert (= (and b!151689 res!127210) b!151690))

(assert (= (and b!151690 (not res!127209)) b!151691))

(assert (=> b!151689 m!236939))

(assert (=> b!151689 m!235511))

(assert (=> b!151691 m!236939))

(assert (=> b!151691 m!236939))

(declare-fun m!237223 () Bool)

(assert (=> b!151691 m!237223))

(assert (=> b!151129 d!49754))

(declare-fun d!49756 () Bool)

(declare-fun e!101318 () Bool)

(assert (=> d!49756 e!101318))

(declare-fun res!127211 () Bool)

(assert (=> d!49756 (=> (not res!127211) (not e!101318))))

(declare-fun lt!237686 () (_ BitVec 64))

(declare-fun lt!237685 () BitStream!5358)

(assert (=> d!49756 (= res!127211 (= (bvadd lt!237686 (bvsub lt!236567 lt!236560)) (bitIndex!0 (size!3050 (buf!3537 lt!237685)) (currentByte!6463 lt!237685) (currentBit!6458 lt!237685))))))

(assert (=> d!49756 (or (not (= (bvand lt!237686 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!236567 lt!236560) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!237686 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!237686 (bvsub lt!236567 lt!236560)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!49756 (= lt!237686 (bitIndex!0 (size!3050 (buf!3537 (_2!7117 lt!236557))) (currentByte!6463 (_2!7117 lt!236557)) (currentBit!6458 (_2!7117 lt!236557))))))

(assert (=> d!49756 (= lt!237685 (_2!7115 (moveBitIndex!0 (_2!7117 lt!236557) (bvsub lt!236567 lt!236560))))))

(assert (=> d!49756 (moveBitIndexPrecond!0 (_2!7117 lt!236557) (bvsub lt!236567 lt!236560))))

(assert (=> d!49756 (= (withMovedBitIndex!0 (_2!7117 lt!236557) (bvsub lt!236567 lt!236560)) lt!237685)))

(declare-fun b!151692 () Bool)

(assert (=> b!151692 (= e!101318 (= (size!3050 (buf!3537 (_2!7117 lt!236557))) (size!3050 (buf!3537 lt!237685))))))

(assert (= (and d!49756 res!127211) b!151692))

(declare-fun m!237225 () Bool)

(assert (=> d!49756 m!237225))

(assert (=> d!49756 m!236953))

(declare-fun m!237227 () Bool)

(assert (=> d!49756 m!237227))

(declare-fun m!237229 () Bool)

(assert (=> d!49756 m!237229))

(assert (=> b!151094 d!49756))

(assert (=> b!151094 d!49183))

(assert (=> b!151094 d!49190))

(assert (=> b!151127 d!49194))

(declare-fun d!49758 () Bool)

(assert (=> d!49758 (arrayBitRangesEq!0 (buf!3537 (_2!7115 lt!236195)) (buf!3537 thiss!1634) lt!236658 lt!236652)))

(declare-fun lt!237687 () Unit!9509)

(assert (=> d!49758 (= lt!237687 (choose!8 (buf!3537 thiss!1634) (buf!3537 (_2!7115 lt!236195)) lt!236658 lt!236652))))

(assert (=> d!49758 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!236658) (bvsle lt!236658 lt!236652))))

(assert (=> d!49758 (= (arrayBitRangesEqSymmetric!0 (buf!3537 thiss!1634) (buf!3537 (_2!7115 lt!236195)) lt!236658 lt!236652) lt!237687)))

(declare-fun bs!12151 () Bool)

(assert (= bs!12151 d!49758))

(assert (=> bs!12151 m!235975))

(declare-fun m!237231 () Bool)

(assert (=> bs!12151 m!237231))

(assert (=> b!151127 d!49758))

(declare-fun b!151693 () Bool)

(declare-fun e!101321 () Bool)

(declare-fun e!101320 () Bool)

(assert (=> b!151693 (= e!101321 e!101320)))

(declare-fun c!8114 () Bool)

(declare-fun lt!237690 () tuple4!148)

(assert (=> b!151693 (= c!8114 (= (_3!374 lt!237690) (_4!74 lt!237690)))))

(declare-fun b!151694 () Bool)

(declare-fun res!127212 () Bool)

(declare-fun lt!237688 () (_ BitVec 32))

(assert (=> b!151694 (= res!127212 (= lt!237688 #b00000000000000000000000000000000))))

(declare-fun e!101324 () Bool)

(assert (=> b!151694 (=> res!127212 e!101324)))

(declare-fun e!101323 () Bool)

(assert (=> b!151694 (= e!101323 e!101324)))

(declare-fun call!2092 () Bool)

(declare-fun lt!237689 () (_ BitVec 32))

(declare-fun bm!2089 () Bool)

(assert (=> bm!2089 (= call!2092 (byteRangesEq!0 (ite c!8114 (select (arr!3852 (buf!3537 (_2!7115 lt!236195))) (_3!374 lt!237690)) (select (arr!3852 (buf!3537 (_2!7115 lt!236195))) (_4!74 lt!237690))) (ite c!8114 (select (arr!3852 (buf!3537 thiss!1634)) (_3!374 lt!237690)) (select (arr!3852 (buf!3537 thiss!1634)) (_4!74 lt!237690))) (ite c!8114 lt!237689 #b00000000000000000000000000000000) lt!237688))))

(declare-fun b!151695 () Bool)

(assert (=> b!151695 (= e!101320 e!101323)))

(declare-fun res!127214 () Bool)

(assert (=> b!151695 (= res!127214 (byteRangesEq!0 (select (arr!3852 (buf!3537 (_2!7115 lt!236195))) (_3!374 lt!237690)) (select (arr!3852 (buf!3537 thiss!1634)) (_3!374 lt!237690)) lt!237689 #b00000000000000000000000000001000))))

(assert (=> b!151695 (=> (not res!127214) (not e!101323))))

(declare-fun b!151696 () Bool)

(declare-fun e!101319 () Bool)

(assert (=> b!151696 (= e!101319 (arrayRangesEq!366 (buf!3537 (_2!7115 lt!236195)) (buf!3537 thiss!1634) (_1!7131 lt!237690) (_2!7131 lt!237690)))))

(declare-fun d!49760 () Bool)

(declare-fun res!127216 () Bool)

(declare-fun e!101322 () Bool)

(assert (=> d!49760 (=> res!127216 e!101322)))

(assert (=> d!49760 (= res!127216 (bvsge lt!236658 lt!236652))))

(assert (=> d!49760 (= (arrayBitRangesEq!0 (buf!3537 (_2!7115 lt!236195)) (buf!3537 thiss!1634) lt!236658 lt!236652) e!101322)))

(declare-fun b!151697 () Bool)

(assert (=> b!151697 (= e!101324 call!2092)))

(declare-fun b!151698 () Bool)

(assert (=> b!151698 (= e!101320 call!2092)))

(declare-fun b!151699 () Bool)

(assert (=> b!151699 (= e!101322 e!101321)))

(declare-fun res!127213 () Bool)

(assert (=> b!151699 (=> (not res!127213) (not e!101321))))

(assert (=> b!151699 (= res!127213 e!101319)))

(declare-fun res!127215 () Bool)

(assert (=> b!151699 (=> res!127215 e!101319)))

(assert (=> b!151699 (= res!127215 (bvsge (_1!7131 lt!237690) (_2!7131 lt!237690)))))

(assert (=> b!151699 (= lt!237688 ((_ extract 31 0) (bvsrem lt!236652 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!151699 (= lt!237689 ((_ extract 31 0) (bvsrem lt!236658 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!151699 (= lt!237690 (arrayBitIndices!0 lt!236658 lt!236652))))

(assert (= (and d!49760 (not res!127216)) b!151699))

(assert (= (and b!151699 (not res!127215)) b!151696))

(assert (= (and b!151699 res!127213) b!151693))

(assert (= (and b!151693 c!8114) b!151698))

(assert (= (and b!151693 (not c!8114)) b!151695))

(assert (= (and b!151695 res!127214) b!151694))

(assert (= (and b!151694 (not res!127212)) b!151697))

(assert (= (or b!151698 b!151697) bm!2089))

(declare-fun m!237233 () Bool)

(assert (=> bm!2089 m!237233))

(declare-fun m!237235 () Bool)

(assert (=> bm!2089 m!237235))

(declare-fun m!237237 () Bool)

(assert (=> bm!2089 m!237237))

(declare-fun m!237239 () Bool)

(assert (=> bm!2089 m!237239))

(declare-fun m!237241 () Bool)

(assert (=> bm!2089 m!237241))

(assert (=> b!151695 m!237241))

(assert (=> b!151695 m!237237))

(assert (=> b!151695 m!237241))

(assert (=> b!151695 m!237237))

(declare-fun m!237243 () Bool)

(assert (=> b!151695 m!237243))

(declare-fun m!237245 () Bool)

(assert (=> b!151696 m!237245))

(declare-fun m!237247 () Bool)

(assert (=> b!151699 m!237247))

(assert (=> b!151127 d!49760))

(declare-fun lt!237692 () (_ BitVec 8))

(declare-fun lt!237696 () (_ BitVec 8))

(declare-fun d!49762 () Bool)

(assert (=> d!49762 (= lt!237692 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3852 (buf!3537 (BitStream!5359 (buf!3537 (_2!7115 lt!236195)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634)))) (currentByte!6463 (BitStream!5359 (buf!3537 (_2!7115 lt!236195)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634))))) ((_ sign_extend 24) lt!237696))))))

(assert (=> d!49762 (= lt!237696 ((_ extract 7 0) (currentBit!6458 (BitStream!5359 (buf!3537 (_2!7115 lt!236195)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634)))))))

(declare-fun e!101326 () Bool)

(assert (=> d!49762 e!101326))

(declare-fun res!127218 () Bool)

(assert (=> d!49762 (=> (not res!127218) (not e!101326))))

(assert (=> d!49762 (= res!127218 (validate_offset_bits!1 ((_ sign_extend 32) (size!3050 (buf!3537 (BitStream!5359 (buf!3537 (_2!7115 lt!236195)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634))))) ((_ sign_extend 32) (currentByte!6463 (BitStream!5359 (buf!3537 (_2!7115 lt!236195)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634)))) ((_ sign_extend 32) (currentBit!6458 (BitStream!5359 (buf!3537 (_2!7115 lt!236195)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634)))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!9587 () Unit!9509)

(declare-fun Unit!9588 () Unit!9509)

(assert (=> d!49762 (= (readByte!0 (BitStream!5359 (buf!3537 (_2!7115 lt!236195)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634))) (tuple2!13509 (_2!7132 (ite (bvsgt ((_ sign_extend 24) lt!237696) #b00000000000000000000000000000000) (tuple2!13515 Unit!9587 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!237692) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3852 (buf!3537 (BitStream!5359 (buf!3537 (_2!7115 lt!236195)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634)))) (bvadd (currentByte!6463 (BitStream!5359 (buf!3537 (_2!7115 lt!236195)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!237696)))))))) (tuple2!13515 Unit!9588 lt!237692))) (BitStream!5359 (buf!3537 (BitStream!5359 (buf!3537 (_2!7115 lt!236195)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634))) (bvadd (currentByte!6463 (BitStream!5359 (buf!3537 (_2!7115 lt!236195)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634))) #b00000000000000000000000000000001) (currentBit!6458 (BitStream!5359 (buf!3537 (_2!7115 lt!236195)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634))))))))

(declare-fun b!151700 () Bool)

(declare-fun e!101325 () Bool)

(assert (=> b!151700 (= e!101326 e!101325)))

(declare-fun res!127217 () Bool)

(assert (=> b!151700 (=> (not res!127217) (not e!101325))))

(declare-fun lt!237697 () tuple2!13508)

(assert (=> b!151700 (= res!127217 (= (buf!3537 (_2!7126 lt!237697)) (buf!3537 (BitStream!5359 (buf!3537 (_2!7115 lt!236195)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634)))))))

(declare-fun lt!237695 () (_ BitVec 8))

(declare-fun lt!237694 () (_ BitVec 8))

(declare-fun Unit!9589 () Unit!9509)

(declare-fun Unit!9590 () Unit!9509)

(assert (=> b!151700 (= lt!237697 (tuple2!13509 (_2!7132 (ite (bvsgt ((_ sign_extend 24) lt!237695) #b00000000000000000000000000000000) (tuple2!13515 Unit!9589 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!237694) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3852 (buf!3537 (BitStream!5359 (buf!3537 (_2!7115 lt!236195)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634)))) (bvadd (currentByte!6463 (BitStream!5359 (buf!3537 (_2!7115 lt!236195)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!237695)))))))) (tuple2!13515 Unit!9590 lt!237694))) (BitStream!5359 (buf!3537 (BitStream!5359 (buf!3537 (_2!7115 lt!236195)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634))) (bvadd (currentByte!6463 (BitStream!5359 (buf!3537 (_2!7115 lt!236195)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634))) #b00000000000000000000000000000001) (currentBit!6458 (BitStream!5359 (buf!3537 (_2!7115 lt!236195)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634))))))))

(assert (=> b!151700 (= lt!237694 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3852 (buf!3537 (BitStream!5359 (buf!3537 (_2!7115 lt!236195)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634)))) (currentByte!6463 (BitStream!5359 (buf!3537 (_2!7115 lt!236195)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634))))) ((_ sign_extend 24) lt!237695))))))

(assert (=> b!151700 (= lt!237695 ((_ extract 7 0) (currentBit!6458 (BitStream!5359 (buf!3537 (_2!7115 lt!236195)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634)))))))

(declare-fun lt!237693 () (_ BitVec 64))

(declare-fun lt!237691 () (_ BitVec 64))

(declare-fun b!151701 () Bool)

(assert (=> b!151701 (= e!101325 (= (bitIndex!0 (size!3050 (buf!3537 (_2!7126 lt!237697))) (currentByte!6463 (_2!7126 lt!237697)) (currentBit!6458 (_2!7126 lt!237697))) (bvadd lt!237693 lt!237691)))))

(assert (=> b!151701 (or (not (= (bvand lt!237693 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!237691 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!237693 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!237693 lt!237691) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!151701 (= lt!237691 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!151701 (= lt!237693 (bitIndex!0 (size!3050 (buf!3537 (BitStream!5359 (buf!3537 (_2!7115 lt!236195)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634)))) (currentByte!6463 (BitStream!5359 (buf!3537 (_2!7115 lt!236195)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634))) (currentBit!6458 (BitStream!5359 (buf!3537 (_2!7115 lt!236195)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634)))))))

(assert (= (and d!49762 res!127218) b!151700))

(assert (= (and b!151700 res!127217) b!151701))

(declare-fun m!237249 () Bool)

(assert (=> d!49762 m!237249))

(declare-fun m!237251 () Bool)

(assert (=> d!49762 m!237251))

(declare-fun m!237253 () Bool)

(assert (=> d!49762 m!237253))

(assert (=> b!151700 m!237253))

(assert (=> b!151700 m!237249))

(declare-fun m!237255 () Bool)

(assert (=> b!151701 m!237255))

(declare-fun m!237257 () Bool)

(assert (=> b!151701 m!237257))

(assert (=> d!49286 d!49762))

(declare-fun d!49764 () Bool)

(assert (=> d!49764 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236193)))) ((_ sign_extend 32) (currentByte!6463 (_2!7115 lt!236193))) ((_ sign_extend 32) (currentBit!6458 (_2!7115 lt!236193))) lt!236869) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236193)))) ((_ sign_extend 32) (currentByte!6463 (_2!7115 lt!236193))) ((_ sign_extend 32) (currentBit!6458 (_2!7115 lt!236193)))) lt!236869))))

(declare-fun bs!12152 () Bool)

(assert (= bs!12152 d!49764))

(assert (=> bs!12152 m!235805))

(assert (=> b!151229 d!49764))

(assert (=> d!49266 d!49260))

(declare-fun d!49766 () Bool)

(assert (=> d!49766 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236195)))) ((_ sign_extend 32) (currentByte!6463 (_2!7115 lt!236193))) ((_ sign_extend 32) (currentBit!6458 (_2!7115 lt!236193))) lt!236172)))

(assert (=> d!49766 true))

(declare-fun _$5!90 () Unit!9509)

(assert (=> d!49766 (= (choose!26 (_2!7115 lt!236193) (buf!3537 (_2!7115 lt!236195)) lt!236172 (BitStream!5359 (buf!3537 (_2!7115 lt!236195)) (currentByte!6463 (_2!7115 lt!236193)) (currentBit!6458 (_2!7115 lt!236193)))) _$5!90)))

(declare-fun bs!12153 () Bool)

(assert (= bs!12153 d!49766))

(assert (=> bs!12153 m!235555))

(assert (=> d!49266 d!49766))

(assert (=> d!49256 d!49282))

(declare-fun d!49768 () Bool)

(assert (=> d!49768 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236195)))) ((_ sign_extend 32) (currentByte!6463 thiss!1634)) ((_ sign_extend 32) (currentBit!6458 thiss!1634)) (bvsub to!404 from!447))))

(assert (=> d!49768 true))

(declare-fun _$5!91 () Unit!9509)

(assert (=> d!49768 (= (choose!26 thiss!1634 (buf!3537 (_2!7115 lt!236195)) (bvsub to!404 from!447) (BitStream!5359 (buf!3537 (_2!7115 lt!236195)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634))) _$5!91)))

(declare-fun bs!12154 () Bool)

(assert (= bs!12154 d!49768))

(assert (=> bs!12154 m!235539))

(assert (=> d!49256 d!49768))

(assert (=> d!49194 d!49694))

(assert (=> d!49194 d!49169))

(declare-fun d!49770 () Bool)

(declare-fun res!127219 () Bool)

(declare-fun e!101327 () Bool)

(assert (=> d!49770 (=> res!127219 e!101327)))

(assert (=> d!49770 (= res!127219 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!49770 (= (arrayRangesEq!366 (_2!7116 lt!236179) (_2!7116 lt!236173) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!101327)))

(declare-fun b!151702 () Bool)

(declare-fun e!101328 () Bool)

(assert (=> b!151702 (= e!101327 e!101328)))

(declare-fun res!127220 () Bool)

(assert (=> b!151702 (=> (not res!127220) (not e!101328))))

(assert (=> b!151702 (= res!127220 (= (select (arr!3852 (_2!7116 lt!236179)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3852 (_2!7116 lt!236173)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!151703 () Bool)

(assert (=> b!151703 (= e!101328 (arrayRangesEq!366 (_2!7116 lt!236179) (_2!7116 lt!236173) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!49770 (not res!127219)) b!151702))

(assert (= (and b!151702 res!127220) b!151703))

(assert (=> b!151702 m!237029))

(declare-fun m!237259 () Bool)

(assert (=> b!151702 m!237259))

(declare-fun m!237261 () Bool)

(assert (=> b!151703 m!237261))

(assert (=> b!151140 d!49770))

(assert (=> d!49304 d!49724))

(declare-fun d!49772 () Bool)

(declare-fun res!127221 () Bool)

(declare-fun e!101330 () Bool)

(assert (=> d!49772 (=> (not res!127221) (not e!101330))))

(assert (=> d!49772 (= res!127221 (= (size!3050 (buf!3537 (_1!7117 lt!236647))) (size!3050 (buf!3537 (_2!7117 lt!236647)))))))

(assert (=> d!49772 (= (isPrefixOf!0 (_1!7117 lt!236647) (_2!7117 lt!236647)) e!101330)))

(declare-fun b!151704 () Bool)

(declare-fun res!127223 () Bool)

(assert (=> b!151704 (=> (not res!127223) (not e!101330))))

(assert (=> b!151704 (= res!127223 (bvsle (bitIndex!0 (size!3050 (buf!3537 (_1!7117 lt!236647))) (currentByte!6463 (_1!7117 lt!236647)) (currentBit!6458 (_1!7117 lt!236647))) (bitIndex!0 (size!3050 (buf!3537 (_2!7117 lt!236647))) (currentByte!6463 (_2!7117 lt!236647)) (currentBit!6458 (_2!7117 lt!236647)))))))

(declare-fun b!151705 () Bool)

(declare-fun e!101329 () Bool)

(assert (=> b!151705 (= e!101330 e!101329)))

(declare-fun res!127222 () Bool)

(assert (=> b!151705 (=> res!127222 e!101329)))

(assert (=> b!151705 (= res!127222 (= (size!3050 (buf!3537 (_1!7117 lt!236647))) #b00000000000000000000000000000000))))

(declare-fun b!151706 () Bool)

(assert (=> b!151706 (= e!101329 (arrayBitRangesEq!0 (buf!3537 (_1!7117 lt!236647)) (buf!3537 (_2!7117 lt!236647)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3050 (buf!3537 (_1!7117 lt!236647))) (currentByte!6463 (_1!7117 lt!236647)) (currentBit!6458 (_1!7117 lt!236647)))))))

(assert (= (and d!49772 res!127221) b!151704))

(assert (= (and b!151704 res!127223) b!151705))

(assert (= (and b!151705 (not res!127222)) b!151706))

(assert (=> b!151704 m!237159))

(assert (=> b!151704 m!236939))

(assert (=> b!151706 m!237159))

(assert (=> b!151706 m!237159))

(declare-fun m!237263 () Bool)

(assert (=> b!151706 m!237263))

(assert (=> d!49254 d!49772))

(declare-fun d!49774 () Bool)

(assert (=> d!49774 (isPrefixOf!0 lt!236662 (_2!7115 lt!236195))))

(declare-fun lt!237698 () Unit!9509)

(assert (=> d!49774 (= lt!237698 (choose!30 lt!236662 thiss!1634 (_2!7115 lt!236195)))))

(assert (=> d!49774 (isPrefixOf!0 lt!236662 thiss!1634)))

(assert (=> d!49774 (= (lemmaIsPrefixTransitive!0 lt!236662 thiss!1634 (_2!7115 lt!236195)) lt!237698)))

(declare-fun bs!12155 () Bool)

(assert (= bs!12155 d!49774))

(assert (=> bs!12155 m!235969))

(declare-fun m!237265 () Bool)

(assert (=> bs!12155 m!237265))

(declare-fun m!237267 () Bool)

(assert (=> bs!12155 m!237267))

(assert (=> d!49254 d!49774))

(assert (=> d!49254 d!49274))

(declare-fun d!49776 () Bool)

(assert (=> d!49776 (isPrefixOf!0 lt!236662 lt!236662)))

(declare-fun lt!237699 () Unit!9509)

(assert (=> d!49776 (= lt!237699 (choose!11 lt!236662))))

(assert (=> d!49776 (= (lemmaIsPrefixRefl!0 lt!236662) lt!237699)))

(declare-fun bs!12156 () Bool)

(assert (= bs!12156 d!49776))

(assert (=> bs!12156 m!235965))

(declare-fun m!237269 () Bool)

(assert (=> bs!12156 m!237269))

(assert (=> d!49254 d!49776))

(declare-fun d!49778 () Bool)

(declare-fun res!127224 () Bool)

(declare-fun e!101332 () Bool)

(assert (=> d!49778 (=> (not res!127224) (not e!101332))))

(assert (=> d!49778 (= res!127224 (= (size!3050 (buf!3537 lt!236662)) (size!3050 (buf!3537 (_2!7115 lt!236195)))))))

(assert (=> d!49778 (= (isPrefixOf!0 lt!236662 (_2!7115 lt!236195)) e!101332)))

(declare-fun b!151707 () Bool)

(declare-fun res!127226 () Bool)

(assert (=> b!151707 (=> (not res!127226) (not e!101332))))

(assert (=> b!151707 (= res!127226 (bvsle (bitIndex!0 (size!3050 (buf!3537 lt!236662)) (currentByte!6463 lt!236662) (currentBit!6458 lt!236662)) (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236195))) (currentByte!6463 (_2!7115 lt!236195)) (currentBit!6458 (_2!7115 lt!236195)))))))

(declare-fun b!151708 () Bool)

(declare-fun e!101331 () Bool)

(assert (=> b!151708 (= e!101332 e!101331)))

(declare-fun res!127225 () Bool)

(assert (=> b!151708 (=> res!127225 e!101331)))

(assert (=> b!151708 (= res!127225 (= (size!3050 (buf!3537 lt!236662)) #b00000000000000000000000000000000))))

(declare-fun b!151709 () Bool)

(assert (=> b!151709 (= e!101331 (arrayBitRangesEq!0 (buf!3537 lt!236662) (buf!3537 (_2!7115 lt!236195)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3050 (buf!3537 lt!236662)) (currentByte!6463 lt!236662) (currentBit!6458 lt!236662))))))

(assert (= (and d!49778 res!127224) b!151707))

(assert (= (and b!151707 res!127226) b!151708))

(assert (= (and b!151708 (not res!127225)) b!151709))

(declare-fun m!237271 () Bool)

(assert (=> b!151707 m!237271))

(assert (=> b!151707 m!235511))

(assert (=> b!151709 m!237271))

(assert (=> b!151709 m!237271))

(declare-fun m!237273 () Bool)

(assert (=> b!151709 m!237273))

(assert (=> d!49254 d!49778))

(declare-fun d!49780 () Bool)

(declare-fun res!127227 () Bool)

(declare-fun e!101334 () Bool)

(assert (=> d!49780 (=> (not res!127227) (not e!101334))))

(assert (=> d!49780 (= res!127227 (= (size!3050 (buf!3537 lt!236662)) (size!3050 (buf!3537 lt!236662))))))

(assert (=> d!49780 (= (isPrefixOf!0 lt!236662 lt!236662) e!101334)))

(declare-fun b!151710 () Bool)

(declare-fun res!127229 () Bool)

(assert (=> b!151710 (=> (not res!127229) (not e!101334))))

(assert (=> b!151710 (= res!127229 (bvsle (bitIndex!0 (size!3050 (buf!3537 lt!236662)) (currentByte!6463 lt!236662) (currentBit!6458 lt!236662)) (bitIndex!0 (size!3050 (buf!3537 lt!236662)) (currentByte!6463 lt!236662) (currentBit!6458 lt!236662))))))

(declare-fun b!151711 () Bool)

(declare-fun e!101333 () Bool)

(assert (=> b!151711 (= e!101334 e!101333)))

(declare-fun res!127228 () Bool)

(assert (=> b!151711 (=> res!127228 e!101333)))

(assert (=> b!151711 (= res!127228 (= (size!3050 (buf!3537 lt!236662)) #b00000000000000000000000000000000))))

(declare-fun b!151712 () Bool)

(assert (=> b!151712 (= e!101333 (arrayBitRangesEq!0 (buf!3537 lt!236662) (buf!3537 lt!236662) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3050 (buf!3537 lt!236662)) (currentByte!6463 lt!236662) (currentBit!6458 lt!236662))))))

(assert (= (and d!49780 res!127227) b!151710))

(assert (= (and b!151710 res!127229) b!151711))

(assert (= (and b!151711 (not res!127228)) b!151712))

(assert (=> b!151710 m!237271))

(assert (=> b!151710 m!237271))

(assert (=> b!151712 m!237271))

(assert (=> b!151712 m!237271))

(declare-fun m!237275 () Bool)

(assert (=> b!151712 m!237275))

(assert (=> d!49254 d!49780))

(assert (=> d!49254 d!49652))

(assert (=> d!49254 d!49706))

(assert (=> d!49254 d!49708))

(declare-fun d!49782 () Bool)

(assert (=> d!49782 (isPrefixOf!0 lt!236662 (_2!7115 lt!236195))))

(declare-fun lt!237700 () Unit!9509)

(assert (=> d!49782 (= lt!237700 (choose!30 lt!236662 (_2!7115 lt!236195) (_2!7115 lt!236195)))))

(assert (=> d!49782 (isPrefixOf!0 lt!236662 (_2!7115 lt!236195))))

(assert (=> d!49782 (= (lemmaIsPrefixTransitive!0 lt!236662 (_2!7115 lt!236195) (_2!7115 lt!236195)) lt!237700)))

(declare-fun bs!12157 () Bool)

(assert (= bs!12157 d!49782))

(assert (=> bs!12157 m!235969))

(declare-fun m!237277 () Bool)

(assert (=> bs!12157 m!237277))

(assert (=> bs!12157 m!235969))

(assert (=> d!49254 d!49782))

(assert (=> d!49254 d!49646))

(declare-fun d!49784 () Bool)

(assert (=> d!49784 (= (remainingBits!0 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236195)))) ((_ sign_extend 32) (currentByte!6463 (_2!7115 lt!236195))) ((_ sign_extend 32) (currentBit!6458 (_2!7115 lt!236195)))) (bvsub (bvmul ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236195)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6463 (_2!7115 lt!236195))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6458 (_2!7115 lt!236195))))))))

(assert (=> d!49183 d!49784))

(declare-fun d!49786 () Bool)

(assert (=> d!49786 (= (invariant!0 (currentBit!6458 (_2!7115 lt!236195)) (currentByte!6463 (_2!7115 lt!236195)) (size!3050 (buf!3537 (_2!7115 lt!236195)))) (and (bvsge (currentBit!6458 (_2!7115 lt!236195)) #b00000000000000000000000000000000) (bvslt (currentBit!6458 (_2!7115 lt!236195)) #b00000000000000000000000000001000) (bvsge (currentByte!6463 (_2!7115 lt!236195)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6463 (_2!7115 lt!236195)) (size!3050 (buf!3537 (_2!7115 lt!236195)))) (and (= (currentBit!6458 (_2!7115 lt!236195)) #b00000000000000000000000000000000) (= (currentByte!6463 (_2!7115 lt!236195)) (size!3050 (buf!3537 (_2!7115 lt!236195))))))))))

(assert (=> d!49183 d!49786))

(assert (=> b!151111 d!49194))

(assert (=> b!151111 d!49190))

(declare-fun d!49788 () Bool)

(declare-fun res!127230 () Bool)

(declare-fun e!101335 () Bool)

(assert (=> d!49788 (=> res!127230 e!101335)))

(assert (=> d!49788 (= res!127230 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!49788 (= (arrayRangesEq!366 (_2!7116 lt!236179) (_2!7116 lt!236199) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!101335)))

(declare-fun b!151713 () Bool)

(declare-fun e!101336 () Bool)

(assert (=> b!151713 (= e!101335 e!101336)))

(declare-fun res!127231 () Bool)

(assert (=> b!151713 (=> (not res!127231) (not e!101336))))

(assert (=> b!151713 (= res!127231 (= (select (arr!3852 (_2!7116 lt!236179)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3852 (_2!7116 lt!236199)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!151714 () Bool)

(assert (=> b!151714 (= e!101336 (arrayRangesEq!366 (_2!7116 lt!236179) (_2!7116 lt!236199) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!49788 (not res!127230)) b!151713))

(assert (= (and b!151713 res!127231) b!151714))

(assert (=> b!151713 m!237029))

(assert (=> b!151713 m!237163))

(declare-fun m!237279 () Bool)

(assert (=> b!151714 m!237279))

(assert (=> b!151138 d!49788))

(declare-fun d!49790 () Bool)

(declare-fun lt!237702 () (_ BitVec 8))

(declare-fun lt!237706 () (_ BitVec 8))

(assert (=> d!49790 (= lt!237702 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3852 (buf!3537 (_1!7117 lt!236184))) (currentByte!6463 (_1!7117 lt!236184)))) ((_ sign_extend 24) lt!237706))))))

(assert (=> d!49790 (= lt!237706 ((_ extract 7 0) (currentBit!6458 (_1!7117 lt!236184))))))

(declare-fun e!101338 () Bool)

(assert (=> d!49790 e!101338))

(declare-fun res!127233 () Bool)

(assert (=> d!49790 (=> (not res!127233) (not e!101338))))

(assert (=> d!49790 (= res!127233 (validate_offset_bits!1 ((_ sign_extend 32) (size!3050 (buf!3537 (_1!7117 lt!236184)))) ((_ sign_extend 32) (currentByte!6463 (_1!7117 lt!236184))) ((_ sign_extend 32) (currentBit!6458 (_1!7117 lt!236184))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!9591 () Unit!9509)

(declare-fun Unit!9592 () Unit!9509)

(assert (=> d!49790 (= (readByte!0 (_1!7117 lt!236184)) (tuple2!13509 (_2!7132 (ite (bvsgt ((_ sign_extend 24) lt!237706) #b00000000000000000000000000000000) (tuple2!13515 Unit!9591 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!237702) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3852 (buf!3537 (_1!7117 lt!236184))) (bvadd (currentByte!6463 (_1!7117 lt!236184)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!237706)))))))) (tuple2!13515 Unit!9592 lt!237702))) (BitStream!5359 (buf!3537 (_1!7117 lt!236184)) (bvadd (currentByte!6463 (_1!7117 lt!236184)) #b00000000000000000000000000000001) (currentBit!6458 (_1!7117 lt!236184)))))))

(declare-fun b!151715 () Bool)

(declare-fun e!101337 () Bool)

(assert (=> b!151715 (= e!101338 e!101337)))

(declare-fun res!127232 () Bool)

(assert (=> b!151715 (=> (not res!127232) (not e!101337))))

(declare-fun lt!237707 () tuple2!13508)

(assert (=> b!151715 (= res!127232 (= (buf!3537 (_2!7126 lt!237707)) (buf!3537 (_1!7117 lt!236184))))))

(declare-fun lt!237705 () (_ BitVec 8))

(declare-fun lt!237704 () (_ BitVec 8))

(declare-fun Unit!9593 () Unit!9509)

(declare-fun Unit!9594 () Unit!9509)

(assert (=> b!151715 (= lt!237707 (tuple2!13509 (_2!7132 (ite (bvsgt ((_ sign_extend 24) lt!237705) #b00000000000000000000000000000000) (tuple2!13515 Unit!9593 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!237704) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3852 (buf!3537 (_1!7117 lt!236184))) (bvadd (currentByte!6463 (_1!7117 lt!236184)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!237705)))))))) (tuple2!13515 Unit!9594 lt!237704))) (BitStream!5359 (buf!3537 (_1!7117 lt!236184)) (bvadd (currentByte!6463 (_1!7117 lt!236184)) #b00000000000000000000000000000001) (currentBit!6458 (_1!7117 lt!236184)))))))

(assert (=> b!151715 (= lt!237704 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3852 (buf!3537 (_1!7117 lt!236184))) (currentByte!6463 (_1!7117 lt!236184)))) ((_ sign_extend 24) lt!237705))))))

(assert (=> b!151715 (= lt!237705 ((_ extract 7 0) (currentBit!6458 (_1!7117 lt!236184))))))

(declare-fun lt!237701 () (_ BitVec 64))

(declare-fun b!151716 () Bool)

(declare-fun lt!237703 () (_ BitVec 64))

(assert (=> b!151716 (= e!101337 (= (bitIndex!0 (size!3050 (buf!3537 (_2!7126 lt!237707))) (currentByte!6463 (_2!7126 lt!237707)) (currentBit!6458 (_2!7126 lt!237707))) (bvadd lt!237703 lt!237701)))))

(assert (=> b!151716 (or (not (= (bvand lt!237703 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!237701 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!237703 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!237703 lt!237701) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!151716 (= lt!237701 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!151716 (= lt!237703 (bitIndex!0 (size!3050 (buf!3537 (_1!7117 lt!236184))) (currentByte!6463 (_1!7117 lt!236184)) (currentBit!6458 (_1!7117 lt!236184))))))

(assert (= (and d!49790 res!127233) b!151715))

(assert (= (and b!151715 res!127232) b!151716))

(declare-fun m!237281 () Bool)

(assert (=> d!49790 m!237281))

(declare-fun m!237283 () Bool)

(assert (=> d!49790 m!237283))

(declare-fun m!237285 () Bool)

(assert (=> d!49790 m!237285))

(assert (=> b!151715 m!237285))

(assert (=> b!151715 m!237281))

(declare-fun m!237287 () Bool)

(assert (=> b!151716 m!237287))

(assert (=> b!151716 m!237181))

(assert (=> d!49284 d!49790))

(declare-fun d!49792 () Bool)

(declare-fun res!127234 () Bool)

(declare-fun e!101340 () Bool)

(assert (=> d!49792 (=> (not res!127234) (not e!101340))))

(assert (=> d!49792 (= res!127234 (= (size!3050 (buf!3537 (_1!7117 lt!236626))) (size!3050 (buf!3537 thiss!1634))))))

(assert (=> d!49792 (= (isPrefixOf!0 (_1!7117 lt!236626) thiss!1634) e!101340)))

(declare-fun b!151717 () Bool)

(declare-fun res!127236 () Bool)

(assert (=> b!151717 (=> (not res!127236) (not e!101340))))

(assert (=> b!151717 (= res!127236 (bvsle (bitIndex!0 (size!3050 (buf!3537 (_1!7117 lt!236626))) (currentByte!6463 (_1!7117 lt!236626)) (currentBit!6458 (_1!7117 lt!236626))) (bitIndex!0 (size!3050 (buf!3537 thiss!1634)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634))))))

(declare-fun b!151718 () Bool)

(declare-fun e!101339 () Bool)

(assert (=> b!151718 (= e!101340 e!101339)))

(declare-fun res!127235 () Bool)

(assert (=> b!151718 (=> res!127235 e!101339)))

(assert (=> b!151718 (= res!127235 (= (size!3050 (buf!3537 (_1!7117 lt!236626))) #b00000000000000000000000000000000))))

(declare-fun b!151719 () Bool)

(assert (=> b!151719 (= e!101339 (arrayBitRangesEq!0 (buf!3537 (_1!7117 lt!236626)) (buf!3537 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3050 (buf!3537 (_1!7117 lt!236626))) (currentByte!6463 (_1!7117 lt!236626)) (currentBit!6458 (_1!7117 lt!236626)))))))

(assert (= (and d!49792 res!127234) b!151717))

(assert (= (and b!151717 res!127236) b!151718))

(assert (= (and b!151718 (not res!127235)) b!151719))

(assert (=> b!151717 m!236915))

(assert (=> b!151717 m!235513))

(assert (=> b!151719 m!236915))

(assert (=> b!151719 m!236915))

(declare-fun m!237289 () Bool)

(assert (=> b!151719 m!237289))

(assert (=> b!151126 d!49792))

(declare-fun d!49794 () Bool)

(declare-fun res!127237 () Bool)

(declare-fun e!101342 () Bool)

(assert (=> d!49794 (=> (not res!127237) (not e!101342))))

(assert (=> d!49794 (= res!127237 (= (size!3050 (buf!3537 (_2!7117 lt!236626))) (size!3050 (buf!3537 (_2!7115 lt!236193)))))))

(assert (=> d!49794 (= (isPrefixOf!0 (_2!7117 lt!236626) (_2!7115 lt!236193)) e!101342)))

(declare-fun b!151720 () Bool)

(declare-fun res!127239 () Bool)

(assert (=> b!151720 (=> (not res!127239) (not e!101342))))

(assert (=> b!151720 (= res!127239 (bvsle (bitIndex!0 (size!3050 (buf!3537 (_2!7117 lt!236626))) (currentByte!6463 (_2!7117 lt!236626)) (currentBit!6458 (_2!7117 lt!236626))) (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236193))) (currentByte!6463 (_2!7115 lt!236193)) (currentBit!6458 (_2!7115 lt!236193)))))))

(declare-fun b!151721 () Bool)

(declare-fun e!101341 () Bool)

(assert (=> b!151721 (= e!101342 e!101341)))

(declare-fun res!127238 () Bool)

(assert (=> b!151721 (=> res!127238 e!101341)))

(assert (=> b!151721 (= res!127238 (= (size!3050 (buf!3537 (_2!7117 lt!236626))) #b00000000000000000000000000000000))))

(declare-fun b!151722 () Bool)

(assert (=> b!151722 (= e!101341 (arrayBitRangesEq!0 (buf!3537 (_2!7117 lt!236626)) (buf!3537 (_2!7115 lt!236193)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3050 (buf!3537 (_2!7117 lt!236626))) (currentByte!6463 (_2!7117 lt!236626)) (currentBit!6458 (_2!7117 lt!236626)))))))

(assert (= (and d!49794 res!127237) b!151720))

(assert (= (and b!151720 res!127239) b!151721))

(assert (= (and b!151721 (not res!127238)) b!151722))

(assert (=> b!151720 m!236917))

(assert (=> b!151720 m!235575))

(assert (=> b!151722 m!236917))

(assert (=> b!151722 m!236917))

(declare-fun m!237291 () Bool)

(assert (=> b!151722 m!237291))

(assert (=> b!151124 d!49794))

(assert (=> d!49200 d!49198))

(declare-fun d!49796 () Bool)

(assert (=> d!49796 (validate_offset_bits!1 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7115 lt!236195)))) ((_ sign_extend 32) (currentByte!6463 (_2!7115 lt!236193))) ((_ sign_extend 32) (currentBit!6458 (_2!7115 lt!236193))) lt!236180)))

(assert (=> d!49796 true))

(declare-fun _$6!342 () Unit!9509)

(assert (=> d!49796 (= (choose!9 (_2!7115 lt!236193) (buf!3537 (_2!7115 lt!236195)) lt!236180 (BitStream!5359 (buf!3537 (_2!7115 lt!236195)) (currentByte!6463 (_2!7115 lt!236193)) (currentBit!6458 (_2!7115 lt!236193)))) _$6!342)))

(declare-fun bs!12158 () Bool)

(assert (= bs!12158 d!49796))

(assert (=> bs!12158 m!235571))

(assert (=> d!49200 d!49796))

(declare-fun d!49798 () Bool)

(declare-fun e!101343 () Bool)

(assert (=> d!49798 e!101343))

(declare-fun res!127240 () Bool)

(assert (=> d!49798 (=> (not res!127240) (not e!101343))))

(declare-fun lt!237709 () (_ BitVec 64))

(declare-fun lt!237708 () (_ BitVec 64))

(declare-fun lt!237713 () (_ BitVec 64))

(assert (=> d!49798 (= res!127240 (= lt!237708 (bvsub lt!237709 lt!237713)))))

(assert (=> d!49798 (or (= (bvand lt!237709 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!237713 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!237709 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!237709 lt!237713) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!49798 (= lt!237713 (remainingBits!0 ((_ sign_extend 32) (size!3050 (buf!3537 (_1!7118 lt!236727)))) ((_ sign_extend 32) (currentByte!6463 (_1!7118 lt!236727))) ((_ sign_extend 32) (currentBit!6458 (_1!7118 lt!236727)))))))

(declare-fun lt!237712 () (_ BitVec 64))

(declare-fun lt!237711 () (_ BitVec 64))

(assert (=> d!49798 (= lt!237709 (bvmul lt!237712 lt!237711))))

(assert (=> d!49798 (or (= lt!237712 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!237711 (bvsdiv (bvmul lt!237712 lt!237711) lt!237712)))))

(assert (=> d!49798 (= lt!237711 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!49798 (= lt!237712 ((_ sign_extend 32) (size!3050 (buf!3537 (_1!7118 lt!236727)))))))

(assert (=> d!49798 (= lt!237708 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6463 (_1!7118 lt!236727))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6458 (_1!7118 lt!236727)))))))

(assert (=> d!49798 (invariant!0 (currentBit!6458 (_1!7118 lt!236727)) (currentByte!6463 (_1!7118 lt!236727)) (size!3050 (buf!3537 (_1!7118 lt!236727))))))

(assert (=> d!49798 (= (bitIndex!0 (size!3050 (buf!3537 (_1!7118 lt!236727))) (currentByte!6463 (_1!7118 lt!236727)) (currentBit!6458 (_1!7118 lt!236727))) lt!237708)))

(declare-fun b!151723 () Bool)

(declare-fun res!127241 () Bool)

(assert (=> b!151723 (=> (not res!127241) (not e!101343))))

(assert (=> b!151723 (= res!127241 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!237708))))

(declare-fun b!151724 () Bool)

(declare-fun lt!237710 () (_ BitVec 64))

(assert (=> b!151724 (= e!101343 (bvsle lt!237708 (bvmul lt!237710 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!151724 (or (= lt!237710 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!237710 #b0000000000000000000000000000000000000000000000000000000000001000) lt!237710)))))

(assert (=> b!151724 (= lt!237710 ((_ sign_extend 32) (size!3050 (buf!3537 (_1!7118 lt!236727)))))))

(assert (= (and d!49798 res!127240) b!151723))

(assert (= (and b!151723 res!127241) b!151724))

(declare-fun m!237293 () Bool)

(assert (=> d!49798 m!237293))

(declare-fun m!237295 () Bool)

(assert (=> d!49798 m!237295))

(assert (=> d!49280 d!49798))

(declare-fun d!49800 () Bool)

(declare-fun lt!237714 () tuple2!13508)

(assert (=> d!49800 (= lt!237714 (readByte!0 lt!236726))))

(assert (=> d!49800 (= (readBytePure!0 lt!236726) (tuple2!13497 (_2!7126 lt!237714) (_1!7126 lt!237714)))))

(declare-fun bs!12159 () Bool)

(assert (= bs!12159 d!49800))

(declare-fun m!237297 () Bool)

(assert (=> bs!12159 m!237297))

(assert (=> d!49280 d!49800))

(declare-fun d!49802 () Bool)

(declare-fun e!101344 () Bool)

(assert (=> d!49802 e!101344))

(declare-fun res!127242 () Bool)

(assert (=> d!49802 (=> (not res!127242) (not e!101344))))

(declare-fun lt!237715 () (_ BitVec 64))

(declare-fun lt!237716 () (_ BitVec 64))

(declare-fun lt!237720 () (_ BitVec 64))

(assert (=> d!49802 (= res!127242 (= lt!237715 (bvsub lt!237716 lt!237720)))))

(assert (=> d!49802 (or (= (bvand lt!237716 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!237720 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!237716 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!237716 lt!237720) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!49802 (= lt!237720 (remainingBits!0 ((_ sign_extend 32) (size!3050 (buf!3537 (_1!7118 lt!236725)))) ((_ sign_extend 32) (currentByte!6463 (_1!7118 lt!236725))) ((_ sign_extend 32) (currentBit!6458 (_1!7118 lt!236725)))))))

(declare-fun lt!237719 () (_ BitVec 64))

(declare-fun lt!237718 () (_ BitVec 64))

(assert (=> d!49802 (= lt!237716 (bvmul lt!237719 lt!237718))))

(assert (=> d!49802 (or (= lt!237719 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!237718 (bvsdiv (bvmul lt!237719 lt!237718) lt!237719)))))

(assert (=> d!49802 (= lt!237718 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!49802 (= lt!237719 ((_ sign_extend 32) (size!3050 (buf!3537 (_1!7118 lt!236725)))))))

(assert (=> d!49802 (= lt!237715 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6463 (_1!7118 lt!236725))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6458 (_1!7118 lt!236725)))))))

(assert (=> d!49802 (invariant!0 (currentBit!6458 (_1!7118 lt!236725)) (currentByte!6463 (_1!7118 lt!236725)) (size!3050 (buf!3537 (_1!7118 lt!236725))))))

(assert (=> d!49802 (= (bitIndex!0 (size!3050 (buf!3537 (_1!7118 lt!236725))) (currentByte!6463 (_1!7118 lt!236725)) (currentBit!6458 (_1!7118 lt!236725))) lt!237715)))

(declare-fun b!151725 () Bool)

(declare-fun res!127243 () Bool)

(assert (=> b!151725 (=> (not res!127243) (not e!101344))))

(assert (=> b!151725 (= res!127243 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!237715))))

(declare-fun b!151726 () Bool)

(declare-fun lt!237717 () (_ BitVec 64))

(assert (=> b!151726 (= e!101344 (bvsle lt!237715 (bvmul lt!237717 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!151726 (or (= lt!237717 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!237717 #b0000000000000000000000000000000000000000000000000000000000001000) lt!237717)))))

(assert (=> b!151726 (= lt!237717 ((_ sign_extend 32) (size!3050 (buf!3537 (_1!7118 lt!236725)))))))

(assert (= (and d!49802 res!127242) b!151725))

(assert (= (and b!151725 res!127243) b!151726))

(declare-fun m!237299 () Bool)

(assert (=> d!49802 m!237299))

(declare-fun m!237301 () Bool)

(assert (=> d!49802 m!237301))

(assert (=> d!49280 d!49802))

(declare-fun d!49804 () Bool)

(declare-fun e!101347 () Bool)

(assert (=> d!49804 e!101347))

(declare-fun res!127246 () Bool)

(assert (=> d!49804 (=> (not res!127246) (not e!101347))))

(declare-fun lt!237726 () tuple2!13496)

(declare-fun lt!237725 () tuple2!13496)

(assert (=> d!49804 (= res!127246 (= (bitIndex!0 (size!3050 (buf!3537 (_1!7118 lt!237726))) (currentByte!6463 (_1!7118 lt!237726)) (currentBit!6458 (_1!7118 lt!237726))) (bitIndex!0 (size!3050 (buf!3537 (_1!7118 lt!237725))) (currentByte!6463 (_1!7118 lt!237725)) (currentBit!6458 (_1!7118 lt!237725)))))))

(assert (=> d!49804 (= lt!237725 (readBytePure!0 (BitStream!5359 (buf!3537 (_2!7115 lt!236195)) (currentByte!6463 lt!236196) (currentBit!6458 lt!236196))))))

(assert (=> d!49804 (= lt!237726 (readBytePure!0 lt!236196))))

(assert (=> d!49804 true))

(declare-fun _$8!102 () Unit!9509)

(assert (=> d!49804 (= (choose!14 lt!236196 (_2!7115 lt!236195) lt!236726 lt!236727 (tuple2!13497 (_1!7118 lt!236727) (_2!7118 lt!236727)) (_1!7118 lt!236727) (_2!7118 lt!236727) lt!236725 (tuple2!13497 (_1!7118 lt!236725) (_2!7118 lt!236725)) (_1!7118 lt!236725) (_2!7118 lt!236725)) _$8!102)))

(declare-fun b!151729 () Bool)

(assert (=> b!151729 (= e!101347 (= (_2!7118 lt!237726) (_2!7118 lt!237725)))))

(assert (= (and d!49804 res!127246) b!151729))

(declare-fun m!237303 () Bool)

(assert (=> d!49804 m!237303))

(declare-fun m!237305 () Bool)

(assert (=> d!49804 m!237305))

(declare-fun m!237307 () Bool)

(assert (=> d!49804 m!237307))

(assert (=> d!49804 m!235523))

(assert (=> d!49280 d!49804))

(assert (=> d!49280 d!49362))

(declare-fun d!49806 () Bool)

(declare-fun res!127247 () Bool)

(declare-fun e!101349 () Bool)

(assert (=> d!49806 (=> (not res!127247) (not e!101349))))

(assert (=> d!49806 (= res!127247 (= (size!3050 (buf!3537 thiss!1634)) (size!3050 (buf!3537 (_2!7115 lt!236928)))))))

(assert (=> d!49806 (= (isPrefixOf!0 thiss!1634 (_2!7115 lt!236928)) e!101349)))

(declare-fun b!151730 () Bool)

(declare-fun res!127249 () Bool)

(assert (=> b!151730 (=> (not res!127249) (not e!101349))))

(assert (=> b!151730 (= res!127249 (bvsle (bitIndex!0 (size!3050 (buf!3537 thiss!1634)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634)) (bitIndex!0 (size!3050 (buf!3537 (_2!7115 lt!236928))) (currentByte!6463 (_2!7115 lt!236928)) (currentBit!6458 (_2!7115 lt!236928)))))))

(declare-fun b!151731 () Bool)

(declare-fun e!101348 () Bool)

(assert (=> b!151731 (= e!101349 e!101348)))

(declare-fun res!127248 () Bool)

(assert (=> b!151731 (=> res!127248 e!101348)))

(assert (=> b!151731 (= res!127248 (= (size!3050 (buf!3537 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!151732 () Bool)

(assert (=> b!151732 (= e!101348 (arrayBitRangesEq!0 (buf!3537 thiss!1634) (buf!3537 (_2!7115 lt!236928)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3050 (buf!3537 thiss!1634)) (currentByte!6463 thiss!1634) (currentBit!6458 thiss!1634))))))

(assert (= (and d!49806 res!127247) b!151730))

(assert (= (and b!151730 res!127249) b!151731))

(assert (= (and b!151731 (not res!127248)) b!151732))

(assert (=> b!151730 m!235513))

(assert (=> b!151730 m!236195))

(assert (=> b!151732 m!235513))

(assert (=> b!151732 m!235513))

(declare-fun m!237309 () Bool)

(assert (=> b!151732 m!237309))

(assert (=> b!151260 d!49806))

(declare-fun d!49808 () Bool)

(assert (=> d!49808 (= (remainingBits!0 ((_ sign_extend 32) (size!3050 (buf!3537 (_1!7118 lt!236192)))) ((_ sign_extend 32) (currentByte!6463 (_1!7118 lt!236192))) ((_ sign_extend 32) (currentBit!6458 (_1!7118 lt!236192)))) (bvsub (bvmul ((_ sign_extend 32) (size!3050 (buf!3537 (_1!7118 lt!236192)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6463 (_1!7118 lt!236192))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6458 (_1!7118 lt!236192))))))))

(assert (=> d!49367 d!49808))

(declare-fun d!49810 () Bool)

(assert (=> d!49810 (= (invariant!0 (currentBit!6458 (_1!7118 lt!236192)) (currentByte!6463 (_1!7118 lt!236192)) (size!3050 (buf!3537 (_1!7118 lt!236192)))) (and (bvsge (currentBit!6458 (_1!7118 lt!236192)) #b00000000000000000000000000000000) (bvslt (currentBit!6458 (_1!7118 lt!236192)) #b00000000000000000000000000001000) (bvsge (currentByte!6463 (_1!7118 lt!236192)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6463 (_1!7118 lt!236192)) (size!3050 (buf!3537 (_1!7118 lt!236192)))) (and (= (currentBit!6458 (_1!7118 lt!236192)) #b00000000000000000000000000000000) (= (currentByte!6463 (_1!7118 lt!236192)) (size!3050 (buf!3537 (_1!7118 lt!236192))))))))))

(assert (=> d!49367 d!49810))

(declare-fun lt!237760 () Unit!9509)

(declare-fun b!151733 () Bool)

(declare-fun e!101350 () tuple3!596)

(assert (=> b!151733 (= e!101350 (tuple3!597 lt!237760 (_1!7117 lt!236181) lt!236176))))

(declare-fun call!2094 () (_ BitVec 64))

(assert (=> b!151733 (= call!2094 call!2094)))

(declare-fun lt!237734 () Unit!9509)

(declare-fun Unit!9595 () Unit!9509)

(assert (=> b!151733 (= lt!237734 Unit!9595)))

(declare-fun lt!237743 () Unit!9509)

(assert (=> b!151733 (= lt!237743 (arrayRangesEqReflexiveLemma!17 lt!236176))))

(declare-fun call!2093 () Bool)

(assert (=> b!151733 call!2093))

(declare-fun lt!237737 () Unit!9509)

(assert (=> b!151733 (= lt!237737 lt!237743)))

(declare-fun lt!237727 () array!6742)

(assert (=> b!151733 (= lt!237727 lt!236176)))

(declare-fun lt!237752 () array!6742)

(assert (=> b!151733 (= lt!237752 lt!236176)))

(declare-fun lt!237740 () (_ BitVec 32))

(assert (=> b!151733 (= lt!237740 #b00000000000000000000000000000000)))

(declare-fun lt!237749 () (_ BitVec 32))

(assert (=> b!151733 (= lt!237749 (size!3050 lt!236176))))

(declare-fun lt!237756 () (_ BitVec 32))

(assert (=> b!151733 (= lt!237756 #b00000000000000000000000000000000)))

(declare-fun lt!237751 () (_ BitVec 32))

(assert (=> b!151733 (= lt!237751 (bvadd #b00000000000000000000000000000001 from!447))))

(assert (=> b!151733 (= lt!237760 (arrayRangesEqSlicedLemma!17 lt!237727 lt!237752 lt!237740 lt!237749 lt!237756 lt!237751))))

(declare-fun call!2095 () Bool)

(assert (=> b!151733 call!2095))

(declare-fun d!49812 () Bool)

(declare-fun e!101352 () Bool)

(assert (=> d!49812 e!101352))

(declare-fun res!127252 () Bool)

(assert (=> d!49812 (=> res!127252 e!101352)))

(assert (=> d!49812 (= res!127252 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!237735 () Bool)

(declare-fun e!101351 () Bool)

(assert (=> d!49812 (= lt!237735 e!101351)))

(declare-fun res!127250 () Bool)

(assert (=> d!49812 (=> (not res!127250) (not e!101351))))

(declare-fun lt!237736 () tuple3!596)

(declare-fun lt!237754 () (_ BitVec 64))

(declare-fun lt!237730 () (_ BitVec 64))

(assert (=> d!49812 (= res!127250 (= (bvadd lt!237730 lt!237754) (bitIndex!0 (size!3050 (buf!3537 (_2!7125 lt!237736))) (currentByte!6463 (_2!7125 lt!237736)) (currentBit!6458 (_2!7125 lt!237736)))))))

(assert (=> d!49812 (or (not (= (bvand lt!237730 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!237754 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!237730 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!237730 lt!237754) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!237746 () (_ BitVec 64))

(assert (=> d!49812 (= lt!237754 (bvmul lt!237746 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!49812 (or (= lt!237746 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!237746 #b0000000000000000000000000000000000000000000000000000000000001000) lt!237746)))))

(assert (=> d!49812 (= lt!237746 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!49812 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!49812 (= lt!237730 (bitIndex!0 (size!3050 (buf!3537 (_1!7117 lt!236181))) (currentByte!6463 (_1!7117 lt!236181)) (currentBit!6458 (_1!7117 lt!236181))))))

(assert (=> d!49812 (= lt!237736 e!101350)))

(declare-fun c!8115 () Bool)

(assert (=> d!49812 (= c!8115 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!49812 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!3050 lt!236176)))))

(assert (=> d!49812 (= (readByteArrayLoop!0 (_1!7117 lt!236181) lt!236176 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!237736)))

(declare-fun b!151734 () Bool)

(declare-fun lt!237733 () Unit!9509)

(declare-fun lt!237732 () tuple3!596)

(assert (=> b!151734 (= e!101350 (tuple3!597 lt!237733 (_2!7125 lt!237732) (_3!371 lt!237732)))))

(declare-fun lt!237748 () tuple2!13508)

(assert (=> b!151734 (= lt!237748 (readByte!0 (_1!7117 lt!236181)))))

(declare-fun lt!237750 () array!6742)

(assert (=> b!151734 (= lt!237750 (array!6743 (store (arr!3852 lt!236176) (bvadd #b00000000000000000000000000000001 from!447) (_1!7126 lt!237748)) (size!3050 lt!236176)))))

(declare-fun lt!237759 () (_ BitVec 64))

(assert (=> b!151734 (= lt!237759 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!237739 () (_ BitVec 32))

(assert (=> b!151734 (= lt!237739 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!237755 () Unit!9509)

(assert (=> b!151734 (= lt!237755 (validateOffsetBytesFromBitIndexLemma!0 (_1!7117 lt!236181) (_2!7126 lt!237748) lt!237759 lt!237739))))

(assert (=> b!151734 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7126 lt!237748)))) ((_ sign_extend 32) (currentByte!6463 (_2!7126 lt!237748))) ((_ sign_extend 32) (currentBit!6458 (_2!7126 lt!237748))) (bvsub lt!237739 ((_ extract 31 0) (bvsdiv (bvadd lt!237759 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!237728 () Unit!9509)

(assert (=> b!151734 (= lt!237728 lt!237755)))

(assert (=> b!151734 (= lt!237732 (readByteArrayLoop!0 (_2!7126 lt!237748) lt!237750 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!151734 (= call!2094 (bvadd (bitIndex!0 (size!3050 (buf!3537 (_1!7117 lt!236181))) (currentByte!6463 (_1!7117 lt!236181)) (currentBit!6458 (_1!7117 lt!236181))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!237729 () Unit!9509)

(declare-fun Unit!9596 () Unit!9509)

(assert (=> b!151734 (= lt!237729 Unit!9596)))

(assert (=> b!151734 (= (bvadd call!2094 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3050 (buf!3537 (_2!7125 lt!237732))) (currentByte!6463 (_2!7125 lt!237732)) (currentBit!6458 (_2!7125 lt!237732))))))

(declare-fun lt!237744 () Unit!9509)

(declare-fun Unit!9597 () Unit!9509)

(assert (=> b!151734 (= lt!237744 Unit!9597)))

(assert (=> b!151734 (= (bvadd (bitIndex!0 (size!3050 (buf!3537 (_1!7117 lt!236181))) (currentByte!6463 (_1!7117 lt!236181)) (currentBit!6458 (_1!7117 lt!236181))) (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3050 (buf!3537 (_2!7125 lt!237732))) (currentByte!6463 (_2!7125 lt!237732)) (currentBit!6458 (_2!7125 lt!237732))))))

(declare-fun lt!237757 () Unit!9509)

(declare-fun Unit!9598 () Unit!9509)

(assert (=> b!151734 (= lt!237757 Unit!9598)))

(assert (=> b!151734 (and (= (buf!3537 (_1!7117 lt!236181)) (buf!3537 (_2!7125 lt!237732))) (= (size!3050 lt!236176) (size!3050 (_3!371 lt!237732))))))

(declare-fun lt!237745 () Unit!9509)

(declare-fun Unit!9599 () Unit!9509)

(assert (=> b!151734 (= lt!237745 Unit!9599)))

(declare-fun lt!237758 () Unit!9509)

(assert (=> b!151734 (= lt!237758 (arrayUpdatedAtPrefixLemma!17 lt!236176 (bvadd #b00000000000000000000000000000001 from!447) (_1!7126 lt!237748)))))

(assert (=> b!151734 call!2093))

(declare-fun lt!237741 () Unit!9509)

(assert (=> b!151734 (= lt!237741 lt!237758)))

(declare-fun lt!237761 () (_ BitVec 32))

(assert (=> b!151734 (= lt!237761 #b00000000000000000000000000000000)))

(declare-fun lt!237753 () Unit!9509)

(assert (=> b!151734 (= lt!237753 (arrayRangesEqTransitive!81 lt!236176 lt!237750 (_3!371 lt!237732) lt!237761 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!151734 call!2095))

(declare-fun lt!237742 () Unit!9509)

(assert (=> b!151734 (= lt!237742 lt!237753)))

(assert (=> b!151734 (arrayRangesEq!366 lt!236176 (_3!371 lt!237732) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!237747 () Unit!9509)

(declare-fun Unit!9600 () Unit!9509)

(assert (=> b!151734 (= lt!237747 Unit!9600)))

(declare-fun lt!237738 () Unit!9509)

(assert (=> b!151734 (= lt!237738 (arrayRangesEqImpliesEq!17 lt!237750 (_3!371 lt!237732) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!151734 (= (select (store (arr!3852 lt!236176) (bvadd #b00000000000000000000000000000001 from!447) (_1!7126 lt!237748)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3852 (_3!371 lt!237732)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!237731 () Unit!9509)

(assert (=> b!151734 (= lt!237731 lt!237738)))

(declare-fun lt!237762 () Bool)

(assert (=> b!151734 (= lt!237762 (= (select (arr!3852 (_3!371 lt!237732)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!7126 lt!237748)))))

(declare-fun Unit!9601 () Unit!9509)

(assert (=> b!151734 (= lt!237733 Unit!9601)))

(assert (=> b!151734 lt!237762))

(declare-fun bm!2090 () Bool)

(assert (=> bm!2090 (= call!2094 (bitIndex!0 (ite c!8115 (size!3050 (buf!3537 (_2!7126 lt!237748))) (size!3050 (buf!3537 (_1!7117 lt!236181)))) (ite c!8115 (currentByte!6463 (_2!7126 lt!237748)) (currentByte!6463 (_1!7117 lt!236181))) (ite c!8115 (currentBit!6458 (_2!7126 lt!237748)) (currentBit!6458 (_1!7117 lt!236181)))))))

(declare-fun b!151735 () Bool)

(assert (=> b!151735 (= e!101351 (arrayRangesEq!366 lt!236176 (_3!371 lt!237736) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun b!151736 () Bool)

(declare-fun res!127251 () Bool)

(assert (=> b!151736 (=> (not res!127251) (not e!101351))))

(assert (=> b!151736 (= res!127251 (and (= (buf!3537 (_1!7117 lt!236181)) (buf!3537 (_2!7125 lt!237736))) (= (size!3050 lt!236176) (size!3050 (_3!371 lt!237736)))))))

(declare-fun bm!2091 () Bool)

(assert (=> bm!2091 (= call!2093 (arrayRangesEq!366 lt!236176 (ite c!8115 (array!6743 (store (arr!3852 lt!236176) (bvadd #b00000000000000000000000000000001 from!447) (_1!7126 lt!237748)) (size!3050 lt!236176)) lt!236176) #b00000000000000000000000000000000 (ite c!8115 (bvadd #b00000000000000000000000000000001 from!447) (size!3050 lt!236176))))))

(declare-fun bm!2092 () Bool)

(assert (=> bm!2092 (= call!2095 (arrayRangesEq!366 (ite c!8115 lt!236176 lt!237727) (ite c!8115 (_3!371 lt!237732) lt!237752) (ite c!8115 lt!237761 lt!237756) (ite c!8115 (bvadd #b00000000000000000000000000000001 from!447) lt!237751)))))

(declare-fun b!151737 () Bool)

(assert (=> b!151737 (= e!101352 (= (select (arr!3852 (_3!371 lt!237736)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!7118 (readBytePure!0 (_1!7117 lt!236181)))))))

(assert (=> b!151737 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!3050 (_3!371 lt!237736))))))

(assert (= (and d!49812 c!8115) b!151734))

(assert (= (and d!49812 (not c!8115)) b!151733))

(assert (= (or b!151734 b!151733) bm!2092))

(assert (= (or b!151734 b!151733) bm!2091))

(assert (= (or b!151734 b!151733) bm!2090))

(assert (= (and d!49812 res!127250) b!151736))

(assert (= (and b!151736 res!127251) b!151735))

(assert (= (and d!49812 (not res!127252)) b!151737))

(declare-fun m!237311 () Bool)

(assert (=> d!49812 m!237311))

(declare-fun m!237313 () Bool)

(assert (=> d!49812 m!237313))

(declare-fun m!237315 () Bool)

(assert (=> bm!2092 m!237315))

(declare-fun m!237317 () Bool)

(assert (=> b!151733 m!237317))

(declare-fun m!237319 () Bool)

(assert (=> b!151733 m!237319))

(declare-fun m!237321 () Bool)

(assert (=> b!151737 m!237321))

(declare-fun m!237323 () Bool)

(assert (=> b!151737 m!237323))

(declare-fun m!237325 () Bool)

(assert (=> bm!2090 m!237325))

(declare-fun m!237327 () Bool)

(assert (=> b!151735 m!237327))

(declare-fun m!237329 () Bool)

(assert (=> bm!2091 m!237329))

(declare-fun m!237331 () Bool)

(assert (=> bm!2091 m!237331))

(declare-fun m!237333 () Bool)

(assert (=> b!151734 m!237333))

(declare-fun m!237335 () Bool)

(assert (=> b!151734 m!237335))

(declare-fun m!237337 () Bool)

(assert (=> b!151734 m!237337))

(declare-fun m!237339 () Bool)

(assert (=> b!151734 m!237339))

(declare-fun m!237341 () Bool)

(assert (=> b!151734 m!237341))

(declare-fun m!237343 () Bool)

(assert (=> b!151734 m!237343))

(declare-fun m!237345 () Bool)

(assert (=> b!151734 m!237345))

(declare-fun m!237347 () Bool)

(assert (=> b!151734 m!237347))

(assert (=> b!151734 m!237313))

(declare-fun m!237349 () Bool)

(assert (=> b!151734 m!237349))

(declare-fun m!237351 () Bool)

(assert (=> b!151734 m!237351))

(assert (=> b!151734 m!237329))

(declare-fun m!237353 () Bool)

(assert (=> b!151734 m!237353))

(assert (=> d!49252 d!49812))

(declare-fun e!101353 () tuple3!596)

(declare-fun lt!237796 () Unit!9509)

(declare-fun b!151738 () Bool)

(assert (=> b!151738 (= e!101353 (tuple3!597 lt!237796 (withMovedByteIndex!0 (_1!7117 lt!236184) #b00000000000000000000000000000001) lt!236176))))

(declare-fun call!2097 () (_ BitVec 64))

(assert (=> b!151738 (= call!2097 call!2097)))

(declare-fun lt!237770 () Unit!9509)

(declare-fun Unit!9602 () Unit!9509)

(assert (=> b!151738 (= lt!237770 Unit!9602)))

(declare-fun lt!237779 () Unit!9509)

(assert (=> b!151738 (= lt!237779 (arrayRangesEqReflexiveLemma!17 lt!236176))))

(declare-fun call!2096 () Bool)

(assert (=> b!151738 call!2096))

(declare-fun lt!237773 () Unit!9509)

(assert (=> b!151738 (= lt!237773 lt!237779)))

(declare-fun lt!237763 () array!6742)

(assert (=> b!151738 (= lt!237763 lt!236176)))

(declare-fun lt!237788 () array!6742)

(assert (=> b!151738 (= lt!237788 lt!236176)))

(declare-fun lt!237776 () (_ BitVec 32))

(assert (=> b!151738 (= lt!237776 #b00000000000000000000000000000000)))

(declare-fun lt!237785 () (_ BitVec 32))

(assert (=> b!151738 (= lt!237785 (size!3050 lt!236176))))

(declare-fun lt!237792 () (_ BitVec 32))

(assert (=> b!151738 (= lt!237792 #b00000000000000000000000000000000)))

(declare-fun lt!237787 () (_ BitVec 32))

(assert (=> b!151738 (= lt!237787 (bvadd #b00000000000000000000000000000001 from!447))))

(assert (=> b!151738 (= lt!237796 (arrayRangesEqSlicedLemma!17 lt!237763 lt!237788 lt!237776 lt!237785 lt!237792 lt!237787))))

(declare-fun call!2098 () Bool)

(assert (=> b!151738 call!2098))

(declare-fun d!49814 () Bool)

(declare-fun e!101355 () Bool)

(assert (=> d!49814 e!101355))

(declare-fun res!127255 () Bool)

(assert (=> d!49814 (=> res!127255 e!101355)))

(assert (=> d!49814 (= res!127255 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!237771 () Bool)

(declare-fun e!101354 () Bool)

(assert (=> d!49814 (= lt!237771 e!101354)))

(declare-fun res!127253 () Bool)

(assert (=> d!49814 (=> (not res!127253) (not e!101354))))

(declare-fun lt!237772 () tuple3!596)

(declare-fun lt!237766 () (_ BitVec 64))

(declare-fun lt!237790 () (_ BitVec 64))

(assert (=> d!49814 (= res!127253 (= (bvadd lt!237766 lt!237790) (bitIndex!0 (size!3050 (buf!3537 (_2!7125 lt!237772))) (currentByte!6463 (_2!7125 lt!237772)) (currentBit!6458 (_2!7125 lt!237772)))))))

(assert (=> d!49814 (or (not (= (bvand lt!237766 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!237790 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!237766 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!237766 lt!237790) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!237782 () (_ BitVec 64))

(assert (=> d!49814 (= lt!237790 (bvmul lt!237782 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!49814 (or (= lt!237782 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!237782 #b0000000000000000000000000000000000000000000000000000000000001000) lt!237782)))))

(assert (=> d!49814 (= lt!237782 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!49814 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!49814 (= lt!237766 (bitIndex!0 (size!3050 (buf!3537 (withMovedByteIndex!0 (_1!7117 lt!236184) #b00000000000000000000000000000001))) (currentByte!6463 (withMovedByteIndex!0 (_1!7117 lt!236184) #b00000000000000000000000000000001)) (currentBit!6458 (withMovedByteIndex!0 (_1!7117 lt!236184) #b00000000000000000000000000000001))))))

(assert (=> d!49814 (= lt!237772 e!101353)))

(declare-fun c!8116 () Bool)

(assert (=> d!49814 (= c!8116 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!49814 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!3050 lt!236176)))))

(assert (=> d!49814 (= (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!7117 lt!236184) #b00000000000000000000000000000001) lt!236176 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!237772)))

(declare-fun b!151739 () Bool)

(declare-fun lt!237769 () Unit!9509)

(declare-fun lt!237768 () tuple3!596)

(assert (=> b!151739 (= e!101353 (tuple3!597 lt!237769 (_2!7125 lt!237768) (_3!371 lt!237768)))))

(declare-fun lt!237784 () tuple2!13508)

(assert (=> b!151739 (= lt!237784 (readByte!0 (withMovedByteIndex!0 (_1!7117 lt!236184) #b00000000000000000000000000000001)))))

(declare-fun lt!237786 () array!6742)

(assert (=> b!151739 (= lt!237786 (array!6743 (store (arr!3852 lt!236176) (bvadd #b00000000000000000000000000000001 from!447) (_1!7126 lt!237784)) (size!3050 lt!236176)))))

(declare-fun lt!237795 () (_ BitVec 64))

(assert (=> b!151739 (= lt!237795 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!237775 () (_ BitVec 32))

(assert (=> b!151739 (= lt!237775 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!237791 () Unit!9509)

(assert (=> b!151739 (= lt!237791 (validateOffsetBytesFromBitIndexLemma!0 (withMovedByteIndex!0 (_1!7117 lt!236184) #b00000000000000000000000000000001) (_2!7126 lt!237784) lt!237795 lt!237775))))

(assert (=> b!151739 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7126 lt!237784)))) ((_ sign_extend 32) (currentByte!6463 (_2!7126 lt!237784))) ((_ sign_extend 32) (currentBit!6458 (_2!7126 lt!237784))) (bvsub lt!237775 ((_ extract 31 0) (bvsdiv (bvadd lt!237795 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!237764 () Unit!9509)

(assert (=> b!151739 (= lt!237764 lt!237791)))

(assert (=> b!151739 (= lt!237768 (readByteArrayLoop!0 (_2!7126 lt!237784) lt!237786 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!151739 (= call!2097 (bvadd (bitIndex!0 (size!3050 (buf!3537 (withMovedByteIndex!0 (_1!7117 lt!236184) #b00000000000000000000000000000001))) (currentByte!6463 (withMovedByteIndex!0 (_1!7117 lt!236184) #b00000000000000000000000000000001)) (currentBit!6458 (withMovedByteIndex!0 (_1!7117 lt!236184) #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!237765 () Unit!9509)

(declare-fun Unit!9603 () Unit!9509)

(assert (=> b!151739 (= lt!237765 Unit!9603)))

(assert (=> b!151739 (= (bvadd call!2097 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3050 (buf!3537 (_2!7125 lt!237768))) (currentByte!6463 (_2!7125 lt!237768)) (currentBit!6458 (_2!7125 lt!237768))))))

(declare-fun lt!237780 () Unit!9509)

(declare-fun Unit!9604 () Unit!9509)

(assert (=> b!151739 (= lt!237780 Unit!9604)))

(assert (=> b!151739 (= (bvadd (bitIndex!0 (size!3050 (buf!3537 (withMovedByteIndex!0 (_1!7117 lt!236184) #b00000000000000000000000000000001))) (currentByte!6463 (withMovedByteIndex!0 (_1!7117 lt!236184) #b00000000000000000000000000000001)) (currentBit!6458 (withMovedByteIndex!0 (_1!7117 lt!236184) #b00000000000000000000000000000001))) (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3050 (buf!3537 (_2!7125 lt!237768))) (currentByte!6463 (_2!7125 lt!237768)) (currentBit!6458 (_2!7125 lt!237768))))))

(declare-fun lt!237793 () Unit!9509)

(declare-fun Unit!9605 () Unit!9509)

(assert (=> b!151739 (= lt!237793 Unit!9605)))

(assert (=> b!151739 (and (= (buf!3537 (withMovedByteIndex!0 (_1!7117 lt!236184) #b00000000000000000000000000000001)) (buf!3537 (_2!7125 lt!237768))) (= (size!3050 lt!236176) (size!3050 (_3!371 lt!237768))))))

(declare-fun lt!237781 () Unit!9509)

(declare-fun Unit!9606 () Unit!9509)

(assert (=> b!151739 (= lt!237781 Unit!9606)))

(declare-fun lt!237794 () Unit!9509)

(assert (=> b!151739 (= lt!237794 (arrayUpdatedAtPrefixLemma!17 lt!236176 (bvadd #b00000000000000000000000000000001 from!447) (_1!7126 lt!237784)))))

(assert (=> b!151739 call!2096))

(declare-fun lt!237777 () Unit!9509)

(assert (=> b!151739 (= lt!237777 lt!237794)))

(declare-fun lt!237797 () (_ BitVec 32))

(assert (=> b!151739 (= lt!237797 #b00000000000000000000000000000000)))

(declare-fun lt!237789 () Unit!9509)

(assert (=> b!151739 (= lt!237789 (arrayRangesEqTransitive!81 lt!236176 lt!237786 (_3!371 lt!237768) lt!237797 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!151739 call!2098))

(declare-fun lt!237778 () Unit!9509)

(assert (=> b!151739 (= lt!237778 lt!237789)))

(assert (=> b!151739 (arrayRangesEq!366 lt!236176 (_3!371 lt!237768) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!237783 () Unit!9509)

(declare-fun Unit!9607 () Unit!9509)

(assert (=> b!151739 (= lt!237783 Unit!9607)))

(declare-fun lt!237774 () Unit!9509)

(assert (=> b!151739 (= lt!237774 (arrayRangesEqImpliesEq!17 lt!237786 (_3!371 lt!237768) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!151739 (= (select (store (arr!3852 lt!236176) (bvadd #b00000000000000000000000000000001 from!447) (_1!7126 lt!237784)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3852 (_3!371 lt!237768)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!237767 () Unit!9509)

(assert (=> b!151739 (= lt!237767 lt!237774)))

(declare-fun lt!237798 () Bool)

(assert (=> b!151739 (= lt!237798 (= (select (arr!3852 (_3!371 lt!237768)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!7126 lt!237784)))))

(declare-fun Unit!9608 () Unit!9509)

(assert (=> b!151739 (= lt!237769 Unit!9608)))

(assert (=> b!151739 lt!237798))

(declare-fun bm!2093 () Bool)

(assert (=> bm!2093 (= call!2097 (bitIndex!0 (ite c!8116 (size!3050 (buf!3537 (_2!7126 lt!237784))) (size!3050 (buf!3537 (withMovedByteIndex!0 (_1!7117 lt!236184) #b00000000000000000000000000000001)))) (ite c!8116 (currentByte!6463 (_2!7126 lt!237784)) (currentByte!6463 (withMovedByteIndex!0 (_1!7117 lt!236184) #b00000000000000000000000000000001))) (ite c!8116 (currentBit!6458 (_2!7126 lt!237784)) (currentBit!6458 (withMovedByteIndex!0 (_1!7117 lt!236184) #b00000000000000000000000000000001)))))))

(declare-fun b!151740 () Bool)

(assert (=> b!151740 (= e!101354 (arrayRangesEq!366 lt!236176 (_3!371 lt!237772) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun b!151741 () Bool)

(declare-fun res!127254 () Bool)

(assert (=> b!151741 (=> (not res!127254) (not e!101354))))

(assert (=> b!151741 (= res!127254 (and (= (buf!3537 (withMovedByteIndex!0 (_1!7117 lt!236184) #b00000000000000000000000000000001)) (buf!3537 (_2!7125 lt!237772))) (= (size!3050 lt!236176) (size!3050 (_3!371 lt!237772)))))))

(declare-fun bm!2094 () Bool)

(assert (=> bm!2094 (= call!2096 (arrayRangesEq!366 lt!236176 (ite c!8116 (array!6743 (store (arr!3852 lt!236176) (bvadd #b00000000000000000000000000000001 from!447) (_1!7126 lt!237784)) (size!3050 lt!236176)) lt!236176) #b00000000000000000000000000000000 (ite c!8116 (bvadd #b00000000000000000000000000000001 from!447) (size!3050 lt!236176))))))

(declare-fun bm!2095 () Bool)

(assert (=> bm!2095 (= call!2098 (arrayRangesEq!366 (ite c!8116 lt!236176 lt!237763) (ite c!8116 (_3!371 lt!237768) lt!237788) (ite c!8116 lt!237797 lt!237792) (ite c!8116 (bvadd #b00000000000000000000000000000001 from!447) lt!237787)))))

(declare-fun b!151742 () Bool)

(assert (=> b!151742 (= e!101355 (= (select (arr!3852 (_3!371 lt!237772)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!7118 (readBytePure!0 (withMovedByteIndex!0 (_1!7117 lt!236184) #b00000000000000000000000000000001)))))))

(assert (=> b!151742 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!3050 (_3!371 lt!237772))))))

(assert (= (and d!49814 c!8116) b!151739))

(assert (= (and d!49814 (not c!8116)) b!151738))

(assert (= (or b!151739 b!151738) bm!2095))

(assert (= (or b!151739 b!151738) bm!2094))

(assert (= (or b!151739 b!151738) bm!2093))

(assert (= (and d!49814 res!127253) b!151741))

(assert (= (and b!151741 res!127254) b!151740))

(assert (= (and d!49814 (not res!127255)) b!151742))

(declare-fun m!237355 () Bool)

(assert (=> d!49814 m!237355))

(declare-fun m!237357 () Bool)

(assert (=> d!49814 m!237357))

(declare-fun m!237359 () Bool)

(assert (=> bm!2095 m!237359))

(assert (=> b!151738 m!237317))

(declare-fun m!237361 () Bool)

(assert (=> b!151738 m!237361))

(declare-fun m!237363 () Bool)

(assert (=> b!151742 m!237363))

(assert (=> b!151742 m!235531))

(declare-fun m!237365 () Bool)

(assert (=> b!151742 m!237365))

(declare-fun m!237367 () Bool)

(assert (=> bm!2093 m!237367))

(declare-fun m!237369 () Bool)

(assert (=> b!151740 m!237369))

(declare-fun m!237371 () Bool)

(assert (=> bm!2094 m!237371))

(declare-fun m!237373 () Bool)

(assert (=> bm!2094 m!237373))

(assert (=> b!151739 m!235531))

(declare-fun m!237375 () Bool)

(assert (=> b!151739 m!237375))

(declare-fun m!237377 () Bool)

(assert (=> b!151739 m!237377))

(assert (=> b!151739 m!235531))

(declare-fun m!237379 () Bool)

(assert (=> b!151739 m!237379))

(declare-fun m!237381 () Bool)

(assert (=> b!151739 m!237381))

(declare-fun m!237383 () Bool)

(assert (=> b!151739 m!237383))

(declare-fun m!237385 () Bool)

(assert (=> b!151739 m!237385))

(declare-fun m!237387 () Bool)

(assert (=> b!151739 m!237387))

(declare-fun m!237389 () Bool)

(assert (=> b!151739 m!237389))

(assert (=> b!151739 m!237357))

(declare-fun m!237391 () Bool)

(assert (=> b!151739 m!237391))

(declare-fun m!237393 () Bool)

(assert (=> b!151739 m!237393))

(assert (=> b!151739 m!237371))

(declare-fun m!237395 () Bool)

(assert (=> b!151739 m!237395))

(assert (=> d!49371 d!49814))

(assert (=> b!151122 d!49194))

(declare-fun d!49816 () Bool)

(assert (=> d!49816 (arrayBitRangesEq!0 (buf!3537 (_2!7115 lt!236193)) (buf!3537 thiss!1634) lt!236637 lt!236631)))

(declare-fun lt!237799 () Unit!9509)

(assert (=> d!49816 (= lt!237799 (choose!8 (buf!3537 thiss!1634) (buf!3537 (_2!7115 lt!236193)) lt!236637 lt!236631))))

(assert (=> d!49816 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!236637) (bvsle lt!236637 lt!236631))))

(assert (=> d!49816 (= (arrayBitRangesEqSymmetric!0 (buf!3537 thiss!1634) (buf!3537 (_2!7115 lt!236193)) lt!236637 lt!236631) lt!237799)))

(declare-fun bs!12160 () Bool)

(assert (= bs!12160 d!49816))

(assert (=> bs!12160 m!235951))

(declare-fun m!237397 () Bool)

(assert (=> bs!12160 m!237397))

(assert (=> b!151122 d!49816))

(declare-fun b!151743 () Bool)

(declare-fun e!101358 () Bool)

(declare-fun e!101357 () Bool)

(assert (=> b!151743 (= e!101358 e!101357)))

(declare-fun c!8117 () Bool)

(declare-fun lt!237802 () tuple4!148)

(assert (=> b!151743 (= c!8117 (= (_3!374 lt!237802) (_4!74 lt!237802)))))

(declare-fun b!151744 () Bool)

(declare-fun res!127256 () Bool)

(declare-fun lt!237800 () (_ BitVec 32))

(assert (=> b!151744 (= res!127256 (= lt!237800 #b00000000000000000000000000000000))))

(declare-fun e!101361 () Bool)

(assert (=> b!151744 (=> res!127256 e!101361)))

(declare-fun e!101360 () Bool)

(assert (=> b!151744 (= e!101360 e!101361)))

(declare-fun call!2099 () Bool)

(declare-fun lt!237801 () (_ BitVec 32))

(declare-fun bm!2096 () Bool)

(assert (=> bm!2096 (= call!2099 (byteRangesEq!0 (ite c!8117 (select (arr!3852 (buf!3537 (_2!7115 lt!236193))) (_3!374 lt!237802)) (select (arr!3852 (buf!3537 (_2!7115 lt!236193))) (_4!74 lt!237802))) (ite c!8117 (select (arr!3852 (buf!3537 thiss!1634)) (_3!374 lt!237802)) (select (arr!3852 (buf!3537 thiss!1634)) (_4!74 lt!237802))) (ite c!8117 lt!237801 #b00000000000000000000000000000000) lt!237800))))

(declare-fun b!151745 () Bool)

(assert (=> b!151745 (= e!101357 e!101360)))

(declare-fun res!127258 () Bool)

(assert (=> b!151745 (= res!127258 (byteRangesEq!0 (select (arr!3852 (buf!3537 (_2!7115 lt!236193))) (_3!374 lt!237802)) (select (arr!3852 (buf!3537 thiss!1634)) (_3!374 lt!237802)) lt!237801 #b00000000000000000000000000001000))))

(assert (=> b!151745 (=> (not res!127258) (not e!101360))))

(declare-fun e!101356 () Bool)

(declare-fun b!151746 () Bool)

(assert (=> b!151746 (= e!101356 (arrayRangesEq!366 (buf!3537 (_2!7115 lt!236193)) (buf!3537 thiss!1634) (_1!7131 lt!237802) (_2!7131 lt!237802)))))

(declare-fun d!49818 () Bool)

(declare-fun res!127260 () Bool)

(declare-fun e!101359 () Bool)

(assert (=> d!49818 (=> res!127260 e!101359)))

(assert (=> d!49818 (= res!127260 (bvsge lt!236637 lt!236631))))

(assert (=> d!49818 (= (arrayBitRangesEq!0 (buf!3537 (_2!7115 lt!236193)) (buf!3537 thiss!1634) lt!236637 lt!236631) e!101359)))

(declare-fun b!151747 () Bool)

(assert (=> b!151747 (= e!101361 call!2099)))

(declare-fun b!151748 () Bool)

(assert (=> b!151748 (= e!101357 call!2099)))

(declare-fun b!151749 () Bool)

(assert (=> b!151749 (= e!101359 e!101358)))

(declare-fun res!127257 () Bool)

(assert (=> b!151749 (=> (not res!127257) (not e!101358))))

(assert (=> b!151749 (= res!127257 e!101356)))

(declare-fun res!127259 () Bool)

(assert (=> b!151749 (=> res!127259 e!101356)))

(assert (=> b!151749 (= res!127259 (bvsge (_1!7131 lt!237802) (_2!7131 lt!237802)))))

(assert (=> b!151749 (= lt!237800 ((_ extract 31 0) (bvsrem lt!236631 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!151749 (= lt!237801 ((_ extract 31 0) (bvsrem lt!236637 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!151749 (= lt!237802 (arrayBitIndices!0 lt!236637 lt!236631))))

(assert (= (and d!49818 (not res!127260)) b!151749))

(assert (= (and b!151749 (not res!127259)) b!151746))

(assert (= (and b!151749 res!127257) b!151743))

(assert (= (and b!151743 c!8117) b!151748))

(assert (= (and b!151743 (not c!8117)) b!151745))

(assert (= (and b!151745 res!127258) b!151744))

(assert (= (and b!151744 (not res!127256)) b!151747))

(assert (= (or b!151748 b!151747) bm!2096))

(declare-fun m!237399 () Bool)

(assert (=> bm!2096 m!237399))

(declare-fun m!237401 () Bool)

(assert (=> bm!2096 m!237401))

(declare-fun m!237403 () Bool)

(assert (=> bm!2096 m!237403))

(declare-fun m!237405 () Bool)

(assert (=> bm!2096 m!237405))

(declare-fun m!237407 () Bool)

(assert (=> bm!2096 m!237407))

(assert (=> b!151745 m!237407))

(assert (=> b!151745 m!237403))

(assert (=> b!151745 m!237407))

(assert (=> b!151745 m!237403))

(declare-fun m!237409 () Bool)

(assert (=> b!151745 m!237409))

(declare-fun m!237411 () Bool)

(assert (=> b!151746 m!237411))

(declare-fun m!237413 () Bool)

(assert (=> b!151749 m!237413))

(assert (=> b!151122 d!49818))

(declare-fun lt!237836 () Unit!9509)

(declare-fun e!101362 () tuple3!596)

(declare-fun b!151750 () Bool)

(assert (=> b!151750 (= e!101362 (tuple3!597 lt!237836 (_1!7117 lt!236187) arr!237))))

(declare-fun call!2101 () (_ BitVec 64))

(assert (=> b!151750 (= call!2101 call!2101)))

(declare-fun lt!237810 () Unit!9509)

(declare-fun Unit!9609 () Unit!9509)

(assert (=> b!151750 (= lt!237810 Unit!9609)))

(declare-fun lt!237819 () Unit!9509)

(assert (=> b!151750 (= lt!237819 (arrayRangesEqReflexiveLemma!17 arr!237))))

(declare-fun call!2100 () Bool)

(assert (=> b!151750 call!2100))

(declare-fun lt!237813 () Unit!9509)

(assert (=> b!151750 (= lt!237813 lt!237819)))

(declare-fun lt!237803 () array!6742)

(assert (=> b!151750 (= lt!237803 arr!237)))

(declare-fun lt!237828 () array!6742)

(assert (=> b!151750 (= lt!237828 arr!237)))

(declare-fun lt!237816 () (_ BitVec 32))

(assert (=> b!151750 (= lt!237816 #b00000000000000000000000000000000)))

(declare-fun lt!237825 () (_ BitVec 32))

(assert (=> b!151750 (= lt!237825 (size!3050 arr!237))))

(declare-fun lt!237832 () (_ BitVec 32))

(assert (=> b!151750 (= lt!237832 #b00000000000000000000000000000000)))

(declare-fun lt!237827 () (_ BitVec 32))

(assert (=> b!151750 (= lt!237827 (bvadd #b00000000000000000000000000000001 from!447))))

(assert (=> b!151750 (= lt!237836 (arrayRangesEqSlicedLemma!17 lt!237803 lt!237828 lt!237816 lt!237825 lt!237832 lt!237827))))

(declare-fun call!2102 () Bool)

(assert (=> b!151750 call!2102))

(declare-fun d!49820 () Bool)

(declare-fun e!101364 () Bool)

(assert (=> d!49820 e!101364))

(declare-fun res!127263 () Bool)

(assert (=> d!49820 (=> res!127263 e!101364)))

(assert (=> d!49820 (= res!127263 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!237811 () Bool)

(declare-fun e!101363 () Bool)

(assert (=> d!49820 (= lt!237811 e!101363)))

(declare-fun res!127261 () Bool)

(assert (=> d!49820 (=> (not res!127261) (not e!101363))))

(declare-fun lt!237812 () tuple3!596)

(declare-fun lt!237806 () (_ BitVec 64))

(declare-fun lt!237830 () (_ BitVec 64))

(assert (=> d!49820 (= res!127261 (= (bvadd lt!237806 lt!237830) (bitIndex!0 (size!3050 (buf!3537 (_2!7125 lt!237812))) (currentByte!6463 (_2!7125 lt!237812)) (currentBit!6458 (_2!7125 lt!237812)))))))

(assert (=> d!49820 (or (not (= (bvand lt!237806 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!237830 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!237806 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!237806 lt!237830) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!237822 () (_ BitVec 64))

(assert (=> d!49820 (= lt!237830 (bvmul lt!237822 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!49820 (or (= lt!237822 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!237822 #b0000000000000000000000000000000000000000000000000000000000001000) lt!237822)))))

(assert (=> d!49820 (= lt!237822 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!49820 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!49820 (= lt!237806 (bitIndex!0 (size!3050 (buf!3537 (_1!7117 lt!236187))) (currentByte!6463 (_1!7117 lt!236187)) (currentBit!6458 (_1!7117 lt!236187))))))

(assert (=> d!49820 (= lt!237812 e!101362)))

(declare-fun c!8118 () Bool)

(assert (=> d!49820 (= c!8118 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!49820 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!3050 arr!237)))))

(assert (=> d!49820 (= (readByteArrayLoop!0 (_1!7117 lt!236187) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!237812)))

(declare-fun b!151751 () Bool)

(declare-fun lt!237809 () Unit!9509)

(declare-fun lt!237808 () tuple3!596)

(assert (=> b!151751 (= e!101362 (tuple3!597 lt!237809 (_2!7125 lt!237808) (_3!371 lt!237808)))))

(declare-fun lt!237824 () tuple2!13508)

(assert (=> b!151751 (= lt!237824 (readByte!0 (_1!7117 lt!236187)))))

(declare-fun lt!237826 () array!6742)

(assert (=> b!151751 (= lt!237826 (array!6743 (store (arr!3852 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!7126 lt!237824)) (size!3050 arr!237)))))

(declare-fun lt!237835 () (_ BitVec 64))

(assert (=> b!151751 (= lt!237835 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!237815 () (_ BitVec 32))

(assert (=> b!151751 (= lt!237815 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!237831 () Unit!9509)

(assert (=> b!151751 (= lt!237831 (validateOffsetBytesFromBitIndexLemma!0 (_1!7117 lt!236187) (_2!7126 lt!237824) lt!237835 lt!237815))))

(assert (=> b!151751 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3050 (buf!3537 (_2!7126 lt!237824)))) ((_ sign_extend 32) (currentByte!6463 (_2!7126 lt!237824))) ((_ sign_extend 32) (currentBit!6458 (_2!7126 lt!237824))) (bvsub lt!237815 ((_ extract 31 0) (bvsdiv (bvadd lt!237835 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!237804 () Unit!9509)

(assert (=> b!151751 (= lt!237804 lt!237831)))

(assert (=> b!151751 (= lt!237808 (readByteArrayLoop!0 (_2!7126 lt!237824) lt!237826 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!151751 (= call!2101 (bvadd (bitIndex!0 (size!3050 (buf!3537 (_1!7117 lt!236187))) (currentByte!6463 (_1!7117 lt!236187)) (currentBit!6458 (_1!7117 lt!236187))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!237805 () Unit!9509)

(declare-fun Unit!9610 () Unit!9509)

(assert (=> b!151751 (= lt!237805 Unit!9610)))

(assert (=> b!151751 (= (bvadd call!2101 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3050 (buf!3537 (_2!7125 lt!237808))) (currentByte!6463 (_2!7125 lt!237808)) (currentBit!6458 (_2!7125 lt!237808))))))

(declare-fun lt!237820 () Unit!9509)

(declare-fun Unit!9611 () Unit!9509)

(assert (=> b!151751 (= lt!237820 Unit!9611)))

(assert (=> b!151751 (= (bvadd (bitIndex!0 (size!3050 (buf!3537 (_1!7117 lt!236187))) (currentByte!6463 (_1!7117 lt!236187)) (currentBit!6458 (_1!7117 lt!236187))) (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3050 (buf!3537 (_2!7125 lt!237808))) (currentByte!6463 (_2!7125 lt!237808)) (currentBit!6458 (_2!7125 lt!237808))))))

(declare-fun lt!237833 () Unit!9509)

(declare-fun Unit!9612 () Unit!9509)

(assert (=> b!151751 (= lt!237833 Unit!9612)))

(assert (=> b!151751 (and (= (buf!3537 (_1!7117 lt!236187)) (buf!3537 (_2!7125 lt!237808))) (= (size!3050 arr!237) (size!3050 (_3!371 lt!237808))))))

(declare-fun lt!237821 () Unit!9509)

(declare-fun Unit!9613 () Unit!9509)

(assert (=> b!151751 (= lt!237821 Unit!9613)))

(declare-fun lt!237834 () Unit!9509)

(assert (=> b!151751 (= lt!237834 (arrayUpdatedAtPrefixLemma!17 arr!237 (bvadd #b00000000000000000000000000000001 from!447) (_1!7126 lt!237824)))))

(assert (=> b!151751 call!2100))

(declare-fun lt!237817 () Unit!9509)

(assert (=> b!151751 (= lt!237817 lt!237834)))

(declare-fun lt!237837 () (_ BitVec 32))

(assert (=> b!151751 (= lt!237837 #b00000000000000000000000000000000)))

(declare-fun lt!237829 () Unit!9509)

(assert (=> b!151751 (= lt!237829 (arrayRangesEqTransitive!81 arr!237 lt!237826 (_3!371 lt!237808) lt!237837 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!151751 call!2102))

(declare-fun lt!237818 () Unit!9509)

(assert (=> b!151751 (= lt!237818 lt!237829)))

(assert (=> b!151751 (arrayRangesEq!366 arr!237 (_3!371 lt!237808) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!237823 () Unit!9509)

(declare-fun Unit!9614 () Unit!9509)

(assert (=> b!151751 (= lt!237823 Unit!9614)))

(declare-fun lt!237814 () Unit!9509)

(assert (=> b!151751 (= lt!237814 (arrayRangesEqImpliesEq!17 lt!237826 (_3!371 lt!237808) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!151751 (= (select (store (arr!3852 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!7126 lt!237824)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3852 (_3!371 lt!237808)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!237807 () Unit!9509)

(assert (=> b!151751 (= lt!237807 lt!237814)))

(declare-fun lt!237838 () Bool)

(assert (=> b!151751 (= lt!237838 (= (select (arr!3852 (_3!371 lt!237808)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!7126 lt!237824)))))

(declare-fun Unit!9615 () Unit!9509)

(assert (=> b!151751 (= lt!237809 Unit!9615)))

(assert (=> b!151751 lt!237838))

(declare-fun bm!2097 () Bool)

(assert (=> bm!2097 (= call!2101 (bitIndex!0 (ite c!8118 (size!3050 (buf!3537 (_2!7126 lt!237824))) (size!3050 (buf!3537 (_1!7117 lt!236187)))) (ite c!8118 (currentByte!6463 (_2!7126 lt!237824)) (currentByte!6463 (_1!7117 lt!236187))) (ite c!8118 (currentBit!6458 (_2!7126 lt!237824)) (currentBit!6458 (_1!7117 lt!236187)))))))

(declare-fun b!151752 () Bool)

(assert (=> b!151752 (= e!101363 (arrayRangesEq!366 arr!237 (_3!371 lt!237812) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun b!151753 () Bool)

(declare-fun res!127262 () Bool)

(assert (=> b!151753 (=> (not res!127262) (not e!101363))))

(assert (=> b!151753 (= res!127262 (and (= (buf!3537 (_1!7117 lt!236187)) (buf!3537 (_2!7125 lt!237812))) (= (size!3050 arr!237) (size!3050 (_3!371 lt!237812)))))))

(declare-fun bm!2098 () Bool)

(assert (=> bm!2098 (= call!2100 (arrayRangesEq!366 arr!237 (ite c!8118 (array!6743 (store (arr!3852 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!7126 lt!237824)) (size!3050 arr!237)) arr!237) #b00000000000000000000000000000000 (ite c!8118 (bvadd #b00000000000000000000000000000001 from!447) (size!3050 arr!237))))))

(declare-fun bm!2099 () Bool)

(assert (=> bm!2099 (= call!2102 (arrayRangesEq!366 (ite c!8118 arr!237 lt!237803) (ite c!8118 (_3!371 lt!237808) lt!237828) (ite c!8118 lt!237837 lt!237832) (ite c!8118 (bvadd #b00000000000000000000000000000001 from!447) lt!237827)))))

(declare-fun b!151754 () Bool)

(assert (=> b!151754 (= e!101364 (= (select (arr!3852 (_3!371 lt!237812)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!7118 (readBytePure!0 (_1!7117 lt!236187)))))))

(assert (=> b!151754 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!3050 (_3!371 lt!237812))))))

(assert (= (and d!49820 c!8118) b!151751))

(assert (= (and d!49820 (not c!8118)) b!151750))

(assert (= (or b!151751 b!151750) bm!2099))

(assert (= (or b!151751 b!151750) bm!2098))

(assert (= (or b!151751 b!151750) bm!2097))

(assert (= (and d!49820 res!127261) b!151753))

(assert (= (and b!151753 res!127262) b!151752))

(assert (= (and d!49820 (not res!127263)) b!151754))

(declare-fun m!237415 () Bool)

(assert (=> d!49820 m!237415))

(declare-fun m!237417 () Bool)

(assert (=> d!49820 m!237417))

(declare-fun m!237419 () Bool)

(assert (=> bm!2099 m!237419))

(assert (=> b!151750 m!237185))

(declare-fun m!237421 () Bool)

(assert (=> b!151750 m!237421))

(declare-fun m!237423 () Bool)

(assert (=> b!151754 m!237423))

(declare-fun m!237425 () Bool)

(assert (=> b!151754 m!237425))

(declare-fun m!237427 () Bool)

(assert (=> bm!2097 m!237427))

(declare-fun m!237429 () Bool)

(assert (=> b!151752 m!237429))

(declare-fun m!237431 () Bool)

(assert (=> bm!2098 m!237431))

(declare-fun m!237433 () Bool)

(assert (=> bm!2098 m!237433))

(declare-fun m!237435 () Bool)

(assert (=> b!151751 m!237435))

(declare-fun m!237437 () Bool)

(assert (=> b!151751 m!237437))

(declare-fun m!237439 () Bool)

(assert (=> b!151751 m!237439))

(declare-fun m!237441 () Bool)

(assert (=> b!151751 m!237441))

(declare-fun m!237443 () Bool)

(assert (=> b!151751 m!237443))

(declare-fun m!237445 () Bool)

(assert (=> b!151751 m!237445))

(declare-fun m!237447 () Bool)

(assert (=> b!151751 m!237447))

(declare-fun m!237449 () Bool)

(assert (=> b!151751 m!237449))

(assert (=> b!151751 m!237417))

(declare-fun m!237451 () Bool)

(assert (=> b!151751 m!237451))

(declare-fun m!237453 () Bool)

(assert (=> b!151751 m!237453))

(assert (=> b!151751 m!237431))

(declare-fun m!237455 () Bool)

(assert (=> b!151751 m!237455))

(assert (=> d!49196 d!49820))

(check-sat (not b!151752) (not d!49774) (not d!49676) (not d!49764) (not b!151712) (not b!151720) (not bm!2088) (not b!151566) (not b!151707) (not bm!2076) (not b!151539) (not b!151661) (not b!151567) (not b!151622) (not d!49802) (not b!151561) (not bm!2086) (not d!49650) (not d!49728) (not b!151738) (not b!151709) (not bm!2091) (not b!151550) (not b!151656) (not d!49748) (not d!49670) (not b!151570) (not b!151553) (not d!49692) (not d!49752) (not d!49690) (not d!49740) (not b!151611) (not d!49816) (not b!151678) (not b!151689) (not b!151722) (not d!49782) (not b!151635) (not b!151549) (not b!151657) (not d!49812) (not b!151594) (not b!151620) (not d!49698) (not b!151528) (not d!49634) (not b!151618) (not d!49712) (not bm!2097) (not d!49738) (not b!151571) (not bm!2087) (not bm!2093) (not b!151552) (not b!151682) (not b!151642) (not d!49798) (not d!49708) (not b!151651) (not b!151703) (not b!151754) (not b!151667) (not b!151695) (not bm!2095) (not d!49658) (not d!49820) (not b!151665) (not b!151547) (not b!151746) (not b!151716) (not d!49796) (not b!151634) (not d!49626) (not d!49696) (not d!49660) (not b!151740) (not b!151732) (not b!151625) (not d!49768) (not d!49766) (not b!151750) (not d!49672) (not b!151540) (not b!151734) (not b!151680) (not b!151663) (not b!151704) (not b!151683) (not b!151751) (not bm!2092) (not b!151544) (not b!151735) (not b!151691) (not d!49652) (not d!49640) (not d!49762) (not b!151749) (not d!49758) (not b!151645) (not b!151632) (not d!49790) (not b!151560) (not d!49804) (not b!151615) (not b!151591) (not d!49718) (not b!151563) (not b!151730) (not d!49630) (not b!151608) (not b!151742) (not b!151719) (not d!49814) (not b!151685) (not d!49678) (not b!151699) (not d!49648) (not d!49800) (not b!151541) (not b!151590) (not b!151631) (not b!151555) (not b!151614) (not b!151717) (not b!151609) (not d!49722) (not d!49632) (not b!151569) (not bm!2077) (not d!49776) (not b!151538) (not b!151679) (not bm!2078) (not bm!2094) (not d!49714) (not b!151733) (not b!151628) (not bm!2099) (not b!151537) (not b!151706) (not b!151543) (not b!151739) (not b!151629) (not b!151660) (not d!49680) (not bm!2089) (not b!151623) (not b!151714) (not d!49716) (not d!49674) (not b!151745) (not bm!2090) (not bm!2098) (not b!151653) (not b!151696) (not b!151606) (not bm!2079) (not b!151605) (not b!151626) (not b!151737) (not b!151710) (not d!49710) (not d!49638) (not b!151607) (not b!151701) (not b!151546) (not d!49684) (not b!151636) (not d!49666) (not b!151564) (not b!151641) (not bm!2096) (not d!49756))
(check-sat)
