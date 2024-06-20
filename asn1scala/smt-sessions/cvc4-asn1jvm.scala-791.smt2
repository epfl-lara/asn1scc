; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22968 () Bool)

(assert start!22968)

(declare-fun b!116162 () Bool)

(declare-fun e!76111 () Bool)

(declare-datatypes ((array!5232 0))(
  ( (array!5233 (arr!2966 (Array (_ BitVec 32) (_ BitVec 8))) (size!2373 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4220 0))(
  ( (BitStream!4221 (buf!2783 array!5232) (currentByte!5420 (_ BitVec 32)) (currentBit!5415 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4220)

(declare-fun array_inv!2175 (array!5232) Bool)

(assert (=> b!116162 (= e!76111 (array_inv!2175 (buf!2783 thiss!1305)))))

(declare-fun b!116163 () Bool)

(declare-fun e!76114 () Bool)

(assert (=> b!116163 (= e!76114 (not true))))

(declare-datatypes ((tuple2!9586 0))(
  ( (tuple2!9587 (_1!5058 BitStream!4220) (_2!5058 BitStream!4220)) )
))
(declare-fun lt!177546 () tuple2!9586)

(declare-fun lt!177545 () Bool)

(declare-datatypes ((tuple2!9588 0))(
  ( (tuple2!9589 (_1!5059 BitStream!4220) (_2!5059 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!4220) tuple2!9588)

(assert (=> b!116163 (= (_2!5059 (readBitPure!0 (_1!5058 lt!177546))) lt!177545)))

(declare-fun lt!177540 () tuple2!9586)

(declare-datatypes ((Unit!7151 0))(
  ( (Unit!7152) )
))
(declare-datatypes ((tuple2!9590 0))(
  ( (tuple2!9591 (_1!5060 Unit!7151) (_2!5060 BitStream!4220)) )
))
(declare-fun lt!177544 () tuple2!9590)

(declare-fun lt!177550 () tuple2!9590)

(declare-fun reader!0 (BitStream!4220 BitStream!4220) tuple2!9586)

(assert (=> b!116163 (= lt!177540 (reader!0 (_2!5060 lt!177544) (_2!5060 lt!177550)))))

(assert (=> b!116163 (= lt!177546 (reader!0 thiss!1305 (_2!5060 lt!177550)))))

(declare-fun e!76116 () Bool)

(assert (=> b!116163 e!76116))

(declare-fun res!96026 () Bool)

(assert (=> b!116163 (=> (not res!96026) (not e!76116))))

(declare-fun lt!177548 () tuple2!9588)

(declare-fun lt!177551 () tuple2!9588)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116163 (= res!96026 (= (bitIndex!0 (size!2373 (buf!2783 (_1!5059 lt!177548))) (currentByte!5420 (_1!5059 lt!177548)) (currentBit!5415 (_1!5059 lt!177548))) (bitIndex!0 (size!2373 (buf!2783 (_1!5059 lt!177551))) (currentByte!5420 (_1!5059 lt!177551)) (currentBit!5415 (_1!5059 lt!177551)))))))

(declare-fun lt!177549 () Unit!7151)

(declare-fun lt!177542 () BitStream!4220)

(declare-fun readBitPrefixLemma!0 (BitStream!4220 BitStream!4220) Unit!7151)

(assert (=> b!116163 (= lt!177549 (readBitPrefixLemma!0 lt!177542 (_2!5060 lt!177550)))))

(assert (=> b!116163 (= lt!177551 (readBitPure!0 (BitStream!4221 (buf!2783 (_2!5060 lt!177550)) (currentByte!5420 thiss!1305) (currentBit!5415 thiss!1305))))))

(assert (=> b!116163 (= lt!177548 (readBitPure!0 lt!177542))))

(assert (=> b!116163 (= lt!177542 (BitStream!4221 (buf!2783 (_2!5060 lt!177544)) (currentByte!5420 thiss!1305) (currentBit!5415 thiss!1305)))))

(declare-fun e!76112 () Bool)

(assert (=> b!116163 e!76112))

(declare-fun res!96019 () Bool)

(assert (=> b!116163 (=> (not res!96019) (not e!76112))))

(declare-fun isPrefixOf!0 (BitStream!4220 BitStream!4220) Bool)

(assert (=> b!116163 (= res!96019 (isPrefixOf!0 thiss!1305 (_2!5060 lt!177550)))))

(declare-fun lt!177552 () Unit!7151)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4220 BitStream!4220 BitStream!4220) Unit!7151)

(assert (=> b!116163 (= lt!177552 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5060 lt!177544) (_2!5060 lt!177550)))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4220 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9590)

(assert (=> b!116163 (= lt!177550 (appendNLeastSignificantBitsLoop!0 (_2!5060 lt!177544) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!76110 () Bool)

(assert (=> b!116163 e!76110))

(declare-fun res!96022 () Bool)

(assert (=> b!116163 (=> (not res!96022) (not e!76110))))

(assert (=> b!116163 (= res!96022 (= (size!2373 (buf!2783 thiss!1305)) (size!2373 (buf!2783 (_2!5060 lt!177544)))))))

(declare-fun appendBit!0 (BitStream!4220 Bool) tuple2!9590)

(assert (=> b!116163 (= lt!177544 (appendBit!0 thiss!1305 lt!177545))))

(assert (=> b!116163 (= lt!177545 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!116164 () Bool)

(declare-fun res!96025 () Bool)

(assert (=> b!116164 (=> (not res!96025) (not e!76114))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116164 (= res!96025 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!116165 () Bool)

(declare-fun e!76115 () Bool)

(assert (=> b!116165 (= e!76110 e!76115)))

(declare-fun res!96024 () Bool)

(assert (=> b!116165 (=> (not res!96024) (not e!76115))))

(declare-fun lt!177543 () (_ BitVec 64))

(declare-fun lt!177541 () (_ BitVec 64))

(assert (=> b!116165 (= res!96024 (= lt!177543 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!177541)))))

(assert (=> b!116165 (= lt!177543 (bitIndex!0 (size!2373 (buf!2783 (_2!5060 lt!177544))) (currentByte!5420 (_2!5060 lt!177544)) (currentBit!5415 (_2!5060 lt!177544))))))

(assert (=> b!116165 (= lt!177541 (bitIndex!0 (size!2373 (buf!2783 thiss!1305)) (currentByte!5420 thiss!1305) (currentBit!5415 thiss!1305)))))

(declare-fun b!116166 () Bool)

(declare-fun e!76109 () Bool)

(assert (=> b!116166 (= e!76115 e!76109)))

(declare-fun res!96017 () Bool)

(assert (=> b!116166 (=> (not res!96017) (not e!76109))))

(declare-fun lt!177547 () tuple2!9588)

(assert (=> b!116166 (= res!96017 (and (= (_2!5059 lt!177547) lt!177545) (= (_1!5059 lt!177547) (_2!5060 lt!177544))))))

(declare-fun readerFrom!0 (BitStream!4220 (_ BitVec 32) (_ BitVec 32)) BitStream!4220)

(assert (=> b!116166 (= lt!177547 (readBitPure!0 (readerFrom!0 (_2!5060 lt!177544) (currentBit!5415 thiss!1305) (currentByte!5420 thiss!1305))))))

(declare-fun b!116167 () Bool)

(declare-fun res!96023 () Bool)

(assert (=> b!116167 (=> (not res!96023) (not e!76115))))

(assert (=> b!116167 (= res!96023 (isPrefixOf!0 thiss!1305 (_2!5060 lt!177544)))))

(declare-fun b!116168 () Bool)

(declare-fun res!96027 () Bool)

(assert (=> b!116168 (=> (not res!96027) (not e!76112))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!116168 (= res!96027 (invariant!0 (currentBit!5415 thiss!1305) (currentByte!5420 thiss!1305) (size!2373 (buf!2783 (_2!5060 lt!177544)))))))

(declare-fun res!96021 () Bool)

(assert (=> start!22968 (=> (not res!96021) (not e!76114))))

(assert (=> start!22968 (= res!96021 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22968 e!76114))

(assert (=> start!22968 true))

(declare-fun inv!12 (BitStream!4220) Bool)

(assert (=> start!22968 (and (inv!12 thiss!1305) e!76111)))

(declare-fun b!116169 () Bool)

(declare-fun res!96018 () Bool)

(assert (=> b!116169 (=> (not res!96018) (not e!76114))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!116169 (= res!96018 (validate_offset_bits!1 ((_ sign_extend 32) (size!2373 (buf!2783 thiss!1305))) ((_ sign_extend 32) (currentByte!5420 thiss!1305)) ((_ sign_extend 32) (currentBit!5415 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!116170 () Bool)

(declare-fun res!96020 () Bool)

(assert (=> b!116170 (=> (not res!96020) (not e!76114))))

(assert (=> b!116170 (= res!96020 (bvslt i!615 nBits!396))))

(declare-fun b!116171 () Bool)

(assert (=> b!116171 (= e!76112 (invariant!0 (currentBit!5415 thiss!1305) (currentByte!5420 thiss!1305) (size!2373 (buf!2783 (_2!5060 lt!177550)))))))

(declare-fun b!116172 () Bool)

(assert (=> b!116172 (= e!76109 (= (bitIndex!0 (size!2373 (buf!2783 (_1!5059 lt!177547))) (currentByte!5420 (_1!5059 lt!177547)) (currentBit!5415 (_1!5059 lt!177547))) lt!177543))))

(declare-fun b!116173 () Bool)

(assert (=> b!116173 (= e!76116 (= (_2!5059 lt!177548) (_2!5059 lt!177551)))))

(assert (= (and start!22968 res!96021) b!116169))

(assert (= (and b!116169 res!96018) b!116164))

(assert (= (and b!116164 res!96025) b!116170))

(assert (= (and b!116170 res!96020) b!116163))

(assert (= (and b!116163 res!96022) b!116165))

(assert (= (and b!116165 res!96024) b!116167))

(assert (= (and b!116167 res!96023) b!116166))

(assert (= (and b!116166 res!96017) b!116172))

(assert (= (and b!116163 res!96019) b!116168))

(assert (= (and b!116168 res!96027) b!116171))

(assert (= (and b!116163 res!96026) b!116173))

(assert (= start!22968 b!116162))

(declare-fun m!173939 () Bool)

(assert (=> b!116168 m!173939))

(declare-fun m!173941 () Bool)

(assert (=> b!116162 m!173941))

(declare-fun m!173943 () Bool)

(assert (=> b!116172 m!173943))

(declare-fun m!173945 () Bool)

(assert (=> b!116163 m!173945))

(declare-fun m!173947 () Bool)

(assert (=> b!116163 m!173947))

(declare-fun m!173949 () Bool)

(assert (=> b!116163 m!173949))

(declare-fun m!173951 () Bool)

(assert (=> b!116163 m!173951))

(declare-fun m!173953 () Bool)

(assert (=> b!116163 m!173953))

(declare-fun m!173955 () Bool)

(assert (=> b!116163 m!173955))

(declare-fun m!173957 () Bool)

(assert (=> b!116163 m!173957))

(declare-fun m!173959 () Bool)

(assert (=> b!116163 m!173959))

(declare-fun m!173961 () Bool)

(assert (=> b!116163 m!173961))

(declare-fun m!173963 () Bool)

(assert (=> b!116163 m!173963))

(declare-fun m!173965 () Bool)

(assert (=> b!116163 m!173965))

(declare-fun m!173967 () Bool)

(assert (=> b!116163 m!173967))

(declare-fun m!173969 () Bool)

(assert (=> b!116169 m!173969))

(declare-fun m!173971 () Bool)

(assert (=> b!116166 m!173971))

(assert (=> b!116166 m!173971))

(declare-fun m!173973 () Bool)

(assert (=> b!116166 m!173973))

(declare-fun m!173975 () Bool)

(assert (=> b!116167 m!173975))

(declare-fun m!173977 () Bool)

(assert (=> b!116164 m!173977))

(declare-fun m!173979 () Bool)

(assert (=> b!116171 m!173979))

(declare-fun m!173981 () Bool)

(assert (=> b!116165 m!173981))

(declare-fun m!173983 () Bool)

(assert (=> b!116165 m!173983))

(declare-fun m!173985 () Bool)

(assert (=> start!22968 m!173985))

(push 1)

