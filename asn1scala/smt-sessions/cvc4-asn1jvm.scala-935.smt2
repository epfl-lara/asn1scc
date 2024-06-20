; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26388 () Bool)

(assert start!26388)

(declare-fun b!135606 () Bool)

(declare-fun e!90037 () Bool)

(declare-datatypes ((array!6188 0))(
  ( (array!6189 (arr!3467 (Array (_ BitVec 32) (_ BitVec 8))) (size!2802 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4868 0))(
  ( (BitStream!4869 (buf!3195 array!6188) (currentByte!5992 (_ BitVec 32)) (currentBit!5987 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4868)

(declare-fun array_inv!2591 (array!6188) Bool)

(assert (=> b!135606 (= e!90037 (array_inv!2591 (buf!3195 thiss!1634)))))

(declare-datatypes ((tuple2!11812 0))(
  ( (tuple2!11813 (_1!6222 BitStream!4868) (_2!6222 (_ BitVec 8))) )
))
(declare-fun lt!210528 () tuple2!11812)

(declare-fun e!90040 () Bool)

(declare-fun arr!237 () array!6188)

(declare-datatypes ((tuple2!11814 0))(
  ( (tuple2!11815 (_1!6223 BitStream!4868) (_2!6223 BitStream!4868)) )
))
(declare-fun lt!210533 () tuple2!11814)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun b!135607 () Bool)

(assert (=> b!135607 (= e!90040 (and (= (_2!6222 lt!210528) (select (arr!3467 arr!237) from!447)) (= (_1!6222 lt!210528) (_2!6223 lt!210533))))))

(declare-fun readBytePure!0 (BitStream!4868) tuple2!11812)

(assert (=> b!135607 (= lt!210528 (readBytePure!0 (_1!6223 lt!210533)))))

(declare-datatypes ((Unit!8442 0))(
  ( (Unit!8443) )
))
(declare-datatypes ((tuple2!11816 0))(
  ( (tuple2!11817 (_1!6224 Unit!8442) (_2!6224 BitStream!4868)) )
))
(declare-fun lt!210544 () tuple2!11816)

(declare-fun reader!0 (BitStream!4868 BitStream!4868) tuple2!11814)

(assert (=> b!135607 (= lt!210533 (reader!0 thiss!1634 (_2!6224 lt!210544)))))

(declare-fun b!135608 () Bool)

(declare-fun e!90041 () Bool)

(declare-fun e!90039 () Bool)

(assert (=> b!135608 (= e!90041 (not e!90039))))

(declare-fun res!112802 () Bool)

(assert (=> b!135608 (=> res!112802 e!90039)))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((tuple2!11818 0))(
  ( (tuple2!11819 (_1!6225 BitStream!4868) (_2!6225 array!6188)) )
))
(declare-fun lt!210534 () tuple2!11818)

(declare-fun lt!210530 () tuple2!11818)

(declare-fun arrayRangesEq!205 (array!6188 array!6188 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!135608 (= res!112802 (not (arrayRangesEq!205 (_2!6225 lt!210530) (_2!6225 lt!210534) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!210541 () tuple2!11818)

(assert (=> b!135608 (arrayRangesEq!205 (_2!6225 lt!210530) (_2!6225 lt!210541) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!210535 () tuple2!11814)

(declare-fun lt!210549 () Unit!8442)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4868 array!6188 (_ BitVec 32) (_ BitVec 32)) Unit!8442)

(assert (=> b!135608 (= lt!210549 (readByteArrayLoopArrayPrefixLemma!0 (_1!6223 lt!210535) arr!237 from!447 to!404))))

(declare-fun lt!210537 () array!6188)

(declare-fun readByteArrayLoopPure!0 (BitStream!4868 array!6188 (_ BitVec 32) (_ BitVec 32)) tuple2!11818)

(declare-fun withMovedByteIndex!0 (BitStream!4868 (_ BitVec 32)) BitStream!4868)

(assert (=> b!135608 (= lt!210541 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6223 lt!210535) #b00000000000000000000000000000001) lt!210537 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!210532 () tuple2!11814)

(assert (=> b!135608 (= lt!210534 (readByteArrayLoopPure!0 (_1!6223 lt!210532) lt!210537 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!210539 () tuple2!11812)

(assert (=> b!135608 (= lt!210537 (array!6189 (store (arr!3467 arr!237) from!447 (_2!6222 lt!210539)) (size!2802 arr!237)))))

(declare-fun lt!210536 () tuple2!11816)

(declare-fun lt!210531 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!135608 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2802 (buf!3195 (_2!6224 lt!210536)))) ((_ sign_extend 32) (currentByte!5992 (_2!6224 lt!210544))) ((_ sign_extend 32) (currentBit!5987 (_2!6224 lt!210544))) lt!210531)))

(declare-fun lt!210524 () Unit!8442)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4868 array!6188 (_ BitVec 32)) Unit!8442)

(assert (=> b!135608 (= lt!210524 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6224 lt!210544) (buf!3195 (_2!6224 lt!210536)) lt!210531))))

(assert (=> b!135608 (= (_1!6225 lt!210530) (_2!6223 lt!210535))))

(assert (=> b!135608 (= lt!210530 (readByteArrayLoopPure!0 (_1!6223 lt!210535) arr!237 from!447 to!404))))

(assert (=> b!135608 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2802 (buf!3195 (_2!6224 lt!210536)))) ((_ sign_extend 32) (currentByte!5992 thiss!1634)) ((_ sign_extend 32) (currentBit!5987 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!210527 () Unit!8442)

(assert (=> b!135608 (= lt!210527 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3195 (_2!6224 lt!210536)) (bvsub to!404 from!447)))))

(assert (=> b!135608 (= (_2!6222 lt!210539) (select (arr!3467 arr!237) from!447))))

(assert (=> b!135608 (= lt!210539 (readBytePure!0 (_1!6223 lt!210535)))))

(assert (=> b!135608 (= lt!210532 (reader!0 (_2!6224 lt!210544) (_2!6224 lt!210536)))))

(assert (=> b!135608 (= lt!210535 (reader!0 thiss!1634 (_2!6224 lt!210536)))))

(declare-fun e!90044 () Bool)

(assert (=> b!135608 e!90044))

(declare-fun res!112809 () Bool)

(assert (=> b!135608 (=> (not res!112809) (not e!90044))))

(declare-fun lt!210548 () tuple2!11812)

(declare-fun lt!210542 () tuple2!11812)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!135608 (= res!112809 (= (bitIndex!0 (size!2802 (buf!3195 (_1!6222 lt!210548))) (currentByte!5992 (_1!6222 lt!210548)) (currentBit!5987 (_1!6222 lt!210548))) (bitIndex!0 (size!2802 (buf!3195 (_1!6222 lt!210542))) (currentByte!5992 (_1!6222 lt!210542)) (currentBit!5987 (_1!6222 lt!210542)))))))

(declare-fun lt!210547 () Unit!8442)

(declare-fun lt!210546 () BitStream!4868)

(declare-fun readBytePrefixLemma!0 (BitStream!4868 BitStream!4868) Unit!8442)

(assert (=> b!135608 (= lt!210547 (readBytePrefixLemma!0 lt!210546 (_2!6224 lt!210536)))))

(assert (=> b!135608 (= lt!210542 (readBytePure!0 (BitStream!4869 (buf!3195 (_2!6224 lt!210536)) (currentByte!5992 thiss!1634) (currentBit!5987 thiss!1634))))))

(assert (=> b!135608 (= lt!210548 (readBytePure!0 lt!210546))))

(assert (=> b!135608 (= lt!210546 (BitStream!4869 (buf!3195 (_2!6224 lt!210544)) (currentByte!5992 thiss!1634) (currentBit!5987 thiss!1634)))))

(declare-fun e!90043 () Bool)

(assert (=> b!135608 e!90043))

(declare-fun res!112811 () Bool)

(assert (=> b!135608 (=> (not res!112811) (not e!90043))))

(declare-fun isPrefixOf!0 (BitStream!4868 BitStream!4868) Bool)

(assert (=> b!135608 (= res!112811 (isPrefixOf!0 thiss!1634 (_2!6224 lt!210536)))))

(declare-fun lt!210529 () Unit!8442)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4868 BitStream!4868 BitStream!4868) Unit!8442)

(assert (=> b!135608 (= lt!210529 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6224 lt!210544) (_2!6224 lt!210536)))))

(declare-fun e!90042 () Bool)

(assert (=> b!135608 e!90042))

(declare-fun res!112806 () Bool)

(assert (=> b!135608 (=> (not res!112806) (not e!90042))))

(assert (=> b!135608 (= res!112806 (= (size!2802 (buf!3195 (_2!6224 lt!210544))) (size!2802 (buf!3195 (_2!6224 lt!210536)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4868 array!6188 (_ BitVec 32) (_ BitVec 32)) tuple2!11816)

(assert (=> b!135608 (= lt!210536 (appendByteArrayLoop!0 (_2!6224 lt!210544) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!135608 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2802 (buf!3195 (_2!6224 lt!210544)))) ((_ sign_extend 32) (currentByte!5992 (_2!6224 lt!210544))) ((_ sign_extend 32) (currentBit!5987 (_2!6224 lt!210544))) lt!210531)))

(assert (=> b!135608 (= lt!210531 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!210540 () Unit!8442)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4868 BitStream!4868 (_ BitVec 64) (_ BitVec 32)) Unit!8442)

(assert (=> b!135608 (= lt!210540 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6224 lt!210544) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!135608 e!90040))

(declare-fun res!112805 () Bool)

(assert (=> b!135608 (=> (not res!112805) (not e!90040))))

(assert (=> b!135608 (= res!112805 (= (size!2802 (buf!3195 thiss!1634)) (size!2802 (buf!3195 (_2!6224 lt!210544)))))))

(declare-fun appendByte!0 (BitStream!4868 (_ BitVec 8)) tuple2!11816)

(assert (=> b!135608 (= lt!210544 (appendByte!0 thiss!1634 (select (arr!3467 arr!237) from!447)))))

(declare-fun b!135610 () Bool)

(declare-fun res!112810 () Bool)

(assert (=> b!135610 (=> (not res!112810) (not e!90041))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!135610 (= res!112810 (invariant!0 (currentBit!5987 thiss!1634) (currentByte!5992 thiss!1634) (size!2802 (buf!3195 thiss!1634))))))

(declare-fun b!135611 () Bool)

(assert (=> b!135611 (= e!90039 (bvsle #b00000000000000000000000000000000 to!404))))

(assert (=> b!135611 (arrayRangesEq!205 arr!237 (_2!6225 lt!210530) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!210538 () Unit!8442)

(declare-fun arrayRangesEqTransitive!7 (array!6188 array!6188 array!6188 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8442)

(assert (=> b!135611 (= lt!210538 (arrayRangesEqTransitive!7 arr!237 (_2!6225 lt!210534) (_2!6225 lt!210530) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> b!135611 (arrayRangesEq!205 (_2!6225 lt!210534) (_2!6225 lt!210530) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!210543 () Unit!8442)

(declare-fun arrayRangesEqSymmetricLemma!18 (array!6188 array!6188 (_ BitVec 32) (_ BitVec 32)) Unit!8442)

(assert (=> b!135611 (= lt!210543 (arrayRangesEqSymmetricLemma!18 (_2!6225 lt!210530) (_2!6225 lt!210534) #b00000000000000000000000000000000 to!404))))

(declare-fun b!135612 () Bool)

(declare-fun e!90038 () Bool)

(assert (=> b!135612 (= e!90042 e!90038)))

(declare-fun res!112804 () Bool)

(assert (=> b!135612 (=> (not res!112804) (not e!90038))))

(declare-fun lt!210550 () (_ BitVec 64))

(assert (=> b!135612 (= res!112804 (= (bitIndex!0 (size!2802 (buf!3195 (_2!6224 lt!210536))) (currentByte!5992 (_2!6224 lt!210536)) (currentBit!5987 (_2!6224 lt!210536))) (bvadd (bitIndex!0 (size!2802 (buf!3195 (_2!6224 lt!210544))) (currentByte!5992 (_2!6224 lt!210544)) (currentBit!5987 (_2!6224 lt!210544))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!210550))))))

(assert (=> b!135612 (= lt!210550 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!135613 () Bool)

(assert (=> b!135613 (= e!90043 (invariant!0 (currentBit!5987 thiss!1634) (currentByte!5992 thiss!1634) (size!2802 (buf!3195 (_2!6224 lt!210544)))))))

(declare-fun b!135614 () Bool)

(declare-fun res!112801 () Bool)

(assert (=> b!135614 (=> (not res!112801) (not e!90040))))

(assert (=> b!135614 (= res!112801 (= (bitIndex!0 (size!2802 (buf!3195 (_2!6224 lt!210544))) (currentByte!5992 (_2!6224 lt!210544)) (currentBit!5987 (_2!6224 lt!210544))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2802 (buf!3195 thiss!1634)) (currentByte!5992 thiss!1634) (currentBit!5987 thiss!1634)))))))

(declare-fun b!135615 () Bool)

(declare-fun res!112812 () Bool)

(assert (=> b!135615 (=> (not res!112812) (not e!90038))))

(assert (=> b!135615 (= res!112812 (isPrefixOf!0 (_2!6224 lt!210544) (_2!6224 lt!210536)))))

(declare-fun b!135616 () Bool)

(declare-fun res!112800 () Bool)

(assert (=> b!135616 (=> (not res!112800) (not e!90040))))

(assert (=> b!135616 (= res!112800 (isPrefixOf!0 thiss!1634 (_2!6224 lt!210544)))))

(declare-fun b!135609 () Bool)

(declare-fun res!112807 () Bool)

(assert (=> b!135609 (=> (not res!112807) (not e!90041))))

(assert (=> b!135609 (= res!112807 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2802 (buf!3195 thiss!1634))) ((_ sign_extend 32) (currentByte!5992 thiss!1634)) ((_ sign_extend 32) (currentBit!5987 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun res!112803 () Bool)

(assert (=> start!26388 (=> (not res!112803) (not e!90041))))

(assert (=> start!26388 (= res!112803 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2802 arr!237))))))

(assert (=> start!26388 e!90041))

(assert (=> start!26388 true))

(assert (=> start!26388 (array_inv!2591 arr!237)))

(declare-fun inv!12 (BitStream!4868) Bool)

(assert (=> start!26388 (and (inv!12 thiss!1634) e!90037)))

(declare-fun b!135617 () Bool)

(assert (=> b!135617 (= e!90044 (= (_2!6222 lt!210548) (_2!6222 lt!210542)))))

(declare-fun b!135618 () Bool)

(declare-fun res!112808 () Bool)

(assert (=> b!135618 (=> (not res!112808) (not e!90041))))

(assert (=> b!135618 (= res!112808 (bvslt from!447 to!404))))

(declare-fun e!90036 () Bool)

(declare-fun b!135619 () Bool)

(declare-fun lt!210526 () tuple2!11818)

(assert (=> b!135619 (= e!90036 (not (arrayRangesEq!205 arr!237 (_2!6225 lt!210526) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!135620 () Bool)

(assert (=> b!135620 (= e!90038 (not e!90036))))

(declare-fun res!112799 () Bool)

(assert (=> b!135620 (=> res!112799 e!90036)))

(declare-fun lt!210525 () tuple2!11814)

(assert (=> b!135620 (= res!112799 (or (not (= (size!2802 (_2!6225 lt!210526)) (size!2802 arr!237))) (not (= (_1!6225 lt!210526) (_2!6223 lt!210525)))))))

(assert (=> b!135620 (= lt!210526 (readByteArrayLoopPure!0 (_1!6223 lt!210525) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!135620 (validate_offset_bits!1 ((_ sign_extend 32) (size!2802 (buf!3195 (_2!6224 lt!210536)))) ((_ sign_extend 32) (currentByte!5992 (_2!6224 lt!210544))) ((_ sign_extend 32) (currentBit!5987 (_2!6224 lt!210544))) lt!210550)))

(declare-fun lt!210545 () Unit!8442)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4868 array!6188 (_ BitVec 64)) Unit!8442)

(assert (=> b!135620 (= lt!210545 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6224 lt!210544) (buf!3195 (_2!6224 lt!210536)) lt!210550))))

(assert (=> b!135620 (= lt!210525 (reader!0 (_2!6224 lt!210544) (_2!6224 lt!210536)))))

(assert (= (and start!26388 res!112803) b!135609))

(assert (= (and b!135609 res!112807) b!135618))

(assert (= (and b!135618 res!112808) b!135610))

(assert (= (and b!135610 res!112810) b!135608))

(assert (= (and b!135608 res!112805) b!135614))

(assert (= (and b!135614 res!112801) b!135616))

(assert (= (and b!135616 res!112800) b!135607))

(assert (= (and b!135608 res!112806) b!135612))

(assert (= (and b!135612 res!112804) b!135615))

(assert (= (and b!135615 res!112812) b!135620))

(assert (= (and b!135620 (not res!112799)) b!135619))

(assert (= (and b!135608 res!112811) b!135613))

(assert (= (and b!135608 res!112809) b!135617))

(assert (= (and b!135608 (not res!112802)) b!135611))

(assert (= start!26388 b!135606))

(declare-fun m!206971 () Bool)

(assert (=> b!135608 m!206971))

(declare-fun m!206973 () Bool)

(assert (=> b!135608 m!206973))

(declare-fun m!206975 () Bool)

(assert (=> b!135608 m!206975))

(declare-fun m!206977 () Bool)

(assert (=> b!135608 m!206977))

(declare-fun m!206979 () Bool)

(assert (=> b!135608 m!206979))

(declare-fun m!206981 () Bool)

(assert (=> b!135608 m!206981))

(declare-fun m!206983 () Bool)

(assert (=> b!135608 m!206983))

(declare-fun m!206985 () Bool)

(assert (=> b!135608 m!206985))

(declare-fun m!206987 () Bool)

(assert (=> b!135608 m!206987))

(declare-fun m!206989 () Bool)

(assert (=> b!135608 m!206989))

(declare-fun m!206991 () Bool)

(assert (=> b!135608 m!206991))

(declare-fun m!206993 () Bool)

(assert (=> b!135608 m!206993))

(declare-fun m!206995 () Bool)

(assert (=> b!135608 m!206995))

(declare-fun m!206997 () Bool)

(assert (=> b!135608 m!206997))

(declare-fun m!206999 () Bool)

(assert (=> b!135608 m!206999))

(declare-fun m!207001 () Bool)

(assert (=> b!135608 m!207001))

(declare-fun m!207003 () Bool)

(assert (=> b!135608 m!207003))

(declare-fun m!207005 () Bool)

(assert (=> b!135608 m!207005))

(declare-fun m!207007 () Bool)

(assert (=> b!135608 m!207007))

(declare-fun m!207009 () Bool)

(assert (=> b!135608 m!207009))

(declare-fun m!207011 () Bool)

(assert (=> b!135608 m!207011))

(assert (=> b!135608 m!206975))

(declare-fun m!207013 () Bool)

(assert (=> b!135608 m!207013))

(declare-fun m!207015 () Bool)

(assert (=> b!135608 m!207015))

(declare-fun m!207017 () Bool)

(assert (=> b!135608 m!207017))

(declare-fun m!207019 () Bool)

(assert (=> b!135608 m!207019))

(declare-fun m!207021 () Bool)

(assert (=> b!135608 m!207021))

(declare-fun m!207023 () Bool)

(assert (=> b!135608 m!207023))

(assert (=> b!135608 m!207017))

(declare-fun m!207025 () Bool)

(assert (=> b!135612 m!207025))

(declare-fun m!207027 () Bool)

(assert (=> b!135612 m!207027))

(declare-fun m!207029 () Bool)

(assert (=> b!135611 m!207029))

(declare-fun m!207031 () Bool)

(assert (=> b!135611 m!207031))

(declare-fun m!207033 () Bool)

(assert (=> b!135611 m!207033))

(declare-fun m!207035 () Bool)

(assert (=> b!135611 m!207035))

(declare-fun m!207037 () Bool)

(assert (=> b!135606 m!207037))

(assert (=> b!135607 m!207017))

(declare-fun m!207039 () Bool)

(assert (=> b!135607 m!207039))

(declare-fun m!207041 () Bool)

(assert (=> b!135607 m!207041))

(declare-fun m!207043 () Bool)

(assert (=> b!135615 m!207043))

(assert (=> b!135614 m!207027))

(declare-fun m!207045 () Bool)

(assert (=> b!135614 m!207045))

(declare-fun m!207047 () Bool)

(assert (=> b!135613 m!207047))

(declare-fun m!207049 () Bool)

(assert (=> b!135616 m!207049))

(declare-fun m!207051 () Bool)

(assert (=> start!26388 m!207051))

(declare-fun m!207053 () Bool)

(assert (=> start!26388 m!207053))

(declare-fun m!207055 () Bool)

(assert (=> b!135620 m!207055))

(declare-fun m!207057 () Bool)

(assert (=> b!135620 m!207057))

(declare-fun m!207059 () Bool)

(assert (=> b!135620 m!207059))

(assert (=> b!135620 m!206985))

(declare-fun m!207061 () Bool)

(assert (=> b!135609 m!207061))

(declare-fun m!207063 () Bool)

(assert (=> b!135619 m!207063))

(declare-fun m!207065 () Bool)

(assert (=> b!135610 m!207065))

(push 1)

(assert (not b!135611))

(assert (not b!135615))

(assert (not b!135613))

(assert (not start!26388))

(assert (not b!135607))

(assert (not b!135610))

(assert (not b!135620))

(assert (not b!135616))

(assert (not b!135608))

(assert (not b!135619))

(assert (not b!135612))

(assert (not b!135614))

(assert (not b!135606))

(assert (not b!135609))

(check-sat)

(pop 1)

(push 1)

(check-sat)

