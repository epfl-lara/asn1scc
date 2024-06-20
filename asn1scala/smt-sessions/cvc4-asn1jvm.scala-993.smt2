; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27984 () Bool)

(assert start!27984)

(declare-fun b!144440 () Bool)

(declare-fun e!96244 () Bool)

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!144440 (= e!96244 (not (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000)))))))

(declare-fun e!96240 () Bool)

(assert (=> b!144440 e!96240))

(declare-fun res!120685 () Bool)

(assert (=> b!144440 (=> (not res!120685) (not e!96240))))

(declare-datatypes ((array!6576 0))(
  ( (array!6577 (arr!3709 (Array (_ BitVec 32) (_ BitVec 8))) (size!2976 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5210 0))(
  ( (BitStream!5211 (buf!3415 array!6576) (currentByte!6305 (_ BitVec 32)) (currentBit!6300 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5210)

(declare-datatypes ((Unit!9025 0))(
  ( (Unit!9026) )
))
(declare-datatypes ((tuple2!12850 0))(
  ( (tuple2!12851 (_1!6771 Unit!9025) (_2!6771 BitStream!5210)) )
))
(declare-fun lt!224036 () tuple2!12850)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!144440 (= res!120685 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2976 (buf!3415 (_2!6771 lt!224036)))) ((_ sign_extend 32) (currentByte!6305 thiss!1634)) ((_ sign_extend 32) (currentBit!6300 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!224031 () Unit!9025)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5210 array!6576 (_ BitVec 32)) Unit!9025)

(assert (=> b!144440 (= lt!224031 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3415 (_2!6771 lt!224036)) (bvsub to!404 from!447)))))

(declare-datatypes ((tuple2!12852 0))(
  ( (tuple2!12853 (_1!6772 BitStream!5210) (_2!6772 BitStream!5210)) )
))
(declare-fun lt!224046 () tuple2!12852)

(declare-fun arr!237 () array!6576)

(declare-datatypes ((tuple2!12854 0))(
  ( (tuple2!12855 (_1!6773 BitStream!5210) (_2!6773 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5210) tuple2!12854)

(assert (=> b!144440 (= (_2!6773 (readBytePure!0 (_1!6772 lt!224046))) (select (arr!3709 arr!237) from!447))))

(declare-fun lt!224030 () tuple2!12852)

(declare-fun lt!224038 () tuple2!12850)

(declare-fun reader!0 (BitStream!5210 BitStream!5210) tuple2!12852)

(assert (=> b!144440 (= lt!224030 (reader!0 (_2!6771 lt!224038) (_2!6771 lt!224036)))))

(assert (=> b!144440 (= lt!224046 (reader!0 thiss!1634 (_2!6771 lt!224036)))))

(declare-fun e!96247 () Bool)

(assert (=> b!144440 e!96247))

(declare-fun res!120683 () Bool)

(assert (=> b!144440 (=> (not res!120683) (not e!96247))))

(declare-fun lt!224042 () tuple2!12854)

(declare-fun lt!224032 () tuple2!12854)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!144440 (= res!120683 (= (bitIndex!0 (size!2976 (buf!3415 (_1!6773 lt!224042))) (currentByte!6305 (_1!6773 lt!224042)) (currentBit!6300 (_1!6773 lt!224042))) (bitIndex!0 (size!2976 (buf!3415 (_1!6773 lt!224032))) (currentByte!6305 (_1!6773 lt!224032)) (currentBit!6300 (_1!6773 lt!224032)))))))

(declare-fun lt!224044 () Unit!9025)

(declare-fun lt!224043 () BitStream!5210)

(declare-fun readBytePrefixLemma!0 (BitStream!5210 BitStream!5210) Unit!9025)

(assert (=> b!144440 (= lt!224044 (readBytePrefixLemma!0 lt!224043 (_2!6771 lt!224036)))))

(assert (=> b!144440 (= lt!224032 (readBytePure!0 (BitStream!5211 (buf!3415 (_2!6771 lt!224036)) (currentByte!6305 thiss!1634) (currentBit!6300 thiss!1634))))))

(assert (=> b!144440 (= lt!224042 (readBytePure!0 lt!224043))))

(assert (=> b!144440 (= lt!224043 (BitStream!5211 (buf!3415 (_2!6771 lt!224038)) (currentByte!6305 thiss!1634) (currentBit!6300 thiss!1634)))))

(declare-fun e!96249 () Bool)

(assert (=> b!144440 e!96249))

(declare-fun res!120691 () Bool)

(assert (=> b!144440 (=> (not res!120691) (not e!96249))))

(declare-fun isPrefixOf!0 (BitStream!5210 BitStream!5210) Bool)

(assert (=> b!144440 (= res!120691 (isPrefixOf!0 thiss!1634 (_2!6771 lt!224036)))))

(declare-fun lt!224040 () Unit!9025)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5210 BitStream!5210 BitStream!5210) Unit!9025)

(assert (=> b!144440 (= lt!224040 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6771 lt!224038) (_2!6771 lt!224036)))))

(declare-fun e!96245 () Bool)

(assert (=> b!144440 e!96245))

(declare-fun res!120686 () Bool)

(assert (=> b!144440 (=> (not res!120686) (not e!96245))))

(assert (=> b!144440 (= res!120686 (= (size!2976 (buf!3415 (_2!6771 lt!224038))) (size!2976 (buf!3415 (_2!6771 lt!224036)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5210 array!6576 (_ BitVec 32) (_ BitVec 32)) tuple2!12850)

(assert (=> b!144440 (= lt!224036 (appendByteArrayLoop!0 (_2!6771 lt!224038) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!144440 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2976 (buf!3415 (_2!6771 lt!224038)))) ((_ sign_extend 32) (currentByte!6305 (_2!6771 lt!224038))) ((_ sign_extend 32) (currentBit!6300 (_2!6771 lt!224038))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!224045 () Unit!9025)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5210 BitStream!5210 (_ BitVec 64) (_ BitVec 32)) Unit!9025)

(assert (=> b!144440 (= lt!224045 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6771 lt!224038) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!96239 () Bool)

(assert (=> b!144440 e!96239))

(declare-fun res!120694 () Bool)

(assert (=> b!144440 (=> (not res!120694) (not e!96239))))

(assert (=> b!144440 (= res!120694 (= (size!2976 (buf!3415 thiss!1634)) (size!2976 (buf!3415 (_2!6771 lt!224038)))))))

(declare-fun appendByte!0 (BitStream!5210 (_ BitVec 8)) tuple2!12850)

(assert (=> b!144440 (= lt!224038 (appendByte!0 thiss!1634 (select (arr!3709 arr!237) from!447)))))

(declare-fun b!144441 () Bool)

(declare-fun res!120692 () Bool)

(declare-fun e!96242 () Bool)

(assert (=> b!144441 (=> (not res!120692) (not e!96242))))

(assert (=> b!144441 (= res!120692 (isPrefixOf!0 (_2!6771 lt!224038) (_2!6771 lt!224036)))))

(declare-fun b!144442 () Bool)

(declare-datatypes ((tuple2!12856 0))(
  ( (tuple2!12857 (_1!6774 BitStream!5210) (_2!6774 array!6576)) )
))
(declare-fun lt!224035 () tuple2!12856)

(declare-fun e!96246 () Bool)

(declare-fun arrayRangesEq!292 (array!6576 array!6576 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!144442 (= e!96246 (not (arrayRangesEq!292 arr!237 (_2!6774 lt!224035) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!144443 () Bool)

(assert (=> b!144443 (= e!96247 (= (_2!6773 lt!224042) (_2!6773 lt!224032)))))

(declare-fun b!144444 () Bool)

(declare-fun res!120687 () Bool)

(assert (=> b!144444 (=> (not res!120687) (not e!96244))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!144444 (= res!120687 (invariant!0 (currentBit!6300 thiss!1634) (currentByte!6305 thiss!1634) (size!2976 (buf!3415 thiss!1634))))))

(declare-fun b!144446 () Bool)

(declare-fun res!120693 () Bool)

(assert (=> b!144446 (=> (not res!120693) (not e!96244))))

(assert (=> b!144446 (= res!120693 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2976 (buf!3415 thiss!1634))) ((_ sign_extend 32) (currentByte!6305 thiss!1634)) ((_ sign_extend 32) (currentBit!6300 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!144447 () Bool)

(declare-fun readByteArrayLoopPure!0 (BitStream!5210 array!6576 (_ BitVec 32) (_ BitVec 32)) tuple2!12856)

(assert (=> b!144447 (= e!96240 (= (_1!6774 (readByteArrayLoopPure!0 (_1!6772 lt!224046) arr!237 from!447 to!404)) (_2!6772 lt!224046)))))

(declare-fun b!144448 () Bool)

(declare-fun e!96243 () Bool)

(declare-fun array_inv!2765 (array!6576) Bool)

(assert (=> b!144448 (= e!96243 (array_inv!2765 (buf!3415 thiss!1634)))))

(declare-fun b!144449 () Bool)

(assert (=> b!144449 (= e!96249 (invariant!0 (currentBit!6300 thiss!1634) (currentByte!6305 thiss!1634) (size!2976 (buf!3415 (_2!6771 lt!224038)))))))

(declare-fun b!144450 () Bool)

(declare-fun res!120684 () Bool)

(assert (=> b!144450 (=> (not res!120684) (not e!96244))))

(assert (=> b!144450 (= res!120684 (bvslt from!447 to!404))))

(declare-fun b!144451 () Bool)

(declare-fun res!120690 () Bool)

(assert (=> b!144451 (=> (not res!120690) (not e!96239))))

(assert (=> b!144451 (= res!120690 (isPrefixOf!0 thiss!1634 (_2!6771 lt!224038)))))

(declare-fun b!144452 () Bool)

(assert (=> b!144452 (= e!96242 (not e!96246))))

(declare-fun res!120688 () Bool)

(assert (=> b!144452 (=> res!120688 e!96246)))

(declare-fun lt!224037 () tuple2!12852)

(assert (=> b!144452 (= res!120688 (or (not (= (size!2976 (_2!6774 lt!224035)) (size!2976 arr!237))) (not (= (_1!6774 lt!224035) (_2!6772 lt!224037)))))))

(assert (=> b!144452 (= lt!224035 (readByteArrayLoopPure!0 (_1!6772 lt!224037) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!224041 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!144452 (validate_offset_bits!1 ((_ sign_extend 32) (size!2976 (buf!3415 (_2!6771 lt!224036)))) ((_ sign_extend 32) (currentByte!6305 (_2!6771 lt!224038))) ((_ sign_extend 32) (currentBit!6300 (_2!6771 lt!224038))) lt!224041)))

(declare-fun lt!224034 () Unit!9025)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5210 array!6576 (_ BitVec 64)) Unit!9025)

(assert (=> b!144452 (= lt!224034 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6771 lt!224038) (buf!3415 (_2!6771 lt!224036)) lt!224041))))

(assert (=> b!144452 (= lt!224037 (reader!0 (_2!6771 lt!224038) (_2!6771 lt!224036)))))

(declare-fun b!144445 () Bool)

(declare-fun res!120689 () Bool)

(assert (=> b!144445 (=> (not res!120689) (not e!96239))))

(assert (=> b!144445 (= res!120689 (= (bitIndex!0 (size!2976 (buf!3415 (_2!6771 lt!224038))) (currentByte!6305 (_2!6771 lt!224038)) (currentBit!6300 (_2!6771 lt!224038))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2976 (buf!3415 thiss!1634)) (currentByte!6305 thiss!1634) (currentBit!6300 thiss!1634)))))))

(declare-fun res!120682 () Bool)

(assert (=> start!27984 (=> (not res!120682) (not e!96244))))

(assert (=> start!27984 (= res!120682 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2976 arr!237))))))

(assert (=> start!27984 e!96244))

(assert (=> start!27984 true))

(assert (=> start!27984 (array_inv!2765 arr!237)))

(declare-fun inv!12 (BitStream!5210) Bool)

(assert (=> start!27984 (and (inv!12 thiss!1634) e!96243)))

(declare-fun b!144453 () Bool)

(assert (=> b!144453 (= e!96245 e!96242)))

(declare-fun res!120681 () Bool)

(assert (=> b!144453 (=> (not res!120681) (not e!96242))))

(assert (=> b!144453 (= res!120681 (= (bitIndex!0 (size!2976 (buf!3415 (_2!6771 lt!224036))) (currentByte!6305 (_2!6771 lt!224036)) (currentBit!6300 (_2!6771 lt!224036))) (bvadd (bitIndex!0 (size!2976 (buf!3415 (_2!6771 lt!224038))) (currentByte!6305 (_2!6771 lt!224038)) (currentBit!6300 (_2!6771 lt!224038))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!224041))))))

(assert (=> b!144453 (= lt!224041 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun lt!224039 () tuple2!12854)

(declare-fun lt!224033 () tuple2!12852)

(declare-fun b!144454 () Bool)

(assert (=> b!144454 (= e!96239 (and (= (_2!6773 lt!224039) (select (arr!3709 arr!237) from!447)) (= (_1!6773 lt!224039) (_2!6772 lt!224033))))))

(assert (=> b!144454 (= lt!224039 (readBytePure!0 (_1!6772 lt!224033)))))

(assert (=> b!144454 (= lt!224033 (reader!0 thiss!1634 (_2!6771 lt!224038)))))

(assert (= (and start!27984 res!120682) b!144446))

(assert (= (and b!144446 res!120693) b!144450))

(assert (= (and b!144450 res!120684) b!144444))

(assert (= (and b!144444 res!120687) b!144440))

(assert (= (and b!144440 res!120694) b!144445))

(assert (= (and b!144445 res!120689) b!144451))

(assert (= (and b!144451 res!120690) b!144454))

(assert (= (and b!144440 res!120686) b!144453))

(assert (= (and b!144453 res!120681) b!144441))

(assert (= (and b!144441 res!120692) b!144452))

(assert (= (and b!144452 (not res!120688)) b!144442))

(assert (= (and b!144440 res!120691) b!144449))

(assert (= (and b!144440 res!120683) b!144443))

(assert (= (and b!144440 res!120685) b!144447))

(assert (= start!27984 b!144448))

(declare-fun m!222151 () Bool)

(assert (=> start!27984 m!222151))

(declare-fun m!222153 () Bool)

(assert (=> start!27984 m!222153))

(declare-fun m!222155 () Bool)

(assert (=> b!144440 m!222155))

(declare-fun m!222157 () Bool)

(assert (=> b!144440 m!222157))

(declare-fun m!222159 () Bool)

(assert (=> b!144440 m!222159))

(declare-fun m!222161 () Bool)

(assert (=> b!144440 m!222161))

(declare-fun m!222163 () Bool)

(assert (=> b!144440 m!222163))

(declare-fun m!222165 () Bool)

(assert (=> b!144440 m!222165))

(declare-fun m!222167 () Bool)

(assert (=> b!144440 m!222167))

(declare-fun m!222169 () Bool)

(assert (=> b!144440 m!222169))

(declare-fun m!222171 () Bool)

(assert (=> b!144440 m!222171))

(declare-fun m!222173 () Bool)

(assert (=> b!144440 m!222173))

(declare-fun m!222175 () Bool)

(assert (=> b!144440 m!222175))

(declare-fun m!222177 () Bool)

(assert (=> b!144440 m!222177))

(declare-fun m!222179 () Bool)

(assert (=> b!144440 m!222179))

(declare-fun m!222181 () Bool)

(assert (=> b!144440 m!222181))

(declare-fun m!222183 () Bool)

(assert (=> b!144440 m!222183))

(assert (=> b!144440 m!222181))

(declare-fun m!222185 () Bool)

(assert (=> b!144440 m!222185))

(declare-fun m!222187 () Bool)

(assert (=> b!144440 m!222187))

(declare-fun m!222189 () Bool)

(assert (=> b!144446 m!222189))

(declare-fun m!222191 () Bool)

(assert (=> b!144447 m!222191))

(declare-fun m!222193 () Bool)

(assert (=> b!144441 m!222193))

(declare-fun m!222195 () Bool)

(assert (=> b!144452 m!222195))

(declare-fun m!222197 () Bool)

(assert (=> b!144452 m!222197))

(declare-fun m!222199 () Bool)

(assert (=> b!144452 m!222199))

(assert (=> b!144452 m!222177))

(declare-fun m!222201 () Bool)

(assert (=> b!144449 m!222201))

(declare-fun m!222203 () Bool)

(assert (=> b!144445 m!222203))

(declare-fun m!222205 () Bool)

(assert (=> b!144445 m!222205))

(declare-fun m!222207 () Bool)

(assert (=> b!144442 m!222207))

(declare-fun m!222209 () Bool)

(assert (=> b!144453 m!222209))

(assert (=> b!144453 m!222203))

(declare-fun m!222211 () Bool)

(assert (=> b!144444 m!222211))

(declare-fun m!222213 () Bool)

(assert (=> b!144448 m!222213))

(declare-fun m!222215 () Bool)

(assert (=> b!144451 m!222215))

(assert (=> b!144454 m!222181))

(declare-fun m!222217 () Bool)

(assert (=> b!144454 m!222217))

(declare-fun m!222219 () Bool)

(assert (=> b!144454 m!222219))

(push 1)

(assert (not start!27984))

(assert (not b!144448))

(assert (not b!144449))

(assert (not b!144445))

(assert (not b!144451))

(assert (not b!144444))

(assert (not b!144447))

(assert (not b!144453))

(assert (not b!144446))

(assert (not b!144440))

(assert (not b!144452))

(assert (not b!144454))

(assert (not b!144441))

(assert (not b!144442))

(check-sat)

(pop 1)

(push 1)

(check-sat)

