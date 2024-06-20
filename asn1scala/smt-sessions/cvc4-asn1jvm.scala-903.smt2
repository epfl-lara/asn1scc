; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25496 () Bool)

(assert start!25496)

(declare-fun b!129129 () Bool)

(declare-fun res!106918 () Bool)

(declare-fun e!85596 () Bool)

(assert (=> b!129129 (=> (not res!106918) (not e!85596))))

(declare-datatypes ((array!5981 0))(
  ( (array!5982 (arr!3323 (Array (_ BitVec 32) (_ BitVec 8))) (size!2706 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4676 0))(
  ( (BitStream!4677 (buf!3064 array!5981) (currentByte!5825 (_ BitVec 32)) (currentBit!5820 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4676)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129129 (= res!106918 (invariant!0 (currentBit!5820 thiss!1634) (currentByte!5825 thiss!1634) (size!2706 (buf!3064 thiss!1634))))))

(declare-fun b!129130 () Bool)

(declare-fun e!85591 () Bool)

(declare-fun e!85598 () Bool)

(assert (=> b!129130 (= e!85591 (not e!85598))))

(declare-fun res!106914 () Bool)

(assert (=> b!129130 (=> res!106914 e!85598)))

(declare-datatypes ((tuple2!11006 0))(
  ( (tuple2!11007 (_1!5800 BitStream!4676) (_2!5800 array!5981)) )
))
(declare-fun lt!199790 () tuple2!11006)

(declare-fun arr!237 () array!5981)

(declare-datatypes ((tuple2!11008 0))(
  ( (tuple2!11009 (_1!5801 BitStream!4676) (_2!5801 BitStream!4676)) )
))
(declare-fun lt!199796 () tuple2!11008)

(assert (=> b!129130 (= res!106914 (or (not (= (size!2706 (_2!5800 lt!199790)) (size!2706 arr!237))) (not (= (_1!5800 lt!199790) (_2!5801 lt!199796)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!4676 array!5981 (_ BitVec 32) (_ BitVec 32)) tuple2!11006)

(assert (=> b!129130 (= lt!199790 (readByteArrayLoopPure!0 (_1!5801 lt!199796) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((Unit!8017 0))(
  ( (Unit!8018) )
))
(declare-datatypes ((tuple2!11010 0))(
  ( (tuple2!11011 (_1!5802 Unit!8017) (_2!5802 BitStream!4676)) )
))
(declare-fun lt!199793 () tuple2!11010)

(declare-fun lt!199799 () tuple2!11010)

(declare-fun lt!199797 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!129130 (validate_offset_bits!1 ((_ sign_extend 32) (size!2706 (buf!3064 (_2!5802 lt!199793)))) ((_ sign_extend 32) (currentByte!5825 (_2!5802 lt!199799))) ((_ sign_extend 32) (currentBit!5820 (_2!5802 lt!199799))) lt!199797)))

(declare-fun lt!199791 () Unit!8017)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4676 array!5981 (_ BitVec 64)) Unit!8017)

(assert (=> b!129130 (= lt!199791 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5802 lt!199799) (buf!3064 (_2!5802 lt!199793)) lt!199797))))

(declare-fun reader!0 (BitStream!4676 BitStream!4676) tuple2!11008)

(assert (=> b!129130 (= lt!199796 (reader!0 (_2!5802 lt!199799) (_2!5802 lt!199793)))))

(declare-fun b!129131 () Bool)

(declare-fun e!85597 () Bool)

(declare-fun array_inv!2495 (array!5981) Bool)

(assert (=> b!129131 (= e!85597 (array_inv!2495 (buf!3064 thiss!1634)))))

(declare-fun res!106916 () Bool)

(assert (=> start!25496 (=> (not res!106916) (not e!85596))))

(assert (=> start!25496 (= res!106916 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2706 arr!237))))))

(assert (=> start!25496 e!85596))

(assert (=> start!25496 true))

(assert (=> start!25496 (array_inv!2495 arr!237)))

(declare-fun inv!12 (BitStream!4676) Bool)

(assert (=> start!25496 (and (inv!12 thiss!1634) e!85597)))

(declare-fun b!129132 () Bool)

(declare-fun res!106912 () Bool)

(declare-fun e!85593 () Bool)

(assert (=> b!129132 (=> (not res!106912) (not e!85593))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!129132 (= res!106912 (= (bitIndex!0 (size!2706 (buf!3064 (_2!5802 lt!199799))) (currentByte!5825 (_2!5802 lt!199799)) (currentBit!5820 (_2!5802 lt!199799))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2706 (buf!3064 thiss!1634)) (currentByte!5825 thiss!1634) (currentBit!5820 thiss!1634)))))))

(declare-fun b!129133 () Bool)

(declare-fun arrayRangesEq!109 (array!5981 array!5981 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129133 (= e!85598 (not (arrayRangesEq!109 arr!237 (_2!5800 lt!199790) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!129134 () Bool)

(declare-fun res!106915 () Bool)

(assert (=> b!129134 (=> (not res!106915) (not e!85591))))

(declare-fun isPrefixOf!0 (BitStream!4676 BitStream!4676) Bool)

(assert (=> b!129134 (= res!106915 (isPrefixOf!0 (_2!5802 lt!199799) (_2!5802 lt!199793)))))

(declare-fun b!129135 () Bool)

(assert (=> b!129135 (= e!85596 (not true))))

(declare-fun lt!199798 () Bool)

(assert (=> b!129135 (= lt!199798 (isPrefixOf!0 (_2!5802 lt!199799) (_2!5802 lt!199793)))))

(declare-fun lt!199789 () Bool)

(assert (=> b!129135 (= lt!199789 (isPrefixOf!0 thiss!1634 (_2!5802 lt!199799)))))

(declare-fun e!85595 () Bool)

(assert (=> b!129135 e!85595))

(declare-fun res!106908 () Bool)

(assert (=> b!129135 (=> (not res!106908) (not e!85595))))

(assert (=> b!129135 (= res!106908 (= (size!2706 (buf!3064 (_2!5802 lt!199799))) (size!2706 (buf!3064 (_2!5802 lt!199793)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4676 array!5981 (_ BitVec 32) (_ BitVec 32)) tuple2!11010)

(assert (=> b!129135 (= lt!199793 (appendByteArrayLoop!0 (_2!5802 lt!199799) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!129135 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2706 (buf!3064 (_2!5802 lt!199799)))) ((_ sign_extend 32) (currentByte!5825 (_2!5802 lt!199799))) ((_ sign_extend 32) (currentBit!5820 (_2!5802 lt!199799))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!199792 () Unit!8017)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4676 BitStream!4676 (_ BitVec 64) (_ BitVec 32)) Unit!8017)

(assert (=> b!129135 (= lt!199792 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5802 lt!199799) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!129135 e!85593))

(declare-fun res!106917 () Bool)

(assert (=> b!129135 (=> (not res!106917) (not e!85593))))

(assert (=> b!129135 (= res!106917 (= (size!2706 (buf!3064 thiss!1634)) (size!2706 (buf!3064 (_2!5802 lt!199799)))))))

(declare-fun appendByte!0 (BitStream!4676 (_ BitVec 8)) tuple2!11010)

(assert (=> b!129135 (= lt!199799 (appendByte!0 thiss!1634 (select (arr!3323 arr!237) from!447)))))

(declare-fun b!129136 () Bool)

(assert (=> b!129136 (= e!85595 e!85591)))

(declare-fun res!106911 () Bool)

(assert (=> b!129136 (=> (not res!106911) (not e!85591))))

(assert (=> b!129136 (= res!106911 (= (bitIndex!0 (size!2706 (buf!3064 (_2!5802 lt!199793))) (currentByte!5825 (_2!5802 lt!199793)) (currentBit!5820 (_2!5802 lt!199793))) (bvadd (bitIndex!0 (size!2706 (buf!3064 (_2!5802 lt!199799))) (currentByte!5825 (_2!5802 lt!199799)) (currentBit!5820 (_2!5802 lt!199799))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!199797))))))

(assert (=> b!129136 (= lt!199797 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!129137 () Bool)

(declare-fun res!106910 () Bool)

(assert (=> b!129137 (=> (not res!106910) (not e!85596))))

(assert (=> b!129137 (= res!106910 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2706 (buf!3064 thiss!1634))) ((_ sign_extend 32) (currentByte!5825 thiss!1634)) ((_ sign_extend 32) (currentBit!5820 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!129138 () Bool)

(declare-fun res!106913 () Bool)

(assert (=> b!129138 (=> (not res!106913) (not e!85593))))

(assert (=> b!129138 (= res!106913 (isPrefixOf!0 thiss!1634 (_2!5802 lt!199799)))))

(declare-fun lt!199794 () tuple2!11008)

(declare-fun b!129139 () Bool)

(declare-datatypes ((tuple2!11012 0))(
  ( (tuple2!11013 (_1!5803 BitStream!4676) (_2!5803 (_ BitVec 8))) )
))
(declare-fun lt!199795 () tuple2!11012)

(assert (=> b!129139 (= e!85593 (and (= (_2!5803 lt!199795) (select (arr!3323 arr!237) from!447)) (= (_1!5803 lt!199795) (_2!5801 lt!199794))))))

(declare-fun readBytePure!0 (BitStream!4676) tuple2!11012)

(assert (=> b!129139 (= lt!199795 (readBytePure!0 (_1!5801 lt!199794)))))

(assert (=> b!129139 (= lt!199794 (reader!0 thiss!1634 (_2!5802 lt!199799)))))

(declare-fun b!129140 () Bool)

(declare-fun res!106909 () Bool)

(assert (=> b!129140 (=> (not res!106909) (not e!85596))))

(assert (=> b!129140 (= res!106909 (bvslt from!447 to!404))))

(assert (= (and start!25496 res!106916) b!129137))

(assert (= (and b!129137 res!106910) b!129140))

(assert (= (and b!129140 res!106909) b!129129))

(assert (= (and b!129129 res!106918) b!129135))

(assert (= (and b!129135 res!106917) b!129132))

(assert (= (and b!129132 res!106912) b!129138))

(assert (= (and b!129138 res!106913) b!129139))

(assert (= (and b!129135 res!106908) b!129136))

(assert (= (and b!129136 res!106911) b!129134))

(assert (= (and b!129134 res!106915) b!129130))

(assert (= (and b!129130 (not res!106914)) b!129133))

(assert (= start!25496 b!129131))

(declare-fun m!194909 () Bool)

(assert (=> b!129134 m!194909))

(declare-fun m!194911 () Bool)

(assert (=> b!129130 m!194911))

(declare-fun m!194913 () Bool)

(assert (=> b!129130 m!194913))

(declare-fun m!194915 () Bool)

(assert (=> b!129130 m!194915))

(declare-fun m!194917 () Bool)

(assert (=> b!129130 m!194917))

(declare-fun m!194919 () Bool)

(assert (=> b!129133 m!194919))

(declare-fun m!194921 () Bool)

(assert (=> b!129137 m!194921))

(declare-fun m!194923 () Bool)

(assert (=> b!129129 m!194923))

(declare-fun m!194925 () Bool)

(assert (=> b!129136 m!194925))

(declare-fun m!194927 () Bool)

(assert (=> b!129136 m!194927))

(declare-fun m!194929 () Bool)

(assert (=> start!25496 m!194929))

(declare-fun m!194931 () Bool)

(assert (=> start!25496 m!194931))

(assert (=> b!129135 m!194909))

(declare-fun m!194933 () Bool)

(assert (=> b!129135 m!194933))

(declare-fun m!194935 () Bool)

(assert (=> b!129135 m!194935))

(declare-fun m!194937 () Bool)

(assert (=> b!129135 m!194937))

(declare-fun m!194939 () Bool)

(assert (=> b!129135 m!194939))

(assert (=> b!129135 m!194939))

(declare-fun m!194941 () Bool)

(assert (=> b!129135 m!194941))

(declare-fun m!194943 () Bool)

(assert (=> b!129135 m!194943))

(assert (=> b!129138 m!194937))

(declare-fun m!194945 () Bool)

(assert (=> b!129131 m!194945))

(assert (=> b!129139 m!194939))

(declare-fun m!194947 () Bool)

(assert (=> b!129139 m!194947))

(declare-fun m!194949 () Bool)

(assert (=> b!129139 m!194949))

(assert (=> b!129132 m!194927))

(declare-fun m!194951 () Bool)

(assert (=> b!129132 m!194951))

(push 1)

(assert (not b!129133))

(assert (not b!129131))

(assert (not b!129139))

(assert (not start!25496))

(assert (not b!129136))

(assert (not b!129134))

(assert (not b!129138))

(assert (not b!129137))

(assert (not b!129129))

(assert (not b!129135))

(assert (not b!129132))

(assert (not b!129130))

(check-sat)

