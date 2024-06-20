; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27712 () Bool)

(assert start!27712)

(declare-fun b!142816 () Bool)

(declare-fun e!95131 () Bool)

(declare-fun e!95136 () Bool)

(assert (=> b!142816 (= e!95131 e!95136)))

(declare-fun res!119238 () Bool)

(assert (=> b!142816 (=> (not res!119238) (not e!95136))))

(declare-datatypes ((array!6535 0))(
  ( (array!6536 (arr!3677 (Array (_ BitVec 32) (_ BitVec 8))) (size!2958 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5174 0))(
  ( (BitStream!5175 (buf!3385 array!6535) (currentByte!6263 (_ BitVec 32)) (currentBit!6258 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8910 0))(
  ( (Unit!8911) )
))
(declare-datatypes ((tuple2!12692 0))(
  ( (tuple2!12693 (_1!6685 Unit!8910) (_2!6685 BitStream!5174)) )
))
(declare-fun lt!221371 () tuple2!12692)

(declare-fun lt!221375 () (_ BitVec 64))

(declare-fun lt!221376 () tuple2!12692)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!142816 (= res!119238 (= (bitIndex!0 (size!2958 (buf!3385 (_2!6685 lt!221371))) (currentByte!6263 (_2!6685 lt!221371)) (currentBit!6258 (_2!6685 lt!221371))) (bvadd (bitIndex!0 (size!2958 (buf!3385 (_2!6685 lt!221376))) (currentByte!6263 (_2!6685 lt!221376)) (currentBit!6258 (_2!6685 lt!221376))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!221375))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!142816 (= lt!221375 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!142817 () Bool)

(declare-fun e!95135 () Bool)

(declare-datatypes ((tuple2!12694 0))(
  ( (tuple2!12695 (_1!6686 BitStream!5174) (_2!6686 (_ BitVec 8))) )
))
(declare-fun lt!221374 () tuple2!12694)

(declare-fun lt!221381 () tuple2!12694)

(assert (=> b!142817 (= e!95135 (= (_2!6686 lt!221374) (_2!6686 lt!221381)))))

(declare-fun e!95132 () Bool)

(declare-fun arr!237 () array!6535)

(declare-datatypes ((tuple2!12696 0))(
  ( (tuple2!12697 (_1!6687 BitStream!5174) (_2!6687 BitStream!5174)) )
))
(declare-fun lt!221379 () tuple2!12696)

(declare-fun b!142818 () Bool)

(declare-fun readBytePure!0 (BitStream!5174) tuple2!12694)

(assert (=> b!142818 (= e!95132 (not (= (_2!6686 (readBytePure!0 (_1!6687 lt!221379))) (select (arr!3677 arr!237) from!447))))))

(declare-fun lt!221378 () tuple2!12696)

(declare-fun reader!0 (BitStream!5174 BitStream!5174) tuple2!12696)

(assert (=> b!142818 (= lt!221378 (reader!0 (_2!6685 lt!221376) (_2!6685 lt!221371)))))

(declare-fun thiss!1634 () BitStream!5174)

(assert (=> b!142818 (= lt!221379 (reader!0 thiss!1634 (_2!6685 lt!221371)))))

(assert (=> b!142818 e!95135))

(declare-fun res!119230 () Bool)

(assert (=> b!142818 (=> (not res!119230) (not e!95135))))

(assert (=> b!142818 (= res!119230 (= (bitIndex!0 (size!2958 (buf!3385 (_1!6686 lt!221374))) (currentByte!6263 (_1!6686 lt!221374)) (currentBit!6258 (_1!6686 lt!221374))) (bitIndex!0 (size!2958 (buf!3385 (_1!6686 lt!221381))) (currentByte!6263 (_1!6686 lt!221381)) (currentBit!6258 (_1!6686 lt!221381)))))))

(declare-fun lt!221383 () Unit!8910)

(declare-fun lt!221382 () BitStream!5174)

(declare-fun readBytePrefixLemma!0 (BitStream!5174 BitStream!5174) Unit!8910)

(assert (=> b!142818 (= lt!221383 (readBytePrefixLemma!0 lt!221382 (_2!6685 lt!221371)))))

(assert (=> b!142818 (= lt!221381 (readBytePure!0 (BitStream!5175 (buf!3385 (_2!6685 lt!221371)) (currentByte!6263 thiss!1634) (currentBit!6258 thiss!1634))))))

(assert (=> b!142818 (= lt!221374 (readBytePure!0 lt!221382))))

(assert (=> b!142818 (= lt!221382 (BitStream!5175 (buf!3385 (_2!6685 lt!221376)) (currentByte!6263 thiss!1634) (currentBit!6258 thiss!1634)))))

(declare-fun e!95137 () Bool)

(assert (=> b!142818 e!95137))

(declare-fun res!119233 () Bool)

(assert (=> b!142818 (=> (not res!119233) (not e!95137))))

(declare-fun isPrefixOf!0 (BitStream!5174 BitStream!5174) Bool)

(assert (=> b!142818 (= res!119233 (isPrefixOf!0 thiss!1634 (_2!6685 lt!221371)))))

(declare-fun lt!221373 () Unit!8910)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5174 BitStream!5174 BitStream!5174) Unit!8910)

(assert (=> b!142818 (= lt!221373 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6685 lt!221376) (_2!6685 lt!221371)))))

(assert (=> b!142818 e!95131))

(declare-fun res!119237 () Bool)

(assert (=> b!142818 (=> (not res!119237) (not e!95131))))

(assert (=> b!142818 (= res!119237 (= (size!2958 (buf!3385 (_2!6685 lt!221376))) (size!2958 (buf!3385 (_2!6685 lt!221371)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5174 array!6535 (_ BitVec 32) (_ BitVec 32)) tuple2!12692)

(assert (=> b!142818 (= lt!221371 (appendByteArrayLoop!0 (_2!6685 lt!221376) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!142818 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2958 (buf!3385 (_2!6685 lt!221376)))) ((_ sign_extend 32) (currentByte!6263 (_2!6685 lt!221376))) ((_ sign_extend 32) (currentBit!6258 (_2!6685 lt!221376))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!221369 () Unit!8910)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5174 BitStream!5174 (_ BitVec 64) (_ BitVec 32)) Unit!8910)

(assert (=> b!142818 (= lt!221369 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6685 lt!221376) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!95130 () Bool)

(assert (=> b!142818 e!95130))

(declare-fun res!119232 () Bool)

(assert (=> b!142818 (=> (not res!119232) (not e!95130))))

(assert (=> b!142818 (= res!119232 (= (size!2958 (buf!3385 thiss!1634)) (size!2958 (buf!3385 (_2!6685 lt!221376)))))))

(declare-fun appendByte!0 (BitStream!5174 (_ BitVec 8)) tuple2!12692)

(assert (=> b!142818 (= lt!221376 (appendByte!0 thiss!1634 (select (arr!3677 arr!237) from!447)))))

(declare-datatypes ((tuple2!12698 0))(
  ( (tuple2!12699 (_1!6688 BitStream!5174) (_2!6688 array!6535)) )
))
(declare-fun lt!221372 () tuple2!12698)

(declare-fun e!95138 () Bool)

(declare-fun b!142819 () Bool)

(declare-fun arrayRangesEq!274 (array!6535 array!6535 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!142819 (= e!95138 (not (arrayRangesEq!274 arr!237 (_2!6688 lt!221372) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!142820 () Bool)

(declare-fun res!119234 () Bool)

(assert (=> b!142820 (=> (not res!119234) (not e!95136))))

(assert (=> b!142820 (= res!119234 (isPrefixOf!0 (_2!6685 lt!221376) (_2!6685 lt!221371)))))

(declare-fun res!119239 () Bool)

(assert (=> start!27712 (=> (not res!119239) (not e!95132))))

(assert (=> start!27712 (= res!119239 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2958 arr!237))))))

(assert (=> start!27712 e!95132))

(assert (=> start!27712 true))

(declare-fun array_inv!2747 (array!6535) Bool)

(assert (=> start!27712 (array_inv!2747 arr!237)))

(declare-fun e!95133 () Bool)

(declare-fun inv!12 (BitStream!5174) Bool)

(assert (=> start!27712 (and (inv!12 thiss!1634) e!95133)))

(declare-fun b!142821 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!142821 (= e!95137 (invariant!0 (currentBit!6258 thiss!1634) (currentByte!6263 thiss!1634) (size!2958 (buf!3385 (_2!6685 lt!221376)))))))

(declare-fun b!142822 () Bool)

(declare-fun res!119229 () Bool)

(assert (=> b!142822 (=> (not res!119229) (not e!95130))))

(assert (=> b!142822 (= res!119229 (isPrefixOf!0 thiss!1634 (_2!6685 lt!221376)))))

(declare-fun b!142823 () Bool)

(declare-fun res!119228 () Bool)

(assert (=> b!142823 (=> (not res!119228) (not e!95132))))

(assert (=> b!142823 (= res!119228 (invariant!0 (currentBit!6258 thiss!1634) (currentByte!6263 thiss!1634) (size!2958 (buf!3385 thiss!1634))))))

(declare-fun lt!221380 () tuple2!12694)

(declare-fun b!142824 () Bool)

(declare-fun lt!221377 () tuple2!12696)

(assert (=> b!142824 (= e!95130 (and (= (_2!6686 lt!221380) (select (arr!3677 arr!237) from!447)) (= (_1!6686 lt!221380) (_2!6687 lt!221377))))))

(assert (=> b!142824 (= lt!221380 (readBytePure!0 (_1!6687 lt!221377)))))

(assert (=> b!142824 (= lt!221377 (reader!0 thiss!1634 (_2!6685 lt!221376)))))

(declare-fun b!142825 () Bool)

(assert (=> b!142825 (= e!95136 (not e!95138))))

(declare-fun res!119227 () Bool)

(assert (=> b!142825 (=> res!119227 e!95138)))

(declare-fun lt!221384 () tuple2!12696)

(assert (=> b!142825 (= res!119227 (or (not (= (size!2958 (_2!6688 lt!221372)) (size!2958 arr!237))) (not (= (_1!6688 lt!221372) (_2!6687 lt!221384)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5174 array!6535 (_ BitVec 32) (_ BitVec 32)) tuple2!12698)

(assert (=> b!142825 (= lt!221372 (readByteArrayLoopPure!0 (_1!6687 lt!221384) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!142825 (validate_offset_bits!1 ((_ sign_extend 32) (size!2958 (buf!3385 (_2!6685 lt!221371)))) ((_ sign_extend 32) (currentByte!6263 (_2!6685 lt!221376))) ((_ sign_extend 32) (currentBit!6258 (_2!6685 lt!221376))) lt!221375)))

(declare-fun lt!221370 () Unit!8910)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5174 array!6535 (_ BitVec 64)) Unit!8910)

(assert (=> b!142825 (= lt!221370 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6685 lt!221376) (buf!3385 (_2!6685 lt!221371)) lt!221375))))

(assert (=> b!142825 (= lt!221384 (reader!0 (_2!6685 lt!221376) (_2!6685 lt!221371)))))

(declare-fun b!142826 () Bool)

(declare-fun res!119236 () Bool)

(assert (=> b!142826 (=> (not res!119236) (not e!95130))))

(assert (=> b!142826 (= res!119236 (= (bitIndex!0 (size!2958 (buf!3385 (_2!6685 lt!221376))) (currentByte!6263 (_2!6685 lt!221376)) (currentBit!6258 (_2!6685 lt!221376))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2958 (buf!3385 thiss!1634)) (currentByte!6263 thiss!1634) (currentBit!6258 thiss!1634)))))))

(declare-fun b!142827 () Bool)

(declare-fun res!119235 () Bool)

(assert (=> b!142827 (=> (not res!119235) (not e!95132))))

(assert (=> b!142827 (= res!119235 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2958 (buf!3385 thiss!1634))) ((_ sign_extend 32) (currentByte!6263 thiss!1634)) ((_ sign_extend 32) (currentBit!6258 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!142828 () Bool)

(declare-fun res!119231 () Bool)

(assert (=> b!142828 (=> (not res!119231) (not e!95132))))

(assert (=> b!142828 (= res!119231 (bvslt from!447 to!404))))

(declare-fun b!142829 () Bool)

(assert (=> b!142829 (= e!95133 (array_inv!2747 (buf!3385 thiss!1634)))))

(assert (= (and start!27712 res!119239) b!142827))

(assert (= (and b!142827 res!119235) b!142828))

(assert (= (and b!142828 res!119231) b!142823))

(assert (= (and b!142823 res!119228) b!142818))

(assert (= (and b!142818 res!119232) b!142826))

(assert (= (and b!142826 res!119236) b!142822))

(assert (= (and b!142822 res!119229) b!142824))

(assert (= (and b!142818 res!119237) b!142816))

(assert (= (and b!142816 res!119238) b!142820))

(assert (= (and b!142820 res!119234) b!142825))

(assert (= (and b!142825 (not res!119227)) b!142819))

(assert (= (and b!142818 res!119233) b!142821))

(assert (= (and b!142818 res!119230) b!142817))

(assert (= start!27712 b!142829))

(declare-fun m!219217 () Bool)

(assert (=> b!142826 m!219217))

(declare-fun m!219219 () Bool)

(assert (=> b!142826 m!219219))

(declare-fun m!219221 () Bool)

(assert (=> b!142819 m!219221))

(declare-fun m!219223 () Bool)

(assert (=> b!142821 m!219223))

(declare-fun m!219225 () Bool)

(assert (=> b!142829 m!219225))

(declare-fun m!219227 () Bool)

(assert (=> b!142822 m!219227))

(declare-fun m!219229 () Bool)

(assert (=> b!142816 m!219229))

(assert (=> b!142816 m!219217))

(declare-fun m!219231 () Bool)

(assert (=> start!27712 m!219231))

(declare-fun m!219233 () Bool)

(assert (=> start!27712 m!219233))

(declare-fun m!219235 () Bool)

(assert (=> b!142823 m!219235))

(declare-fun m!219237 () Bool)

(assert (=> b!142827 m!219237))

(declare-fun m!219239 () Bool)

(assert (=> b!142818 m!219239))

(declare-fun m!219241 () Bool)

(assert (=> b!142818 m!219241))

(declare-fun m!219243 () Bool)

(assert (=> b!142818 m!219243))

(declare-fun m!219245 () Bool)

(assert (=> b!142818 m!219245))

(declare-fun m!219247 () Bool)

(assert (=> b!142818 m!219247))

(declare-fun m!219249 () Bool)

(assert (=> b!142818 m!219249))

(declare-fun m!219251 () Bool)

(assert (=> b!142818 m!219251))

(declare-fun m!219253 () Bool)

(assert (=> b!142818 m!219253))

(declare-fun m!219255 () Bool)

(assert (=> b!142818 m!219255))

(declare-fun m!219257 () Bool)

(assert (=> b!142818 m!219257))

(assert (=> b!142818 m!219255))

(declare-fun m!219259 () Bool)

(assert (=> b!142818 m!219259))

(declare-fun m!219261 () Bool)

(assert (=> b!142818 m!219261))

(declare-fun m!219263 () Bool)

(assert (=> b!142818 m!219263))

(declare-fun m!219265 () Bool)

(assert (=> b!142818 m!219265))

(declare-fun m!219267 () Bool)

(assert (=> b!142818 m!219267))

(assert (=> b!142824 m!219255))

(declare-fun m!219269 () Bool)

(assert (=> b!142824 m!219269))

(declare-fun m!219271 () Bool)

(assert (=> b!142824 m!219271))

(declare-fun m!219273 () Bool)

(assert (=> b!142825 m!219273))

(declare-fun m!219275 () Bool)

(assert (=> b!142825 m!219275))

(declare-fun m!219277 () Bool)

(assert (=> b!142825 m!219277))

(assert (=> b!142825 m!219265))

(declare-fun m!219279 () Bool)

(assert (=> b!142820 m!219279))

(push 1)

(assert (not start!27712))

(assert (not b!142821))

(assert (not b!142827))

(assert (not b!142822))

(assert (not b!142824))

(assert (not b!142820))

(assert (not b!142829))

(assert (not b!142825))

(assert (not b!142823))

(assert (not b!142818))

(assert (not b!142819))

(assert (not b!142826))

(assert (not b!142816))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!45716 () Bool)

(declare-fun res!119244 () Bool)

(declare-fun e!95144 () Bool)

(assert (=> d!45716 (=> res!119244 e!95144)))

(assert (=> d!45716 (= res!119244 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!45716 (= (arrayRangesEq!274 arr!237 (_2!6688 lt!221372) #b00000000000000000000000000000000 to!404) e!95144)))

(declare-fun b!142834 () Bool)

(declare-fun e!95145 () Bool)

(assert (=> b!142834 (= e!95144 e!95145)))

(declare-fun res!119245 () Bool)

(assert (=> b!142834 (=> (not res!119245) (not e!95145))))

(assert (=> b!142834 (= res!119245 (= (select (arr!3677 arr!237) #b00000000000000000000000000000000) (select (arr!3677 (_2!6688 lt!221372)) #b00000000000000000000000000000000)))))

(declare-fun b!142835 () Bool)

(assert (=> b!142835 (= e!95145 (arrayRangesEq!274 arr!237 (_2!6688 lt!221372) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!45716 (not res!119244)) b!142834))

(assert (= (and b!142834 res!119245) b!142835))

(declare-fun m!219281 () Bool)

(assert (=> b!142834 m!219281))

(declare-fun m!219283 () Bool)

(assert (=> b!142834 m!219283))

(declare-fun m!219285 () Bool)

(assert (=> b!142835 m!219285))

(assert (=> b!142819 d!45716))

(declare-fun d!45718 () Bool)

(assert (=> d!45718 (= (array_inv!2747 (buf!3385 thiss!1634)) (bvsge (size!2958 (buf!3385 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!142829 d!45718))

(declare-fun d!45720 () Bool)

(declare-datatypes ((tuple2!12700 0))(
  ( (tuple2!12701 (_1!6690 (_ BitVec 8)) (_2!6690 BitStream!5174)) )
))
(declare-fun lt!221411 () tuple2!12700)

(declare-fun readByte!0 (BitStream!5174) tuple2!12700)

(assert (=> d!45720 (= lt!221411 (readByte!0 (BitStream!5175 (buf!3385 (_2!6685 lt!221371)) (currentByte!6263 thiss!1634) (currentBit!6258 thiss!1634))))))

(assert (=> d!45720 (= (readBytePure!0 (BitStream!5175 (buf!3385 (_2!6685 lt!221371)) (currentByte!6263 thiss!1634) (currentBit!6258 thiss!1634))) (tuple2!12695 (_2!6690 lt!221411) (_1!6690 lt!221411)))))

(declare-fun bs!11223 () Bool)

(assert (= bs!11223 d!45720))

(declare-fun m!219293 () Bool)

(assert (=> bs!11223 m!219293))

(assert (=> b!142818 d!45720))

(declare-fun d!45730 () Bool)

(declare-fun e!95152 () Bool)

(assert (=> d!45730 e!95152))

(declare-fun res!119259 () Bool)

(assert (=> d!45730 (=> (not res!119259) (not e!95152))))

(declare-fun lt!221435 () (_ BitVec 64))

(declare-fun lt!221434 () (_ BitVec 64))

(declare-fun lt!221430 () (_ BitVec 64))

(assert (=> d!45730 (= res!119259 (= lt!221435 (bvsub lt!221430 lt!221434)))))

(assert (=> d!45730 (or (= (bvand lt!221430 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!221434 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!221430 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!221430 lt!221434) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!45730 (= lt!221434 (remainingBits!0 ((_ sign_extend 32) (size!2958 (buf!3385 (_1!6686 lt!221381)))) ((_ sign_extend 32) (currentByte!6263 (_1!6686 lt!221381))) ((_ sign_extend 32) (currentBit!6258 (_1!6686 lt!221381)))))))

(declare-fun lt!221433 () (_ BitVec 64))

(declare-fun lt!221431 () (_ BitVec 64))

(assert (=> d!45730 (= lt!221430 (bvmul lt!221433 lt!221431))))

(assert (=> d!45730 (or (= lt!221433 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!221431 (bvsdiv (bvmul lt!221433 lt!221431) lt!221433)))))

(assert (=> d!45730 (= lt!221431 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45730 (= lt!221433 ((_ sign_extend 32) (size!2958 (buf!3385 (_1!6686 lt!221381)))))))

(assert (=> d!45730 (= lt!221435 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6263 (_1!6686 lt!221381))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6258 (_1!6686 lt!221381)))))))

(assert (=> d!45730 (invariant!0 (currentBit!6258 (_1!6686 lt!221381)) (currentByte!6263 (_1!6686 lt!221381)) (size!2958 (buf!3385 (_1!6686 lt!221381))))))

(assert (=> d!45730 (= (bitIndex!0 (size!2958 (buf!3385 (_1!6686 lt!221381))) (currentByte!6263 (_1!6686 lt!221381)) (currentBit!6258 (_1!6686 lt!221381))) lt!221435)))

(declare-fun b!142848 () Bool)

(declare-fun res!119258 () Bool)

(assert (=> b!142848 (=> (not res!119258) (not e!95152))))

(assert (=> b!142848 (= res!119258 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!221435))))

(declare-fun b!142849 () Bool)

(declare-fun lt!221432 () (_ BitVec 64))

(assert (=> b!142849 (= e!95152 (bvsle lt!221435 (bvmul lt!221432 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!142849 (or (= lt!221432 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!221432 #b0000000000000000000000000000000000000000000000000000000000001000) lt!221432)))))

(assert (=> b!142849 (= lt!221432 ((_ sign_extend 32) (size!2958 (buf!3385 (_1!6686 lt!221381)))))))

(assert (= (and d!45730 res!119259) b!142848))

(assert (= (and b!142848 res!119258) b!142849))

(declare-fun m!219301 () Bool)

(assert (=> d!45730 m!219301))

(declare-fun m!219303 () Bool)

(assert (=> d!45730 m!219303))

(assert (=> b!142818 d!45730))

(declare-fun d!45738 () Bool)

(declare-fun res!119268 () Bool)

(declare-fun e!95157 () Bool)

(assert (=> d!45738 (=> (not res!119268) (not e!95157))))

(assert (=> d!45738 (= res!119268 (= (size!2958 (buf!3385 thiss!1634)) (size!2958 (buf!3385 (_2!6685 lt!221371)))))))

(assert (=> d!45738 (= (isPrefixOf!0 thiss!1634 (_2!6685 lt!221371)) e!95157)))

(declare-fun b!142856 () Bool)

(declare-fun res!119266 () Bool)

(assert (=> b!142856 (=> (not res!119266) (not e!95157))))

(assert (=> b!142856 (= res!119266 (bvsle (bitIndex!0 (size!2958 (buf!3385 thiss!1634)) (currentByte!6263 thiss!1634) (currentBit!6258 thiss!1634)) (bitIndex!0 (size!2958 (buf!3385 (_2!6685 lt!221371))) (currentByte!6263 (_2!6685 lt!221371)) (currentBit!6258 (_2!6685 lt!221371)))))))

(declare-fun b!142857 () Bool)

(declare-fun e!95158 () Bool)

(assert (=> b!142857 (= e!95157 e!95158)))

(declare-fun res!119267 () Bool)

(assert (=> b!142857 (=> res!119267 e!95158)))

(assert (=> b!142857 (= res!119267 (= (size!2958 (buf!3385 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!142858 () Bool)

(declare-fun arrayBitRangesEq!0 (array!6535 array!6535 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!142858 (= e!95158 (arrayBitRangesEq!0 (buf!3385 thiss!1634) (buf!3385 (_2!6685 lt!221371)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2958 (buf!3385 thiss!1634)) (currentByte!6263 thiss!1634) (currentBit!6258 thiss!1634))))))

(assert (= (and d!45738 res!119268) b!142856))

(assert (= (and b!142856 res!119266) b!142857))

(assert (= (and b!142857 (not res!119267)) b!142858))

(assert (=> b!142856 m!219219))

(assert (=> b!142856 m!219229))

(assert (=> b!142858 m!219219))

(assert (=> b!142858 m!219219))

(declare-fun m!219305 () Bool)

(assert (=> b!142858 m!219305))

(assert (=> b!142818 d!45738))

(declare-fun d!45740 () Bool)

(declare-fun lt!221436 () tuple2!12700)

(assert (=> d!45740 (= lt!221436 (readByte!0 lt!221382))))

(assert (=> d!45740 (= (readBytePure!0 lt!221382) (tuple2!12695 (_2!6690 lt!221436) (_1!6690 lt!221436)))))

(declare-fun bs!11227 () Bool)

(assert (= bs!11227 d!45740))

(declare-fun m!219307 () Bool)

(assert (=> bs!11227 m!219307))

(assert (=> b!142818 d!45740))

(declare-fun b!142914 () Bool)

(declare-fun e!95190 () Unit!8910)

(declare-fun lt!221603 () Unit!8910)

(assert (=> b!142914 (= e!95190 lt!221603)))

(declare-fun lt!221600 () (_ BitVec 64))

(assert (=> b!142914 (= lt!221600 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!221602 () (_ BitVec 64))

(assert (=> b!142914 (= lt!221602 (bitIndex!0 (size!2958 (buf!3385 thiss!1634)) (currentByte!6263 thiss!1634) (currentBit!6258 thiss!1634)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6535 array!6535 (_ BitVec 64) (_ BitVec 64)) Unit!8910)

(assert (=> b!142914 (= lt!221603 (arrayBitRangesEqSymmetric!0 (buf!3385 thiss!1634) (buf!3385 (_2!6685 lt!221371)) lt!221600 lt!221602))))

(assert (=> b!142914 (arrayBitRangesEq!0 (buf!3385 (_2!6685 lt!221371)) (buf!3385 thiss!1634) lt!221600 lt!221602)))

(declare-fun b!142915 () Bool)

(declare-fun res!119314 () Bool)

(declare-fun e!95191 () Bool)

(assert (=> b!142915 (=> (not res!119314) (not e!95191))))

(declare-fun lt!221589 () tuple2!12696)

(assert (=> b!142915 (= res!119314 (isPrefixOf!0 (_1!6687 lt!221589) thiss!1634))))

(declare-fun lt!221592 () (_ BitVec 64))

(declare-fun b!142916 () Bool)

(declare-fun lt!221599 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!5174 (_ BitVec 64)) BitStream!5174)

(assert (=> b!142916 (= e!95191 (= (_1!6687 lt!221589) (withMovedBitIndex!0 (_2!6687 lt!221589) (bvsub lt!221592 lt!221599))))))

(assert (=> b!142916 (or (= (bvand lt!221592 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!221599 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!221592 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!221592 lt!221599) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!142916 (= lt!221599 (bitIndex!0 (size!2958 (buf!3385 (_2!6685 lt!221371))) (currentByte!6263 (_2!6685 lt!221371)) (currentBit!6258 (_2!6685 lt!221371))))))

(assert (=> b!142916 (= lt!221592 (bitIndex!0 (size!2958 (buf!3385 thiss!1634)) (currentByte!6263 thiss!1634) (currentBit!6258 thiss!1634)))))

(declare-fun b!142917 () Bool)

(declare-fun Unit!8913 () Unit!8910)

(assert (=> b!142917 (= e!95190 Unit!8913)))

(declare-fun b!142918 () Bool)

(declare-fun res!119312 () Bool)

(assert (=> b!142918 (=> (not res!119312) (not e!95191))))

(assert (=> b!142918 (= res!119312 (isPrefixOf!0 (_2!6687 lt!221589) (_2!6685 lt!221371)))))

(declare-fun d!45742 () Bool)

(assert (=> d!45742 e!95191))

(declare-fun res!119313 () Bool)

(assert (=> d!45742 (=> (not res!119313) (not e!95191))))

(assert (=> d!45742 (= res!119313 (isPrefixOf!0 (_1!6687 lt!221589) (_2!6687 lt!221589)))))

(declare-fun lt!221588 () BitStream!5174)

(assert (=> d!45742 (= lt!221589 (tuple2!12697 lt!221588 (_2!6685 lt!221371)))))

(declare-fun lt!221585 () Unit!8910)

(declare-fun lt!221591 () Unit!8910)

(assert (=> d!45742 (= lt!221585 lt!221591)))

(assert (=> d!45742 (isPrefixOf!0 lt!221588 (_2!6685 lt!221371))))

(assert (=> d!45742 (= lt!221591 (lemmaIsPrefixTransitive!0 lt!221588 (_2!6685 lt!221371) (_2!6685 lt!221371)))))

(declare-fun lt!221586 () Unit!8910)

(declare-fun lt!221594 () Unit!8910)

(assert (=> d!45742 (= lt!221586 lt!221594)))

(assert (=> d!45742 (isPrefixOf!0 lt!221588 (_2!6685 lt!221371))))

(assert (=> d!45742 (= lt!221594 (lemmaIsPrefixTransitive!0 lt!221588 thiss!1634 (_2!6685 lt!221371)))))

(declare-fun lt!221595 () Unit!8910)

(assert (=> d!45742 (= lt!221595 e!95190)))

(declare-fun c!7839 () Bool)

(assert (=> d!45742 (= c!7839 (not (= (size!2958 (buf!3385 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!221598 () Unit!8910)

(declare-fun lt!221590 () Unit!8910)

(assert (=> d!45742 (= lt!221598 lt!221590)))

(assert (=> d!45742 (isPrefixOf!0 (_2!6685 lt!221371) (_2!6685 lt!221371))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5174) Unit!8910)

(assert (=> d!45742 (= lt!221590 (lemmaIsPrefixRefl!0 (_2!6685 lt!221371)))))

(declare-fun lt!221597 () Unit!8910)

(declare-fun lt!221593 () Unit!8910)

(assert (=> d!45742 (= lt!221597 lt!221593)))

(assert (=> d!45742 (= lt!221593 (lemmaIsPrefixRefl!0 (_2!6685 lt!221371)))))

(declare-fun lt!221596 () Unit!8910)

(declare-fun lt!221604 () Unit!8910)

(assert (=> d!45742 (= lt!221596 lt!221604)))

(assert (=> d!45742 (isPrefixOf!0 lt!221588 lt!221588)))

(assert (=> d!45742 (= lt!221604 (lemmaIsPrefixRefl!0 lt!221588))))

(declare-fun lt!221601 () Unit!8910)

(declare-fun lt!221587 () Unit!8910)

(assert (=> d!45742 (= lt!221601 lt!221587)))

(assert (=> d!45742 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!45742 (= lt!221587 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!45742 (= lt!221588 (BitStream!5175 (buf!3385 (_2!6685 lt!221371)) (currentByte!6263 thiss!1634) (currentBit!6258 thiss!1634)))))

(assert (=> d!45742 (isPrefixOf!0 thiss!1634 (_2!6685 lt!221371))))

(assert (=> d!45742 (= (reader!0 thiss!1634 (_2!6685 lt!221371)) lt!221589)))

(assert (= (and d!45742 c!7839) b!142914))

(assert (= (and d!45742 (not c!7839)) b!142917))

(assert (= (and d!45742 res!119313) b!142915))

(assert (= (and b!142915 res!119314) b!142918))

(assert (= (and b!142918 res!119312) b!142916))

(declare-fun m!219395 () Bool)

(assert (=> b!142916 m!219395))

(assert (=> b!142916 m!219229))

(assert (=> b!142916 m!219219))

(declare-fun m!219397 () Bool)

(assert (=> b!142915 m!219397))

(declare-fun m!219399 () Bool)

(assert (=> d!45742 m!219399))

(declare-fun m!219401 () Bool)

(assert (=> d!45742 m!219401))

(declare-fun m!219403 () Bool)

(assert (=> d!45742 m!219403))

(declare-fun m!219405 () Bool)

(assert (=> d!45742 m!219405))

(declare-fun m!219407 () Bool)

(assert (=> d!45742 m!219407))

(declare-fun m!219409 () Bool)

(assert (=> d!45742 m!219409))

(assert (=> d!45742 m!219247))

(declare-fun m!219411 () Bool)

(assert (=> d!45742 m!219411))

(declare-fun m!219413 () Bool)

(assert (=> d!45742 m!219413))

(declare-fun m!219415 () Bool)

(assert (=> d!45742 m!219415))

(declare-fun m!219417 () Bool)

(assert (=> d!45742 m!219417))

(declare-fun m!219419 () Bool)

(assert (=> b!142918 m!219419))

(assert (=> b!142914 m!219219))

(declare-fun m!219421 () Bool)

(assert (=> b!142914 m!219421))

(declare-fun m!219423 () Bool)

(assert (=> b!142914 m!219423))

(assert (=> b!142818 d!45742))

(declare-fun d!45770 () Bool)

(assert (=> d!45770 (isPrefixOf!0 thiss!1634 (_2!6685 lt!221371))))

(declare-fun lt!221607 () Unit!8910)

(declare-fun choose!30 (BitStream!5174 BitStream!5174 BitStream!5174) Unit!8910)

(assert (=> d!45770 (= lt!221607 (choose!30 thiss!1634 (_2!6685 lt!221376) (_2!6685 lt!221371)))))

(assert (=> d!45770 (isPrefixOf!0 thiss!1634 (_2!6685 lt!221376))))

(assert (=> d!45770 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6685 lt!221376) (_2!6685 lt!221371)) lt!221607)))

(declare-fun bs!11231 () Bool)

(assert (= bs!11231 d!45770))

(assert (=> bs!11231 m!219247))

(declare-fun m!219425 () Bool)

(assert (=> bs!11231 m!219425))

(assert (=> bs!11231 m!219227))

(assert (=> b!142818 d!45770))

(declare-fun d!45772 () Bool)

(declare-fun e!95194 () Bool)

(assert (=> d!45772 e!95194))

(declare-fun res!119322 () Bool)

(assert (=> d!45772 (=> (not res!119322) (not e!95194))))

(declare-fun lt!221621 () tuple2!12692)

(assert (=> d!45772 (= res!119322 (= (size!2958 (buf!3385 thiss!1634)) (size!2958 (buf!3385 (_2!6685 lt!221621)))))))

(declare-fun choose!6 (BitStream!5174 (_ BitVec 8)) tuple2!12692)

(assert (=> d!45772 (= lt!221621 (choose!6 thiss!1634 (select (arr!3677 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!45772 (validate_offset_byte!0 ((_ sign_extend 32) (size!2958 (buf!3385 thiss!1634))) ((_ sign_extend 32) (currentByte!6263 thiss!1634)) ((_ sign_extend 32) (currentBit!6258 thiss!1634)))))

(assert (=> d!45772 (= (appendByte!0 thiss!1634 (select (arr!3677 arr!237) from!447)) lt!221621)))

(declare-fun b!142925 () Bool)

(declare-fun res!119321 () Bool)

(assert (=> b!142925 (=> (not res!119321) (not e!95194))))

(declare-fun lt!221619 () (_ BitVec 64))

(declare-fun lt!221620 () (_ BitVec 64))

(assert (=> b!142925 (= res!119321 (= (bitIndex!0 (size!2958 (buf!3385 (_2!6685 lt!221621))) (currentByte!6263 (_2!6685 lt!221621)) (currentBit!6258 (_2!6685 lt!221621))) (bvadd lt!221620 lt!221619)))))

(assert (=> b!142925 (or (not (= (bvand lt!221620 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!221619 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!221620 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!221620 lt!221619) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!142925 (= lt!221619 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!142925 (= lt!221620 (bitIndex!0 (size!2958 (buf!3385 thiss!1634)) (currentByte!6263 thiss!1634) (currentBit!6258 thiss!1634)))))

(declare-fun b!142926 () Bool)

(declare-fun res!119323 () Bool)

(assert (=> b!142926 (=> (not res!119323) (not e!95194))))

(assert (=> b!142926 (= res!119323 (isPrefixOf!0 thiss!1634 (_2!6685 lt!221621)))))

(declare-fun b!142927 () Bool)

(declare-fun lt!221618 () tuple2!12694)

(declare-fun lt!221622 () tuple2!12696)

(assert (=> b!142927 (= e!95194 (and (= (_2!6686 lt!221618) (select (arr!3677 arr!237) from!447)) (= (_1!6686 lt!221618) (_2!6687 lt!221622))))))

(assert (=> b!142927 (= lt!221618 (readBytePure!0 (_1!6687 lt!221622)))))

(assert (=> b!142927 (= lt!221622 (reader!0 thiss!1634 (_2!6685 lt!221621)))))

(assert (= (and d!45772 res!119322) b!142925))

(assert (= (and b!142925 res!119321) b!142926))

(assert (= (and b!142926 res!119323) b!142927))

(assert (=> d!45772 m!219255))

(declare-fun m!219427 () Bool)

(assert (=> d!45772 m!219427))

(declare-fun m!219429 () Bool)

(assert (=> d!45772 m!219429))

(declare-fun m!219431 () Bool)

(assert (=> b!142925 m!219431))

(assert (=> b!142925 m!219219))

(declare-fun m!219433 () Bool)

(assert (=> b!142926 m!219433))

(declare-fun m!219435 () Bool)

(assert (=> b!142927 m!219435))

(declare-fun m!219437 () Bool)

(assert (=> b!142927 m!219437))

(assert (=> b!142818 d!45772))

(declare-fun b!142928 () Bool)

(declare-fun e!95195 () Unit!8910)

(declare-fun lt!221641 () Unit!8910)

(assert (=> b!142928 (= e!95195 lt!221641)))

(declare-fun lt!221638 () (_ BitVec 64))

(assert (=> b!142928 (= lt!221638 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!221640 () (_ BitVec 64))

(assert (=> b!142928 (= lt!221640 (bitIndex!0 (size!2958 (buf!3385 (_2!6685 lt!221376))) (currentByte!6263 (_2!6685 lt!221376)) (currentBit!6258 (_2!6685 lt!221376))))))

(assert (=> b!142928 (= lt!221641 (arrayBitRangesEqSymmetric!0 (buf!3385 (_2!6685 lt!221376)) (buf!3385 (_2!6685 lt!221371)) lt!221638 lt!221640))))

(assert (=> b!142928 (arrayBitRangesEq!0 (buf!3385 (_2!6685 lt!221371)) (buf!3385 (_2!6685 lt!221376)) lt!221638 lt!221640)))

(declare-fun b!142929 () Bool)

(declare-fun res!119326 () Bool)

(declare-fun e!95196 () Bool)

(assert (=> b!142929 (=> (not res!119326) (not e!95196))))

(declare-fun lt!221627 () tuple2!12696)

(assert (=> b!142929 (= res!119326 (isPrefixOf!0 (_1!6687 lt!221627) (_2!6685 lt!221376)))))

(declare-fun lt!221630 () (_ BitVec 64))

(declare-fun b!142930 () Bool)

(declare-fun lt!221637 () (_ BitVec 64))

(assert (=> b!142930 (= e!95196 (= (_1!6687 lt!221627) (withMovedBitIndex!0 (_2!6687 lt!221627) (bvsub lt!221630 lt!221637))))))

(assert (=> b!142930 (or (= (bvand lt!221630 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!221637 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!221630 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!221630 lt!221637) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!142930 (= lt!221637 (bitIndex!0 (size!2958 (buf!3385 (_2!6685 lt!221371))) (currentByte!6263 (_2!6685 lt!221371)) (currentBit!6258 (_2!6685 lt!221371))))))

(assert (=> b!142930 (= lt!221630 (bitIndex!0 (size!2958 (buf!3385 (_2!6685 lt!221376))) (currentByte!6263 (_2!6685 lt!221376)) (currentBit!6258 (_2!6685 lt!221376))))))

(declare-fun b!142931 () Bool)

(declare-fun Unit!8915 () Unit!8910)

(assert (=> b!142931 (= e!95195 Unit!8915)))

(declare-fun b!142932 () Bool)

(declare-fun res!119324 () Bool)

(assert (=> b!142932 (=> (not res!119324) (not e!95196))))

(assert (=> b!142932 (= res!119324 (isPrefixOf!0 (_2!6687 lt!221627) (_2!6685 lt!221371)))))

(declare-fun d!45774 () Bool)

(assert (=> d!45774 e!95196))

(declare-fun res!119325 () Bool)

(assert (=> d!45774 (=> (not res!119325) (not e!95196))))

(assert (=> d!45774 (= res!119325 (isPrefixOf!0 (_1!6687 lt!221627) (_2!6687 lt!221627)))))

(declare-fun lt!221626 () BitStream!5174)

(assert (=> d!45774 (= lt!221627 (tuple2!12697 lt!221626 (_2!6685 lt!221371)))))

(declare-fun lt!221623 () Unit!8910)

(declare-fun lt!221629 () Unit!8910)

(assert (=> d!45774 (= lt!221623 lt!221629)))

(assert (=> d!45774 (isPrefixOf!0 lt!221626 (_2!6685 lt!221371))))

(assert (=> d!45774 (= lt!221629 (lemmaIsPrefixTransitive!0 lt!221626 (_2!6685 lt!221371) (_2!6685 lt!221371)))))

(declare-fun lt!221624 () Unit!8910)

(declare-fun lt!221632 () Unit!8910)

(assert (=> d!45774 (= lt!221624 lt!221632)))

(assert (=> d!45774 (isPrefixOf!0 lt!221626 (_2!6685 lt!221371))))

(assert (=> d!45774 (= lt!221632 (lemmaIsPrefixTransitive!0 lt!221626 (_2!6685 lt!221376) (_2!6685 lt!221371)))))

(declare-fun lt!221633 () Unit!8910)

(assert (=> d!45774 (= lt!221633 e!95195)))

(declare-fun c!7840 () Bool)

(assert (=> d!45774 (= c!7840 (not (= (size!2958 (buf!3385 (_2!6685 lt!221376))) #b00000000000000000000000000000000)))))

(declare-fun lt!221636 () Unit!8910)

(declare-fun lt!221628 () Unit!8910)

(assert (=> d!45774 (= lt!221636 lt!221628)))

(assert (=> d!45774 (isPrefixOf!0 (_2!6685 lt!221371) (_2!6685 lt!221371))))

(assert (=> d!45774 (= lt!221628 (lemmaIsPrefixRefl!0 (_2!6685 lt!221371)))))

(declare-fun lt!221635 () Unit!8910)

(declare-fun lt!221631 () Unit!8910)

(assert (=> d!45774 (= lt!221635 lt!221631)))

(assert (=> d!45774 (= lt!221631 (lemmaIsPrefixRefl!0 (_2!6685 lt!221371)))))

(declare-fun lt!221634 () Unit!8910)

(declare-fun lt!221642 () Unit!8910)

(assert (=> d!45774 (= lt!221634 lt!221642)))

(assert (=> d!45774 (isPrefixOf!0 lt!221626 lt!221626)))

(assert (=> d!45774 (= lt!221642 (lemmaIsPrefixRefl!0 lt!221626))))

(declare-fun lt!221639 () Unit!8910)

(declare-fun lt!221625 () Unit!8910)

(assert (=> d!45774 (= lt!221639 lt!221625)))

(assert (=> d!45774 (isPrefixOf!0 (_2!6685 lt!221376) (_2!6685 lt!221376))))

(assert (=> d!45774 (= lt!221625 (lemmaIsPrefixRefl!0 (_2!6685 lt!221376)))))

(assert (=> d!45774 (= lt!221626 (BitStream!5175 (buf!3385 (_2!6685 lt!221371)) (currentByte!6263 (_2!6685 lt!221376)) (currentBit!6258 (_2!6685 lt!221376))))))

(assert (=> d!45774 (isPrefixOf!0 (_2!6685 lt!221376) (_2!6685 lt!221371))))

(assert (=> d!45774 (= (reader!0 (_2!6685 lt!221376) (_2!6685 lt!221371)) lt!221627)))

(assert (= (and d!45774 c!7840) b!142928))

(assert (= (and d!45774 (not c!7840)) b!142931))

(assert (= (and d!45774 res!119325) b!142929))

(assert (= (and b!142929 res!119326) b!142932))

(assert (= (and b!142932 res!119324) b!142930))

(declare-fun m!219439 () Bool)

(assert (=> b!142930 m!219439))

(assert (=> b!142930 m!219229))

(assert (=> b!142930 m!219217))

(declare-fun m!219441 () Bool)

(assert (=> b!142929 m!219441))

(declare-fun m!219443 () Bool)

(assert (=> d!45774 m!219443))

(declare-fun m!219445 () Bool)

(assert (=> d!45774 m!219445))

(assert (=> d!45774 m!219403))

(declare-fun m!219447 () Bool)

(assert (=> d!45774 m!219447))

(declare-fun m!219449 () Bool)

(assert (=> d!45774 m!219449))

(declare-fun m!219451 () Bool)

(assert (=> d!45774 m!219451))

(assert (=> d!45774 m!219279))

(declare-fun m!219453 () Bool)

(assert (=> d!45774 m!219453))

(assert (=> d!45774 m!219413))

(declare-fun m!219455 () Bool)

(assert (=> d!45774 m!219455))

(declare-fun m!219457 () Bool)

(assert (=> d!45774 m!219457))

(declare-fun m!219459 () Bool)

(assert (=> b!142932 m!219459))

(assert (=> b!142928 m!219217))

(declare-fun m!219461 () Bool)

(assert (=> b!142928 m!219461))

(declare-fun m!219463 () Bool)

(assert (=> b!142928 m!219463))

(assert (=> b!142818 d!45774))

(declare-fun d!45776 () Bool)

(declare-fun e!95197 () Bool)

(assert (=> d!45776 e!95197))

(declare-fun res!119328 () Bool)

(assert (=> d!45776 (=> (not res!119328) (not e!95197))))

(declare-fun lt!221648 () (_ BitVec 64))

(declare-fun lt!221643 () (_ BitVec 64))

(declare-fun lt!221647 () (_ BitVec 64))

(assert (=> d!45776 (= res!119328 (= lt!221648 (bvsub lt!221643 lt!221647)))))

(assert (=> d!45776 (or (= (bvand lt!221643 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!221647 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!221643 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!221643 lt!221647) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45776 (= lt!221647 (remainingBits!0 ((_ sign_extend 32) (size!2958 (buf!3385 (_1!6686 lt!221374)))) ((_ sign_extend 32) (currentByte!6263 (_1!6686 lt!221374))) ((_ sign_extend 32) (currentBit!6258 (_1!6686 lt!221374)))))))

(declare-fun lt!221646 () (_ BitVec 64))

(declare-fun lt!221644 () (_ BitVec 64))

(assert (=> d!45776 (= lt!221643 (bvmul lt!221646 lt!221644))))

(assert (=> d!45776 (or (= lt!221646 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!221644 (bvsdiv (bvmul lt!221646 lt!221644) lt!221646)))))

(assert (=> d!45776 (= lt!221644 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45776 (= lt!221646 ((_ sign_extend 32) (size!2958 (buf!3385 (_1!6686 lt!221374)))))))

(assert (=> d!45776 (= lt!221648 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6263 (_1!6686 lt!221374))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6258 (_1!6686 lt!221374)))))))

(assert (=> d!45776 (invariant!0 (currentBit!6258 (_1!6686 lt!221374)) (currentByte!6263 (_1!6686 lt!221374)) (size!2958 (buf!3385 (_1!6686 lt!221374))))))

(assert (=> d!45776 (= (bitIndex!0 (size!2958 (buf!3385 (_1!6686 lt!221374))) (currentByte!6263 (_1!6686 lt!221374)) (currentBit!6258 (_1!6686 lt!221374))) lt!221648)))

(declare-fun b!142933 () Bool)

(declare-fun res!119327 () Bool)

(assert (=> b!142933 (=> (not res!119327) (not e!95197))))

(assert (=> b!142933 (= res!119327 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!221648))))

(declare-fun b!142934 () Bool)

(declare-fun lt!221645 () (_ BitVec 64))

(assert (=> b!142934 (= e!95197 (bvsle lt!221648 (bvmul lt!221645 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!142934 (or (= lt!221645 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!221645 #b0000000000000000000000000000000000000000000000000000000000001000) lt!221645)))))

(assert (=> b!142934 (= lt!221645 ((_ sign_extend 32) (size!2958 (buf!3385 (_1!6686 lt!221374)))))))

(assert (= (and d!45776 res!119328) b!142933))

(assert (= (and b!142933 res!119327) b!142934))

(declare-fun m!219465 () Bool)

(assert (=> d!45776 m!219465))

(declare-fun m!219467 () Bool)

(assert (=> d!45776 m!219467))

(assert (=> b!142818 d!45776))

(declare-fun d!45778 () Bool)

(declare-fun lt!221649 () tuple2!12700)

(assert (=> d!45778 (= lt!221649 (readByte!0 (_1!6687 lt!221379)))))

(assert (=> d!45778 (= (readBytePure!0 (_1!6687 lt!221379)) (tuple2!12695 (_2!6690 lt!221649) (_1!6690 lt!221649)))))

(declare-fun bs!11232 () Bool)

(assert (= bs!11232 d!45778))

(declare-fun m!219469 () Bool)

(assert (=> bs!11232 m!219469))

(assert (=> b!142818 d!45778))

(declare-fun d!45780 () Bool)

(declare-fun e!95200 () Bool)

(assert (=> d!45780 e!95200))

(declare-fun res!119331 () Bool)

(assert (=> d!45780 (=> (not res!119331) (not e!95200))))

(declare-fun lt!221659 () tuple2!12694)

(declare-fun lt!221661 () tuple2!12694)

(assert (=> d!45780 (= res!119331 (= (bitIndex!0 (size!2958 (buf!3385 (_1!6686 lt!221659))) (currentByte!6263 (_1!6686 lt!221659)) (currentBit!6258 (_1!6686 lt!221659))) (bitIndex!0 (size!2958 (buf!3385 (_1!6686 lt!221661))) (currentByte!6263 (_1!6686 lt!221661)) (currentBit!6258 (_1!6686 lt!221661)))))))

(declare-fun lt!221660 () BitStream!5174)

(declare-fun lt!221658 () Unit!8910)

(declare-fun choose!14 (BitStream!5174 BitStream!5174 BitStream!5174 tuple2!12694 tuple2!12694 BitStream!5174 (_ BitVec 8) tuple2!12694 tuple2!12694 BitStream!5174 (_ BitVec 8)) Unit!8910)

(assert (=> d!45780 (= lt!221658 (choose!14 lt!221382 (_2!6685 lt!221371) lt!221660 lt!221659 (tuple2!12695 (_1!6686 lt!221659) (_2!6686 lt!221659)) (_1!6686 lt!221659) (_2!6686 lt!221659) lt!221661 (tuple2!12695 (_1!6686 lt!221661) (_2!6686 lt!221661)) (_1!6686 lt!221661) (_2!6686 lt!221661)))))

(assert (=> d!45780 (= lt!221661 (readBytePure!0 lt!221660))))

(assert (=> d!45780 (= lt!221659 (readBytePure!0 lt!221382))))

(assert (=> d!45780 (= lt!221660 (BitStream!5175 (buf!3385 (_2!6685 lt!221371)) (currentByte!6263 lt!221382) (currentBit!6258 lt!221382)))))

(assert (=> d!45780 (= (readBytePrefixLemma!0 lt!221382 (_2!6685 lt!221371)) lt!221658)))

(declare-fun b!142937 () Bool)

(assert (=> b!142937 (= e!95200 (= (_2!6686 lt!221659) (_2!6686 lt!221661)))))

(assert (= (and d!45780 res!119331) b!142937))

(assert (=> d!45780 m!219239))

(declare-fun m!219471 () Bool)

(assert (=> d!45780 m!219471))

(declare-fun m!219473 () Bool)

(assert (=> d!45780 m!219473))

(declare-fun m!219475 () Bool)

(assert (=> d!45780 m!219475))

(declare-fun m!219477 () Bool)

(assert (=> d!45780 m!219477))

(assert (=> b!142818 d!45780))

(declare-fun d!45782 () Bool)

(assert (=> d!45782 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2958 (buf!3385 (_2!6685 lt!221376)))) ((_ sign_extend 32) (currentByte!6263 (_2!6685 lt!221376))) ((_ sign_extend 32) (currentBit!6258 (_2!6685 lt!221376))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2958 (buf!3385 (_2!6685 lt!221376)))) ((_ sign_extend 32) (currentByte!6263 (_2!6685 lt!221376))) ((_ sign_extend 32) (currentBit!6258 (_2!6685 lt!221376)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11233 () Bool)

(assert (= bs!11233 d!45782))

(declare-fun m!219479 () Bool)

(assert (=> bs!11233 m!219479))

(assert (=> b!142818 d!45782))

(declare-fun d!45784 () Bool)

(declare-fun e!95209 () Bool)

(assert (=> d!45784 e!95209))

(declare-fun res!119344 () Bool)

(assert (=> d!45784 (=> (not res!119344) (not e!95209))))

(assert (=> d!45784 (= res!119344 (and (or (let ((rhs!3194 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3194 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3194) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!45785 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!45785 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!45785 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3193 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3193 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3193) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!221686 () Unit!8910)

(declare-fun choose!57 (BitStream!5174 BitStream!5174 (_ BitVec 64) (_ BitVec 32)) Unit!8910)

(assert (=> d!45784 (= lt!221686 (choose!57 thiss!1634 (_2!6685 lt!221376) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!45784 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6685 lt!221376) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!221686)))

(declare-fun lt!221687 () (_ BitVec 32))

(declare-fun b!142950 () Bool)

(assert (=> b!142950 (= e!95209 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2958 (buf!3385 (_2!6685 lt!221376)))) ((_ sign_extend 32) (currentByte!6263 (_2!6685 lt!221376))) ((_ sign_extend 32) (currentBit!6258 (_2!6685 lt!221376))) (bvsub (bvsub to!404 from!447) lt!221687)))))

(assert (=> b!142950 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!221687 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!221687) #b10000000000000000000000000000000)))))

(declare-fun lt!221688 () (_ BitVec 64))

(assert (=> b!142950 (= lt!221687 ((_ extract 31 0) lt!221688))))

(assert (=> b!142950 (and (bvslt lt!221688 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!221688 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!142950 (= lt!221688 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!45784 res!119344) b!142950))

(declare-fun m!219481 () Bool)

(assert (=> d!45784 m!219481))

(declare-fun m!219483 () Bool)

(assert (=> b!142950 m!219483))

(assert (=> b!142818 d!45784))

(declare-fun e!95231 () Bool)

(declare-fun b!142988 () Bool)

(declare-fun lt!221776 () tuple2!12698)

(assert (=> b!142988 (= e!95231 (arrayRangesEq!274 arr!237 (_2!6688 lt!221776) #b00000000000000000000000000000000 to!404))))

(declare-fun b!142989 () Bool)

(declare-fun e!95230 () Bool)

(declare-fun lt!221771 () (_ BitVec 64))

(assert (=> b!142989 (= e!95230 (validate_offset_bits!1 ((_ sign_extend 32) (size!2958 (buf!3385 (_2!6685 lt!221376)))) ((_ sign_extend 32) (currentByte!6263 (_2!6685 lt!221376))) ((_ sign_extend 32) (currentBit!6258 (_2!6685 lt!221376))) lt!221771))))

(declare-fun b!142990 () Bool)

(declare-fun res!119383 () Bool)

(declare-fun e!95232 () Bool)

(assert (=> b!142990 (=> (not res!119383) (not e!95232))))

(declare-fun lt!221774 () (_ BitVec 64))

(declare-fun lt!221778 () tuple2!12692)

(declare-fun lt!221775 () (_ BitVec 64))

(assert (=> b!142990 (= res!119383 (= (bitIndex!0 (size!2958 (buf!3385 (_2!6685 lt!221778))) (currentByte!6263 (_2!6685 lt!221778)) (currentBit!6258 (_2!6685 lt!221778))) (bvadd lt!221775 lt!221774)))))

(assert (=> b!142990 (or (not (= (bvand lt!221775 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!221774 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!221775 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!221775 lt!221774) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!221773 () (_ BitVec 64))

(assert (=> b!142990 (= lt!221774 (bvmul lt!221773 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!142990 (or (= lt!221773 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!221773 #b0000000000000000000000000000000000000000000000000000000000001000) lt!221773)))))

(assert (=> b!142990 (= lt!221773 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!142990 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!142990 (= lt!221775 (bitIndex!0 (size!2958 (buf!3385 (_2!6685 lt!221376))) (currentByte!6263 (_2!6685 lt!221376)) (currentBit!6258 (_2!6685 lt!221376))))))

(declare-fun d!45787 () Bool)

(assert (=> d!45787 e!95232))

(declare-fun res!119380 () Bool)

(assert (=> d!45787 (=> (not res!119380) (not e!95232))))

(assert (=> d!45787 (= res!119380 (= (size!2958 (buf!3385 (_2!6685 lt!221376))) (size!2958 (buf!3385 (_2!6685 lt!221778)))))))

(declare-fun choose!64 (BitStream!5174 array!6535 (_ BitVec 32) (_ BitVec 32)) tuple2!12692)

(assert (=> d!45787 (= lt!221778 (choose!64 (_2!6685 lt!221376) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!45787 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2958 arr!237)))))

(assert (=> d!45787 (= (appendByteArrayLoop!0 (_2!6685 lt!221376) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!221778)))

(declare-fun b!142991 () Bool)

(declare-fun res!119384 () Bool)

(assert (=> b!142991 (=> (not res!119384) (not e!95232))))

(assert (=> b!142991 (= res!119384 (isPrefixOf!0 (_2!6685 lt!221376) (_2!6685 lt!221778)))))

(declare-fun b!142992 () Bool)

(assert (=> b!142992 (= e!95232 e!95231)))

(declare-fun res!119381 () Bool)

(assert (=> b!142992 (=> (not res!119381) (not e!95231))))

(declare-fun lt!221772 () tuple2!12696)

(assert (=> b!142992 (= res!119381 (and (= (size!2958 (_2!6688 lt!221776)) (size!2958 arr!237)) (= (_1!6688 lt!221776) (_2!6687 lt!221772))))))

(assert (=> b!142992 (= lt!221776 (readByteArrayLoopPure!0 (_1!6687 lt!221772) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!221777 () Unit!8910)

(declare-fun lt!221779 () Unit!8910)

(assert (=> b!142992 (= lt!221777 lt!221779)))

(assert (=> b!142992 (validate_offset_bits!1 ((_ sign_extend 32) (size!2958 (buf!3385 (_2!6685 lt!221778)))) ((_ sign_extend 32) (currentByte!6263 (_2!6685 lt!221376))) ((_ sign_extend 32) (currentBit!6258 (_2!6685 lt!221376))) lt!221771)))

(assert (=> b!142992 (= lt!221779 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6685 lt!221376) (buf!3385 (_2!6685 lt!221778)) lt!221771))))

(assert (=> b!142992 e!95230))

(declare-fun res!119382 () Bool)

(assert (=> b!142992 (=> (not res!119382) (not e!95230))))

(assert (=> b!142992 (= res!119382 (and (= (size!2958 (buf!3385 (_2!6685 lt!221376))) (size!2958 (buf!3385 (_2!6685 lt!221778)))) (bvsge lt!221771 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!142992 (= lt!221771 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!142992 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!142992 (= lt!221772 (reader!0 (_2!6685 lt!221376) (_2!6685 lt!221778)))))

(assert (= (and d!45787 res!119380) b!142990))

(assert (= (and b!142990 res!119383) b!142991))

(assert (= (and b!142991 res!119384) b!142992))

(assert (= (and b!142992 res!119382) b!142989))

(assert (= (and b!142992 res!119381) b!142988))

(declare-fun m!219553 () Bool)

(assert (=> b!142992 m!219553))

(declare-fun m!219555 () Bool)

(assert (=> b!142992 m!219555))

(declare-fun m!219557 () Bool)

(assert (=> b!142992 m!219557))

(declare-fun m!219559 () Bool)

(assert (=> b!142992 m!219559))

(declare-fun m!219561 () Bool)

(assert (=> d!45787 m!219561))

(declare-fun m!219563 () Bool)

(assert (=> b!142991 m!219563))

(declare-fun m!219565 () Bool)

(assert (=> b!142988 m!219565))

(declare-fun m!219567 () Bool)

(assert (=> b!142990 m!219567))

(assert (=> b!142990 m!219217))

(declare-fun m!219569 () Bool)

(assert (=> b!142989 m!219569))

(assert (=> b!142818 d!45787))

(declare-fun d!45808 () Bool)

(assert (=> d!45808 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2958 (buf!3385 thiss!1634))) ((_ sign_extend 32) (currentByte!6263 thiss!1634)) ((_ sign_extend 32) (currentBit!6258 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2958 (buf!3385 thiss!1634))) ((_ sign_extend 32) (currentByte!6263 thiss!1634)) ((_ sign_extend 32) (currentBit!6258 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11238 () Bool)

(assert (= bs!11238 d!45808))

(declare-fun m!219571 () Bool)

(assert (=> bs!11238 m!219571))

(assert (=> b!142827 d!45808))

(declare-fun d!45810 () Bool)

(declare-fun e!95233 () Bool)

(assert (=> d!45810 e!95233))

(declare-fun res!119386 () Bool)

(assert (=> d!45810 (=> (not res!119386) (not e!95233))))

(declare-fun lt!221784 () (_ BitVec 64))

(declare-fun lt!221780 () (_ BitVec 64))

(declare-fun lt!221785 () (_ BitVec 64))

(assert (=> d!45810 (= res!119386 (= lt!221785 (bvsub lt!221780 lt!221784)))))

(assert (=> d!45810 (or (= (bvand lt!221780 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!221784 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!221780 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!221780 lt!221784) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45810 (= lt!221784 (remainingBits!0 ((_ sign_extend 32) (size!2958 (buf!3385 (_2!6685 lt!221371)))) ((_ sign_extend 32) (currentByte!6263 (_2!6685 lt!221371))) ((_ sign_extend 32) (currentBit!6258 (_2!6685 lt!221371)))))))

(declare-fun lt!221783 () (_ BitVec 64))

(declare-fun lt!221781 () (_ BitVec 64))

(assert (=> d!45810 (= lt!221780 (bvmul lt!221783 lt!221781))))

(assert (=> d!45810 (or (= lt!221783 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!221781 (bvsdiv (bvmul lt!221783 lt!221781) lt!221783)))))

(assert (=> d!45810 (= lt!221781 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45810 (= lt!221783 ((_ sign_extend 32) (size!2958 (buf!3385 (_2!6685 lt!221371)))))))

(assert (=> d!45810 (= lt!221785 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6263 (_2!6685 lt!221371))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6258 (_2!6685 lt!221371)))))))

(assert (=> d!45810 (invariant!0 (currentBit!6258 (_2!6685 lt!221371)) (currentByte!6263 (_2!6685 lt!221371)) (size!2958 (buf!3385 (_2!6685 lt!221371))))))

(assert (=> d!45810 (= (bitIndex!0 (size!2958 (buf!3385 (_2!6685 lt!221371))) (currentByte!6263 (_2!6685 lt!221371)) (currentBit!6258 (_2!6685 lt!221371))) lt!221785)))

(declare-fun b!142993 () Bool)

(declare-fun res!119385 () Bool)

(assert (=> b!142993 (=> (not res!119385) (not e!95233))))

(assert (=> b!142993 (= res!119385 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!221785))))

(declare-fun b!142994 () Bool)

(declare-fun lt!221782 () (_ BitVec 64))

(assert (=> b!142994 (= e!95233 (bvsle lt!221785 (bvmul lt!221782 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!142994 (or (= lt!221782 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!221782 #b0000000000000000000000000000000000000000000000000000000000001000) lt!221782)))))

(assert (=> b!142994 (= lt!221782 ((_ sign_extend 32) (size!2958 (buf!3385 (_2!6685 lt!221371)))))))

(assert (= (and d!45810 res!119386) b!142993))

(assert (= (and b!142993 res!119385) b!142994))

(declare-fun m!219573 () Bool)

(assert (=> d!45810 m!219573))

(declare-fun m!219575 () Bool)

(assert (=> d!45810 m!219575))

(assert (=> b!142816 d!45810))

(declare-fun d!45812 () Bool)

(declare-fun e!95234 () Bool)

(assert (=> d!45812 e!95234))

(declare-fun res!119388 () Bool)

(assert (=> d!45812 (=> (not res!119388) (not e!95234))))

(declare-fun lt!221786 () (_ BitVec 64))

(declare-fun lt!221791 () (_ BitVec 64))

(declare-fun lt!221790 () (_ BitVec 64))

(assert (=> d!45812 (= res!119388 (= lt!221791 (bvsub lt!221786 lt!221790)))))

(assert (=> d!45812 (or (= (bvand lt!221786 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!221790 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!221786 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!221786 lt!221790) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45812 (= lt!221790 (remainingBits!0 ((_ sign_extend 32) (size!2958 (buf!3385 (_2!6685 lt!221376)))) ((_ sign_extend 32) (currentByte!6263 (_2!6685 lt!221376))) ((_ sign_extend 32) (currentBit!6258 (_2!6685 lt!221376)))))))

(declare-fun lt!221789 () (_ BitVec 64))

(declare-fun lt!221787 () (_ BitVec 64))

(assert (=> d!45812 (= lt!221786 (bvmul lt!221789 lt!221787))))

(assert (=> d!45812 (or (= lt!221789 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!221787 (bvsdiv (bvmul lt!221789 lt!221787) lt!221789)))))

(assert (=> d!45812 (= lt!221787 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45812 (= lt!221789 ((_ sign_extend 32) (size!2958 (buf!3385 (_2!6685 lt!221376)))))))

(assert (=> d!45812 (= lt!221791 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6263 (_2!6685 lt!221376))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6258 (_2!6685 lt!221376)))))))

(assert (=> d!45812 (invariant!0 (currentBit!6258 (_2!6685 lt!221376)) (currentByte!6263 (_2!6685 lt!221376)) (size!2958 (buf!3385 (_2!6685 lt!221376))))))

(assert (=> d!45812 (= (bitIndex!0 (size!2958 (buf!3385 (_2!6685 lt!221376))) (currentByte!6263 (_2!6685 lt!221376)) (currentBit!6258 (_2!6685 lt!221376))) lt!221791)))

(declare-fun b!142995 () Bool)

(declare-fun res!119387 () Bool)

(assert (=> b!142995 (=> (not res!119387) (not e!95234))))

(assert (=> b!142995 (= res!119387 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!221791))))

(declare-fun b!142996 () Bool)

(declare-fun lt!221788 () (_ BitVec 64))

(assert (=> b!142996 (= e!95234 (bvsle lt!221791 (bvmul lt!221788 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!142996 (or (= lt!221788 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!221788 #b0000000000000000000000000000000000000000000000000000000000001000) lt!221788)))))

(assert (=> b!142996 (= lt!221788 ((_ sign_extend 32) (size!2958 (buf!3385 (_2!6685 lt!221376)))))))

(assert (= (and d!45812 res!119388) b!142995))

(assert (= (and b!142995 res!119387) b!142996))

(assert (=> d!45812 m!219479))

(declare-fun m!219577 () Bool)

(assert (=> d!45812 m!219577))

(assert (=> b!142816 d!45812))

(assert (=> b!142826 d!45812))

(declare-fun d!45814 () Bool)

(declare-fun e!95235 () Bool)

(assert (=> d!45814 e!95235))

(declare-fun res!119390 () Bool)

(assert (=> d!45814 (=> (not res!119390) (not e!95235))))

(declare-fun lt!221796 () (_ BitVec 64))

(declare-fun lt!221792 () (_ BitVec 64))

(declare-fun lt!221797 () (_ BitVec 64))

(assert (=> d!45814 (= res!119390 (= lt!221797 (bvsub lt!221792 lt!221796)))))

(assert (=> d!45814 (or (= (bvand lt!221792 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!221796 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!221792 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!221792 lt!221796) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45814 (= lt!221796 (remainingBits!0 ((_ sign_extend 32) (size!2958 (buf!3385 thiss!1634))) ((_ sign_extend 32) (currentByte!6263 thiss!1634)) ((_ sign_extend 32) (currentBit!6258 thiss!1634))))))

(declare-fun lt!221795 () (_ BitVec 64))

(declare-fun lt!221793 () (_ BitVec 64))

(assert (=> d!45814 (= lt!221792 (bvmul lt!221795 lt!221793))))

(assert (=> d!45814 (or (= lt!221795 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!221793 (bvsdiv (bvmul lt!221795 lt!221793) lt!221795)))))

(assert (=> d!45814 (= lt!221793 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45814 (= lt!221795 ((_ sign_extend 32) (size!2958 (buf!3385 thiss!1634))))))

(assert (=> d!45814 (= lt!221797 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6263 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6258 thiss!1634))))))

(assert (=> d!45814 (invariant!0 (currentBit!6258 thiss!1634) (currentByte!6263 thiss!1634) (size!2958 (buf!3385 thiss!1634)))))

(assert (=> d!45814 (= (bitIndex!0 (size!2958 (buf!3385 thiss!1634)) (currentByte!6263 thiss!1634) (currentBit!6258 thiss!1634)) lt!221797)))

(declare-fun b!142997 () Bool)

(declare-fun res!119389 () Bool)

(assert (=> b!142997 (=> (not res!119389) (not e!95235))))

(assert (=> b!142997 (= res!119389 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!221797))))

(declare-fun b!142998 () Bool)

(declare-fun lt!221794 () (_ BitVec 64))

(assert (=> b!142998 (= e!95235 (bvsle lt!221797 (bvmul lt!221794 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!142998 (or (= lt!221794 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!221794 #b0000000000000000000000000000000000000000000000000000000000001000) lt!221794)))))

(assert (=> b!142998 (= lt!221794 ((_ sign_extend 32) (size!2958 (buf!3385 thiss!1634))))))

(assert (= (and d!45814 res!119390) b!142997))

(assert (= (and b!142997 res!119389) b!142998))

(assert (=> d!45814 m!219571))

(assert (=> d!45814 m!219235))

(assert (=> b!142826 d!45814))

(declare-fun d!45816 () Bool)

(declare-datatypes ((tuple3!550 0))(
  ( (tuple3!551 (_1!6692 Unit!8910) (_2!6692 BitStream!5174) (_3!340 array!6535)) )
))
(declare-fun lt!221800 () tuple3!550)

(declare-fun readByteArrayLoop!0 (BitStream!5174 array!6535 (_ BitVec 32) (_ BitVec 32)) tuple3!550)

(assert (=> d!45816 (= lt!221800 (readByteArrayLoop!0 (_1!6687 lt!221384) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!45816 (= (readByteArrayLoopPure!0 (_1!6687 lt!221384) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!12699 (_2!6692 lt!221800) (_3!340 lt!221800)))))

(declare-fun bs!11239 () Bool)

(assert (= bs!11239 d!45816))

(declare-fun m!219579 () Bool)

(assert (=> bs!11239 m!219579))

(assert (=> b!142825 d!45816))

(declare-fun d!45818 () Bool)

(assert (=> d!45818 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2958 (buf!3385 (_2!6685 lt!221371)))) ((_ sign_extend 32) (currentByte!6263 (_2!6685 lt!221376))) ((_ sign_extend 32) (currentBit!6258 (_2!6685 lt!221376))) lt!221375) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2958 (buf!3385 (_2!6685 lt!221371)))) ((_ sign_extend 32) (currentByte!6263 (_2!6685 lt!221376))) ((_ sign_extend 32) (currentBit!6258 (_2!6685 lt!221376)))) lt!221375))))

(declare-fun bs!11240 () Bool)

(assert (= bs!11240 d!45818))

(declare-fun m!219581 () Bool)

(assert (=> bs!11240 m!219581))

(assert (=> b!142825 d!45818))

(declare-fun d!45820 () Bool)

(assert (=> d!45820 (validate_offset_bits!1 ((_ sign_extend 32) (size!2958 (buf!3385 (_2!6685 lt!221371)))) ((_ sign_extend 32) (currentByte!6263 (_2!6685 lt!221376))) ((_ sign_extend 32) (currentBit!6258 (_2!6685 lt!221376))) lt!221375)))

(declare-fun lt!221803 () Unit!8910)

(declare-fun choose!9 (BitStream!5174 array!6535 (_ BitVec 64) BitStream!5174) Unit!8910)

(assert (=> d!45820 (= lt!221803 (choose!9 (_2!6685 lt!221376) (buf!3385 (_2!6685 lt!221371)) lt!221375 (BitStream!5175 (buf!3385 (_2!6685 lt!221371)) (currentByte!6263 (_2!6685 lt!221376)) (currentBit!6258 (_2!6685 lt!221376)))))))

(assert (=> d!45820 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6685 lt!221376) (buf!3385 (_2!6685 lt!221371)) lt!221375) lt!221803)))

(declare-fun bs!11241 () Bool)

(assert (= bs!11241 d!45820))

(assert (=> bs!11241 m!219275))

(declare-fun m!219583 () Bool)

(assert (=> bs!11241 m!219583))

(assert (=> b!142825 d!45820))

(assert (=> b!142825 d!45774))

(declare-fun d!45822 () Bool)

(declare-fun lt!221804 () tuple2!12700)

(assert (=> d!45822 (= lt!221804 (readByte!0 (_1!6687 lt!221377)))))

(assert (=> d!45822 (= (readBytePure!0 (_1!6687 lt!221377)) (tuple2!12695 (_2!6690 lt!221804) (_1!6690 lt!221804)))))

(declare-fun bs!11242 () Bool)

(assert (= bs!11242 d!45822))

(declare-fun m!219585 () Bool)

(assert (=> bs!11242 m!219585))

(assert (=> b!142824 d!45822))

(declare-fun b!142999 () Bool)

(declare-fun e!95236 () Unit!8910)

(declare-fun lt!221823 () Unit!8910)

(assert (=> b!142999 (= e!95236 lt!221823)))

(declare-fun lt!221820 () (_ BitVec 64))

(assert (=> b!142999 (= lt!221820 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!221822 () (_ BitVec 64))

(assert (=> b!142999 (= lt!221822 (bitIndex!0 (size!2958 (buf!3385 thiss!1634)) (currentByte!6263 thiss!1634) (currentBit!6258 thiss!1634)))))

(assert (=> b!142999 (= lt!221823 (arrayBitRangesEqSymmetric!0 (buf!3385 thiss!1634) (buf!3385 (_2!6685 lt!221376)) lt!221820 lt!221822))))

(assert (=> b!142999 (arrayBitRangesEq!0 (buf!3385 (_2!6685 lt!221376)) (buf!3385 thiss!1634) lt!221820 lt!221822)))

(declare-fun b!143000 () Bool)

(declare-fun res!119393 () Bool)

(declare-fun e!95237 () Bool)

(assert (=> b!143000 (=> (not res!119393) (not e!95237))))

(declare-fun lt!221809 () tuple2!12696)

(assert (=> b!143000 (= res!119393 (isPrefixOf!0 (_1!6687 lt!221809) thiss!1634))))

(declare-fun lt!221819 () (_ BitVec 64))

(declare-fun lt!221812 () (_ BitVec 64))

(declare-fun b!143001 () Bool)

(assert (=> b!143001 (= e!95237 (= (_1!6687 lt!221809) (withMovedBitIndex!0 (_2!6687 lt!221809) (bvsub lt!221812 lt!221819))))))

(assert (=> b!143001 (or (= (bvand lt!221812 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!221819 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!221812 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!221812 lt!221819) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!143001 (= lt!221819 (bitIndex!0 (size!2958 (buf!3385 (_2!6685 lt!221376))) (currentByte!6263 (_2!6685 lt!221376)) (currentBit!6258 (_2!6685 lt!221376))))))

(assert (=> b!143001 (= lt!221812 (bitIndex!0 (size!2958 (buf!3385 thiss!1634)) (currentByte!6263 thiss!1634) (currentBit!6258 thiss!1634)))))

(declare-fun b!143002 () Bool)

(declare-fun Unit!8917 () Unit!8910)

(assert (=> b!143002 (= e!95236 Unit!8917)))

(declare-fun b!143003 () Bool)

(declare-fun res!119391 () Bool)

(assert (=> b!143003 (=> (not res!119391) (not e!95237))))

(assert (=> b!143003 (= res!119391 (isPrefixOf!0 (_2!6687 lt!221809) (_2!6685 lt!221376)))))

(declare-fun d!45824 () Bool)

(assert (=> d!45824 e!95237))

(declare-fun res!119392 () Bool)

(assert (=> d!45824 (=> (not res!119392) (not e!95237))))

(assert (=> d!45824 (= res!119392 (isPrefixOf!0 (_1!6687 lt!221809) (_2!6687 lt!221809)))))

(declare-fun lt!221808 () BitStream!5174)

(assert (=> d!45824 (= lt!221809 (tuple2!12697 lt!221808 (_2!6685 lt!221376)))))

(declare-fun lt!221805 () Unit!8910)

(declare-fun lt!221811 () Unit!8910)

(assert (=> d!45824 (= lt!221805 lt!221811)))

(assert (=> d!45824 (isPrefixOf!0 lt!221808 (_2!6685 lt!221376))))

(assert (=> d!45824 (= lt!221811 (lemmaIsPrefixTransitive!0 lt!221808 (_2!6685 lt!221376) (_2!6685 lt!221376)))))

(declare-fun lt!221806 () Unit!8910)

(declare-fun lt!221814 () Unit!8910)

(assert (=> d!45824 (= lt!221806 lt!221814)))

(assert (=> d!45824 (isPrefixOf!0 lt!221808 (_2!6685 lt!221376))))

(assert (=> d!45824 (= lt!221814 (lemmaIsPrefixTransitive!0 lt!221808 thiss!1634 (_2!6685 lt!221376)))))

(declare-fun lt!221815 () Unit!8910)

(assert (=> d!45824 (= lt!221815 e!95236)))

(declare-fun c!7842 () Bool)

(assert (=> d!45824 (= c!7842 (not (= (size!2958 (buf!3385 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!221818 () Unit!8910)

(declare-fun lt!221810 () Unit!8910)

(assert (=> d!45824 (= lt!221818 lt!221810)))

(assert (=> d!45824 (isPrefixOf!0 (_2!6685 lt!221376) (_2!6685 lt!221376))))

(assert (=> d!45824 (= lt!221810 (lemmaIsPrefixRefl!0 (_2!6685 lt!221376)))))

(declare-fun lt!221817 () Unit!8910)

(declare-fun lt!221813 () Unit!8910)

(assert (=> d!45824 (= lt!221817 lt!221813)))

(assert (=> d!45824 (= lt!221813 (lemmaIsPrefixRefl!0 (_2!6685 lt!221376)))))

(declare-fun lt!221816 () Unit!8910)

(declare-fun lt!221824 () Unit!8910)

(assert (=> d!45824 (= lt!221816 lt!221824)))

(assert (=> d!45824 (isPrefixOf!0 lt!221808 lt!221808)))

(assert (=> d!45824 (= lt!221824 (lemmaIsPrefixRefl!0 lt!221808))))

(declare-fun lt!221821 () Unit!8910)

(declare-fun lt!221807 () Unit!8910)

(assert (=> d!45824 (= lt!221821 lt!221807)))

(assert (=> d!45824 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!45824 (= lt!221807 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!45824 (= lt!221808 (BitStream!5175 (buf!3385 (_2!6685 lt!221376)) (currentByte!6263 thiss!1634) (currentBit!6258 thiss!1634)))))

(assert (=> d!45824 (isPrefixOf!0 thiss!1634 (_2!6685 lt!221376))))

(assert (=> d!45824 (= (reader!0 thiss!1634 (_2!6685 lt!221376)) lt!221809)))

(assert (= (and d!45824 c!7842) b!142999))

(assert (= (and d!45824 (not c!7842)) b!143002))

(assert (= (and d!45824 res!119392) b!143000))

(assert (= (and b!143000 res!119393) b!143003))

(assert (= (and b!143003 res!119391) b!143001))

(declare-fun m!219587 () Bool)

(assert (=> b!143001 m!219587))

(assert (=> b!143001 m!219217))

(assert (=> b!143001 m!219219))

(declare-fun m!219589 () Bool)

(assert (=> b!143000 m!219589))

(declare-fun m!219591 () Bool)

(assert (=> d!45824 m!219591))

(declare-fun m!219593 () Bool)

(assert (=> d!45824 m!219593))

(assert (=> d!45824 m!219455))

(declare-fun m!219595 () Bool)

(assert (=> d!45824 m!219595))

(declare-fun m!219597 () Bool)

(assert (=> d!45824 m!219597))

(declare-fun m!219599 () Bool)

(assert (=> d!45824 m!219599))

(assert (=> d!45824 m!219227))

(declare-fun m!219601 () Bool)

(assert (=> d!45824 m!219601))

(assert (=> d!45824 m!219457))

(assert (=> d!45824 m!219415))

(assert (=> d!45824 m!219417))

(declare-fun m!219603 () Bool)

(assert (=> b!143003 m!219603))

(assert (=> b!142999 m!219219))

(declare-fun m!219605 () Bool)

(assert (=> b!142999 m!219605))

(declare-fun m!219607 () Bool)

(assert (=> b!142999 m!219607))

(assert (=> b!142824 d!45824))

(declare-fun d!45826 () Bool)

(assert (=> d!45826 (= (invariant!0 (currentBit!6258 thiss!1634) (currentByte!6263 thiss!1634) (size!2958 (buf!3385 thiss!1634))) (and (bvsge (currentBit!6258 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6258 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6263 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6263 thiss!1634) (size!2958 (buf!3385 thiss!1634))) (and (= (currentBit!6258 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6263 thiss!1634) (size!2958 (buf!3385 thiss!1634)))))))))

(assert (=> b!142823 d!45826))

(declare-fun d!45828 () Bool)

(declare-fun res!119396 () Bool)

(declare-fun e!95238 () Bool)

(assert (=> d!45828 (=> (not res!119396) (not e!95238))))

(assert (=> d!45828 (= res!119396 (= (size!2958 (buf!3385 thiss!1634)) (size!2958 (buf!3385 (_2!6685 lt!221376)))))))

(assert (=> d!45828 (= (isPrefixOf!0 thiss!1634 (_2!6685 lt!221376)) e!95238)))

(declare-fun b!143004 () Bool)

(declare-fun res!119394 () Bool)

(assert (=> b!143004 (=> (not res!119394) (not e!95238))))

(assert (=> b!143004 (= res!119394 (bvsle (bitIndex!0 (size!2958 (buf!3385 thiss!1634)) (currentByte!6263 thiss!1634) (currentBit!6258 thiss!1634)) (bitIndex!0 (size!2958 (buf!3385 (_2!6685 lt!221376))) (currentByte!6263 (_2!6685 lt!221376)) (currentBit!6258 (_2!6685 lt!221376)))))))

(declare-fun b!143005 () Bool)

(declare-fun e!95239 () Bool)

(assert (=> b!143005 (= e!95238 e!95239)))

(declare-fun res!119395 () Bool)

(assert (=> b!143005 (=> res!119395 e!95239)))

(assert (=> b!143005 (= res!119395 (= (size!2958 (buf!3385 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!143006 () Bool)

(assert (=> b!143006 (= e!95239 (arrayBitRangesEq!0 (buf!3385 thiss!1634) (buf!3385 (_2!6685 lt!221376)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2958 (buf!3385 thiss!1634)) (currentByte!6263 thiss!1634) (currentBit!6258 thiss!1634))))))

(assert (= (and d!45828 res!119396) b!143004))

(assert (= (and b!143004 res!119394) b!143005))

(assert (= (and b!143005 (not res!119395)) b!143006))

(assert (=> b!143004 m!219219))

(assert (=> b!143004 m!219217))

(assert (=> b!143006 m!219219))

(assert (=> b!143006 m!219219))

(declare-fun m!219609 () Bool)

(assert (=> b!143006 m!219609))

(assert (=> b!142822 d!45828))

(declare-fun d!45830 () Bool)

(assert (=> d!45830 (= (invariant!0 (currentBit!6258 thiss!1634) (currentByte!6263 thiss!1634) (size!2958 (buf!3385 (_2!6685 lt!221376)))) (and (bvsge (currentBit!6258 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6258 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6263 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6263 thiss!1634) (size!2958 (buf!3385 (_2!6685 lt!221376)))) (and (= (currentBit!6258 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6263 thiss!1634) (size!2958 (buf!3385 (_2!6685 lt!221376))))))))))

(assert (=> b!142821 d!45830))

(declare-fun d!45832 () Bool)

(assert (=> d!45832 (= (array_inv!2747 arr!237) (bvsge (size!2958 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!27712 d!45832))

(declare-fun d!45834 () Bool)

(assert (=> d!45834 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6258 thiss!1634) (currentByte!6263 thiss!1634) (size!2958 (buf!3385 thiss!1634))))))

(declare-fun bs!11243 () Bool)

(assert (= bs!11243 d!45834))

(assert (=> bs!11243 m!219235))

(assert (=> start!27712 d!45834))

(declare-fun d!45836 () Bool)

(declare-fun res!119399 () Bool)

(declare-fun e!95240 () Bool)

(assert (=> d!45836 (=> (not res!119399) (not e!95240))))

(assert (=> d!45836 (= res!119399 (= (size!2958 (buf!3385 (_2!6685 lt!221376))) (size!2958 (buf!3385 (_2!6685 lt!221371)))))))

(assert (=> d!45836 (= (isPrefixOf!0 (_2!6685 lt!221376) (_2!6685 lt!221371)) e!95240)))

(declare-fun b!143007 () Bool)

(declare-fun res!119397 () Bool)

(assert (=> b!143007 (=> (not res!119397) (not e!95240))))

(assert (=> b!143007 (= res!119397 (bvsle (bitIndex!0 (size!2958 (buf!3385 (_2!6685 lt!221376))) (currentByte!6263 (_2!6685 lt!221376)) (currentBit!6258 (_2!6685 lt!221376))) (bitIndex!0 (size!2958 (buf!3385 (_2!6685 lt!221371))) (currentByte!6263 (_2!6685 lt!221371)) (currentBit!6258 (_2!6685 lt!221371)))))))

(declare-fun b!143008 () Bool)

(declare-fun e!95241 () Bool)

(assert (=> b!143008 (= e!95240 e!95241)))

(declare-fun res!119398 () Bool)

(assert (=> b!143008 (=> res!119398 e!95241)))

(assert (=> b!143008 (= res!119398 (= (size!2958 (buf!3385 (_2!6685 lt!221376))) #b00000000000000000000000000000000))))

(declare-fun b!143009 () Bool)

(assert (=> b!143009 (= e!95241 (arrayBitRangesEq!0 (buf!3385 (_2!6685 lt!221376)) (buf!3385 (_2!6685 lt!221371)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2958 (buf!3385 (_2!6685 lt!221376))) (currentByte!6263 (_2!6685 lt!221376)) (currentBit!6258 (_2!6685 lt!221376)))))))

(assert (= (and d!45836 res!119399) b!143007))

(assert (= (and b!143007 res!119397) b!143008))

(assert (= (and b!143008 (not res!119398)) b!143009))

(assert (=> b!143007 m!219217))

(assert (=> b!143007 m!219229))

(assert (=> b!143009 m!219217))

(assert (=> b!143009 m!219217))

(declare-fun m!219611 () Bool)

(assert (=> b!143009 m!219611))

(assert (=> b!142820 d!45836))

(push 1)

