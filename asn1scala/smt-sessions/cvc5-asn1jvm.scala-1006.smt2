; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28542 () Bool)

(assert start!28542)

(declare-fun res!123731 () Bool)

(declare-fun e!98609 () Bool)

(assert (=> start!28542 (=> (not res!123731) (not e!98609))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6659 0))(
  ( (array!6660 (arr!3782 (Array (_ BitVec 32) (_ BitVec 8))) (size!3013 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6659)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!28542 (= res!123731 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3013 arr!237))))))

(assert (=> start!28542 e!98609))

(assert (=> start!28542 true))

(declare-fun array_inv!2802 (array!6659) Bool)

(assert (=> start!28542 (array_inv!2802 arr!237)))

(declare-datatypes ((BitStream!5284 0))(
  ( (BitStream!5285 (buf!3478 array!6659) (currentByte!6386 (_ BitVec 32)) (currentBit!6381 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5284)

(declare-fun e!98606 () Bool)

(declare-fun inv!12 (BitStream!5284) Bool)

(assert (=> start!28542 (and (inv!12 thiss!1634) e!98606)))

(declare-fun b!147826 () Bool)

(declare-fun e!98610 () Bool)

(declare-datatypes ((Unit!9314 0))(
  ( (Unit!9315) )
))
(declare-datatypes ((tuple2!13172 0))(
  ( (tuple2!13173 (_1!6945 Unit!9314) (_2!6945 BitStream!5284)) )
))
(declare-fun lt!230110 () tuple2!13172)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!147826 (= e!98610 (invariant!0 (currentBit!6381 thiss!1634) (currentByte!6386 thiss!1634) (size!3013 (buf!3478 (_2!6945 lt!230110)))))))

(declare-fun b!147827 () Bool)

(declare-fun e!98614 () Bool)

(assert (=> b!147827 (= e!98609 (not e!98614))))

(declare-fun res!123726 () Bool)

(assert (=> b!147827 (=> res!123726 e!98614)))

(declare-datatypes ((tuple2!13174 0))(
  ( (tuple2!13175 (_1!6946 BitStream!5284) (_2!6946 array!6659)) )
))
(declare-fun lt!230106 () tuple2!13174)

(declare-fun lt!230098 () tuple2!13174)

(declare-fun arrayRangesEq!329 (array!6659 array!6659 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!147827 (= res!123726 (not (arrayRangesEq!329 (_2!6946 lt!230098) (_2!6946 lt!230106) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!230108 () tuple2!13174)

(assert (=> b!147827 (arrayRangesEq!329 (_2!6946 lt!230098) (_2!6946 lt!230108) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!230122 () Unit!9314)

(declare-datatypes ((tuple2!13176 0))(
  ( (tuple2!13177 (_1!6947 BitStream!5284) (_2!6947 BitStream!5284)) )
))
(declare-fun lt!230123 () tuple2!13176)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5284 array!6659 (_ BitVec 32) (_ BitVec 32)) Unit!9314)

(assert (=> b!147827 (= lt!230122 (readByteArrayLoopArrayPrefixLemma!0 (_1!6947 lt!230123) arr!237 from!447 to!404))))

(declare-fun lt!230117 () array!6659)

(declare-fun readByteArrayLoopPure!0 (BitStream!5284 array!6659 (_ BitVec 32) (_ BitVec 32)) tuple2!13174)

(declare-fun withMovedByteIndex!0 (BitStream!5284 (_ BitVec 32)) BitStream!5284)

(assert (=> b!147827 (= lt!230108 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6947 lt!230123) #b00000000000000000000000000000001) lt!230117 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!230103 () tuple2!13176)

(assert (=> b!147827 (= lt!230106 (readByteArrayLoopPure!0 (_1!6947 lt!230103) lt!230117 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((tuple2!13178 0))(
  ( (tuple2!13179 (_1!6948 BitStream!5284) (_2!6948 (_ BitVec 8))) )
))
(declare-fun lt!230115 () tuple2!13178)

(assert (=> b!147827 (= lt!230117 (array!6660 (store (arr!3782 arr!237) from!447 (_2!6948 lt!230115)) (size!3013 arr!237)))))

(declare-fun lt!230100 () tuple2!13172)

(declare-fun lt!230107 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!147827 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3013 (buf!3478 (_2!6945 lt!230100)))) ((_ sign_extend 32) (currentByte!6386 (_2!6945 lt!230110))) ((_ sign_extend 32) (currentBit!6381 (_2!6945 lt!230110))) lt!230107)))

(declare-fun lt!230120 () Unit!9314)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5284 array!6659 (_ BitVec 32)) Unit!9314)

(assert (=> b!147827 (= lt!230120 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6945 lt!230110) (buf!3478 (_2!6945 lt!230100)) lt!230107))))

(assert (=> b!147827 (= (_1!6946 lt!230098) (_2!6947 lt!230123))))

(assert (=> b!147827 (= lt!230098 (readByteArrayLoopPure!0 (_1!6947 lt!230123) arr!237 from!447 to!404))))

(assert (=> b!147827 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3013 (buf!3478 (_2!6945 lt!230100)))) ((_ sign_extend 32) (currentByte!6386 thiss!1634)) ((_ sign_extend 32) (currentBit!6381 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!230121 () Unit!9314)

(assert (=> b!147827 (= lt!230121 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3478 (_2!6945 lt!230100)) (bvsub to!404 from!447)))))

(assert (=> b!147827 (= (_2!6948 lt!230115) (select (arr!3782 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!5284) tuple2!13178)

(assert (=> b!147827 (= lt!230115 (readBytePure!0 (_1!6947 lt!230123)))))

(declare-fun reader!0 (BitStream!5284 BitStream!5284) tuple2!13176)

(assert (=> b!147827 (= lt!230103 (reader!0 (_2!6945 lt!230110) (_2!6945 lt!230100)))))

(assert (=> b!147827 (= lt!230123 (reader!0 thiss!1634 (_2!6945 lt!230100)))))

(declare-fun e!98613 () Bool)

(assert (=> b!147827 e!98613))

(declare-fun res!123723 () Bool)

(assert (=> b!147827 (=> (not res!123723) (not e!98613))))

(declare-fun lt!230112 () tuple2!13178)

(declare-fun lt!230116 () tuple2!13178)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!147827 (= res!123723 (= (bitIndex!0 (size!3013 (buf!3478 (_1!6948 lt!230112))) (currentByte!6386 (_1!6948 lt!230112)) (currentBit!6381 (_1!6948 lt!230112))) (bitIndex!0 (size!3013 (buf!3478 (_1!6948 lt!230116))) (currentByte!6386 (_1!6948 lt!230116)) (currentBit!6381 (_1!6948 lt!230116)))))))

(declare-fun lt!230104 () Unit!9314)

(declare-fun lt!230101 () BitStream!5284)

(declare-fun readBytePrefixLemma!0 (BitStream!5284 BitStream!5284) Unit!9314)

(assert (=> b!147827 (= lt!230104 (readBytePrefixLemma!0 lt!230101 (_2!6945 lt!230100)))))

(assert (=> b!147827 (= lt!230116 (readBytePure!0 (BitStream!5285 (buf!3478 (_2!6945 lt!230100)) (currentByte!6386 thiss!1634) (currentBit!6381 thiss!1634))))))

(assert (=> b!147827 (= lt!230112 (readBytePure!0 lt!230101))))

(assert (=> b!147827 (= lt!230101 (BitStream!5285 (buf!3478 (_2!6945 lt!230110)) (currentByte!6386 thiss!1634) (currentBit!6381 thiss!1634)))))

(assert (=> b!147827 e!98610))

(declare-fun res!123718 () Bool)

(assert (=> b!147827 (=> (not res!123718) (not e!98610))))

(declare-fun isPrefixOf!0 (BitStream!5284 BitStream!5284) Bool)

(assert (=> b!147827 (= res!123718 (isPrefixOf!0 thiss!1634 (_2!6945 lt!230100)))))

(declare-fun lt!230113 () Unit!9314)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5284 BitStream!5284 BitStream!5284) Unit!9314)

(assert (=> b!147827 (= lt!230113 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6945 lt!230110) (_2!6945 lt!230100)))))

(declare-fun e!98615 () Bool)

(assert (=> b!147827 e!98615))

(declare-fun res!123720 () Bool)

(assert (=> b!147827 (=> (not res!123720) (not e!98615))))

(assert (=> b!147827 (= res!123720 (= (size!3013 (buf!3478 (_2!6945 lt!230110))) (size!3013 (buf!3478 (_2!6945 lt!230100)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5284 array!6659 (_ BitVec 32) (_ BitVec 32)) tuple2!13172)

(assert (=> b!147827 (= lt!230100 (appendByteArrayLoop!0 (_2!6945 lt!230110) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!147827 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3013 (buf!3478 (_2!6945 lt!230110)))) ((_ sign_extend 32) (currentByte!6386 (_2!6945 lt!230110))) ((_ sign_extend 32) (currentBit!6381 (_2!6945 lt!230110))) lt!230107)))

(assert (=> b!147827 (= lt!230107 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!230105 () Unit!9314)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5284 BitStream!5284 (_ BitVec 64) (_ BitVec 32)) Unit!9314)

(assert (=> b!147827 (= lt!230105 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6945 lt!230110) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!98612 () Bool)

(assert (=> b!147827 e!98612))

(declare-fun res!123729 () Bool)

(assert (=> b!147827 (=> (not res!123729) (not e!98612))))

(assert (=> b!147827 (= res!123729 (= (size!3013 (buf!3478 thiss!1634)) (size!3013 (buf!3478 (_2!6945 lt!230110)))))))

(declare-fun appendByte!0 (BitStream!5284 (_ BitVec 8)) tuple2!13172)

(assert (=> b!147827 (= lt!230110 (appendByte!0 thiss!1634 (select (arr!3782 arr!237) from!447)))))

(declare-fun b!147828 () Bool)

(assert (=> b!147828 (= e!98613 (= (_2!6948 lt!230112) (_2!6948 lt!230116)))))

(declare-fun b!147829 () Bool)

(assert (=> b!147829 (= e!98606 (array_inv!2802 (buf!3478 thiss!1634)))))

(declare-fun b!147830 () Bool)

(declare-fun e!98616 () Bool)

(assert (=> b!147830 (= e!98615 e!98616)))

(declare-fun res!123728 () Bool)

(assert (=> b!147830 (=> (not res!123728) (not e!98616))))

(declare-fun lt!230118 () (_ BitVec 64))

(assert (=> b!147830 (= res!123728 (= (bitIndex!0 (size!3013 (buf!3478 (_2!6945 lt!230100))) (currentByte!6386 (_2!6945 lt!230100)) (currentBit!6381 (_2!6945 lt!230100))) (bvadd (bitIndex!0 (size!3013 (buf!3478 (_2!6945 lt!230110))) (currentByte!6386 (_2!6945 lt!230110)) (currentBit!6381 (_2!6945 lt!230110))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!230118))))))

(assert (=> b!147830 (= lt!230118 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!147831 () Bool)

(declare-fun res!123721 () Bool)

(assert (=> b!147831 (=> (not res!123721) (not e!98609))))

(assert (=> b!147831 (= res!123721 (invariant!0 (currentBit!6381 thiss!1634) (currentByte!6386 thiss!1634) (size!3013 (buf!3478 thiss!1634))))))

(declare-fun b!147832 () Bool)

(assert (=> b!147832 (= e!98614 (or (bvsgt #b00000000000000000000000000000000 to!404) (and (bvsle (size!3013 arr!237) (size!3013 (_2!6946 lt!230106))) (bvsle (size!3013 (_2!6946 lt!230106)) (size!3013 (_2!6946 lt!230098))))))))

(assert (=> b!147832 (arrayRangesEq!329 (_2!6946 lt!230106) (_2!6946 lt!230098) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!230099 () Unit!9314)

(declare-fun arrayRangesEqSymmetricLemma!61 (array!6659 array!6659 (_ BitVec 32) (_ BitVec 32)) Unit!9314)

(assert (=> b!147832 (= lt!230099 (arrayRangesEqSymmetricLemma!61 (_2!6946 lt!230098) (_2!6946 lt!230106) #b00000000000000000000000000000000 to!404))))

(declare-fun lt!230119 () tuple2!13178)

(declare-fun lt!230111 () tuple2!13176)

(declare-fun b!147833 () Bool)

(assert (=> b!147833 (= e!98612 (and (= (_2!6948 lt!230119) (select (arr!3782 arr!237) from!447)) (= (_1!6948 lt!230119) (_2!6947 lt!230111))))))

(assert (=> b!147833 (= lt!230119 (readBytePure!0 (_1!6947 lt!230111)))))

(assert (=> b!147833 (= lt!230111 (reader!0 thiss!1634 (_2!6945 lt!230110)))))

(declare-fun b!147834 () Bool)

(declare-fun res!123722 () Bool)

(assert (=> b!147834 (=> (not res!123722) (not e!98609))))

(assert (=> b!147834 (= res!123722 (bvslt from!447 to!404))))

(declare-fun b!147835 () Bool)

(declare-fun res!123725 () Bool)

(assert (=> b!147835 (=> (not res!123725) (not e!98612))))

(assert (=> b!147835 (= res!123725 (= (bitIndex!0 (size!3013 (buf!3478 (_2!6945 lt!230110))) (currentByte!6386 (_2!6945 lt!230110)) (currentBit!6381 (_2!6945 lt!230110))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3013 (buf!3478 thiss!1634)) (currentByte!6386 thiss!1634) (currentBit!6381 thiss!1634)))))))

(declare-fun b!147836 () Bool)

(declare-fun e!98608 () Bool)

(assert (=> b!147836 (= e!98616 (not e!98608))))

(declare-fun res!123719 () Bool)

(assert (=> b!147836 (=> res!123719 e!98608)))

(declare-fun lt!230102 () tuple2!13174)

(declare-fun lt!230114 () tuple2!13176)

(assert (=> b!147836 (= res!123719 (or (not (= (size!3013 (_2!6946 lt!230102)) (size!3013 arr!237))) (not (= (_1!6946 lt!230102) (_2!6947 lt!230114)))))))

(assert (=> b!147836 (= lt!230102 (readByteArrayLoopPure!0 (_1!6947 lt!230114) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!147836 (validate_offset_bits!1 ((_ sign_extend 32) (size!3013 (buf!3478 (_2!6945 lt!230100)))) ((_ sign_extend 32) (currentByte!6386 (_2!6945 lt!230110))) ((_ sign_extend 32) (currentBit!6381 (_2!6945 lt!230110))) lt!230118)))

(declare-fun lt!230109 () Unit!9314)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5284 array!6659 (_ BitVec 64)) Unit!9314)

(assert (=> b!147836 (= lt!230109 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6945 lt!230110) (buf!3478 (_2!6945 lt!230100)) lt!230118))))

(assert (=> b!147836 (= lt!230114 (reader!0 (_2!6945 lt!230110) (_2!6945 lt!230100)))))

(declare-fun b!147837 () Bool)

(assert (=> b!147837 (= e!98608 (not (arrayRangesEq!329 arr!237 (_2!6946 lt!230102) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!147838 () Bool)

(declare-fun res!123724 () Bool)

(assert (=> b!147838 (=> (not res!123724) (not e!98609))))

(assert (=> b!147838 (= res!123724 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3013 (buf!3478 thiss!1634))) ((_ sign_extend 32) (currentByte!6386 thiss!1634)) ((_ sign_extend 32) (currentBit!6381 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!147839 () Bool)

(declare-fun res!123727 () Bool)

(assert (=> b!147839 (=> (not res!123727) (not e!98616))))

(assert (=> b!147839 (= res!123727 (isPrefixOf!0 (_2!6945 lt!230110) (_2!6945 lt!230100)))))

(declare-fun b!147840 () Bool)

(declare-fun res!123730 () Bool)

(assert (=> b!147840 (=> (not res!123730) (not e!98612))))

(assert (=> b!147840 (= res!123730 (isPrefixOf!0 thiss!1634 (_2!6945 lt!230110)))))

(assert (= (and start!28542 res!123731) b!147838))

(assert (= (and b!147838 res!123724) b!147834))

(assert (= (and b!147834 res!123722) b!147831))

(assert (= (and b!147831 res!123721) b!147827))

(assert (= (and b!147827 res!123729) b!147835))

(assert (= (and b!147835 res!123725) b!147840))

(assert (= (and b!147840 res!123730) b!147833))

(assert (= (and b!147827 res!123720) b!147830))

(assert (= (and b!147830 res!123728) b!147839))

(assert (= (and b!147839 res!123727) b!147836))

(assert (= (and b!147836 (not res!123719)) b!147837))

(assert (= (and b!147827 res!123718) b!147826))

(assert (= (and b!147827 res!123723) b!147828))

(assert (= (and b!147827 (not res!123726)) b!147832))

(assert (= start!28542 b!147829))

(declare-fun m!229011 () Bool)

(assert (=> b!147836 m!229011))

(declare-fun m!229013 () Bool)

(assert (=> b!147836 m!229013))

(declare-fun m!229015 () Bool)

(assert (=> b!147836 m!229015))

(declare-fun m!229017 () Bool)

(assert (=> b!147836 m!229017))

(declare-fun m!229019 () Bool)

(assert (=> b!147837 m!229019))

(declare-fun m!229021 () Bool)

(assert (=> b!147829 m!229021))

(declare-fun m!229023 () Bool)

(assert (=> b!147826 m!229023))

(declare-fun m!229025 () Bool)

(assert (=> start!28542 m!229025))

(declare-fun m!229027 () Bool)

(assert (=> start!28542 m!229027))

(declare-fun m!229029 () Bool)

(assert (=> b!147833 m!229029))

(declare-fun m!229031 () Bool)

(assert (=> b!147833 m!229031))

(declare-fun m!229033 () Bool)

(assert (=> b!147833 m!229033))

(declare-fun m!229035 () Bool)

(assert (=> b!147832 m!229035))

(declare-fun m!229037 () Bool)

(assert (=> b!147832 m!229037))

(declare-fun m!229039 () Bool)

(assert (=> b!147830 m!229039))

(declare-fun m!229041 () Bool)

(assert (=> b!147830 m!229041))

(declare-fun m!229043 () Bool)

(assert (=> b!147839 m!229043))

(assert (=> b!147835 m!229041))

(declare-fun m!229045 () Bool)

(assert (=> b!147835 m!229045))

(declare-fun m!229047 () Bool)

(assert (=> b!147827 m!229047))

(declare-fun m!229049 () Bool)

(assert (=> b!147827 m!229049))

(declare-fun m!229051 () Bool)

(assert (=> b!147827 m!229051))

(declare-fun m!229053 () Bool)

(assert (=> b!147827 m!229053))

(declare-fun m!229055 () Bool)

(assert (=> b!147827 m!229055))

(declare-fun m!229057 () Bool)

(assert (=> b!147827 m!229057))

(declare-fun m!229059 () Bool)

(assert (=> b!147827 m!229059))

(declare-fun m!229061 () Bool)

(assert (=> b!147827 m!229061))

(assert (=> b!147827 m!229051))

(declare-fun m!229063 () Bool)

(assert (=> b!147827 m!229063))

(declare-fun m!229065 () Bool)

(assert (=> b!147827 m!229065))

(declare-fun m!229067 () Bool)

(assert (=> b!147827 m!229067))

(declare-fun m!229069 () Bool)

(assert (=> b!147827 m!229069))

(declare-fun m!229071 () Bool)

(assert (=> b!147827 m!229071))

(declare-fun m!229073 () Bool)

(assert (=> b!147827 m!229073))

(declare-fun m!229075 () Bool)

(assert (=> b!147827 m!229075))

(declare-fun m!229077 () Bool)

(assert (=> b!147827 m!229077))

(assert (=> b!147827 m!229017))

(declare-fun m!229079 () Bool)

(assert (=> b!147827 m!229079))

(declare-fun m!229081 () Bool)

(assert (=> b!147827 m!229081))

(declare-fun m!229083 () Bool)

(assert (=> b!147827 m!229083))

(declare-fun m!229085 () Bool)

(assert (=> b!147827 m!229085))

(declare-fun m!229087 () Bool)

(assert (=> b!147827 m!229087))

(declare-fun m!229089 () Bool)

(assert (=> b!147827 m!229089))

(assert (=> b!147827 m!229029))

(declare-fun m!229091 () Bool)

(assert (=> b!147827 m!229091))

(declare-fun m!229093 () Bool)

(assert (=> b!147827 m!229093))

(declare-fun m!229095 () Bool)

(assert (=> b!147827 m!229095))

(assert (=> b!147827 m!229029))

(declare-fun m!229097 () Bool)

(assert (=> b!147831 m!229097))

(declare-fun m!229099 () Bool)

(assert (=> b!147838 m!229099))

(declare-fun m!229101 () Bool)

(assert (=> b!147840 m!229101))

(push 1)

(assert (not b!147826))

(assert (not b!147840))

(assert (not b!147839))

(assert (not b!147831))

(assert (not b!147832))

(assert (not b!147836))

(assert (not b!147835))

(assert (not b!147838))

(assert (not b!147830))

(assert (not b!147827))

(assert (not b!147833))

(assert (not start!28542))

(assert (not b!147837))

(assert (not b!147829))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!47928 () Bool)

(assert (=> d!47928 (= (invariant!0 (currentBit!6381 thiss!1634) (currentByte!6386 thiss!1634) (size!3013 (buf!3478 (_2!6945 lt!230110)))) (and (bvsge (currentBit!6381 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6381 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6386 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6386 thiss!1634) (size!3013 (buf!3478 (_2!6945 lt!230110)))) (and (= (currentBit!6381 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6386 thiss!1634) (size!3013 (buf!3478 (_2!6945 lt!230110))))))))))

(assert (=> b!147826 d!47928))

(declare-fun d!47930 () Bool)

(declare-fun res!123844 () Bool)

(declare-fun e!98705 () Bool)

(assert (=> d!47930 (=> res!123844 e!98705)))

(assert (=> d!47930 (= res!123844 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!47930 (= (arrayRangesEq!329 arr!237 (_2!6946 lt!230102) #b00000000000000000000000000000000 to!404) e!98705)))

(declare-fun b!147965 () Bool)

(declare-fun e!98706 () Bool)

(assert (=> b!147965 (= e!98705 e!98706)))

(declare-fun res!123845 () Bool)

(assert (=> b!147965 (=> (not res!123845) (not e!98706))))

(assert (=> b!147965 (= res!123845 (= (select (arr!3782 arr!237) #b00000000000000000000000000000000) (select (arr!3782 (_2!6946 lt!230102)) #b00000000000000000000000000000000)))))

(declare-fun b!147966 () Bool)

(assert (=> b!147966 (= e!98706 (arrayRangesEq!329 arr!237 (_2!6946 lt!230102) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!47930 (not res!123844)) b!147965))

(assert (= (and b!147965 res!123845) b!147966))

(declare-fun m!229337 () Bool)

(assert (=> b!147965 m!229337))

(declare-fun m!229339 () Bool)

(assert (=> b!147965 m!229339))

(declare-fun m!229341 () Bool)

(assert (=> b!147966 m!229341))

(assert (=> b!147837 d!47930))

(declare-fun d!47932 () Bool)

(declare-fun e!98712 () Bool)

(assert (=> d!47932 e!98712))

(declare-fun res!123857 () Bool)

(assert (=> d!47932 (=> (not res!123857) (not e!98712))))

(declare-fun lt!230390 () (_ BitVec 64))

(declare-fun lt!230389 () (_ BitVec 64))

(declare-fun lt!230385 () (_ BitVec 64))

(assert (=> d!47932 (= res!123857 (= lt!230385 (bvsub lt!230389 lt!230390)))))

(assert (=> d!47932 (or (= (bvand lt!230389 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!230390 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!230389 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!230389 lt!230390) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!47932 (= lt!230390 (remainingBits!0 ((_ sign_extend 32) (size!3013 (buf!3478 (_1!6948 lt!230116)))) ((_ sign_extend 32) (currentByte!6386 (_1!6948 lt!230116))) ((_ sign_extend 32) (currentBit!6381 (_1!6948 lt!230116)))))))

(declare-fun lt!230386 () (_ BitVec 64))

(declare-fun lt!230387 () (_ BitVec 64))

(assert (=> d!47932 (= lt!230389 (bvmul lt!230386 lt!230387))))

(assert (=> d!47932 (or (= lt!230386 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!230387 (bvsdiv (bvmul lt!230386 lt!230387) lt!230386)))))

(assert (=> d!47932 (= lt!230387 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!47932 (= lt!230386 ((_ sign_extend 32) (size!3013 (buf!3478 (_1!6948 lt!230116)))))))

(assert (=> d!47932 (= lt!230385 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6386 (_1!6948 lt!230116))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6381 (_1!6948 lt!230116)))))))

(assert (=> d!47932 (invariant!0 (currentBit!6381 (_1!6948 lt!230116)) (currentByte!6386 (_1!6948 lt!230116)) (size!3013 (buf!3478 (_1!6948 lt!230116))))))

(assert (=> d!47932 (= (bitIndex!0 (size!3013 (buf!3478 (_1!6948 lt!230116))) (currentByte!6386 (_1!6948 lt!230116)) (currentBit!6381 (_1!6948 lt!230116))) lt!230385)))

(declare-fun b!147977 () Bool)

(declare-fun res!123856 () Bool)

(assert (=> b!147977 (=> (not res!123856) (not e!98712))))

(assert (=> b!147977 (= res!123856 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!230385))))

(declare-fun b!147978 () Bool)

(declare-fun lt!230388 () (_ BitVec 64))

(assert (=> b!147978 (= e!98712 (bvsle lt!230385 (bvmul lt!230388 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!147978 (or (= lt!230388 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!230388 #b0000000000000000000000000000000000000000000000000000000000001000) lt!230388)))))

(assert (=> b!147978 (= lt!230388 ((_ sign_extend 32) (size!3013 (buf!3478 (_1!6948 lt!230116)))))))

(assert (= (and d!47932 res!123857) b!147977))

(assert (= (and b!147977 res!123856) b!147978))

(declare-fun m!229347 () Bool)

(assert (=> d!47932 m!229347))

(declare-fun m!229349 () Bool)

(assert (=> d!47932 m!229349))

(assert (=> b!147827 d!47932))

(declare-fun d!47936 () Bool)

(declare-fun lt!230402 () tuple2!13174)

(declare-fun lt!230404 () tuple2!13174)

(assert (=> d!47936 (arrayRangesEq!329 (_2!6946 lt!230402) (_2!6946 lt!230404) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!230405 () Unit!9314)

(declare-fun lt!230403 () BitStream!5284)

(declare-fun choose!35 (BitStream!5284 array!6659 (_ BitVec 32) (_ BitVec 32) tuple2!13174 array!6659 BitStream!5284 tuple2!13174 array!6659) Unit!9314)

(assert (=> d!47936 (= lt!230405 (choose!35 (_1!6947 lt!230123) arr!237 from!447 to!404 lt!230402 (_2!6946 lt!230402) lt!230403 lt!230404 (_2!6946 lt!230404)))))

(assert (=> d!47936 (= lt!230404 (readByteArrayLoopPure!0 lt!230403 (array!6660 (store (arr!3782 arr!237) from!447 (_2!6948 (readBytePure!0 (_1!6947 lt!230123)))) (size!3013 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!47936 (= lt!230403 (withMovedByteIndex!0 (_1!6947 lt!230123) #b00000000000000000000000000000001))))

(assert (=> d!47936 (= lt!230402 (readByteArrayLoopPure!0 (_1!6947 lt!230123) arr!237 from!447 to!404))))

(assert (=> d!47936 (= (readByteArrayLoopArrayPrefixLemma!0 (_1!6947 lt!230123) arr!237 from!447 to!404) lt!230405)))

(declare-fun bs!11714 () Bool)

(assert (= bs!11714 d!47936))

(declare-fun m!229353 () Bool)

(assert (=> bs!11714 m!229353))

(declare-fun m!229355 () Bool)

(assert (=> bs!11714 m!229355))

(declare-fun m!229357 () Bool)

(assert (=> bs!11714 m!229357))

(assert (=> bs!11714 m!229085))

(assert (=> bs!11714 m!229051))

(assert (=> bs!11714 m!229069))

(declare-fun m!229359 () Bool)

(assert (=> bs!11714 m!229359))

(assert (=> b!147827 d!47936))

(declare-fun d!47940 () Bool)

(declare-fun e!98715 () Bool)

(assert (=> d!47940 e!98715))

(declare-fun res!123860 () Bool)

(assert (=> d!47940 (=> (not res!123860) (not e!98715))))

(declare-fun lt!230415 () tuple2!13178)

(declare-fun lt!230416 () tuple2!13178)

(assert (=> d!47940 (= res!123860 (= (bitIndex!0 (size!3013 (buf!3478 (_1!6948 lt!230415))) (currentByte!6386 (_1!6948 lt!230415)) (currentBit!6381 (_1!6948 lt!230415))) (bitIndex!0 (size!3013 (buf!3478 (_1!6948 lt!230416))) (currentByte!6386 (_1!6948 lt!230416)) (currentBit!6381 (_1!6948 lt!230416)))))))

(declare-fun lt!230417 () Unit!9314)

(declare-fun lt!230414 () BitStream!5284)

(declare-fun choose!14 (BitStream!5284 BitStream!5284 BitStream!5284 tuple2!13178 tuple2!13178 BitStream!5284 (_ BitVec 8) tuple2!13178 tuple2!13178 BitStream!5284 (_ BitVec 8)) Unit!9314)

(assert (=> d!47940 (= lt!230417 (choose!14 lt!230101 (_2!6945 lt!230100) lt!230414 lt!230415 (tuple2!13179 (_1!6948 lt!230415) (_2!6948 lt!230415)) (_1!6948 lt!230415) (_2!6948 lt!230415) lt!230416 (tuple2!13179 (_1!6948 lt!230416) (_2!6948 lt!230416)) (_1!6948 lt!230416) (_2!6948 lt!230416)))))

(assert (=> d!47940 (= lt!230416 (readBytePure!0 lt!230414))))

(assert (=> d!47940 (= lt!230415 (readBytePure!0 lt!230101))))

(assert (=> d!47940 (= lt!230414 (BitStream!5285 (buf!3478 (_2!6945 lt!230100)) (currentByte!6386 lt!230101) (currentBit!6381 lt!230101)))))

(assert (=> d!47940 (= (readBytePrefixLemma!0 lt!230101 (_2!6945 lt!230100)) lt!230417)))

(declare-fun b!147981 () Bool)

(assert (=> b!147981 (= e!98715 (= (_2!6948 lt!230415) (_2!6948 lt!230416)))))

(assert (= (and d!47940 res!123860) b!147981))

(assert (=> d!47940 m!229049))

(declare-fun m!229361 () Bool)

(assert (=> d!47940 m!229361))

(declare-fun m!229363 () Bool)

(assert (=> d!47940 m!229363))

(declare-fun m!229365 () Bool)

(assert (=> d!47940 m!229365))

(declare-fun m!229367 () Bool)

(assert (=> d!47940 m!229367))

(assert (=> b!147827 d!47940))

(declare-fun d!47942 () Bool)

(declare-datatypes ((tuple3!578 0))(
  ( (tuple3!579 (_1!6959 Unit!9314) (_2!6959 BitStream!5284) (_3!360 array!6659)) )
))
(declare-fun lt!230420 () tuple3!578)

(declare-fun readByteArrayLoop!0 (BitStream!5284 array!6659 (_ BitVec 32) (_ BitVec 32)) tuple3!578)

(assert (=> d!47942 (= lt!230420 (readByteArrayLoop!0 (_1!6947 lt!230123) arr!237 from!447 to!404))))

(assert (=> d!47942 (= (readByteArrayLoopPure!0 (_1!6947 lt!230123) arr!237 from!447 to!404) (tuple2!13175 (_2!6959 lt!230420) (_3!360 lt!230420)))))

(declare-fun bs!11715 () Bool)

(assert (= bs!11715 d!47942))

(declare-fun m!229369 () Bool)

(assert (=> bs!11715 m!229369))

(assert (=> b!147827 d!47942))

(declare-fun d!47944 () Bool)

(declare-datatypes ((tuple2!13198 0))(
  ( (tuple2!13199 (_1!6960 (_ BitVec 8)) (_2!6960 BitStream!5284)) )
))
(declare-fun lt!230423 () tuple2!13198)

(declare-fun readByte!0 (BitStream!5284) tuple2!13198)

(assert (=> d!47944 (= lt!230423 (readByte!0 (BitStream!5285 (buf!3478 (_2!6945 lt!230100)) (currentByte!6386 thiss!1634) (currentBit!6381 thiss!1634))))))

(assert (=> d!47944 (= (readBytePure!0 (BitStream!5285 (buf!3478 (_2!6945 lt!230100)) (currentByte!6386 thiss!1634) (currentBit!6381 thiss!1634))) (tuple2!13179 (_2!6960 lt!230423) (_1!6960 lt!230423)))))

(declare-fun bs!11716 () Bool)

(assert (= bs!11716 d!47944))

(declare-fun m!229371 () Bool)

(assert (=> bs!11716 m!229371))

(assert (=> b!147827 d!47944))

(declare-fun lt!230497 () tuple2!13176)

(declare-fun b!148002 () Bool)

(declare-fun e!98727 () Bool)

(declare-fun lt!230485 () (_ BitVec 64))

(declare-fun lt!230491 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!5284 (_ BitVec 64)) BitStream!5284)

(assert (=> b!148002 (= e!98727 (= (_1!6947 lt!230497) (withMovedBitIndex!0 (_2!6947 lt!230497) (bvsub lt!230491 lt!230485))))))

(assert (=> b!148002 (or (= (bvand lt!230491 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!230485 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!230491 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!230491 lt!230485) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!148002 (= lt!230485 (bitIndex!0 (size!3013 (buf!3478 (_2!6945 lt!230100))) (currentByte!6386 (_2!6945 lt!230100)) (currentBit!6381 (_2!6945 lt!230100))))))

(assert (=> b!148002 (= lt!230491 (bitIndex!0 (size!3013 (buf!3478 (_2!6945 lt!230110))) (currentByte!6386 (_2!6945 lt!230110)) (currentBit!6381 (_2!6945 lt!230110))))))

(declare-fun b!148004 () Bool)

(declare-fun e!98726 () Unit!9314)

(declare-fun lt!230495 () Unit!9314)

(assert (=> b!148004 (= e!98726 lt!230495)))

(declare-fun lt!230488 () (_ BitVec 64))

(assert (=> b!148004 (= lt!230488 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!230501 () (_ BitVec 64))

(assert (=> b!148004 (= lt!230501 (bitIndex!0 (size!3013 (buf!3478 (_2!6945 lt!230110))) (currentByte!6386 (_2!6945 lt!230110)) (currentBit!6381 (_2!6945 lt!230110))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6659 array!6659 (_ BitVec 64) (_ BitVec 64)) Unit!9314)

(assert (=> b!148004 (= lt!230495 (arrayBitRangesEqSymmetric!0 (buf!3478 (_2!6945 lt!230110)) (buf!3478 (_2!6945 lt!230100)) lt!230488 lt!230501))))

(declare-fun arrayBitRangesEq!0 (array!6659 array!6659 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!148004 (arrayBitRangesEq!0 (buf!3478 (_2!6945 lt!230100)) (buf!3478 (_2!6945 lt!230110)) lt!230488 lt!230501)))

(declare-fun b!148005 () Bool)

(declare-fun Unit!9321 () Unit!9314)

(assert (=> b!148005 (= e!98726 Unit!9321)))

(declare-fun b!148006 () Bool)

(declare-fun res!123877 () Bool)

(assert (=> b!148006 (=> (not res!123877) (not e!98727))))

(assert (=> b!148006 (= res!123877 (isPrefixOf!0 (_2!6947 lt!230497) (_2!6945 lt!230100)))))

(declare-fun b!148003 () Bool)

(declare-fun res!123879 () Bool)

(assert (=> b!148003 (=> (not res!123879) (not e!98727))))

(assert (=> b!148003 (= res!123879 (isPrefixOf!0 (_1!6947 lt!230497) (_2!6945 lt!230110)))))

(declare-fun d!47946 () Bool)

(assert (=> d!47946 e!98727))

(declare-fun res!123878 () Bool)

(assert (=> d!47946 (=> (not res!123878) (not e!98727))))

(assert (=> d!47946 (= res!123878 (isPrefixOf!0 (_1!6947 lt!230497) (_2!6947 lt!230497)))))

(declare-fun lt!230492 () BitStream!5284)

(assert (=> d!47946 (= lt!230497 (tuple2!13177 lt!230492 (_2!6945 lt!230100)))))

(declare-fun lt!230482 () Unit!9314)

(declare-fun lt!230498 () Unit!9314)

(assert (=> d!47946 (= lt!230482 lt!230498)))

(assert (=> d!47946 (isPrefixOf!0 lt!230492 (_2!6945 lt!230100))))

(assert (=> d!47946 (= lt!230498 (lemmaIsPrefixTransitive!0 lt!230492 (_2!6945 lt!230100) (_2!6945 lt!230100)))))

(declare-fun lt!230483 () Unit!9314)

(declare-fun lt!230494 () Unit!9314)

(assert (=> d!47946 (= lt!230483 lt!230494)))

(assert (=> d!47946 (isPrefixOf!0 lt!230492 (_2!6945 lt!230100))))

(assert (=> d!47946 (= lt!230494 (lemmaIsPrefixTransitive!0 lt!230492 (_2!6945 lt!230110) (_2!6945 lt!230100)))))

(declare-fun lt!230496 () Unit!9314)

(assert (=> d!47946 (= lt!230496 e!98726)))

(declare-fun c!8000 () Bool)

(assert (=> d!47946 (= c!8000 (not (= (size!3013 (buf!3478 (_2!6945 lt!230110))) #b00000000000000000000000000000000)))))

(declare-fun lt!230493 () Unit!9314)

(declare-fun lt!230490 () Unit!9314)

(assert (=> d!47946 (= lt!230493 lt!230490)))

(assert (=> d!47946 (isPrefixOf!0 (_2!6945 lt!230100) (_2!6945 lt!230100))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5284) Unit!9314)

(assert (=> d!47946 (= lt!230490 (lemmaIsPrefixRefl!0 (_2!6945 lt!230100)))))

(declare-fun lt!230487 () Unit!9314)

(declare-fun lt!230499 () Unit!9314)

(assert (=> d!47946 (= lt!230487 lt!230499)))

(assert (=> d!47946 (= lt!230499 (lemmaIsPrefixRefl!0 (_2!6945 lt!230100)))))

(declare-fun lt!230486 () Unit!9314)

(declare-fun lt!230489 () Unit!9314)

(assert (=> d!47946 (= lt!230486 lt!230489)))

(assert (=> d!47946 (isPrefixOf!0 lt!230492 lt!230492)))

(assert (=> d!47946 (= lt!230489 (lemmaIsPrefixRefl!0 lt!230492))))

(declare-fun lt!230484 () Unit!9314)

(declare-fun lt!230500 () Unit!9314)

(assert (=> d!47946 (= lt!230484 lt!230500)))

(assert (=> d!47946 (isPrefixOf!0 (_2!6945 lt!230110) (_2!6945 lt!230110))))

(assert (=> d!47946 (= lt!230500 (lemmaIsPrefixRefl!0 (_2!6945 lt!230110)))))

(assert (=> d!47946 (= lt!230492 (BitStream!5285 (buf!3478 (_2!6945 lt!230100)) (currentByte!6386 (_2!6945 lt!230110)) (currentBit!6381 (_2!6945 lt!230110))))))

(assert (=> d!47946 (isPrefixOf!0 (_2!6945 lt!230110) (_2!6945 lt!230100))))

(assert (=> d!47946 (= (reader!0 (_2!6945 lt!230110) (_2!6945 lt!230100)) lt!230497)))

(assert (= (and d!47946 c!8000) b!148004))

(assert (= (and d!47946 (not c!8000)) b!148005))

(assert (= (and d!47946 res!123878) b!148003))

(assert (= (and b!148003 res!123879) b!148006))

(assert (= (and b!148006 res!123877) b!148002))

(assert (=> b!148004 m!229041))

(declare-fun m!229373 () Bool)

(assert (=> b!148004 m!229373))

(declare-fun m!229375 () Bool)

(assert (=> b!148004 m!229375))

(declare-fun m!229377 () Bool)

(assert (=> b!148002 m!229377))

(assert (=> b!148002 m!229039))

(assert (=> b!148002 m!229041))

(declare-fun m!229379 () Bool)

(assert (=> b!148003 m!229379))

(declare-fun m!229381 () Bool)

(assert (=> b!148006 m!229381))

(declare-fun m!229383 () Bool)

(assert (=> d!47946 m!229383))

(declare-fun m!229385 () Bool)

(assert (=> d!47946 m!229385))

(assert (=> d!47946 m!229043))

(declare-fun m!229387 () Bool)

(assert (=> d!47946 m!229387))

(declare-fun m!229389 () Bool)

(assert (=> d!47946 m!229389))

(declare-fun m!229391 () Bool)

(assert (=> d!47946 m!229391))

(declare-fun m!229395 () Bool)

(assert (=> d!47946 m!229395))

(declare-fun m!229397 () Bool)

(assert (=> d!47946 m!229397))

(declare-fun m!229399 () Bool)

(assert (=> d!47946 m!229399))

(declare-fun m!229401 () Bool)

(assert (=> d!47946 m!229401))

(declare-fun m!229405 () Bool)

(assert (=> d!47946 m!229405))

(assert (=> b!147827 d!47946))

(declare-fun d!47948 () Bool)

(assert (=> d!47948 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3013 (buf!3478 (_2!6945 lt!230100)))) ((_ sign_extend 32) (currentByte!6386 (_2!6945 lt!230110))) ((_ sign_extend 32) (currentBit!6381 (_2!6945 lt!230110))) lt!230107) (bvsle ((_ sign_extend 32) lt!230107) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3013 (buf!3478 (_2!6945 lt!230100)))) ((_ sign_extend 32) (currentByte!6386 (_2!6945 lt!230110))) ((_ sign_extend 32) (currentBit!6381 (_2!6945 lt!230110)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11717 () Bool)

(assert (= bs!11717 d!47948))

(declare-fun m!229421 () Bool)

(assert (=> bs!11717 m!229421))

(assert (=> b!147827 d!47948))

(declare-fun d!47952 () Bool)

(declare-fun lt!230511 () tuple2!13198)

(assert (=> d!47952 (= lt!230511 (readByte!0 lt!230101))))

(assert (=> d!47952 (= (readBytePure!0 lt!230101) (tuple2!13179 (_2!6960 lt!230511) (_1!6960 lt!230511)))))

(declare-fun bs!11718 () Bool)

(assert (= bs!11718 d!47952))

(declare-fun m!229423 () Bool)

(assert (=> bs!11718 m!229423))

(assert (=> b!147827 d!47952))

(declare-fun d!47954 () Bool)

(declare-fun lt!230512 () tuple2!13198)

(assert (=> d!47954 (= lt!230512 (readByte!0 (_1!6947 lt!230123)))))

(assert (=> d!47954 (= (readBytePure!0 (_1!6947 lt!230123)) (tuple2!13179 (_2!6960 lt!230512) (_1!6960 lt!230512)))))

(declare-fun bs!11719 () Bool)

(assert (= bs!11719 d!47954))

(declare-fun m!229425 () Bool)

(assert (=> bs!11719 m!229425))

(assert (=> b!147827 d!47954))

(declare-fun b!148056 () Bool)

(declare-fun e!98759 () Bool)

(declare-fun lt!230628 () tuple2!13174)

(assert (=> b!148056 (= e!98759 (arrayRangesEq!329 arr!237 (_2!6946 lt!230628) #b00000000000000000000000000000000 to!404))))

(declare-fun b!148057 () Bool)

(declare-fun res!123929 () Bool)

(declare-fun e!98757 () Bool)

(assert (=> b!148057 (=> (not res!123929) (not e!98757))))

(declare-fun lt!230629 () tuple2!13172)

(assert (=> b!148057 (= res!123929 (isPrefixOf!0 (_2!6945 lt!230110) (_2!6945 lt!230629)))))

(declare-fun b!148058 () Bool)

(assert (=> b!148058 (= e!98757 e!98759)))

(declare-fun res!123925 () Bool)

(assert (=> b!148058 (=> (not res!123925) (not e!98759))))

(declare-fun lt!230631 () tuple2!13176)

(assert (=> b!148058 (= res!123925 (and (= (size!3013 (_2!6946 lt!230628)) (size!3013 arr!237)) (= (_1!6946 lt!230628) (_2!6947 lt!230631))))))

(assert (=> b!148058 (= lt!230628 (readByteArrayLoopPure!0 (_1!6947 lt!230631) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!230624 () Unit!9314)

(declare-fun lt!230630 () Unit!9314)

(assert (=> b!148058 (= lt!230624 lt!230630)))

(declare-fun lt!230626 () (_ BitVec 64))

(assert (=> b!148058 (validate_offset_bits!1 ((_ sign_extend 32) (size!3013 (buf!3478 (_2!6945 lt!230629)))) ((_ sign_extend 32) (currentByte!6386 (_2!6945 lt!230110))) ((_ sign_extend 32) (currentBit!6381 (_2!6945 lt!230110))) lt!230626)))

(assert (=> b!148058 (= lt!230630 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6945 lt!230110) (buf!3478 (_2!6945 lt!230629)) lt!230626))))

(declare-fun e!98758 () Bool)

(assert (=> b!148058 e!98758))

(declare-fun res!123927 () Bool)

(assert (=> b!148058 (=> (not res!123927) (not e!98758))))

(assert (=> b!148058 (= res!123927 (and (= (size!3013 (buf!3478 (_2!6945 lt!230110))) (size!3013 (buf!3478 (_2!6945 lt!230629)))) (bvsge lt!230626 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!148058 (= lt!230626 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!148058 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!148058 (= lt!230631 (reader!0 (_2!6945 lt!230110) (_2!6945 lt!230629)))))

(declare-fun d!47956 () Bool)

(assert (=> d!47956 e!98757))

(declare-fun res!123928 () Bool)

(assert (=> d!47956 (=> (not res!123928) (not e!98757))))

(assert (=> d!47956 (= res!123928 (= (size!3013 (buf!3478 (_2!6945 lt!230110))) (size!3013 (buf!3478 (_2!6945 lt!230629)))))))

(declare-fun choose!64 (BitStream!5284 array!6659 (_ BitVec 32) (_ BitVec 32)) tuple2!13172)

(assert (=> d!47956 (= lt!230629 (choose!64 (_2!6945 lt!230110) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!47956 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!3013 arr!237)))))

(assert (=> d!47956 (= (appendByteArrayLoop!0 (_2!6945 lt!230110) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!230629)))

(declare-fun b!148059 () Bool)

(declare-fun res!123926 () Bool)

(assert (=> b!148059 (=> (not res!123926) (not e!98757))))

(declare-fun lt!230627 () (_ BitVec 64))

(declare-fun lt!230625 () (_ BitVec 64))

(assert (=> b!148059 (= res!123926 (= (bitIndex!0 (size!3013 (buf!3478 (_2!6945 lt!230629))) (currentByte!6386 (_2!6945 lt!230629)) (currentBit!6381 (_2!6945 lt!230629))) (bvadd lt!230625 lt!230627)))))

(assert (=> b!148059 (or (not (= (bvand lt!230625 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!230627 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!230625 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!230625 lt!230627) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!230632 () (_ BitVec 64))

(assert (=> b!148059 (= lt!230627 (bvmul lt!230632 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!148059 (or (= lt!230632 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!230632 #b0000000000000000000000000000000000000000000000000000000000001000) lt!230632)))))

(assert (=> b!148059 (= lt!230632 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!148059 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!148059 (= lt!230625 (bitIndex!0 (size!3013 (buf!3478 (_2!6945 lt!230110))) (currentByte!6386 (_2!6945 lt!230110)) (currentBit!6381 (_2!6945 lt!230110))))))

(declare-fun b!148060 () Bool)

(assert (=> b!148060 (= e!98758 (validate_offset_bits!1 ((_ sign_extend 32) (size!3013 (buf!3478 (_2!6945 lt!230110)))) ((_ sign_extend 32) (currentByte!6386 (_2!6945 lt!230110))) ((_ sign_extend 32) (currentBit!6381 (_2!6945 lt!230110))) lt!230626))))

(assert (= (and d!47956 res!123928) b!148059))

(assert (= (and b!148059 res!123926) b!148057))

(assert (= (and b!148057 res!123929) b!148058))

(assert (= (and b!148058 res!123927) b!148060))

(assert (= (and b!148058 res!123925) b!148056))

(declare-fun m!229539 () Bool)

(assert (=> b!148060 m!229539))

(declare-fun m!229541 () Bool)

(assert (=> b!148059 m!229541))

(assert (=> b!148059 m!229041))

(declare-fun m!229543 () Bool)

(assert (=> b!148057 m!229543))

(declare-fun m!229545 () Bool)

(assert (=> d!47956 m!229545))

(declare-fun m!229547 () Bool)

(assert (=> b!148058 m!229547))

(declare-fun m!229549 () Bool)

(assert (=> b!148058 m!229549))

(declare-fun m!229551 () Bool)

(assert (=> b!148058 m!229551))

(declare-fun m!229553 () Bool)

(assert (=> b!148058 m!229553))

(declare-fun m!229557 () Bool)

(assert (=> b!148056 m!229557))

(assert (=> b!147827 d!47956))

(declare-fun d!48003 () Bool)

(assert (=> d!48003 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3013 (buf!3478 (_2!6945 lt!230100)))) ((_ sign_extend 32) (currentByte!6386 thiss!1634)) ((_ sign_extend 32) (currentBit!6381 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!230638 () Unit!9314)

(declare-fun choose!26 (BitStream!5284 array!6659 (_ BitVec 32) BitStream!5284) Unit!9314)

(assert (=> d!48003 (= lt!230638 (choose!26 thiss!1634 (buf!3478 (_2!6945 lt!230100)) (bvsub to!404 from!447) (BitStream!5285 (buf!3478 (_2!6945 lt!230100)) (currentByte!6386 thiss!1634) (currentBit!6381 thiss!1634))))))

(assert (=> d!48003 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3478 (_2!6945 lt!230100)) (bvsub to!404 from!447)) lt!230638)))

(declare-fun bs!11732 () Bool)

(assert (= bs!11732 d!48003))

(assert (=> bs!11732 m!229093))

(declare-fun m!229561 () Bool)

(assert (=> bs!11732 m!229561))

(assert (=> b!147827 d!48003))

(declare-fun lt!230640 () tuple3!578)

(declare-fun d!48007 () Bool)

(assert (=> d!48007 (= lt!230640 (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!6947 lt!230123) #b00000000000000000000000000000001) lt!230117 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!48007 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6947 lt!230123) #b00000000000000000000000000000001) lt!230117 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13175 (_2!6959 lt!230640) (_3!360 lt!230640)))))

(declare-fun bs!11734 () Bool)

(assert (= bs!11734 d!48007))

(assert (=> bs!11734 m!229051))

(declare-fun m!229565 () Bool)

(assert (=> bs!11734 m!229565))

(assert (=> b!147827 d!48007))

(declare-fun d!48011 () Bool)

(declare-fun e!98769 () Bool)

(assert (=> d!48011 e!98769))

(declare-fun res!123943 () Bool)

(assert (=> d!48011 (=> (not res!123943) (not e!98769))))

(assert (=> d!48011 (= res!123943 (and (or (let ((rhs!3263 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3263 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3263) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!48020 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!48020 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!48020 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3262 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3262 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3262) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!230669 () Unit!9314)

(declare-fun choose!57 (BitStream!5284 BitStream!5284 (_ BitVec 64) (_ BitVec 32)) Unit!9314)

(assert (=> d!48011 (= lt!230669 (choose!57 thiss!1634 (_2!6945 lt!230110) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!48011 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6945 lt!230110) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!230669)))

(declare-fun b!148074 () Bool)

(declare-fun lt!230671 () (_ BitVec 32))

(assert (=> b!148074 (= e!98769 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3013 (buf!3478 (_2!6945 lt!230110)))) ((_ sign_extend 32) (currentByte!6386 (_2!6945 lt!230110))) ((_ sign_extend 32) (currentBit!6381 (_2!6945 lt!230110))) (bvsub (bvsub to!404 from!447) lt!230671)))))

(assert (=> b!148074 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!230671 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!230671) #b10000000000000000000000000000000)))))

(declare-fun lt!230670 () (_ BitVec 64))

(assert (=> b!148074 (= lt!230671 ((_ extract 31 0) lt!230670))))

(assert (=> b!148074 (and (bvslt lt!230670 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!230670 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!148074 (= lt!230670 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!48011 res!123943) b!148074))

(declare-fun m!229577 () Bool)

(assert (=> d!48011 m!229577))

(declare-fun m!229579 () Bool)

(assert (=> b!148074 m!229579))

(assert (=> b!147827 d!48011))

(declare-fun d!48024 () Bool)

(declare-fun res!123944 () Bool)

(declare-fun e!98770 () Bool)

(assert (=> d!48024 (=> res!123944 e!98770)))

(assert (=> d!48024 (= res!123944 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!48024 (= (arrayRangesEq!329 (_2!6946 lt!230098) (_2!6946 lt!230108) #b00000000000000000000000000000000 to!404) e!98770)))

(declare-fun b!148075 () Bool)

(declare-fun e!98771 () Bool)

(assert (=> b!148075 (= e!98770 e!98771)))

(declare-fun res!123945 () Bool)

(assert (=> b!148075 (=> (not res!123945) (not e!98771))))

(assert (=> b!148075 (= res!123945 (= (select (arr!3782 (_2!6946 lt!230098)) #b00000000000000000000000000000000) (select (arr!3782 (_2!6946 lt!230108)) #b00000000000000000000000000000000)))))

(declare-fun b!148076 () Bool)

(assert (=> b!148076 (= e!98771 (arrayRangesEq!329 (_2!6946 lt!230098) (_2!6946 lt!230108) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48024 (not res!123944)) b!148075))

(assert (= (and b!148075 res!123945) b!148076))

(declare-fun m!229581 () Bool)

(assert (=> b!148075 m!229581))

(declare-fun m!229583 () Bool)

(assert (=> b!148075 m!229583))

(declare-fun m!229585 () Bool)

(assert (=> b!148076 m!229585))

(assert (=> b!147827 d!48024))

(declare-fun d!48026 () Bool)

(assert (=> d!48026 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3013 (buf!3478 (_2!6945 lt!230100)))) ((_ sign_extend 32) (currentByte!6386 (_2!6945 lt!230110))) ((_ sign_extend 32) (currentBit!6381 (_2!6945 lt!230110))) lt!230107)))

(declare-fun lt!230672 () Unit!9314)

(assert (=> d!48026 (= lt!230672 (choose!26 (_2!6945 lt!230110) (buf!3478 (_2!6945 lt!230100)) lt!230107 (BitStream!5285 (buf!3478 (_2!6945 lt!230100)) (currentByte!6386 (_2!6945 lt!230110)) (currentBit!6381 (_2!6945 lt!230110)))))))

(assert (=> d!48026 (= (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6945 lt!230110) (buf!3478 (_2!6945 lt!230100)) lt!230107) lt!230672)))

(declare-fun bs!11738 () Bool)

(assert (= bs!11738 d!48026))

(assert (=> bs!11738 m!229055))

(declare-fun m!229587 () Bool)

(assert (=> bs!11738 m!229587))

(assert (=> b!147827 d!48026))

(declare-fun d!48028 () Bool)

(assert (=> d!48028 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3013 (buf!3478 (_2!6945 lt!230100)))) ((_ sign_extend 32) (currentByte!6386 thiss!1634)) ((_ sign_extend 32) (currentBit!6381 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3013 (buf!3478 (_2!6945 lt!230100)))) ((_ sign_extend 32) (currentByte!6386 thiss!1634)) ((_ sign_extend 32) (currentBit!6381 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11739 () Bool)

(assert (= bs!11739 d!48028))

(declare-fun m!229589 () Bool)

(assert (=> bs!11739 m!229589))

(assert (=> b!147827 d!48028))

(declare-fun d!48030 () Bool)

(declare-fun e!98772 () Bool)

(assert (=> d!48030 e!98772))

(declare-fun res!123947 () Bool)

(assert (=> d!48030 (=> (not res!123947) (not e!98772))))

(declare-fun lt!230678 () (_ BitVec 64))

(declare-fun lt!230677 () (_ BitVec 64))

(declare-fun lt!230673 () (_ BitVec 64))

(assert (=> d!48030 (= res!123947 (= lt!230673 (bvsub lt!230677 lt!230678)))))

(assert (=> d!48030 (or (= (bvand lt!230677 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!230678 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!230677 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!230677 lt!230678) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48030 (= lt!230678 (remainingBits!0 ((_ sign_extend 32) (size!3013 (buf!3478 (_1!6948 lt!230112)))) ((_ sign_extend 32) (currentByte!6386 (_1!6948 lt!230112))) ((_ sign_extend 32) (currentBit!6381 (_1!6948 lt!230112)))))))

(declare-fun lt!230674 () (_ BitVec 64))

(declare-fun lt!230675 () (_ BitVec 64))

(assert (=> d!48030 (= lt!230677 (bvmul lt!230674 lt!230675))))

(assert (=> d!48030 (or (= lt!230674 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!230675 (bvsdiv (bvmul lt!230674 lt!230675) lt!230674)))))

(assert (=> d!48030 (= lt!230675 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!48030 (= lt!230674 ((_ sign_extend 32) (size!3013 (buf!3478 (_1!6948 lt!230112)))))))

(assert (=> d!48030 (= lt!230673 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6386 (_1!6948 lt!230112))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6381 (_1!6948 lt!230112)))))))

(assert (=> d!48030 (invariant!0 (currentBit!6381 (_1!6948 lt!230112)) (currentByte!6386 (_1!6948 lt!230112)) (size!3013 (buf!3478 (_1!6948 lt!230112))))))

(assert (=> d!48030 (= (bitIndex!0 (size!3013 (buf!3478 (_1!6948 lt!230112))) (currentByte!6386 (_1!6948 lt!230112)) (currentBit!6381 (_1!6948 lt!230112))) lt!230673)))

(declare-fun b!148077 () Bool)

(declare-fun res!123946 () Bool)

(assert (=> b!148077 (=> (not res!123946) (not e!98772))))

(assert (=> b!148077 (= res!123946 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!230673))))

(declare-fun b!148078 () Bool)

(declare-fun lt!230676 () (_ BitVec 64))

(assert (=> b!148078 (= e!98772 (bvsle lt!230673 (bvmul lt!230676 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!148078 (or (= lt!230676 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!230676 #b0000000000000000000000000000000000000000000000000000000000001000) lt!230676)))))

(assert (=> b!148078 (= lt!230676 ((_ sign_extend 32) (size!3013 (buf!3478 (_1!6948 lt!230112)))))))

(assert (= (and d!48030 res!123947) b!148077))

(assert (= (and b!148077 res!123946) b!148078))

(declare-fun m!229591 () Bool)

(assert (=> d!48030 m!229591))

(declare-fun m!229593 () Bool)

(assert (=> d!48030 m!229593))

(assert (=> b!147827 d!48030))

(declare-fun d!48032 () Bool)

(declare-fun moveByteIndex!0 (BitStream!5284 (_ BitVec 32)) tuple2!13172)

(assert (=> d!48032 (= (withMovedByteIndex!0 (_1!6947 lt!230123) #b00000000000000000000000000000001) (_2!6945 (moveByteIndex!0 (_1!6947 lt!230123) #b00000000000000000000000000000001)))))

(declare-fun bs!11740 () Bool)

(assert (= bs!11740 d!48032))

(declare-fun m!229595 () Bool)

(assert (=> bs!11740 m!229595))

(assert (=> b!147827 d!48032))

(declare-fun d!48034 () Bool)

(assert (=> d!48034 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3013 (buf!3478 (_2!6945 lt!230110)))) ((_ sign_extend 32) (currentByte!6386 (_2!6945 lt!230110))) ((_ sign_extend 32) (currentBit!6381 (_2!6945 lt!230110))) lt!230107) (bvsle ((_ sign_extend 32) lt!230107) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3013 (buf!3478 (_2!6945 lt!230110)))) ((_ sign_extend 32) (currentByte!6386 (_2!6945 lt!230110))) ((_ sign_extend 32) (currentBit!6381 (_2!6945 lt!230110)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11741 () Bool)

(assert (= bs!11741 d!48034))

(declare-fun m!229597 () Bool)

(assert (=> bs!11741 m!229597))

(assert (=> b!147827 d!48034))

(declare-fun d!48036 () Bool)

(assert (=> d!48036 (isPrefixOf!0 thiss!1634 (_2!6945 lt!230100))))

(declare-fun lt!230681 () Unit!9314)

(declare-fun choose!30 (BitStream!5284 BitStream!5284 BitStream!5284) Unit!9314)

(assert (=> d!48036 (= lt!230681 (choose!30 thiss!1634 (_2!6945 lt!230110) (_2!6945 lt!230100)))))

(assert (=> d!48036 (isPrefixOf!0 thiss!1634 (_2!6945 lt!230110))))

(assert (=> d!48036 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6945 lt!230110) (_2!6945 lt!230100)) lt!230681)))

(declare-fun bs!11742 () Bool)

(assert (= bs!11742 d!48036))

(assert (=> bs!11742 m!229089))

(declare-fun m!229599 () Bool)

(assert (=> bs!11742 m!229599))

(assert (=> bs!11742 m!229101))

(assert (=> b!147827 d!48036))

(declare-fun d!48038 () Bool)

(declare-fun res!123948 () Bool)

(declare-fun e!98773 () Bool)

(assert (=> d!48038 (=> res!123948 e!98773)))

(assert (=> d!48038 (= res!123948 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!48038 (= (arrayRangesEq!329 (_2!6946 lt!230098) (_2!6946 lt!230106) #b00000000000000000000000000000000 to!404) e!98773)))

(declare-fun b!148079 () Bool)

(declare-fun e!98774 () Bool)

(assert (=> b!148079 (= e!98773 e!98774)))

(declare-fun res!123949 () Bool)

(assert (=> b!148079 (=> (not res!123949) (not e!98774))))

(assert (=> b!148079 (= res!123949 (= (select (arr!3782 (_2!6946 lt!230098)) #b00000000000000000000000000000000) (select (arr!3782 (_2!6946 lt!230106)) #b00000000000000000000000000000000)))))

(declare-fun b!148080 () Bool)

(assert (=> b!148080 (= e!98774 (arrayRangesEq!329 (_2!6946 lt!230098) (_2!6946 lt!230106) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48038 (not res!123948)) b!148079))

(assert (= (and b!148079 res!123949) b!148080))

(assert (=> b!148079 m!229581))

(declare-fun m!229601 () Bool)

(assert (=> b!148079 m!229601))

(declare-fun m!229603 () Bool)

(assert (=> b!148080 m!229603))

(assert (=> b!147827 d!48038))

(declare-fun lt!230682 () tuple3!578)

(declare-fun d!48040 () Bool)

(assert (=> d!48040 (= lt!230682 (readByteArrayLoop!0 (_1!6947 lt!230103) lt!230117 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!48040 (= (readByteArrayLoopPure!0 (_1!6947 lt!230103) lt!230117 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13175 (_2!6959 lt!230682) (_3!360 lt!230682)))))

(declare-fun bs!11743 () Bool)

(assert (= bs!11743 d!48040))

(declare-fun m!229605 () Bool)

(assert (=> bs!11743 m!229605))

(assert (=> b!147827 d!48040))

(declare-fun d!48042 () Bool)

(declare-fun res!123958 () Bool)

(declare-fun e!98780 () Bool)

(assert (=> d!48042 (=> (not res!123958) (not e!98780))))

(assert (=> d!48042 (= res!123958 (= (size!3013 (buf!3478 thiss!1634)) (size!3013 (buf!3478 (_2!6945 lt!230100)))))))

(assert (=> d!48042 (= (isPrefixOf!0 thiss!1634 (_2!6945 lt!230100)) e!98780)))

(declare-fun b!148087 () Bool)

(declare-fun res!123956 () Bool)

(assert (=> b!148087 (=> (not res!123956) (not e!98780))))

(assert (=> b!148087 (= res!123956 (bvsle (bitIndex!0 (size!3013 (buf!3478 thiss!1634)) (currentByte!6386 thiss!1634) (currentBit!6381 thiss!1634)) (bitIndex!0 (size!3013 (buf!3478 (_2!6945 lt!230100))) (currentByte!6386 (_2!6945 lt!230100)) (currentBit!6381 (_2!6945 lt!230100)))))))

(declare-fun b!148088 () Bool)

(declare-fun e!98779 () Bool)

(assert (=> b!148088 (= e!98780 e!98779)))

(declare-fun res!123957 () Bool)

(assert (=> b!148088 (=> res!123957 e!98779)))

(assert (=> b!148088 (= res!123957 (= (size!3013 (buf!3478 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!148089 () Bool)

(assert (=> b!148089 (= e!98779 (arrayBitRangesEq!0 (buf!3478 thiss!1634) (buf!3478 (_2!6945 lt!230100)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3013 (buf!3478 thiss!1634)) (currentByte!6386 thiss!1634) (currentBit!6381 thiss!1634))))))

(assert (= (and d!48042 res!123958) b!148087))

(assert (= (and b!148087 res!123956) b!148088))

(assert (= (and b!148088 (not res!123957)) b!148089))

(assert (=> b!148087 m!229045))

(assert (=> b!148087 m!229039))

(assert (=> b!148089 m!229045))

(assert (=> b!148089 m!229045))

(declare-fun m!229607 () Bool)

(assert (=> b!148089 m!229607))

(assert (=> b!147827 d!48042))

(declare-fun d!48044 () Bool)

(declare-fun e!98783 () Bool)

(assert (=> d!48044 e!98783))

(declare-fun res!123967 () Bool)

(assert (=> d!48044 (=> (not res!123967) (not e!98783))))

(declare-fun lt!230693 () tuple2!13172)

(assert (=> d!48044 (= res!123967 (= (size!3013 (buf!3478 thiss!1634)) (size!3013 (buf!3478 (_2!6945 lt!230693)))))))

(declare-fun choose!6 (BitStream!5284 (_ BitVec 8)) tuple2!13172)

(assert (=> d!48044 (= lt!230693 (choose!6 thiss!1634 (select (arr!3782 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!48044 (validate_offset_byte!0 ((_ sign_extend 32) (size!3013 (buf!3478 thiss!1634))) ((_ sign_extend 32) (currentByte!6386 thiss!1634)) ((_ sign_extend 32) (currentBit!6381 thiss!1634)))))

(assert (=> d!48044 (= (appendByte!0 thiss!1634 (select (arr!3782 arr!237) from!447)) lt!230693)))

(declare-fun b!148096 () Bool)

(declare-fun res!123966 () Bool)

(assert (=> b!148096 (=> (not res!123966) (not e!98783))))

(declare-fun lt!230694 () (_ BitVec 64))

(declare-fun lt!230696 () (_ BitVec 64))

(assert (=> b!148096 (= res!123966 (= (bitIndex!0 (size!3013 (buf!3478 (_2!6945 lt!230693))) (currentByte!6386 (_2!6945 lt!230693)) (currentBit!6381 (_2!6945 lt!230693))) (bvadd lt!230694 lt!230696)))))

(assert (=> b!148096 (or (not (= (bvand lt!230694 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!230696 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!230694 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!230694 lt!230696) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!148096 (= lt!230696 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!148096 (= lt!230694 (bitIndex!0 (size!3013 (buf!3478 thiss!1634)) (currentByte!6386 thiss!1634) (currentBit!6381 thiss!1634)))))

(declare-fun b!148097 () Bool)

(declare-fun res!123965 () Bool)

(assert (=> b!148097 (=> (not res!123965) (not e!98783))))

(assert (=> b!148097 (= res!123965 (isPrefixOf!0 thiss!1634 (_2!6945 lt!230693)))))

(declare-fun lt!230697 () tuple2!13178)

(declare-fun b!148098 () Bool)

(declare-fun lt!230695 () tuple2!13176)

(assert (=> b!148098 (= e!98783 (and (= (_2!6948 lt!230697) (select (arr!3782 arr!237) from!447)) (= (_1!6948 lt!230697) (_2!6947 lt!230695))))))

(assert (=> b!148098 (= lt!230697 (readBytePure!0 (_1!6947 lt!230695)))))

(assert (=> b!148098 (= lt!230695 (reader!0 thiss!1634 (_2!6945 lt!230693)))))

(assert (= (and d!48044 res!123967) b!148096))

(assert (= (and b!148096 res!123966) b!148097))

(assert (= (and b!148097 res!123965) b!148098))

(assert (=> d!48044 m!229029))

(declare-fun m!229609 () Bool)

(assert (=> d!48044 m!229609))

(declare-fun m!229611 () Bool)

(assert (=> d!48044 m!229611))

(declare-fun m!229613 () Bool)

(assert (=> b!148096 m!229613))

(assert (=> b!148096 m!229045))

(declare-fun m!229615 () Bool)

(assert (=> b!148097 m!229615))

(declare-fun m!229617 () Bool)

(assert (=> b!148098 m!229617))

(declare-fun m!229619 () Bool)

(assert (=> b!148098 m!229619))

(assert (=> b!147827 d!48044))

(declare-fun e!98785 () Bool)

(declare-fun lt!230701 () (_ BitVec 64))

(declare-fun lt!230713 () tuple2!13176)

(declare-fun lt!230707 () (_ BitVec 64))

(declare-fun b!148099 () Bool)

(assert (=> b!148099 (= e!98785 (= (_1!6947 lt!230713) (withMovedBitIndex!0 (_2!6947 lt!230713) (bvsub lt!230707 lt!230701))))))

(assert (=> b!148099 (or (= (bvand lt!230707 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!230701 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!230707 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!230707 lt!230701) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!148099 (= lt!230701 (bitIndex!0 (size!3013 (buf!3478 (_2!6945 lt!230100))) (currentByte!6386 (_2!6945 lt!230100)) (currentBit!6381 (_2!6945 lt!230100))))))

(assert (=> b!148099 (= lt!230707 (bitIndex!0 (size!3013 (buf!3478 thiss!1634)) (currentByte!6386 thiss!1634) (currentBit!6381 thiss!1634)))))

(declare-fun b!148101 () Bool)

(declare-fun e!98784 () Unit!9314)

(declare-fun lt!230711 () Unit!9314)

(assert (=> b!148101 (= e!98784 lt!230711)))

(declare-fun lt!230704 () (_ BitVec 64))

(assert (=> b!148101 (= lt!230704 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!230717 () (_ BitVec 64))

(assert (=> b!148101 (= lt!230717 (bitIndex!0 (size!3013 (buf!3478 thiss!1634)) (currentByte!6386 thiss!1634) (currentBit!6381 thiss!1634)))))

(assert (=> b!148101 (= lt!230711 (arrayBitRangesEqSymmetric!0 (buf!3478 thiss!1634) (buf!3478 (_2!6945 lt!230100)) lt!230704 lt!230717))))

(assert (=> b!148101 (arrayBitRangesEq!0 (buf!3478 (_2!6945 lt!230100)) (buf!3478 thiss!1634) lt!230704 lt!230717)))

(declare-fun b!148102 () Bool)

(declare-fun Unit!9324 () Unit!9314)

(assert (=> b!148102 (= e!98784 Unit!9324)))

(declare-fun b!148103 () Bool)

(declare-fun res!123968 () Bool)

(assert (=> b!148103 (=> (not res!123968) (not e!98785))))

(assert (=> b!148103 (= res!123968 (isPrefixOf!0 (_2!6947 lt!230713) (_2!6945 lt!230100)))))

(declare-fun b!148100 () Bool)

(declare-fun res!123970 () Bool)

(assert (=> b!148100 (=> (not res!123970) (not e!98785))))

(assert (=> b!148100 (= res!123970 (isPrefixOf!0 (_1!6947 lt!230713) thiss!1634))))

(declare-fun d!48046 () Bool)

(assert (=> d!48046 e!98785))

(declare-fun res!123969 () Bool)

(assert (=> d!48046 (=> (not res!123969) (not e!98785))))

(assert (=> d!48046 (= res!123969 (isPrefixOf!0 (_1!6947 lt!230713) (_2!6947 lt!230713)))))

(declare-fun lt!230708 () BitStream!5284)

(assert (=> d!48046 (= lt!230713 (tuple2!13177 lt!230708 (_2!6945 lt!230100)))))

(declare-fun lt!230698 () Unit!9314)

(declare-fun lt!230714 () Unit!9314)

(assert (=> d!48046 (= lt!230698 lt!230714)))

(assert (=> d!48046 (isPrefixOf!0 lt!230708 (_2!6945 lt!230100))))

(assert (=> d!48046 (= lt!230714 (lemmaIsPrefixTransitive!0 lt!230708 (_2!6945 lt!230100) (_2!6945 lt!230100)))))

(declare-fun lt!230699 () Unit!9314)

(declare-fun lt!230710 () Unit!9314)

(assert (=> d!48046 (= lt!230699 lt!230710)))

(assert (=> d!48046 (isPrefixOf!0 lt!230708 (_2!6945 lt!230100))))

(assert (=> d!48046 (= lt!230710 (lemmaIsPrefixTransitive!0 lt!230708 thiss!1634 (_2!6945 lt!230100)))))

(declare-fun lt!230712 () Unit!9314)

(assert (=> d!48046 (= lt!230712 e!98784)))

(declare-fun c!8003 () Bool)

(assert (=> d!48046 (= c!8003 (not (= (size!3013 (buf!3478 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!230709 () Unit!9314)

(declare-fun lt!230706 () Unit!9314)

(assert (=> d!48046 (= lt!230709 lt!230706)))

(assert (=> d!48046 (isPrefixOf!0 (_2!6945 lt!230100) (_2!6945 lt!230100))))

(assert (=> d!48046 (= lt!230706 (lemmaIsPrefixRefl!0 (_2!6945 lt!230100)))))

(declare-fun lt!230703 () Unit!9314)

(declare-fun lt!230715 () Unit!9314)

(assert (=> d!48046 (= lt!230703 lt!230715)))

(assert (=> d!48046 (= lt!230715 (lemmaIsPrefixRefl!0 (_2!6945 lt!230100)))))

(declare-fun lt!230702 () Unit!9314)

(declare-fun lt!230705 () Unit!9314)

(assert (=> d!48046 (= lt!230702 lt!230705)))

(assert (=> d!48046 (isPrefixOf!0 lt!230708 lt!230708)))

(assert (=> d!48046 (= lt!230705 (lemmaIsPrefixRefl!0 lt!230708))))

(declare-fun lt!230700 () Unit!9314)

(declare-fun lt!230716 () Unit!9314)

(assert (=> d!48046 (= lt!230700 lt!230716)))

(assert (=> d!48046 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!48046 (= lt!230716 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!48046 (= lt!230708 (BitStream!5285 (buf!3478 (_2!6945 lt!230100)) (currentByte!6386 thiss!1634) (currentBit!6381 thiss!1634)))))

(assert (=> d!48046 (isPrefixOf!0 thiss!1634 (_2!6945 lt!230100))))

(assert (=> d!48046 (= (reader!0 thiss!1634 (_2!6945 lt!230100)) lt!230713)))

(assert (= (and d!48046 c!8003) b!148101))

(assert (= (and d!48046 (not c!8003)) b!148102))

(assert (= (and d!48046 res!123969) b!148100))

(assert (= (and b!148100 res!123970) b!148103))

(assert (= (and b!148103 res!123968) b!148099))

(assert (=> b!148101 m!229045))

(declare-fun m!229621 () Bool)

(assert (=> b!148101 m!229621))

(declare-fun m!229623 () Bool)

(assert (=> b!148101 m!229623))

(declare-fun m!229625 () Bool)

(assert (=> b!148099 m!229625))

(assert (=> b!148099 m!229039))

(assert (=> b!148099 m!229045))

(declare-fun m!229627 () Bool)

(assert (=> b!148100 m!229627))

(declare-fun m!229629 () Bool)

(assert (=> b!148103 m!229629))

(assert (=> d!48046 m!229383))

(declare-fun m!229631 () Bool)

(assert (=> d!48046 m!229631))

(assert (=> d!48046 m!229089))

(declare-fun m!229633 () Bool)

(assert (=> d!48046 m!229633))

(declare-fun m!229635 () Bool)

(assert (=> d!48046 m!229635))

(declare-fun m!229637 () Bool)

(assert (=> d!48046 m!229637))

(declare-fun m!229639 () Bool)

(assert (=> d!48046 m!229639))

(declare-fun m!229641 () Bool)

(assert (=> d!48046 m!229641))

(declare-fun m!229643 () Bool)

(assert (=> d!48046 m!229643))

(assert (=> d!48046 m!229401))

(declare-fun m!229645 () Bool)

(assert (=> d!48046 m!229645))

(assert (=> b!147827 d!48046))

(declare-fun d!48048 () Bool)

(assert (=> d!48048 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3013 (buf!3478 thiss!1634))) ((_ sign_extend 32) (currentByte!6386 thiss!1634)) ((_ sign_extend 32) (currentBit!6381 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3013 (buf!3478 thiss!1634))) ((_ sign_extend 32) (currentByte!6386 thiss!1634)) ((_ sign_extend 32) (currentBit!6381 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11744 () Bool)

(assert (= bs!11744 d!48048))

(declare-fun m!229647 () Bool)

(assert (=> bs!11744 m!229647))

(assert (=> b!147838 d!48048))

(declare-fun d!48050 () Bool)

(declare-fun res!123973 () Bool)

(declare-fun e!98787 () Bool)

(assert (=> d!48050 (=> (not res!123973) (not e!98787))))

(assert (=> d!48050 (= res!123973 (= (size!3013 (buf!3478 (_2!6945 lt!230110))) (size!3013 (buf!3478 (_2!6945 lt!230100)))))))

(assert (=> d!48050 (= (isPrefixOf!0 (_2!6945 lt!230110) (_2!6945 lt!230100)) e!98787)))

(declare-fun b!148104 () Bool)

(declare-fun res!123971 () Bool)

(assert (=> b!148104 (=> (not res!123971) (not e!98787))))

(assert (=> b!148104 (= res!123971 (bvsle (bitIndex!0 (size!3013 (buf!3478 (_2!6945 lt!230110))) (currentByte!6386 (_2!6945 lt!230110)) (currentBit!6381 (_2!6945 lt!230110))) (bitIndex!0 (size!3013 (buf!3478 (_2!6945 lt!230100))) (currentByte!6386 (_2!6945 lt!230100)) (currentBit!6381 (_2!6945 lt!230100)))))))

(declare-fun b!148105 () Bool)

(declare-fun e!98786 () Bool)

(assert (=> b!148105 (= e!98787 e!98786)))

(declare-fun res!123972 () Bool)

(assert (=> b!148105 (=> res!123972 e!98786)))

(assert (=> b!148105 (= res!123972 (= (size!3013 (buf!3478 (_2!6945 lt!230110))) #b00000000000000000000000000000000))))

(declare-fun b!148106 () Bool)

(assert (=> b!148106 (= e!98786 (arrayBitRangesEq!0 (buf!3478 (_2!6945 lt!230110)) (buf!3478 (_2!6945 lt!230100)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3013 (buf!3478 (_2!6945 lt!230110))) (currentByte!6386 (_2!6945 lt!230110)) (currentBit!6381 (_2!6945 lt!230110)))))))

(assert (= (and d!48050 res!123973) b!148104))

(assert (= (and b!148104 res!123971) b!148105))

(assert (= (and b!148105 (not res!123972)) b!148106))

(assert (=> b!148104 m!229041))

(assert (=> b!148104 m!229039))

(assert (=> b!148106 m!229041))

(assert (=> b!148106 m!229041))

(declare-fun m!229649 () Bool)

(assert (=> b!148106 m!229649))

(assert (=> b!147839 d!48050))

(declare-fun d!48052 () Bool)

(declare-fun e!98788 () Bool)

(assert (=> d!48052 e!98788))

(declare-fun res!123975 () Bool)

(assert (=> d!48052 (=> (not res!123975) (not e!98788))))

(declare-fun lt!230722 () (_ BitVec 64))

(declare-fun lt!230718 () (_ BitVec 64))

(declare-fun lt!230723 () (_ BitVec 64))

(assert (=> d!48052 (= res!123975 (= lt!230718 (bvsub lt!230722 lt!230723)))))

(assert (=> d!48052 (or (= (bvand lt!230722 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!230723 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!230722 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!230722 lt!230723) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48052 (= lt!230723 (remainingBits!0 ((_ sign_extend 32) (size!3013 (buf!3478 (_2!6945 lt!230110)))) ((_ sign_extend 32) (currentByte!6386 (_2!6945 lt!230110))) ((_ sign_extend 32) (currentBit!6381 (_2!6945 lt!230110)))))))

(declare-fun lt!230719 () (_ BitVec 64))

(declare-fun lt!230720 () (_ BitVec 64))

(assert (=> d!48052 (= lt!230722 (bvmul lt!230719 lt!230720))))

(assert (=> d!48052 (or (= lt!230719 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!230720 (bvsdiv (bvmul lt!230719 lt!230720) lt!230719)))))

(assert (=> d!48052 (= lt!230720 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!48052 (= lt!230719 ((_ sign_extend 32) (size!3013 (buf!3478 (_2!6945 lt!230110)))))))

(assert (=> d!48052 (= lt!230718 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6386 (_2!6945 lt!230110))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6381 (_2!6945 lt!230110)))))))

(assert (=> d!48052 (invariant!0 (currentBit!6381 (_2!6945 lt!230110)) (currentByte!6386 (_2!6945 lt!230110)) (size!3013 (buf!3478 (_2!6945 lt!230110))))))

(assert (=> d!48052 (= (bitIndex!0 (size!3013 (buf!3478 (_2!6945 lt!230110))) (currentByte!6386 (_2!6945 lt!230110)) (currentBit!6381 (_2!6945 lt!230110))) lt!230718)))

(declare-fun b!148107 () Bool)

(declare-fun res!123974 () Bool)

(assert (=> b!148107 (=> (not res!123974) (not e!98788))))

(assert (=> b!148107 (= res!123974 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!230718))))

(declare-fun b!148108 () Bool)

(declare-fun lt!230721 () (_ BitVec 64))

(assert (=> b!148108 (= e!98788 (bvsle lt!230718 (bvmul lt!230721 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!148108 (or (= lt!230721 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!230721 #b0000000000000000000000000000000000000000000000000000000000001000) lt!230721)))))

(assert (=> b!148108 (= lt!230721 ((_ sign_extend 32) (size!3013 (buf!3478 (_2!6945 lt!230110)))))))

(assert (= (and d!48052 res!123975) b!148107))

(assert (= (and b!148107 res!123974) b!148108))

(assert (=> d!48052 m!229597))

(declare-fun m!229651 () Bool)

(assert (=> d!48052 m!229651))

(assert (=> b!147835 d!48052))

(declare-fun d!48054 () Bool)

(declare-fun e!98789 () Bool)

(assert (=> d!48054 e!98789))

(declare-fun res!123977 () Bool)

(assert (=> d!48054 (=> (not res!123977) (not e!98789))))

(declare-fun lt!230724 () (_ BitVec 64))

(declare-fun lt!230729 () (_ BitVec 64))

(declare-fun lt!230728 () (_ BitVec 64))

(assert (=> d!48054 (= res!123977 (= lt!230724 (bvsub lt!230728 lt!230729)))))

(assert (=> d!48054 (or (= (bvand lt!230728 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!230729 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!230728 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!230728 lt!230729) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48054 (= lt!230729 (remainingBits!0 ((_ sign_extend 32) (size!3013 (buf!3478 thiss!1634))) ((_ sign_extend 32) (currentByte!6386 thiss!1634)) ((_ sign_extend 32) (currentBit!6381 thiss!1634))))))

(declare-fun lt!230725 () (_ BitVec 64))

(declare-fun lt!230726 () (_ BitVec 64))

(assert (=> d!48054 (= lt!230728 (bvmul lt!230725 lt!230726))))

(assert (=> d!48054 (or (= lt!230725 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!230726 (bvsdiv (bvmul lt!230725 lt!230726) lt!230725)))))

(assert (=> d!48054 (= lt!230726 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!48054 (= lt!230725 ((_ sign_extend 32) (size!3013 (buf!3478 thiss!1634))))))

(assert (=> d!48054 (= lt!230724 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6386 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6381 thiss!1634))))))

(assert (=> d!48054 (invariant!0 (currentBit!6381 thiss!1634) (currentByte!6386 thiss!1634) (size!3013 (buf!3478 thiss!1634)))))

(assert (=> d!48054 (= (bitIndex!0 (size!3013 (buf!3478 thiss!1634)) (currentByte!6386 thiss!1634) (currentBit!6381 thiss!1634)) lt!230724)))

(declare-fun b!148109 () Bool)

(declare-fun res!123976 () Bool)

(assert (=> b!148109 (=> (not res!123976) (not e!98789))))

(assert (=> b!148109 (= res!123976 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!230724))))

(declare-fun b!148110 () Bool)

(declare-fun lt!230727 () (_ BitVec 64))

(assert (=> b!148110 (= e!98789 (bvsle lt!230724 (bvmul lt!230727 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!148110 (or (= lt!230727 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!230727 #b0000000000000000000000000000000000000000000000000000000000001000) lt!230727)))))

(assert (=> b!148110 (= lt!230727 ((_ sign_extend 32) (size!3013 (buf!3478 thiss!1634))))))

(assert (= (and d!48054 res!123977) b!148109))

(assert (= (and b!148109 res!123976) b!148110))

(assert (=> d!48054 m!229647))

(assert (=> d!48054 m!229097))

(assert (=> b!147835 d!48054))

(declare-fun d!48056 () Bool)

(declare-fun lt!230730 () tuple3!578)

(assert (=> d!48056 (= lt!230730 (readByteArrayLoop!0 (_1!6947 lt!230114) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!48056 (= (readByteArrayLoopPure!0 (_1!6947 lt!230114) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13175 (_2!6959 lt!230730) (_3!360 lt!230730)))))

(declare-fun bs!11745 () Bool)

(assert (= bs!11745 d!48056))

(declare-fun m!229653 () Bool)

(assert (=> bs!11745 m!229653))

(assert (=> b!147836 d!48056))

(declare-fun d!48058 () Bool)

(assert (=> d!48058 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3013 (buf!3478 (_2!6945 lt!230100)))) ((_ sign_extend 32) (currentByte!6386 (_2!6945 lt!230110))) ((_ sign_extend 32) (currentBit!6381 (_2!6945 lt!230110))) lt!230118) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3013 (buf!3478 (_2!6945 lt!230100)))) ((_ sign_extend 32) (currentByte!6386 (_2!6945 lt!230110))) ((_ sign_extend 32) (currentBit!6381 (_2!6945 lt!230110)))) lt!230118))))

(declare-fun bs!11746 () Bool)

(assert (= bs!11746 d!48058))

(assert (=> bs!11746 m!229421))

(assert (=> b!147836 d!48058))

(declare-fun d!48060 () Bool)

(assert (=> d!48060 (validate_offset_bits!1 ((_ sign_extend 32) (size!3013 (buf!3478 (_2!6945 lt!230100)))) ((_ sign_extend 32) (currentByte!6386 (_2!6945 lt!230110))) ((_ sign_extend 32) (currentBit!6381 (_2!6945 lt!230110))) lt!230118)))

(declare-fun lt!230733 () Unit!9314)

(declare-fun choose!9 (BitStream!5284 array!6659 (_ BitVec 64) BitStream!5284) Unit!9314)

(assert (=> d!48060 (= lt!230733 (choose!9 (_2!6945 lt!230110) (buf!3478 (_2!6945 lt!230100)) lt!230118 (BitStream!5285 (buf!3478 (_2!6945 lt!230100)) (currentByte!6386 (_2!6945 lt!230110)) (currentBit!6381 (_2!6945 lt!230110)))))))

(assert (=> d!48060 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6945 lt!230110) (buf!3478 (_2!6945 lt!230100)) lt!230118) lt!230733)))

(declare-fun bs!11747 () Bool)

(assert (= bs!11747 d!48060))

(assert (=> bs!11747 m!229013))

(declare-fun m!229655 () Bool)

(assert (=> bs!11747 m!229655))

(assert (=> b!147836 d!48060))

(assert (=> b!147836 d!47946))

(declare-fun d!48062 () Bool)

(declare-fun res!123978 () Bool)

(declare-fun e!98790 () Bool)

(assert (=> d!48062 (=> res!123978 e!98790)))

(assert (=> d!48062 (= res!123978 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!48062 (= (arrayRangesEq!329 (_2!6946 lt!230106) (_2!6946 lt!230098) #b00000000000000000000000000000000 to!404) e!98790)))

(declare-fun b!148111 () Bool)

(declare-fun e!98791 () Bool)

(assert (=> b!148111 (= e!98790 e!98791)))

(declare-fun res!123979 () Bool)

(assert (=> b!148111 (=> (not res!123979) (not e!98791))))

(assert (=> b!148111 (= res!123979 (= (select (arr!3782 (_2!6946 lt!230106)) #b00000000000000000000000000000000) (select (arr!3782 (_2!6946 lt!230098)) #b00000000000000000000000000000000)))))

(declare-fun b!148112 () Bool)

(assert (=> b!148112 (= e!98791 (arrayRangesEq!329 (_2!6946 lt!230106) (_2!6946 lt!230098) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48062 (not res!123978)) b!148111))

(assert (= (and b!148111 res!123979) b!148112))

(assert (=> b!148111 m!229601))

(assert (=> b!148111 m!229581))

(declare-fun m!229657 () Bool)

(assert (=> b!148112 m!229657))

(assert (=> b!147832 d!48062))

(declare-fun d!48064 () Bool)

(assert (=> d!48064 (arrayRangesEq!329 (_2!6946 lt!230106) (_2!6946 lt!230098) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!230736 () Unit!9314)

(declare-fun choose!84 (array!6659 array!6659 (_ BitVec 32) (_ BitVec 32)) Unit!9314)

(assert (=> d!48064 (= lt!230736 (choose!84 (_2!6946 lt!230098) (_2!6946 lt!230106) #b00000000000000000000000000000000 to!404))))

(assert (=> d!48064 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 to!404) (bvsle to!404 (size!3013 (_2!6946 lt!230098))))))

(assert (=> d!48064 (= (arrayRangesEqSymmetricLemma!61 (_2!6946 lt!230098) (_2!6946 lt!230106) #b00000000000000000000000000000000 to!404) lt!230736)))

(declare-fun bs!11748 () Bool)

(assert (= bs!11748 d!48064))

(assert (=> bs!11748 m!229035))

(declare-fun m!229659 () Bool)

(assert (=> bs!11748 m!229659))

(assert (=> b!147832 d!48064))

(declare-fun d!48066 () Bool)

(declare-fun lt!230737 () tuple2!13198)

(assert (=> d!48066 (= lt!230737 (readByte!0 (_1!6947 lt!230111)))))

(assert (=> d!48066 (= (readBytePure!0 (_1!6947 lt!230111)) (tuple2!13179 (_2!6960 lt!230737) (_1!6960 lt!230737)))))

(declare-fun bs!11749 () Bool)

(assert (= bs!11749 d!48066))

(declare-fun m!229661 () Bool)

(assert (=> bs!11749 m!229661))

(assert (=> b!147833 d!48066))

(declare-fun lt!230741 () (_ BitVec 64))

(declare-fun b!148113 () Bool)

(declare-fun lt!230747 () (_ BitVec 64))

(declare-fun e!98793 () Bool)

(declare-fun lt!230753 () tuple2!13176)

(assert (=> b!148113 (= e!98793 (= (_1!6947 lt!230753) (withMovedBitIndex!0 (_2!6947 lt!230753) (bvsub lt!230747 lt!230741))))))

(assert (=> b!148113 (or (= (bvand lt!230747 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!230741 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!230747 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!230747 lt!230741) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!148113 (= lt!230741 (bitIndex!0 (size!3013 (buf!3478 (_2!6945 lt!230110))) (currentByte!6386 (_2!6945 lt!230110)) (currentBit!6381 (_2!6945 lt!230110))))))

(assert (=> b!148113 (= lt!230747 (bitIndex!0 (size!3013 (buf!3478 thiss!1634)) (currentByte!6386 thiss!1634) (currentBit!6381 thiss!1634)))))

(declare-fun b!148115 () Bool)

(declare-fun e!98792 () Unit!9314)

(declare-fun lt!230751 () Unit!9314)

(assert (=> b!148115 (= e!98792 lt!230751)))

(declare-fun lt!230744 () (_ BitVec 64))

(assert (=> b!148115 (= lt!230744 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!230757 () (_ BitVec 64))

(assert (=> b!148115 (= lt!230757 (bitIndex!0 (size!3013 (buf!3478 thiss!1634)) (currentByte!6386 thiss!1634) (currentBit!6381 thiss!1634)))))

(assert (=> b!148115 (= lt!230751 (arrayBitRangesEqSymmetric!0 (buf!3478 thiss!1634) (buf!3478 (_2!6945 lt!230110)) lt!230744 lt!230757))))

(assert (=> b!148115 (arrayBitRangesEq!0 (buf!3478 (_2!6945 lt!230110)) (buf!3478 thiss!1634) lt!230744 lt!230757)))

(declare-fun b!148116 () Bool)

(declare-fun Unit!9325 () Unit!9314)

(assert (=> b!148116 (= e!98792 Unit!9325)))

(declare-fun b!148117 () Bool)

(declare-fun res!123980 () Bool)

(assert (=> b!148117 (=> (not res!123980) (not e!98793))))

(assert (=> b!148117 (= res!123980 (isPrefixOf!0 (_2!6947 lt!230753) (_2!6945 lt!230110)))))

(declare-fun b!148114 () Bool)

(declare-fun res!123982 () Bool)

(assert (=> b!148114 (=> (not res!123982) (not e!98793))))

(assert (=> b!148114 (= res!123982 (isPrefixOf!0 (_1!6947 lt!230753) thiss!1634))))

(declare-fun d!48068 () Bool)

(assert (=> d!48068 e!98793))

(declare-fun res!123981 () Bool)

(assert (=> d!48068 (=> (not res!123981) (not e!98793))))

(assert (=> d!48068 (= res!123981 (isPrefixOf!0 (_1!6947 lt!230753) (_2!6947 lt!230753)))))

(declare-fun lt!230748 () BitStream!5284)

(assert (=> d!48068 (= lt!230753 (tuple2!13177 lt!230748 (_2!6945 lt!230110)))))

(declare-fun lt!230738 () Unit!9314)

(declare-fun lt!230754 () Unit!9314)

(assert (=> d!48068 (= lt!230738 lt!230754)))

(assert (=> d!48068 (isPrefixOf!0 lt!230748 (_2!6945 lt!230110))))

(assert (=> d!48068 (= lt!230754 (lemmaIsPrefixTransitive!0 lt!230748 (_2!6945 lt!230110) (_2!6945 lt!230110)))))

(declare-fun lt!230739 () Unit!9314)

(declare-fun lt!230750 () Unit!9314)

(assert (=> d!48068 (= lt!230739 lt!230750)))

(assert (=> d!48068 (isPrefixOf!0 lt!230748 (_2!6945 lt!230110))))

(assert (=> d!48068 (= lt!230750 (lemmaIsPrefixTransitive!0 lt!230748 thiss!1634 (_2!6945 lt!230110)))))

(declare-fun lt!230752 () Unit!9314)

(assert (=> d!48068 (= lt!230752 e!98792)))

(declare-fun c!8004 () Bool)

(assert (=> d!48068 (= c!8004 (not (= (size!3013 (buf!3478 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!230749 () Unit!9314)

(declare-fun lt!230746 () Unit!9314)

(assert (=> d!48068 (= lt!230749 lt!230746)))

(assert (=> d!48068 (isPrefixOf!0 (_2!6945 lt!230110) (_2!6945 lt!230110))))

(assert (=> d!48068 (= lt!230746 (lemmaIsPrefixRefl!0 (_2!6945 lt!230110)))))

(declare-fun lt!230743 () Unit!9314)

(declare-fun lt!230755 () Unit!9314)

(assert (=> d!48068 (= lt!230743 lt!230755)))

(assert (=> d!48068 (= lt!230755 (lemmaIsPrefixRefl!0 (_2!6945 lt!230110)))))

(declare-fun lt!230742 () Unit!9314)

(declare-fun lt!230745 () Unit!9314)

(assert (=> d!48068 (= lt!230742 lt!230745)))

(assert (=> d!48068 (isPrefixOf!0 lt!230748 lt!230748)))

(assert (=> d!48068 (= lt!230745 (lemmaIsPrefixRefl!0 lt!230748))))

(declare-fun lt!230740 () Unit!9314)

(declare-fun lt!230756 () Unit!9314)

(assert (=> d!48068 (= lt!230740 lt!230756)))

(assert (=> d!48068 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!48068 (= lt!230756 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!48068 (= lt!230748 (BitStream!5285 (buf!3478 (_2!6945 lt!230110)) (currentByte!6386 thiss!1634) (currentBit!6381 thiss!1634)))))

(assert (=> d!48068 (isPrefixOf!0 thiss!1634 (_2!6945 lt!230110))))

(assert (=> d!48068 (= (reader!0 thiss!1634 (_2!6945 lt!230110)) lt!230753)))

(assert (= (and d!48068 c!8004) b!148115))

(assert (= (and d!48068 (not c!8004)) b!148116))

(assert (= (and d!48068 res!123981) b!148114))

(assert (= (and b!148114 res!123982) b!148117))

(assert (= (and b!148117 res!123980) b!148113))

(assert (=> b!148115 m!229045))

(declare-fun m!229663 () Bool)

(assert (=> b!148115 m!229663))

(declare-fun m!229665 () Bool)

(assert (=> b!148115 m!229665))

(declare-fun m!229667 () Bool)

(assert (=> b!148113 m!229667))

(assert (=> b!148113 m!229041))

(assert (=> b!148113 m!229045))

(declare-fun m!229669 () Bool)

(assert (=> b!148114 m!229669))

(declare-fun m!229671 () Bool)

(assert (=> b!148117 m!229671))

(assert (=> d!48068 m!229389))

(declare-fun m!229673 () Bool)

(assert (=> d!48068 m!229673))

(assert (=> d!48068 m!229101))

(assert (=> d!48068 m!229633))

(assert (=> d!48068 m!229635))

(declare-fun m!229675 () Bool)

(assert (=> d!48068 m!229675))

(declare-fun m!229677 () Bool)

(assert (=> d!48068 m!229677))

(declare-fun m!229679 () Bool)

(assert (=> d!48068 m!229679))

(declare-fun m!229681 () Bool)

(assert (=> d!48068 m!229681))

(assert (=> d!48068 m!229387))

(declare-fun m!229683 () Bool)

(assert (=> d!48068 m!229683))

(assert (=> b!147833 d!48068))

(declare-fun d!48070 () Bool)

(assert (=> d!48070 (= (array_inv!2802 arr!237) (bvsge (size!3013 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!28542 d!48070))

(declare-fun d!48072 () Bool)

(assert (=> d!48072 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6381 thiss!1634) (currentByte!6386 thiss!1634) (size!3013 (buf!3478 thiss!1634))))))

(declare-fun bs!11750 () Bool)

(assert (= bs!11750 d!48072))

(assert (=> bs!11750 m!229097))

(assert (=> start!28542 d!48072))

(declare-fun d!48074 () Bool)

(assert (=> d!48074 (= (array_inv!2802 (buf!3478 thiss!1634)) (bvsge (size!3013 (buf!3478 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!147829 d!48074))

(declare-fun d!48076 () Bool)

(declare-fun res!123985 () Bool)

(declare-fun e!98795 () Bool)

(assert (=> d!48076 (=> (not res!123985) (not e!98795))))

(assert (=> d!48076 (= res!123985 (= (size!3013 (buf!3478 thiss!1634)) (size!3013 (buf!3478 (_2!6945 lt!230110)))))))

(assert (=> d!48076 (= (isPrefixOf!0 thiss!1634 (_2!6945 lt!230110)) e!98795)))

(declare-fun b!148118 () Bool)

(declare-fun res!123983 () Bool)

(assert (=> b!148118 (=> (not res!123983) (not e!98795))))

(assert (=> b!148118 (= res!123983 (bvsle (bitIndex!0 (size!3013 (buf!3478 thiss!1634)) (currentByte!6386 thiss!1634) (currentBit!6381 thiss!1634)) (bitIndex!0 (size!3013 (buf!3478 (_2!6945 lt!230110))) (currentByte!6386 (_2!6945 lt!230110)) (currentBit!6381 (_2!6945 lt!230110)))))))

(declare-fun b!148119 () Bool)

(declare-fun e!98794 () Bool)

(assert (=> b!148119 (= e!98795 e!98794)))

(declare-fun res!123984 () Bool)

(assert (=> b!148119 (=> res!123984 e!98794)))

(assert (=> b!148119 (= res!123984 (= (size!3013 (buf!3478 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!148120 () Bool)

(assert (=> b!148120 (= e!98794 (arrayBitRangesEq!0 (buf!3478 thiss!1634) (buf!3478 (_2!6945 lt!230110)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3013 (buf!3478 thiss!1634)) (currentByte!6386 thiss!1634) (currentBit!6381 thiss!1634))))))

(assert (= (and d!48076 res!123985) b!148118))

(assert (= (and b!148118 res!123983) b!148119))

(assert (= (and b!148119 (not res!123984)) b!148120))

(assert (=> b!148118 m!229045))

(assert (=> b!148118 m!229041))

(assert (=> b!148120 m!229045))

(assert (=> b!148120 m!229045))

(declare-fun m!229685 () Bool)

(assert (=> b!148120 m!229685))

(assert (=> b!147840 d!48076))

(declare-fun d!48078 () Bool)

(declare-fun e!98796 () Bool)

(assert (=> d!48078 e!98796))

(declare-fun res!123987 () Bool)

(assert (=> d!48078 (=> (not res!123987) (not e!98796))))

(declare-fun lt!230758 () (_ BitVec 64))

(declare-fun lt!230762 () (_ BitVec 64))

(declare-fun lt!230763 () (_ BitVec 64))

(assert (=> d!48078 (= res!123987 (= lt!230758 (bvsub lt!230762 lt!230763)))))

(assert (=> d!48078 (or (= (bvand lt!230762 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!230763 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!230762 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!230762 lt!230763) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48078 (= lt!230763 (remainingBits!0 ((_ sign_extend 32) (size!3013 (buf!3478 (_2!6945 lt!230100)))) ((_ sign_extend 32) (currentByte!6386 (_2!6945 lt!230100))) ((_ sign_extend 32) (currentBit!6381 (_2!6945 lt!230100)))))))

(declare-fun lt!230759 () (_ BitVec 64))

(declare-fun lt!230760 () (_ BitVec 64))

(assert (=> d!48078 (= lt!230762 (bvmul lt!230759 lt!230760))))

(assert (=> d!48078 (or (= lt!230759 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!230760 (bvsdiv (bvmul lt!230759 lt!230760) lt!230759)))))

(assert (=> d!48078 (= lt!230760 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!48078 (= lt!230759 ((_ sign_extend 32) (size!3013 (buf!3478 (_2!6945 lt!230100)))))))

(assert (=> d!48078 (= lt!230758 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6386 (_2!6945 lt!230100))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6381 (_2!6945 lt!230100)))))))

(assert (=> d!48078 (invariant!0 (currentBit!6381 (_2!6945 lt!230100)) (currentByte!6386 (_2!6945 lt!230100)) (size!3013 (buf!3478 (_2!6945 lt!230100))))))

(assert (=> d!48078 (= (bitIndex!0 (size!3013 (buf!3478 (_2!6945 lt!230100))) (currentByte!6386 (_2!6945 lt!230100)) (currentBit!6381 (_2!6945 lt!230100))) lt!230758)))

(declare-fun b!148121 () Bool)

(declare-fun res!123986 () Bool)

(assert (=> b!148121 (=> (not res!123986) (not e!98796))))

(assert (=> b!148121 (= res!123986 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!230758))))

(declare-fun b!148122 () Bool)

(declare-fun lt!230761 () (_ BitVec 64))

(assert (=> b!148122 (= e!98796 (bvsle lt!230758 (bvmul lt!230761 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!148122 (or (= lt!230761 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!230761 #b0000000000000000000000000000000000000000000000000000000000001000) lt!230761)))))

(assert (=> b!148122 (= lt!230761 ((_ sign_extend 32) (size!3013 (buf!3478 (_2!6945 lt!230100)))))))

(assert (= (and d!48078 res!123987) b!148121))

(assert (= (and b!148121 res!123986) b!148122))

(declare-fun m!229687 () Bool)

(assert (=> d!48078 m!229687))

(declare-fun m!229689 () Bool)

(assert (=> d!48078 m!229689))

(assert (=> b!147830 d!48078))

(assert (=> b!147830 d!48052))

(declare-fun d!48080 () Bool)

(assert (=> d!48080 (= (invariant!0 (currentBit!6381 thiss!1634) (currentByte!6386 thiss!1634) (size!3013 (buf!3478 thiss!1634))) (and (bvsge (currentBit!6381 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6381 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6386 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6386 thiss!1634) (size!3013 (buf!3478 thiss!1634))) (and (= (currentBit!6381 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6386 thiss!1634) (size!3013 (buf!3478 thiss!1634)))))))))

(assert (=> b!147831 d!48080))

(push 1)

(assert (not d!47956))

(assert (not b!147966))

(assert (not b!148002))

(assert (not d!47946))

(assert (not d!48064))

(assert (not d!48007))

(assert (not b!148004))

(assert (not d!47932))

(assert (not d!47952))

(assert (not d!48054))

(assert (not b!148117))

(assert (not b!148113))

(assert (not b!148057))

(assert (not b!148101))

(assert (not b!148006))

(assert (not d!48052))

(assert (not d!47948))

(assert (not d!48026))

(assert (not d!48048))

(assert (not d!48066))

(assert (not b!148118))

(assert (not d!47942))

(assert (not d!48003))

(assert (not d!48068))

(assert (not d!48036))

(assert (not b!148080))

(assert (not b!148089))

(assert (not b!148096))

(assert (not d!48034))

(assert (not d!48046))

(assert (not d!48072))

(assert (not b!148056))

(assert (not b!148060))

(assert (not b!148114))

(assert (not b!148076))

(assert (not b!148059))

(assert (not b!148087))

(assert (not d!48044))

(assert (not d!48056))

(assert (not d!48040))

(assert (not b!148103))

(assert (not b!148104))

(assert (not d!48030))

(assert (not b!148112))

(assert (not b!148115))

(assert (not b!148106))

(assert (not b!148097))

(assert (not b!148100))

(assert (not d!48028))

(assert (not b!148099))

(assert (not d!48078))

(assert (not b!148098))

(assert (not b!148003))

(assert (not d!48058))

(assert (not d!47936))

(assert (not d!48011))

(assert (not d!48060))

(assert (not d!47940))

(assert (not d!47944))

(assert (not b!148074))

(assert (not d!47954))

(assert (not b!148120))

(assert (not b!148058))

(assert (not d!48032))

(check-sat)

(pop 1)

(push 1)

(check-sat)

