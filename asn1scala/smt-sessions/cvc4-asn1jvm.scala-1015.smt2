; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28930 () Bool)

(assert start!28930)

(declare-fun b!150227 () Bool)

(declare-fun e!100305 () Bool)

(declare-datatypes ((array!6723 0))(
  ( (array!6724 (arr!3835 (Array (_ BitVec 32) (_ BitVec 8))) (size!3042 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5342 0))(
  ( (BitStream!5343 (buf!3523 array!6723) (currentByte!6443 (_ BitVec 32)) (currentBit!6438 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5342)

(declare-datatypes ((Unit!9484 0))(
  ( (Unit!9485) )
))
(declare-datatypes ((tuple2!13420 0))(
  ( (tuple2!13421 (_1!7077 Unit!9484) (_2!7077 BitStream!5342)) )
))
(declare-fun lt!234783 () tuple2!13420)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!150227 (= e!100305 (invariant!0 (currentBit!6438 thiss!1634) (currentByte!6443 thiss!1634) (size!3042 (buf!3523 (_2!7077 lt!234783)))))))

(declare-fun b!150228 () Bool)

(declare-fun res!125910 () Bool)

(declare-fun e!100308 () Bool)

(assert (=> b!150228 (=> (not res!125910) (not e!100308))))

(declare-fun isPrefixOf!0 (BitStream!5342 BitStream!5342) Bool)

(assert (=> b!150228 (= res!125910 (isPrefixOf!0 thiss!1634 (_2!7077 lt!234783)))))

(declare-fun b!150229 () Bool)

(declare-fun e!100313 () Bool)

(declare-fun e!100307 () Bool)

(assert (=> b!150229 (= e!100313 (not e!100307))))

(declare-fun res!125907 () Bool)

(assert (=> b!150229 (=> res!125907 e!100307)))

(declare-fun arr!237 () array!6723)

(declare-datatypes ((tuple2!13422 0))(
  ( (tuple2!13423 (_1!7078 BitStream!5342) (_2!7078 BitStream!5342)) )
))
(declare-fun lt!234785 () tuple2!13422)

(declare-datatypes ((tuple2!13424 0))(
  ( (tuple2!13425 (_1!7079 BitStream!5342) (_2!7079 array!6723)) )
))
(declare-fun lt!234775 () tuple2!13424)

(assert (=> b!150229 (= res!125907 (or (not (= (size!3042 (_2!7079 lt!234775)) (size!3042 arr!237))) (not (= (_1!7079 lt!234775) (_2!7078 lt!234785)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!5342 array!6723 (_ BitVec 32) (_ BitVec 32)) tuple2!13424)

(assert (=> b!150229 (= lt!234775 (readByteArrayLoopPure!0 (_1!7078 lt!234785) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!234765 () tuple2!13420)

(declare-fun lt!234769 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!150229 (validate_offset_bits!1 ((_ sign_extend 32) (size!3042 (buf!3523 (_2!7077 lt!234765)))) ((_ sign_extend 32) (currentByte!6443 (_2!7077 lt!234783))) ((_ sign_extend 32) (currentBit!6438 (_2!7077 lt!234783))) lt!234769)))

(declare-fun lt!234773 () Unit!9484)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5342 array!6723 (_ BitVec 64)) Unit!9484)

(assert (=> b!150229 (= lt!234773 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!7077 lt!234783) (buf!3523 (_2!7077 lt!234765)) lt!234769))))

(declare-fun reader!0 (BitStream!5342 BitStream!5342) tuple2!13422)

(assert (=> b!150229 (= lt!234785 (reader!0 (_2!7077 lt!234783) (_2!7077 lt!234765)))))

(declare-fun b!150230 () Bool)

(declare-fun e!100310 () Bool)

(declare-fun array_inv!2831 (array!6723) Bool)

(assert (=> b!150230 (= e!100310 (array_inv!2831 (buf!3523 thiss!1634)))))

(declare-fun b!150231 () Bool)

(declare-fun res!125905 () Bool)

(declare-fun e!100312 () Bool)

(assert (=> b!150231 (=> (not res!125905) (not e!100312))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!150231 (= res!125905 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3042 (buf!3523 thiss!1634))) ((_ sign_extend 32) (currentByte!6443 thiss!1634)) ((_ sign_extend 32) (currentBit!6438 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!150232 () Bool)

(declare-fun e!100311 () Bool)

(declare-datatypes ((tuple2!13426 0))(
  ( (tuple2!13427 (_1!7080 BitStream!5342) (_2!7080 (_ BitVec 8))) )
))
(declare-fun lt!234778 () tuple2!13426)

(declare-fun lt!234759 () tuple2!13426)

(assert (=> b!150232 (= e!100311 (= (_2!7080 lt!234778) (_2!7080 lt!234759)))))

(declare-fun b!150233 () Bool)

(declare-fun e!100309 () Bool)

(assert (=> b!150233 (= e!100309 true)))

(declare-fun lt!234771 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!150233 (= lt!234771 (bitIndex!0 (size!3042 (buf!3523 (_2!7077 lt!234765))) (currentByte!6443 (_2!7077 lt!234765)) (currentBit!6438 (_2!7077 lt!234765))))))

(declare-fun lt!234772 () (_ BitVec 64))

(assert (=> b!150233 (= lt!234772 (bitIndex!0 (size!3042 (buf!3523 thiss!1634)) (currentByte!6443 thiss!1634) (currentBit!6438 thiss!1634)))))

(declare-fun b!150234 () Bool)

(declare-fun e!100315 () Bool)

(assert (=> b!150234 (= e!100315 e!100309)))

(declare-fun res!125903 () Bool)

(assert (=> b!150234 (=> res!125903 e!100309)))

(assert (=> b!150234 (= res!125903 (not (= (size!3042 (buf!3523 thiss!1634)) (size!3042 (buf!3523 (_2!7077 lt!234765))))))))

(declare-fun lt!234760 () tuple2!13424)

(declare-fun arrayRangesEq!358 (array!6723 array!6723 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!150234 (arrayRangesEq!358 arr!237 (_2!7079 lt!234760) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!234768 () Unit!9484)

(declare-fun lt!234781 () tuple2!13424)

(declare-fun arrayRangesEqTransitive!73 (array!6723 array!6723 array!6723 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9484)

(assert (=> b!150234 (= lt!234768 (arrayRangesEqTransitive!73 arr!237 (_2!7079 lt!234781) (_2!7079 lt!234760) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> b!150234 (arrayRangesEq!358 (_2!7079 lt!234781) (_2!7079 lt!234760) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!234762 () Unit!9484)

(declare-fun arrayRangesEqSymmetricLemma!90 (array!6723 array!6723 (_ BitVec 32) (_ BitVec 32)) Unit!9484)

(assert (=> b!150234 (= lt!234762 (arrayRangesEqSymmetricLemma!90 (_2!7079 lt!234760) (_2!7079 lt!234781) #b00000000000000000000000000000000 to!404))))

(declare-fun b!150235 () Bool)

(declare-fun res!125900 () Bool)

(assert (=> b!150235 (=> (not res!125900) (not e!100312))))

(assert (=> b!150235 (= res!125900 (invariant!0 (currentBit!6438 thiss!1634) (currentByte!6443 thiss!1634) (size!3042 (buf!3523 thiss!1634))))))

(declare-fun lt!234780 () tuple2!13422)

(declare-fun b!150236 () Bool)

(declare-fun lt!234776 () tuple2!13426)

(assert (=> b!150236 (= e!100308 (and (= (_2!7080 lt!234776) (select (arr!3835 arr!237) from!447)) (= (_1!7080 lt!234776) (_2!7078 lt!234780))))))

(declare-fun readBytePure!0 (BitStream!5342) tuple2!13426)

(assert (=> b!150236 (= lt!234776 (readBytePure!0 (_1!7078 lt!234780)))))

(assert (=> b!150236 (= lt!234780 (reader!0 thiss!1634 (_2!7077 lt!234783)))))

(declare-fun b!150237 () Bool)

(declare-fun res!125909 () Bool)

(assert (=> b!150237 (=> (not res!125909) (not e!100313))))

(assert (=> b!150237 (= res!125909 (isPrefixOf!0 (_2!7077 lt!234783) (_2!7077 lt!234765)))))

(declare-fun b!150238 () Bool)

(declare-fun res!125906 () Bool)

(assert (=> b!150238 (=> (not res!125906) (not e!100312))))

(assert (=> b!150238 (= res!125906 (bvslt from!447 to!404))))

(declare-fun res!125901 () Bool)

(assert (=> start!28930 (=> (not res!125901) (not e!100312))))

(assert (=> start!28930 (= res!125901 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3042 arr!237))))))

(assert (=> start!28930 e!100312))

(assert (=> start!28930 true))

(assert (=> start!28930 (array_inv!2831 arr!237)))

(declare-fun inv!12 (BitStream!5342) Bool)

(assert (=> start!28930 (and (inv!12 thiss!1634) e!100310)))

(declare-fun b!150239 () Bool)

(declare-fun e!100304 () Bool)

(assert (=> b!150239 (= e!100304 e!100313)))

(declare-fun res!125898 () Bool)

(assert (=> b!150239 (=> (not res!125898) (not e!100313))))

(assert (=> b!150239 (= res!125898 (= (bitIndex!0 (size!3042 (buf!3523 (_2!7077 lt!234765))) (currentByte!6443 (_2!7077 lt!234765)) (currentBit!6438 (_2!7077 lt!234765))) (bvadd (bitIndex!0 (size!3042 (buf!3523 (_2!7077 lt!234783))) (currentByte!6443 (_2!7077 lt!234783)) (currentBit!6438 (_2!7077 lt!234783))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!234769))))))

(assert (=> b!150239 (= lt!234769 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!150240 () Bool)

(assert (=> b!150240 (= e!100312 (not e!100315))))

(declare-fun res!125911 () Bool)

(assert (=> b!150240 (=> res!125911 e!100315)))

(assert (=> b!150240 (= res!125911 (not (arrayRangesEq!358 (_2!7079 lt!234760) (_2!7079 lt!234781) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!234779 () tuple2!13424)

(assert (=> b!150240 (arrayRangesEq!358 (_2!7079 lt!234760) (_2!7079 lt!234779) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!234767 () Unit!9484)

(declare-fun lt!234786 () tuple2!13422)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5342 array!6723 (_ BitVec 32) (_ BitVec 32)) Unit!9484)

(assert (=> b!150240 (= lt!234767 (readByteArrayLoopArrayPrefixLemma!0 (_1!7078 lt!234786) arr!237 from!447 to!404))))

(declare-fun lt!234758 () array!6723)

(declare-fun withMovedByteIndex!0 (BitStream!5342 (_ BitVec 32)) BitStream!5342)

(assert (=> b!150240 (= lt!234779 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!7078 lt!234786) #b00000000000000000000000000000001) lt!234758 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!234766 () tuple2!13422)

(assert (=> b!150240 (= lt!234781 (readByteArrayLoopPure!0 (_1!7078 lt!234766) lt!234758 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!234763 () tuple2!13426)

(assert (=> b!150240 (= lt!234758 (array!6724 (store (arr!3835 arr!237) from!447 (_2!7080 lt!234763)) (size!3042 arr!237)))))

(declare-fun lt!234782 () (_ BitVec 32))

(assert (=> b!150240 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3042 (buf!3523 (_2!7077 lt!234765)))) ((_ sign_extend 32) (currentByte!6443 (_2!7077 lt!234783))) ((_ sign_extend 32) (currentBit!6438 (_2!7077 lt!234783))) lt!234782)))

(declare-fun lt!234761 () Unit!9484)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5342 array!6723 (_ BitVec 32)) Unit!9484)

(assert (=> b!150240 (= lt!234761 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!7077 lt!234783) (buf!3523 (_2!7077 lt!234765)) lt!234782))))

(assert (=> b!150240 (= (_1!7079 lt!234760) (_2!7078 lt!234786))))

(assert (=> b!150240 (= lt!234760 (readByteArrayLoopPure!0 (_1!7078 lt!234786) arr!237 from!447 to!404))))

(assert (=> b!150240 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3042 (buf!3523 (_2!7077 lt!234765)))) ((_ sign_extend 32) (currentByte!6443 thiss!1634)) ((_ sign_extend 32) (currentBit!6438 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!234784 () Unit!9484)

(assert (=> b!150240 (= lt!234784 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3523 (_2!7077 lt!234765)) (bvsub to!404 from!447)))))

(assert (=> b!150240 (= (_2!7080 lt!234763) (select (arr!3835 arr!237) from!447))))

(assert (=> b!150240 (= lt!234763 (readBytePure!0 (_1!7078 lt!234786)))))

(assert (=> b!150240 (= lt!234766 (reader!0 (_2!7077 lt!234783) (_2!7077 lt!234765)))))

(assert (=> b!150240 (= lt!234786 (reader!0 thiss!1634 (_2!7077 lt!234765)))))

(assert (=> b!150240 e!100311))

(declare-fun res!125899 () Bool)

(assert (=> b!150240 (=> (not res!125899) (not e!100311))))

(assert (=> b!150240 (= res!125899 (= (bitIndex!0 (size!3042 (buf!3523 (_1!7080 lt!234778))) (currentByte!6443 (_1!7080 lt!234778)) (currentBit!6438 (_1!7080 lt!234778))) (bitIndex!0 (size!3042 (buf!3523 (_1!7080 lt!234759))) (currentByte!6443 (_1!7080 lt!234759)) (currentBit!6438 (_1!7080 lt!234759)))))))

(declare-fun lt!234774 () Unit!9484)

(declare-fun lt!234764 () BitStream!5342)

(declare-fun readBytePrefixLemma!0 (BitStream!5342 BitStream!5342) Unit!9484)

(assert (=> b!150240 (= lt!234774 (readBytePrefixLemma!0 lt!234764 (_2!7077 lt!234765)))))

(assert (=> b!150240 (= lt!234759 (readBytePure!0 (BitStream!5343 (buf!3523 (_2!7077 lt!234765)) (currentByte!6443 thiss!1634) (currentBit!6438 thiss!1634))))))

(assert (=> b!150240 (= lt!234778 (readBytePure!0 lt!234764))))

(assert (=> b!150240 (= lt!234764 (BitStream!5343 (buf!3523 (_2!7077 lt!234783)) (currentByte!6443 thiss!1634) (currentBit!6438 thiss!1634)))))

(assert (=> b!150240 e!100305))

(declare-fun res!125902 () Bool)

(assert (=> b!150240 (=> (not res!125902) (not e!100305))))

(assert (=> b!150240 (= res!125902 (isPrefixOf!0 thiss!1634 (_2!7077 lt!234765)))))

(declare-fun lt!234770 () Unit!9484)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5342 BitStream!5342 BitStream!5342) Unit!9484)

(assert (=> b!150240 (= lt!234770 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!7077 lt!234783) (_2!7077 lt!234765)))))

(assert (=> b!150240 e!100304))

(declare-fun res!125908 () Bool)

(assert (=> b!150240 (=> (not res!125908) (not e!100304))))

(assert (=> b!150240 (= res!125908 (= (size!3042 (buf!3523 (_2!7077 lt!234783))) (size!3042 (buf!3523 (_2!7077 lt!234765)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5342 array!6723 (_ BitVec 32) (_ BitVec 32)) tuple2!13420)

(assert (=> b!150240 (= lt!234765 (appendByteArrayLoop!0 (_2!7077 lt!234783) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!150240 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3042 (buf!3523 (_2!7077 lt!234783)))) ((_ sign_extend 32) (currentByte!6443 (_2!7077 lt!234783))) ((_ sign_extend 32) (currentBit!6438 (_2!7077 lt!234783))) lt!234782)))

(assert (=> b!150240 (= lt!234782 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!234777 () Unit!9484)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5342 BitStream!5342 (_ BitVec 64) (_ BitVec 32)) Unit!9484)

(assert (=> b!150240 (= lt!234777 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!7077 lt!234783) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!150240 e!100308))

(declare-fun res!125904 () Bool)

(assert (=> b!150240 (=> (not res!125904) (not e!100308))))

(assert (=> b!150240 (= res!125904 (= (size!3042 (buf!3523 thiss!1634)) (size!3042 (buf!3523 (_2!7077 lt!234783)))))))

(declare-fun appendByte!0 (BitStream!5342 (_ BitVec 8)) tuple2!13420)

(assert (=> b!150240 (= lt!234783 (appendByte!0 thiss!1634 (select (arr!3835 arr!237) from!447)))))

(declare-fun b!150241 () Bool)

(assert (=> b!150241 (= e!100307 (not (arrayRangesEq!358 arr!237 (_2!7079 lt!234775) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!150242 () Bool)

(declare-fun res!125912 () Bool)

(assert (=> b!150242 (=> (not res!125912) (not e!100308))))

(assert (=> b!150242 (= res!125912 (= (bitIndex!0 (size!3042 (buf!3523 (_2!7077 lt!234783))) (currentByte!6443 (_2!7077 lt!234783)) (currentBit!6438 (_2!7077 lt!234783))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3042 (buf!3523 thiss!1634)) (currentByte!6443 thiss!1634) (currentBit!6438 thiss!1634)))))))

(assert (= (and start!28930 res!125901) b!150231))

(assert (= (and b!150231 res!125905) b!150238))

(assert (= (and b!150238 res!125906) b!150235))

(assert (= (and b!150235 res!125900) b!150240))

(assert (= (and b!150240 res!125904) b!150242))

(assert (= (and b!150242 res!125912) b!150228))

(assert (= (and b!150228 res!125910) b!150236))

(assert (= (and b!150240 res!125908) b!150239))

(assert (= (and b!150239 res!125898) b!150237))

(assert (= (and b!150237 res!125909) b!150229))

(assert (= (and b!150229 (not res!125907)) b!150241))

(assert (= (and b!150240 res!125902) b!150227))

(assert (= (and b!150240 res!125899) b!150232))

(assert (= (and b!150240 (not res!125911)) b!150234))

(assert (= (and b!150234 (not res!125903)) b!150233))

(assert (= start!28930 b!150230))

(declare-fun m!234105 () Bool)

(assert (=> b!150231 m!234105))

(declare-fun m!234107 () Bool)

(assert (=> b!150228 m!234107))

(declare-fun m!234109 () Bool)

(assert (=> b!150242 m!234109))

(declare-fun m!234111 () Bool)

(assert (=> b!150242 m!234111))

(declare-fun m!234113 () Bool)

(assert (=> b!150227 m!234113))

(declare-fun m!234115 () Bool)

(assert (=> b!150235 m!234115))

(declare-fun m!234117 () Bool)

(assert (=> b!150241 m!234117))

(declare-fun m!234119 () Bool)

(assert (=> start!28930 m!234119))

(declare-fun m!234121 () Bool)

(assert (=> start!28930 m!234121))

(declare-fun m!234123 () Bool)

(assert (=> b!150237 m!234123))

(declare-fun m!234125 () Bool)

(assert (=> b!150234 m!234125))

(declare-fun m!234127 () Bool)

(assert (=> b!150234 m!234127))

(declare-fun m!234129 () Bool)

(assert (=> b!150234 m!234129))

(declare-fun m!234131 () Bool)

(assert (=> b!150234 m!234131))

(declare-fun m!234133 () Bool)

(assert (=> b!150240 m!234133))

(declare-fun m!234135 () Bool)

(assert (=> b!150240 m!234135))

(declare-fun m!234137 () Bool)

(assert (=> b!150240 m!234137))

(declare-fun m!234139 () Bool)

(assert (=> b!150240 m!234139))

(declare-fun m!234141 () Bool)

(assert (=> b!150240 m!234141))

(declare-fun m!234143 () Bool)

(assert (=> b!150240 m!234143))

(declare-fun m!234145 () Bool)

(assert (=> b!150240 m!234145))

(declare-fun m!234147 () Bool)

(assert (=> b!150240 m!234147))

(declare-fun m!234149 () Bool)

(assert (=> b!150240 m!234149))

(declare-fun m!234151 () Bool)

(assert (=> b!150240 m!234151))

(declare-fun m!234153 () Bool)

(assert (=> b!150240 m!234153))

(declare-fun m!234155 () Bool)

(assert (=> b!150240 m!234155))

(declare-fun m!234157 () Bool)

(assert (=> b!150240 m!234157))

(declare-fun m!234159 () Bool)

(assert (=> b!150240 m!234159))

(declare-fun m!234161 () Bool)

(assert (=> b!150240 m!234161))

(declare-fun m!234163 () Bool)

(assert (=> b!150240 m!234163))

(declare-fun m!234165 () Bool)

(assert (=> b!150240 m!234165))

(declare-fun m!234167 () Bool)

(assert (=> b!150240 m!234167))

(declare-fun m!234169 () Bool)

(assert (=> b!150240 m!234169))

(assert (=> b!150240 m!234151))

(declare-fun m!234171 () Bool)

(assert (=> b!150240 m!234171))

(declare-fun m!234173 () Bool)

(assert (=> b!150240 m!234173))

(declare-fun m!234175 () Bool)

(assert (=> b!150240 m!234175))

(assert (=> b!150240 m!234159))

(declare-fun m!234177 () Bool)

(assert (=> b!150240 m!234177))

(declare-fun m!234179 () Bool)

(assert (=> b!150240 m!234179))

(declare-fun m!234181 () Bool)

(assert (=> b!150240 m!234181))

(declare-fun m!234183 () Bool)

(assert (=> b!150240 m!234183))

(declare-fun m!234185 () Bool)

(assert (=> b!150240 m!234185))

(declare-fun m!234187 () Bool)

(assert (=> b!150233 m!234187))

(assert (=> b!150233 m!234111))

(declare-fun m!234189 () Bool)

(assert (=> b!150230 m!234189))

(assert (=> b!150236 m!234159))

(declare-fun m!234191 () Bool)

(assert (=> b!150236 m!234191))

(declare-fun m!234193 () Bool)

(assert (=> b!150236 m!234193))

(assert (=> b!150239 m!234187))

(assert (=> b!150239 m!234109))

(declare-fun m!234195 () Bool)

(assert (=> b!150229 m!234195))

(declare-fun m!234197 () Bool)

(assert (=> b!150229 m!234197))

(declare-fun m!234199 () Bool)

(assert (=> b!150229 m!234199))

(assert (=> b!150229 m!234161))

(push 1)

(assert (not b!150239))

(assert (not b!150233))

(assert (not b!150231))

(assert (not b!150237))

(assert (not b!150240))

(assert (not b!150235))

(assert (not b!150236))

(assert (not start!28930))

(assert (not b!150227))

(assert (not b!150228))

(assert (not b!150230))

(assert (not b!150242))

(assert (not b!150234))

(assert (not b!150241))

(assert (not b!150229))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

