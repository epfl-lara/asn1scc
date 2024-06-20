; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7938 () Bool)

(assert start!7938)

(declare-fun res!33723 () Bool)

(declare-fun e!26115 () Bool)

(assert (=> start!7938 (=> (not res!33723) (not e!26115))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-datatypes ((array!1989 0))(
  ( (array!1990 (arr!1393 (Array (_ BitVec 32) (_ BitVec 8))) (size!897 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1989)

(assert (=> start!7938 (= res!33723 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!897 srcBuffer!2))))))))

(assert (=> start!7938 e!26115))

(assert (=> start!7938 true))

(declare-fun array_inv!825 (array!1989) Bool)

(assert (=> start!7938 (array_inv!825 srcBuffer!2)))

(declare-datatypes ((BitStream!1544 0))(
  ( (BitStream!1545 (buf!1225 array!1989) (currentByte!2637 (_ BitVec 32)) (currentBit!2632 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1544)

(declare-fun e!26107 () Bool)

(declare-fun inv!12 (BitStream!1544) Bool)

(assert (=> start!7938 (and (inv!12 thiss!1379) e!26107)))

(declare-fun b!39606 () Bool)

(declare-fun e!26102 () Bool)

(declare-fun e!26114 () Bool)

(assert (=> b!39606 (= e!26102 e!26114)))

(declare-fun res!33718 () Bool)

(assert (=> b!39606 (=> res!33718 e!26114)))

(assert (=> b!39606 (= res!33718 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3826 0))(
  ( (tuple2!3827 (_1!2000 BitStream!1544) (_2!2000 BitStream!1544)) )
))
(declare-fun lt!60066 () tuple2!3826)

(declare-datatypes ((List!473 0))(
  ( (Nil!470) (Cons!469 (h!588 Bool) (t!1223 List!473)) )
))
(declare-fun lt!60052 () List!473)

(declare-datatypes ((Unit!2815 0))(
  ( (Unit!2816) )
))
(declare-datatypes ((tuple2!3828 0))(
  ( (tuple2!3829 (_1!2001 Unit!2815) (_2!2001 BitStream!1544)) )
))
(declare-fun lt!60062 () tuple2!3828)

(declare-fun lt!60049 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1544 BitStream!1544 (_ BitVec 64)) List!473)

(assert (=> b!39606 (= lt!60052 (bitStreamReadBitsIntoList!0 (_2!2001 lt!60062) (_1!2000 lt!60066) lt!60049))))

(declare-fun lt!60047 () List!473)

(declare-fun lt!60067 () tuple2!3826)

(assert (=> b!39606 (= lt!60047 (bitStreamReadBitsIntoList!0 (_2!2001 lt!60062) (_1!2000 lt!60067) (bvsub to!314 i!635)))))

(declare-fun lt!60060 () tuple2!3828)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!39606 (validate_offset_bits!1 ((_ sign_extend 32) (size!897 (buf!1225 (_2!2001 lt!60062)))) ((_ sign_extend 32) (currentByte!2637 (_2!2001 lt!60060))) ((_ sign_extend 32) (currentBit!2632 (_2!2001 lt!60060))) lt!60049)))

(declare-fun lt!60064 () Unit!2815)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1544 array!1989 (_ BitVec 64)) Unit!2815)

(assert (=> b!39606 (= lt!60064 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2001 lt!60060) (buf!1225 (_2!2001 lt!60062)) lt!60049))))

(declare-fun reader!0 (BitStream!1544 BitStream!1544) tuple2!3826)

(assert (=> b!39606 (= lt!60066 (reader!0 (_2!2001 lt!60060) (_2!2001 lt!60062)))))

(assert (=> b!39606 (validate_offset_bits!1 ((_ sign_extend 32) (size!897 (buf!1225 (_2!2001 lt!60062)))) ((_ sign_extend 32) (currentByte!2637 thiss!1379)) ((_ sign_extend 32) (currentBit!2632 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!60070 () Unit!2815)

(assert (=> b!39606 (= lt!60070 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1225 (_2!2001 lt!60062)) (bvsub to!314 i!635)))))

(assert (=> b!39606 (= lt!60067 (reader!0 thiss!1379 (_2!2001 lt!60062)))))

(declare-fun b!39607 () Bool)

(declare-fun e!26104 () Bool)

(declare-fun e!26101 () Bool)

(assert (=> b!39607 (= e!26104 e!26101)))

(declare-fun res!33706 () Bool)

(assert (=> b!39607 (=> res!33706 e!26101)))

(declare-fun lt!60065 () Bool)

(declare-fun lt!60063 () Bool)

(assert (=> b!39607 (= res!33706 (not (= lt!60065 lt!60063)))))

(declare-fun bitAt!0 (array!1989 (_ BitVec 64)) Bool)

(assert (=> b!39607 (= lt!60063 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun head!310 (List!473) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1544 array!1989 (_ BitVec 64) (_ BitVec 64)) List!473)

(assert (=> b!39607 (= lt!60065 (head!310 (byteArrayBitContentToList!0 (_2!2001 lt!60062) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(declare-fun b!39608 () Bool)

(declare-fun res!33707 () Bool)

(declare-fun e!26116 () Bool)

(assert (=> b!39608 (=> res!33707 e!26116)))

(declare-fun lt!60057 () Bool)

(assert (=> b!39608 (= res!33707 (not (= lt!60057 lt!60065)))))

(declare-fun b!39609 () Bool)

(declare-fun e!26108 () Bool)

(assert (=> b!39609 (= e!26115 (not e!26108))))

(declare-fun res!33722 () Bool)

(assert (=> b!39609 (=> res!33722 e!26108)))

(assert (=> b!39609 (= res!33722 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1544 BitStream!1544) Bool)

(assert (=> b!39609 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!60051 () Unit!2815)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1544) Unit!2815)

(assert (=> b!39609 (= lt!60051 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!60061 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!39609 (= lt!60061 (bitIndex!0 (size!897 (buf!1225 thiss!1379)) (currentByte!2637 thiss!1379) (currentBit!2632 thiss!1379)))))

(declare-fun b!39610 () Bool)

(assert (=> b!39610 (= e!26116 (validate_offset_bits!1 ((_ sign_extend 32) (size!897 (buf!1225 (_1!2000 lt!60067)))) ((_ sign_extend 32) (currentByte!2637 (_1!2000 lt!60067))) ((_ sign_extend 32) (currentBit!2632 (_1!2000 lt!60067))) (bvsub to!314 i!635)))))

(declare-fun b!39611 () Bool)

(declare-fun e!26105 () Bool)

(declare-fun e!26111 () Bool)

(assert (=> b!39611 (= e!26105 e!26111)))

(declare-fun res!33710 () Bool)

(assert (=> b!39611 (=> res!33710 e!26111)))

(declare-fun lt!60048 () (_ BitVec 64))

(assert (=> b!39611 (= res!33710 (not (= lt!60048 (bvsub (bvadd lt!60061 to!314) i!635))))))

(assert (=> b!39611 (= lt!60048 (bitIndex!0 (size!897 (buf!1225 (_2!2001 lt!60062))) (currentByte!2637 (_2!2001 lt!60062)) (currentBit!2632 (_2!2001 lt!60062))))))

(declare-fun b!39612 () Bool)

(declare-fun e!26109 () Bool)

(assert (=> b!39612 (= e!26108 e!26109)))

(declare-fun res!33711 () Bool)

(assert (=> b!39612 (=> res!33711 e!26109)))

(assert (=> b!39612 (= res!33711 (not (isPrefixOf!0 thiss!1379 (_2!2001 lt!60060))))))

(assert (=> b!39612 (validate_offset_bits!1 ((_ sign_extend 32) (size!897 (buf!1225 (_2!2001 lt!60060)))) ((_ sign_extend 32) (currentByte!2637 (_2!2001 lt!60060))) ((_ sign_extend 32) (currentBit!2632 (_2!2001 lt!60060))) lt!60049)))

(assert (=> b!39612 (= lt!60049 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!60068 () Unit!2815)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1544 BitStream!1544 (_ BitVec 64) (_ BitVec 64)) Unit!2815)

(assert (=> b!39612 (= lt!60068 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2001 lt!60060) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1544 (_ BitVec 8) (_ BitVec 32)) tuple2!3828)

(assert (=> b!39612 (= lt!60060 (appendBitFromByte!0 thiss!1379 (select (arr!1393 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!39613 () Bool)

(declare-fun res!33713 () Bool)

(assert (=> b!39613 (=> res!33713 e!26114)))

(declare-fun length!199 (List!473) Int)

(assert (=> b!39613 (= res!33713 (<= (length!199 lt!60047) 0))))

(declare-fun b!39614 () Bool)

(assert (=> b!39614 (= e!26111 e!26102)))

(declare-fun res!33705 () Bool)

(assert (=> b!39614 (=> res!33705 e!26102)))

(assert (=> b!39614 (= res!33705 (not (= (size!897 (buf!1225 (_2!2001 lt!60060))) (size!897 (buf!1225 (_2!2001 lt!60062))))))))

(declare-fun lt!60056 () (_ BitVec 64))

(assert (=> b!39614 (= lt!60048 (bvsub (bvsub (bvadd lt!60056 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!39614 (= lt!60056 (bitIndex!0 (size!897 (buf!1225 (_2!2001 lt!60060))) (currentByte!2637 (_2!2001 lt!60060)) (currentBit!2632 (_2!2001 lt!60060))))))

(assert (=> b!39614 (= (size!897 (buf!1225 (_2!2001 lt!60062))) (size!897 (buf!1225 thiss!1379)))))

(declare-fun b!39615 () Bool)

(declare-fun e!26110 () Bool)

(declare-fun e!26100 () Bool)

(assert (=> b!39615 (= e!26110 e!26100)))

(declare-fun res!33725 () Bool)

(assert (=> b!39615 (=> res!33725 e!26100)))

(declare-fun lt!60054 () Bool)

(assert (=> b!39615 (= res!33725 (not (= lt!60054 (bitAt!0 (buf!1225 (_1!2000 lt!60066)) lt!60061))))))

(assert (=> b!39615 (= lt!60054 (bitAt!0 (buf!1225 (_1!2000 lt!60067)) lt!60061))))

(declare-fun b!39616 () Bool)

(declare-fun res!33714 () Bool)

(assert (=> b!39616 (=> (not res!33714) (not e!26115))))

(assert (=> b!39616 (= res!33714 (validate_offset_bits!1 ((_ sign_extend 32) (size!897 (buf!1225 thiss!1379))) ((_ sign_extend 32) (currentByte!2637 thiss!1379)) ((_ sign_extend 32) (currentBit!2632 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!39617 () Bool)

(assert (=> b!39617 (= e!26100 e!26104)))

(declare-fun res!33709 () Bool)

(assert (=> b!39617 (=> res!33709 e!26104)))

(assert (=> b!39617 (= res!33709 (not (= lt!60057 lt!60054)))))

(assert (=> b!39617 (= lt!60057 (head!310 lt!60047))))

(declare-fun b!39618 () Bool)

(declare-fun e!26106 () Bool)

(assert (=> b!39618 (= e!26101 e!26106)))

(declare-fun res!33716 () Bool)

(assert (=> b!39618 (=> res!33716 e!26106)))

(declare-fun lt!60053 () Bool)

(assert (=> b!39618 (= res!33716 (not (= lt!60053 lt!60063)))))

(assert (=> b!39618 (= lt!60053 (bitAt!0 (buf!1225 (_2!2001 lt!60060)) lt!60061))))

(declare-fun b!39619 () Bool)

(declare-fun res!33720 () Bool)

(assert (=> b!39619 (=> res!33720 e!26111)))

(assert (=> b!39619 (= res!33720 (not (= (size!897 (buf!1225 thiss!1379)) (size!897 (buf!1225 (_2!2001 lt!60062))))))))

(declare-fun b!39620 () Bool)

(declare-fun res!33724 () Bool)

(assert (=> b!39620 (=> res!33724 e!26116)))

(declare-datatypes ((tuple2!3830 0))(
  ( (tuple2!3831 (_1!2002 BitStream!1544) (_2!2002 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!1544) tuple2!3830)

(assert (=> b!39620 (= res!33724 (not (= (_2!2002 (readBitPure!0 (_1!2000 lt!60067))) lt!60063)))))

(declare-fun b!39621 () Bool)

(declare-fun res!33715 () Bool)

(assert (=> b!39621 (=> res!33715 e!26102)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!39621 (= res!33715 (not (invariant!0 (currentBit!2632 (_2!2001 lt!60060)) (currentByte!2637 (_2!2001 lt!60060)) (size!897 (buf!1225 (_2!2001 lt!60062))))))))

(declare-fun b!39622 () Bool)

(assert (=> b!39622 (= e!26114 e!26110)))

(declare-fun res!33719 () Bool)

(assert (=> b!39622 (=> res!33719 e!26110)))

(declare-fun lt!60069 () List!473)

(assert (=> b!39622 (= res!33719 (not (= lt!60069 lt!60052)))))

(assert (=> b!39622 (= lt!60052 lt!60069)))

(declare-fun tail!190 (List!473) List!473)

(assert (=> b!39622 (= lt!60069 (tail!190 lt!60047))))

(declare-fun lt!60055 () Unit!2815)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1544 BitStream!1544 BitStream!1544 BitStream!1544 (_ BitVec 64) List!473) Unit!2815)

(assert (=> b!39622 (= lt!60055 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2001 lt!60062) (_2!2001 lt!60062) (_1!2000 lt!60067) (_1!2000 lt!60066) (bvsub to!314 i!635) lt!60047))))

(declare-fun b!39623 () Bool)

(assert (=> b!39623 (= e!26106 e!26116)))

(declare-fun res!33721 () Bool)

(assert (=> b!39623 (=> res!33721 e!26116)))

(declare-fun lt!60050 () Bool)

(assert (=> b!39623 (= res!33721 (not (= lt!60050 lt!60063)))))

(assert (=> b!39623 (= lt!60053 lt!60050)))

(assert (=> b!39623 (= lt!60050 (bitAt!0 (buf!1225 (_2!2001 lt!60062)) lt!60061))))

(declare-fun lt!60046 () Unit!2815)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1989 array!1989 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2815)

(assert (=> b!39623 (= lt!60046 (arrayBitRangesEqImpliesEq!0 (buf!1225 (_2!2001 lt!60060)) (buf!1225 (_2!2001 lt!60062)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!60061 lt!60056))))

(declare-fun b!39624 () Bool)

(declare-fun lt!60059 () tuple2!3826)

(declare-fun e!26103 () Bool)

(assert (=> b!39624 (= e!26103 (= (head!310 (byteArrayBitContentToList!0 (_2!2001 lt!60060) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!310 (bitStreamReadBitsIntoList!0 (_2!2001 lt!60060) (_1!2000 lt!60059) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!39625 () Bool)

(assert (=> b!39625 (= e!26107 (array_inv!825 (buf!1225 thiss!1379)))))

(declare-fun b!39626 () Bool)

(declare-fun res!33726 () Bool)

(assert (=> b!39626 (=> res!33726 e!26102)))

(assert (=> b!39626 (= res!33726 (not (invariant!0 (currentBit!2632 (_2!2001 lt!60060)) (currentByte!2637 (_2!2001 lt!60060)) (size!897 (buf!1225 (_2!2001 lt!60060))))))))

(declare-fun b!39627 () Bool)

(assert (=> b!39627 (= e!26109 e!26105)))

(declare-fun res!33712 () Bool)

(assert (=> b!39627 (=> res!33712 e!26105)))

(assert (=> b!39627 (= res!33712 (not (isPrefixOf!0 (_2!2001 lt!60060) (_2!2001 lt!60062))))))

(assert (=> b!39627 (isPrefixOf!0 thiss!1379 (_2!2001 lt!60062))))

(declare-fun lt!60045 () Unit!2815)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1544 BitStream!1544 BitStream!1544) Unit!2815)

(assert (=> b!39627 (= lt!60045 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2001 lt!60060) (_2!2001 lt!60062)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1544 array!1989 (_ BitVec 64) (_ BitVec 64)) tuple2!3828)

(assert (=> b!39627 (= lt!60062 (appendBitsMSBFirstLoop!0 (_2!2001 lt!60060) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!39627 e!26103))

(declare-fun res!33717 () Bool)

(assert (=> b!39627 (=> (not res!33717) (not e!26103))))

(assert (=> b!39627 (= res!33717 (validate_offset_bits!1 ((_ sign_extend 32) (size!897 (buf!1225 (_2!2001 lt!60060)))) ((_ sign_extend 32) (currentByte!2637 thiss!1379)) ((_ sign_extend 32) (currentBit!2632 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!60058 () Unit!2815)

(assert (=> b!39627 (= lt!60058 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1225 (_2!2001 lt!60060)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!39627 (= lt!60059 (reader!0 thiss!1379 (_2!2001 lt!60060)))))

(declare-fun b!39628 () Bool)

(declare-fun res!33708 () Bool)

(assert (=> b!39628 (=> res!33708 e!26111)))

(assert (=> b!39628 (= res!33708 (not (invariant!0 (currentBit!2632 (_2!2001 lt!60062)) (currentByte!2637 (_2!2001 lt!60062)) (size!897 (buf!1225 (_2!2001 lt!60062))))))))

(assert (= (and start!7938 res!33723) b!39616))

(assert (= (and b!39616 res!33714) b!39609))

(assert (= (and b!39609 (not res!33722)) b!39612))

(assert (= (and b!39612 (not res!33711)) b!39627))

(assert (= (and b!39627 res!33717) b!39624))

(assert (= (and b!39627 (not res!33712)) b!39611))

(assert (= (and b!39611 (not res!33710)) b!39628))

(assert (= (and b!39628 (not res!33708)) b!39619))

(assert (= (and b!39619 (not res!33720)) b!39614))

(assert (= (and b!39614 (not res!33705)) b!39626))

(assert (= (and b!39626 (not res!33726)) b!39621))

(assert (= (and b!39621 (not res!33715)) b!39606))

(assert (= (and b!39606 (not res!33718)) b!39613))

(assert (= (and b!39613 (not res!33713)) b!39622))

(assert (= (and b!39622 (not res!33719)) b!39615))

(assert (= (and b!39615 (not res!33725)) b!39617))

(assert (= (and b!39617 (not res!33709)) b!39607))

(assert (= (and b!39607 (not res!33706)) b!39618))

(assert (= (and b!39618 (not res!33716)) b!39623))

(assert (= (and b!39623 (not res!33721)) b!39620))

(assert (= (and b!39620 (not res!33724)) b!39608))

(assert (= (and b!39608 (not res!33707)) b!39610))

(assert (= start!7938 b!39625))

(declare-fun m!60365 () Bool)

(assert (=> b!39613 m!60365))

(declare-fun m!60367 () Bool)

(assert (=> b!39612 m!60367))

(declare-fun m!60369 () Bool)

(assert (=> b!39612 m!60369))

(declare-fun m!60371 () Bool)

(assert (=> b!39612 m!60371))

(assert (=> b!39612 m!60367))

(declare-fun m!60373 () Bool)

(assert (=> b!39612 m!60373))

(declare-fun m!60375 () Bool)

(assert (=> b!39612 m!60375))

(declare-fun m!60377 () Bool)

(assert (=> b!39620 m!60377))

(declare-fun m!60379 () Bool)

(assert (=> b!39617 m!60379))

(declare-fun m!60381 () Bool)

(assert (=> b!39610 m!60381))

(declare-fun m!60383 () Bool)

(assert (=> b!39626 m!60383))

(declare-fun m!60385 () Bool)

(assert (=> b!39622 m!60385))

(declare-fun m!60387 () Bool)

(assert (=> b!39622 m!60387))

(declare-fun m!60389 () Bool)

(assert (=> b!39627 m!60389))

(declare-fun m!60391 () Bool)

(assert (=> b!39627 m!60391))

(declare-fun m!60393 () Bool)

(assert (=> b!39627 m!60393))

(declare-fun m!60395 () Bool)

(assert (=> b!39627 m!60395))

(declare-fun m!60397 () Bool)

(assert (=> b!39627 m!60397))

(declare-fun m!60399 () Bool)

(assert (=> b!39627 m!60399))

(declare-fun m!60401 () Bool)

(assert (=> b!39627 m!60401))

(declare-fun m!60403 () Bool)

(assert (=> b!39624 m!60403))

(assert (=> b!39624 m!60403))

(declare-fun m!60405 () Bool)

(assert (=> b!39624 m!60405))

(declare-fun m!60407 () Bool)

(assert (=> b!39624 m!60407))

(assert (=> b!39624 m!60407))

(declare-fun m!60409 () Bool)

(assert (=> b!39624 m!60409))

(declare-fun m!60411 () Bool)

(assert (=> b!39621 m!60411))

(declare-fun m!60413 () Bool)

(assert (=> b!39623 m!60413))

(declare-fun m!60415 () Bool)

(assert (=> b!39623 m!60415))

(declare-fun m!60417 () Bool)

(assert (=> b!39607 m!60417))

(declare-fun m!60419 () Bool)

(assert (=> b!39607 m!60419))

(assert (=> b!39607 m!60419))

(declare-fun m!60421 () Bool)

(assert (=> b!39607 m!60421))

(declare-fun m!60423 () Bool)

(assert (=> b!39614 m!60423))

(declare-fun m!60425 () Bool)

(assert (=> b!39611 m!60425))

(declare-fun m!60427 () Bool)

(assert (=> b!39628 m!60427))

(declare-fun m!60429 () Bool)

(assert (=> b!39615 m!60429))

(declare-fun m!60431 () Bool)

(assert (=> b!39615 m!60431))

(declare-fun m!60433 () Bool)

(assert (=> start!7938 m!60433))

(declare-fun m!60435 () Bool)

(assert (=> start!7938 m!60435))

(declare-fun m!60437 () Bool)

(assert (=> b!39606 m!60437))

(declare-fun m!60439 () Bool)

(assert (=> b!39606 m!60439))

(declare-fun m!60441 () Bool)

(assert (=> b!39606 m!60441))

(declare-fun m!60443 () Bool)

(assert (=> b!39606 m!60443))

(declare-fun m!60445 () Bool)

(assert (=> b!39606 m!60445))

(declare-fun m!60447 () Bool)

(assert (=> b!39606 m!60447))

(declare-fun m!60449 () Bool)

(assert (=> b!39606 m!60449))

(declare-fun m!60451 () Bool)

(assert (=> b!39606 m!60451))

(declare-fun m!60453 () Bool)

(assert (=> b!39618 m!60453))

(declare-fun m!60455 () Bool)

(assert (=> b!39616 m!60455))

(declare-fun m!60457 () Bool)

(assert (=> b!39625 m!60457))

(declare-fun m!60459 () Bool)

(assert (=> b!39609 m!60459))

(declare-fun m!60461 () Bool)

(assert (=> b!39609 m!60461))

(declare-fun m!60463 () Bool)

(assert (=> b!39609 m!60463))

(push 1)

(assert (not b!39618))

(assert (not b!39621))

(assert (not b!39623))

(assert (not b!39611))

(assert (not b!39614))

(assert (not b!39626))

(assert (not b!39609))

(assert (not b!39606))

(assert (not b!39617))

(assert (not start!7938))

(assert (not b!39625))

(assert (not b!39620))

(assert (not b!39627))

(assert (not b!39622))

(assert (not b!39610))

(assert (not b!39616))

(assert (not b!39615))

(assert (not b!39628))

(assert (not b!39613))

(assert (not b!39624))

(assert (not b!39612))

(assert (not b!39607))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!11710 () Bool)

(assert (=> d!11710 (= (invariant!0 (currentBit!2632 (_2!2001 lt!60062)) (currentByte!2637 (_2!2001 lt!60062)) (size!897 (buf!1225 (_2!2001 lt!60062)))) (and (bvsge (currentBit!2632 (_2!2001 lt!60062)) #b00000000000000000000000000000000) (bvslt (currentBit!2632 (_2!2001 lt!60062)) #b00000000000000000000000000001000) (bvsge (currentByte!2637 (_2!2001 lt!60062)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2637 (_2!2001 lt!60062)) (size!897 (buf!1225 (_2!2001 lt!60062)))) (and (= (currentBit!2632 (_2!2001 lt!60062)) #b00000000000000000000000000000000) (= (currentByte!2637 (_2!2001 lt!60062)) (size!897 (buf!1225 (_2!2001 lt!60062))))))))))

(assert (=> b!39628 d!11710))

(declare-fun d!11712 () Bool)

(assert (=> d!11712 (= (head!310 lt!60047) (h!588 lt!60047))))

(assert (=> b!39617 d!11712))

(declare-fun d!11714 () Bool)

(assert (=> d!11714 (validate_offset_bits!1 ((_ sign_extend 32) (size!897 (buf!1225 (_2!2001 lt!60062)))) ((_ sign_extend 32) (currentByte!2637 (_2!2001 lt!60060))) ((_ sign_extend 32) (currentBit!2632 (_2!2001 lt!60060))) lt!60049)))

(declare-fun lt!60226 () Unit!2815)

(declare-fun choose!9 (BitStream!1544 array!1989 (_ BitVec 64) BitStream!1544) Unit!2815)

(assert (=> d!11714 (= lt!60226 (choose!9 (_2!2001 lt!60060) (buf!1225 (_2!2001 lt!60062)) lt!60049 (BitStream!1545 (buf!1225 (_2!2001 lt!60062)) (currentByte!2637 (_2!2001 lt!60060)) (currentBit!2632 (_2!2001 lt!60060)))))))

(assert (=> d!11714 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2001 lt!60060) (buf!1225 (_2!2001 lt!60062)) lt!60049) lt!60226)))

(declare-fun bs!3114 () Bool)

(assert (= bs!3114 d!11714))

(assert (=> bs!3114 m!60445))

(declare-fun m!60589 () Bool)

(assert (=> bs!3114 m!60589))

(assert (=> b!39606 d!11714))

(declare-fun d!11716 () Bool)

(declare-fun e!26170 () Bool)

(assert (=> d!11716 e!26170))

(declare-fun c!2708 () Bool)

(assert (=> d!11716 (= c!2708 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!60235 () List!473)

(declare-datatypes ((tuple2!3838 0))(
  ( (tuple2!3839 (_1!2006 List!473) (_2!2006 BitStream!1544)) )
))
(declare-fun e!26171 () tuple2!3838)

(assert (=> d!11716 (= lt!60235 (_1!2006 e!26171))))

(declare-fun c!2709 () Bool)

(assert (=> d!11716 (= c!2709 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!11716 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!11716 (= (bitStreamReadBitsIntoList!0 (_2!2001 lt!60062) (_1!2000 lt!60067) (bvsub to!314 i!635)) lt!60235)))

(declare-datatypes ((tuple2!3840 0))(
  ( (tuple2!3841 (_1!2007 Bool) (_2!2007 BitStream!1544)) )
))
(declare-fun lt!60233 () tuple2!3840)

(declare-fun lt!60234 () (_ BitVec 64))

(declare-fun b!39727 () Bool)

(assert (=> b!39727 (= e!26171 (tuple2!3839 (Cons!469 (_1!2007 lt!60233) (bitStreamReadBitsIntoList!0 (_2!2001 lt!60062) (_2!2007 lt!60233) (bvsub (bvsub to!314 i!635) lt!60234))) (_2!2007 lt!60233)))))

(declare-fun readBit!0 (BitStream!1544) tuple2!3840)

(assert (=> b!39727 (= lt!60233 (readBit!0 (_1!2000 lt!60067)))))

(assert (=> b!39727 (= lt!60234 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!39726 () Bool)

(assert (=> b!39726 (= e!26171 (tuple2!3839 Nil!470 (_1!2000 lt!60067)))))

(declare-fun b!39729 () Bool)

(assert (=> b!39729 (= e!26170 (> (length!199 lt!60235) 0))))

(declare-fun b!39728 () Bool)

(declare-fun isEmpty!112 (List!473) Bool)

(assert (=> b!39728 (= e!26170 (isEmpty!112 lt!60235))))

(assert (= (and d!11716 c!2709) b!39726))

(assert (= (and d!11716 (not c!2709)) b!39727))

(assert (= (and d!11716 c!2708) b!39728))

(assert (= (and d!11716 (not c!2708)) b!39729))

(declare-fun m!60591 () Bool)

(assert (=> b!39727 m!60591))

(declare-fun m!60593 () Bool)

(assert (=> b!39727 m!60593))

(declare-fun m!60595 () Bool)

(assert (=> b!39729 m!60595))

(declare-fun m!60597 () Bool)

(assert (=> b!39728 m!60597))

(assert (=> b!39606 d!11716))

(declare-fun d!11718 () Bool)

(declare-fun e!26172 () Bool)

(assert (=> d!11718 e!26172))

(declare-fun c!2710 () Bool)

(assert (=> d!11718 (= c!2710 (= lt!60049 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!60238 () List!473)

(declare-fun e!26173 () tuple2!3838)

(assert (=> d!11718 (= lt!60238 (_1!2006 e!26173))))

(declare-fun c!2711 () Bool)

(assert (=> d!11718 (= c!2711 (= lt!60049 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!11718 (bvsge lt!60049 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!11718 (= (bitStreamReadBitsIntoList!0 (_2!2001 lt!60062) (_1!2000 lt!60066) lt!60049) lt!60238)))

(declare-fun b!39731 () Bool)

(declare-fun lt!60237 () (_ BitVec 64))

(declare-fun lt!60236 () tuple2!3840)

(assert (=> b!39731 (= e!26173 (tuple2!3839 (Cons!469 (_1!2007 lt!60236) (bitStreamReadBitsIntoList!0 (_2!2001 lt!60062) (_2!2007 lt!60236) (bvsub lt!60049 lt!60237))) (_2!2007 lt!60236)))))

(assert (=> b!39731 (= lt!60236 (readBit!0 (_1!2000 lt!60066)))))

(assert (=> b!39731 (= lt!60237 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!39730 () Bool)

(assert (=> b!39730 (= e!26173 (tuple2!3839 Nil!470 (_1!2000 lt!60066)))))

(declare-fun b!39733 () Bool)

(assert (=> b!39733 (= e!26172 (> (length!199 lt!60238) 0))))

(declare-fun b!39732 () Bool)

(assert (=> b!39732 (= e!26172 (isEmpty!112 lt!60238))))

(assert (= (and d!11718 c!2711) b!39730))

(assert (= (and d!11718 (not c!2711)) b!39731))

(assert (= (and d!11718 c!2710) b!39732))

(assert (= (and d!11718 (not c!2710)) b!39733))

(declare-fun m!60599 () Bool)

(assert (=> b!39731 m!60599))

(declare-fun m!60601 () Bool)

(assert (=> b!39731 m!60601))

(declare-fun m!60603 () Bool)

(assert (=> b!39733 m!60603))

(declare-fun m!60605 () Bool)

(assert (=> b!39732 m!60605))

(assert (=> b!39606 d!11718))

(declare-fun d!11720 () Bool)

(declare-fun e!26199 () Bool)

(assert (=> d!11720 e!26199))

(declare-fun res!33818 () Bool)

(assert (=> d!11720 (=> (not res!33818) (not e!26199))))

(declare-fun lt!60358 () tuple2!3826)

(assert (=> d!11720 (= res!33818 (isPrefixOf!0 (_1!2000 lt!60358) (_2!2000 lt!60358)))))

(declare-fun lt!60345 () BitStream!1544)

(assert (=> d!11720 (= lt!60358 (tuple2!3827 lt!60345 (_2!2001 lt!60062)))))

(declare-fun lt!60346 () Unit!2815)

(declare-fun lt!60348 () Unit!2815)

(assert (=> d!11720 (= lt!60346 lt!60348)))

(assert (=> d!11720 (isPrefixOf!0 lt!60345 (_2!2001 lt!60062))))

(assert (=> d!11720 (= lt!60348 (lemmaIsPrefixTransitive!0 lt!60345 (_2!2001 lt!60062) (_2!2001 lt!60062)))))

(declare-fun lt!60357 () Unit!2815)

(declare-fun lt!60349 () Unit!2815)

(assert (=> d!11720 (= lt!60357 lt!60349)))

(assert (=> d!11720 (isPrefixOf!0 lt!60345 (_2!2001 lt!60062))))

(assert (=> d!11720 (= lt!60349 (lemmaIsPrefixTransitive!0 lt!60345 (_2!2001 lt!60060) (_2!2001 lt!60062)))))

(declare-fun lt!60361 () Unit!2815)

(declare-fun e!26198 () Unit!2815)

(assert (=> d!11720 (= lt!60361 e!26198)))

(declare-fun c!2718 () Bool)

(assert (=> d!11720 (= c!2718 (not (= (size!897 (buf!1225 (_2!2001 lt!60060))) #b00000000000000000000000000000000)))))

(declare-fun lt!60347 () Unit!2815)

(declare-fun lt!60359 () Unit!2815)

(assert (=> d!11720 (= lt!60347 lt!60359)))

(assert (=> d!11720 (isPrefixOf!0 (_2!2001 lt!60062) (_2!2001 lt!60062))))

(assert (=> d!11720 (= lt!60359 (lemmaIsPrefixRefl!0 (_2!2001 lt!60062)))))

(declare-fun lt!60364 () Unit!2815)

(declare-fun lt!60356 () Unit!2815)

(assert (=> d!11720 (= lt!60364 lt!60356)))

(assert (=> d!11720 (= lt!60356 (lemmaIsPrefixRefl!0 (_2!2001 lt!60062)))))

(declare-fun lt!60353 () Unit!2815)

(declare-fun lt!60354 () Unit!2815)

(assert (=> d!11720 (= lt!60353 lt!60354)))

(assert (=> d!11720 (isPrefixOf!0 lt!60345 lt!60345)))

(assert (=> d!11720 (= lt!60354 (lemmaIsPrefixRefl!0 lt!60345))))

(declare-fun lt!60350 () Unit!2815)

(declare-fun lt!60362 () Unit!2815)

(assert (=> d!11720 (= lt!60350 lt!60362)))

(assert (=> d!11720 (isPrefixOf!0 (_2!2001 lt!60060) (_2!2001 lt!60060))))

(assert (=> d!11720 (= lt!60362 (lemmaIsPrefixRefl!0 (_2!2001 lt!60060)))))

(assert (=> d!11720 (= lt!60345 (BitStream!1545 (buf!1225 (_2!2001 lt!60062)) (currentByte!2637 (_2!2001 lt!60060)) (currentBit!2632 (_2!2001 lt!60060))))))

(assert (=> d!11720 (isPrefixOf!0 (_2!2001 lt!60060) (_2!2001 lt!60062))))

(assert (=> d!11720 (= (reader!0 (_2!2001 lt!60060) (_2!2001 lt!60062)) lt!60358)))

(declare-fun b!39785 () Bool)

(declare-fun res!33820 () Bool)

(assert (=> b!39785 (=> (not res!33820) (not e!26199))))

(assert (=> b!39785 (= res!33820 (isPrefixOf!0 (_2!2000 lt!60358) (_2!2001 lt!60062)))))

(declare-fun b!39786 () Bool)

(declare-fun res!33819 () Bool)

(assert (=> b!39786 (=> (not res!33819) (not e!26199))))

(assert (=> b!39786 (= res!33819 (isPrefixOf!0 (_1!2000 lt!60358) (_2!2001 lt!60060)))))

(declare-fun b!39787 () Bool)

(declare-fun lt!60355 () Unit!2815)

(assert (=> b!39787 (= e!26198 lt!60355)))

(declare-fun lt!60363 () (_ BitVec 64))

(assert (=> b!39787 (= lt!60363 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60352 () (_ BitVec 64))

(assert (=> b!39787 (= lt!60352 (bitIndex!0 (size!897 (buf!1225 (_2!2001 lt!60060))) (currentByte!2637 (_2!2001 lt!60060)) (currentBit!2632 (_2!2001 lt!60060))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1989 array!1989 (_ BitVec 64) (_ BitVec 64)) Unit!2815)

(assert (=> b!39787 (= lt!60355 (arrayBitRangesEqSymmetric!0 (buf!1225 (_2!2001 lt!60060)) (buf!1225 (_2!2001 lt!60062)) lt!60363 lt!60352))))

(declare-fun arrayBitRangesEq!0 (array!1989 array!1989 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!39787 (arrayBitRangesEq!0 (buf!1225 (_2!2001 lt!60062)) (buf!1225 (_2!2001 lt!60060)) lt!60363 lt!60352)))

(declare-fun lt!60360 () (_ BitVec 64))

(declare-fun lt!60351 () (_ BitVec 64))

(declare-fun b!39788 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!1544 (_ BitVec 64)) BitStream!1544)

(assert (=> b!39788 (= e!26199 (= (_1!2000 lt!60358) (withMovedBitIndex!0 (_2!2000 lt!60358) (bvsub lt!60351 lt!60360))))))

(assert (=> b!39788 (or (= (bvand lt!60351 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!60360 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!60351 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!60351 lt!60360) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!39788 (= lt!60360 (bitIndex!0 (size!897 (buf!1225 (_2!2001 lt!60062))) (currentByte!2637 (_2!2001 lt!60062)) (currentBit!2632 (_2!2001 lt!60062))))))

(assert (=> b!39788 (= lt!60351 (bitIndex!0 (size!897 (buf!1225 (_2!2001 lt!60060))) (currentByte!2637 (_2!2001 lt!60060)) (currentBit!2632 (_2!2001 lt!60060))))))

(declare-fun b!39789 () Bool)

(declare-fun Unit!2820 () Unit!2815)

(assert (=> b!39789 (= e!26198 Unit!2820)))

(assert (= (and d!11720 c!2718) b!39787))

(assert (= (and d!11720 (not c!2718)) b!39789))

(assert (= (and d!11720 res!33818) b!39786))

(assert (= (and b!39786 res!33819) b!39785))

(assert (= (and b!39785 res!33820) b!39788))

(declare-fun m!60671 () Bool)

(assert (=> b!39786 m!60671))

(declare-fun m!60673 () Bool)

(assert (=> d!11720 m!60673))

(declare-fun m!60675 () Bool)

(assert (=> d!11720 m!60675))

(declare-fun m!60677 () Bool)

(assert (=> d!11720 m!60677))

(declare-fun m!60679 () Bool)

(assert (=> d!11720 m!60679))

(declare-fun m!60681 () Bool)

(assert (=> d!11720 m!60681))

(assert (=> d!11720 m!60393))

(declare-fun m!60683 () Bool)

(assert (=> d!11720 m!60683))

(declare-fun m!60685 () Bool)

(assert (=> d!11720 m!60685))

(declare-fun m!60687 () Bool)

(assert (=> d!11720 m!60687))

(declare-fun m!60689 () Bool)

(assert (=> d!11720 m!60689))

(declare-fun m!60691 () Bool)

(assert (=> d!11720 m!60691))

(declare-fun m!60693 () Bool)

(assert (=> b!39788 m!60693))

(assert (=> b!39788 m!60425))

(assert (=> b!39788 m!60423))

(assert (=> b!39787 m!60423))

(declare-fun m!60695 () Bool)

(assert (=> b!39787 m!60695))

(declare-fun m!60697 () Bool)

(assert (=> b!39787 m!60697))

(declare-fun m!60699 () Bool)

(assert (=> b!39785 m!60699))

(assert (=> b!39606 d!11720))

(declare-fun d!11742 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!11742 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!897 (buf!1225 (_2!2001 lt!60062)))) ((_ sign_extend 32) (currentByte!2637 thiss!1379)) ((_ sign_extend 32) (currentBit!2632 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!897 (buf!1225 (_2!2001 lt!60062)))) ((_ sign_extend 32) (currentByte!2637 thiss!1379)) ((_ sign_extend 32) (currentBit!2632 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3117 () Bool)

(assert (= bs!3117 d!11742))

(declare-fun m!60701 () Bool)

(assert (=> bs!3117 m!60701))

(assert (=> b!39606 d!11742))

(declare-fun d!11744 () Bool)

(assert (=> d!11744 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!897 (buf!1225 (_2!2001 lt!60062)))) ((_ sign_extend 32) (currentByte!2637 (_2!2001 lt!60060))) ((_ sign_extend 32) (currentBit!2632 (_2!2001 lt!60060))) lt!60049) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!897 (buf!1225 (_2!2001 lt!60062)))) ((_ sign_extend 32) (currentByte!2637 (_2!2001 lt!60060))) ((_ sign_extend 32) (currentBit!2632 (_2!2001 lt!60060)))) lt!60049))))

(declare-fun bs!3118 () Bool)

(assert (= bs!3118 d!11744))

(declare-fun m!60703 () Bool)

(assert (=> bs!3118 m!60703))

(assert (=> b!39606 d!11744))

(declare-fun d!11746 () Bool)

(assert (=> d!11746 (validate_offset_bits!1 ((_ sign_extend 32) (size!897 (buf!1225 (_2!2001 lt!60062)))) ((_ sign_extend 32) (currentByte!2637 thiss!1379)) ((_ sign_extend 32) (currentBit!2632 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!60365 () Unit!2815)

(assert (=> d!11746 (= lt!60365 (choose!9 thiss!1379 (buf!1225 (_2!2001 lt!60062)) (bvsub to!314 i!635) (BitStream!1545 (buf!1225 (_2!2001 lt!60062)) (currentByte!2637 thiss!1379) (currentBit!2632 thiss!1379))))))

(assert (=> d!11746 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1225 (_2!2001 lt!60062)) (bvsub to!314 i!635)) lt!60365)))

(declare-fun bs!3119 () Bool)

(assert (= bs!3119 d!11746))

(assert (=> bs!3119 m!60447))

(declare-fun m!60705 () Bool)

(assert (=> bs!3119 m!60705))

(assert (=> b!39606 d!11746))

(declare-fun d!11748 () Bool)

(declare-fun e!26201 () Bool)

(assert (=> d!11748 e!26201))

(declare-fun res!33821 () Bool)

(assert (=> d!11748 (=> (not res!33821) (not e!26201))))

(declare-fun lt!60379 () tuple2!3826)

(assert (=> d!11748 (= res!33821 (isPrefixOf!0 (_1!2000 lt!60379) (_2!2000 lt!60379)))))

(declare-fun lt!60366 () BitStream!1544)

(assert (=> d!11748 (= lt!60379 (tuple2!3827 lt!60366 (_2!2001 lt!60062)))))

(declare-fun lt!60367 () Unit!2815)

(declare-fun lt!60369 () Unit!2815)

(assert (=> d!11748 (= lt!60367 lt!60369)))

(assert (=> d!11748 (isPrefixOf!0 lt!60366 (_2!2001 lt!60062))))

(assert (=> d!11748 (= lt!60369 (lemmaIsPrefixTransitive!0 lt!60366 (_2!2001 lt!60062) (_2!2001 lt!60062)))))

(declare-fun lt!60378 () Unit!2815)

(declare-fun lt!60370 () Unit!2815)

(assert (=> d!11748 (= lt!60378 lt!60370)))

(assert (=> d!11748 (isPrefixOf!0 lt!60366 (_2!2001 lt!60062))))

(assert (=> d!11748 (= lt!60370 (lemmaIsPrefixTransitive!0 lt!60366 thiss!1379 (_2!2001 lt!60062)))))

(declare-fun lt!60382 () Unit!2815)

(declare-fun e!26200 () Unit!2815)

(assert (=> d!11748 (= lt!60382 e!26200)))

(declare-fun c!2719 () Bool)

(assert (=> d!11748 (= c!2719 (not (= (size!897 (buf!1225 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!60368 () Unit!2815)

(declare-fun lt!60380 () Unit!2815)

(assert (=> d!11748 (= lt!60368 lt!60380)))

(assert (=> d!11748 (isPrefixOf!0 (_2!2001 lt!60062) (_2!2001 lt!60062))))

(assert (=> d!11748 (= lt!60380 (lemmaIsPrefixRefl!0 (_2!2001 lt!60062)))))

(declare-fun lt!60385 () Unit!2815)

(declare-fun lt!60377 () Unit!2815)

(assert (=> d!11748 (= lt!60385 lt!60377)))

(assert (=> d!11748 (= lt!60377 (lemmaIsPrefixRefl!0 (_2!2001 lt!60062)))))

(declare-fun lt!60374 () Unit!2815)

(declare-fun lt!60375 () Unit!2815)

(assert (=> d!11748 (= lt!60374 lt!60375)))

(assert (=> d!11748 (isPrefixOf!0 lt!60366 lt!60366)))

(assert (=> d!11748 (= lt!60375 (lemmaIsPrefixRefl!0 lt!60366))))

(declare-fun lt!60371 () Unit!2815)

(declare-fun lt!60383 () Unit!2815)

(assert (=> d!11748 (= lt!60371 lt!60383)))

(assert (=> d!11748 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!11748 (= lt!60383 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!11748 (= lt!60366 (BitStream!1545 (buf!1225 (_2!2001 lt!60062)) (currentByte!2637 thiss!1379) (currentBit!2632 thiss!1379)))))

(assert (=> d!11748 (isPrefixOf!0 thiss!1379 (_2!2001 lt!60062))))

(assert (=> d!11748 (= (reader!0 thiss!1379 (_2!2001 lt!60062)) lt!60379)))

(declare-fun b!39790 () Bool)

(declare-fun res!33823 () Bool)

(assert (=> b!39790 (=> (not res!33823) (not e!26201))))

(assert (=> b!39790 (= res!33823 (isPrefixOf!0 (_2!2000 lt!60379) (_2!2001 lt!60062)))))

(declare-fun b!39791 () Bool)

(declare-fun res!33822 () Bool)

(assert (=> b!39791 (=> (not res!33822) (not e!26201))))

(assert (=> b!39791 (= res!33822 (isPrefixOf!0 (_1!2000 lt!60379) thiss!1379))))

(declare-fun b!39792 () Bool)

(declare-fun lt!60376 () Unit!2815)

(assert (=> b!39792 (= e!26200 lt!60376)))

(declare-fun lt!60384 () (_ BitVec 64))

(assert (=> b!39792 (= lt!60384 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60373 () (_ BitVec 64))

(assert (=> b!39792 (= lt!60373 (bitIndex!0 (size!897 (buf!1225 thiss!1379)) (currentByte!2637 thiss!1379) (currentBit!2632 thiss!1379)))))

(assert (=> b!39792 (= lt!60376 (arrayBitRangesEqSymmetric!0 (buf!1225 thiss!1379) (buf!1225 (_2!2001 lt!60062)) lt!60384 lt!60373))))

(assert (=> b!39792 (arrayBitRangesEq!0 (buf!1225 (_2!2001 lt!60062)) (buf!1225 thiss!1379) lt!60384 lt!60373)))

(declare-fun lt!60372 () (_ BitVec 64))

(declare-fun b!39793 () Bool)

(declare-fun lt!60381 () (_ BitVec 64))

(assert (=> b!39793 (= e!26201 (= (_1!2000 lt!60379) (withMovedBitIndex!0 (_2!2000 lt!60379) (bvsub lt!60372 lt!60381))))))

(assert (=> b!39793 (or (= (bvand lt!60372 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!60381 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!60372 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!60372 lt!60381) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!39793 (= lt!60381 (bitIndex!0 (size!897 (buf!1225 (_2!2001 lt!60062))) (currentByte!2637 (_2!2001 lt!60062)) (currentBit!2632 (_2!2001 lt!60062))))))

(assert (=> b!39793 (= lt!60372 (bitIndex!0 (size!897 (buf!1225 thiss!1379)) (currentByte!2637 thiss!1379) (currentBit!2632 thiss!1379)))))

(declare-fun b!39794 () Bool)

(declare-fun Unit!2828 () Unit!2815)

(assert (=> b!39794 (= e!26200 Unit!2828)))

(assert (= (and d!11748 c!2719) b!39792))

(assert (= (and d!11748 (not c!2719)) b!39794))

(assert (= (and d!11748 res!33821) b!39791))

(assert (= (and b!39791 res!33822) b!39790))

(assert (= (and b!39790 res!33823) b!39793))

(declare-fun m!60707 () Bool)

(assert (=> b!39791 m!60707))

(declare-fun m!60709 () Bool)

(assert (=> d!11748 m!60709))

(assert (=> d!11748 m!60675))

(assert (=> d!11748 m!60677))

(declare-fun m!60711 () Bool)

(assert (=> d!11748 m!60711))

(assert (=> d!11748 m!60461))

(assert (=> d!11748 m!60401))

(declare-fun m!60713 () Bool)

(assert (=> d!11748 m!60713))

(declare-fun m!60715 () Bool)

(assert (=> d!11748 m!60715))

(assert (=> d!11748 m!60459))

(declare-fun m!60717 () Bool)

(assert (=> d!11748 m!60717))

(declare-fun m!60719 () Bool)

(assert (=> d!11748 m!60719))

(declare-fun m!60721 () Bool)

(assert (=> b!39793 m!60721))

(assert (=> b!39793 m!60425))

(assert (=> b!39793 m!60463))

(assert (=> b!39792 m!60463))

(declare-fun m!60723 () Bool)

(assert (=> b!39792 m!60723))

(declare-fun m!60725 () Bool)

(assert (=> b!39792 m!60725))

(declare-fun m!60727 () Bool)

(assert (=> b!39790 m!60727))

(assert (=> b!39606 d!11748))

(declare-fun d!11750 () Bool)

(declare-fun e!26203 () Bool)

(assert (=> d!11750 e!26203))

(declare-fun res!33824 () Bool)

(assert (=> d!11750 (=> (not res!33824) (not e!26203))))

(declare-fun lt!60399 () tuple2!3826)

(assert (=> d!11750 (= res!33824 (isPrefixOf!0 (_1!2000 lt!60399) (_2!2000 lt!60399)))))

(declare-fun lt!60386 () BitStream!1544)

(assert (=> d!11750 (= lt!60399 (tuple2!3827 lt!60386 (_2!2001 lt!60060)))))

(declare-fun lt!60387 () Unit!2815)

(declare-fun lt!60389 () Unit!2815)

(assert (=> d!11750 (= lt!60387 lt!60389)))

(assert (=> d!11750 (isPrefixOf!0 lt!60386 (_2!2001 lt!60060))))

(assert (=> d!11750 (= lt!60389 (lemmaIsPrefixTransitive!0 lt!60386 (_2!2001 lt!60060) (_2!2001 lt!60060)))))

(declare-fun lt!60398 () Unit!2815)

(declare-fun lt!60390 () Unit!2815)

(assert (=> d!11750 (= lt!60398 lt!60390)))

(assert (=> d!11750 (isPrefixOf!0 lt!60386 (_2!2001 lt!60060))))

(assert (=> d!11750 (= lt!60390 (lemmaIsPrefixTransitive!0 lt!60386 thiss!1379 (_2!2001 lt!60060)))))

(declare-fun lt!60402 () Unit!2815)

(declare-fun e!26202 () Unit!2815)

(assert (=> d!11750 (= lt!60402 e!26202)))

(declare-fun c!2720 () Bool)

(assert (=> d!11750 (= c!2720 (not (= (size!897 (buf!1225 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!60388 () Unit!2815)

(declare-fun lt!60400 () Unit!2815)

(assert (=> d!11750 (= lt!60388 lt!60400)))

(assert (=> d!11750 (isPrefixOf!0 (_2!2001 lt!60060) (_2!2001 lt!60060))))

(assert (=> d!11750 (= lt!60400 (lemmaIsPrefixRefl!0 (_2!2001 lt!60060)))))

(declare-fun lt!60405 () Unit!2815)

(declare-fun lt!60397 () Unit!2815)

(assert (=> d!11750 (= lt!60405 lt!60397)))

(assert (=> d!11750 (= lt!60397 (lemmaIsPrefixRefl!0 (_2!2001 lt!60060)))))

(declare-fun lt!60394 () Unit!2815)

(declare-fun lt!60395 () Unit!2815)

(assert (=> d!11750 (= lt!60394 lt!60395)))

(assert (=> d!11750 (isPrefixOf!0 lt!60386 lt!60386)))

(assert (=> d!11750 (= lt!60395 (lemmaIsPrefixRefl!0 lt!60386))))

(declare-fun lt!60391 () Unit!2815)

(declare-fun lt!60403 () Unit!2815)

(assert (=> d!11750 (= lt!60391 lt!60403)))

(assert (=> d!11750 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!11750 (= lt!60403 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!11750 (= lt!60386 (BitStream!1545 (buf!1225 (_2!2001 lt!60060)) (currentByte!2637 thiss!1379) (currentBit!2632 thiss!1379)))))

(assert (=> d!11750 (isPrefixOf!0 thiss!1379 (_2!2001 lt!60060))))

(assert (=> d!11750 (= (reader!0 thiss!1379 (_2!2001 lt!60060)) lt!60399)))

(declare-fun b!39795 () Bool)

(declare-fun res!33826 () Bool)

(assert (=> b!39795 (=> (not res!33826) (not e!26203))))

(assert (=> b!39795 (= res!33826 (isPrefixOf!0 (_2!2000 lt!60399) (_2!2001 lt!60060)))))

(declare-fun b!39796 () Bool)

(declare-fun res!33825 () Bool)

(assert (=> b!39796 (=> (not res!33825) (not e!26203))))

(assert (=> b!39796 (= res!33825 (isPrefixOf!0 (_1!2000 lt!60399) thiss!1379))))

(declare-fun b!39797 () Bool)

(declare-fun lt!60396 () Unit!2815)

(assert (=> b!39797 (= e!26202 lt!60396)))

(declare-fun lt!60404 () (_ BitVec 64))

(assert (=> b!39797 (= lt!60404 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60393 () (_ BitVec 64))

(assert (=> b!39797 (= lt!60393 (bitIndex!0 (size!897 (buf!1225 thiss!1379)) (currentByte!2637 thiss!1379) (currentBit!2632 thiss!1379)))))

(assert (=> b!39797 (= lt!60396 (arrayBitRangesEqSymmetric!0 (buf!1225 thiss!1379) (buf!1225 (_2!2001 lt!60060)) lt!60404 lt!60393))))

(assert (=> b!39797 (arrayBitRangesEq!0 (buf!1225 (_2!2001 lt!60060)) (buf!1225 thiss!1379) lt!60404 lt!60393)))

(declare-fun lt!60392 () (_ BitVec 64))

(declare-fun b!39798 () Bool)

(declare-fun lt!60401 () (_ BitVec 64))

(assert (=> b!39798 (= e!26203 (= (_1!2000 lt!60399) (withMovedBitIndex!0 (_2!2000 lt!60399) (bvsub lt!60392 lt!60401))))))

(assert (=> b!39798 (or (= (bvand lt!60392 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!60401 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!60392 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!60392 lt!60401) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!39798 (= lt!60401 (bitIndex!0 (size!897 (buf!1225 (_2!2001 lt!60060))) (currentByte!2637 (_2!2001 lt!60060)) (currentBit!2632 (_2!2001 lt!60060))))))

(assert (=> b!39798 (= lt!60392 (bitIndex!0 (size!897 (buf!1225 thiss!1379)) (currentByte!2637 thiss!1379) (currentBit!2632 thiss!1379)))))

(declare-fun b!39799 () Bool)

(declare-fun Unit!2829 () Unit!2815)

(assert (=> b!39799 (= e!26202 Unit!2829)))

(assert (= (and d!11750 c!2720) b!39797))

(assert (= (and d!11750 (not c!2720)) b!39799))

(assert (= (and d!11750 res!33824) b!39796))

(assert (= (and b!39796 res!33825) b!39795))

(assert (= (and b!39795 res!33826) b!39798))

(declare-fun m!60729 () Bool)

(assert (=> b!39796 m!60729))

(declare-fun m!60731 () Bool)

(assert (=> d!11750 m!60731))

(assert (=> d!11750 m!60681))

(assert (=> d!11750 m!60687))

(declare-fun m!60733 () Bool)

(assert (=> d!11750 m!60733))

(assert (=> d!11750 m!60461))

(assert (=> d!11750 m!60375))

(declare-fun m!60735 () Bool)

(assert (=> d!11750 m!60735))

(declare-fun m!60737 () Bool)

(assert (=> d!11750 m!60737))

(assert (=> d!11750 m!60459))

(declare-fun m!60739 () Bool)

(assert (=> d!11750 m!60739))

(declare-fun m!60741 () Bool)

(assert (=> d!11750 m!60741))

(declare-fun m!60743 () Bool)

(assert (=> b!39798 m!60743))

(assert (=> b!39798 m!60423))

(assert (=> b!39798 m!60463))

(assert (=> b!39797 m!60463))

(declare-fun m!60745 () Bool)

(assert (=> b!39797 m!60745))

(declare-fun m!60747 () Bool)

(assert (=> b!39797 m!60747))

(declare-fun m!60749 () Bool)

(assert (=> b!39795 m!60749))

(assert (=> b!39627 d!11750))

(declare-fun d!11752 () Bool)

(declare-fun res!33834 () Bool)

(declare-fun e!26208 () Bool)

(assert (=> d!11752 (=> (not res!33834) (not e!26208))))

(assert (=> d!11752 (= res!33834 (= (size!897 (buf!1225 (_2!2001 lt!60060))) (size!897 (buf!1225 (_2!2001 lt!60062)))))))

(assert (=> d!11752 (= (isPrefixOf!0 (_2!2001 lt!60060) (_2!2001 lt!60062)) e!26208)))

(declare-fun b!39806 () Bool)

(declare-fun res!33833 () Bool)

(assert (=> b!39806 (=> (not res!33833) (not e!26208))))

(assert (=> b!39806 (= res!33833 (bvsle (bitIndex!0 (size!897 (buf!1225 (_2!2001 lt!60060))) (currentByte!2637 (_2!2001 lt!60060)) (currentBit!2632 (_2!2001 lt!60060))) (bitIndex!0 (size!897 (buf!1225 (_2!2001 lt!60062))) (currentByte!2637 (_2!2001 lt!60062)) (currentBit!2632 (_2!2001 lt!60062)))))))

(declare-fun b!39807 () Bool)

(declare-fun e!26209 () Bool)

(assert (=> b!39807 (= e!26208 e!26209)))

(declare-fun res!33835 () Bool)

(assert (=> b!39807 (=> res!33835 e!26209)))

(assert (=> b!39807 (= res!33835 (= (size!897 (buf!1225 (_2!2001 lt!60060))) #b00000000000000000000000000000000))))

(declare-fun b!39808 () Bool)

(assert (=> b!39808 (= e!26209 (arrayBitRangesEq!0 (buf!1225 (_2!2001 lt!60060)) (buf!1225 (_2!2001 lt!60062)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!897 (buf!1225 (_2!2001 lt!60060))) (currentByte!2637 (_2!2001 lt!60060)) (currentBit!2632 (_2!2001 lt!60060)))))))

(assert (= (and d!11752 res!33834) b!39806))

(assert (= (and b!39806 res!33833) b!39807))

(assert (= (and b!39807 (not res!33835)) b!39808))

(assert (=> b!39806 m!60423))

(assert (=> b!39806 m!60425))

(assert (=> b!39808 m!60423))

(assert (=> b!39808 m!60423))

(declare-fun m!60751 () Bool)

(assert (=> b!39808 m!60751))

(assert (=> b!39627 d!11752))

(declare-fun call!484 () tuple2!3826)

(declare-fun c!2726 () Bool)

(declare-fun lt!60606 () tuple2!3828)

(declare-fun bm!481 () Bool)

(assert (=> bm!481 (= call!484 (reader!0 (_2!2001 lt!60060) (ite c!2726 (_2!2001 lt!60606) (_2!2001 lt!60060))))))

(declare-fun b!39871 () Bool)

(declare-fun res!33887 () Bool)

(declare-fun e!26238 () Bool)

(assert (=> b!39871 (=> (not res!33887) (not e!26238))))

(declare-fun lt!60617 () tuple2!3828)

(assert (=> b!39871 (= res!33887 (= (size!897 (buf!1225 (_2!2001 lt!60060))) (size!897 (buf!1225 (_2!2001 lt!60617)))))))

(declare-fun lt!60618 () tuple2!3826)

(declare-fun b!39872 () Bool)

(assert (=> b!39872 (= e!26238 (= (bitStreamReadBitsIntoList!0 (_2!2001 lt!60617) (_1!2000 lt!60618) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2001 lt!60617) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!39872 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!39872 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!60605 () Unit!2815)

(declare-fun lt!60637 () Unit!2815)

(assert (=> b!39872 (= lt!60605 lt!60637)))

(declare-fun lt!60601 () (_ BitVec 64))

(assert (=> b!39872 (validate_offset_bits!1 ((_ sign_extend 32) (size!897 (buf!1225 (_2!2001 lt!60617)))) ((_ sign_extend 32) (currentByte!2637 (_2!2001 lt!60060))) ((_ sign_extend 32) (currentBit!2632 (_2!2001 lt!60060))) lt!60601)))

(assert (=> b!39872 (= lt!60637 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2001 lt!60060) (buf!1225 (_2!2001 lt!60617)) lt!60601))))

(declare-fun e!26240 () Bool)

(assert (=> b!39872 e!26240))

(declare-fun res!33889 () Bool)

(assert (=> b!39872 (=> (not res!33889) (not e!26240))))

(assert (=> b!39872 (= res!33889 (and (= (size!897 (buf!1225 (_2!2001 lt!60060))) (size!897 (buf!1225 (_2!2001 lt!60617)))) (bvsge lt!60601 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!39872 (= lt!60601 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!39872 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!39872 (= lt!60618 (reader!0 (_2!2001 lt!60060) (_2!2001 lt!60617)))))

(declare-fun d!11754 () Bool)

(assert (=> d!11754 e!26238))

(declare-fun res!33892 () Bool)

(assert (=> d!11754 (=> (not res!33892) (not e!26238))))

(declare-fun lt!60615 () (_ BitVec 64))

(assert (=> d!11754 (= res!33892 (= (bitIndex!0 (size!897 (buf!1225 (_2!2001 lt!60617))) (currentByte!2637 (_2!2001 lt!60617)) (currentBit!2632 (_2!2001 lt!60617))) (bvsub lt!60615 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!11754 (or (= (bvand lt!60615 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!60615 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!60615 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!60599 () (_ BitVec 64))

(assert (=> d!11754 (= lt!60615 (bvadd lt!60599 to!314))))

(assert (=> d!11754 (or (not (= (bvand lt!60599 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!60599 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!60599 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!11754 (= lt!60599 (bitIndex!0 (size!897 (buf!1225 (_2!2001 lt!60060))) (currentByte!2637 (_2!2001 lt!60060)) (currentBit!2632 (_2!2001 lt!60060))))))

(declare-fun e!26239 () tuple2!3828)

(assert (=> d!11754 (= lt!60617 e!26239)))

(assert (=> d!11754 (= c!2726 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!60633 () Unit!2815)

(declare-fun lt!60600 () Unit!2815)

(assert (=> d!11754 (= lt!60633 lt!60600)))

(assert (=> d!11754 (isPrefixOf!0 (_2!2001 lt!60060) (_2!2001 lt!60060))))

(assert (=> d!11754 (= lt!60600 (lemmaIsPrefixRefl!0 (_2!2001 lt!60060)))))

(declare-fun lt!60642 () (_ BitVec 64))

(assert (=> d!11754 (= lt!60642 (bitIndex!0 (size!897 (buf!1225 (_2!2001 lt!60060))) (currentByte!2637 (_2!2001 lt!60060)) (currentBit!2632 (_2!2001 lt!60060))))))

(assert (=> d!11754 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!11754 (= (appendBitsMSBFirstLoop!0 (_2!2001 lt!60060) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!60617)))

(declare-fun b!39873 () Bool)

(assert (=> b!39873 (= e!26240 (validate_offset_bits!1 ((_ sign_extend 32) (size!897 (buf!1225 (_2!2001 lt!60060)))) ((_ sign_extend 32) (currentByte!2637 (_2!2001 lt!60060))) ((_ sign_extend 32) (currentBit!2632 (_2!2001 lt!60060))) lt!60601))))

(declare-fun b!39874 () Bool)

(declare-fun res!33890 () Bool)

(assert (=> b!39874 (=> (not res!33890) (not e!26238))))

(assert (=> b!39874 (= res!33890 (isPrefixOf!0 (_2!2001 lt!60060) (_2!2001 lt!60617)))))

(declare-fun b!39875 () Bool)

(declare-fun res!33891 () Bool)

(assert (=> b!39875 (=> (not res!33891) (not e!26238))))

(assert (=> b!39875 (= res!33891 (invariant!0 (currentBit!2632 (_2!2001 lt!60617)) (currentByte!2637 (_2!2001 lt!60617)) (size!897 (buf!1225 (_2!2001 lt!60617)))))))

(declare-fun b!39876 () Bool)

(declare-fun Unit!2832 () Unit!2815)

(assert (=> b!39876 (= e!26239 (tuple2!3829 Unit!2832 (_2!2001 lt!60060)))))

(assert (=> b!39876 (= (size!897 (buf!1225 (_2!2001 lt!60060))) (size!897 (buf!1225 (_2!2001 lt!60060))))))

(declare-fun lt!60627 () Unit!2815)

(declare-fun Unit!2833 () Unit!2815)

(assert (=> b!39876 (= lt!60627 Unit!2833)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1544 array!1989 array!1989 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!3848 0))(
  ( (tuple2!3849 (_1!2011 array!1989) (_2!2011 BitStream!1544)) )
))
(declare-fun readBits!0 (BitStream!1544 (_ BitVec 64)) tuple2!3848)

(assert (=> b!39876 (checkByteArrayBitContent!0 (_2!2001 lt!60060) srcBuffer!2 (_1!2011 (readBits!0 (_1!2000 call!484) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!39877 () Bool)

(declare-fun res!33888 () Bool)

(assert (=> b!39877 (=> (not res!33888) (not e!26238))))

(assert (=> b!39877 (= res!33888 (= (size!897 (buf!1225 (_2!2001 lt!60617))) (size!897 (buf!1225 (_2!2001 lt!60060)))))))

(declare-fun b!39878 () Bool)

(declare-fun Unit!2834 () Unit!2815)

(assert (=> b!39878 (= e!26239 (tuple2!3829 Unit!2834 (_2!2001 lt!60606)))))

(declare-fun lt!60629 () tuple2!3828)

(assert (=> b!39878 (= lt!60629 (appendBitFromByte!0 (_2!2001 lt!60060) (select (arr!1393 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!60611 () (_ BitVec 64))

(assert (=> b!39878 (= lt!60611 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!60603 () (_ BitVec 64))

(assert (=> b!39878 (= lt!60603 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!60622 () Unit!2815)

(assert (=> b!39878 (= lt!60622 (validateOffsetBitsIneqLemma!0 (_2!2001 lt!60060) (_2!2001 lt!60629) lt!60611 lt!60603))))

(assert (=> b!39878 (validate_offset_bits!1 ((_ sign_extend 32) (size!897 (buf!1225 (_2!2001 lt!60629)))) ((_ sign_extend 32) (currentByte!2637 (_2!2001 lt!60629))) ((_ sign_extend 32) (currentBit!2632 (_2!2001 lt!60629))) (bvsub lt!60611 lt!60603))))

(declare-fun lt!60613 () Unit!2815)

(assert (=> b!39878 (= lt!60613 lt!60622)))

(declare-fun lt!60635 () tuple2!3826)

(assert (=> b!39878 (= lt!60635 (reader!0 (_2!2001 lt!60060) (_2!2001 lt!60629)))))

(declare-fun lt!60614 () (_ BitVec 64))

(assert (=> b!39878 (= lt!60614 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!60621 () Unit!2815)

(assert (=> b!39878 (= lt!60621 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2001 lt!60060) (buf!1225 (_2!2001 lt!60629)) lt!60614))))

(assert (=> b!39878 (validate_offset_bits!1 ((_ sign_extend 32) (size!897 (buf!1225 (_2!2001 lt!60629)))) ((_ sign_extend 32) (currentByte!2637 (_2!2001 lt!60060))) ((_ sign_extend 32) (currentBit!2632 (_2!2001 lt!60060))) lt!60614)))

(declare-fun lt!60619 () Unit!2815)

(assert (=> b!39878 (= lt!60619 lt!60621)))

(assert (=> b!39878 (= (head!310 (byteArrayBitContentToList!0 (_2!2001 lt!60629) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!310 (bitStreamReadBitsIntoList!0 (_2!2001 lt!60629) (_1!2000 lt!60635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!60623 () Unit!2815)

(declare-fun Unit!2836 () Unit!2815)

(assert (=> b!39878 (= lt!60623 Unit!2836)))

(assert (=> b!39878 (= lt!60606 (appendBitsMSBFirstLoop!0 (_2!2001 lt!60629) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!60616 () Unit!2815)

(assert (=> b!39878 (= lt!60616 (lemmaIsPrefixTransitive!0 (_2!2001 lt!60060) (_2!2001 lt!60629) (_2!2001 lt!60606)))))

(assert (=> b!39878 (isPrefixOf!0 (_2!2001 lt!60060) (_2!2001 lt!60606))))

(declare-fun lt!60630 () Unit!2815)

(assert (=> b!39878 (= lt!60630 lt!60616)))

(assert (=> b!39878 (= (size!897 (buf!1225 (_2!2001 lt!60606))) (size!897 (buf!1225 (_2!2001 lt!60060))))))

(declare-fun lt!60609 () Unit!2815)

(declare-fun Unit!2840 () Unit!2815)

(assert (=> b!39878 (= lt!60609 Unit!2840)))

(assert (=> b!39878 (= (bitIndex!0 (size!897 (buf!1225 (_2!2001 lt!60606))) (currentByte!2637 (_2!2001 lt!60606)) (currentBit!2632 (_2!2001 lt!60606))) (bvsub (bvadd (bitIndex!0 (size!897 (buf!1225 (_2!2001 lt!60060))) (currentByte!2637 (_2!2001 lt!60060)) (currentBit!2632 (_2!2001 lt!60060))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!60632 () Unit!2815)

(declare-fun Unit!2843 () Unit!2815)

(assert (=> b!39878 (= lt!60632 Unit!2843)))

(assert (=> b!39878 (= (bitIndex!0 (size!897 (buf!1225 (_2!2001 lt!60606))) (currentByte!2637 (_2!2001 lt!60606)) (currentBit!2632 (_2!2001 lt!60606))) (bvsub (bvsub (bvadd (bitIndex!0 (size!897 (buf!1225 (_2!2001 lt!60629))) (currentByte!2637 (_2!2001 lt!60629)) (currentBit!2632 (_2!2001 lt!60629))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!60624 () Unit!2815)

(declare-fun Unit!2844 () Unit!2815)

(assert (=> b!39878 (= lt!60624 Unit!2844)))

(declare-fun lt!60625 () tuple2!3826)

(assert (=> b!39878 (= lt!60625 call!484)))

(declare-fun lt!60604 () (_ BitVec 64))

(assert (=> b!39878 (= lt!60604 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!60640 () Unit!2815)

(assert (=> b!39878 (= lt!60640 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2001 lt!60060) (buf!1225 (_2!2001 lt!60606)) lt!60604))))

(assert (=> b!39878 (validate_offset_bits!1 ((_ sign_extend 32) (size!897 (buf!1225 (_2!2001 lt!60606)))) ((_ sign_extend 32) (currentByte!2637 (_2!2001 lt!60060))) ((_ sign_extend 32) (currentBit!2632 (_2!2001 lt!60060))) lt!60604)))

(declare-fun lt!60626 () Unit!2815)

(assert (=> b!39878 (= lt!60626 lt!60640)))

(declare-fun lt!60641 () tuple2!3826)

(assert (=> b!39878 (= lt!60641 (reader!0 (_2!2001 lt!60629) (_2!2001 lt!60606)))))

(declare-fun lt!60628 () (_ BitVec 64))

(assert (=> b!39878 (= lt!60628 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!60607 () Unit!2815)

(assert (=> b!39878 (= lt!60607 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2001 lt!60629) (buf!1225 (_2!2001 lt!60606)) lt!60628))))

(assert (=> b!39878 (validate_offset_bits!1 ((_ sign_extend 32) (size!897 (buf!1225 (_2!2001 lt!60606)))) ((_ sign_extend 32) (currentByte!2637 (_2!2001 lt!60629))) ((_ sign_extend 32) (currentBit!2632 (_2!2001 lt!60629))) lt!60628)))

(declare-fun lt!60620 () Unit!2815)

(assert (=> b!39878 (= lt!60620 lt!60607)))

(declare-fun lt!60638 () List!473)

(assert (=> b!39878 (= lt!60638 (byteArrayBitContentToList!0 (_2!2001 lt!60606) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!60608 () List!473)

(assert (=> b!39878 (= lt!60608 (byteArrayBitContentToList!0 (_2!2001 lt!60606) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!60610 () List!473)

(assert (=> b!39878 (= lt!60610 (bitStreamReadBitsIntoList!0 (_2!2001 lt!60606) (_1!2000 lt!60625) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!60634 () List!473)

(assert (=> b!39878 (= lt!60634 (bitStreamReadBitsIntoList!0 (_2!2001 lt!60606) (_1!2000 lt!60641) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!60602 () (_ BitVec 64))

(assert (=> b!39878 (= lt!60602 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!60636 () Unit!2815)

(assert (=> b!39878 (= lt!60636 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2001 lt!60606) (_2!2001 lt!60606) (_1!2000 lt!60625) (_1!2000 lt!60641) lt!60602 lt!60610))))

(assert (=> b!39878 (= (bitStreamReadBitsIntoList!0 (_2!2001 lt!60606) (_1!2000 lt!60641) (bvsub lt!60602 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!190 lt!60610))))

(declare-fun lt!60612 () Unit!2815)

(assert (=> b!39878 (= lt!60612 lt!60636)))

(declare-fun lt!60639 () Unit!2815)

(assert (=> b!39878 (= lt!60639 (arrayBitRangesEqImpliesEq!0 (buf!1225 (_2!2001 lt!60629)) (buf!1225 (_2!2001 lt!60606)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!60642 (bitIndex!0 (size!897 (buf!1225 (_2!2001 lt!60629))) (currentByte!2637 (_2!2001 lt!60629)) (currentBit!2632 (_2!2001 lt!60629)))))))

(assert (=> b!39878 (= (bitAt!0 (buf!1225 (_2!2001 lt!60629)) lt!60642) (bitAt!0 (buf!1225 (_2!2001 lt!60606)) lt!60642))))

(declare-fun lt!60631 () Unit!2815)

(assert (=> b!39878 (= lt!60631 lt!60639)))

(assert (= (and d!11754 c!2726) b!39878))

(assert (= (and d!11754 (not c!2726)) b!39876))

(assert (= (or b!39878 b!39876) bm!481))

(assert (= (and d!11754 res!33892) b!39875))

(assert (= (and b!39875 res!33891) b!39871))

(assert (= (and b!39871 res!33887) b!39874))

(assert (= (and b!39874 res!33890) b!39877))

(assert (= (and b!39877 res!33888) b!39872))

(assert (= (and b!39872 res!33889) b!39873))

(declare-fun m!60819 () Bool)

(assert (=> b!39872 m!60819))

(declare-fun m!60821 () Bool)

(assert (=> b!39872 m!60821))

(declare-fun m!60823 () Bool)

(assert (=> b!39872 m!60823))

(declare-fun m!60825 () Bool)

(assert (=> b!39872 m!60825))

(declare-fun m!60827 () Bool)

(assert (=> b!39872 m!60827))

(declare-fun m!60829 () Bool)

(assert (=> d!11754 m!60829))

(assert (=> d!11754 m!60423))

(assert (=> d!11754 m!60687))

(assert (=> d!11754 m!60681))

(declare-fun m!60831 () Bool)

(assert (=> b!39876 m!60831))

(declare-fun m!60833 () Bool)

(assert (=> b!39876 m!60833))

(declare-fun m!60835 () Bool)

(assert (=> b!39878 m!60835))

(declare-fun m!60837 () Bool)

(assert (=> b!39878 m!60837))

(declare-fun m!60839 () Bool)

(assert (=> b!39878 m!60839))

(declare-fun m!60841 () Bool)

(assert (=> b!39878 m!60841))

(declare-fun m!60843 () Bool)

(assert (=> b!39878 m!60843))

(declare-fun m!60845 () Bool)

(assert (=> b!39878 m!60845))

(declare-fun m!60847 () Bool)

(assert (=> b!39878 m!60847))

(declare-fun m!60849 () Bool)

(assert (=> b!39878 m!60849))

(declare-fun m!60851 () Bool)

(assert (=> b!39878 m!60851))

(assert (=> b!39878 m!60423))

(declare-fun m!60853 () Bool)

(assert (=> b!39878 m!60853))

(assert (=> b!39878 m!60849))

(declare-fun m!60855 () Bool)

(assert (=> b!39878 m!60855))

(declare-fun m!60857 () Bool)

(assert (=> b!39878 m!60857))

(declare-fun m!60859 () Bool)

(assert (=> b!39878 m!60859))

(declare-fun m!60861 () Bool)

(assert (=> b!39878 m!60861))

(declare-fun m!60863 () Bool)

(assert (=> b!39878 m!60863))

(declare-fun m!60865 () Bool)

(assert (=> b!39878 m!60865))

(declare-fun m!60867 () Bool)

(assert (=> b!39878 m!60867))

(declare-fun m!60869 () Bool)

(assert (=> b!39878 m!60869))

(declare-fun m!60871 () Bool)

(assert (=> b!39878 m!60871))

(declare-fun m!60873 () Bool)

(assert (=> b!39878 m!60873))

(declare-fun m!60875 () Bool)

(assert (=> b!39878 m!60875))

(declare-fun m!60877 () Bool)

(assert (=> b!39878 m!60877))

(assert (=> b!39878 m!60873))

(declare-fun m!60879 () Bool)

(assert (=> b!39878 m!60879))

(declare-fun m!60881 () Bool)

(assert (=> b!39878 m!60881))

(declare-fun m!60883 () Bool)

(assert (=> b!39878 m!60883))

(assert (=> b!39878 m!60883))

(declare-fun m!60885 () Bool)

(assert (=> b!39878 m!60885))

(declare-fun m!60887 () Bool)

(assert (=> b!39878 m!60887))

(assert (=> b!39878 m!60855))

(declare-fun m!60889 () Bool)

(assert (=> b!39878 m!60889))

(declare-fun m!60891 () Bool)

(assert (=> b!39878 m!60891))

(declare-fun m!60893 () Bool)

(assert (=> b!39878 m!60893))

(declare-fun m!60895 () Bool)

(assert (=> b!39878 m!60895))

(declare-fun m!60897 () Bool)

(assert (=> bm!481 m!60897))

(declare-fun m!60899 () Bool)

(assert (=> b!39874 m!60899))

(declare-fun m!60901 () Bool)

(assert (=> b!39875 m!60901))

(declare-fun m!60903 () Bool)

(assert (=> b!39873 m!60903))

(assert (=> b!39627 d!11754))

(declare-fun d!11774 () Bool)

(assert (=> d!11774 (isPrefixOf!0 thiss!1379 (_2!2001 lt!60062))))

(declare-fun lt!60645 () Unit!2815)

(declare-fun choose!30 (BitStream!1544 BitStream!1544 BitStream!1544) Unit!2815)

(assert (=> d!11774 (= lt!60645 (choose!30 thiss!1379 (_2!2001 lt!60060) (_2!2001 lt!60062)))))

(assert (=> d!11774 (isPrefixOf!0 thiss!1379 (_2!2001 lt!60060))))

(assert (=> d!11774 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2001 lt!60060) (_2!2001 lt!60062)) lt!60645)))

(declare-fun bs!3125 () Bool)

(assert (= bs!3125 d!11774))

(assert (=> bs!3125 m!60401))

(declare-fun m!60905 () Bool)

(assert (=> bs!3125 m!60905))

(assert (=> bs!3125 m!60375))

(assert (=> b!39627 d!11774))

(declare-fun d!11776 () Bool)

(assert (=> d!11776 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!897 (buf!1225 (_2!2001 lt!60060)))) ((_ sign_extend 32) (currentByte!2637 thiss!1379)) ((_ sign_extend 32) (currentBit!2632 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!897 (buf!1225 (_2!2001 lt!60060)))) ((_ sign_extend 32) (currentByte!2637 thiss!1379)) ((_ sign_extend 32) (currentBit!2632 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!3126 () Bool)

(assert (= bs!3126 d!11776))

(declare-fun m!60907 () Bool)

(assert (=> bs!3126 m!60907))

(assert (=> b!39627 d!11776))

(declare-fun d!11778 () Bool)

(assert (=> d!11778 (validate_offset_bits!1 ((_ sign_extend 32) (size!897 (buf!1225 (_2!2001 lt!60060)))) ((_ sign_extend 32) (currentByte!2637 thiss!1379)) ((_ sign_extend 32) (currentBit!2632 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!60646 () Unit!2815)

(assert (=> d!11778 (= lt!60646 (choose!9 thiss!1379 (buf!1225 (_2!2001 lt!60060)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1545 (buf!1225 (_2!2001 lt!60060)) (currentByte!2637 thiss!1379) (currentBit!2632 thiss!1379))))))

(assert (=> d!11778 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1225 (_2!2001 lt!60060)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!60646)))

(declare-fun bs!3127 () Bool)

(assert (= bs!3127 d!11778))

(assert (=> bs!3127 m!60395))

(declare-fun m!60909 () Bool)

(assert (=> bs!3127 m!60909))

(assert (=> b!39627 d!11778))

(declare-fun d!11780 () Bool)

(declare-fun res!33894 () Bool)

(declare-fun e!26241 () Bool)

(assert (=> d!11780 (=> (not res!33894) (not e!26241))))

(assert (=> d!11780 (= res!33894 (= (size!897 (buf!1225 thiss!1379)) (size!897 (buf!1225 (_2!2001 lt!60062)))))))

(assert (=> d!11780 (= (isPrefixOf!0 thiss!1379 (_2!2001 lt!60062)) e!26241)))

(declare-fun b!39879 () Bool)

(declare-fun res!33893 () Bool)

(assert (=> b!39879 (=> (not res!33893) (not e!26241))))

(assert (=> b!39879 (= res!33893 (bvsle (bitIndex!0 (size!897 (buf!1225 thiss!1379)) (currentByte!2637 thiss!1379) (currentBit!2632 thiss!1379)) (bitIndex!0 (size!897 (buf!1225 (_2!2001 lt!60062))) (currentByte!2637 (_2!2001 lt!60062)) (currentBit!2632 (_2!2001 lt!60062)))))))

(declare-fun b!39880 () Bool)

(declare-fun e!26242 () Bool)

(assert (=> b!39880 (= e!26241 e!26242)))

(declare-fun res!33895 () Bool)

(assert (=> b!39880 (=> res!33895 e!26242)))

(assert (=> b!39880 (= res!33895 (= (size!897 (buf!1225 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!39881 () Bool)

(assert (=> b!39881 (= e!26242 (arrayBitRangesEq!0 (buf!1225 thiss!1379) (buf!1225 (_2!2001 lt!60062)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!897 (buf!1225 thiss!1379)) (currentByte!2637 thiss!1379) (currentBit!2632 thiss!1379))))))

(assert (= (and d!11780 res!33894) b!39879))

(assert (= (and b!39879 res!33893) b!39880))

(assert (= (and b!39880 (not res!33895)) b!39881))

(assert (=> b!39879 m!60463))

(assert (=> b!39879 m!60425))

(assert (=> b!39881 m!60463))

(assert (=> b!39881 m!60463))

(declare-fun m!60911 () Bool)

(assert (=> b!39881 m!60911))

(assert (=> b!39627 d!11780))

(declare-fun d!11782 () Bool)

(assert (=> d!11782 (= (bitAt!0 (buf!1225 (_2!2001 lt!60060)) lt!60061) (not (= (bvand ((_ sign_extend 24) (select (arr!1393 (buf!1225 (_2!2001 lt!60060))) ((_ extract 31 0) (bvsdiv lt!60061 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!60061 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3128 () Bool)

(assert (= bs!3128 d!11782))

(declare-fun m!60913 () Bool)

(assert (=> bs!3128 m!60913))

(declare-fun m!60915 () Bool)

(assert (=> bs!3128 m!60915))

(assert (=> b!39618 d!11782))

(declare-fun d!11784 () Bool)

(assert (=> d!11784 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1393 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3129 () Bool)

(assert (= bs!3129 d!11784))

(assert (=> bs!3129 m!60367))

(declare-fun m!60917 () Bool)

(assert (=> bs!3129 m!60917))

(assert (=> b!39607 d!11784))

(declare-fun d!11786 () Bool)

(assert (=> d!11786 (= (head!310 (byteArrayBitContentToList!0 (_2!2001 lt!60062) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!588 (byteArrayBitContentToList!0 (_2!2001 lt!60062) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!39607 d!11786))

(declare-fun d!11788 () Bool)

(declare-fun c!2729 () Bool)

(assert (=> d!11788 (= c!2729 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!26245 () List!473)

(assert (=> d!11788 (= (byteArrayBitContentToList!0 (_2!2001 lt!60062) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!26245)))

(declare-fun b!39886 () Bool)

(assert (=> b!39886 (= e!26245 Nil!470)))

(declare-fun b!39887 () Bool)

(assert (=> b!39887 (= e!26245 (Cons!469 (not (= (bvand ((_ sign_extend 24) (select (arr!1393 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2001 lt!60062) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!11788 c!2729) b!39886))

(assert (= (and d!11788 (not c!2729)) b!39887))

(assert (=> b!39887 m!60367))

(assert (=> b!39887 m!60917))

(declare-fun m!60919 () Bool)

(assert (=> b!39887 m!60919))

(assert (=> b!39607 d!11788))

(declare-fun d!11790 () Bool)

(declare-fun lt!60649 () tuple2!3840)

(assert (=> d!11790 (= lt!60649 (readBit!0 (_1!2000 lt!60067)))))

(assert (=> d!11790 (= (readBitPure!0 (_1!2000 lt!60067)) (tuple2!3831 (_2!2007 lt!60649) (_1!2007 lt!60649)))))

(declare-fun bs!3130 () Bool)

(assert (= bs!3130 d!11790))

(assert (=> bs!3130 m!60593))

(assert (=> b!39620 d!11790))

(declare-fun d!11792 () Bool)

(assert (=> d!11792 (= (array_inv!825 srcBuffer!2) (bvsge (size!897 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!7938 d!11792))

(declare-fun d!11794 () Bool)

(assert (=> d!11794 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2632 thiss!1379) (currentByte!2637 thiss!1379) (size!897 (buf!1225 thiss!1379))))))

(declare-fun bs!3131 () Bool)

(assert (= bs!3131 d!11794))

(declare-fun m!60921 () Bool)

(assert (=> bs!3131 m!60921))

(assert (=> start!7938 d!11794))

(declare-fun d!11796 () Bool)

(declare-fun res!33897 () Bool)

(declare-fun e!26246 () Bool)

(assert (=> d!11796 (=> (not res!33897) (not e!26246))))

(assert (=> d!11796 (= res!33897 (= (size!897 (buf!1225 thiss!1379)) (size!897 (buf!1225 thiss!1379))))))

(assert (=> d!11796 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!26246)))

(declare-fun b!39888 () Bool)

(declare-fun res!33896 () Bool)

(assert (=> b!39888 (=> (not res!33896) (not e!26246))))

(assert (=> b!39888 (= res!33896 (bvsle (bitIndex!0 (size!897 (buf!1225 thiss!1379)) (currentByte!2637 thiss!1379) (currentBit!2632 thiss!1379)) (bitIndex!0 (size!897 (buf!1225 thiss!1379)) (currentByte!2637 thiss!1379) (currentBit!2632 thiss!1379))))))

(declare-fun b!39889 () Bool)

(declare-fun e!26247 () Bool)

(assert (=> b!39889 (= e!26246 e!26247)))

(declare-fun res!33898 () Bool)

(assert (=> b!39889 (=> res!33898 e!26247)))

(assert (=> b!39889 (= res!33898 (= (size!897 (buf!1225 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!39890 () Bool)

(assert (=> b!39890 (= e!26247 (arrayBitRangesEq!0 (buf!1225 thiss!1379) (buf!1225 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!897 (buf!1225 thiss!1379)) (currentByte!2637 thiss!1379) (currentBit!2632 thiss!1379))))))

(assert (= (and d!11796 res!33897) b!39888))

(assert (= (and b!39888 res!33896) b!39889))

(assert (= (and b!39889 (not res!33898)) b!39890))

(assert (=> b!39888 m!60463))

(assert (=> b!39888 m!60463))

(assert (=> b!39890 m!60463))

(assert (=> b!39890 m!60463))

(declare-fun m!60923 () Bool)

(assert (=> b!39890 m!60923))

(assert (=> b!39609 d!11796))

(declare-fun d!11798 () Bool)

(assert (=> d!11798 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!60652 () Unit!2815)

(declare-fun choose!11 (BitStream!1544) Unit!2815)

(assert (=> d!11798 (= lt!60652 (choose!11 thiss!1379))))

(assert (=> d!11798 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!60652)))

(declare-fun bs!3133 () Bool)

(assert (= bs!3133 d!11798))

(assert (=> bs!3133 m!60459))

(declare-fun m!60925 () Bool)

(assert (=> bs!3133 m!60925))

(assert (=> b!39609 d!11798))

(declare-fun d!11800 () Bool)

(declare-fun e!26250 () Bool)

(assert (=> d!11800 e!26250))

(declare-fun res!33903 () Bool)

(assert (=> d!11800 (=> (not res!33903) (not e!26250))))

(declare-fun lt!60665 () (_ BitVec 64))

(declare-fun lt!60669 () (_ BitVec 64))

(declare-fun lt!60670 () (_ BitVec 64))

(assert (=> d!11800 (= res!33903 (= lt!60669 (bvsub lt!60670 lt!60665)))))

(assert (=> d!11800 (or (= (bvand lt!60670 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!60665 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!60670 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!60670 lt!60665) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!11800 (= lt!60665 (remainingBits!0 ((_ sign_extend 32) (size!897 (buf!1225 thiss!1379))) ((_ sign_extend 32) (currentByte!2637 thiss!1379)) ((_ sign_extend 32) (currentBit!2632 thiss!1379))))))

(declare-fun lt!60667 () (_ BitVec 64))

(declare-fun lt!60668 () (_ BitVec 64))

(assert (=> d!11800 (= lt!60670 (bvmul lt!60667 lt!60668))))

(assert (=> d!11800 (or (= lt!60667 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!60668 (bvsdiv (bvmul lt!60667 lt!60668) lt!60667)))))

(assert (=> d!11800 (= lt!60668 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!11800 (= lt!60667 ((_ sign_extend 32) (size!897 (buf!1225 thiss!1379))))))

(assert (=> d!11800 (= lt!60669 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2637 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2632 thiss!1379))))))

(assert (=> d!11800 (invariant!0 (currentBit!2632 thiss!1379) (currentByte!2637 thiss!1379) (size!897 (buf!1225 thiss!1379)))))

(assert (=> d!11800 (= (bitIndex!0 (size!897 (buf!1225 thiss!1379)) (currentByte!2637 thiss!1379) (currentBit!2632 thiss!1379)) lt!60669)))

(declare-fun b!39895 () Bool)

(declare-fun res!33904 () Bool)

(assert (=> b!39895 (=> (not res!33904) (not e!26250))))

(assert (=> b!39895 (= res!33904 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!60669))))

(declare-fun b!39896 () Bool)

(declare-fun lt!60666 () (_ BitVec 64))

(assert (=> b!39896 (= e!26250 (bvsle lt!60669 (bvmul lt!60666 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!39896 (or (= lt!60666 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!60666 #b0000000000000000000000000000000000000000000000000000000000001000) lt!60666)))))

(assert (=> b!39896 (= lt!60666 ((_ sign_extend 32) (size!897 (buf!1225 thiss!1379))))))

(assert (= (and d!11800 res!33903) b!39895))

(assert (= (and b!39895 res!33904) b!39896))

(declare-fun m!60927 () Bool)

(assert (=> d!11800 m!60927))

(assert (=> d!11800 m!60921))

(assert (=> b!39609 d!11800))

(declare-fun d!11802 () Bool)

(assert (=> d!11802 (= (invariant!0 (currentBit!2632 (_2!2001 lt!60060)) (currentByte!2637 (_2!2001 lt!60060)) (size!897 (buf!1225 (_2!2001 lt!60062)))) (and (bvsge (currentBit!2632 (_2!2001 lt!60060)) #b00000000000000000000000000000000) (bvslt (currentBit!2632 (_2!2001 lt!60060)) #b00000000000000000000000000001000) (bvsge (currentByte!2637 (_2!2001 lt!60060)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2637 (_2!2001 lt!60060)) (size!897 (buf!1225 (_2!2001 lt!60062)))) (and (= (currentBit!2632 (_2!2001 lt!60060)) #b00000000000000000000000000000000) (= (currentByte!2637 (_2!2001 lt!60060)) (size!897 (buf!1225 (_2!2001 lt!60062))))))))))

(assert (=> b!39621 d!11802))

(declare-fun d!11804 () Bool)

(assert (=> d!11804 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!897 (buf!1225 (_1!2000 lt!60067)))) ((_ sign_extend 32) (currentByte!2637 (_1!2000 lt!60067))) ((_ sign_extend 32) (currentBit!2632 (_1!2000 lt!60067))) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!897 (buf!1225 (_1!2000 lt!60067)))) ((_ sign_extend 32) (currentByte!2637 (_1!2000 lt!60067))) ((_ sign_extend 32) (currentBit!2632 (_1!2000 lt!60067)))) (bvsub to!314 i!635)))))

(declare-fun bs!3134 () Bool)

(assert (= bs!3134 d!11804))

(declare-fun m!60929 () Bool)

(assert (=> bs!3134 m!60929))

(assert (=> b!39610 d!11804))

(declare-fun d!11806 () Bool)

(declare-fun res!33906 () Bool)

(declare-fun e!26251 () Bool)

(assert (=> d!11806 (=> (not res!33906) (not e!26251))))

(assert (=> d!11806 (= res!33906 (= (size!897 (buf!1225 thiss!1379)) (size!897 (buf!1225 (_2!2001 lt!60060)))))))

(assert (=> d!11806 (= (isPrefixOf!0 thiss!1379 (_2!2001 lt!60060)) e!26251)))

(declare-fun b!39897 () Bool)

(declare-fun res!33905 () Bool)

(assert (=> b!39897 (=> (not res!33905) (not e!26251))))

(assert (=> b!39897 (= res!33905 (bvsle (bitIndex!0 (size!897 (buf!1225 thiss!1379)) (currentByte!2637 thiss!1379) (currentBit!2632 thiss!1379)) (bitIndex!0 (size!897 (buf!1225 (_2!2001 lt!60060))) (currentByte!2637 (_2!2001 lt!60060)) (currentBit!2632 (_2!2001 lt!60060)))))))

(declare-fun b!39898 () Bool)

(declare-fun e!26252 () Bool)

(assert (=> b!39898 (= e!26251 e!26252)))

(declare-fun res!33907 () Bool)

(assert (=> b!39898 (=> res!33907 e!26252)))

(assert (=> b!39898 (= res!33907 (= (size!897 (buf!1225 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!39899 () Bool)

(assert (=> b!39899 (= e!26252 (arrayBitRangesEq!0 (buf!1225 thiss!1379) (buf!1225 (_2!2001 lt!60060)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!897 (buf!1225 thiss!1379)) (currentByte!2637 thiss!1379) (currentBit!2632 thiss!1379))))))

(assert (= (and d!11806 res!33906) b!39897))

(assert (= (and b!39897 res!33905) b!39898))

(assert (= (and b!39898 (not res!33907)) b!39899))

(assert (=> b!39897 m!60463))

(assert (=> b!39897 m!60423))

(assert (=> b!39899 m!60463))

(assert (=> b!39899 m!60463))

(declare-fun m!60931 () Bool)

(assert (=> b!39899 m!60931))

(assert (=> b!39612 d!11806))

(declare-fun d!11808 () Bool)

(assert (=> d!11808 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!897 (buf!1225 (_2!2001 lt!60060)))) ((_ sign_extend 32) (currentByte!2637 (_2!2001 lt!60060))) ((_ sign_extend 32) (currentBit!2632 (_2!2001 lt!60060))) lt!60049) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!897 (buf!1225 (_2!2001 lt!60060)))) ((_ sign_extend 32) (currentByte!2637 (_2!2001 lt!60060))) ((_ sign_extend 32) (currentBit!2632 (_2!2001 lt!60060)))) lt!60049))))

(declare-fun bs!3135 () Bool)

(assert (= bs!3135 d!11808))

(declare-fun m!60933 () Bool)

(assert (=> bs!3135 m!60933))

(assert (=> b!39612 d!11808))

(declare-fun d!11810 () Bool)

(declare-fun e!26259 () Bool)

(assert (=> d!11810 e!26259))

(declare-fun res!33910 () Bool)

(assert (=> d!11810 (=> (not res!33910) (not e!26259))))

(assert (=> d!11810 (= res!33910 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!60727 () Unit!2815)

(declare-fun choose!27 (BitStream!1544 BitStream!1544 (_ BitVec 64) (_ BitVec 64)) Unit!2815)

(assert (=> d!11810 (= lt!60727 (choose!27 thiss!1379 (_2!2001 lt!60060) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!11810 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!11810 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2001 lt!60060) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!60727)))

(declare-fun b!39910 () Bool)

(assert (=> b!39910 (= e!26259 (validate_offset_bits!1 ((_ sign_extend 32) (size!897 (buf!1225 (_2!2001 lt!60060)))) ((_ sign_extend 32) (currentByte!2637 (_2!2001 lt!60060))) ((_ sign_extend 32) (currentBit!2632 (_2!2001 lt!60060))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!11810 res!33910) b!39910))

(declare-fun m!60935 () Bool)

(assert (=> d!11810 m!60935))

(declare-fun m!60937 () Bool)

(assert (=> b!39910 m!60937))

(assert (=> b!39612 d!11810))

(declare-fun b!40016 () Bool)

(declare-fun e!26309 () Bool)

(declare-fun lt!61062 () tuple2!3830)

(declare-fun lt!61059 () tuple2!3828)

(assert (=> b!40016 (= e!26309 (= (bitIndex!0 (size!897 (buf!1225 (_1!2002 lt!61062))) (currentByte!2637 (_1!2002 lt!61062)) (currentBit!2632 (_1!2002 lt!61062))) (bitIndex!0 (size!897 (buf!1225 (_2!2001 lt!61059))) (currentByte!2637 (_2!2001 lt!61059)) (currentBit!2632 (_2!2001 lt!61059)))))))

(declare-fun b!40017 () Bool)

(declare-fun res!33991 () Bool)

(declare-fun e!26312 () Bool)

(assert (=> b!40017 (=> (not res!33991) (not e!26312))))

(assert (=> b!40017 (= res!33991 (isPrefixOf!0 thiss!1379 (_2!2001 lt!61059)))))

(declare-fun b!40018 () Bool)

(declare-fun res!33986 () Bool)

(declare-fun e!26311 () Bool)

(assert (=> b!40018 (=> (not res!33986) (not e!26311))))

(declare-fun lt!61053 () tuple2!3828)

(assert (=> b!40018 (= res!33986 (isPrefixOf!0 thiss!1379 (_2!2001 lt!61053)))))

(declare-fun d!11812 () Bool)

(assert (=> d!11812 e!26312))

(declare-fun res!33990 () Bool)

(assert (=> d!11812 (=> (not res!33990) (not e!26312))))

(assert (=> d!11812 (= res!33990 (= (size!897 (buf!1225 (_2!2001 lt!61059))) (size!897 (buf!1225 thiss!1379))))))

(declare-fun lt!61056 () (_ BitVec 8))

(declare-fun lt!61061 () array!1989)

(assert (=> d!11812 (= lt!61056 (select (arr!1393 lt!61061) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!11812 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!897 lt!61061)))))

(assert (=> d!11812 (= lt!61061 (array!1990 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!61055 () tuple2!3828)

(assert (=> d!11812 (= lt!61059 (tuple2!3829 (_1!2001 lt!61055) (_2!2001 lt!61055)))))

(assert (=> d!11812 (= lt!61055 lt!61053)))

(assert (=> d!11812 e!26311))

(declare-fun res!33989 () Bool)

(assert (=> d!11812 (=> (not res!33989) (not e!26311))))

(assert (=> d!11812 (= res!33989 (= (size!897 (buf!1225 thiss!1379)) (size!897 (buf!1225 (_2!2001 lt!61053)))))))

(declare-fun lt!61063 () Bool)

(declare-fun appendBit!0 (BitStream!1544 Bool) tuple2!3828)

(assert (=> d!11812 (= lt!61053 (appendBit!0 thiss!1379 lt!61063))))

(assert (=> d!11812 (= lt!61063 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1393 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!11812 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!11812 (= (appendBitFromByte!0 thiss!1379 (select (arr!1393 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!61059)))

(declare-fun b!40019 () Bool)

(declare-fun e!26310 () Bool)

(assert (=> b!40019 (= e!26311 e!26310)))

(declare-fun res!33992 () Bool)

(assert (=> b!40019 (=> (not res!33992) (not e!26310))))

(declare-fun lt!61060 () tuple2!3830)

(assert (=> b!40019 (= res!33992 (and (= (_2!2002 lt!61060) lt!61063) (= (_1!2002 lt!61060) (_2!2001 lt!61053))))))

(declare-fun readerFrom!0 (BitStream!1544 (_ BitVec 32) (_ BitVec 32)) BitStream!1544)

(assert (=> b!40019 (= lt!61060 (readBitPure!0 (readerFrom!0 (_2!2001 lt!61053) (currentBit!2632 thiss!1379) (currentByte!2637 thiss!1379))))))

(declare-fun b!40020 () Bool)

(declare-fun res!33985 () Bool)

(assert (=> b!40020 (=> (not res!33985) (not e!26311))))

(assert (=> b!40020 (= res!33985 (= (bitIndex!0 (size!897 (buf!1225 (_2!2001 lt!61053))) (currentByte!2637 (_2!2001 lt!61053)) (currentBit!2632 (_2!2001 lt!61053))) (bvadd (bitIndex!0 (size!897 (buf!1225 thiss!1379)) (currentByte!2637 thiss!1379) (currentBit!2632 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!40021 () Bool)

(declare-fun res!33988 () Bool)

(assert (=> b!40021 (=> (not res!33988) (not e!26312))))

(declare-fun lt!61057 () (_ BitVec 64))

(declare-fun lt!61058 () (_ BitVec 64))

(assert (=> b!40021 (= res!33988 (= (bitIndex!0 (size!897 (buf!1225 (_2!2001 lt!61059))) (currentByte!2637 (_2!2001 lt!61059)) (currentBit!2632 (_2!2001 lt!61059))) (bvadd lt!61057 lt!61058)))))

(assert (=> b!40021 (or (not (= (bvand lt!61057 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!61058 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!61057 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!61057 lt!61058) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!40021 (= lt!61058 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!40021 (= lt!61057 (bitIndex!0 (size!897 (buf!1225 thiss!1379)) (currentByte!2637 thiss!1379) (currentBit!2632 thiss!1379)))))

(declare-fun b!40022 () Bool)

(assert (=> b!40022 (= e!26312 e!26309)))

(declare-fun res!33987 () Bool)

(assert (=> b!40022 (=> (not res!33987) (not e!26309))))

(assert (=> b!40022 (= res!33987 (and (= (_2!2002 lt!61062) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1393 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!61056)) #b00000000000000000000000000000000))) (= (_1!2002 lt!61062) (_2!2001 lt!61059))))))

(declare-fun lt!61054 () tuple2!3848)

(declare-fun lt!61052 () BitStream!1544)

(assert (=> b!40022 (= lt!61054 (readBits!0 lt!61052 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!40022 (= lt!61062 (readBitPure!0 lt!61052))))

(assert (=> b!40022 (= lt!61052 (readerFrom!0 (_2!2001 lt!61059) (currentBit!2632 thiss!1379) (currentByte!2637 thiss!1379)))))

(declare-fun b!40023 () Bool)

(assert (=> b!40023 (= e!26310 (= (bitIndex!0 (size!897 (buf!1225 (_1!2002 lt!61060))) (currentByte!2637 (_1!2002 lt!61060)) (currentBit!2632 (_1!2002 lt!61060))) (bitIndex!0 (size!897 (buf!1225 (_2!2001 lt!61053))) (currentByte!2637 (_2!2001 lt!61053)) (currentBit!2632 (_2!2001 lt!61053)))))))

(assert (= (and d!11812 res!33989) b!40020))

(assert (= (and b!40020 res!33985) b!40018))

(assert (= (and b!40018 res!33986) b!40019))

(assert (= (and b!40019 res!33992) b!40023))

(assert (= (and d!11812 res!33990) b!40021))

(assert (= (and b!40021 res!33988) b!40017))

(assert (= (and b!40017 res!33991) b!40022))

(assert (= (and b!40022 res!33987) b!40016))

(declare-fun m!61229 () Bool)

(assert (=> b!40021 m!61229))

(assert (=> b!40021 m!60463))

(declare-fun m!61231 () Bool)

(assert (=> b!40022 m!61231))

(declare-fun m!61233 () Bool)

(assert (=> b!40022 m!61233))

(declare-fun m!61235 () Bool)

(assert (=> b!40022 m!61235))

(declare-fun m!61237 () Bool)

(assert (=> d!11812 m!61237))

(declare-fun m!61239 () Bool)

(assert (=> d!11812 m!61239))

(assert (=> d!11812 m!60917))

(declare-fun m!61241 () Bool)

(assert (=> b!40019 m!61241))

(assert (=> b!40019 m!61241))

(declare-fun m!61243 () Bool)

(assert (=> b!40019 m!61243))

(declare-fun m!61245 () Bool)

(assert (=> b!40020 m!61245))

(assert (=> b!40020 m!60463))

(declare-fun m!61247 () Bool)

(assert (=> b!40023 m!61247))

(assert (=> b!40023 m!61245))

(declare-fun m!61249 () Bool)

(assert (=> b!40016 m!61249))

(assert (=> b!40016 m!61229))

(declare-fun m!61251 () Bool)

(assert (=> b!40018 m!61251))

(declare-fun m!61253 () Bool)

(assert (=> b!40017 m!61253))

(assert (=> b!39612 d!11812))

(declare-fun d!11890 () Bool)

(assert (=> d!11890 (= (tail!190 lt!60047) (t!1223 lt!60047))))

(assert (=> b!39622 d!11890))

(declare-fun d!11892 () Bool)

(declare-fun e!26315 () Bool)

(assert (=> d!11892 e!26315))

(declare-fun res!33995 () Bool)

(assert (=> d!11892 (=> (not res!33995) (not e!26315))))

(declare-fun lt!61069 () (_ BitVec 64))

(assert (=> d!11892 (= res!33995 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!61069 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!61069) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!11892 (= lt!61069 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!61068 () Unit!2815)

(declare-fun choose!42 (BitStream!1544 BitStream!1544 BitStream!1544 BitStream!1544 (_ BitVec 64) List!473) Unit!2815)

(assert (=> d!11892 (= lt!61068 (choose!42 (_2!2001 lt!60062) (_2!2001 lt!60062) (_1!2000 lt!60067) (_1!2000 lt!60066) (bvsub to!314 i!635) lt!60047))))

(assert (=> d!11892 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!11892 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2001 lt!60062) (_2!2001 lt!60062) (_1!2000 lt!60067) (_1!2000 lt!60066) (bvsub to!314 i!635) lt!60047) lt!61068)))

(declare-fun b!40026 () Bool)

(assert (=> b!40026 (= e!26315 (= (bitStreamReadBitsIntoList!0 (_2!2001 lt!60062) (_1!2000 lt!60066) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!190 lt!60047)))))

(assert (= (and d!11892 res!33995) b!40026))

(declare-fun m!61255 () Bool)

(assert (=> d!11892 m!61255))

(declare-fun m!61257 () Bool)

(assert (=> b!40026 m!61257))

(assert (=> b!40026 m!60385))

(assert (=> b!39622 d!11892))

(declare-fun d!11894 () Bool)

(declare-fun e!26316 () Bool)

(assert (=> d!11894 e!26316))

(declare-fun res!33996 () Bool)

(assert (=> d!11894 (=> (not res!33996) (not e!26316))))

(declare-fun lt!61075 () (_ BitVec 64))

(declare-fun lt!61074 () (_ BitVec 64))

(declare-fun lt!61070 () (_ BitVec 64))

(assert (=> d!11894 (= res!33996 (= lt!61074 (bvsub lt!61075 lt!61070)))))

(assert (=> d!11894 (or (= (bvand lt!61075 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!61070 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!61075 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!61075 lt!61070) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!11894 (= lt!61070 (remainingBits!0 ((_ sign_extend 32) (size!897 (buf!1225 (_2!2001 lt!60062)))) ((_ sign_extend 32) (currentByte!2637 (_2!2001 lt!60062))) ((_ sign_extend 32) (currentBit!2632 (_2!2001 lt!60062)))))))

(declare-fun lt!61072 () (_ BitVec 64))

(declare-fun lt!61073 () (_ BitVec 64))

(assert (=> d!11894 (= lt!61075 (bvmul lt!61072 lt!61073))))

(assert (=> d!11894 (or (= lt!61072 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!61073 (bvsdiv (bvmul lt!61072 lt!61073) lt!61072)))))

(assert (=> d!11894 (= lt!61073 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!11894 (= lt!61072 ((_ sign_extend 32) (size!897 (buf!1225 (_2!2001 lt!60062)))))))

(assert (=> d!11894 (= lt!61074 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2637 (_2!2001 lt!60062))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2632 (_2!2001 lt!60062)))))))

(assert (=> d!11894 (invariant!0 (currentBit!2632 (_2!2001 lt!60062)) (currentByte!2637 (_2!2001 lt!60062)) (size!897 (buf!1225 (_2!2001 lt!60062))))))

(assert (=> d!11894 (= (bitIndex!0 (size!897 (buf!1225 (_2!2001 lt!60062))) (currentByte!2637 (_2!2001 lt!60062)) (currentBit!2632 (_2!2001 lt!60062))) lt!61074)))

(declare-fun b!40027 () Bool)

(declare-fun res!33997 () Bool)

(assert (=> b!40027 (=> (not res!33997) (not e!26316))))

(assert (=> b!40027 (= res!33997 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!61074))))

(declare-fun b!40028 () Bool)

(declare-fun lt!61071 () (_ BitVec 64))

(assert (=> b!40028 (= e!26316 (bvsle lt!61074 (bvmul lt!61071 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!40028 (or (= lt!61071 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!61071 #b0000000000000000000000000000000000000000000000000000000000001000) lt!61071)))))

(assert (=> b!40028 (= lt!61071 ((_ sign_extend 32) (size!897 (buf!1225 (_2!2001 lt!60062)))))))

(assert (= (and d!11894 res!33996) b!40027))

(assert (= (and b!40027 res!33997) b!40028))

(declare-fun m!61259 () Bool)

(assert (=> d!11894 m!61259))

(assert (=> d!11894 m!60427))

(assert (=> b!39611 d!11894))

(declare-fun d!11896 () Bool)

(assert (=> d!11896 (= (head!310 (byteArrayBitContentToList!0 (_2!2001 lt!60060) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!588 (byteArrayBitContentToList!0 (_2!2001 lt!60060) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!39624 d!11896))

(declare-fun d!11898 () Bool)

(declare-fun c!2749 () Bool)

(assert (=> d!11898 (= c!2749 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!26317 () List!473)

(assert (=> d!11898 (= (byteArrayBitContentToList!0 (_2!2001 lt!60060) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!26317)))

(declare-fun b!40029 () Bool)

(assert (=> b!40029 (= e!26317 Nil!470)))

(declare-fun b!40030 () Bool)

(assert (=> b!40030 (= e!26317 (Cons!469 (not (= (bvand ((_ sign_extend 24) (select (arr!1393 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2001 lt!60060) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!11898 c!2749) b!40029))

(assert (= (and d!11898 (not c!2749)) b!40030))

(assert (=> b!40030 m!60367))

(assert (=> b!40030 m!60917))

(declare-fun m!61261 () Bool)

(assert (=> b!40030 m!61261))

(assert (=> b!39624 d!11898))

(declare-fun d!11900 () Bool)

(assert (=> d!11900 (= (head!310 (bitStreamReadBitsIntoList!0 (_2!2001 lt!60060) (_1!2000 lt!60059) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!588 (bitStreamReadBitsIntoList!0 (_2!2001 lt!60060) (_1!2000 lt!60059) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!39624 d!11900))

(declare-fun d!11902 () Bool)

(declare-fun e!26318 () Bool)

(assert (=> d!11902 e!26318))

(declare-fun c!2750 () Bool)

(assert (=> d!11902 (= c!2750 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!61078 () List!473)

(declare-fun e!26319 () tuple2!3838)

(assert (=> d!11902 (= lt!61078 (_1!2006 e!26319))))

(declare-fun c!2751 () Bool)

(assert (=> d!11902 (= c!2751 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!11902 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!11902 (= (bitStreamReadBitsIntoList!0 (_2!2001 lt!60060) (_1!2000 lt!60059) #b0000000000000000000000000000000000000000000000000000000000000001) lt!61078)))

(declare-fun lt!61077 () (_ BitVec 64))

(declare-fun lt!61076 () tuple2!3840)

(declare-fun b!40032 () Bool)

(assert (=> b!40032 (= e!26319 (tuple2!3839 (Cons!469 (_1!2007 lt!61076) (bitStreamReadBitsIntoList!0 (_2!2001 lt!60060) (_2!2007 lt!61076) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!61077))) (_2!2007 lt!61076)))))

(assert (=> b!40032 (= lt!61076 (readBit!0 (_1!2000 lt!60059)))))

(assert (=> b!40032 (= lt!61077 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!40031 () Bool)

(assert (=> b!40031 (= e!26319 (tuple2!3839 Nil!470 (_1!2000 lt!60059)))))

(declare-fun b!40034 () Bool)

(assert (=> b!40034 (= e!26318 (> (length!199 lt!61078) 0))))

(declare-fun b!40033 () Bool)

(assert (=> b!40033 (= e!26318 (isEmpty!112 lt!61078))))

(assert (= (and d!11902 c!2751) b!40031))

(assert (= (and d!11902 (not c!2751)) b!40032))

(assert (= (and d!11902 c!2750) b!40033))

(assert (= (and d!11902 (not c!2750)) b!40034))

(declare-fun m!61263 () Bool)

(assert (=> b!40032 m!61263))

(declare-fun m!61265 () Bool)

(assert (=> b!40032 m!61265))

(declare-fun m!61267 () Bool)

(assert (=> b!40034 m!61267))

(declare-fun m!61269 () Bool)

(assert (=> b!40033 m!61269))

(assert (=> b!39624 d!11902))

(declare-fun d!11904 () Bool)

(declare-fun size!900 (List!473) Int)

(assert (=> d!11904 (= (length!199 lt!60047) (size!900 lt!60047))))

(declare-fun bs!3152 () Bool)

(assert (= bs!3152 d!11904))

(declare-fun m!61271 () Bool)

(assert (=> bs!3152 m!61271))

(assert (=> b!39613 d!11904))

(declare-fun d!11906 () Bool)

(assert (=> d!11906 (= (bitAt!0 (buf!1225 (_2!2001 lt!60062)) lt!60061) (not (= (bvand ((_ sign_extend 24) (select (arr!1393 (buf!1225 (_2!2001 lt!60062))) ((_ extract 31 0) (bvsdiv lt!60061 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!60061 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3153 () Bool)

(assert (= bs!3153 d!11906))

(declare-fun m!61273 () Bool)

(assert (=> bs!3153 m!61273))

(assert (=> bs!3153 m!60915))

(assert (=> b!39623 d!11906))

(declare-fun d!11908 () Bool)

(assert (=> d!11908 (= (bitAt!0 (buf!1225 (_2!2001 lt!60060)) lt!60061) (bitAt!0 (buf!1225 (_2!2001 lt!60062)) lt!60061))))

(declare-fun lt!61081 () Unit!2815)

(declare-fun choose!31 (array!1989 array!1989 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2815)

(assert (=> d!11908 (= lt!61081 (choose!31 (buf!1225 (_2!2001 lt!60060)) (buf!1225 (_2!2001 lt!60062)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!60061 lt!60056))))

(assert (=> d!11908 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!60056))))

(assert (=> d!11908 (= (arrayBitRangesEqImpliesEq!0 (buf!1225 (_2!2001 lt!60060)) (buf!1225 (_2!2001 lt!60062)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!60061 lt!60056) lt!61081)))

(declare-fun bs!3154 () Bool)

(assert (= bs!3154 d!11908))

(assert (=> bs!3154 m!60453))

(assert (=> bs!3154 m!60413))

(declare-fun m!61275 () Bool)

(assert (=> bs!3154 m!61275))

(assert (=> b!39623 d!11908))

(declare-fun d!11910 () Bool)

(assert (=> d!11910 (= (array_inv!825 (buf!1225 thiss!1379)) (bvsge (size!897 (buf!1225 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!39625 d!11910))

(declare-fun d!11912 () Bool)

(declare-fun e!26320 () Bool)

(assert (=> d!11912 e!26320))

(declare-fun res!33998 () Bool)

(assert (=> d!11912 (=> (not res!33998) (not e!26320))))

(declare-fun lt!61086 () (_ BitVec 64))

(declare-fun lt!61087 () (_ BitVec 64))

(declare-fun lt!61082 () (_ BitVec 64))

(assert (=> d!11912 (= res!33998 (= lt!61086 (bvsub lt!61087 lt!61082)))))

(assert (=> d!11912 (or (= (bvand lt!61087 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!61082 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!61087 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!61087 lt!61082) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!11912 (= lt!61082 (remainingBits!0 ((_ sign_extend 32) (size!897 (buf!1225 (_2!2001 lt!60060)))) ((_ sign_extend 32) (currentByte!2637 (_2!2001 lt!60060))) ((_ sign_extend 32) (currentBit!2632 (_2!2001 lt!60060)))))))

(declare-fun lt!61084 () (_ BitVec 64))

(declare-fun lt!61085 () (_ BitVec 64))

(assert (=> d!11912 (= lt!61087 (bvmul lt!61084 lt!61085))))

(assert (=> d!11912 (or (= lt!61084 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!61085 (bvsdiv (bvmul lt!61084 lt!61085) lt!61084)))))

(assert (=> d!11912 (= lt!61085 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!11912 (= lt!61084 ((_ sign_extend 32) (size!897 (buf!1225 (_2!2001 lt!60060)))))))

(assert (=> d!11912 (= lt!61086 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2637 (_2!2001 lt!60060))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2632 (_2!2001 lt!60060)))))))

(assert (=> d!11912 (invariant!0 (currentBit!2632 (_2!2001 lt!60060)) (currentByte!2637 (_2!2001 lt!60060)) (size!897 (buf!1225 (_2!2001 lt!60060))))))

(assert (=> d!11912 (= (bitIndex!0 (size!897 (buf!1225 (_2!2001 lt!60060))) (currentByte!2637 (_2!2001 lt!60060)) (currentBit!2632 (_2!2001 lt!60060))) lt!61086)))

(declare-fun b!40035 () Bool)

(declare-fun res!33999 () Bool)

(assert (=> b!40035 (=> (not res!33999) (not e!26320))))

(assert (=> b!40035 (= res!33999 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!61086))))

(declare-fun b!40036 () Bool)

(declare-fun lt!61083 () (_ BitVec 64))

(assert (=> b!40036 (= e!26320 (bvsle lt!61086 (bvmul lt!61083 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!40036 (or (= lt!61083 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!61083 #b0000000000000000000000000000000000000000000000000000000000001000) lt!61083)))))

(assert (=> b!40036 (= lt!61083 ((_ sign_extend 32) (size!897 (buf!1225 (_2!2001 lt!60060)))))))

(assert (= (and d!11912 res!33998) b!40035))

(assert (= (and b!40035 res!33999) b!40036))

(assert (=> d!11912 m!60933))

(assert (=> d!11912 m!60383))

(assert (=> b!39614 d!11912))

(declare-fun d!11914 () Bool)

(assert (=> d!11914 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!897 (buf!1225 thiss!1379))) ((_ sign_extend 32) (currentByte!2637 thiss!1379)) ((_ sign_extend 32) (currentBit!2632 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!897 (buf!1225 thiss!1379))) ((_ sign_extend 32) (currentByte!2637 thiss!1379)) ((_ sign_extend 32) (currentBit!2632 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3155 () Bool)

(assert (= bs!3155 d!11914))

(assert (=> bs!3155 m!60927))

(assert (=> b!39616 d!11914))

(declare-fun d!11916 () Bool)

(assert (=> d!11916 (= (invariant!0 (currentBit!2632 (_2!2001 lt!60060)) (currentByte!2637 (_2!2001 lt!60060)) (size!897 (buf!1225 (_2!2001 lt!60060)))) (and (bvsge (currentBit!2632 (_2!2001 lt!60060)) #b00000000000000000000000000000000) (bvslt (currentBit!2632 (_2!2001 lt!60060)) #b00000000000000000000000000001000) (bvsge (currentByte!2637 (_2!2001 lt!60060)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2637 (_2!2001 lt!60060)) (size!897 (buf!1225 (_2!2001 lt!60060)))) (and (= (currentBit!2632 (_2!2001 lt!60060)) #b00000000000000000000000000000000) (= (currentByte!2637 (_2!2001 lt!60060)) (size!897 (buf!1225 (_2!2001 lt!60060))))))))))

(assert (=> b!39626 d!11916))

(declare-fun d!11918 () Bool)

(assert (=> d!11918 (= (bitAt!0 (buf!1225 (_1!2000 lt!60066)) lt!60061) (not (= (bvand ((_ sign_extend 24) (select (arr!1393 (buf!1225 (_1!2000 lt!60066))) ((_ extract 31 0) (bvsdiv lt!60061 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!60061 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3156 () Bool)

(assert (= bs!3156 d!11918))

(declare-fun m!61277 () Bool)

(assert (=> bs!3156 m!61277))

(assert (=> bs!3156 m!60915))

(assert (=> b!39615 d!11918))

(declare-fun d!11920 () Bool)

(assert (=> d!11920 (= (bitAt!0 (buf!1225 (_1!2000 lt!60067)) lt!60061) (not (= (bvand ((_ sign_extend 24) (select (arr!1393 (buf!1225 (_1!2000 lt!60067))) ((_ extract 31 0) (bvsdiv lt!60061 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!60061 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3157 () Bool)

(assert (= bs!3157 d!11920))

(declare-fun m!61279 () Bool)

(assert (=> bs!3157 m!61279))

(assert (=> bs!3157 m!60915))

(assert (=> b!39615 d!11920))

(push 1)

(assert (not b!39728))

(assert (not d!11810))

(assert (not b!39881))

(assert (not d!11720))

(assert (not b!39796))

(assert (not b!39798))

(assert (not b!39729))

(assert (not d!11798))

(assert (not d!11778))

(assert (not b!39878))

(assert (not b!39787))

(assert (not b!40023))

(assert (not b!39872))

(assert (not bm!481))

(assert (not b!39790))

(assert (not b!39806))

(assert (not b!40021))

(assert (not d!11750))

(assert (not d!11746))

(assert (not b!39875))

(assert (not d!11748))

(assert (not b!39887))

(assert (not b!39910))

(assert (not b!40030))

(assert (not b!39888))

(assert (not d!11800))

(assert (not d!11776))

(assert (not d!11904))

(assert (not b!39791))

(assert (not b!39808))

(assert (not d!11894))

(assert (not b!40034))

(assert (not b!40026))

(assert (not b!39795))

(assert (not d!11812))

(assert (not d!11744))

(assert (not b!39732))

(assert (not b!39874))

(assert (not d!11742))

(assert (not b!39899))

(assert (not b!39797))

(assert (not b!40020))

(assert (not b!40022))

(assert (not b!39879))

(assert (not b!39890))

(assert (not b!40033))

(assert (not b!40018))

(assert (not d!11754))

(assert (not d!11914))

(assert (not b!39727))

(assert (not b!40016))

(assert (not d!11908))

(assert (not b!40017))

(assert (not b!39793))

(assert (not b!40019))

(assert (not b!39786))

(assert (not d!11790))

(assert (not d!11804))

(assert (not b!39785))

(assert (not b!39792))

(assert (not d!11774))

(assert (not d!11714))

(assert (not b!39873))

(assert (not d!11794))

(assert (not d!11892))

(assert (not b!39788))

(assert (not b!39731))

(assert (not b!39876))

(assert (not d!11912))

(assert (not b!40032))

(assert (not b!39733))

(assert (not d!11808))

(assert (not b!39897))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

