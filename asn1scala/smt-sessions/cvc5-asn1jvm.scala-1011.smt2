; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28770 () Bool)

(assert start!28770)

(declare-fun b!149252 () Bool)

(declare-fun e!99629 () Bool)

(declare-fun e!99626 () Bool)

(assert (=> b!149252 (= e!99629 e!99626)))

(declare-fun res!125008 () Bool)

(assert (=> b!149252 (=> res!125008 e!99626)))

(declare-datatypes ((array!6692 0))(
  ( (array!6693 (arr!3812 (Array (_ BitVec 32) (_ BitVec 8))) (size!3028 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5314 0))(
  ( (BitStream!5315 (buf!3503 array!6692) (currentByte!6417 (_ BitVec 32)) (currentBit!6412 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5314)

(declare-datatypes ((Unit!9447 0))(
  ( (Unit!9448) )
))
(declare-datatypes ((tuple2!13302 0))(
  ( (tuple2!13303 (_1!7015 Unit!9447) (_2!7015 BitStream!5314)) )
))
(declare-fun lt!232842 () tuple2!13302)

(assert (=> b!149252 (= res!125008 (not (= (size!3028 (buf!3503 thiss!1634)) (size!3028 (buf!3503 (_2!7015 lt!232842))))))))

(declare-fun arr!237 () array!6692)

(declare-datatypes ((tuple2!13304 0))(
  ( (tuple2!13305 (_1!7016 BitStream!5314) (_2!7016 array!6692)) )
))
(declare-fun lt!232846 () tuple2!13304)

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arrayRangesEq!344 (array!6692 array!6692 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!149252 (arrayRangesEq!344 arr!237 (_2!7016 lt!232846) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!232823 () tuple2!13304)

(declare-fun lt!232833 () Unit!9447)

(declare-fun arrayRangesEqTransitive!59 (array!6692 array!6692 array!6692 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9447)

(assert (=> b!149252 (= lt!232833 (arrayRangesEqTransitive!59 arr!237 (_2!7016 lt!232823) (_2!7016 lt!232846) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> b!149252 (arrayRangesEq!344 (_2!7016 lt!232823) (_2!7016 lt!232846) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!232845 () Unit!9447)

(declare-fun arrayRangesEqSymmetricLemma!76 (array!6692 array!6692 (_ BitVec 32) (_ BitVec 32)) Unit!9447)

(assert (=> b!149252 (= lt!232845 (arrayRangesEqSymmetricLemma!76 (_2!7016 lt!232846) (_2!7016 lt!232823) #b00000000000000000000000000000000 to!404))))

(declare-fun b!149253 () Bool)

(declare-fun e!99623 () Bool)

(declare-fun e!99630 () Bool)

(assert (=> b!149253 (= e!99623 (not e!99630))))

(declare-fun res!124997 () Bool)

(assert (=> b!149253 (=> res!124997 e!99630)))

(declare-datatypes ((tuple2!13306 0))(
  ( (tuple2!13307 (_1!7017 BitStream!5314) (_2!7017 BitStream!5314)) )
))
(declare-fun lt!232821 () tuple2!13306)

(declare-fun lt!232843 () tuple2!13304)

(assert (=> b!149253 (= res!124997 (or (not (= (size!3028 (_2!7016 lt!232843)) (size!3028 arr!237))) (not (= (_1!7016 lt!232843) (_2!7017 lt!232821)))))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!5314 array!6692 (_ BitVec 32) (_ BitVec 32)) tuple2!13304)

(assert (=> b!149253 (= lt!232843 (readByteArrayLoopPure!0 (_1!7017 lt!232821) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!232830 () tuple2!13302)

(declare-fun lt!232838 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!149253 (validate_offset_bits!1 ((_ sign_extend 32) (size!3028 (buf!3503 (_2!7015 lt!232842)))) ((_ sign_extend 32) (currentByte!6417 (_2!7015 lt!232830))) ((_ sign_extend 32) (currentBit!6412 (_2!7015 lt!232830))) lt!232838)))

(declare-fun lt!232844 () Unit!9447)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5314 array!6692 (_ BitVec 64)) Unit!9447)

(assert (=> b!149253 (= lt!232844 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!7015 lt!232830) (buf!3503 (_2!7015 lt!232842)) lt!232838))))

(declare-fun reader!0 (BitStream!5314 BitStream!5314) tuple2!13306)

(assert (=> b!149253 (= lt!232821 (reader!0 (_2!7015 lt!232830) (_2!7015 lt!232842)))))

(declare-fun b!149254 () Bool)

(declare-fun e!99628 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!149254 (= e!99628 (invariant!0 (currentBit!6412 thiss!1634) (currentByte!6417 thiss!1634) (size!3028 (buf!3503 (_2!7015 lt!232830)))))))

(declare-fun b!149256 () Bool)

(declare-fun res!125005 () Bool)

(declare-fun e!99632 () Bool)

(assert (=> b!149256 (=> (not res!125005) (not e!99632))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!149256 (= res!125005 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3028 (buf!3503 thiss!1634))) ((_ sign_extend 32) (currentByte!6417 thiss!1634)) ((_ sign_extend 32) (currentBit!6412 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!149257 () Bool)

(declare-fun e!99633 () Bool)

(declare-fun array_inv!2817 (array!6692) Bool)

(assert (=> b!149257 (= e!99633 (array_inv!2817 (buf!3503 thiss!1634)))))

(declare-fun b!149258 () Bool)

(declare-fun res!125006 () Bool)

(assert (=> b!149258 (=> (not res!125006) (not e!99632))))

(assert (=> b!149258 (= res!125006 (bvslt from!447 to!404))))

(declare-fun b!149259 () Bool)

(declare-fun e!99625 () Bool)

(assert (=> b!149259 (= e!99625 e!99623)))

(declare-fun res!125001 () Bool)

(assert (=> b!149259 (=> (not res!125001) (not e!99623))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!149259 (= res!125001 (= (bitIndex!0 (size!3028 (buf!3503 (_2!7015 lt!232842))) (currentByte!6417 (_2!7015 lt!232842)) (currentBit!6412 (_2!7015 lt!232842))) (bvadd (bitIndex!0 (size!3028 (buf!3503 (_2!7015 lt!232830))) (currentByte!6417 (_2!7015 lt!232830)) (currentBit!6412 (_2!7015 lt!232830))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!232838))))))

(assert (=> b!149259 (= lt!232838 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!149260 () Bool)

(declare-fun res!125009 () Bool)

(assert (=> b!149260 (=> (not res!125009) (not e!99623))))

(declare-fun isPrefixOf!0 (BitStream!5314 BitStream!5314) Bool)

(assert (=> b!149260 (= res!125009 (isPrefixOf!0 (_2!7015 lt!232830) (_2!7015 lt!232842)))))

(declare-fun b!149261 () Bool)

(declare-fun res!124995 () Bool)

(declare-fun e!99631 () Bool)

(assert (=> b!149261 (=> (not res!124995) (not e!99631))))

(assert (=> b!149261 (= res!124995 (isPrefixOf!0 thiss!1634 (_2!7015 lt!232830)))))

(declare-fun b!149262 () Bool)

(assert (=> b!149262 (= e!99626 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000))))))

(declare-fun lt!232825 () (_ BitVec 64))

(assert (=> b!149262 (= lt!232825 (bitIndex!0 (size!3028 (buf!3503 thiss!1634)) (currentByte!6417 thiss!1634) (currentBit!6412 thiss!1634)))))

(declare-fun b!149263 () Bool)

(declare-fun res!124999 () Bool)

(assert (=> b!149263 (=> (not res!124999) (not e!99631))))

(assert (=> b!149263 (= res!124999 (= (bitIndex!0 (size!3028 (buf!3503 (_2!7015 lt!232830))) (currentByte!6417 (_2!7015 lt!232830)) (currentBit!6412 (_2!7015 lt!232830))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3028 (buf!3503 thiss!1634)) (currentByte!6417 thiss!1634) (currentBit!6412 thiss!1634)))))))

(declare-fun b!149264 () Bool)

(declare-fun e!99627 () Bool)

(declare-datatypes ((tuple2!13308 0))(
  ( (tuple2!13309 (_1!7018 BitStream!5314) (_2!7018 (_ BitVec 8))) )
))
(declare-fun lt!232828 () tuple2!13308)

(declare-fun lt!232848 () tuple2!13308)

(assert (=> b!149264 (= e!99627 (= (_2!7018 lt!232828) (_2!7018 lt!232848)))))

(declare-fun b!149265 () Bool)

(assert (=> b!149265 (= e!99630 (not (arrayRangesEq!344 arr!237 (_2!7016 lt!232843) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!149266 () Bool)

(declare-fun res!125007 () Bool)

(assert (=> b!149266 (=> (not res!125007) (not e!99632))))

(assert (=> b!149266 (= res!125007 (invariant!0 (currentBit!6412 thiss!1634) (currentByte!6417 thiss!1634) (size!3028 (buf!3503 thiss!1634))))))

(declare-fun b!149267 () Bool)

(assert (=> b!149267 (= e!99632 (not e!99629))))

(declare-fun res!125000 () Bool)

(assert (=> b!149267 (=> res!125000 e!99629)))

(assert (=> b!149267 (= res!125000 (not (arrayRangesEq!344 (_2!7016 lt!232846) (_2!7016 lt!232823) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!232822 () tuple2!13304)

(assert (=> b!149267 (arrayRangesEq!344 (_2!7016 lt!232846) (_2!7016 lt!232822) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!232824 () tuple2!13306)

(declare-fun lt!232829 () Unit!9447)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5314 array!6692 (_ BitVec 32) (_ BitVec 32)) Unit!9447)

(assert (=> b!149267 (= lt!232829 (readByteArrayLoopArrayPrefixLemma!0 (_1!7017 lt!232824) arr!237 from!447 to!404))))

(declare-fun lt!232834 () array!6692)

(declare-fun withMovedByteIndex!0 (BitStream!5314 (_ BitVec 32)) BitStream!5314)

(assert (=> b!149267 (= lt!232822 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!7017 lt!232824) #b00000000000000000000000000000001) lt!232834 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!232836 () tuple2!13306)

(assert (=> b!149267 (= lt!232823 (readByteArrayLoopPure!0 (_1!7017 lt!232836) lt!232834 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!232839 () tuple2!13308)

(assert (=> b!149267 (= lt!232834 (array!6693 (store (arr!3812 arr!237) from!447 (_2!7018 lt!232839)) (size!3028 arr!237)))))

(declare-fun lt!232841 () (_ BitVec 32))

(assert (=> b!149267 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3028 (buf!3503 (_2!7015 lt!232842)))) ((_ sign_extend 32) (currentByte!6417 (_2!7015 lt!232830))) ((_ sign_extend 32) (currentBit!6412 (_2!7015 lt!232830))) lt!232841)))

(declare-fun lt!232826 () Unit!9447)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5314 array!6692 (_ BitVec 32)) Unit!9447)

(assert (=> b!149267 (= lt!232826 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!7015 lt!232830) (buf!3503 (_2!7015 lt!232842)) lt!232841))))

(assert (=> b!149267 (= (_1!7016 lt!232846) (_2!7017 lt!232824))))

(assert (=> b!149267 (= lt!232846 (readByteArrayLoopPure!0 (_1!7017 lt!232824) arr!237 from!447 to!404))))

(assert (=> b!149267 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3028 (buf!3503 (_2!7015 lt!232842)))) ((_ sign_extend 32) (currentByte!6417 thiss!1634)) ((_ sign_extend 32) (currentBit!6412 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!232831 () Unit!9447)

(assert (=> b!149267 (= lt!232831 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3503 (_2!7015 lt!232842)) (bvsub to!404 from!447)))))

(assert (=> b!149267 (= (_2!7018 lt!232839) (select (arr!3812 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!5314) tuple2!13308)

(assert (=> b!149267 (= lt!232839 (readBytePure!0 (_1!7017 lt!232824)))))

(assert (=> b!149267 (= lt!232836 (reader!0 (_2!7015 lt!232830) (_2!7015 lt!232842)))))

(assert (=> b!149267 (= lt!232824 (reader!0 thiss!1634 (_2!7015 lt!232842)))))

(assert (=> b!149267 e!99627))

(declare-fun res!125003 () Bool)

(assert (=> b!149267 (=> (not res!125003) (not e!99627))))

(assert (=> b!149267 (= res!125003 (= (bitIndex!0 (size!3028 (buf!3503 (_1!7018 lt!232828))) (currentByte!6417 (_1!7018 lt!232828)) (currentBit!6412 (_1!7018 lt!232828))) (bitIndex!0 (size!3028 (buf!3503 (_1!7018 lt!232848))) (currentByte!6417 (_1!7018 lt!232848)) (currentBit!6412 (_1!7018 lt!232848)))))))

(declare-fun lt!232832 () Unit!9447)

(declare-fun lt!232837 () BitStream!5314)

(declare-fun readBytePrefixLemma!0 (BitStream!5314 BitStream!5314) Unit!9447)

(assert (=> b!149267 (= lt!232832 (readBytePrefixLemma!0 lt!232837 (_2!7015 lt!232842)))))

(assert (=> b!149267 (= lt!232848 (readBytePure!0 (BitStream!5315 (buf!3503 (_2!7015 lt!232842)) (currentByte!6417 thiss!1634) (currentBit!6412 thiss!1634))))))

(assert (=> b!149267 (= lt!232828 (readBytePure!0 lt!232837))))

(assert (=> b!149267 (= lt!232837 (BitStream!5315 (buf!3503 (_2!7015 lt!232830)) (currentByte!6417 thiss!1634) (currentBit!6412 thiss!1634)))))

(assert (=> b!149267 e!99628))

(declare-fun res!125004 () Bool)

(assert (=> b!149267 (=> (not res!125004) (not e!99628))))

(assert (=> b!149267 (= res!125004 (isPrefixOf!0 thiss!1634 (_2!7015 lt!232842)))))

(declare-fun lt!232840 () Unit!9447)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5314 BitStream!5314 BitStream!5314) Unit!9447)

(assert (=> b!149267 (= lt!232840 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!7015 lt!232830) (_2!7015 lt!232842)))))

(assert (=> b!149267 e!99625))

(declare-fun res!125002 () Bool)

(assert (=> b!149267 (=> (not res!125002) (not e!99625))))

(assert (=> b!149267 (= res!125002 (= (size!3028 (buf!3503 (_2!7015 lt!232830))) (size!3028 (buf!3503 (_2!7015 lt!232842)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5314 array!6692 (_ BitVec 32) (_ BitVec 32)) tuple2!13302)

(assert (=> b!149267 (= lt!232842 (appendByteArrayLoop!0 (_2!7015 lt!232830) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!149267 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3028 (buf!3503 (_2!7015 lt!232830)))) ((_ sign_extend 32) (currentByte!6417 (_2!7015 lt!232830))) ((_ sign_extend 32) (currentBit!6412 (_2!7015 lt!232830))) lt!232841)))

(assert (=> b!149267 (= lt!232841 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!232847 () Unit!9447)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5314 BitStream!5314 (_ BitVec 64) (_ BitVec 32)) Unit!9447)

(assert (=> b!149267 (= lt!232847 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!7015 lt!232830) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!149267 e!99631))

(declare-fun res!124996 () Bool)

(assert (=> b!149267 (=> (not res!124996) (not e!99631))))

(assert (=> b!149267 (= res!124996 (= (size!3028 (buf!3503 thiss!1634)) (size!3028 (buf!3503 (_2!7015 lt!232830)))))))

(declare-fun appendByte!0 (BitStream!5314 (_ BitVec 8)) tuple2!13302)

(assert (=> b!149267 (= lt!232830 (appendByte!0 thiss!1634 (select (arr!3812 arr!237) from!447)))))

(declare-fun res!124998 () Bool)

(assert (=> start!28770 (=> (not res!124998) (not e!99632))))

(assert (=> start!28770 (= res!124998 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3028 arr!237))))))

(assert (=> start!28770 e!99632))

(assert (=> start!28770 true))

(assert (=> start!28770 (array_inv!2817 arr!237)))

(declare-fun inv!12 (BitStream!5314) Bool)

(assert (=> start!28770 (and (inv!12 thiss!1634) e!99633)))

(declare-fun b!149255 () Bool)

(declare-fun lt!232827 () tuple2!13306)

(declare-fun lt!232835 () tuple2!13308)

(assert (=> b!149255 (= e!99631 (and (= (_2!7018 lt!232835) (select (arr!3812 arr!237) from!447)) (= (_1!7018 lt!232835) (_2!7017 lt!232827))))))

(assert (=> b!149255 (= lt!232835 (readBytePure!0 (_1!7017 lt!232827)))))

(assert (=> b!149255 (= lt!232827 (reader!0 thiss!1634 (_2!7015 lt!232830)))))

(assert (= (and start!28770 res!124998) b!149256))

(assert (= (and b!149256 res!125005) b!149258))

(assert (= (and b!149258 res!125006) b!149266))

(assert (= (and b!149266 res!125007) b!149267))

(assert (= (and b!149267 res!124996) b!149263))

(assert (= (and b!149263 res!124999) b!149261))

(assert (= (and b!149261 res!124995) b!149255))

(assert (= (and b!149267 res!125002) b!149259))

(assert (= (and b!149259 res!125001) b!149260))

(assert (= (and b!149260 res!125009) b!149253))

(assert (= (and b!149253 (not res!124997)) b!149265))

(assert (= (and b!149267 res!125004) b!149254))

(assert (= (and b!149267 res!125003) b!149264))

(assert (= (and b!149267 (not res!125000)) b!149252))

(assert (= (and b!149252 (not res!125008)) b!149262))

(assert (= start!28770 b!149257))

(declare-fun m!232143 () Bool)

(assert (=> b!149267 m!232143))

(declare-fun m!232145 () Bool)

(assert (=> b!149267 m!232145))

(declare-fun m!232147 () Bool)

(assert (=> b!149267 m!232147))

(declare-fun m!232149 () Bool)

(assert (=> b!149267 m!232149))

(declare-fun m!232151 () Bool)

(assert (=> b!149267 m!232151))

(declare-fun m!232153 () Bool)

(assert (=> b!149267 m!232153))

(declare-fun m!232155 () Bool)

(assert (=> b!149267 m!232155))

(declare-fun m!232157 () Bool)

(assert (=> b!149267 m!232157))

(declare-fun m!232159 () Bool)

(assert (=> b!149267 m!232159))

(declare-fun m!232161 () Bool)

(assert (=> b!149267 m!232161))

(declare-fun m!232163 () Bool)

(assert (=> b!149267 m!232163))

(declare-fun m!232165 () Bool)

(assert (=> b!149267 m!232165))

(declare-fun m!232167 () Bool)

(assert (=> b!149267 m!232167))

(declare-fun m!232169 () Bool)

(assert (=> b!149267 m!232169))

(declare-fun m!232171 () Bool)

(assert (=> b!149267 m!232171))

(declare-fun m!232173 () Bool)

(assert (=> b!149267 m!232173))

(declare-fun m!232175 () Bool)

(assert (=> b!149267 m!232175))

(assert (=> b!149267 m!232159))

(declare-fun m!232177 () Bool)

(assert (=> b!149267 m!232177))

(declare-fun m!232179 () Bool)

(assert (=> b!149267 m!232179))

(declare-fun m!232181 () Bool)

(assert (=> b!149267 m!232181))

(declare-fun m!232183 () Bool)

(assert (=> b!149267 m!232183))

(declare-fun m!232185 () Bool)

(assert (=> b!149267 m!232185))

(declare-fun m!232187 () Bool)

(assert (=> b!149267 m!232187))

(declare-fun m!232189 () Bool)

(assert (=> b!149267 m!232189))

(declare-fun m!232191 () Bool)

(assert (=> b!149267 m!232191))

(declare-fun m!232193 () Bool)

(assert (=> b!149267 m!232193))

(assert (=> b!149267 m!232163))

(declare-fun m!232195 () Bool)

(assert (=> b!149267 m!232195))

(declare-fun m!232197 () Bool)

(assert (=> b!149260 m!232197))

(declare-fun m!232199 () Bool)

(assert (=> start!28770 m!232199))

(declare-fun m!232201 () Bool)

(assert (=> start!28770 m!232201))

(declare-fun m!232203 () Bool)

(assert (=> b!149262 m!232203))

(declare-fun m!232205 () Bool)

(assert (=> b!149265 m!232205))

(declare-fun m!232207 () Bool)

(assert (=> b!149256 m!232207))

(declare-fun m!232209 () Bool)

(assert (=> b!149254 m!232209))

(declare-fun m!232211 () Bool)

(assert (=> b!149261 m!232211))

(declare-fun m!232213 () Bool)

(assert (=> b!149252 m!232213))

(declare-fun m!232215 () Bool)

(assert (=> b!149252 m!232215))

(declare-fun m!232217 () Bool)

(assert (=> b!149252 m!232217))

(declare-fun m!232219 () Bool)

(assert (=> b!149252 m!232219))

(declare-fun m!232221 () Bool)

(assert (=> b!149259 m!232221))

(declare-fun m!232223 () Bool)

(assert (=> b!149259 m!232223))

(declare-fun m!232225 () Bool)

(assert (=> b!149266 m!232225))

(assert (=> b!149255 m!232163))

(declare-fun m!232227 () Bool)

(assert (=> b!149255 m!232227))

(declare-fun m!232229 () Bool)

(assert (=> b!149255 m!232229))

(declare-fun m!232231 () Bool)

(assert (=> b!149257 m!232231))

(assert (=> b!149263 m!232223))

(assert (=> b!149263 m!232203))

(declare-fun m!232233 () Bool)

(assert (=> b!149253 m!232233))

(declare-fun m!232235 () Bool)

(assert (=> b!149253 m!232235))

(declare-fun m!232237 () Bool)

(assert (=> b!149253 m!232237))

(assert (=> b!149253 m!232173))

(push 1)

(assert (not start!28770))

(assert (not b!149253))

(assert (not b!149267))

(assert (not b!149263))

(assert (not b!149256))

(assert (not b!149261))

(assert (not b!149254))

(assert (not b!149257))

(assert (not b!149252))

(assert (not b!149262))

(assert (not b!149266))

(assert (not b!149259))

(assert (not b!149255))

(assert (not b!149265))

(assert (not b!149260))

(check-sat)

(pop 1)

(push 1)

(check-sat)

