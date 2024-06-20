; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28546 () Bool)

(assert start!28546)

(declare-fun b!147916 () Bool)

(declare-fun res!123802 () Bool)

(declare-fun e!98673 () Bool)

(assert (=> b!147916 (=> (not res!123802) (not e!98673))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!147916 (= res!123802 (bvslt from!447 to!404))))

(declare-fun b!147918 () Bool)

(declare-fun e!98672 () Bool)

(declare-datatypes ((array!6663 0))(
  ( (array!6664 (arr!3784 (Array (_ BitVec 32) (_ BitVec 8))) (size!3015 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5288 0))(
  ( (BitStream!5289 (buf!3480 array!6663) (currentByte!6388 (_ BitVec 32)) (currentBit!6383 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5288)

(declare-datatypes ((Unit!9318 0))(
  ( (Unit!9319) )
))
(declare-datatypes ((tuple2!13188 0))(
  ( (tuple2!13189 (_1!6953 Unit!9318) (_2!6953 BitStream!5288)) )
))
(declare-fun lt!230272 () tuple2!13188)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!147918 (= e!98672 (invariant!0 (currentBit!6383 thiss!1634) (currentByte!6388 thiss!1634) (size!3015 (buf!3480 (_2!6953 lt!230272)))))))

(declare-fun b!147919 () Bool)

(declare-fun res!123813 () Bool)

(declare-fun e!98679 () Bool)

(assert (=> b!147919 (=> (not res!123813) (not e!98679))))

(declare-fun lt!230274 () tuple2!13188)

(declare-fun isPrefixOf!0 (BitStream!5288 BitStream!5288) Bool)

(assert (=> b!147919 (= res!123813 (isPrefixOf!0 (_2!6953 lt!230272) (_2!6953 lt!230274)))))

(declare-fun b!147920 () Bool)

(declare-fun res!123808 () Bool)

(assert (=> b!147920 (=> (not res!123808) (not e!98673))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!147920 (= res!123808 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3015 (buf!3480 thiss!1634))) ((_ sign_extend 32) (currentByte!6388 thiss!1634)) ((_ sign_extend 32) (currentBit!6383 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!147921 () Bool)

(declare-fun e!98676 () Bool)

(declare-fun array_inv!2804 (array!6663) Bool)

(assert (=> b!147921 (= e!98676 (array_inv!2804 (buf!3480 thiss!1634)))))

(declare-fun b!147922 () Bool)

(declare-datatypes ((tuple2!13190 0))(
  ( (tuple2!13191 (_1!6954 BitStream!5288) (_2!6954 array!6663)) )
))
(declare-fun lt!230261 () tuple2!13190)

(declare-fun arr!237 () array!6663)

(declare-fun e!98675 () Bool)

(declare-fun arrayRangesEq!331 (array!6663 array!6663 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!147922 (= e!98675 (not (arrayRangesEq!331 arr!237 (_2!6954 lt!230261) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!147923 () Bool)

(declare-fun res!123812 () Bool)

(assert (=> b!147923 (=> (not res!123812) (not e!98673))))

(assert (=> b!147923 (= res!123812 (invariant!0 (currentBit!6383 thiss!1634) (currentByte!6388 thiss!1634) (size!3015 (buf!3480 thiss!1634))))))

(declare-fun b!147924 () Bool)

(assert (=> b!147924 (= e!98679 (not e!98675))))

(declare-fun res!123803 () Bool)

(assert (=> b!147924 (=> res!123803 e!98675)))

(declare-datatypes ((tuple2!13192 0))(
  ( (tuple2!13193 (_1!6955 BitStream!5288) (_2!6955 BitStream!5288)) )
))
(declare-fun lt!230270 () tuple2!13192)

(assert (=> b!147924 (= res!123803 (or (not (= (size!3015 (_2!6954 lt!230261)) (size!3015 arr!237))) (not (= (_1!6954 lt!230261) (_2!6955 lt!230270)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5288 array!6663 (_ BitVec 32) (_ BitVec 32)) tuple2!13190)

(assert (=> b!147924 (= lt!230261 (readByteArrayLoopPure!0 (_1!6955 lt!230270) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!230273 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!147924 (validate_offset_bits!1 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230274)))) ((_ sign_extend 32) (currentByte!6388 (_2!6953 lt!230272))) ((_ sign_extend 32) (currentBit!6383 (_2!6953 lt!230272))) lt!230273)))

(declare-fun lt!230263 () Unit!9318)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5288 array!6663 (_ BitVec 64)) Unit!9318)

(assert (=> b!147924 (= lt!230263 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6953 lt!230272) (buf!3480 (_2!6953 lt!230274)) lt!230273))))

(declare-fun reader!0 (BitStream!5288 BitStream!5288) tuple2!13192)

(assert (=> b!147924 (= lt!230270 (reader!0 (_2!6953 lt!230272) (_2!6953 lt!230274)))))

(declare-fun b!147925 () Bool)

(declare-fun e!98681 () Bool)

(assert (=> b!147925 (= e!98681 e!98679)))

(declare-fun res!123806 () Bool)

(assert (=> b!147925 (=> (not res!123806) (not e!98679))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!147925 (= res!123806 (= (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230274))) (currentByte!6388 (_2!6953 lt!230274)) (currentBit!6383 (_2!6953 lt!230274))) (bvadd (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230272))) (currentByte!6388 (_2!6953 lt!230272)) (currentBit!6383 (_2!6953 lt!230272))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!230273))))))

(assert (=> b!147925 (= lt!230273 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!147926 () Bool)

(declare-fun res!123809 () Bool)

(declare-fun e!98682 () Bool)

(assert (=> b!147926 (=> (not res!123809) (not e!98682))))

(assert (=> b!147926 (= res!123809 (isPrefixOf!0 thiss!1634 (_2!6953 lt!230272)))))

(declare-fun b!147917 () Bool)

(declare-fun e!98678 () Bool)

(declare-fun lt!230269 () tuple2!13190)

(declare-fun lt!230260 () tuple2!13190)

(assert (=> b!147917 (= e!98678 (or (bvsgt #b00000000000000000000000000000000 to!404) (and (bvsle (size!3015 arr!237) (size!3015 (_2!6954 lt!230260))) (bvsle (size!3015 (_2!6954 lt!230260)) (size!3015 (_2!6954 lt!230269))))))))

(assert (=> b!147917 (arrayRangesEq!331 (_2!6954 lt!230260) (_2!6954 lt!230269) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!230279 () Unit!9318)

(declare-fun arrayRangesEqSymmetricLemma!63 (array!6663 array!6663 (_ BitVec 32) (_ BitVec 32)) Unit!9318)

(assert (=> b!147917 (= lt!230279 (arrayRangesEqSymmetricLemma!63 (_2!6954 lt!230269) (_2!6954 lt!230260) #b00000000000000000000000000000000 to!404))))

(declare-fun res!123815 () Bool)

(assert (=> start!28546 (=> (not res!123815) (not e!98673))))

(assert (=> start!28546 (= res!123815 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3015 arr!237))))))

(assert (=> start!28546 e!98673))

(assert (=> start!28546 true))

(assert (=> start!28546 (array_inv!2804 arr!237)))

(declare-fun inv!12 (BitStream!5288) Bool)

(assert (=> start!28546 (and (inv!12 thiss!1634) e!98676)))

(declare-fun b!147927 () Bool)

(declare-fun e!98680 () Bool)

(declare-datatypes ((tuple2!13194 0))(
  ( (tuple2!13195 (_1!6956 BitStream!5288) (_2!6956 (_ BitVec 8))) )
))
(declare-fun lt!230258 () tuple2!13194)

(declare-fun lt!230256 () tuple2!13194)

(assert (=> b!147927 (= e!98680 (= (_2!6956 lt!230258) (_2!6956 lt!230256)))))

(declare-fun b!147928 () Bool)

(declare-fun res!123804 () Bool)

(assert (=> b!147928 (=> (not res!123804) (not e!98682))))

(assert (=> b!147928 (= res!123804 (= (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230272))) (currentByte!6388 (_2!6953 lt!230272)) (currentBit!6383 (_2!6953 lt!230272))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3015 (buf!3480 thiss!1634)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634)))))))

(declare-fun lt!230264 () tuple2!13192)

(declare-fun lt!230267 () tuple2!13194)

(declare-fun b!147929 () Bool)

(assert (=> b!147929 (= e!98682 (and (= (_2!6956 lt!230267) (select (arr!3784 arr!237) from!447)) (= (_1!6956 lt!230267) (_2!6955 lt!230264))))))

(declare-fun readBytePure!0 (BitStream!5288) tuple2!13194)

(assert (=> b!147929 (= lt!230267 (readBytePure!0 (_1!6955 lt!230264)))))

(assert (=> b!147929 (= lt!230264 (reader!0 thiss!1634 (_2!6953 lt!230272)))))

(declare-fun b!147930 () Bool)

(assert (=> b!147930 (= e!98673 (not e!98678))))

(declare-fun res!123807 () Bool)

(assert (=> b!147930 (=> res!123807 e!98678)))

(assert (=> b!147930 (= res!123807 (not (arrayRangesEq!331 (_2!6954 lt!230269) (_2!6954 lt!230260) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!230268 () tuple2!13190)

(assert (=> b!147930 (arrayRangesEq!331 (_2!6954 lt!230269) (_2!6954 lt!230268) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!230265 () Unit!9318)

(declare-fun lt!230255 () tuple2!13192)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5288 array!6663 (_ BitVec 32) (_ BitVec 32)) Unit!9318)

(assert (=> b!147930 (= lt!230265 (readByteArrayLoopArrayPrefixLemma!0 (_1!6955 lt!230255) arr!237 from!447 to!404))))

(declare-fun lt!230262 () array!6663)

(declare-fun withMovedByteIndex!0 (BitStream!5288 (_ BitVec 32)) BitStream!5288)

(assert (=> b!147930 (= lt!230268 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6955 lt!230255) #b00000000000000000000000000000001) lt!230262 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!230278 () tuple2!13192)

(assert (=> b!147930 (= lt!230260 (readByteArrayLoopPure!0 (_1!6955 lt!230278) lt!230262 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!230254 () tuple2!13194)

(assert (=> b!147930 (= lt!230262 (array!6664 (store (arr!3784 arr!237) from!447 (_2!6956 lt!230254)) (size!3015 arr!237)))))

(declare-fun lt!230257 () (_ BitVec 32))

(assert (=> b!147930 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230274)))) ((_ sign_extend 32) (currentByte!6388 (_2!6953 lt!230272))) ((_ sign_extend 32) (currentBit!6383 (_2!6953 lt!230272))) lt!230257)))

(declare-fun lt!230259 () Unit!9318)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5288 array!6663 (_ BitVec 32)) Unit!9318)

(assert (=> b!147930 (= lt!230259 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6953 lt!230272) (buf!3480 (_2!6953 lt!230274)) lt!230257))))

(assert (=> b!147930 (= (_1!6954 lt!230269) (_2!6955 lt!230255))))

(assert (=> b!147930 (= lt!230269 (readByteArrayLoopPure!0 (_1!6955 lt!230255) arr!237 from!447 to!404))))

(assert (=> b!147930 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230274)))) ((_ sign_extend 32) (currentByte!6388 thiss!1634)) ((_ sign_extend 32) (currentBit!6383 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!230275 () Unit!9318)

(assert (=> b!147930 (= lt!230275 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3480 (_2!6953 lt!230274)) (bvsub to!404 from!447)))))

(assert (=> b!147930 (= (_2!6956 lt!230254) (select (arr!3784 arr!237) from!447))))

(assert (=> b!147930 (= lt!230254 (readBytePure!0 (_1!6955 lt!230255)))))

(assert (=> b!147930 (= lt!230278 (reader!0 (_2!6953 lt!230272) (_2!6953 lt!230274)))))

(assert (=> b!147930 (= lt!230255 (reader!0 thiss!1634 (_2!6953 lt!230274)))))

(assert (=> b!147930 e!98680))

(declare-fun res!123805 () Bool)

(assert (=> b!147930 (=> (not res!123805) (not e!98680))))

(assert (=> b!147930 (= res!123805 (= (bitIndex!0 (size!3015 (buf!3480 (_1!6956 lt!230258))) (currentByte!6388 (_1!6956 lt!230258)) (currentBit!6383 (_1!6956 lt!230258))) (bitIndex!0 (size!3015 (buf!3480 (_1!6956 lt!230256))) (currentByte!6388 (_1!6956 lt!230256)) (currentBit!6383 (_1!6956 lt!230256)))))))

(declare-fun lt!230271 () Unit!9318)

(declare-fun lt!230276 () BitStream!5288)

(declare-fun readBytePrefixLemma!0 (BitStream!5288 BitStream!5288) Unit!9318)

(assert (=> b!147930 (= lt!230271 (readBytePrefixLemma!0 lt!230276 (_2!6953 lt!230274)))))

(assert (=> b!147930 (= lt!230256 (readBytePure!0 (BitStream!5289 (buf!3480 (_2!6953 lt!230274)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634))))))

(assert (=> b!147930 (= lt!230258 (readBytePure!0 lt!230276))))

(assert (=> b!147930 (= lt!230276 (BitStream!5289 (buf!3480 (_2!6953 lt!230272)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634)))))

(assert (=> b!147930 e!98672))

(declare-fun res!123814 () Bool)

(assert (=> b!147930 (=> (not res!123814) (not e!98672))))

(assert (=> b!147930 (= res!123814 (isPrefixOf!0 thiss!1634 (_2!6953 lt!230274)))))

(declare-fun lt!230277 () Unit!9318)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5288 BitStream!5288 BitStream!5288) Unit!9318)

(assert (=> b!147930 (= lt!230277 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6953 lt!230272) (_2!6953 lt!230274)))))

(assert (=> b!147930 e!98681))

(declare-fun res!123811 () Bool)

(assert (=> b!147930 (=> (not res!123811) (not e!98681))))

(assert (=> b!147930 (= res!123811 (= (size!3015 (buf!3480 (_2!6953 lt!230272))) (size!3015 (buf!3480 (_2!6953 lt!230274)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5288 array!6663 (_ BitVec 32) (_ BitVec 32)) tuple2!13188)

(assert (=> b!147930 (= lt!230274 (appendByteArrayLoop!0 (_2!6953 lt!230272) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!147930 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230272)))) ((_ sign_extend 32) (currentByte!6388 (_2!6953 lt!230272))) ((_ sign_extend 32) (currentBit!6383 (_2!6953 lt!230272))) lt!230257)))

(assert (=> b!147930 (= lt!230257 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!230266 () Unit!9318)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5288 BitStream!5288 (_ BitVec 64) (_ BitVec 32)) Unit!9318)

(assert (=> b!147930 (= lt!230266 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6953 lt!230272) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!147930 e!98682))

(declare-fun res!123810 () Bool)

(assert (=> b!147930 (=> (not res!123810) (not e!98682))))

(assert (=> b!147930 (= res!123810 (= (size!3015 (buf!3480 thiss!1634)) (size!3015 (buf!3480 (_2!6953 lt!230272)))))))

(declare-fun appendByte!0 (BitStream!5288 (_ BitVec 8)) tuple2!13188)

(assert (=> b!147930 (= lt!230272 (appendByte!0 thiss!1634 (select (arr!3784 arr!237) from!447)))))

(assert (= (and start!28546 res!123815) b!147920))

(assert (= (and b!147920 res!123808) b!147916))

(assert (= (and b!147916 res!123802) b!147923))

(assert (= (and b!147923 res!123812) b!147930))

(assert (= (and b!147930 res!123810) b!147928))

(assert (= (and b!147928 res!123804) b!147926))

(assert (= (and b!147926 res!123809) b!147929))

(assert (= (and b!147930 res!123811) b!147925))

(assert (= (and b!147925 res!123806) b!147919))

(assert (= (and b!147919 res!123813) b!147924))

(assert (= (and b!147924 (not res!123803)) b!147922))

(assert (= (and b!147930 res!123814) b!147918))

(assert (= (and b!147930 res!123805) b!147927))

(assert (= (and b!147930 (not res!123807)) b!147917))

(assert (= start!28546 b!147921))

(declare-fun m!229195 () Bool)

(assert (=> b!147918 m!229195))

(declare-fun m!229197 () Bool)

(assert (=> b!147926 m!229197))

(declare-fun m!229199 () Bool)

(assert (=> b!147917 m!229199))

(declare-fun m!229201 () Bool)

(assert (=> b!147917 m!229201))

(declare-fun m!229203 () Bool)

(assert (=> b!147923 m!229203))

(declare-fun m!229205 () Bool)

(assert (=> b!147928 m!229205))

(declare-fun m!229207 () Bool)

(assert (=> b!147928 m!229207))

(declare-fun m!229209 () Bool)

(assert (=> start!28546 m!229209))

(declare-fun m!229211 () Bool)

(assert (=> start!28546 m!229211))

(declare-fun m!229213 () Bool)

(assert (=> b!147921 m!229213))

(declare-fun m!229215 () Bool)

(assert (=> b!147922 m!229215))

(declare-fun m!229217 () Bool)

(assert (=> b!147920 m!229217))

(declare-fun m!229219 () Bool)

(assert (=> b!147930 m!229219))

(declare-fun m!229221 () Bool)

(assert (=> b!147930 m!229221))

(declare-fun m!229223 () Bool)

(assert (=> b!147930 m!229223))

(declare-fun m!229225 () Bool)

(assert (=> b!147930 m!229225))

(declare-fun m!229227 () Bool)

(assert (=> b!147930 m!229227))

(declare-fun m!229229 () Bool)

(assert (=> b!147930 m!229229))

(declare-fun m!229231 () Bool)

(assert (=> b!147930 m!229231))

(declare-fun m!229233 () Bool)

(assert (=> b!147930 m!229233))

(declare-fun m!229235 () Bool)

(assert (=> b!147930 m!229235))

(declare-fun m!229237 () Bool)

(assert (=> b!147930 m!229237))

(declare-fun m!229239 () Bool)

(assert (=> b!147930 m!229239))

(assert (=> b!147930 m!229237))

(declare-fun m!229241 () Bool)

(assert (=> b!147930 m!229241))

(declare-fun m!229243 () Bool)

(assert (=> b!147930 m!229243))

(declare-fun m!229245 () Bool)

(assert (=> b!147930 m!229245))

(declare-fun m!229247 () Bool)

(assert (=> b!147930 m!229247))

(declare-fun m!229249 () Bool)

(assert (=> b!147930 m!229249))

(declare-fun m!229251 () Bool)

(assert (=> b!147930 m!229251))

(declare-fun m!229253 () Bool)

(assert (=> b!147930 m!229253))

(declare-fun m!229255 () Bool)

(assert (=> b!147930 m!229255))

(declare-fun m!229257 () Bool)

(assert (=> b!147930 m!229257))

(declare-fun m!229259 () Bool)

(assert (=> b!147930 m!229259))

(declare-fun m!229261 () Bool)

(assert (=> b!147930 m!229261))

(declare-fun m!229263 () Bool)

(assert (=> b!147930 m!229263))

(declare-fun m!229265 () Bool)

(assert (=> b!147930 m!229265))

(assert (=> b!147930 m!229247))

(declare-fun m!229267 () Bool)

(assert (=> b!147930 m!229267))

(declare-fun m!229269 () Bool)

(assert (=> b!147930 m!229269))

(declare-fun m!229271 () Bool)

(assert (=> b!147930 m!229271))

(declare-fun m!229273 () Bool)

(assert (=> b!147925 m!229273))

(assert (=> b!147925 m!229205))

(declare-fun m!229275 () Bool)

(assert (=> b!147919 m!229275))

(declare-fun m!229277 () Bool)

(assert (=> b!147924 m!229277))

(declare-fun m!229279 () Bool)

(assert (=> b!147924 m!229279))

(declare-fun m!229281 () Bool)

(assert (=> b!147924 m!229281))

(assert (=> b!147924 m!229255))

(assert (=> b!147929 m!229237))

(declare-fun m!229283 () Bool)

(assert (=> b!147929 m!229283))

(declare-fun m!229285 () Bool)

(assert (=> b!147929 m!229285))

(push 1)

(assert (not b!147929))

(assert (not b!147928))

(assert (not b!147920))

(assert (not b!147921))

(assert (not b!147922))

(assert (not b!147924))

(assert (not b!147919))

(assert (not start!28546))

(assert (not b!147930))

(assert (not b!147923))

(assert (not b!147925))

(assert (not b!147926))

(assert (not b!147918))

(assert (not b!147917))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!47904 () Bool)

(assert (=> d!47904 (= (array_inv!2804 (buf!3480 thiss!1634)) (bvsge (size!3015 (buf!3480 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!147921 d!47904))

(declare-fun d!47906 () Bool)

(declare-fun res!123820 () Bool)

(declare-fun e!98687 () Bool)

(assert (=> d!47906 (=> res!123820 e!98687)))

(assert (=> d!47906 (= res!123820 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!47906 (= (arrayRangesEq!331 arr!237 (_2!6954 lt!230261) #b00000000000000000000000000000000 to!404) e!98687)))

(declare-fun b!147935 () Bool)

(declare-fun e!98688 () Bool)

(assert (=> b!147935 (= e!98687 e!98688)))

(declare-fun res!123821 () Bool)

(assert (=> b!147935 (=> (not res!123821) (not e!98688))))

(assert (=> b!147935 (= res!123821 (= (select (arr!3784 arr!237) #b00000000000000000000000000000000) (select (arr!3784 (_2!6954 lt!230261)) #b00000000000000000000000000000000)))))

(declare-fun b!147936 () Bool)

(assert (=> b!147936 (= e!98688 (arrayRangesEq!331 arr!237 (_2!6954 lt!230261) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!47906 (not res!123820)) b!147935))

(assert (= (and b!147935 res!123821) b!147936))

(declare-fun m!229287 () Bool)

(assert (=> b!147935 m!229287))

(declare-fun m!229289 () Bool)

(assert (=> b!147935 m!229289))

(declare-fun m!229291 () Bool)

(assert (=> b!147936 m!229291))

(assert (=> b!147922 d!47906))

(declare-fun d!47908 () Bool)

(assert (=> d!47908 (= (invariant!0 (currentBit!6383 thiss!1634) (currentByte!6388 thiss!1634) (size!3015 (buf!3480 thiss!1634))) (and (bvsge (currentBit!6383 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6383 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6388 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6388 thiss!1634) (size!3015 (buf!3480 thiss!1634))) (and (= (currentBit!6383 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6388 thiss!1634) (size!3015 (buf!3480 thiss!1634)))))))))

(assert (=> b!147923 d!47908))

(declare-fun d!47910 () Bool)

(assert (=> d!47910 (= (array_inv!2804 arr!237) (bvsge (size!3015 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!28546 d!47910))

(declare-fun d!47912 () Bool)

(assert (=> d!47912 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6383 thiss!1634) (currentByte!6388 thiss!1634) (size!3015 (buf!3480 thiss!1634))))))

(declare-fun bs!11707 () Bool)

(assert (= bs!11707 d!47912))

(assert (=> bs!11707 m!229203))

(assert (=> start!28546 d!47912))

(declare-fun d!47914 () Bool)

(assert (=> d!47914 (= (invariant!0 (currentBit!6383 thiss!1634) (currentByte!6388 thiss!1634) (size!3015 (buf!3480 (_2!6953 lt!230272)))) (and (bvsge (currentBit!6383 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6383 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6388 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6388 thiss!1634) (size!3015 (buf!3480 (_2!6953 lt!230272)))) (and (= (currentBit!6383 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6388 thiss!1634) (size!3015 (buf!3480 (_2!6953 lt!230272))))))))))

(assert (=> b!147918 d!47914))

(declare-fun d!47916 () Bool)

(declare-datatypes ((tuple2!13196 0))(
  ( (tuple2!13197 (_1!6957 (_ BitVec 8)) (_2!6957 BitStream!5288)) )
))
(declare-fun lt!230282 () tuple2!13196)

(declare-fun readByte!0 (BitStream!5288) tuple2!13196)

(assert (=> d!47916 (= lt!230282 (readByte!0 (_1!6955 lt!230264)))))

(assert (=> d!47916 (= (readBytePure!0 (_1!6955 lt!230264)) (tuple2!13195 (_2!6957 lt!230282) (_1!6957 lt!230282)))))

(declare-fun bs!11708 () Bool)

(assert (= bs!11708 d!47916))

(declare-fun m!229293 () Bool)

(assert (=> bs!11708 m!229293))

(assert (=> b!147929 d!47916))

(declare-fun d!47918 () Bool)

(declare-fun e!98694 () Bool)

(assert (=> d!47918 e!98694))

(declare-fun res!123828 () Bool)

(assert (=> d!47918 (=> (not res!123828) (not e!98694))))

(declare-fun lt!230335 () tuple2!13192)

(assert (=> d!47918 (= res!123828 (isPrefixOf!0 (_1!6955 lt!230335) (_2!6955 lt!230335)))))

(declare-fun lt!230333 () BitStream!5288)

(assert (=> d!47918 (= lt!230335 (tuple2!13193 lt!230333 (_2!6953 lt!230272)))))

(declare-fun lt!230327 () Unit!9318)

(declare-fun lt!230329 () Unit!9318)

(assert (=> d!47918 (= lt!230327 lt!230329)))

(assert (=> d!47918 (isPrefixOf!0 lt!230333 (_2!6953 lt!230272))))

(assert (=> d!47918 (= lt!230329 (lemmaIsPrefixTransitive!0 lt!230333 (_2!6953 lt!230272) (_2!6953 lt!230272)))))

(declare-fun lt!230323 () Unit!9318)

(declare-fun lt!230331 () Unit!9318)

(assert (=> d!47918 (= lt!230323 lt!230331)))

(assert (=> d!47918 (isPrefixOf!0 lt!230333 (_2!6953 lt!230272))))

(assert (=> d!47918 (= lt!230331 (lemmaIsPrefixTransitive!0 lt!230333 thiss!1634 (_2!6953 lt!230272)))))

(declare-fun lt!230338 () Unit!9318)

(declare-fun e!98693 () Unit!9318)

(assert (=> d!47918 (= lt!230338 e!98693)))

(declare-fun c!7997 () Bool)

(assert (=> d!47918 (= c!7997 (not (= (size!3015 (buf!3480 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!230328 () Unit!9318)

(declare-fun lt!230334 () Unit!9318)

(assert (=> d!47918 (= lt!230328 lt!230334)))

(assert (=> d!47918 (isPrefixOf!0 (_2!6953 lt!230272) (_2!6953 lt!230272))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5288) Unit!9318)

(assert (=> d!47918 (= lt!230334 (lemmaIsPrefixRefl!0 (_2!6953 lt!230272)))))

(declare-fun lt!230332 () Unit!9318)

(declare-fun lt!230340 () Unit!9318)

(assert (=> d!47918 (= lt!230332 lt!230340)))

(assert (=> d!47918 (= lt!230340 (lemmaIsPrefixRefl!0 (_2!6953 lt!230272)))))

(declare-fun lt!230342 () Unit!9318)

(declare-fun lt!230325 () Unit!9318)

(assert (=> d!47918 (= lt!230342 lt!230325)))

(assert (=> d!47918 (isPrefixOf!0 lt!230333 lt!230333)))

(assert (=> d!47918 (= lt!230325 (lemmaIsPrefixRefl!0 lt!230333))))

(declare-fun lt!230341 () Unit!9318)

(declare-fun lt!230336 () Unit!9318)

(assert (=> d!47918 (= lt!230341 lt!230336)))

(assert (=> d!47918 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!47918 (= lt!230336 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!47918 (= lt!230333 (BitStream!5289 (buf!3480 (_2!6953 lt!230272)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634)))))

(assert (=> d!47918 (isPrefixOf!0 thiss!1634 (_2!6953 lt!230272))))

(assert (=> d!47918 (= (reader!0 thiss!1634 (_2!6953 lt!230272)) lt!230335)))

(declare-fun lt!230330 () (_ BitVec 64))

(declare-fun lt!230339 () (_ BitVec 64))

(declare-fun b!147947 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!5288 (_ BitVec 64)) BitStream!5288)

(assert (=> b!147947 (= e!98694 (= (_1!6955 lt!230335) (withMovedBitIndex!0 (_2!6955 lt!230335) (bvsub lt!230339 lt!230330))))))

(assert (=> b!147947 (or (= (bvand lt!230339 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!230330 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!230339 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!230339 lt!230330) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!147947 (= lt!230330 (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230272))) (currentByte!6388 (_2!6953 lt!230272)) (currentBit!6383 (_2!6953 lt!230272))))))

(assert (=> b!147947 (= lt!230339 (bitIndex!0 (size!3015 (buf!3480 thiss!1634)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634)))))

(declare-fun b!147948 () Bool)

(declare-fun res!123829 () Bool)

(assert (=> b!147948 (=> (not res!123829) (not e!98694))))

(assert (=> b!147948 (= res!123829 (isPrefixOf!0 (_1!6955 lt!230335) thiss!1634))))

(declare-fun b!147949 () Bool)

(declare-fun Unit!9320 () Unit!9318)

(assert (=> b!147949 (= e!98693 Unit!9320)))

(declare-fun b!147950 () Bool)

(declare-fun lt!230326 () Unit!9318)

(assert (=> b!147950 (= e!98693 lt!230326)))

(declare-fun lt!230337 () (_ BitVec 64))

(assert (=> b!147950 (= lt!230337 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!230324 () (_ BitVec 64))

(assert (=> b!147950 (= lt!230324 (bitIndex!0 (size!3015 (buf!3480 thiss!1634)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6663 array!6663 (_ BitVec 64) (_ BitVec 64)) Unit!9318)

(assert (=> b!147950 (= lt!230326 (arrayBitRangesEqSymmetric!0 (buf!3480 thiss!1634) (buf!3480 (_2!6953 lt!230272)) lt!230337 lt!230324))))

(declare-fun arrayBitRangesEq!0 (array!6663 array!6663 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!147950 (arrayBitRangesEq!0 (buf!3480 (_2!6953 lt!230272)) (buf!3480 thiss!1634) lt!230337 lt!230324)))

(declare-fun b!147951 () Bool)

(declare-fun res!123830 () Bool)

(assert (=> b!147951 (=> (not res!123830) (not e!98694))))

(assert (=> b!147951 (= res!123830 (isPrefixOf!0 (_2!6955 lt!230335) (_2!6953 lt!230272)))))

(assert (= (and d!47918 c!7997) b!147950))

(assert (= (and d!47918 (not c!7997)) b!147949))

(assert (= (and d!47918 res!123828) b!147948))

(assert (= (and b!147948 res!123829) b!147951))

(assert (= (and b!147951 res!123830) b!147947))

(declare-fun m!229295 () Bool)

(assert (=> b!147948 m!229295))

(assert (=> b!147950 m!229207))

(declare-fun m!229297 () Bool)

(assert (=> b!147950 m!229297))

(declare-fun m!229299 () Bool)

(assert (=> b!147950 m!229299))

(declare-fun m!229301 () Bool)

(assert (=> b!147947 m!229301))

(assert (=> b!147947 m!229205))

(assert (=> b!147947 m!229207))

(declare-fun m!229303 () Bool)

(assert (=> d!47918 m!229303))

(declare-fun m!229305 () Bool)

(assert (=> d!47918 m!229305))

(declare-fun m!229307 () Bool)

(assert (=> d!47918 m!229307))

(assert (=> d!47918 m!229197))

(declare-fun m!229309 () Bool)

(assert (=> d!47918 m!229309))

(declare-fun m!229311 () Bool)

(assert (=> d!47918 m!229311))

(declare-fun m!229313 () Bool)

(assert (=> d!47918 m!229313))

(declare-fun m!229315 () Bool)

(assert (=> d!47918 m!229315))

(declare-fun m!229317 () Bool)

(assert (=> d!47918 m!229317))

(declare-fun m!229319 () Bool)

(assert (=> d!47918 m!229319))

(declare-fun m!229321 () Bool)

(assert (=> d!47918 m!229321))

(declare-fun m!229323 () Bool)

(assert (=> b!147951 m!229323))

(assert (=> b!147929 d!47918))

(declare-fun d!47920 () Bool)

(declare-fun res!123839 () Bool)

(declare-fun e!98700 () Bool)

(assert (=> d!47920 (=> (not res!123839) (not e!98700))))

(assert (=> d!47920 (= res!123839 (= (size!3015 (buf!3480 (_2!6953 lt!230272))) (size!3015 (buf!3480 (_2!6953 lt!230274)))))))

(assert (=> d!47920 (= (isPrefixOf!0 (_2!6953 lt!230272) (_2!6953 lt!230274)) e!98700)))

(declare-fun b!147958 () Bool)

(declare-fun res!123838 () Bool)

(assert (=> b!147958 (=> (not res!123838) (not e!98700))))

(assert (=> b!147958 (= res!123838 (bvsle (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230272))) (currentByte!6388 (_2!6953 lt!230272)) (currentBit!6383 (_2!6953 lt!230272))) (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230274))) (currentByte!6388 (_2!6953 lt!230274)) (currentBit!6383 (_2!6953 lt!230274)))))))

(declare-fun b!147959 () Bool)

(declare-fun e!98699 () Bool)

(assert (=> b!147959 (= e!98700 e!98699)))

(declare-fun res!123837 () Bool)

(assert (=> b!147959 (=> res!123837 e!98699)))

(assert (=> b!147959 (= res!123837 (= (size!3015 (buf!3480 (_2!6953 lt!230272))) #b00000000000000000000000000000000))))

(declare-fun b!147960 () Bool)

(assert (=> b!147960 (= e!98699 (arrayBitRangesEq!0 (buf!3480 (_2!6953 lt!230272)) (buf!3480 (_2!6953 lt!230274)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230272))) (currentByte!6388 (_2!6953 lt!230272)) (currentBit!6383 (_2!6953 lt!230272)))))))

(assert (= (and d!47920 res!123839) b!147958))

(assert (= (and b!147958 res!123838) b!147959))

(assert (= (and b!147959 (not res!123837)) b!147960))

(assert (=> b!147958 m!229205))

(assert (=> b!147958 m!229273))

(assert (=> b!147960 m!229205))

(assert (=> b!147960 m!229205))

(declare-fun m!229325 () Bool)

(assert (=> b!147960 m!229325))

(assert (=> b!147919 d!47920))

(declare-fun d!47922 () Bool)

(declare-fun lt!230351 () tuple2!13190)

(declare-fun lt!230353 () tuple2!13190)

(assert (=> d!47922 (arrayRangesEq!331 (_2!6954 lt!230351) (_2!6954 lt!230353) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!230354 () Unit!9318)

(declare-fun lt!230352 () BitStream!5288)

(declare-fun choose!35 (BitStream!5288 array!6663 (_ BitVec 32) (_ BitVec 32) tuple2!13190 array!6663 BitStream!5288 tuple2!13190 array!6663) Unit!9318)

(assert (=> d!47922 (= lt!230354 (choose!35 (_1!6955 lt!230255) arr!237 from!447 to!404 lt!230351 (_2!6954 lt!230351) lt!230352 lt!230353 (_2!6954 lt!230353)))))

(assert (=> d!47922 (= lt!230353 (readByteArrayLoopPure!0 lt!230352 (array!6664 (store (arr!3784 arr!237) from!447 (_2!6956 (readBytePure!0 (_1!6955 lt!230255)))) (size!3015 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!47922 (= lt!230352 (withMovedByteIndex!0 (_1!6955 lt!230255) #b00000000000000000000000000000001))))

(assert (=> d!47922 (= lt!230351 (readByteArrayLoopPure!0 (_1!6955 lt!230255) arr!237 from!447 to!404))))

(assert (=> d!47922 (= (readByteArrayLoopArrayPrefixLemma!0 (_1!6955 lt!230255) arr!237 from!447 to!404) lt!230354)))

(declare-fun bs!11710 () Bool)

(assert (= bs!11710 d!47922))

(declare-fun m!229327 () Bool)

(assert (=> bs!11710 m!229327))

(declare-fun m!229329 () Bool)

(assert (=> bs!11710 m!229329))

(declare-fun m!229331 () Bool)

(assert (=> bs!11710 m!229331))

(assert (=> bs!11710 m!229247))

(declare-fun m!229333 () Bool)

(assert (=> bs!11710 m!229333))

(assert (=> bs!11710 m!229259))

(assert (=> bs!11710 m!229223))

(assert (=> b!147930 d!47922))

(declare-fun d!47924 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!47924 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230274)))) ((_ sign_extend 32) (currentByte!6388 (_2!6953 lt!230272))) ((_ sign_extend 32) (currentBit!6383 (_2!6953 lt!230272))) lt!230257) (bvsle ((_ sign_extend 32) lt!230257) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230274)))) ((_ sign_extend 32) (currentByte!6388 (_2!6953 lt!230272))) ((_ sign_extend 32) (currentBit!6383 (_2!6953 lt!230272)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11711 () Bool)

(assert (= bs!11711 d!47924))

(declare-fun m!229335 () Bool)

(assert (=> bs!11711 m!229335))

(assert (=> b!147930 d!47924))

(declare-fun d!47926 () Bool)

(declare-fun e!98709 () Bool)

(assert (=> d!47926 e!98709))

(declare-fun res!123851 () Bool)

(assert (=> d!47926 (=> (not res!123851) (not e!98709))))

(declare-fun lt!230369 () (_ BitVec 64))

(declare-fun lt!230370 () (_ BitVec 64))

(declare-fun lt!230372 () (_ BitVec 64))

(assert (=> d!47926 (= res!123851 (= lt!230370 (bvsub lt!230369 lt!230372)))))

(assert (=> d!47926 (or (= (bvand lt!230369 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!230372 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!230369 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!230369 lt!230372) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!47926 (= lt!230372 (remainingBits!0 ((_ sign_extend 32) (size!3015 (buf!3480 (_1!6956 lt!230258)))) ((_ sign_extend 32) (currentByte!6388 (_1!6956 lt!230258))) ((_ sign_extend 32) (currentBit!6383 (_1!6956 lt!230258)))))))

(declare-fun lt!230371 () (_ BitVec 64))

(declare-fun lt!230374 () (_ BitVec 64))

(assert (=> d!47926 (= lt!230369 (bvmul lt!230371 lt!230374))))

(assert (=> d!47926 (or (= lt!230371 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!230374 (bvsdiv (bvmul lt!230371 lt!230374) lt!230371)))))

(assert (=> d!47926 (= lt!230374 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!47926 (= lt!230371 ((_ sign_extend 32) (size!3015 (buf!3480 (_1!6956 lt!230258)))))))

(assert (=> d!47926 (= lt!230370 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6388 (_1!6956 lt!230258))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6383 (_1!6956 lt!230258)))))))

(assert (=> d!47926 (invariant!0 (currentBit!6383 (_1!6956 lt!230258)) (currentByte!6388 (_1!6956 lt!230258)) (size!3015 (buf!3480 (_1!6956 lt!230258))))))

(assert (=> d!47926 (= (bitIndex!0 (size!3015 (buf!3480 (_1!6956 lt!230258))) (currentByte!6388 (_1!6956 lt!230258)) (currentBit!6383 (_1!6956 lt!230258))) lt!230370)))

(declare-fun b!147971 () Bool)

(declare-fun res!123850 () Bool)

(assert (=> b!147971 (=> (not res!123850) (not e!98709))))

(assert (=> b!147971 (= res!123850 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!230370))))

(declare-fun b!147972 () Bool)

(declare-fun lt!230373 () (_ BitVec 64))

(assert (=> b!147972 (= e!98709 (bvsle lt!230370 (bvmul lt!230373 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!147972 (or (= lt!230373 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!230373 #b0000000000000000000000000000000000000000000000000000000000001000) lt!230373)))))

(assert (=> b!147972 (= lt!230373 ((_ sign_extend 32) (size!3015 (buf!3480 (_1!6956 lt!230258)))))))

(assert (= (and d!47926 res!123851) b!147971))

(assert (= (and b!147971 res!123850) b!147972))

(declare-fun m!229343 () Bool)

(assert (=> d!47926 m!229343))

(declare-fun m!229345 () Bool)

(assert (=> d!47926 m!229345))

(assert (=> b!147930 d!47926))

(declare-datatypes ((tuple3!576 0))(
  ( (tuple3!577 (_1!6958 Unit!9318) (_2!6958 BitStream!5288) (_3!359 array!6663)) )
))
(declare-fun lt!230393 () tuple3!576)

(declare-fun d!47934 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!5288 array!6663 (_ BitVec 32) (_ BitVec 32)) tuple3!576)

(assert (=> d!47934 (= lt!230393 (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!6955 lt!230255) #b00000000000000000000000000000001) lt!230262 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!47934 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6955 lt!230255) #b00000000000000000000000000000001) lt!230262 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13191 (_2!6958 lt!230393) (_3!359 lt!230393)))))

(declare-fun bs!11712 () Bool)

(assert (= bs!11712 d!47934))

(assert (=> bs!11712 m!229247))

(declare-fun m!229351 () Bool)

(assert (=> bs!11712 m!229351))

(assert (=> b!147930 d!47934))

(declare-fun b!148007 () Bool)

(declare-fun res!123883 () Bool)

(declare-fun e!98730 () Bool)

(assert (=> b!148007 (=> (not res!123883) (not e!98730))))

(declare-fun lt!230503 () tuple2!13188)

(assert (=> b!148007 (= res!123883 (isPrefixOf!0 (_2!6953 lt!230272) (_2!6953 lt!230503)))))

(declare-fun b!148008 () Bool)

(declare-fun res!123881 () Bool)

(assert (=> b!148008 (=> (not res!123881) (not e!98730))))

(declare-fun lt!230510 () (_ BitVec 64))

(declare-fun lt!230504 () (_ BitVec 64))

(assert (=> b!148008 (= res!123881 (= (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230503))) (currentByte!6388 (_2!6953 lt!230503)) (currentBit!6383 (_2!6953 lt!230503))) (bvadd lt!230510 lt!230504)))))

(assert (=> b!148008 (or (not (= (bvand lt!230510 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!230504 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!230510 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!230510 lt!230504) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!230502 () (_ BitVec 64))

(assert (=> b!148008 (= lt!230504 (bvmul lt!230502 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!148008 (or (= lt!230502 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!230502 #b0000000000000000000000000000000000000000000000000000000000001000) lt!230502)))))

(assert (=> b!148008 (= lt!230502 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!148008 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!148008 (= lt!230510 (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230272))) (currentByte!6388 (_2!6953 lt!230272)) (currentBit!6383 (_2!6953 lt!230272))))))

(declare-fun e!98728 () Bool)

(declare-fun b!148010 () Bool)

(declare-fun lt!230507 () tuple2!13190)

(assert (=> b!148010 (= e!98728 (arrayRangesEq!331 arr!237 (_2!6954 lt!230507) #b00000000000000000000000000000000 to!404))))

(declare-fun b!148011 () Bool)

(assert (=> b!148011 (= e!98730 e!98728)))

(declare-fun res!123882 () Bool)

(assert (=> b!148011 (=> (not res!123882) (not e!98728))))

(declare-fun lt!230506 () tuple2!13192)

(assert (=> b!148011 (= res!123882 (and (= (size!3015 (_2!6954 lt!230507)) (size!3015 arr!237)) (= (_1!6954 lt!230507) (_2!6955 lt!230506))))))

(assert (=> b!148011 (= lt!230507 (readByteArrayLoopPure!0 (_1!6955 lt!230506) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!230509 () Unit!9318)

(declare-fun lt!230508 () Unit!9318)

(assert (=> b!148011 (= lt!230509 lt!230508)))

(declare-fun lt!230505 () (_ BitVec 64))

(assert (=> b!148011 (validate_offset_bits!1 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230503)))) ((_ sign_extend 32) (currentByte!6388 (_2!6953 lt!230272))) ((_ sign_extend 32) (currentBit!6383 (_2!6953 lt!230272))) lt!230505)))

(assert (=> b!148011 (= lt!230508 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6953 lt!230272) (buf!3480 (_2!6953 lt!230503)) lt!230505))))

(declare-fun e!98729 () Bool)

(assert (=> b!148011 e!98729))

(declare-fun res!123884 () Bool)

(assert (=> b!148011 (=> (not res!123884) (not e!98729))))

(assert (=> b!148011 (= res!123884 (and (= (size!3015 (buf!3480 (_2!6953 lt!230272))) (size!3015 (buf!3480 (_2!6953 lt!230503)))) (bvsge lt!230505 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!148011 (= lt!230505 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!148011 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!148011 (= lt!230506 (reader!0 (_2!6953 lt!230272) (_2!6953 lt!230503)))))

(declare-fun d!47938 () Bool)

(assert (=> d!47938 e!98730))

(declare-fun res!123880 () Bool)

(assert (=> d!47938 (=> (not res!123880) (not e!98730))))

(assert (=> d!47938 (= res!123880 (= (size!3015 (buf!3480 (_2!6953 lt!230272))) (size!3015 (buf!3480 (_2!6953 lt!230503)))))))

(declare-fun choose!64 (BitStream!5288 array!6663 (_ BitVec 32) (_ BitVec 32)) tuple2!13188)

(assert (=> d!47938 (= lt!230503 (choose!64 (_2!6953 lt!230272) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!47938 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!3015 arr!237)))))

(assert (=> d!47938 (= (appendByteArrayLoop!0 (_2!6953 lt!230272) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!230503)))

(declare-fun b!148009 () Bool)

(assert (=> b!148009 (= e!98729 (validate_offset_bits!1 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230272)))) ((_ sign_extend 32) (currentByte!6388 (_2!6953 lt!230272))) ((_ sign_extend 32) (currentBit!6383 (_2!6953 lt!230272))) lt!230505))))

(assert (= (and d!47938 res!123880) b!148008))

(assert (= (and b!148008 res!123881) b!148007))

(assert (= (and b!148007 res!123883) b!148011))

(assert (= (and b!148011 res!123884) b!148009))

(assert (= (and b!148011 res!123882) b!148010))

(declare-fun m!229393 () Bool)

(assert (=> b!148008 m!229393))

(assert (=> b!148008 m!229205))

(declare-fun m!229403 () Bool)

(assert (=> d!47938 m!229403))

(declare-fun m!229407 () Bool)

(assert (=> b!148007 m!229407))

(declare-fun m!229409 () Bool)

(assert (=> b!148009 m!229409))

(declare-fun m!229411 () Bool)

(assert (=> b!148011 m!229411))

(declare-fun m!229413 () Bool)

(assert (=> b!148011 m!229413))

(declare-fun m!229415 () Bool)

(assert (=> b!148011 m!229415))

(declare-fun m!229417 () Bool)

(assert (=> b!148011 m!229417))

(declare-fun m!229419 () Bool)

(assert (=> b!148010 m!229419))

(assert (=> b!147930 d!47938))

(declare-fun d!47950 () Bool)

(assert (=> d!47950 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230274)))) ((_ sign_extend 32) (currentByte!6388 thiss!1634)) ((_ sign_extend 32) (currentBit!6383 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!230515 () Unit!9318)

(declare-fun choose!26 (BitStream!5288 array!6663 (_ BitVec 32) BitStream!5288) Unit!9318)

(assert (=> d!47950 (= lt!230515 (choose!26 thiss!1634 (buf!3480 (_2!6953 lt!230274)) (bvsub to!404 from!447) (BitStream!5289 (buf!3480 (_2!6953 lt!230274)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634))))))

(assert (=> d!47950 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3480 (_2!6953 lt!230274)) (bvsub to!404 from!447)) lt!230515)))

(declare-fun bs!11720 () Bool)

(assert (= bs!11720 d!47950))

(assert (=> bs!11720 m!229245))

(declare-fun m!229427 () Bool)

(assert (=> bs!11720 m!229427))

(assert (=> b!147930 d!47950))

(declare-fun d!47958 () Bool)

(declare-fun lt!230516 () tuple2!13196)

(assert (=> d!47958 (= lt!230516 (readByte!0 (_1!6955 lt!230255)))))

(assert (=> d!47958 (= (readBytePure!0 (_1!6955 lt!230255)) (tuple2!13195 (_2!6957 lt!230516) (_1!6957 lt!230516)))))

(declare-fun bs!11721 () Bool)

(assert (= bs!11721 d!47958))

(declare-fun m!229429 () Bool)

(assert (=> bs!11721 m!229429))

(assert (=> b!147930 d!47958))

(declare-fun d!47960 () Bool)

(declare-fun lt!230517 () tuple2!13196)

(assert (=> d!47960 (= lt!230517 (readByte!0 lt!230276))))

(assert (=> d!47960 (= (readBytePure!0 lt!230276) (tuple2!13195 (_2!6957 lt!230517) (_1!6957 lt!230517)))))

(declare-fun bs!11722 () Bool)

(assert (= bs!11722 d!47960))

(declare-fun m!229431 () Bool)

(assert (=> bs!11722 m!229431))

(assert (=> b!147930 d!47960))

(declare-fun d!47962 () Bool)

(declare-fun e!98733 () Bool)

(assert (=> d!47962 e!98733))

(declare-fun res!123887 () Bool)

(assert (=> d!47962 (=> (not res!123887) (not e!98733))))

(declare-fun lt!230529 () tuple2!13194)

(declare-fun lt!230527 () tuple2!13194)

(assert (=> d!47962 (= res!123887 (= (bitIndex!0 (size!3015 (buf!3480 (_1!6956 lt!230529))) (currentByte!6388 (_1!6956 lt!230529)) (currentBit!6383 (_1!6956 lt!230529))) (bitIndex!0 (size!3015 (buf!3480 (_1!6956 lt!230527))) (currentByte!6388 (_1!6956 lt!230527)) (currentBit!6383 (_1!6956 lt!230527)))))))

(declare-fun lt!230528 () BitStream!5288)

(declare-fun lt!230526 () Unit!9318)

(declare-fun choose!14 (BitStream!5288 BitStream!5288 BitStream!5288 tuple2!13194 tuple2!13194 BitStream!5288 (_ BitVec 8) tuple2!13194 tuple2!13194 BitStream!5288 (_ BitVec 8)) Unit!9318)

(assert (=> d!47962 (= lt!230526 (choose!14 lt!230276 (_2!6953 lt!230274) lt!230528 lt!230529 (tuple2!13195 (_1!6956 lt!230529) (_2!6956 lt!230529)) (_1!6956 lt!230529) (_2!6956 lt!230529) lt!230527 (tuple2!13195 (_1!6956 lt!230527) (_2!6956 lt!230527)) (_1!6956 lt!230527) (_2!6956 lt!230527)))))

(assert (=> d!47962 (= lt!230527 (readBytePure!0 lt!230528))))

(assert (=> d!47962 (= lt!230529 (readBytePure!0 lt!230276))))

(assert (=> d!47962 (= lt!230528 (BitStream!5289 (buf!3480 (_2!6953 lt!230274)) (currentByte!6388 lt!230276) (currentBit!6383 lt!230276)))))

(assert (=> d!47962 (= (readBytePrefixLemma!0 lt!230276 (_2!6953 lt!230274)) lt!230526)))

(declare-fun b!148014 () Bool)

(assert (=> b!148014 (= e!98733 (= (_2!6956 lt!230529) (_2!6956 lt!230527)))))

(assert (= (and d!47962 res!123887) b!148014))

(declare-fun m!229433 () Bool)

(assert (=> d!47962 m!229433))

(assert (=> d!47962 m!229231))

(declare-fun m!229435 () Bool)

(assert (=> d!47962 m!229435))

(declare-fun m!229437 () Bool)

(assert (=> d!47962 m!229437))

(declare-fun m!229439 () Bool)

(assert (=> d!47962 m!229439))

(assert (=> b!147930 d!47962))

(declare-fun d!47964 () Bool)

(assert (=> d!47964 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230274)))) ((_ sign_extend 32) (currentByte!6388 (_2!6953 lt!230272))) ((_ sign_extend 32) (currentBit!6383 (_2!6953 lt!230272))) lt!230257)))

(declare-fun lt!230530 () Unit!9318)

(assert (=> d!47964 (= lt!230530 (choose!26 (_2!6953 lt!230272) (buf!3480 (_2!6953 lt!230274)) lt!230257 (BitStream!5289 (buf!3480 (_2!6953 lt!230274)) (currentByte!6388 (_2!6953 lt!230272)) (currentBit!6383 (_2!6953 lt!230272)))))))

(assert (=> d!47964 (= (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6953 lt!230272) (buf!3480 (_2!6953 lt!230274)) lt!230257) lt!230530)))

(declare-fun bs!11723 () Bool)

(assert (= bs!11723 d!47964))

(assert (=> bs!11723 m!229229))

(declare-fun m!229441 () Bool)

(assert (=> bs!11723 m!229441))

(assert (=> b!147930 d!47964))

(declare-fun d!47966 () Bool)

(declare-fun e!98736 () Bool)

(assert (=> d!47966 e!98736))

(declare-fun res!123895 () Bool)

(assert (=> d!47966 (=> (not res!123895) (not e!98736))))

(declare-fun lt!230545 () tuple2!13188)

(assert (=> d!47966 (= res!123895 (= (size!3015 (buf!3480 thiss!1634)) (size!3015 (buf!3480 (_2!6953 lt!230545)))))))

(declare-fun choose!6 (BitStream!5288 (_ BitVec 8)) tuple2!13188)

(assert (=> d!47966 (= lt!230545 (choose!6 thiss!1634 (select (arr!3784 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!47966 (validate_offset_byte!0 ((_ sign_extend 32) (size!3015 (buf!3480 thiss!1634))) ((_ sign_extend 32) (currentByte!6388 thiss!1634)) ((_ sign_extend 32) (currentBit!6383 thiss!1634)))))

(assert (=> d!47966 (= (appendByte!0 thiss!1634 (select (arr!3784 arr!237) from!447)) lt!230545)))

(declare-fun b!148021 () Bool)

(declare-fun res!123894 () Bool)

(assert (=> b!148021 (=> (not res!123894) (not e!98736))))

(declare-fun lt!230543 () (_ BitVec 64))

(declare-fun lt!230544 () (_ BitVec 64))

(assert (=> b!148021 (= res!123894 (= (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230545))) (currentByte!6388 (_2!6953 lt!230545)) (currentBit!6383 (_2!6953 lt!230545))) (bvadd lt!230544 lt!230543)))))

(assert (=> b!148021 (or (not (= (bvand lt!230544 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!230543 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!230544 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!230544 lt!230543) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!148021 (= lt!230543 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!148021 (= lt!230544 (bitIndex!0 (size!3015 (buf!3480 thiss!1634)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634)))))

(declare-fun b!148022 () Bool)

(declare-fun res!123896 () Bool)

(assert (=> b!148022 (=> (not res!123896) (not e!98736))))

(assert (=> b!148022 (= res!123896 (isPrefixOf!0 thiss!1634 (_2!6953 lt!230545)))))

(declare-fun b!148023 () Bool)

(declare-fun lt!230542 () tuple2!13192)

(declare-fun lt!230541 () tuple2!13194)

(assert (=> b!148023 (= e!98736 (and (= (_2!6956 lt!230541) (select (arr!3784 arr!237) from!447)) (= (_1!6956 lt!230541) (_2!6955 lt!230542))))))

(assert (=> b!148023 (= lt!230541 (readBytePure!0 (_1!6955 lt!230542)))))

(assert (=> b!148023 (= lt!230542 (reader!0 thiss!1634 (_2!6953 lt!230545)))))

(assert (= (and d!47966 res!123895) b!148021))

(assert (= (and b!148021 res!123894) b!148022))

(assert (= (and b!148022 res!123896) b!148023))

(assert (=> d!47966 m!229237))

(declare-fun m!229443 () Bool)

(assert (=> d!47966 m!229443))

(declare-fun m!229445 () Bool)

(assert (=> d!47966 m!229445))

(declare-fun m!229447 () Bool)

(assert (=> b!148021 m!229447))

(assert (=> b!148021 m!229207))

(declare-fun m!229449 () Bool)

(assert (=> b!148022 m!229449))

(declare-fun m!229451 () Bool)

(assert (=> b!148023 m!229451))

(declare-fun m!229453 () Bool)

(assert (=> b!148023 m!229453))

(assert (=> b!147930 d!47966))

(declare-fun d!47968 () Bool)

(assert (=> d!47968 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230274)))) ((_ sign_extend 32) (currentByte!6388 thiss!1634)) ((_ sign_extend 32) (currentBit!6383 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230274)))) ((_ sign_extend 32) (currentByte!6388 thiss!1634)) ((_ sign_extend 32) (currentBit!6383 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11724 () Bool)

(assert (= bs!11724 d!47968))

(declare-fun m!229455 () Bool)

(assert (=> bs!11724 m!229455))

(assert (=> b!147930 d!47968))

(declare-fun lt!230546 () tuple3!576)

(declare-fun d!47970 () Bool)

(assert (=> d!47970 (= lt!230546 (readByteArrayLoop!0 (_1!6955 lt!230255) arr!237 from!447 to!404))))

(assert (=> d!47970 (= (readByteArrayLoopPure!0 (_1!6955 lt!230255) arr!237 from!447 to!404) (tuple2!13191 (_2!6958 lt!230546) (_3!359 lt!230546)))))

(declare-fun bs!11725 () Bool)

(assert (= bs!11725 d!47970))

(declare-fun m!229457 () Bool)

(assert (=> bs!11725 m!229457))

(assert (=> b!147930 d!47970))

(declare-fun d!47972 () Bool)

(declare-fun e!98738 () Bool)

(assert (=> d!47972 e!98738))

(declare-fun res!123897 () Bool)

(assert (=> d!47972 (=> (not res!123897) (not e!98738))))

(declare-fun lt!230559 () tuple2!13192)

(assert (=> d!47972 (= res!123897 (isPrefixOf!0 (_1!6955 lt!230559) (_2!6955 lt!230559)))))

(declare-fun lt!230557 () BitStream!5288)

(assert (=> d!47972 (= lt!230559 (tuple2!13193 lt!230557 (_2!6953 lt!230274)))))

(declare-fun lt!230551 () Unit!9318)

(declare-fun lt!230553 () Unit!9318)

(assert (=> d!47972 (= lt!230551 lt!230553)))

(assert (=> d!47972 (isPrefixOf!0 lt!230557 (_2!6953 lt!230274))))

(assert (=> d!47972 (= lt!230553 (lemmaIsPrefixTransitive!0 lt!230557 (_2!6953 lt!230274) (_2!6953 lt!230274)))))

(declare-fun lt!230547 () Unit!9318)

(declare-fun lt!230555 () Unit!9318)

(assert (=> d!47972 (= lt!230547 lt!230555)))

(assert (=> d!47972 (isPrefixOf!0 lt!230557 (_2!6953 lt!230274))))

(assert (=> d!47972 (= lt!230555 (lemmaIsPrefixTransitive!0 lt!230557 (_2!6953 lt!230272) (_2!6953 lt!230274)))))

(declare-fun lt!230562 () Unit!9318)

(declare-fun e!98737 () Unit!9318)

(assert (=> d!47972 (= lt!230562 e!98737)))

(declare-fun c!8001 () Bool)

(assert (=> d!47972 (= c!8001 (not (= (size!3015 (buf!3480 (_2!6953 lt!230272))) #b00000000000000000000000000000000)))))

(declare-fun lt!230552 () Unit!9318)

(declare-fun lt!230558 () Unit!9318)

(assert (=> d!47972 (= lt!230552 lt!230558)))

(assert (=> d!47972 (isPrefixOf!0 (_2!6953 lt!230274) (_2!6953 lt!230274))))

(assert (=> d!47972 (= lt!230558 (lemmaIsPrefixRefl!0 (_2!6953 lt!230274)))))

(declare-fun lt!230556 () Unit!9318)

(declare-fun lt!230564 () Unit!9318)

(assert (=> d!47972 (= lt!230556 lt!230564)))

(assert (=> d!47972 (= lt!230564 (lemmaIsPrefixRefl!0 (_2!6953 lt!230274)))))

(declare-fun lt!230566 () Unit!9318)

(declare-fun lt!230549 () Unit!9318)

(assert (=> d!47972 (= lt!230566 lt!230549)))

(assert (=> d!47972 (isPrefixOf!0 lt!230557 lt!230557)))

(assert (=> d!47972 (= lt!230549 (lemmaIsPrefixRefl!0 lt!230557))))

(declare-fun lt!230565 () Unit!9318)

(declare-fun lt!230560 () Unit!9318)

(assert (=> d!47972 (= lt!230565 lt!230560)))

(assert (=> d!47972 (isPrefixOf!0 (_2!6953 lt!230272) (_2!6953 lt!230272))))

(assert (=> d!47972 (= lt!230560 (lemmaIsPrefixRefl!0 (_2!6953 lt!230272)))))

(assert (=> d!47972 (= lt!230557 (BitStream!5289 (buf!3480 (_2!6953 lt!230274)) (currentByte!6388 (_2!6953 lt!230272)) (currentBit!6383 (_2!6953 lt!230272))))))

(assert (=> d!47972 (isPrefixOf!0 (_2!6953 lt!230272) (_2!6953 lt!230274))))

(assert (=> d!47972 (= (reader!0 (_2!6953 lt!230272) (_2!6953 lt!230274)) lt!230559)))

(declare-fun lt!230563 () (_ BitVec 64))

(declare-fun lt!230554 () (_ BitVec 64))

(declare-fun b!148024 () Bool)

(assert (=> b!148024 (= e!98738 (= (_1!6955 lt!230559) (withMovedBitIndex!0 (_2!6955 lt!230559) (bvsub lt!230563 lt!230554))))))

(assert (=> b!148024 (or (= (bvand lt!230563 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!230554 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!230563 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!230563 lt!230554) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!148024 (= lt!230554 (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230274))) (currentByte!6388 (_2!6953 lt!230274)) (currentBit!6383 (_2!6953 lt!230274))))))

(assert (=> b!148024 (= lt!230563 (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230272))) (currentByte!6388 (_2!6953 lt!230272)) (currentBit!6383 (_2!6953 lt!230272))))))

(declare-fun b!148025 () Bool)

(declare-fun res!123898 () Bool)

(assert (=> b!148025 (=> (not res!123898) (not e!98738))))

(assert (=> b!148025 (= res!123898 (isPrefixOf!0 (_1!6955 lt!230559) (_2!6953 lt!230272)))))

(declare-fun b!148026 () Bool)

(declare-fun Unit!9322 () Unit!9318)

(assert (=> b!148026 (= e!98737 Unit!9322)))

(declare-fun b!148027 () Bool)

(declare-fun lt!230550 () Unit!9318)

(assert (=> b!148027 (= e!98737 lt!230550)))

(declare-fun lt!230561 () (_ BitVec 64))

(assert (=> b!148027 (= lt!230561 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!230548 () (_ BitVec 64))

(assert (=> b!148027 (= lt!230548 (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230272))) (currentByte!6388 (_2!6953 lt!230272)) (currentBit!6383 (_2!6953 lt!230272))))))

(assert (=> b!148027 (= lt!230550 (arrayBitRangesEqSymmetric!0 (buf!3480 (_2!6953 lt!230272)) (buf!3480 (_2!6953 lt!230274)) lt!230561 lt!230548))))

(assert (=> b!148027 (arrayBitRangesEq!0 (buf!3480 (_2!6953 lt!230274)) (buf!3480 (_2!6953 lt!230272)) lt!230561 lt!230548)))

(declare-fun b!148028 () Bool)

(declare-fun res!123899 () Bool)

(assert (=> b!148028 (=> (not res!123899) (not e!98738))))

(assert (=> b!148028 (= res!123899 (isPrefixOf!0 (_2!6955 lt!230559) (_2!6953 lt!230274)))))

(assert (= (and d!47972 c!8001) b!148027))

(assert (= (and d!47972 (not c!8001)) b!148026))

(assert (= (and d!47972 res!123897) b!148025))

(assert (= (and b!148025 res!123898) b!148028))

(assert (= (and b!148028 res!123899) b!148024))

(declare-fun m!229459 () Bool)

(assert (=> b!148025 m!229459))

(assert (=> b!148027 m!229205))

(declare-fun m!229461 () Bool)

(assert (=> b!148027 m!229461))

(declare-fun m!229463 () Bool)

(assert (=> b!148027 m!229463))

(declare-fun m!229465 () Bool)

(assert (=> b!148024 m!229465))

(assert (=> b!148024 m!229273))

(assert (=> b!148024 m!229205))

(declare-fun m!229467 () Bool)

(assert (=> d!47972 m!229467))

(declare-fun m!229469 () Bool)

(assert (=> d!47972 m!229469))

(declare-fun m!229471 () Bool)

(assert (=> d!47972 m!229471))

(assert (=> d!47972 m!229275))

(declare-fun m!229473 () Bool)

(assert (=> d!47972 m!229473))

(declare-fun m!229475 () Bool)

(assert (=> d!47972 m!229475))

(declare-fun m!229477 () Bool)

(assert (=> d!47972 m!229477))

(declare-fun m!229479 () Bool)

(assert (=> d!47972 m!229479))

(assert (=> d!47972 m!229307))

(declare-fun m!229481 () Bool)

(assert (=> d!47972 m!229481))

(assert (=> d!47972 m!229303))

(declare-fun m!229483 () Bool)

(assert (=> b!148028 m!229483))

(assert (=> b!147930 d!47972))

(declare-fun d!47974 () Bool)

(declare-fun lt!230567 () tuple3!576)

(assert (=> d!47974 (= lt!230567 (readByteArrayLoop!0 (_1!6955 lt!230278) lt!230262 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!47974 (= (readByteArrayLoopPure!0 (_1!6955 lt!230278) lt!230262 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13191 (_2!6958 lt!230567) (_3!359 lt!230567)))))

(declare-fun bs!11726 () Bool)

(assert (= bs!11726 d!47974))

(declare-fun m!229485 () Bool)

(assert (=> bs!11726 m!229485))

(assert (=> b!147930 d!47974))

(declare-fun d!47976 () Bool)

(assert (=> d!47976 (isPrefixOf!0 thiss!1634 (_2!6953 lt!230274))))

(declare-fun lt!230570 () Unit!9318)

(declare-fun choose!30 (BitStream!5288 BitStream!5288 BitStream!5288) Unit!9318)

(assert (=> d!47976 (= lt!230570 (choose!30 thiss!1634 (_2!6953 lt!230272) (_2!6953 lt!230274)))))

(assert (=> d!47976 (isPrefixOf!0 thiss!1634 (_2!6953 lt!230272))))

(assert (=> d!47976 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6953 lt!230272) (_2!6953 lt!230274)) lt!230570)))

(declare-fun bs!11727 () Bool)

(assert (= bs!11727 d!47976))

(assert (=> bs!11727 m!229253))

(declare-fun m!229487 () Bool)

(assert (=> bs!11727 m!229487))

(assert (=> bs!11727 m!229197))

(assert (=> b!147930 d!47976))

(declare-fun d!47978 () Bool)

(declare-fun res!123900 () Bool)

(declare-fun e!98739 () Bool)

(assert (=> d!47978 (=> res!123900 e!98739)))

(assert (=> d!47978 (= res!123900 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!47978 (= (arrayRangesEq!331 (_2!6954 lt!230269) (_2!6954 lt!230268) #b00000000000000000000000000000000 to!404) e!98739)))

(declare-fun b!148029 () Bool)

(declare-fun e!98740 () Bool)

(assert (=> b!148029 (= e!98739 e!98740)))

(declare-fun res!123901 () Bool)

(assert (=> b!148029 (=> (not res!123901) (not e!98740))))

(assert (=> b!148029 (= res!123901 (= (select (arr!3784 (_2!6954 lt!230269)) #b00000000000000000000000000000000) (select (arr!3784 (_2!6954 lt!230268)) #b00000000000000000000000000000000)))))

(declare-fun b!148030 () Bool)

(assert (=> b!148030 (= e!98740 (arrayRangesEq!331 (_2!6954 lt!230269) (_2!6954 lt!230268) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!47978 (not res!123900)) b!148029))

(assert (= (and b!148029 res!123901) b!148030))

(declare-fun m!229489 () Bool)

(assert (=> b!148029 m!229489))

(declare-fun m!229491 () Bool)

(assert (=> b!148029 m!229491))

(declare-fun m!229493 () Bool)

(assert (=> b!148030 m!229493))

(assert (=> b!147930 d!47978))

(declare-fun d!47980 () Bool)

(declare-fun res!123904 () Bool)

(declare-fun e!98742 () Bool)

(assert (=> d!47980 (=> (not res!123904) (not e!98742))))

(assert (=> d!47980 (= res!123904 (= (size!3015 (buf!3480 thiss!1634)) (size!3015 (buf!3480 (_2!6953 lt!230274)))))))

(assert (=> d!47980 (= (isPrefixOf!0 thiss!1634 (_2!6953 lt!230274)) e!98742)))

(declare-fun b!148031 () Bool)

(declare-fun res!123903 () Bool)

(assert (=> b!148031 (=> (not res!123903) (not e!98742))))

(assert (=> b!148031 (= res!123903 (bvsle (bitIndex!0 (size!3015 (buf!3480 thiss!1634)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634)) (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230274))) (currentByte!6388 (_2!6953 lt!230274)) (currentBit!6383 (_2!6953 lt!230274)))))))

(declare-fun b!148032 () Bool)

(declare-fun e!98741 () Bool)

(assert (=> b!148032 (= e!98742 e!98741)))

(declare-fun res!123902 () Bool)

(assert (=> b!148032 (=> res!123902 e!98741)))

(assert (=> b!148032 (= res!123902 (= (size!3015 (buf!3480 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!148033 () Bool)

(assert (=> b!148033 (= e!98741 (arrayBitRangesEq!0 (buf!3480 thiss!1634) (buf!3480 (_2!6953 lt!230274)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3015 (buf!3480 thiss!1634)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634))))))

(assert (= (and d!47980 res!123904) b!148031))

(assert (= (and b!148031 res!123903) b!148032))

(assert (= (and b!148032 (not res!123902)) b!148033))

(assert (=> b!148031 m!229207))

(assert (=> b!148031 m!229273))

(assert (=> b!148033 m!229207))

(assert (=> b!148033 m!229207))

(declare-fun m!229495 () Bool)

(assert (=> b!148033 m!229495))

(assert (=> b!147930 d!47980))

(declare-fun d!47982 () Bool)

(assert (=> d!47982 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230272)))) ((_ sign_extend 32) (currentByte!6388 (_2!6953 lt!230272))) ((_ sign_extend 32) (currentBit!6383 (_2!6953 lt!230272))) lt!230257) (bvsle ((_ sign_extend 32) lt!230257) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230272)))) ((_ sign_extend 32) (currentByte!6388 (_2!6953 lt!230272))) ((_ sign_extend 32) (currentBit!6383 (_2!6953 lt!230272)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11728 () Bool)

(assert (= bs!11728 d!47982))

(declare-fun m!229497 () Bool)

(assert (=> bs!11728 m!229497))

(assert (=> b!147930 d!47982))

(declare-fun d!47984 () Bool)

(declare-fun e!98744 () Bool)

(assert (=> d!47984 e!98744))

(declare-fun res!123905 () Bool)

(assert (=> d!47984 (=> (not res!123905) (not e!98744))))

(declare-fun lt!230583 () tuple2!13192)

(assert (=> d!47984 (= res!123905 (isPrefixOf!0 (_1!6955 lt!230583) (_2!6955 lt!230583)))))

(declare-fun lt!230581 () BitStream!5288)

(assert (=> d!47984 (= lt!230583 (tuple2!13193 lt!230581 (_2!6953 lt!230274)))))

(declare-fun lt!230575 () Unit!9318)

(declare-fun lt!230577 () Unit!9318)

(assert (=> d!47984 (= lt!230575 lt!230577)))

(assert (=> d!47984 (isPrefixOf!0 lt!230581 (_2!6953 lt!230274))))

(assert (=> d!47984 (= lt!230577 (lemmaIsPrefixTransitive!0 lt!230581 (_2!6953 lt!230274) (_2!6953 lt!230274)))))

(declare-fun lt!230571 () Unit!9318)

(declare-fun lt!230579 () Unit!9318)

(assert (=> d!47984 (= lt!230571 lt!230579)))

(assert (=> d!47984 (isPrefixOf!0 lt!230581 (_2!6953 lt!230274))))

(assert (=> d!47984 (= lt!230579 (lemmaIsPrefixTransitive!0 lt!230581 thiss!1634 (_2!6953 lt!230274)))))

(declare-fun lt!230586 () Unit!9318)

(declare-fun e!98743 () Unit!9318)

(assert (=> d!47984 (= lt!230586 e!98743)))

(declare-fun c!8002 () Bool)

(assert (=> d!47984 (= c!8002 (not (= (size!3015 (buf!3480 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!230576 () Unit!9318)

(declare-fun lt!230582 () Unit!9318)

(assert (=> d!47984 (= lt!230576 lt!230582)))

(assert (=> d!47984 (isPrefixOf!0 (_2!6953 lt!230274) (_2!6953 lt!230274))))

(assert (=> d!47984 (= lt!230582 (lemmaIsPrefixRefl!0 (_2!6953 lt!230274)))))

(declare-fun lt!230580 () Unit!9318)

(declare-fun lt!230588 () Unit!9318)

(assert (=> d!47984 (= lt!230580 lt!230588)))

(assert (=> d!47984 (= lt!230588 (lemmaIsPrefixRefl!0 (_2!6953 lt!230274)))))

(declare-fun lt!230590 () Unit!9318)

(declare-fun lt!230573 () Unit!9318)

(assert (=> d!47984 (= lt!230590 lt!230573)))

(assert (=> d!47984 (isPrefixOf!0 lt!230581 lt!230581)))

(assert (=> d!47984 (= lt!230573 (lemmaIsPrefixRefl!0 lt!230581))))

(declare-fun lt!230589 () Unit!9318)

(declare-fun lt!230584 () Unit!9318)

(assert (=> d!47984 (= lt!230589 lt!230584)))

(assert (=> d!47984 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!47984 (= lt!230584 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!47984 (= lt!230581 (BitStream!5289 (buf!3480 (_2!6953 lt!230274)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634)))))

(assert (=> d!47984 (isPrefixOf!0 thiss!1634 (_2!6953 lt!230274))))

(assert (=> d!47984 (= (reader!0 thiss!1634 (_2!6953 lt!230274)) lt!230583)))

(declare-fun b!148034 () Bool)

(declare-fun lt!230578 () (_ BitVec 64))

(declare-fun lt!230587 () (_ BitVec 64))

(assert (=> b!148034 (= e!98744 (= (_1!6955 lt!230583) (withMovedBitIndex!0 (_2!6955 lt!230583) (bvsub lt!230587 lt!230578))))))

(assert (=> b!148034 (or (= (bvand lt!230587 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!230578 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!230587 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!230587 lt!230578) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!148034 (= lt!230578 (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230274))) (currentByte!6388 (_2!6953 lt!230274)) (currentBit!6383 (_2!6953 lt!230274))))))

(assert (=> b!148034 (= lt!230587 (bitIndex!0 (size!3015 (buf!3480 thiss!1634)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634)))))

(declare-fun b!148035 () Bool)

(declare-fun res!123906 () Bool)

(assert (=> b!148035 (=> (not res!123906) (not e!98744))))

(assert (=> b!148035 (= res!123906 (isPrefixOf!0 (_1!6955 lt!230583) thiss!1634))))

(declare-fun b!148036 () Bool)

(declare-fun Unit!9323 () Unit!9318)

(assert (=> b!148036 (= e!98743 Unit!9323)))

(declare-fun b!148037 () Bool)

(declare-fun lt!230574 () Unit!9318)

(assert (=> b!148037 (= e!98743 lt!230574)))

(declare-fun lt!230585 () (_ BitVec 64))

(assert (=> b!148037 (= lt!230585 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!230572 () (_ BitVec 64))

(assert (=> b!148037 (= lt!230572 (bitIndex!0 (size!3015 (buf!3480 thiss!1634)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634)))))

(assert (=> b!148037 (= lt!230574 (arrayBitRangesEqSymmetric!0 (buf!3480 thiss!1634) (buf!3480 (_2!6953 lt!230274)) lt!230585 lt!230572))))

(assert (=> b!148037 (arrayBitRangesEq!0 (buf!3480 (_2!6953 lt!230274)) (buf!3480 thiss!1634) lt!230585 lt!230572)))

(declare-fun b!148038 () Bool)

(declare-fun res!123907 () Bool)

(assert (=> b!148038 (=> (not res!123907) (not e!98744))))

(assert (=> b!148038 (= res!123907 (isPrefixOf!0 (_2!6955 lt!230583) (_2!6953 lt!230274)))))

(assert (= (and d!47984 c!8002) b!148037))

(assert (= (and d!47984 (not c!8002)) b!148036))

(assert (= (and d!47984 res!123905) b!148035))

(assert (= (and b!148035 res!123906) b!148038))

(assert (= (and b!148038 res!123907) b!148034))

(declare-fun m!229499 () Bool)

(assert (=> b!148035 m!229499))

(assert (=> b!148037 m!229207))

(declare-fun m!229501 () Bool)

(assert (=> b!148037 m!229501))

(declare-fun m!229503 () Bool)

(assert (=> b!148037 m!229503))

(declare-fun m!229505 () Bool)

(assert (=> b!148034 m!229505))

(assert (=> b!148034 m!229273))

(assert (=> b!148034 m!229207))

(assert (=> d!47984 m!229467))

(declare-fun m!229507 () Bool)

(assert (=> d!47984 m!229507))

(assert (=> d!47984 m!229471))

(assert (=> d!47984 m!229253))

(declare-fun m!229509 () Bool)

(assert (=> d!47984 m!229509))

(declare-fun m!229511 () Bool)

(assert (=> d!47984 m!229511))

(declare-fun m!229513 () Bool)

(assert (=> d!47984 m!229513))

(declare-fun m!229515 () Bool)

(assert (=> d!47984 m!229515))

(assert (=> d!47984 m!229317))

(declare-fun m!229517 () Bool)

(assert (=> d!47984 m!229517))

(assert (=> d!47984 m!229321))

(declare-fun m!229519 () Bool)

(assert (=> b!148038 m!229519))

(assert (=> b!147930 d!47984))

(declare-fun d!47986 () Bool)

(declare-fun e!98753 () Bool)

(assert (=> d!47986 e!98753))

(declare-fun res!123920 () Bool)

(assert (=> d!47986 (=> (not res!123920) (not e!98753))))

(assert (=> d!47986 (= res!123920 (and (or (let ((rhs!3260 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3260 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3260) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!47987 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!47987 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!47987 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3259 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3259 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3259) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!230617 () Unit!9318)

(declare-fun choose!57 (BitStream!5288 BitStream!5288 (_ BitVec 64) (_ BitVec 32)) Unit!9318)

(assert (=> d!47986 (= lt!230617 (choose!57 thiss!1634 (_2!6953 lt!230272) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!47986 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6953 lt!230272) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!230617)))

(declare-fun b!148051 () Bool)

(declare-fun lt!230615 () (_ BitVec 32))

(assert (=> b!148051 (= e!98753 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230272)))) ((_ sign_extend 32) (currentByte!6388 (_2!6953 lt!230272))) ((_ sign_extend 32) (currentBit!6383 (_2!6953 lt!230272))) (bvsub (bvsub to!404 from!447) lt!230615)))))

(assert (=> b!148051 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!230615 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!230615) #b10000000000000000000000000000000)))))

(declare-fun lt!230616 () (_ BitVec 64))

(assert (=> b!148051 (= lt!230615 ((_ extract 31 0) lt!230616))))

(assert (=> b!148051 (and (bvslt lt!230616 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!230616 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!148051 (= lt!230616 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!47986 res!123920) b!148051))

(declare-fun m!229521 () Bool)

(assert (=> d!47986 m!229521))

(declare-fun m!229523 () Bool)

(assert (=> b!148051 m!229523))

(assert (=> b!147930 d!47986))

(declare-fun d!47989 () Bool)

(declare-fun moveByteIndex!0 (BitStream!5288 (_ BitVec 32)) tuple2!13188)

(assert (=> d!47989 (= (withMovedByteIndex!0 (_1!6955 lt!230255) #b00000000000000000000000000000001) (_2!6953 (moveByteIndex!0 (_1!6955 lt!230255) #b00000000000000000000000000000001)))))

(declare-fun bs!11729 () Bool)

(assert (= bs!11729 d!47989))

(declare-fun m!229525 () Bool)

(assert (=> bs!11729 m!229525))

(assert (=> b!147930 d!47989))

(declare-fun d!47991 () Bool)

(declare-fun e!98754 () Bool)

(assert (=> d!47991 e!98754))

(declare-fun res!123922 () Bool)

(assert (=> d!47991 (=> (not res!123922) (not e!98754))))

(declare-fun lt!230619 () (_ BitVec 64))

(declare-fun lt!230621 () (_ BitVec 64))

(declare-fun lt!230618 () (_ BitVec 64))

(assert (=> d!47991 (= res!123922 (= lt!230619 (bvsub lt!230618 lt!230621)))))

(assert (=> d!47991 (or (= (bvand lt!230618 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!230621 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!230618 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!230618 lt!230621) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!47991 (= lt!230621 (remainingBits!0 ((_ sign_extend 32) (size!3015 (buf!3480 (_1!6956 lt!230256)))) ((_ sign_extend 32) (currentByte!6388 (_1!6956 lt!230256))) ((_ sign_extend 32) (currentBit!6383 (_1!6956 lt!230256)))))))

(declare-fun lt!230620 () (_ BitVec 64))

(declare-fun lt!230623 () (_ BitVec 64))

(assert (=> d!47991 (= lt!230618 (bvmul lt!230620 lt!230623))))

(assert (=> d!47991 (or (= lt!230620 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!230623 (bvsdiv (bvmul lt!230620 lt!230623) lt!230620)))))

(assert (=> d!47991 (= lt!230623 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!47991 (= lt!230620 ((_ sign_extend 32) (size!3015 (buf!3480 (_1!6956 lt!230256)))))))

(assert (=> d!47991 (= lt!230619 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6388 (_1!6956 lt!230256))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6383 (_1!6956 lt!230256)))))))

(assert (=> d!47991 (invariant!0 (currentBit!6383 (_1!6956 lt!230256)) (currentByte!6388 (_1!6956 lt!230256)) (size!3015 (buf!3480 (_1!6956 lt!230256))))))

(assert (=> d!47991 (= (bitIndex!0 (size!3015 (buf!3480 (_1!6956 lt!230256))) (currentByte!6388 (_1!6956 lt!230256)) (currentBit!6383 (_1!6956 lt!230256))) lt!230619)))

(declare-fun b!148052 () Bool)

(declare-fun res!123921 () Bool)

(assert (=> b!148052 (=> (not res!123921) (not e!98754))))

(assert (=> b!148052 (= res!123921 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!230619))))

(declare-fun b!148053 () Bool)

(declare-fun lt!230622 () (_ BitVec 64))

(assert (=> b!148053 (= e!98754 (bvsle lt!230619 (bvmul lt!230622 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!148053 (or (= lt!230622 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!230622 #b0000000000000000000000000000000000000000000000000000000000001000) lt!230622)))))

(assert (=> b!148053 (= lt!230622 ((_ sign_extend 32) (size!3015 (buf!3480 (_1!6956 lt!230256)))))))

(assert (= (and d!47991 res!123922) b!148052))

(assert (= (and b!148052 res!123921) b!148053))

(declare-fun m!229527 () Bool)

(assert (=> d!47991 m!229527))

(declare-fun m!229529 () Bool)

(assert (=> d!47991 m!229529))

(assert (=> b!147930 d!47991))

(declare-fun d!47993 () Bool)

(declare-fun res!123923 () Bool)

(declare-fun e!98755 () Bool)

(assert (=> d!47993 (=> res!123923 e!98755)))

(assert (=> d!47993 (= res!123923 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!47993 (= (arrayRangesEq!331 (_2!6954 lt!230269) (_2!6954 lt!230260) #b00000000000000000000000000000000 to!404) e!98755)))

(declare-fun b!148054 () Bool)

(declare-fun e!98756 () Bool)

(assert (=> b!148054 (= e!98755 e!98756)))

(declare-fun res!123924 () Bool)

(assert (=> b!148054 (=> (not res!123924) (not e!98756))))

(assert (=> b!148054 (= res!123924 (= (select (arr!3784 (_2!6954 lt!230269)) #b00000000000000000000000000000000) (select (arr!3784 (_2!6954 lt!230260)) #b00000000000000000000000000000000)))))

(declare-fun b!148055 () Bool)

(assert (=> b!148055 (= e!98756 (arrayRangesEq!331 (_2!6954 lt!230269) (_2!6954 lt!230260) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!47993 (not res!123923)) b!148054))

(assert (= (and b!148054 res!123924) b!148055))

(assert (=> b!148054 m!229489))

(declare-fun m!229531 () Bool)

(assert (=> b!148054 m!229531))

(declare-fun m!229533 () Bool)

(assert (=> b!148055 m!229533))

(assert (=> b!147930 d!47993))

(declare-fun d!47995 () Bool)

(declare-fun lt!230633 () tuple2!13196)

(assert (=> d!47995 (= lt!230633 (readByte!0 (BitStream!5289 (buf!3480 (_2!6953 lt!230274)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634))))))

(assert (=> d!47995 (= (readBytePure!0 (BitStream!5289 (buf!3480 (_2!6953 lt!230274)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634))) (tuple2!13195 (_2!6957 lt!230633) (_1!6957 lt!230633)))))

(declare-fun bs!11730 () Bool)

(assert (= bs!11730 d!47995))

(declare-fun m!229535 () Bool)

(assert (=> bs!11730 m!229535))

(assert (=> b!147930 d!47995))

(declare-fun d!47997 () Bool)

(assert (=> d!47997 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3015 (buf!3480 thiss!1634))) ((_ sign_extend 32) (currentByte!6388 thiss!1634)) ((_ sign_extend 32) (currentBit!6383 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3015 (buf!3480 thiss!1634))) ((_ sign_extend 32) (currentByte!6388 thiss!1634)) ((_ sign_extend 32) (currentBit!6383 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11731 () Bool)

(assert (= bs!11731 d!47997))

(declare-fun m!229537 () Bool)

(assert (=> bs!11731 m!229537))

(assert (=> b!147920 d!47997))

(declare-fun d!47999 () Bool)

(declare-fun res!123932 () Bool)

(declare-fun e!98761 () Bool)

(assert (=> d!47999 (=> (not res!123932) (not e!98761))))

(assert (=> d!47999 (= res!123932 (= (size!3015 (buf!3480 thiss!1634)) (size!3015 (buf!3480 (_2!6953 lt!230272)))))))

(assert (=> d!47999 (= (isPrefixOf!0 thiss!1634 (_2!6953 lt!230272)) e!98761)))

(declare-fun b!148061 () Bool)

(declare-fun res!123931 () Bool)

(assert (=> b!148061 (=> (not res!123931) (not e!98761))))

(assert (=> b!148061 (= res!123931 (bvsle (bitIndex!0 (size!3015 (buf!3480 thiss!1634)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634)) (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230272))) (currentByte!6388 (_2!6953 lt!230272)) (currentBit!6383 (_2!6953 lt!230272)))))))

(declare-fun b!148062 () Bool)

(declare-fun e!98760 () Bool)

(assert (=> b!148062 (= e!98761 e!98760)))

(declare-fun res!123930 () Bool)

(assert (=> b!148062 (=> res!123930 e!98760)))

(assert (=> b!148062 (= res!123930 (= (size!3015 (buf!3480 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!148063 () Bool)

(assert (=> b!148063 (= e!98760 (arrayBitRangesEq!0 (buf!3480 thiss!1634) (buf!3480 (_2!6953 lt!230272)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3015 (buf!3480 thiss!1634)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634))))))

(assert (= (and d!47999 res!123932) b!148061))

(assert (= (and b!148061 res!123931) b!148062))

(assert (= (and b!148062 (not res!123930)) b!148063))

(assert (=> b!148061 m!229207))

(assert (=> b!148061 m!229205))

(assert (=> b!148063 m!229207))

(assert (=> b!148063 m!229207))

(declare-fun m!229555 () Bool)

(assert (=> b!148063 m!229555))

(assert (=> b!147926 d!47999))

(declare-fun d!48001 () Bool)

(declare-fun res!123933 () Bool)

(declare-fun e!98762 () Bool)

(assert (=> d!48001 (=> res!123933 e!98762)))

(assert (=> d!48001 (= res!123933 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!48001 (= (arrayRangesEq!331 (_2!6954 lt!230260) (_2!6954 lt!230269) #b00000000000000000000000000000000 to!404) e!98762)))

(declare-fun b!148064 () Bool)

(declare-fun e!98763 () Bool)

(assert (=> b!148064 (= e!98762 e!98763)))

(declare-fun res!123934 () Bool)

(assert (=> b!148064 (=> (not res!123934) (not e!98763))))

(assert (=> b!148064 (= res!123934 (= (select (arr!3784 (_2!6954 lt!230260)) #b00000000000000000000000000000000) (select (arr!3784 (_2!6954 lt!230269)) #b00000000000000000000000000000000)))))

(declare-fun b!148065 () Bool)

(assert (=> b!148065 (= e!98763 (arrayRangesEq!331 (_2!6954 lt!230260) (_2!6954 lt!230269) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48001 (not res!123933)) b!148064))

(assert (= (and b!148064 res!123934) b!148065))

(assert (=> b!148064 m!229531))

(assert (=> b!148064 m!229489))

(declare-fun m!229559 () Bool)

(assert (=> b!148065 m!229559))

(assert (=> b!147917 d!48001))

(declare-fun d!48005 () Bool)

(assert (=> d!48005 (arrayRangesEq!331 (_2!6954 lt!230260) (_2!6954 lt!230269) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!230639 () Unit!9318)

(declare-fun choose!83 (array!6663 array!6663 (_ BitVec 32) (_ BitVec 32)) Unit!9318)

(assert (=> d!48005 (= lt!230639 (choose!83 (_2!6954 lt!230269) (_2!6954 lt!230260) #b00000000000000000000000000000000 to!404))))

(assert (=> d!48005 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 to!404) (bvsle to!404 (size!3015 (_2!6954 lt!230269))))))

(assert (=> d!48005 (= (arrayRangesEqSymmetricLemma!63 (_2!6954 lt!230269) (_2!6954 lt!230260) #b00000000000000000000000000000000 to!404) lt!230639)))

(declare-fun bs!11733 () Bool)

(assert (= bs!11733 d!48005))

(assert (=> bs!11733 m!229199))

(declare-fun m!229563 () Bool)

(assert (=> bs!11733 m!229563))

(assert (=> b!147917 d!48005))

(declare-fun d!48009 () Bool)

(declare-fun e!98764 () Bool)

(assert (=> d!48009 e!98764))

(declare-fun res!123936 () Bool)

(assert (=> d!48009 (=> (not res!123936) (not e!98764))))

(declare-fun lt!230644 () (_ BitVec 64))

(declare-fun lt!230641 () (_ BitVec 64))

(declare-fun lt!230642 () (_ BitVec 64))

(assert (=> d!48009 (= res!123936 (= lt!230642 (bvsub lt!230641 lt!230644)))))

(assert (=> d!48009 (or (= (bvand lt!230641 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!230644 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!230641 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!230641 lt!230644) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48009 (= lt!230644 (remainingBits!0 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230272)))) ((_ sign_extend 32) (currentByte!6388 (_2!6953 lt!230272))) ((_ sign_extend 32) (currentBit!6383 (_2!6953 lt!230272)))))))

(declare-fun lt!230643 () (_ BitVec 64))

(declare-fun lt!230646 () (_ BitVec 64))

(assert (=> d!48009 (= lt!230641 (bvmul lt!230643 lt!230646))))

(assert (=> d!48009 (or (= lt!230643 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!230646 (bvsdiv (bvmul lt!230643 lt!230646) lt!230643)))))

(assert (=> d!48009 (= lt!230646 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!48009 (= lt!230643 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230272)))))))

(assert (=> d!48009 (= lt!230642 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6388 (_2!6953 lt!230272))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6383 (_2!6953 lt!230272)))))))

(assert (=> d!48009 (invariant!0 (currentBit!6383 (_2!6953 lt!230272)) (currentByte!6388 (_2!6953 lt!230272)) (size!3015 (buf!3480 (_2!6953 lt!230272))))))

(assert (=> d!48009 (= (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230272))) (currentByte!6388 (_2!6953 lt!230272)) (currentBit!6383 (_2!6953 lt!230272))) lt!230642)))

(declare-fun b!148066 () Bool)

(declare-fun res!123935 () Bool)

(assert (=> b!148066 (=> (not res!123935) (not e!98764))))

(assert (=> b!148066 (= res!123935 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!230642))))

(declare-fun b!148067 () Bool)

(declare-fun lt!230645 () (_ BitVec 64))

(assert (=> b!148067 (= e!98764 (bvsle lt!230642 (bvmul lt!230645 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!148067 (or (= lt!230645 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!230645 #b0000000000000000000000000000000000000000000000000000000000001000) lt!230645)))))

(assert (=> b!148067 (= lt!230645 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230272)))))))

(assert (= (and d!48009 res!123936) b!148066))

(assert (= (and b!148066 res!123935) b!148067))

(assert (=> d!48009 m!229497))

(declare-fun m!229567 () Bool)

(assert (=> d!48009 m!229567))

(assert (=> b!147928 d!48009))

(declare-fun d!48013 () Bool)

(declare-fun e!98765 () Bool)

(assert (=> d!48013 e!98765))

(declare-fun res!123938 () Bool)

(assert (=> d!48013 (=> (not res!123938) (not e!98765))))

(declare-fun lt!230650 () (_ BitVec 64))

(declare-fun lt!230648 () (_ BitVec 64))

(declare-fun lt!230647 () (_ BitVec 64))

(assert (=> d!48013 (= res!123938 (= lt!230648 (bvsub lt!230647 lt!230650)))))

(assert (=> d!48013 (or (= (bvand lt!230647 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!230650 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!230647 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!230647 lt!230650) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48013 (= lt!230650 (remainingBits!0 ((_ sign_extend 32) (size!3015 (buf!3480 thiss!1634))) ((_ sign_extend 32) (currentByte!6388 thiss!1634)) ((_ sign_extend 32) (currentBit!6383 thiss!1634))))))

(declare-fun lt!230649 () (_ BitVec 64))

(declare-fun lt!230652 () (_ BitVec 64))

(assert (=> d!48013 (= lt!230647 (bvmul lt!230649 lt!230652))))

(assert (=> d!48013 (or (= lt!230649 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!230652 (bvsdiv (bvmul lt!230649 lt!230652) lt!230649)))))

(assert (=> d!48013 (= lt!230652 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!48013 (= lt!230649 ((_ sign_extend 32) (size!3015 (buf!3480 thiss!1634))))))

(assert (=> d!48013 (= lt!230648 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6388 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6383 thiss!1634))))))

(assert (=> d!48013 (invariant!0 (currentBit!6383 thiss!1634) (currentByte!6388 thiss!1634) (size!3015 (buf!3480 thiss!1634)))))

(assert (=> d!48013 (= (bitIndex!0 (size!3015 (buf!3480 thiss!1634)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634)) lt!230648)))

(declare-fun b!148068 () Bool)

(declare-fun res!123937 () Bool)

(assert (=> b!148068 (=> (not res!123937) (not e!98765))))

(assert (=> b!148068 (= res!123937 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!230648))))

(declare-fun b!148069 () Bool)

(declare-fun lt!230651 () (_ BitVec 64))

(assert (=> b!148069 (= e!98765 (bvsle lt!230648 (bvmul lt!230651 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!148069 (or (= lt!230651 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!230651 #b0000000000000000000000000000000000000000000000000000000000001000) lt!230651)))))

(assert (=> b!148069 (= lt!230651 ((_ sign_extend 32) (size!3015 (buf!3480 thiss!1634))))))

(assert (= (and d!48013 res!123938) b!148068))

(assert (= (and b!148068 res!123937) b!148069))

(assert (=> d!48013 m!229537))

(assert (=> d!48013 m!229203))

(assert (=> b!147928 d!48013))

(declare-fun lt!230653 () tuple3!576)

(declare-fun d!48015 () Bool)

(assert (=> d!48015 (= lt!230653 (readByteArrayLoop!0 (_1!6955 lt!230270) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!48015 (= (readByteArrayLoopPure!0 (_1!6955 lt!230270) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13191 (_2!6958 lt!230653) (_3!359 lt!230653)))))

(declare-fun bs!11735 () Bool)

(assert (= bs!11735 d!48015))

(declare-fun m!229569 () Bool)

(assert (=> bs!11735 m!229569))

(assert (=> b!147924 d!48015))

(declare-fun d!48017 () Bool)

(assert (=> d!48017 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230274)))) ((_ sign_extend 32) (currentByte!6388 (_2!6953 lt!230272))) ((_ sign_extend 32) (currentBit!6383 (_2!6953 lt!230272))) lt!230273) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230274)))) ((_ sign_extend 32) (currentByte!6388 (_2!6953 lt!230272))) ((_ sign_extend 32) (currentBit!6383 (_2!6953 lt!230272)))) lt!230273))))

(declare-fun bs!11736 () Bool)

(assert (= bs!11736 d!48017))

(assert (=> bs!11736 m!229335))

(assert (=> b!147924 d!48017))

(declare-fun d!48019 () Bool)

(assert (=> d!48019 (validate_offset_bits!1 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230274)))) ((_ sign_extend 32) (currentByte!6388 (_2!6953 lt!230272))) ((_ sign_extend 32) (currentBit!6383 (_2!6953 lt!230272))) lt!230273)))

(declare-fun lt!230656 () Unit!9318)

(declare-fun choose!9 (BitStream!5288 array!6663 (_ BitVec 64) BitStream!5288) Unit!9318)

(assert (=> d!48019 (= lt!230656 (choose!9 (_2!6953 lt!230272) (buf!3480 (_2!6953 lt!230274)) lt!230273 (BitStream!5289 (buf!3480 (_2!6953 lt!230274)) (currentByte!6388 (_2!6953 lt!230272)) (currentBit!6383 (_2!6953 lt!230272)))))))

(assert (=> d!48019 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6953 lt!230272) (buf!3480 (_2!6953 lt!230274)) lt!230273) lt!230656)))

(declare-fun bs!11737 () Bool)

(assert (= bs!11737 d!48019))

(assert (=> bs!11737 m!229279))

(declare-fun m!229571 () Bool)

(assert (=> bs!11737 m!229571))

(assert (=> b!147924 d!48019))

(assert (=> b!147924 d!47972))

(declare-fun d!48022 () Bool)

(declare-fun e!98766 () Bool)

(assert (=> d!48022 e!98766))

(declare-fun res!123940 () Bool)

(assert (=> d!48022 (=> (not res!123940) (not e!98766))))

(declare-fun lt!230658 () (_ BitVec 64))

(declare-fun lt!230660 () (_ BitVec 64))

(declare-fun lt!230657 () (_ BitVec 64))

(assert (=> d!48022 (= res!123940 (= lt!230658 (bvsub lt!230657 lt!230660)))))

(assert (=> d!48022 (or (= (bvand lt!230657 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!230660 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!230657 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!230657 lt!230660) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48022 (= lt!230660 (remainingBits!0 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230274)))) ((_ sign_extend 32) (currentByte!6388 (_2!6953 lt!230274))) ((_ sign_extend 32) (currentBit!6383 (_2!6953 lt!230274)))))))

(declare-fun lt!230659 () (_ BitVec 64))

(declare-fun lt!230662 () (_ BitVec 64))

(assert (=> d!48022 (= lt!230657 (bvmul lt!230659 lt!230662))))

(assert (=> d!48022 (or (= lt!230659 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!230662 (bvsdiv (bvmul lt!230659 lt!230662) lt!230659)))))

(assert (=> d!48022 (= lt!230662 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!48022 (= lt!230659 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230274)))))))

(assert (=> d!48022 (= lt!230658 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6388 (_2!6953 lt!230274))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6383 (_2!6953 lt!230274)))))))

(assert (=> d!48022 (invariant!0 (currentBit!6383 (_2!6953 lt!230274)) (currentByte!6388 (_2!6953 lt!230274)) (size!3015 (buf!3480 (_2!6953 lt!230274))))))

(assert (=> d!48022 (= (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230274))) (currentByte!6388 (_2!6953 lt!230274)) (currentBit!6383 (_2!6953 lt!230274))) lt!230658)))

(declare-fun b!148070 () Bool)

(declare-fun res!123939 () Bool)

(assert (=> b!148070 (=> (not res!123939) (not e!98766))))

(assert (=> b!148070 (= res!123939 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!230658))))

(declare-fun b!148071 () Bool)

(declare-fun lt!230661 () (_ BitVec 64))

(assert (=> b!148071 (= e!98766 (bvsle lt!230658 (bvmul lt!230661 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!148071 (or (= lt!230661 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!230661 #b0000000000000000000000000000000000000000000000000000000000001000) lt!230661)))))

(assert (=> b!148071 (= lt!230661 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230274)))))))

(assert (= (and d!48022 res!123940) b!148070))

(assert (= (and b!148070 res!123939) b!148071))

(declare-fun m!229573 () Bool)

(assert (=> d!48022 m!229573))

(declare-fun m!229575 () Bool)

(assert (=> d!48022 m!229575))

(assert (=> b!147925 d!48022))

(assert (=> b!147925 d!48009))

(push 1)

(assert (not b!148061))

(assert (not b!147958))

(assert (not d!47982))

(assert (not d!47916))

(assert (not b!148037))

(assert (not b!148055))

(assert (not b!147950))

(assert (not b!148034))

(assert (not b!147960))

(assert (not b!148027))

(assert (not d!47924))

(assert (not d!47995))

(assert (not b!147936))

(assert (not d!47974))

(assert (not b!148065))

(assert (not d!47997))

(assert (not d!47958))

(assert (not d!47968))

(assert (not d!47964))

(assert (not d!47918))

(assert (not d!47938))

(assert (not d!48009))

(assert (not b!148010))

(assert (not b!147951))

(assert (not b!148038))

(assert (not b!148028))

(assert (not d!47984))

(assert (not b!148009))

(assert (not d!47989))

(assert (not d!47966))

(assert (not d!47991))

(assert (not b!148063))

(assert (not b!148007))

(assert (not b!148033))

(assert (not b!147947))

(assert (not d!47950))

(assert (not d!48017))

(assert (not d!47922))

(assert (not d!47960))

(assert (not b!148024))

(assert (not d!47970))

(assert (not d!47934))

(assert (not b!148011))

(assert (not b!148031))

(assert (not d!47962))

(assert (not d!48019))

(assert (not d!47976))

(assert (not b!148035))

(assert (not b!148022))

(assert (not b!147948))

(assert (not b!148023))

(assert (not d!47986))

(assert (not b!148051))

(assert (not b!148008))

(assert (not b!148025))

(assert (not d!48013))

(assert (not d!47926))

(assert (not d!48015))

(assert (not d!48005))

(assert (not d!47972))

(assert (not b!148021))

(assert (not d!47912))

(assert (not b!148030))

(assert (not d!48022))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!48171 () Bool)

(declare-fun res!124076 () Bool)

(declare-fun e!98855 () Bool)

(assert (=> d!48171 (=> (not res!124076) (not e!98855))))

(assert (=> d!48171 (= res!124076 (= (size!3015 (buf!3480 thiss!1634)) (size!3015 (buf!3480 (_2!6953 lt!230545)))))))

(assert (=> d!48171 (= (isPrefixOf!0 thiss!1634 (_2!6953 lt!230545)) e!98855)))

(declare-fun b!148219 () Bool)

(declare-fun res!124075 () Bool)

(assert (=> b!148219 (=> (not res!124075) (not e!98855))))

(assert (=> b!148219 (= res!124075 (bvsle (bitIndex!0 (size!3015 (buf!3480 thiss!1634)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634)) (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230545))) (currentByte!6388 (_2!6953 lt!230545)) (currentBit!6383 (_2!6953 lt!230545)))))))

(declare-fun b!148220 () Bool)

(declare-fun e!98854 () Bool)

(assert (=> b!148220 (= e!98855 e!98854)))

(declare-fun res!124074 () Bool)

(assert (=> b!148220 (=> res!124074 e!98854)))

(assert (=> b!148220 (= res!124074 (= (size!3015 (buf!3480 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!148221 () Bool)

(assert (=> b!148221 (= e!98854 (arrayBitRangesEq!0 (buf!3480 thiss!1634) (buf!3480 (_2!6953 lt!230545)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3015 (buf!3480 thiss!1634)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634))))))

(assert (= (and d!48171 res!124076) b!148219))

(assert (= (and b!148219 res!124075) b!148220))

(assert (= (and b!148220 (not res!124074)) b!148221))

(assert (=> b!148219 m!229207))

(assert (=> b!148219 m!229447))

(assert (=> b!148221 m!229207))

(assert (=> b!148221 m!229207))

(declare-fun m!229893 () Bool)

(assert (=> b!148221 m!229893))

(assert (=> b!148022 d!48171))

(assert (=> d!47950 d!47968))

(declare-fun d!48173 () Bool)

(assert (=> d!48173 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230274)))) ((_ sign_extend 32) (currentByte!6388 thiss!1634)) ((_ sign_extend 32) (currentBit!6383 thiss!1634)) (bvsub to!404 from!447))))

(assert (=> d!48173 true))

(declare-fun _$5!78 () Unit!9318)

(assert (=> d!48173 (= (choose!26 thiss!1634 (buf!3480 (_2!6953 lt!230274)) (bvsub to!404 from!447) (BitStream!5289 (buf!3480 (_2!6953 lt!230274)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634))) _$5!78)))

(declare-fun bs!11773 () Bool)

(assert (= bs!11773 d!48173))

(assert (=> bs!11773 m!229245))

(assert (=> d!47950 d!48173))

(declare-fun d!48175 () Bool)

(declare-fun res!124077 () Bool)

(declare-fun e!98856 () Bool)

(assert (=> d!48175 (=> res!124077 e!98856)))

(assert (=> d!48175 (= res!124077 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!48175 (= (arrayRangesEq!331 (_2!6954 lt!230260) (_2!6954 lt!230269) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!98856)))

(declare-fun b!148222 () Bool)

(declare-fun e!98857 () Bool)

(assert (=> b!148222 (= e!98856 e!98857)))

(declare-fun res!124078 () Bool)

(assert (=> b!148222 (=> (not res!124078) (not e!98857))))

(assert (=> b!148222 (= res!124078 (= (select (arr!3784 (_2!6954 lt!230260)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3784 (_2!6954 lt!230269)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!148223 () Bool)

(assert (=> b!148223 (= e!98857 (arrayRangesEq!331 (_2!6954 lt!230260) (_2!6954 lt!230269) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48175 (not res!124077)) b!148222))

(assert (= (and b!148222 res!124078) b!148223))

(declare-fun m!229895 () Bool)

(assert (=> b!148222 m!229895))

(declare-fun m!229897 () Bool)

(assert (=> b!148222 m!229897))

(declare-fun m!229899 () Bool)

(assert (=> b!148223 m!229899))

(assert (=> b!148065 d!48175))

(declare-fun d!48177 () Bool)

(declare-fun lt!231020 () (_ BitVec 8))

(declare-fun lt!231023 () (_ BitVec 8))

(assert (=> d!48177 (= lt!231020 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3784 (buf!3480 lt!230276)) (currentByte!6388 lt!230276))) ((_ sign_extend 24) lt!231023))))))

(assert (=> d!48177 (= lt!231023 ((_ extract 7 0) (currentBit!6383 lt!230276)))))

(declare-fun e!98863 () Bool)

(assert (=> d!48177 e!98863))

(declare-fun res!124085 () Bool)

(assert (=> d!48177 (=> (not res!124085) (not e!98863))))

(assert (=> d!48177 (= res!124085 (validate_offset_bits!1 ((_ sign_extend 32) (size!3015 (buf!3480 lt!230276))) ((_ sign_extend 32) (currentByte!6388 lt!230276)) ((_ sign_extend 32) (currentBit!6383 lt!230276)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!13202 0))(
  ( (tuple2!13203 (_1!6963 Unit!9318) (_2!6963 (_ BitVec 8))) )
))
(declare-fun Unit!9329 () Unit!9318)

(declare-fun Unit!9330 () Unit!9318)

(assert (=> d!48177 (= (readByte!0 lt!230276) (tuple2!13197 (_2!6963 (ite (bvsgt ((_ sign_extend 24) lt!231023) #b00000000000000000000000000000000) (tuple2!13203 Unit!9329 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!231020) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3784 (buf!3480 lt!230276)) (bvadd (currentByte!6388 lt!230276) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!231023)))))))) (tuple2!13203 Unit!9330 lt!231020))) (BitStream!5289 (buf!3480 lt!230276) (bvadd (currentByte!6388 lt!230276) #b00000000000000000000000000000001) (currentBit!6383 lt!230276))))))

(declare-fun b!148228 () Bool)

(declare-fun e!98862 () Bool)

(assert (=> b!148228 (= e!98863 e!98862)))

(declare-fun res!124084 () Bool)

(assert (=> b!148228 (=> (not res!124084) (not e!98862))))

(declare-fun lt!231024 () tuple2!13196)

(assert (=> b!148228 (= res!124084 (= (buf!3480 (_2!6957 lt!231024)) (buf!3480 lt!230276)))))

(declare-fun lt!231022 () (_ BitVec 8))

(declare-fun lt!231021 () (_ BitVec 8))

(declare-fun Unit!9331 () Unit!9318)

(declare-fun Unit!9332 () Unit!9318)

(assert (=> b!148228 (= lt!231024 (tuple2!13197 (_2!6963 (ite (bvsgt ((_ sign_extend 24) lt!231021) #b00000000000000000000000000000000) (tuple2!13203 Unit!9331 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!231022) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3784 (buf!3480 lt!230276)) (bvadd (currentByte!6388 lt!230276) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!231021)))))))) (tuple2!13203 Unit!9332 lt!231022))) (BitStream!5289 (buf!3480 lt!230276) (bvadd (currentByte!6388 lt!230276) #b00000000000000000000000000000001) (currentBit!6383 lt!230276))))))

(assert (=> b!148228 (= lt!231022 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3784 (buf!3480 lt!230276)) (currentByte!6388 lt!230276))) ((_ sign_extend 24) lt!231021))))))

(assert (=> b!148228 (= lt!231021 ((_ extract 7 0) (currentBit!6383 lt!230276)))))

(declare-fun lt!231025 () (_ BitVec 64))

(declare-fun b!148229 () Bool)

(declare-fun lt!231026 () (_ BitVec 64))

(assert (=> b!148229 (= e!98862 (= (bitIndex!0 (size!3015 (buf!3480 (_2!6957 lt!231024))) (currentByte!6388 (_2!6957 lt!231024)) (currentBit!6383 (_2!6957 lt!231024))) (bvadd lt!231026 lt!231025)))))

(assert (=> b!148229 (or (not (= (bvand lt!231026 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!231025 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!231026 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!231026 lt!231025) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!148229 (= lt!231025 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!148229 (= lt!231026 (bitIndex!0 (size!3015 (buf!3480 lt!230276)) (currentByte!6388 lt!230276) (currentBit!6383 lt!230276)))))

(assert (= (and d!48177 res!124085) b!148228))

(assert (= (and b!148228 res!124084) b!148229))

(declare-fun m!229901 () Bool)

(assert (=> d!48177 m!229901))

(declare-fun m!229903 () Bool)

(assert (=> d!48177 m!229903))

(declare-fun m!229905 () Bool)

(assert (=> d!48177 m!229905))

(assert (=> b!148228 m!229905))

(assert (=> b!148228 m!229901))

(declare-fun m!229907 () Bool)

(assert (=> b!148229 m!229907))

(declare-fun m!229909 () Bool)

(assert (=> b!148229 m!229909))

(assert (=> d!47960 d!48177))

(declare-fun d!48179 () Bool)

(assert (=> d!48179 (= (remainingBits!0 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230272)))) ((_ sign_extend 32) (currentByte!6388 (_2!6953 lt!230272))) ((_ sign_extend 32) (currentBit!6383 (_2!6953 lt!230272)))) (bvsub (bvmul ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230272)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6388 (_2!6953 lt!230272))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6383 (_2!6953 lt!230272))))))))

(assert (=> d!47982 d!48179))

(declare-fun d!48181 () Bool)

(declare-fun res!124088 () Bool)

(declare-fun e!98865 () Bool)

(assert (=> d!48181 (=> (not res!124088) (not e!98865))))

(assert (=> d!48181 (= res!124088 (= (size!3015 (buf!3480 (_2!6955 lt!230583))) (size!3015 (buf!3480 (_2!6953 lt!230274)))))))

(assert (=> d!48181 (= (isPrefixOf!0 (_2!6955 lt!230583) (_2!6953 lt!230274)) e!98865)))

(declare-fun b!148230 () Bool)

(declare-fun res!124087 () Bool)

(assert (=> b!148230 (=> (not res!124087) (not e!98865))))

(assert (=> b!148230 (= res!124087 (bvsle (bitIndex!0 (size!3015 (buf!3480 (_2!6955 lt!230583))) (currentByte!6388 (_2!6955 lt!230583)) (currentBit!6383 (_2!6955 lt!230583))) (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230274))) (currentByte!6388 (_2!6953 lt!230274)) (currentBit!6383 (_2!6953 lt!230274)))))))

(declare-fun b!148231 () Bool)

(declare-fun e!98864 () Bool)

(assert (=> b!148231 (= e!98865 e!98864)))

(declare-fun res!124086 () Bool)

(assert (=> b!148231 (=> res!124086 e!98864)))

(assert (=> b!148231 (= res!124086 (= (size!3015 (buf!3480 (_2!6955 lt!230583))) #b00000000000000000000000000000000))))

(declare-fun b!148232 () Bool)

(assert (=> b!148232 (= e!98864 (arrayBitRangesEq!0 (buf!3480 (_2!6955 lt!230583)) (buf!3480 (_2!6953 lt!230274)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3015 (buf!3480 (_2!6955 lt!230583))) (currentByte!6388 (_2!6955 lt!230583)) (currentBit!6383 (_2!6955 lt!230583)))))))

(assert (= (and d!48181 res!124088) b!148230))

(assert (= (and b!148230 res!124087) b!148231))

(assert (= (and b!148231 (not res!124086)) b!148232))

(declare-fun m!229911 () Bool)

(assert (=> b!148230 m!229911))

(assert (=> b!148230 m!229273))

(assert (=> b!148232 m!229911))

(assert (=> b!148232 m!229911))

(declare-fun m!229913 () Bool)

(assert (=> b!148232 m!229913))

(assert (=> b!148038 d!48181))

(declare-fun d!48183 () Bool)

(assert (=> d!48183 (= (remainingBits!0 ((_ sign_extend 32) (size!3015 (buf!3480 (_1!6956 lt!230258)))) ((_ sign_extend 32) (currentByte!6388 (_1!6956 lt!230258))) ((_ sign_extend 32) (currentBit!6383 (_1!6956 lt!230258)))) (bvsub (bvmul ((_ sign_extend 32) (size!3015 (buf!3480 (_1!6956 lt!230258)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6388 (_1!6956 lt!230258))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6383 (_1!6956 lt!230258))))))))

(assert (=> d!47926 d!48183))

(declare-fun d!48185 () Bool)

(assert (=> d!48185 (= (invariant!0 (currentBit!6383 (_1!6956 lt!230258)) (currentByte!6388 (_1!6956 lt!230258)) (size!3015 (buf!3480 (_1!6956 lt!230258)))) (and (bvsge (currentBit!6383 (_1!6956 lt!230258)) #b00000000000000000000000000000000) (bvslt (currentBit!6383 (_1!6956 lt!230258)) #b00000000000000000000000000001000) (bvsge (currentByte!6388 (_1!6956 lt!230258)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6388 (_1!6956 lt!230258)) (size!3015 (buf!3480 (_1!6956 lt!230258)))) (and (= (currentBit!6383 (_1!6956 lt!230258)) #b00000000000000000000000000000000) (= (currentByte!6388 (_1!6956 lt!230258)) (size!3015 (buf!3480 (_1!6956 lt!230258))))))))))

(assert (=> d!47926 d!48185))

(declare-fun d!48187 () Bool)

(declare-fun res!124091 () Bool)

(declare-fun e!98867 () Bool)

(assert (=> d!48187 (=> (not res!124091) (not e!98867))))

(assert (=> d!48187 (= res!124091 (= (size!3015 (buf!3480 (_1!6955 lt!230335))) (size!3015 (buf!3480 thiss!1634))))))

(assert (=> d!48187 (= (isPrefixOf!0 (_1!6955 lt!230335) thiss!1634) e!98867)))

(declare-fun b!148233 () Bool)

(declare-fun res!124090 () Bool)

(assert (=> b!148233 (=> (not res!124090) (not e!98867))))

(assert (=> b!148233 (= res!124090 (bvsle (bitIndex!0 (size!3015 (buf!3480 (_1!6955 lt!230335))) (currentByte!6388 (_1!6955 lt!230335)) (currentBit!6383 (_1!6955 lt!230335))) (bitIndex!0 (size!3015 (buf!3480 thiss!1634)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634))))))

(declare-fun b!148234 () Bool)

(declare-fun e!98866 () Bool)

(assert (=> b!148234 (= e!98867 e!98866)))

(declare-fun res!124089 () Bool)

(assert (=> b!148234 (=> res!124089 e!98866)))

(assert (=> b!148234 (= res!124089 (= (size!3015 (buf!3480 (_1!6955 lt!230335))) #b00000000000000000000000000000000))))

(declare-fun b!148235 () Bool)

(assert (=> b!148235 (= e!98866 (arrayBitRangesEq!0 (buf!3480 (_1!6955 lt!230335)) (buf!3480 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3015 (buf!3480 (_1!6955 lt!230335))) (currentByte!6388 (_1!6955 lt!230335)) (currentBit!6383 (_1!6955 lt!230335)))))))

(assert (= (and d!48187 res!124091) b!148233))

(assert (= (and b!148233 res!124090) b!148234))

(assert (= (and b!148234 (not res!124089)) b!148235))

(declare-fun m!229915 () Bool)

(assert (=> b!148233 m!229915))

(assert (=> b!148233 m!229207))

(assert (=> b!148235 m!229915))

(assert (=> b!148235 m!229915))

(declare-fun m!229917 () Bool)

(assert (=> b!148235 m!229917))

(assert (=> b!147948 d!48187))

(declare-fun d!48189 () Bool)

(assert (=> d!48189 (= (remainingBits!0 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230274)))) ((_ sign_extend 32) (currentByte!6388 thiss!1634)) ((_ sign_extend 32) (currentBit!6383 thiss!1634))) (bvsub (bvmul ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230274)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6388 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6383 thiss!1634)))))))

(assert (=> d!47968 d!48189))

(declare-fun d!48191 () Bool)

(declare-fun res!124103 () Bool)

(declare-fun e!98885 () Bool)

(assert (=> d!48191 (=> res!124103 e!98885)))

(assert (=> d!48191 (= res!124103 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230272))) (currentByte!6388 (_2!6953 lt!230272)) (currentBit!6383 (_2!6953 lt!230272)))))))

(assert (=> d!48191 (= (arrayBitRangesEq!0 (buf!3480 (_2!6953 lt!230272)) (buf!3480 (_2!6953 lt!230274)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230272))) (currentByte!6388 (_2!6953 lt!230272)) (currentBit!6383 (_2!6953 lt!230272)))) e!98885)))

(declare-fun b!148250 () Bool)

(declare-fun e!98880 () Bool)

(declare-fun e!98883 () Bool)

(assert (=> b!148250 (= e!98880 e!98883)))

(declare-datatypes ((tuple4!142 0))(
  ( (tuple4!143 (_1!6964 (_ BitVec 32)) (_2!6964 (_ BitVec 32)) (_3!362 (_ BitVec 32)) (_4!71 (_ BitVec 32))) )
))
(declare-fun lt!231034 () tuple4!142)

(declare-fun lt!231033 () (_ BitVec 32))

(declare-fun res!124102 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!148250 (= res!124102 (byteRangesEq!0 (select (arr!3784 (buf!3480 (_2!6953 lt!230272))) (_3!362 lt!231034)) (select (arr!3784 (buf!3480 (_2!6953 lt!230274))) (_3!362 lt!231034)) lt!231033 #b00000000000000000000000000001000))))

(assert (=> b!148250 (=> (not res!124102) (not e!98883))))

(declare-fun lt!231035 () (_ BitVec 32))

(declare-fun c!8012 () Bool)

(declare-fun call!2001 () Bool)

(declare-fun bm!1998 () Bool)

(assert (=> bm!1998 (= call!2001 (byteRangesEq!0 (ite c!8012 (select (arr!3784 (buf!3480 (_2!6953 lt!230272))) (_3!362 lt!231034)) (select (arr!3784 (buf!3480 (_2!6953 lt!230272))) (_4!71 lt!231034))) (ite c!8012 (select (arr!3784 (buf!3480 (_2!6953 lt!230274))) (_3!362 lt!231034)) (select (arr!3784 (buf!3480 (_2!6953 lt!230274))) (_4!71 lt!231034))) (ite c!8012 lt!231033 #b00000000000000000000000000000000) lt!231035))))

(declare-fun b!148251 () Bool)

(declare-fun res!124104 () Bool)

(assert (=> b!148251 (= res!124104 (= lt!231035 #b00000000000000000000000000000000))))

(declare-fun e!98882 () Bool)

(assert (=> b!148251 (=> res!124104 e!98882)))

(assert (=> b!148251 (= e!98883 e!98882)))

(declare-fun b!148252 () Bool)

(declare-fun e!98884 () Bool)

(assert (=> b!148252 (= e!98885 e!98884)))

(declare-fun res!124105 () Bool)

(assert (=> b!148252 (=> (not res!124105) (not e!98884))))

(declare-fun e!98881 () Bool)

(assert (=> b!148252 (= res!124105 e!98881)))

(declare-fun res!124106 () Bool)

(assert (=> b!148252 (=> res!124106 e!98881)))

(assert (=> b!148252 (= res!124106 (bvsge (_1!6964 lt!231034) (_2!6964 lt!231034)))))

(assert (=> b!148252 (= lt!231035 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230272))) (currentByte!6388 (_2!6953 lt!230272)) (currentBit!6383 (_2!6953 lt!230272))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!148252 (= lt!231033 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!142)

(assert (=> b!148252 (= lt!231034 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230272))) (currentByte!6388 (_2!6953 lt!230272)) (currentBit!6383 (_2!6953 lt!230272)))))))

(declare-fun b!148253 () Bool)

(assert (=> b!148253 (= e!98882 call!2001)))

(declare-fun b!148254 () Bool)

(assert (=> b!148254 (= e!98884 e!98880)))

(assert (=> b!148254 (= c!8012 (= (_3!362 lt!231034) (_4!71 lt!231034)))))

(declare-fun b!148255 () Bool)

(assert (=> b!148255 (= e!98881 (arrayRangesEq!331 (buf!3480 (_2!6953 lt!230272)) (buf!3480 (_2!6953 lt!230274)) (_1!6964 lt!231034) (_2!6964 lt!231034)))))

(declare-fun b!148256 () Bool)

(assert (=> b!148256 (= e!98880 call!2001)))

(assert (= (and d!48191 (not res!124103)) b!148252))

(assert (= (and b!148252 (not res!124106)) b!148255))

(assert (= (and b!148252 res!124105) b!148254))

(assert (= (and b!148254 c!8012) b!148256))

(assert (= (and b!148254 (not c!8012)) b!148250))

(assert (= (and b!148250 res!124102) b!148251))

(assert (= (and b!148251 (not res!124104)) b!148253))

(assert (= (or b!148256 b!148253) bm!1998))

(declare-fun m!229919 () Bool)

(assert (=> b!148250 m!229919))

(declare-fun m!229921 () Bool)

(assert (=> b!148250 m!229921))

(assert (=> b!148250 m!229919))

(assert (=> b!148250 m!229921))

(declare-fun m!229923 () Bool)

(assert (=> b!148250 m!229923))

(declare-fun m!229925 () Bool)

(assert (=> bm!1998 m!229925))

(declare-fun m!229927 () Bool)

(assert (=> bm!1998 m!229927))

(assert (=> bm!1998 m!229921))

(declare-fun m!229929 () Bool)

(assert (=> bm!1998 m!229929))

(assert (=> bm!1998 m!229919))

(assert (=> b!148252 m!229205))

(declare-fun m!229931 () Bool)

(assert (=> b!148252 m!229931))

(declare-fun m!229933 () Bool)

(assert (=> b!148255 m!229933))

(assert (=> b!147960 d!48191))

(assert (=> b!147960 d!48009))

(declare-fun d!48193 () Bool)

(declare-fun lt!231036 () (_ BitVec 8))

(declare-fun lt!231039 () (_ BitVec 8))

(assert (=> d!48193 (= lt!231036 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3784 (buf!3480 (_1!6955 lt!230255))) (currentByte!6388 (_1!6955 lt!230255)))) ((_ sign_extend 24) lt!231039))))))

(assert (=> d!48193 (= lt!231039 ((_ extract 7 0) (currentBit!6383 (_1!6955 lt!230255))))))

(declare-fun e!98887 () Bool)

(assert (=> d!48193 e!98887))

(declare-fun res!124108 () Bool)

(assert (=> d!48193 (=> (not res!124108) (not e!98887))))

(assert (=> d!48193 (= res!124108 (validate_offset_bits!1 ((_ sign_extend 32) (size!3015 (buf!3480 (_1!6955 lt!230255)))) ((_ sign_extend 32) (currentByte!6388 (_1!6955 lt!230255))) ((_ sign_extend 32) (currentBit!6383 (_1!6955 lt!230255))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!9333 () Unit!9318)

(declare-fun Unit!9334 () Unit!9318)

(assert (=> d!48193 (= (readByte!0 (_1!6955 lt!230255)) (tuple2!13197 (_2!6963 (ite (bvsgt ((_ sign_extend 24) lt!231039) #b00000000000000000000000000000000) (tuple2!13203 Unit!9333 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!231036) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3784 (buf!3480 (_1!6955 lt!230255))) (bvadd (currentByte!6388 (_1!6955 lt!230255)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!231039)))))))) (tuple2!13203 Unit!9334 lt!231036))) (BitStream!5289 (buf!3480 (_1!6955 lt!230255)) (bvadd (currentByte!6388 (_1!6955 lt!230255)) #b00000000000000000000000000000001) (currentBit!6383 (_1!6955 lt!230255)))))))

(declare-fun b!148257 () Bool)

(declare-fun e!98886 () Bool)

(assert (=> b!148257 (= e!98887 e!98886)))

(declare-fun res!124107 () Bool)

(assert (=> b!148257 (=> (not res!124107) (not e!98886))))

(declare-fun lt!231040 () tuple2!13196)

(assert (=> b!148257 (= res!124107 (= (buf!3480 (_2!6957 lt!231040)) (buf!3480 (_1!6955 lt!230255))))))

(declare-fun lt!231038 () (_ BitVec 8))

(declare-fun lt!231037 () (_ BitVec 8))

(declare-fun Unit!9335 () Unit!9318)

(declare-fun Unit!9336 () Unit!9318)

(assert (=> b!148257 (= lt!231040 (tuple2!13197 (_2!6963 (ite (bvsgt ((_ sign_extend 24) lt!231037) #b00000000000000000000000000000000) (tuple2!13203 Unit!9335 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!231038) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3784 (buf!3480 (_1!6955 lt!230255))) (bvadd (currentByte!6388 (_1!6955 lt!230255)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!231037)))))))) (tuple2!13203 Unit!9336 lt!231038))) (BitStream!5289 (buf!3480 (_1!6955 lt!230255)) (bvadd (currentByte!6388 (_1!6955 lt!230255)) #b00000000000000000000000000000001) (currentBit!6383 (_1!6955 lt!230255)))))))

(assert (=> b!148257 (= lt!231038 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3784 (buf!3480 (_1!6955 lt!230255))) (currentByte!6388 (_1!6955 lt!230255)))) ((_ sign_extend 24) lt!231037))))))

(assert (=> b!148257 (= lt!231037 ((_ extract 7 0) (currentBit!6383 (_1!6955 lt!230255))))))

(declare-fun lt!231041 () (_ BitVec 64))

(declare-fun b!148258 () Bool)

(declare-fun lt!231042 () (_ BitVec 64))

(assert (=> b!148258 (= e!98886 (= (bitIndex!0 (size!3015 (buf!3480 (_2!6957 lt!231040))) (currentByte!6388 (_2!6957 lt!231040)) (currentBit!6383 (_2!6957 lt!231040))) (bvadd lt!231042 lt!231041)))))

(assert (=> b!148258 (or (not (= (bvand lt!231042 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!231041 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!231042 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!231042 lt!231041) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!148258 (= lt!231041 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!148258 (= lt!231042 (bitIndex!0 (size!3015 (buf!3480 (_1!6955 lt!230255))) (currentByte!6388 (_1!6955 lt!230255)) (currentBit!6383 (_1!6955 lt!230255))))))

(assert (= (and d!48193 res!124108) b!148257))

(assert (= (and b!148257 res!124107) b!148258))

(declare-fun m!229935 () Bool)

(assert (=> d!48193 m!229935))

(declare-fun m!229937 () Bool)

(assert (=> d!48193 m!229937))

(declare-fun m!229939 () Bool)

(assert (=> d!48193 m!229939))

(assert (=> b!148257 m!229939))

(assert (=> b!148257 m!229935))

(declare-fun m!229941 () Bool)

(assert (=> b!148258 m!229941))

(declare-fun m!229943 () Bool)

(assert (=> b!148258 m!229943))

(assert (=> d!47958 d!48193))

(declare-fun d!48195 () Bool)

(declare-fun res!124111 () Bool)

(declare-fun e!98889 () Bool)

(assert (=> d!48195 (=> (not res!124111) (not e!98889))))

(assert (=> d!48195 (= res!124111 (= (size!3015 (buf!3480 (_2!6955 lt!230559))) (size!3015 (buf!3480 (_2!6953 lt!230274)))))))

(assert (=> d!48195 (= (isPrefixOf!0 (_2!6955 lt!230559) (_2!6953 lt!230274)) e!98889)))

(declare-fun b!148259 () Bool)

(declare-fun res!124110 () Bool)

(assert (=> b!148259 (=> (not res!124110) (not e!98889))))

(assert (=> b!148259 (= res!124110 (bvsle (bitIndex!0 (size!3015 (buf!3480 (_2!6955 lt!230559))) (currentByte!6388 (_2!6955 lt!230559)) (currentBit!6383 (_2!6955 lt!230559))) (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230274))) (currentByte!6388 (_2!6953 lt!230274)) (currentBit!6383 (_2!6953 lt!230274)))))))

(declare-fun b!148260 () Bool)

(declare-fun e!98888 () Bool)

(assert (=> b!148260 (= e!98889 e!98888)))

(declare-fun res!124109 () Bool)

(assert (=> b!148260 (=> res!124109 e!98888)))

(assert (=> b!148260 (= res!124109 (= (size!3015 (buf!3480 (_2!6955 lt!230559))) #b00000000000000000000000000000000))))

(declare-fun b!148261 () Bool)

(assert (=> b!148261 (= e!98888 (arrayBitRangesEq!0 (buf!3480 (_2!6955 lt!230559)) (buf!3480 (_2!6953 lt!230274)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3015 (buf!3480 (_2!6955 lt!230559))) (currentByte!6388 (_2!6955 lt!230559)) (currentBit!6383 (_2!6955 lt!230559)))))))

(assert (= (and d!48195 res!124111) b!148259))

(assert (= (and b!148259 res!124110) b!148260))

(assert (= (and b!148260 (not res!124109)) b!148261))

(declare-fun m!229945 () Bool)

(assert (=> b!148259 m!229945))

(assert (=> b!148259 m!229273))

(assert (=> b!148261 m!229945))

(assert (=> b!148261 m!229945))

(declare-fun m!229947 () Bool)

(assert (=> b!148261 m!229947))

(assert (=> b!148028 d!48195))

(declare-fun d!48197 () Bool)

(declare-fun res!124113 () Bool)

(declare-fun e!98895 () Bool)

(assert (=> d!48197 (=> res!124113 e!98895)))

(assert (=> d!48197 (= res!124113 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3015 (buf!3480 thiss!1634)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634))))))

(assert (=> d!48197 (= (arrayBitRangesEq!0 (buf!3480 thiss!1634) (buf!3480 (_2!6953 lt!230274)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3015 (buf!3480 thiss!1634)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634))) e!98895)))

(declare-fun b!148262 () Bool)

(declare-fun e!98890 () Bool)

(declare-fun e!98893 () Bool)

(assert (=> b!148262 (= e!98890 e!98893)))

(declare-fun lt!231043 () (_ BitVec 32))

(declare-fun lt!231044 () tuple4!142)

(declare-fun res!124112 () Bool)

(assert (=> b!148262 (= res!124112 (byteRangesEq!0 (select (arr!3784 (buf!3480 thiss!1634)) (_3!362 lt!231044)) (select (arr!3784 (buf!3480 (_2!6953 lt!230274))) (_3!362 lt!231044)) lt!231043 #b00000000000000000000000000001000))))

(assert (=> b!148262 (=> (not res!124112) (not e!98893))))

(declare-fun call!2002 () Bool)

(declare-fun bm!1999 () Bool)

(declare-fun c!8013 () Bool)

(declare-fun lt!231045 () (_ BitVec 32))

(assert (=> bm!1999 (= call!2002 (byteRangesEq!0 (ite c!8013 (select (arr!3784 (buf!3480 thiss!1634)) (_3!362 lt!231044)) (select (arr!3784 (buf!3480 thiss!1634)) (_4!71 lt!231044))) (ite c!8013 (select (arr!3784 (buf!3480 (_2!6953 lt!230274))) (_3!362 lt!231044)) (select (arr!3784 (buf!3480 (_2!6953 lt!230274))) (_4!71 lt!231044))) (ite c!8013 lt!231043 #b00000000000000000000000000000000) lt!231045))))

(declare-fun b!148263 () Bool)

(declare-fun res!124114 () Bool)

(assert (=> b!148263 (= res!124114 (= lt!231045 #b00000000000000000000000000000000))))

(declare-fun e!98892 () Bool)

(assert (=> b!148263 (=> res!124114 e!98892)))

(assert (=> b!148263 (= e!98893 e!98892)))

(declare-fun b!148264 () Bool)

(declare-fun e!98894 () Bool)

(assert (=> b!148264 (= e!98895 e!98894)))

(declare-fun res!124115 () Bool)

(assert (=> b!148264 (=> (not res!124115) (not e!98894))))

(declare-fun e!98891 () Bool)

(assert (=> b!148264 (= res!124115 e!98891)))

(declare-fun res!124116 () Bool)

(assert (=> b!148264 (=> res!124116 e!98891)))

(assert (=> b!148264 (= res!124116 (bvsge (_1!6964 lt!231044) (_2!6964 lt!231044)))))

(assert (=> b!148264 (= lt!231045 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3015 (buf!3480 thiss!1634)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!148264 (= lt!231043 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!148264 (= lt!231044 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3015 (buf!3480 thiss!1634)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634))))))

(declare-fun b!148265 () Bool)

(assert (=> b!148265 (= e!98892 call!2002)))

(declare-fun b!148266 () Bool)

(assert (=> b!148266 (= e!98894 e!98890)))

(assert (=> b!148266 (= c!8013 (= (_3!362 lt!231044) (_4!71 lt!231044)))))

(declare-fun b!148267 () Bool)

(assert (=> b!148267 (= e!98891 (arrayRangesEq!331 (buf!3480 thiss!1634) (buf!3480 (_2!6953 lt!230274)) (_1!6964 lt!231044) (_2!6964 lt!231044)))))

(declare-fun b!148268 () Bool)

(assert (=> b!148268 (= e!98890 call!2002)))

(assert (= (and d!48197 (not res!124113)) b!148264))

(assert (= (and b!148264 (not res!124116)) b!148267))

(assert (= (and b!148264 res!124115) b!148266))

(assert (= (and b!148266 c!8013) b!148268))

(assert (= (and b!148266 (not c!8013)) b!148262))

(assert (= (and b!148262 res!124112) b!148263))

(assert (= (and b!148263 (not res!124114)) b!148265))

(assert (= (or b!148268 b!148265) bm!1999))

(declare-fun m!229949 () Bool)

(assert (=> b!148262 m!229949))

(declare-fun m!229951 () Bool)

(assert (=> b!148262 m!229951))

(assert (=> b!148262 m!229949))

(assert (=> b!148262 m!229951))

(declare-fun m!229953 () Bool)

(assert (=> b!148262 m!229953))

(declare-fun m!229955 () Bool)

(assert (=> bm!1999 m!229955))

(declare-fun m!229957 () Bool)

(assert (=> bm!1999 m!229957))

(assert (=> bm!1999 m!229951))

(declare-fun m!229959 () Bool)

(assert (=> bm!1999 m!229959))

(assert (=> bm!1999 m!229949))

(assert (=> b!148264 m!229207))

(declare-fun m!229961 () Bool)

(assert (=> b!148264 m!229961))

(declare-fun m!229963 () Bool)

(assert (=> b!148267 m!229963))

(assert (=> b!148033 d!48197))

(assert (=> b!148033 d!48013))

(declare-fun d!48199 () Bool)

(declare-fun e!98898 () Bool)

(assert (=> d!48199 e!98898))

(declare-fun res!124119 () Bool)

(assert (=> d!48199 (=> (not res!124119) (not e!98898))))

(declare-fun moveByteIndexPrecond!0 (BitStream!5288 (_ BitVec 32)) Bool)

(assert (=> d!48199 (= res!124119 (moveByteIndexPrecond!0 (_1!6955 lt!230255) #b00000000000000000000000000000001))))

(declare-fun Unit!9337 () Unit!9318)

(assert (=> d!48199 (= (moveByteIndex!0 (_1!6955 lt!230255) #b00000000000000000000000000000001) (tuple2!13189 Unit!9337 (BitStream!5289 (buf!3480 (_1!6955 lt!230255)) (bvadd (currentByte!6388 (_1!6955 lt!230255)) #b00000000000000000000000000000001) (currentBit!6383 (_1!6955 lt!230255)))))))

(declare-fun b!148271 () Bool)

(assert (=> b!148271 (= e!98898 (and (or (not (= (bvand (currentByte!6388 (_1!6955 lt!230255)) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6388 (_1!6955 lt!230255)) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6388 (_1!6955 lt!230255)) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6388 (_1!6955 lt!230255)) #b00000000000000000000000000000001) (bvadd (currentByte!6388 (_1!6955 lt!230255)) #b00000000000000000000000000000001))))))

(assert (= (and d!48199 res!124119) b!148271))

(declare-fun m!229965 () Bool)

(assert (=> d!48199 m!229965))

(assert (=> d!47989 d!48199))

(declare-fun d!48201 () Bool)

(declare-fun res!124120 () Bool)

(declare-fun e!98899 () Bool)

(assert (=> d!48201 (=> res!124120 e!98899)))

(assert (=> d!48201 (= res!124120 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!48201 (= (arrayRangesEq!331 (_2!6954 lt!230351) (_2!6954 lt!230353) #b00000000000000000000000000000000 to!404) e!98899)))

(declare-fun b!148272 () Bool)

(declare-fun e!98900 () Bool)

(assert (=> b!148272 (= e!98899 e!98900)))

(declare-fun res!124121 () Bool)

(assert (=> b!148272 (=> (not res!124121) (not e!98900))))

(assert (=> b!148272 (= res!124121 (= (select (arr!3784 (_2!6954 lt!230351)) #b00000000000000000000000000000000) (select (arr!3784 (_2!6954 lt!230353)) #b00000000000000000000000000000000)))))

(declare-fun b!148273 () Bool)

(assert (=> b!148273 (= e!98900 (arrayRangesEq!331 (_2!6954 lt!230351) (_2!6954 lt!230353) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48201 (not res!124120)) b!148272))

(assert (= (and b!148272 res!124121) b!148273))

(declare-fun m!229967 () Bool)

(assert (=> b!148272 m!229967))

(declare-fun m!229969 () Bool)

(assert (=> b!148272 m!229969))

(declare-fun m!229971 () Bool)

(assert (=> b!148273 m!229971))

(assert (=> d!47922 d!48201))

(declare-fun d!48203 () Bool)

(assert (=> d!48203 (arrayRangesEq!331 (_2!6954 (readByteArrayLoopPure!0 (_1!6955 lt!230255) arr!237 from!447 to!404)) (_2!6954 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6955 lt!230255) #b00000000000000000000000000000001) (array!6664 (store (arr!3784 arr!237) from!447 (_2!6956 (readBytePure!0 (_1!6955 lt!230255)))) (size!3015 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404)) #b00000000000000000000000000000000 to!404)))

(assert (=> d!48203 true))

(declare-fun _$13!67 () Unit!9318)

(assert (=> d!48203 (= (choose!35 (_1!6955 lt!230255) arr!237 from!447 to!404 lt!230351 (_2!6954 lt!230351) lt!230352 lt!230353 (_2!6954 lt!230353)) _$13!67)))

(declare-fun bs!11775 () Bool)

(assert (= bs!11775 d!48203))

(assert (=> bs!11775 m!229247))

(declare-fun m!229973 () Bool)

(assert (=> bs!11775 m!229973))

(assert (=> bs!11775 m!229259))

(assert (=> bs!11775 m!229223))

(assert (=> bs!11775 m!229247))

(declare-fun m!229975 () Bool)

(assert (=> bs!11775 m!229975))

(assert (=> bs!11775 m!229331))

(assert (=> d!47922 d!48203))

(assert (=> d!47922 d!47958))

(assert (=> d!47922 d!47989))

(declare-fun lt!231046 () tuple3!576)

(declare-fun d!48205 () Bool)

(assert (=> d!48205 (= lt!231046 (readByteArrayLoop!0 lt!230352 (array!6664 (store (arr!3784 arr!237) from!447 (_2!6956 (readBytePure!0 (_1!6955 lt!230255)))) (size!3015 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!48205 (= (readByteArrayLoopPure!0 lt!230352 (array!6664 (store (arr!3784 arr!237) from!447 (_2!6956 (readBytePure!0 (_1!6955 lt!230255)))) (size!3015 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404) (tuple2!13191 (_2!6958 lt!231046) (_3!359 lt!231046)))))

(declare-fun bs!11776 () Bool)

(assert (= bs!11776 d!48205))

(declare-fun m!229977 () Bool)

(assert (=> bs!11776 m!229977))

(assert (=> d!47922 d!48205))

(assert (=> d!47922 d!47970))

(assert (=> b!147950 d!48013))

(declare-fun d!48207 () Bool)

(assert (=> d!48207 (arrayBitRangesEq!0 (buf!3480 (_2!6953 lt!230272)) (buf!3480 thiss!1634) lt!230337 lt!230324)))

(declare-fun lt!231049 () Unit!9318)

(declare-fun choose!8 (array!6663 array!6663 (_ BitVec 64) (_ BitVec 64)) Unit!9318)

(assert (=> d!48207 (= lt!231049 (choose!8 (buf!3480 thiss!1634) (buf!3480 (_2!6953 lt!230272)) lt!230337 lt!230324))))

(assert (=> d!48207 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!230337) (bvsle lt!230337 lt!230324))))

(assert (=> d!48207 (= (arrayBitRangesEqSymmetric!0 (buf!3480 thiss!1634) (buf!3480 (_2!6953 lt!230272)) lt!230337 lt!230324) lt!231049)))

(declare-fun bs!11777 () Bool)

(assert (= bs!11777 d!48207))

(assert (=> bs!11777 m!229299))

(declare-fun m!229979 () Bool)

(assert (=> bs!11777 m!229979))

(assert (=> b!147950 d!48207))

(declare-fun d!48209 () Bool)

(declare-fun res!124123 () Bool)

(declare-fun e!98906 () Bool)

(assert (=> d!48209 (=> res!124123 e!98906)))

(assert (=> d!48209 (= res!124123 (bvsge lt!230337 lt!230324))))

(assert (=> d!48209 (= (arrayBitRangesEq!0 (buf!3480 (_2!6953 lt!230272)) (buf!3480 thiss!1634) lt!230337 lt!230324) e!98906)))

(declare-fun b!148274 () Bool)

(declare-fun e!98901 () Bool)

(declare-fun e!98904 () Bool)

(assert (=> b!148274 (= e!98901 e!98904)))

(declare-fun lt!231050 () (_ BitVec 32))

(declare-fun res!124122 () Bool)

(declare-fun lt!231051 () tuple4!142)

(assert (=> b!148274 (= res!124122 (byteRangesEq!0 (select (arr!3784 (buf!3480 (_2!6953 lt!230272))) (_3!362 lt!231051)) (select (arr!3784 (buf!3480 thiss!1634)) (_3!362 lt!231051)) lt!231050 #b00000000000000000000000000001000))))

(assert (=> b!148274 (=> (not res!124122) (not e!98904))))

(declare-fun c!8014 () Bool)

(declare-fun lt!231052 () (_ BitVec 32))

(declare-fun call!2003 () Bool)

(declare-fun bm!2000 () Bool)

(assert (=> bm!2000 (= call!2003 (byteRangesEq!0 (ite c!8014 (select (arr!3784 (buf!3480 (_2!6953 lt!230272))) (_3!362 lt!231051)) (select (arr!3784 (buf!3480 (_2!6953 lt!230272))) (_4!71 lt!231051))) (ite c!8014 (select (arr!3784 (buf!3480 thiss!1634)) (_3!362 lt!231051)) (select (arr!3784 (buf!3480 thiss!1634)) (_4!71 lt!231051))) (ite c!8014 lt!231050 #b00000000000000000000000000000000) lt!231052))))

(declare-fun b!148275 () Bool)

(declare-fun res!124124 () Bool)

(assert (=> b!148275 (= res!124124 (= lt!231052 #b00000000000000000000000000000000))))

(declare-fun e!98903 () Bool)

(assert (=> b!148275 (=> res!124124 e!98903)))

(assert (=> b!148275 (= e!98904 e!98903)))

(declare-fun b!148276 () Bool)

(declare-fun e!98905 () Bool)

(assert (=> b!148276 (= e!98906 e!98905)))

(declare-fun res!124125 () Bool)

(assert (=> b!148276 (=> (not res!124125) (not e!98905))))

(declare-fun e!98902 () Bool)

(assert (=> b!148276 (= res!124125 e!98902)))

(declare-fun res!124126 () Bool)

(assert (=> b!148276 (=> res!124126 e!98902)))

(assert (=> b!148276 (= res!124126 (bvsge (_1!6964 lt!231051) (_2!6964 lt!231051)))))

(assert (=> b!148276 (= lt!231052 ((_ extract 31 0) (bvsrem lt!230324 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!148276 (= lt!231050 ((_ extract 31 0) (bvsrem lt!230337 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!148276 (= lt!231051 (arrayBitIndices!0 lt!230337 lt!230324))))

(declare-fun b!148277 () Bool)

(assert (=> b!148277 (= e!98903 call!2003)))

(declare-fun b!148278 () Bool)

(assert (=> b!148278 (= e!98905 e!98901)))

(assert (=> b!148278 (= c!8014 (= (_3!362 lt!231051) (_4!71 lt!231051)))))

(declare-fun b!148279 () Bool)

(assert (=> b!148279 (= e!98902 (arrayRangesEq!331 (buf!3480 (_2!6953 lt!230272)) (buf!3480 thiss!1634) (_1!6964 lt!231051) (_2!6964 lt!231051)))))

(declare-fun b!148280 () Bool)

(assert (=> b!148280 (= e!98901 call!2003)))

(assert (= (and d!48209 (not res!124123)) b!148276))

(assert (= (and b!148276 (not res!124126)) b!148279))

(assert (= (and b!148276 res!124125) b!148278))

(assert (= (and b!148278 c!8014) b!148280))

(assert (= (and b!148278 (not c!8014)) b!148274))

(assert (= (and b!148274 res!124122) b!148275))

(assert (= (and b!148275 (not res!124124)) b!148277))

(assert (= (or b!148280 b!148277) bm!2000))

(declare-fun m!229981 () Bool)

(assert (=> b!148274 m!229981))

(declare-fun m!229983 () Bool)

(assert (=> b!148274 m!229983))

(assert (=> b!148274 m!229981))

(assert (=> b!148274 m!229983))

(declare-fun m!229985 () Bool)

(assert (=> b!148274 m!229985))

(declare-fun m!229987 () Bool)

(assert (=> bm!2000 m!229987))

(declare-fun m!229989 () Bool)

(assert (=> bm!2000 m!229989))

(assert (=> bm!2000 m!229983))

(declare-fun m!229991 () Bool)

(assert (=> bm!2000 m!229991))

(assert (=> bm!2000 m!229981))

(declare-fun m!229993 () Bool)

(assert (=> b!148276 m!229993))

(declare-fun m!229995 () Bool)

(assert (=> b!148279 m!229995))

(assert (=> b!147950 d!48209))

(declare-fun d!48211 () Bool)

(declare-fun lt!231053 () (_ BitVec 8))

(declare-fun lt!231056 () (_ BitVec 8))

(assert (=> d!48211 (= lt!231053 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3784 (buf!3480 (_1!6955 lt!230264))) (currentByte!6388 (_1!6955 lt!230264)))) ((_ sign_extend 24) lt!231056))))))

(assert (=> d!48211 (= lt!231056 ((_ extract 7 0) (currentBit!6383 (_1!6955 lt!230264))))))

(declare-fun e!98908 () Bool)

(assert (=> d!48211 e!98908))

(declare-fun res!124128 () Bool)

(assert (=> d!48211 (=> (not res!124128) (not e!98908))))

(assert (=> d!48211 (= res!124128 (validate_offset_bits!1 ((_ sign_extend 32) (size!3015 (buf!3480 (_1!6955 lt!230264)))) ((_ sign_extend 32) (currentByte!6388 (_1!6955 lt!230264))) ((_ sign_extend 32) (currentBit!6383 (_1!6955 lt!230264))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!9338 () Unit!9318)

(declare-fun Unit!9339 () Unit!9318)

(assert (=> d!48211 (= (readByte!0 (_1!6955 lt!230264)) (tuple2!13197 (_2!6963 (ite (bvsgt ((_ sign_extend 24) lt!231056) #b00000000000000000000000000000000) (tuple2!13203 Unit!9338 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!231053) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3784 (buf!3480 (_1!6955 lt!230264))) (bvadd (currentByte!6388 (_1!6955 lt!230264)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!231056)))))))) (tuple2!13203 Unit!9339 lt!231053))) (BitStream!5289 (buf!3480 (_1!6955 lt!230264)) (bvadd (currentByte!6388 (_1!6955 lt!230264)) #b00000000000000000000000000000001) (currentBit!6383 (_1!6955 lt!230264)))))))

(declare-fun b!148281 () Bool)

(declare-fun e!98907 () Bool)

(assert (=> b!148281 (= e!98908 e!98907)))

(declare-fun res!124127 () Bool)

(assert (=> b!148281 (=> (not res!124127) (not e!98907))))

(declare-fun lt!231057 () tuple2!13196)

(assert (=> b!148281 (= res!124127 (= (buf!3480 (_2!6957 lt!231057)) (buf!3480 (_1!6955 lt!230264))))))

(declare-fun lt!231055 () (_ BitVec 8))

(declare-fun lt!231054 () (_ BitVec 8))

(declare-fun Unit!9340 () Unit!9318)

(declare-fun Unit!9341 () Unit!9318)

(assert (=> b!148281 (= lt!231057 (tuple2!13197 (_2!6963 (ite (bvsgt ((_ sign_extend 24) lt!231054) #b00000000000000000000000000000000) (tuple2!13203 Unit!9340 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!231055) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3784 (buf!3480 (_1!6955 lt!230264))) (bvadd (currentByte!6388 (_1!6955 lt!230264)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!231054)))))))) (tuple2!13203 Unit!9341 lt!231055))) (BitStream!5289 (buf!3480 (_1!6955 lt!230264)) (bvadd (currentByte!6388 (_1!6955 lt!230264)) #b00000000000000000000000000000001) (currentBit!6383 (_1!6955 lt!230264)))))))

(assert (=> b!148281 (= lt!231055 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3784 (buf!3480 (_1!6955 lt!230264))) (currentByte!6388 (_1!6955 lt!230264)))) ((_ sign_extend 24) lt!231054))))))

(assert (=> b!148281 (= lt!231054 ((_ extract 7 0) (currentBit!6383 (_1!6955 lt!230264))))))

(declare-fun b!148282 () Bool)

(declare-fun lt!231058 () (_ BitVec 64))

(declare-fun lt!231059 () (_ BitVec 64))

(assert (=> b!148282 (= e!98907 (= (bitIndex!0 (size!3015 (buf!3480 (_2!6957 lt!231057))) (currentByte!6388 (_2!6957 lt!231057)) (currentBit!6383 (_2!6957 lt!231057))) (bvadd lt!231059 lt!231058)))))

(assert (=> b!148282 (or (not (= (bvand lt!231059 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!231058 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!231059 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!231059 lt!231058) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!148282 (= lt!231058 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!148282 (= lt!231059 (bitIndex!0 (size!3015 (buf!3480 (_1!6955 lt!230264))) (currentByte!6388 (_1!6955 lt!230264)) (currentBit!6383 (_1!6955 lt!230264))))))

(assert (= (and d!48211 res!124128) b!148281))

(assert (= (and b!148281 res!124127) b!148282))

(declare-fun m!229997 () Bool)

(assert (=> d!48211 m!229997))

(declare-fun m!229999 () Bool)

(assert (=> d!48211 m!229999))

(declare-fun m!230001 () Bool)

(assert (=> d!48211 m!230001))

(assert (=> b!148281 m!230001))

(assert (=> b!148281 m!229997))

(declare-fun m!230003 () Bool)

(assert (=> b!148282 m!230003))

(declare-fun m!230005 () Bool)

(assert (=> b!148282 m!230005))

(assert (=> d!47916 d!48211))

(assert (=> b!148031 d!48013))

(assert (=> b!148031 d!48022))

(declare-fun d!48213 () Bool)

(declare-fun res!124131 () Bool)

(declare-fun e!98910 () Bool)

(assert (=> d!48213 (=> (not res!124131) (not e!98910))))

(assert (=> d!48213 (= res!124131 (= (size!3015 (buf!3480 (_1!6955 lt!230559))) (size!3015 (buf!3480 (_2!6953 lt!230272)))))))

(assert (=> d!48213 (= (isPrefixOf!0 (_1!6955 lt!230559) (_2!6953 lt!230272)) e!98910)))

(declare-fun b!148283 () Bool)

(declare-fun res!124130 () Bool)

(assert (=> b!148283 (=> (not res!124130) (not e!98910))))

(assert (=> b!148283 (= res!124130 (bvsle (bitIndex!0 (size!3015 (buf!3480 (_1!6955 lt!230559))) (currentByte!6388 (_1!6955 lt!230559)) (currentBit!6383 (_1!6955 lt!230559))) (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230272))) (currentByte!6388 (_2!6953 lt!230272)) (currentBit!6383 (_2!6953 lt!230272)))))))

(declare-fun b!148284 () Bool)

(declare-fun e!98909 () Bool)

(assert (=> b!148284 (= e!98910 e!98909)))

(declare-fun res!124129 () Bool)

(assert (=> b!148284 (=> res!124129 e!98909)))

(assert (=> b!148284 (= res!124129 (= (size!3015 (buf!3480 (_1!6955 lt!230559))) #b00000000000000000000000000000000))))

(declare-fun b!148285 () Bool)

(assert (=> b!148285 (= e!98909 (arrayBitRangesEq!0 (buf!3480 (_1!6955 lt!230559)) (buf!3480 (_2!6953 lt!230272)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3015 (buf!3480 (_1!6955 lt!230559))) (currentByte!6388 (_1!6955 lt!230559)) (currentBit!6383 (_1!6955 lt!230559)))))))

(assert (= (and d!48213 res!124131) b!148283))

(assert (= (and b!148283 res!124130) b!148284))

(assert (= (and b!148284 (not res!124129)) b!148285))

(declare-fun m!230007 () Bool)

(assert (=> b!148283 m!230007))

(assert (=> b!148283 m!229205))

(assert (=> b!148285 m!230007))

(assert (=> b!148285 m!230007))

(declare-fun m!230009 () Bool)

(assert (=> b!148285 m!230009))

(assert (=> b!148025 d!48213))

(declare-fun d!48215 () Bool)

(declare-fun res!124132 () Bool)

(declare-fun e!98911 () Bool)

(assert (=> d!48215 (=> res!124132 e!98911)))

(assert (=> d!48215 (= res!124132 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!48215 (= (arrayRangesEq!331 arr!237 (_2!6954 lt!230507) #b00000000000000000000000000000000 to!404) e!98911)))

(declare-fun b!148286 () Bool)

(declare-fun e!98912 () Bool)

(assert (=> b!148286 (= e!98911 e!98912)))

(declare-fun res!124133 () Bool)

(assert (=> b!148286 (=> (not res!124133) (not e!98912))))

(assert (=> b!148286 (= res!124133 (= (select (arr!3784 arr!237) #b00000000000000000000000000000000) (select (arr!3784 (_2!6954 lt!230507)) #b00000000000000000000000000000000)))))

(declare-fun b!148287 () Bool)

(assert (=> b!148287 (= e!98912 (arrayRangesEq!331 arr!237 (_2!6954 lt!230507) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48215 (not res!124132)) b!148286))

(assert (= (and b!148286 res!124133) b!148287))

(assert (=> b!148286 m!229287))

(declare-fun m!230011 () Bool)

(assert (=> b!148286 m!230011))

(declare-fun m!230013 () Bool)

(assert (=> b!148287 m!230013))

(assert (=> b!148010 d!48215))

(assert (=> b!148061 d!48013))

(assert (=> b!148061 d!48009))

(declare-fun d!48217 () Bool)

(declare-fun e!98913 () Bool)

(assert (=> d!48217 e!98913))

(declare-fun res!124135 () Bool)

(assert (=> d!48217 (=> (not res!124135) (not e!98913))))

(declare-fun lt!231063 () (_ BitVec 64))

(declare-fun lt!231060 () (_ BitVec 64))

(declare-fun lt!231061 () (_ BitVec 64))

(assert (=> d!48217 (= res!124135 (= lt!231061 (bvsub lt!231060 lt!231063)))))

(assert (=> d!48217 (or (= (bvand lt!231060 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!231063 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!231060 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!231060 lt!231063) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48217 (= lt!231063 (remainingBits!0 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230503)))) ((_ sign_extend 32) (currentByte!6388 (_2!6953 lt!230503))) ((_ sign_extend 32) (currentBit!6383 (_2!6953 lt!230503)))))))

(declare-fun lt!231062 () (_ BitVec 64))

(declare-fun lt!231065 () (_ BitVec 64))

(assert (=> d!48217 (= lt!231060 (bvmul lt!231062 lt!231065))))

(assert (=> d!48217 (or (= lt!231062 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!231065 (bvsdiv (bvmul lt!231062 lt!231065) lt!231062)))))

(assert (=> d!48217 (= lt!231065 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!48217 (= lt!231062 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230503)))))))

(assert (=> d!48217 (= lt!231061 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6388 (_2!6953 lt!230503))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6383 (_2!6953 lt!230503)))))))

(assert (=> d!48217 (invariant!0 (currentBit!6383 (_2!6953 lt!230503)) (currentByte!6388 (_2!6953 lt!230503)) (size!3015 (buf!3480 (_2!6953 lt!230503))))))

(assert (=> d!48217 (= (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230503))) (currentByte!6388 (_2!6953 lt!230503)) (currentBit!6383 (_2!6953 lt!230503))) lt!231061)))

(declare-fun b!148288 () Bool)

(declare-fun res!124134 () Bool)

(assert (=> b!148288 (=> (not res!124134) (not e!98913))))

(assert (=> b!148288 (= res!124134 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!231061))))

(declare-fun b!148289 () Bool)

(declare-fun lt!231064 () (_ BitVec 64))

(assert (=> b!148289 (= e!98913 (bvsle lt!231061 (bvmul lt!231064 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!148289 (or (= lt!231064 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!231064 #b0000000000000000000000000000000000000000000000000000000000001000) lt!231064)))))

(assert (=> b!148289 (= lt!231064 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230503)))))))

(assert (= (and d!48217 res!124135) b!148288))

(assert (= (and b!148288 res!124134) b!148289))

(declare-fun m!230015 () Bool)

(assert (=> d!48217 m!230015))

(declare-fun m!230017 () Bool)

(assert (=> d!48217 m!230017))

(assert (=> b!148008 d!48217))

(assert (=> b!148008 d!48009))

(declare-fun d!48219 () Bool)

(assert (=> d!48219 (= (remainingBits!0 ((_ sign_extend 32) (size!3015 (buf!3480 thiss!1634))) ((_ sign_extend 32) (currentByte!6388 thiss!1634)) ((_ sign_extend 32) (currentBit!6383 thiss!1634))) (bvsub (bvmul ((_ sign_extend 32) (size!3015 (buf!3480 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6388 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6383 thiss!1634)))))))

(assert (=> d!48013 d!48219))

(assert (=> d!48013 d!47908))

(declare-fun d!48221 () Bool)

(declare-fun res!124138 () Bool)

(declare-fun e!98915 () Bool)

(assert (=> d!48221 (=> (not res!124138) (not e!98915))))

(assert (=> d!48221 (= res!124138 (= (size!3015 (buf!3480 (_1!6955 lt!230583))) (size!3015 (buf!3480 thiss!1634))))))

(assert (=> d!48221 (= (isPrefixOf!0 (_1!6955 lt!230583) thiss!1634) e!98915)))

(declare-fun b!148290 () Bool)

(declare-fun res!124137 () Bool)

(assert (=> b!148290 (=> (not res!124137) (not e!98915))))

(assert (=> b!148290 (= res!124137 (bvsle (bitIndex!0 (size!3015 (buf!3480 (_1!6955 lt!230583))) (currentByte!6388 (_1!6955 lt!230583)) (currentBit!6383 (_1!6955 lt!230583))) (bitIndex!0 (size!3015 (buf!3480 thiss!1634)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634))))))

(declare-fun b!148291 () Bool)

(declare-fun e!98914 () Bool)

(assert (=> b!148291 (= e!98915 e!98914)))

(declare-fun res!124136 () Bool)

(assert (=> b!148291 (=> res!124136 e!98914)))

(assert (=> b!148291 (= res!124136 (= (size!3015 (buf!3480 (_1!6955 lt!230583))) #b00000000000000000000000000000000))))

(declare-fun b!148292 () Bool)

(assert (=> b!148292 (= e!98914 (arrayBitRangesEq!0 (buf!3480 (_1!6955 lt!230583)) (buf!3480 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3015 (buf!3480 (_1!6955 lt!230583))) (currentByte!6388 (_1!6955 lt!230583)) (currentBit!6383 (_1!6955 lt!230583)))))))

(assert (= (and d!48221 res!124138) b!148290))

(assert (= (and b!148290 res!124137) b!148291))

(assert (= (and b!148291 (not res!124136)) b!148292))

(declare-fun m!230019 () Bool)

(assert (=> b!148290 m!230019))

(assert (=> b!148290 m!229207))

(assert (=> b!148292 m!230019))

(assert (=> b!148292 m!230019))

(declare-fun m!230021 () Bool)

(assert (=> b!148292 m!230021))

(assert (=> b!148035 d!48221))

(assert (=> b!148027 d!48009))

(declare-fun d!48223 () Bool)

(assert (=> d!48223 (arrayBitRangesEq!0 (buf!3480 (_2!6953 lt!230274)) (buf!3480 (_2!6953 lt!230272)) lt!230561 lt!230548)))

(declare-fun lt!231066 () Unit!9318)

(assert (=> d!48223 (= lt!231066 (choose!8 (buf!3480 (_2!6953 lt!230272)) (buf!3480 (_2!6953 lt!230274)) lt!230561 lt!230548))))

(assert (=> d!48223 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!230561) (bvsle lt!230561 lt!230548))))

(assert (=> d!48223 (= (arrayBitRangesEqSymmetric!0 (buf!3480 (_2!6953 lt!230272)) (buf!3480 (_2!6953 lt!230274)) lt!230561 lt!230548) lt!231066)))

(declare-fun bs!11778 () Bool)

(assert (= bs!11778 d!48223))

(assert (=> bs!11778 m!229463))

(declare-fun m!230023 () Bool)

(assert (=> bs!11778 m!230023))

(assert (=> b!148027 d!48223))

(declare-fun d!48225 () Bool)

(declare-fun res!124140 () Bool)

(declare-fun e!98921 () Bool)

(assert (=> d!48225 (=> res!124140 e!98921)))

(assert (=> d!48225 (= res!124140 (bvsge lt!230561 lt!230548))))

(assert (=> d!48225 (= (arrayBitRangesEq!0 (buf!3480 (_2!6953 lt!230274)) (buf!3480 (_2!6953 lt!230272)) lt!230561 lt!230548) e!98921)))

(declare-fun b!148293 () Bool)

(declare-fun e!98916 () Bool)

(declare-fun e!98919 () Bool)

(assert (=> b!148293 (= e!98916 e!98919)))

(declare-fun lt!231068 () tuple4!142)

(declare-fun lt!231067 () (_ BitVec 32))

(declare-fun res!124139 () Bool)

(assert (=> b!148293 (= res!124139 (byteRangesEq!0 (select (arr!3784 (buf!3480 (_2!6953 lt!230274))) (_3!362 lt!231068)) (select (arr!3784 (buf!3480 (_2!6953 lt!230272))) (_3!362 lt!231068)) lt!231067 #b00000000000000000000000000001000))))

(assert (=> b!148293 (=> (not res!124139) (not e!98919))))

(declare-fun c!8015 () Bool)

(declare-fun call!2004 () Bool)

(declare-fun lt!231069 () (_ BitVec 32))

(declare-fun bm!2001 () Bool)

(assert (=> bm!2001 (= call!2004 (byteRangesEq!0 (ite c!8015 (select (arr!3784 (buf!3480 (_2!6953 lt!230274))) (_3!362 lt!231068)) (select (arr!3784 (buf!3480 (_2!6953 lt!230274))) (_4!71 lt!231068))) (ite c!8015 (select (arr!3784 (buf!3480 (_2!6953 lt!230272))) (_3!362 lt!231068)) (select (arr!3784 (buf!3480 (_2!6953 lt!230272))) (_4!71 lt!231068))) (ite c!8015 lt!231067 #b00000000000000000000000000000000) lt!231069))))

(declare-fun b!148294 () Bool)

(declare-fun res!124141 () Bool)

(assert (=> b!148294 (= res!124141 (= lt!231069 #b00000000000000000000000000000000))))

(declare-fun e!98918 () Bool)

(assert (=> b!148294 (=> res!124141 e!98918)))

(assert (=> b!148294 (= e!98919 e!98918)))

(declare-fun b!148295 () Bool)

(declare-fun e!98920 () Bool)

(assert (=> b!148295 (= e!98921 e!98920)))

(declare-fun res!124142 () Bool)

(assert (=> b!148295 (=> (not res!124142) (not e!98920))))

(declare-fun e!98917 () Bool)

(assert (=> b!148295 (= res!124142 e!98917)))

(declare-fun res!124143 () Bool)

(assert (=> b!148295 (=> res!124143 e!98917)))

(assert (=> b!148295 (= res!124143 (bvsge (_1!6964 lt!231068) (_2!6964 lt!231068)))))

(assert (=> b!148295 (= lt!231069 ((_ extract 31 0) (bvsrem lt!230548 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!148295 (= lt!231067 ((_ extract 31 0) (bvsrem lt!230561 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!148295 (= lt!231068 (arrayBitIndices!0 lt!230561 lt!230548))))

(declare-fun b!148296 () Bool)

(assert (=> b!148296 (= e!98918 call!2004)))

(declare-fun b!148297 () Bool)

(assert (=> b!148297 (= e!98920 e!98916)))

(assert (=> b!148297 (= c!8015 (= (_3!362 lt!231068) (_4!71 lt!231068)))))

(declare-fun b!148298 () Bool)

(assert (=> b!148298 (= e!98917 (arrayRangesEq!331 (buf!3480 (_2!6953 lt!230274)) (buf!3480 (_2!6953 lt!230272)) (_1!6964 lt!231068) (_2!6964 lt!231068)))))

(declare-fun b!148299 () Bool)

(assert (=> b!148299 (= e!98916 call!2004)))

(assert (= (and d!48225 (not res!124140)) b!148295))

(assert (= (and b!148295 (not res!124143)) b!148298))

(assert (= (and b!148295 res!124142) b!148297))

(assert (= (and b!148297 c!8015) b!148299))

(assert (= (and b!148297 (not c!8015)) b!148293))

(assert (= (and b!148293 res!124139) b!148294))

(assert (= (and b!148294 (not res!124141)) b!148296))

(assert (= (or b!148299 b!148296) bm!2001))

(declare-fun m!230025 () Bool)

(assert (=> b!148293 m!230025))

(declare-fun m!230027 () Bool)

(assert (=> b!148293 m!230027))

(assert (=> b!148293 m!230025))

(assert (=> b!148293 m!230027))

(declare-fun m!230029 () Bool)

(assert (=> b!148293 m!230029))

(declare-fun m!230031 () Bool)

(assert (=> bm!2001 m!230031))

(declare-fun m!230033 () Bool)

(assert (=> bm!2001 m!230033))

(assert (=> bm!2001 m!230027))

(declare-fun m!230035 () Bool)

(assert (=> bm!2001 m!230035))

(assert (=> bm!2001 m!230025))

(declare-fun m!230037 () Bool)

(assert (=> b!148295 m!230037))

(declare-fun m!230039 () Bool)

(assert (=> b!148298 m!230039))

(assert (=> b!148027 d!48225))

(declare-fun d!48227 () Bool)

(assert (=> d!48227 (= (remainingBits!0 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230274)))) ((_ sign_extend 32) (currentByte!6388 (_2!6953 lt!230274))) ((_ sign_extend 32) (currentBit!6383 (_2!6953 lt!230274)))) (bvsub (bvmul ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230274)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6388 (_2!6953 lt!230274))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6383 (_2!6953 lt!230274))))))))

(assert (=> d!48022 d!48227))

(declare-fun d!48229 () Bool)

(assert (=> d!48229 (= (invariant!0 (currentBit!6383 (_2!6953 lt!230274)) (currentByte!6388 (_2!6953 lt!230274)) (size!3015 (buf!3480 (_2!6953 lt!230274)))) (and (bvsge (currentBit!6383 (_2!6953 lt!230274)) #b00000000000000000000000000000000) (bvslt (currentBit!6383 (_2!6953 lt!230274)) #b00000000000000000000000000001000) (bvsge (currentByte!6388 (_2!6953 lt!230274)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6388 (_2!6953 lt!230274)) (size!3015 (buf!3480 (_2!6953 lt!230274)))) (and (= (currentBit!6383 (_2!6953 lt!230274)) #b00000000000000000000000000000000) (= (currentByte!6388 (_2!6953 lt!230274)) (size!3015 (buf!3480 (_2!6953 lt!230274))))))))))

(assert (=> d!48022 d!48229))

(declare-fun d!48231 () Bool)

(declare-fun res!124145 () Bool)

(declare-fun e!98927 () Bool)

(assert (=> d!48231 (=> res!124145 e!98927)))

(assert (=> d!48231 (= res!124145 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3015 (buf!3480 thiss!1634)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634))))))

(assert (=> d!48231 (= (arrayBitRangesEq!0 (buf!3480 thiss!1634) (buf!3480 (_2!6953 lt!230272)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3015 (buf!3480 thiss!1634)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634))) e!98927)))

(declare-fun b!148300 () Bool)

(declare-fun e!98922 () Bool)

(declare-fun e!98925 () Bool)

(assert (=> b!148300 (= e!98922 e!98925)))

(declare-fun res!124144 () Bool)

(declare-fun lt!231071 () tuple4!142)

(declare-fun lt!231070 () (_ BitVec 32))

(assert (=> b!148300 (= res!124144 (byteRangesEq!0 (select (arr!3784 (buf!3480 thiss!1634)) (_3!362 lt!231071)) (select (arr!3784 (buf!3480 (_2!6953 lt!230272))) (_3!362 lt!231071)) lt!231070 #b00000000000000000000000000001000))))

(assert (=> b!148300 (=> (not res!124144) (not e!98925))))

(declare-fun lt!231072 () (_ BitVec 32))

(declare-fun c!8016 () Bool)

(declare-fun call!2005 () Bool)

(declare-fun bm!2002 () Bool)

(assert (=> bm!2002 (= call!2005 (byteRangesEq!0 (ite c!8016 (select (arr!3784 (buf!3480 thiss!1634)) (_3!362 lt!231071)) (select (arr!3784 (buf!3480 thiss!1634)) (_4!71 lt!231071))) (ite c!8016 (select (arr!3784 (buf!3480 (_2!6953 lt!230272))) (_3!362 lt!231071)) (select (arr!3784 (buf!3480 (_2!6953 lt!230272))) (_4!71 lt!231071))) (ite c!8016 lt!231070 #b00000000000000000000000000000000) lt!231072))))

(declare-fun b!148301 () Bool)

(declare-fun res!124146 () Bool)

(assert (=> b!148301 (= res!124146 (= lt!231072 #b00000000000000000000000000000000))))

(declare-fun e!98924 () Bool)

(assert (=> b!148301 (=> res!124146 e!98924)))

(assert (=> b!148301 (= e!98925 e!98924)))

(declare-fun b!148302 () Bool)

(declare-fun e!98926 () Bool)

(assert (=> b!148302 (= e!98927 e!98926)))

(declare-fun res!124147 () Bool)

(assert (=> b!148302 (=> (not res!124147) (not e!98926))))

(declare-fun e!98923 () Bool)

(assert (=> b!148302 (= res!124147 e!98923)))

(declare-fun res!124148 () Bool)

(assert (=> b!148302 (=> res!124148 e!98923)))

(assert (=> b!148302 (= res!124148 (bvsge (_1!6964 lt!231071) (_2!6964 lt!231071)))))

(assert (=> b!148302 (= lt!231072 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3015 (buf!3480 thiss!1634)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!148302 (= lt!231070 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!148302 (= lt!231071 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3015 (buf!3480 thiss!1634)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634))))))

(declare-fun b!148303 () Bool)

(assert (=> b!148303 (= e!98924 call!2005)))

(declare-fun b!148304 () Bool)

(assert (=> b!148304 (= e!98926 e!98922)))

(assert (=> b!148304 (= c!8016 (= (_3!362 lt!231071) (_4!71 lt!231071)))))

(declare-fun b!148305 () Bool)

(assert (=> b!148305 (= e!98923 (arrayRangesEq!331 (buf!3480 thiss!1634) (buf!3480 (_2!6953 lt!230272)) (_1!6964 lt!231071) (_2!6964 lt!231071)))))

(declare-fun b!148306 () Bool)

(assert (=> b!148306 (= e!98922 call!2005)))

(assert (= (and d!48231 (not res!124145)) b!148302))

(assert (= (and b!148302 (not res!124148)) b!148305))

(assert (= (and b!148302 res!124147) b!148304))

(assert (= (and b!148304 c!8016) b!148306))

(assert (= (and b!148304 (not c!8016)) b!148300))

(assert (= (and b!148300 res!124144) b!148301))

(assert (= (and b!148301 (not res!124146)) b!148303))

(assert (= (or b!148306 b!148303) bm!2002))

(declare-fun m!230041 () Bool)

(assert (=> b!148300 m!230041))

(declare-fun m!230043 () Bool)

(assert (=> b!148300 m!230043))

(assert (=> b!148300 m!230041))

(assert (=> b!148300 m!230043))

(declare-fun m!230045 () Bool)

(assert (=> b!148300 m!230045))

(declare-fun m!230047 () Bool)

(assert (=> bm!2002 m!230047))

(declare-fun m!230049 () Bool)

(assert (=> bm!2002 m!230049))

(assert (=> bm!2002 m!230043))

(declare-fun m!230051 () Bool)

(assert (=> bm!2002 m!230051))

(assert (=> bm!2002 m!230041))

(assert (=> b!148302 m!229207))

(assert (=> b!148302 m!229961))

(declare-fun m!230053 () Bool)

(assert (=> b!148305 m!230053))

(assert (=> b!148063 d!48231))

(assert (=> b!148063 d!48013))

(assert (=> d!48009 d!48179))

(declare-fun d!48233 () Bool)

(assert (=> d!48233 (= (invariant!0 (currentBit!6383 (_2!6953 lt!230272)) (currentByte!6388 (_2!6953 lt!230272)) (size!3015 (buf!3480 (_2!6953 lt!230272)))) (and (bvsge (currentBit!6383 (_2!6953 lt!230272)) #b00000000000000000000000000000000) (bvslt (currentBit!6383 (_2!6953 lt!230272)) #b00000000000000000000000000001000) (bvsge (currentByte!6388 (_2!6953 lt!230272)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6388 (_2!6953 lt!230272)) (size!3015 (buf!3480 (_2!6953 lt!230272)))) (and (= (currentBit!6383 (_2!6953 lt!230272)) #b00000000000000000000000000000000) (= (currentByte!6388 (_2!6953 lt!230272)) (size!3015 (buf!3480 (_2!6953 lt!230272))))))))))

(assert (=> d!48009 d!48233))

(assert (=> d!47962 d!47960))

(declare-fun d!48235 () Bool)

(declare-fun e!98928 () Bool)

(assert (=> d!48235 e!98928))

(declare-fun res!124150 () Bool)

(assert (=> d!48235 (=> (not res!124150) (not e!98928))))

(declare-fun lt!231074 () (_ BitVec 64))

(declare-fun lt!231073 () (_ BitVec 64))

(declare-fun lt!231076 () (_ BitVec 64))

(assert (=> d!48235 (= res!124150 (= lt!231074 (bvsub lt!231073 lt!231076)))))

(assert (=> d!48235 (or (= (bvand lt!231073 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!231076 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!231073 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!231073 lt!231076) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48235 (= lt!231076 (remainingBits!0 ((_ sign_extend 32) (size!3015 (buf!3480 (_1!6956 lt!230527)))) ((_ sign_extend 32) (currentByte!6388 (_1!6956 lt!230527))) ((_ sign_extend 32) (currentBit!6383 (_1!6956 lt!230527)))))))

(declare-fun lt!231075 () (_ BitVec 64))

(declare-fun lt!231078 () (_ BitVec 64))

(assert (=> d!48235 (= lt!231073 (bvmul lt!231075 lt!231078))))

(assert (=> d!48235 (or (= lt!231075 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!231078 (bvsdiv (bvmul lt!231075 lt!231078) lt!231075)))))

(assert (=> d!48235 (= lt!231078 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!48235 (= lt!231075 ((_ sign_extend 32) (size!3015 (buf!3480 (_1!6956 lt!230527)))))))

(assert (=> d!48235 (= lt!231074 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6388 (_1!6956 lt!230527))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6383 (_1!6956 lt!230527)))))))

(assert (=> d!48235 (invariant!0 (currentBit!6383 (_1!6956 lt!230527)) (currentByte!6388 (_1!6956 lt!230527)) (size!3015 (buf!3480 (_1!6956 lt!230527))))))

(assert (=> d!48235 (= (bitIndex!0 (size!3015 (buf!3480 (_1!6956 lt!230527))) (currentByte!6388 (_1!6956 lt!230527)) (currentBit!6383 (_1!6956 lt!230527))) lt!231074)))

(declare-fun b!148307 () Bool)

(declare-fun res!124149 () Bool)

(assert (=> b!148307 (=> (not res!124149) (not e!98928))))

(assert (=> b!148307 (= res!124149 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!231074))))

(declare-fun b!148308 () Bool)

(declare-fun lt!231077 () (_ BitVec 64))

(assert (=> b!148308 (= e!98928 (bvsle lt!231074 (bvmul lt!231077 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!148308 (or (= lt!231077 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!231077 #b0000000000000000000000000000000000000000000000000000000000001000) lt!231077)))))

(assert (=> b!148308 (= lt!231077 ((_ sign_extend 32) (size!3015 (buf!3480 (_1!6956 lt!230527)))))))

(assert (= (and d!48235 res!124150) b!148307))

(assert (= (and b!148307 res!124149) b!148308))

(declare-fun m!230055 () Bool)

(assert (=> d!48235 m!230055))

(declare-fun m!230057 () Bool)

(assert (=> d!48235 m!230057))

(assert (=> d!47962 d!48235))

(declare-fun d!48237 () Bool)

(declare-fun lt!231079 () tuple2!13196)

(assert (=> d!48237 (= lt!231079 (readByte!0 lt!230528))))

(assert (=> d!48237 (= (readBytePure!0 lt!230528) (tuple2!13195 (_2!6957 lt!231079) (_1!6957 lt!231079)))))

(declare-fun bs!11779 () Bool)

(assert (= bs!11779 d!48237))

(declare-fun m!230059 () Bool)

(assert (=> bs!11779 m!230059))

(assert (=> d!47962 d!48237))

(declare-fun d!48239 () Bool)

(declare-fun e!98931 () Bool)

(assert (=> d!48239 e!98931))

(declare-fun res!124153 () Bool)

(assert (=> d!48239 (=> (not res!124153) (not e!98931))))

(declare-fun lt!231084 () tuple2!13194)

(declare-fun lt!231085 () tuple2!13194)

(assert (=> d!48239 (= res!124153 (= (bitIndex!0 (size!3015 (buf!3480 (_1!6956 lt!231084))) (currentByte!6388 (_1!6956 lt!231084)) (currentBit!6383 (_1!6956 lt!231084))) (bitIndex!0 (size!3015 (buf!3480 (_1!6956 lt!231085))) (currentByte!6388 (_1!6956 lt!231085)) (currentBit!6383 (_1!6956 lt!231085)))))))

(assert (=> d!48239 (= lt!231085 (readBytePure!0 (BitStream!5289 (buf!3480 (_2!6953 lt!230274)) (currentByte!6388 lt!230276) (currentBit!6383 lt!230276))))))

(assert (=> d!48239 (= lt!231084 (readBytePure!0 lt!230276))))

(assert (=> d!48239 true))

(declare-fun _$8!93 () Unit!9318)

(assert (=> d!48239 (= (choose!14 lt!230276 (_2!6953 lt!230274) lt!230528 lt!230529 (tuple2!13195 (_1!6956 lt!230529) (_2!6956 lt!230529)) (_1!6956 lt!230529) (_2!6956 lt!230529) lt!230527 (tuple2!13195 (_1!6956 lt!230527) (_2!6956 lt!230527)) (_1!6956 lt!230527) (_2!6956 lt!230527)) _$8!93)))

(declare-fun b!148311 () Bool)

(assert (=> b!148311 (= e!98931 (= (_2!6956 lt!231084) (_2!6956 lt!231085)))))

(assert (= (and d!48239 res!124153) b!148311))

(declare-fun m!230061 () Bool)

(assert (=> d!48239 m!230061))

(declare-fun m!230063 () Bool)

(assert (=> d!48239 m!230063))

(declare-fun m!230065 () Bool)

(assert (=> d!48239 m!230065))

(assert (=> d!48239 m!229231))

(assert (=> d!47962 d!48239))

(declare-fun d!48241 () Bool)

(declare-fun e!98932 () Bool)

(assert (=> d!48241 e!98932))

(declare-fun res!124155 () Bool)

(assert (=> d!48241 (=> (not res!124155) (not e!98932))))

(declare-fun lt!231087 () (_ BitVec 64))

(declare-fun lt!231086 () (_ BitVec 64))

(declare-fun lt!231089 () (_ BitVec 64))

(assert (=> d!48241 (= res!124155 (= lt!231087 (bvsub lt!231086 lt!231089)))))

(assert (=> d!48241 (or (= (bvand lt!231086 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!231089 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!231086 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!231086 lt!231089) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48241 (= lt!231089 (remainingBits!0 ((_ sign_extend 32) (size!3015 (buf!3480 (_1!6956 lt!230529)))) ((_ sign_extend 32) (currentByte!6388 (_1!6956 lt!230529))) ((_ sign_extend 32) (currentBit!6383 (_1!6956 lt!230529)))))))

(declare-fun lt!231088 () (_ BitVec 64))

(declare-fun lt!231091 () (_ BitVec 64))

(assert (=> d!48241 (= lt!231086 (bvmul lt!231088 lt!231091))))

(assert (=> d!48241 (or (= lt!231088 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!231091 (bvsdiv (bvmul lt!231088 lt!231091) lt!231088)))))

(assert (=> d!48241 (= lt!231091 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!48241 (= lt!231088 ((_ sign_extend 32) (size!3015 (buf!3480 (_1!6956 lt!230529)))))))

(assert (=> d!48241 (= lt!231087 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6388 (_1!6956 lt!230529))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6383 (_1!6956 lt!230529)))))))

(assert (=> d!48241 (invariant!0 (currentBit!6383 (_1!6956 lt!230529)) (currentByte!6388 (_1!6956 lt!230529)) (size!3015 (buf!3480 (_1!6956 lt!230529))))))

(assert (=> d!48241 (= (bitIndex!0 (size!3015 (buf!3480 (_1!6956 lt!230529))) (currentByte!6388 (_1!6956 lt!230529)) (currentBit!6383 (_1!6956 lt!230529))) lt!231087)))

(declare-fun b!148312 () Bool)

(declare-fun res!124154 () Bool)

(assert (=> b!148312 (=> (not res!124154) (not e!98932))))

(assert (=> b!148312 (= res!124154 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!231087))))

(declare-fun b!148313 () Bool)

(declare-fun lt!231090 () (_ BitVec 64))

(assert (=> b!148313 (= e!98932 (bvsle lt!231087 (bvmul lt!231090 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!148313 (or (= lt!231090 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!231090 #b0000000000000000000000000000000000000000000000000000000000001000) lt!231090)))))

(assert (=> b!148313 (= lt!231090 ((_ sign_extend 32) (size!3015 (buf!3480 (_1!6956 lt!230529)))))))

(assert (= (and d!48241 res!124155) b!148312))

(assert (= (and b!148312 res!124154) b!148313))

(declare-fun m!230067 () Bool)

(assert (=> d!48241 m!230067))

(declare-fun m!230069 () Bool)

(assert (=> d!48241 m!230069))

(assert (=> d!47962 d!48241))

(declare-fun d!48243 () Bool)

(assert (=> d!48243 (= (remainingBits!0 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230274)))) ((_ sign_extend 32) (currentByte!6388 (_2!6953 lt!230272))) ((_ sign_extend 32) (currentBit!6383 (_2!6953 lt!230272)))) (bvsub (bvmul ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230274)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6388 (_2!6953 lt!230272))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6383 (_2!6953 lt!230272))))))))

(assert (=> d!47924 d!48243))

(assert (=> d!48005 d!48001))

(declare-fun d!48245 () Bool)

(assert (=> d!48245 (arrayRangesEq!331 (_2!6954 lt!230260) (_2!6954 lt!230269) #b00000000000000000000000000000000 to!404)))

(assert (=> d!48245 true))

(declare-fun _$6!319 () Unit!9318)

(assert (=> d!48245 (= (choose!83 (_2!6954 lt!230269) (_2!6954 lt!230260) #b00000000000000000000000000000000 to!404) _$6!319)))

(declare-fun bs!11780 () Bool)

(assert (= bs!11780 d!48245))

(assert (=> bs!11780 m!229199))

(assert (=> d!48005 d!48245))

(declare-fun b!148324 () Bool)

(declare-fun res!124164 () Bool)

(declare-fun e!98940 () Bool)

(assert (=> b!148324 (=> (not res!124164) (not e!98940))))

(declare-fun lt!231168 () tuple3!576)

(assert (=> b!148324 (= res!124164 (and (= (buf!3480 (withMovedByteIndex!0 (_1!6955 lt!230255) #b00000000000000000000000000000001)) (buf!3480 (_2!6958 lt!231168))) (= (size!3015 lt!230262) (size!3015 (_3!359 lt!231168)))))))

(declare-fun d!48247 () Bool)

(declare-fun e!98939 () Bool)

(assert (=> d!48247 e!98939))

(declare-fun res!124162 () Bool)

(assert (=> d!48247 (=> res!124162 e!98939)))

(assert (=> d!48247 (= res!124162 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!231196 () Bool)

(assert (=> d!48247 (= lt!231196 e!98940)))

(declare-fun res!124163 () Bool)

(assert (=> d!48247 (=> (not res!124163) (not e!98940))))

(declare-fun lt!231173 () (_ BitVec 64))

(declare-fun lt!231182 () (_ BitVec 64))

(assert (=> d!48247 (= res!124163 (= (bvadd lt!231182 lt!231173) (bitIndex!0 (size!3015 (buf!3480 (_2!6958 lt!231168))) (currentByte!6388 (_2!6958 lt!231168)) (currentBit!6383 (_2!6958 lt!231168)))))))

(assert (=> d!48247 (or (not (= (bvand lt!231182 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!231173 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!231182 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!231182 lt!231173) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!231167 () (_ BitVec 64))

(assert (=> d!48247 (= lt!231173 (bvmul lt!231167 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!48247 (or (= lt!231167 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!231167 #b0000000000000000000000000000000000000000000000000000000000001000) lt!231167)))))

(assert (=> d!48247 (= lt!231167 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!48247 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!48247 (= lt!231182 (bitIndex!0 (size!3015 (buf!3480 (withMovedByteIndex!0 (_1!6955 lt!230255) #b00000000000000000000000000000001))) (currentByte!6388 (withMovedByteIndex!0 (_1!6955 lt!230255) #b00000000000000000000000000000001)) (currentBit!6383 (withMovedByteIndex!0 (_1!6955 lt!230255) #b00000000000000000000000000000001))))))

(declare-fun e!98941 () tuple3!576)

(assert (=> d!48247 (= lt!231168 e!98941)))

(declare-fun c!8019 () Bool)

(assert (=> d!48247 (= c!8019 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!48247 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!3015 lt!230262)))))

(assert (=> d!48247 (= (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!6955 lt!230255) #b00000000000000000000000000000001) lt!230262 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!231168)))

(declare-fun lt!231199 () Unit!9318)

(declare-fun b!148325 () Bool)

(assert (=> b!148325 (= e!98941 (tuple3!577 lt!231199 (withMovedByteIndex!0 (_1!6955 lt!230255) #b00000000000000000000000000000001) lt!230262))))

(declare-fun call!2013 () (_ BitVec 64))

(assert (=> b!148325 (= call!2013 call!2013)))

(declare-fun lt!231179 () Unit!9318)

(declare-fun Unit!9342 () Unit!9318)

(assert (=> b!148325 (= lt!231179 Unit!9342)))

(declare-fun lt!231184 () Unit!9318)

(declare-fun arrayRangesEqReflexiveLemma!14 (array!6663) Unit!9318)

(assert (=> b!148325 (= lt!231184 (arrayRangesEqReflexiveLemma!14 lt!230262))))

(declare-fun call!2014 () Bool)

(assert (=> b!148325 call!2014))

(declare-fun lt!231172 () Unit!9318)

(assert (=> b!148325 (= lt!231172 lt!231184)))

(declare-fun lt!231169 () array!6663)

(assert (=> b!148325 (= lt!231169 lt!230262)))

(declare-fun lt!231185 () array!6663)

(assert (=> b!148325 (= lt!231185 lt!230262)))

(declare-fun lt!231194 () (_ BitVec 32))

(assert (=> b!148325 (= lt!231194 #b00000000000000000000000000000000)))

(declare-fun lt!231192 () (_ BitVec 32))

(assert (=> b!148325 (= lt!231192 (size!3015 lt!230262))))

(declare-fun lt!231197 () (_ BitVec 32))

(assert (=> b!148325 (= lt!231197 #b00000000000000000000000000000000)))

(declare-fun lt!231193 () (_ BitVec 32))

(assert (=> b!148325 (= lt!231193 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun arrayRangesEqSlicedLemma!14 (array!6663 array!6663 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9318)

(assert (=> b!148325 (= lt!231199 (arrayRangesEqSlicedLemma!14 lt!231169 lt!231185 lt!231194 lt!231192 lt!231197 lt!231193))))

(declare-fun call!2012 () Bool)

(assert (=> b!148325 call!2012))

(declare-fun lt!231175 () tuple3!576)

(declare-fun bm!2009 () Bool)

(assert (=> bm!2009 (= call!2012 (arrayRangesEq!331 (ite c!8019 lt!230262 lt!231169) (ite c!8019 (_3!359 lt!231175) lt!231185) (ite c!8019 #b00000000000000000000000000000000 lt!231197) (ite c!8019 (bvadd #b00000000000000000000000000000001 from!447) lt!231193)))))

(declare-fun b!148326 () Bool)

(assert (=> b!148326 (= e!98940 (arrayRangesEq!331 lt!230262 (_3!359 lt!231168) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun b!148327 () Bool)

(assert (=> b!148327 (= e!98939 (= (select (arr!3784 (_3!359 lt!231168)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!6956 (readBytePure!0 (withMovedByteIndex!0 (_1!6955 lt!230255) #b00000000000000000000000000000001)))))))

(assert (=> b!148327 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!3015 (_3!359 lt!231168))))))

(declare-fun bm!2010 () Bool)

(assert (=> bm!2010 (= call!2013 (bitIndex!0 (size!3015 (buf!3480 (withMovedByteIndex!0 (_1!6955 lt!230255) #b00000000000000000000000000000001))) (currentByte!6388 (withMovedByteIndex!0 (_1!6955 lt!230255) #b00000000000000000000000000000001)) (currentBit!6383 (withMovedByteIndex!0 (_1!6955 lt!230255) #b00000000000000000000000000000001))))))

(declare-fun lt!231189 () (_ BitVec 32))

(declare-fun bm!2011 () Bool)

(assert (=> bm!2011 (= call!2014 (arrayRangesEq!331 lt!230262 (ite c!8019 (_3!359 lt!231175) lt!230262) (ite c!8019 lt!231189 #b00000000000000000000000000000000) (ite c!8019 (bvadd #b00000000000000000000000000000001 from!447) (size!3015 lt!230262))))))

(declare-fun b!148328 () Bool)

(declare-fun lt!231190 () Unit!9318)

(assert (=> b!148328 (= e!98941 (tuple3!577 lt!231190 (_2!6958 lt!231175) (_3!359 lt!231175)))))

(declare-fun lt!231170 () tuple2!13196)

(assert (=> b!148328 (= lt!231170 (readByte!0 (withMovedByteIndex!0 (_1!6955 lt!230255) #b00000000000000000000000000000001)))))

(declare-fun lt!231195 () array!6663)

(assert (=> b!148328 (= lt!231195 (array!6664 (store (arr!3784 lt!230262) (bvadd #b00000000000000000000000000000001 from!447) (_1!6957 lt!231170)) (size!3015 lt!230262)))))

(declare-fun lt!231181 () (_ BitVec 64))

(assert (=> b!148328 (= lt!231181 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!231187 () (_ BitVec 32))

(assert (=> b!148328 (= lt!231187 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!231166 () Unit!9318)

(assert (=> b!148328 (= lt!231166 (validateOffsetBytesFromBitIndexLemma!0 (withMovedByteIndex!0 (_1!6955 lt!230255) #b00000000000000000000000000000001) (_2!6957 lt!231170) lt!231181 lt!231187))))

(assert (=> b!148328 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6957 lt!231170)))) ((_ sign_extend 32) (currentByte!6388 (_2!6957 lt!231170))) ((_ sign_extend 32) (currentBit!6383 (_2!6957 lt!231170))) (bvsub lt!231187 ((_ extract 31 0) (bvsdiv (bvadd lt!231181 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!231177 () Unit!9318)

(assert (=> b!148328 (= lt!231177 lt!231166)))

(assert (=> b!148328 (= lt!231175 (readByteArrayLoop!0 (_2!6957 lt!231170) lt!231195 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!148328 (= (bitIndex!0 (size!3015 (buf!3480 (_2!6957 lt!231170))) (currentByte!6388 (_2!6957 lt!231170)) (currentBit!6383 (_2!6957 lt!231170))) (bvadd call!2013 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!231191 () Unit!9318)

(declare-fun Unit!9343 () Unit!9318)

(assert (=> b!148328 (= lt!231191 Unit!9343)))

(assert (=> b!148328 (= (bvadd (bitIndex!0 (size!3015 (buf!3480 (_2!6957 lt!231170))) (currentByte!6388 (_2!6957 lt!231170)) (currentBit!6383 (_2!6957 lt!231170))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3015 (buf!3480 (_2!6958 lt!231175))) (currentByte!6388 (_2!6958 lt!231175)) (currentBit!6383 (_2!6958 lt!231175))))))

(declare-fun lt!231174 () Unit!9318)

(declare-fun Unit!9344 () Unit!9318)

(assert (=> b!148328 (= lt!231174 Unit!9344)))

(assert (=> b!148328 (= (bvadd call!2013 (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3015 (buf!3480 (_2!6958 lt!231175))) (currentByte!6388 (_2!6958 lt!231175)) (currentBit!6383 (_2!6958 lt!231175))))))

(declare-fun lt!231183 () Unit!9318)

(declare-fun Unit!9345 () Unit!9318)

(assert (=> b!148328 (= lt!231183 Unit!9345)))

(assert (=> b!148328 (and (= (buf!3480 (withMovedByteIndex!0 (_1!6955 lt!230255) #b00000000000000000000000000000001)) (buf!3480 (_2!6958 lt!231175))) (= (size!3015 lt!230262) (size!3015 (_3!359 lt!231175))))))

(declare-fun lt!231164 () Unit!9318)

(declare-fun Unit!9346 () Unit!9318)

(assert (=> b!148328 (= lt!231164 Unit!9346)))

(declare-fun lt!231178 () Unit!9318)

(declare-fun arrayUpdatedAtPrefixLemma!14 (array!6663 (_ BitVec 32) (_ BitVec 8)) Unit!9318)

(assert (=> b!148328 (= lt!231178 (arrayUpdatedAtPrefixLemma!14 lt!230262 (bvadd #b00000000000000000000000000000001 from!447) (_1!6957 lt!231170)))))

(assert (=> b!148328 (arrayRangesEq!331 lt!230262 (array!6664 (store (arr!3784 lt!230262) (bvadd #b00000000000000000000000000000001 from!447) (_1!6957 lt!231170)) (size!3015 lt!230262)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!231188 () Unit!9318)

(assert (=> b!148328 (= lt!231188 lt!231178)))

(assert (=> b!148328 (= lt!231189 #b00000000000000000000000000000000)))

(declare-fun lt!231198 () Unit!9318)

(declare-fun arrayRangesEqTransitive!54 (array!6663 array!6663 array!6663 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9318)

(assert (=> b!148328 (= lt!231198 (arrayRangesEqTransitive!54 lt!230262 lt!231195 (_3!359 lt!231175) lt!231189 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!148328 call!2014))

(declare-fun lt!231186 () Unit!9318)

(assert (=> b!148328 (= lt!231186 lt!231198)))

(assert (=> b!148328 call!2012))

(declare-fun lt!231171 () Unit!9318)

(declare-fun Unit!9347 () Unit!9318)

(assert (=> b!148328 (= lt!231171 Unit!9347)))

(declare-fun lt!231180 () Unit!9318)

(declare-fun arrayRangesEqImpliesEq!14 (array!6663 array!6663 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9318)

(assert (=> b!148328 (= lt!231180 (arrayRangesEqImpliesEq!14 lt!231195 (_3!359 lt!231175) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!148328 (= (select (store (arr!3784 lt!230262) (bvadd #b00000000000000000000000000000001 from!447) (_1!6957 lt!231170)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3784 (_3!359 lt!231175)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!231165 () Unit!9318)

(assert (=> b!148328 (= lt!231165 lt!231180)))

(declare-fun lt!231176 () Bool)

(assert (=> b!148328 (= lt!231176 (= (select (arr!3784 (_3!359 lt!231175)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!6957 lt!231170)))))

(declare-fun Unit!9348 () Unit!9318)

(assert (=> b!148328 (= lt!231190 Unit!9348)))

(assert (=> b!148328 lt!231176))

(assert (= (and d!48247 c!8019) b!148328))

(assert (= (and d!48247 (not c!8019)) b!148325))

(assert (= (or b!148328 b!148325) bm!2009))

(assert (= (or b!148328 b!148325) bm!2011))

(assert (= (or b!148328 b!148325) bm!2010))

(assert (= (and d!48247 res!124163) b!148324))

(assert (= (and b!148324 res!124164) b!148326))

(assert (= (and d!48247 (not res!124162)) b!148327))

(declare-fun m!230071 () Bool)

(assert (=> bm!2010 m!230071))

(declare-fun m!230073 () Bool)

(assert (=> b!148327 m!230073))

(assert (=> b!148327 m!229247))

(declare-fun m!230075 () Bool)

(assert (=> b!148327 m!230075))

(declare-fun m!230077 () Bool)

(assert (=> bm!2009 m!230077))

(declare-fun m!230079 () Bool)

(assert (=> bm!2011 m!230079))

(declare-fun m!230081 () Bool)

(assert (=> d!48247 m!230081))

(assert (=> d!48247 m!230071))

(declare-fun m!230083 () Bool)

(assert (=> b!148326 m!230083))

(declare-fun m!230085 () Bool)

(assert (=> b!148325 m!230085))

(declare-fun m!230087 () Bool)

(assert (=> b!148325 m!230087))

(declare-fun m!230089 () Bool)

(assert (=> b!148328 m!230089))

(declare-fun m!230091 () Bool)

(assert (=> b!148328 m!230091))

(declare-fun m!230093 () Bool)

(assert (=> b!148328 m!230093))

(assert (=> b!148328 m!229247))

(declare-fun m!230095 () Bool)

(assert (=> b!148328 m!230095))

(declare-fun m!230097 () Bool)

(assert (=> b!148328 m!230097))

(declare-fun m!230099 () Bool)

(assert (=> b!148328 m!230099))

(declare-fun m!230101 () Bool)

(assert (=> b!148328 m!230101))

(declare-fun m!230103 () Bool)

(assert (=> b!148328 m!230103))

(declare-fun m!230105 () Bool)

(assert (=> b!148328 m!230105))

(declare-fun m!230107 () Bool)

(assert (=> b!148328 m!230107))

(declare-fun m!230109 () Bool)

(assert (=> b!148328 m!230109))

(declare-fun m!230111 () Bool)

(assert (=> b!148328 m!230111))

(assert (=> b!148328 m!229247))

(declare-fun m!230113 () Bool)

(assert (=> b!148328 m!230113))

(assert (=> d!47934 d!48247))

(assert (=> d!47997 d!48219))

(declare-fun b!148329 () Bool)

(declare-fun res!124167 () Bool)

(declare-fun e!98943 () Bool)

(assert (=> b!148329 (=> (not res!124167) (not e!98943))))

(declare-fun lt!231204 () tuple3!576)

(assert (=> b!148329 (= res!124167 (and (= (buf!3480 (_1!6955 lt!230278)) (buf!3480 (_2!6958 lt!231204))) (= (size!3015 lt!230262) (size!3015 (_3!359 lt!231204)))))))

(declare-fun d!48249 () Bool)

(declare-fun e!98942 () Bool)

(assert (=> d!48249 e!98942))

(declare-fun res!124165 () Bool)

(assert (=> d!48249 (=> res!124165 e!98942)))

(assert (=> d!48249 (= res!124165 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!231232 () Bool)

(assert (=> d!48249 (= lt!231232 e!98943)))

(declare-fun res!124166 () Bool)

(assert (=> d!48249 (=> (not res!124166) (not e!98943))))

(declare-fun lt!231218 () (_ BitVec 64))

(declare-fun lt!231209 () (_ BitVec 64))

(assert (=> d!48249 (= res!124166 (= (bvadd lt!231218 lt!231209) (bitIndex!0 (size!3015 (buf!3480 (_2!6958 lt!231204))) (currentByte!6388 (_2!6958 lt!231204)) (currentBit!6383 (_2!6958 lt!231204)))))))

(assert (=> d!48249 (or (not (= (bvand lt!231218 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!231209 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!231218 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!231218 lt!231209) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!231203 () (_ BitVec 64))

(assert (=> d!48249 (= lt!231209 (bvmul lt!231203 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!48249 (or (= lt!231203 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!231203 #b0000000000000000000000000000000000000000000000000000000000001000) lt!231203)))))

(assert (=> d!48249 (= lt!231203 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!48249 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!48249 (= lt!231218 (bitIndex!0 (size!3015 (buf!3480 (_1!6955 lt!230278))) (currentByte!6388 (_1!6955 lt!230278)) (currentBit!6383 (_1!6955 lt!230278))))))

(declare-fun e!98944 () tuple3!576)

(assert (=> d!48249 (= lt!231204 e!98944)))

(declare-fun c!8020 () Bool)

(assert (=> d!48249 (= c!8020 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!48249 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!3015 lt!230262)))))

(assert (=> d!48249 (= (readByteArrayLoop!0 (_1!6955 lt!230278) lt!230262 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!231204)))

(declare-fun lt!231235 () Unit!9318)

(declare-fun b!148330 () Bool)

(assert (=> b!148330 (= e!98944 (tuple3!577 lt!231235 (_1!6955 lt!230278) lt!230262))))

(declare-fun call!2016 () (_ BitVec 64))

(assert (=> b!148330 (= call!2016 call!2016)))

(declare-fun lt!231215 () Unit!9318)

(declare-fun Unit!9349 () Unit!9318)

(assert (=> b!148330 (= lt!231215 Unit!9349)))

(declare-fun lt!231220 () Unit!9318)

(assert (=> b!148330 (= lt!231220 (arrayRangesEqReflexiveLemma!14 lt!230262))))

(declare-fun call!2017 () Bool)

(assert (=> b!148330 call!2017))

(declare-fun lt!231208 () Unit!9318)

(assert (=> b!148330 (= lt!231208 lt!231220)))

(declare-fun lt!231205 () array!6663)

(assert (=> b!148330 (= lt!231205 lt!230262)))

(declare-fun lt!231221 () array!6663)

(assert (=> b!148330 (= lt!231221 lt!230262)))

(declare-fun lt!231230 () (_ BitVec 32))

(assert (=> b!148330 (= lt!231230 #b00000000000000000000000000000000)))

(declare-fun lt!231228 () (_ BitVec 32))

(assert (=> b!148330 (= lt!231228 (size!3015 lt!230262))))

(declare-fun lt!231233 () (_ BitVec 32))

(assert (=> b!148330 (= lt!231233 #b00000000000000000000000000000000)))

(declare-fun lt!231229 () (_ BitVec 32))

(assert (=> b!148330 (= lt!231229 (bvadd #b00000000000000000000000000000001 from!447))))

(assert (=> b!148330 (= lt!231235 (arrayRangesEqSlicedLemma!14 lt!231205 lt!231221 lt!231230 lt!231228 lt!231233 lt!231229))))

(declare-fun call!2015 () Bool)

(assert (=> b!148330 call!2015))

(declare-fun bm!2012 () Bool)

(declare-fun lt!231211 () tuple3!576)

(assert (=> bm!2012 (= call!2015 (arrayRangesEq!331 (ite c!8020 lt!230262 lt!231205) (ite c!8020 (_3!359 lt!231211) lt!231221) (ite c!8020 #b00000000000000000000000000000000 lt!231233) (ite c!8020 (bvadd #b00000000000000000000000000000001 from!447) lt!231229)))))

(declare-fun b!148331 () Bool)

(assert (=> b!148331 (= e!98943 (arrayRangesEq!331 lt!230262 (_3!359 lt!231204) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun b!148332 () Bool)

(assert (=> b!148332 (= e!98942 (= (select (arr!3784 (_3!359 lt!231204)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!6956 (readBytePure!0 (_1!6955 lt!230278)))))))

(assert (=> b!148332 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!3015 (_3!359 lt!231204))))))

(declare-fun bm!2013 () Bool)

(assert (=> bm!2013 (= call!2016 (bitIndex!0 (size!3015 (buf!3480 (_1!6955 lt!230278))) (currentByte!6388 (_1!6955 lt!230278)) (currentBit!6383 (_1!6955 lt!230278))))))

(declare-fun bm!2014 () Bool)

(declare-fun lt!231225 () (_ BitVec 32))

(assert (=> bm!2014 (= call!2017 (arrayRangesEq!331 lt!230262 (ite c!8020 (_3!359 lt!231211) lt!230262) (ite c!8020 lt!231225 #b00000000000000000000000000000000) (ite c!8020 (bvadd #b00000000000000000000000000000001 from!447) (size!3015 lt!230262))))))

(declare-fun b!148333 () Bool)

(declare-fun lt!231226 () Unit!9318)

(assert (=> b!148333 (= e!98944 (tuple3!577 lt!231226 (_2!6958 lt!231211) (_3!359 lt!231211)))))

(declare-fun lt!231206 () tuple2!13196)

(assert (=> b!148333 (= lt!231206 (readByte!0 (_1!6955 lt!230278)))))

(declare-fun lt!231231 () array!6663)

(assert (=> b!148333 (= lt!231231 (array!6664 (store (arr!3784 lt!230262) (bvadd #b00000000000000000000000000000001 from!447) (_1!6957 lt!231206)) (size!3015 lt!230262)))))

(declare-fun lt!231217 () (_ BitVec 64))

(assert (=> b!148333 (= lt!231217 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!231223 () (_ BitVec 32))

(assert (=> b!148333 (= lt!231223 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!231202 () Unit!9318)

(assert (=> b!148333 (= lt!231202 (validateOffsetBytesFromBitIndexLemma!0 (_1!6955 lt!230278) (_2!6957 lt!231206) lt!231217 lt!231223))))

(assert (=> b!148333 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6957 lt!231206)))) ((_ sign_extend 32) (currentByte!6388 (_2!6957 lt!231206))) ((_ sign_extend 32) (currentBit!6383 (_2!6957 lt!231206))) (bvsub lt!231223 ((_ extract 31 0) (bvsdiv (bvadd lt!231217 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!231213 () Unit!9318)

(assert (=> b!148333 (= lt!231213 lt!231202)))

(assert (=> b!148333 (= lt!231211 (readByteArrayLoop!0 (_2!6957 lt!231206) lt!231231 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!148333 (= (bitIndex!0 (size!3015 (buf!3480 (_2!6957 lt!231206))) (currentByte!6388 (_2!6957 lt!231206)) (currentBit!6383 (_2!6957 lt!231206))) (bvadd call!2016 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!231227 () Unit!9318)

(declare-fun Unit!9350 () Unit!9318)

(assert (=> b!148333 (= lt!231227 Unit!9350)))

(assert (=> b!148333 (= (bvadd (bitIndex!0 (size!3015 (buf!3480 (_2!6957 lt!231206))) (currentByte!6388 (_2!6957 lt!231206)) (currentBit!6383 (_2!6957 lt!231206))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3015 (buf!3480 (_2!6958 lt!231211))) (currentByte!6388 (_2!6958 lt!231211)) (currentBit!6383 (_2!6958 lt!231211))))))

(declare-fun lt!231210 () Unit!9318)

(declare-fun Unit!9351 () Unit!9318)

(assert (=> b!148333 (= lt!231210 Unit!9351)))

(assert (=> b!148333 (= (bvadd call!2016 (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3015 (buf!3480 (_2!6958 lt!231211))) (currentByte!6388 (_2!6958 lt!231211)) (currentBit!6383 (_2!6958 lt!231211))))))

(declare-fun lt!231219 () Unit!9318)

(declare-fun Unit!9352 () Unit!9318)

(assert (=> b!148333 (= lt!231219 Unit!9352)))

(assert (=> b!148333 (and (= (buf!3480 (_1!6955 lt!230278)) (buf!3480 (_2!6958 lt!231211))) (= (size!3015 lt!230262) (size!3015 (_3!359 lt!231211))))))

(declare-fun lt!231200 () Unit!9318)

(declare-fun Unit!9353 () Unit!9318)

(assert (=> b!148333 (= lt!231200 Unit!9353)))

(declare-fun lt!231214 () Unit!9318)

(assert (=> b!148333 (= lt!231214 (arrayUpdatedAtPrefixLemma!14 lt!230262 (bvadd #b00000000000000000000000000000001 from!447) (_1!6957 lt!231206)))))

(assert (=> b!148333 (arrayRangesEq!331 lt!230262 (array!6664 (store (arr!3784 lt!230262) (bvadd #b00000000000000000000000000000001 from!447) (_1!6957 lt!231206)) (size!3015 lt!230262)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!231224 () Unit!9318)

(assert (=> b!148333 (= lt!231224 lt!231214)))

(assert (=> b!148333 (= lt!231225 #b00000000000000000000000000000000)))

(declare-fun lt!231234 () Unit!9318)

(assert (=> b!148333 (= lt!231234 (arrayRangesEqTransitive!54 lt!230262 lt!231231 (_3!359 lt!231211) lt!231225 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!148333 call!2017))

(declare-fun lt!231222 () Unit!9318)

(assert (=> b!148333 (= lt!231222 lt!231234)))

(assert (=> b!148333 call!2015))

(declare-fun lt!231207 () Unit!9318)

(declare-fun Unit!9354 () Unit!9318)

(assert (=> b!148333 (= lt!231207 Unit!9354)))

(declare-fun lt!231216 () Unit!9318)

(assert (=> b!148333 (= lt!231216 (arrayRangesEqImpliesEq!14 lt!231231 (_3!359 lt!231211) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!148333 (= (select (store (arr!3784 lt!230262) (bvadd #b00000000000000000000000000000001 from!447) (_1!6957 lt!231206)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3784 (_3!359 lt!231211)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!231201 () Unit!9318)

(assert (=> b!148333 (= lt!231201 lt!231216)))

(declare-fun lt!231212 () Bool)

(assert (=> b!148333 (= lt!231212 (= (select (arr!3784 (_3!359 lt!231211)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!6957 lt!231206)))))

(declare-fun Unit!9355 () Unit!9318)

(assert (=> b!148333 (= lt!231226 Unit!9355)))

(assert (=> b!148333 lt!231212))

(assert (= (and d!48249 c!8020) b!148333))

(assert (= (and d!48249 (not c!8020)) b!148330))

(assert (= (or b!148333 b!148330) bm!2012))

(assert (= (or b!148333 b!148330) bm!2014))

(assert (= (or b!148333 b!148330) bm!2013))

(assert (= (and d!48249 res!124166) b!148329))

(assert (= (and b!148329 res!124167) b!148331))

(assert (= (and d!48249 (not res!124165)) b!148332))

(declare-fun m!230115 () Bool)

(assert (=> bm!2013 m!230115))

(declare-fun m!230117 () Bool)

(assert (=> b!148332 m!230117))

(declare-fun m!230119 () Bool)

(assert (=> b!148332 m!230119))

(declare-fun m!230121 () Bool)

(assert (=> bm!2012 m!230121))

(declare-fun m!230123 () Bool)

(assert (=> bm!2014 m!230123))

(declare-fun m!230125 () Bool)

(assert (=> d!48249 m!230125))

(assert (=> d!48249 m!230115))

(declare-fun m!230127 () Bool)

(assert (=> b!148331 m!230127))

(assert (=> b!148330 m!230085))

(declare-fun m!230129 () Bool)

(assert (=> b!148330 m!230129))

(declare-fun m!230131 () Bool)

(assert (=> b!148333 m!230131))

(declare-fun m!230133 () Bool)

(assert (=> b!148333 m!230133))

(declare-fun m!230135 () Bool)

(assert (=> b!148333 m!230135))

(declare-fun m!230137 () Bool)

(assert (=> b!148333 m!230137))

(declare-fun m!230139 () Bool)

(assert (=> b!148333 m!230139))

(declare-fun m!230141 () Bool)

(assert (=> b!148333 m!230141))

(declare-fun m!230143 () Bool)

(assert (=> b!148333 m!230143))

(declare-fun m!230145 () Bool)

(assert (=> b!148333 m!230145))

(declare-fun m!230147 () Bool)

(assert (=> b!148333 m!230147))

(declare-fun m!230149 () Bool)

(assert (=> b!148333 m!230149))

(declare-fun m!230151 () Bool)

(assert (=> b!148333 m!230151))

(declare-fun m!230153 () Bool)

(assert (=> b!148333 m!230153))

(declare-fun m!230155 () Bool)

(assert (=> b!148333 m!230155))

(assert (=> d!47974 d!48249))

(declare-fun d!48251 () Bool)

(declare-fun e!98945 () Bool)

(assert (=> d!48251 e!98945))

(declare-fun res!124169 () Bool)

(assert (=> d!48251 (=> (not res!124169) (not e!98945))))

(declare-fun lt!231237 () (_ BitVec 64))

(declare-fun lt!231236 () (_ BitVec 64))

(declare-fun lt!231239 () (_ BitVec 64))

(assert (=> d!48251 (= res!124169 (= lt!231237 (bvsub lt!231236 lt!231239)))))

(assert (=> d!48251 (or (= (bvand lt!231236 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!231239 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!231236 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!231236 lt!231239) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48251 (= lt!231239 (remainingBits!0 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230545)))) ((_ sign_extend 32) (currentByte!6388 (_2!6953 lt!230545))) ((_ sign_extend 32) (currentBit!6383 (_2!6953 lt!230545)))))))

(declare-fun lt!231238 () (_ BitVec 64))

(declare-fun lt!231241 () (_ BitVec 64))

(assert (=> d!48251 (= lt!231236 (bvmul lt!231238 lt!231241))))

(assert (=> d!48251 (or (= lt!231238 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!231241 (bvsdiv (bvmul lt!231238 lt!231241) lt!231238)))))

(assert (=> d!48251 (= lt!231241 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!48251 (= lt!231238 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230545)))))))

(assert (=> d!48251 (= lt!231237 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6388 (_2!6953 lt!230545))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6383 (_2!6953 lt!230545)))))))

(assert (=> d!48251 (invariant!0 (currentBit!6383 (_2!6953 lt!230545)) (currentByte!6388 (_2!6953 lt!230545)) (size!3015 (buf!3480 (_2!6953 lt!230545))))))

(assert (=> d!48251 (= (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230545))) (currentByte!6388 (_2!6953 lt!230545)) (currentBit!6383 (_2!6953 lt!230545))) lt!231237)))

(declare-fun b!148334 () Bool)

(declare-fun res!124168 () Bool)

(assert (=> b!148334 (=> (not res!124168) (not e!98945))))

(assert (=> b!148334 (= res!124168 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!231237))))

(declare-fun b!148335 () Bool)

(declare-fun lt!231240 () (_ BitVec 64))

(assert (=> b!148335 (= e!98945 (bvsle lt!231237 (bvmul lt!231240 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!148335 (or (= lt!231240 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!231240 #b0000000000000000000000000000000000000000000000000000000000001000) lt!231240)))))

(assert (=> b!148335 (= lt!231240 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230545)))))))

(assert (= (and d!48251 res!124169) b!148334))

(assert (= (and b!148334 res!124168) b!148335))

(declare-fun m!230157 () Bool)

(assert (=> d!48251 m!230157))

(declare-fun m!230159 () Bool)

(assert (=> d!48251 m!230159))

(assert (=> b!148021 d!48251))

(assert (=> b!148021 d!48013))

(declare-fun b!148336 () Bool)

(declare-fun res!124172 () Bool)

(declare-fun e!98947 () Bool)

(assert (=> b!148336 (=> (not res!124172) (not e!98947))))

(declare-fun lt!231246 () tuple3!576)

(assert (=> b!148336 (= res!124172 (and (= (buf!3480 (_1!6955 lt!230255)) (buf!3480 (_2!6958 lt!231246))) (= (size!3015 arr!237) (size!3015 (_3!359 lt!231246)))))))

(declare-fun d!48253 () Bool)

(declare-fun e!98946 () Bool)

(assert (=> d!48253 e!98946))

(declare-fun res!124170 () Bool)

(assert (=> d!48253 (=> res!124170 e!98946)))

(assert (=> d!48253 (= res!124170 (bvsge from!447 to!404))))

(declare-fun lt!231274 () Bool)

(assert (=> d!48253 (= lt!231274 e!98947)))

(declare-fun res!124171 () Bool)

(assert (=> d!48253 (=> (not res!124171) (not e!98947))))

(declare-fun lt!231260 () (_ BitVec 64))

(declare-fun lt!231251 () (_ BitVec 64))

(assert (=> d!48253 (= res!124171 (= (bvadd lt!231260 lt!231251) (bitIndex!0 (size!3015 (buf!3480 (_2!6958 lt!231246))) (currentByte!6388 (_2!6958 lt!231246)) (currentBit!6383 (_2!6958 lt!231246)))))))

(assert (=> d!48253 (or (not (= (bvand lt!231260 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!231251 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!231260 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!231260 lt!231251) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!231245 () (_ BitVec 64))

(assert (=> d!48253 (= lt!231251 (bvmul lt!231245 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!48253 (or (= lt!231245 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!231245 #b0000000000000000000000000000000000000000000000000000000000001000) lt!231245)))))

(assert (=> d!48253 (= lt!231245 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(assert (=> d!48253 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000)))))

(assert (=> d!48253 (= lt!231260 (bitIndex!0 (size!3015 (buf!3480 (_1!6955 lt!230255))) (currentByte!6388 (_1!6955 lt!230255)) (currentBit!6383 (_1!6955 lt!230255))))))

(declare-fun e!98948 () tuple3!576)

(assert (=> d!48253 (= lt!231246 e!98948)))

(declare-fun c!8021 () Bool)

(assert (=> d!48253 (= c!8021 (bvslt from!447 to!404))))

(assert (=> d!48253 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3015 arr!237)))))

(assert (=> d!48253 (= (readByteArrayLoop!0 (_1!6955 lt!230255) arr!237 from!447 to!404) lt!231246)))

(declare-fun lt!231277 () Unit!9318)

(declare-fun b!148337 () Bool)

(assert (=> b!148337 (= e!98948 (tuple3!577 lt!231277 (_1!6955 lt!230255) arr!237))))

(declare-fun call!2019 () (_ BitVec 64))

(assert (=> b!148337 (= call!2019 call!2019)))

(declare-fun lt!231257 () Unit!9318)

(declare-fun Unit!9356 () Unit!9318)

(assert (=> b!148337 (= lt!231257 Unit!9356)))

(declare-fun lt!231262 () Unit!9318)

(assert (=> b!148337 (= lt!231262 (arrayRangesEqReflexiveLemma!14 arr!237))))

(declare-fun call!2020 () Bool)

(assert (=> b!148337 call!2020))

(declare-fun lt!231250 () Unit!9318)

(assert (=> b!148337 (= lt!231250 lt!231262)))

(declare-fun lt!231247 () array!6663)

(assert (=> b!148337 (= lt!231247 arr!237)))

(declare-fun lt!231263 () array!6663)

(assert (=> b!148337 (= lt!231263 arr!237)))

(declare-fun lt!231272 () (_ BitVec 32))

(assert (=> b!148337 (= lt!231272 #b00000000000000000000000000000000)))

(declare-fun lt!231270 () (_ BitVec 32))

(assert (=> b!148337 (= lt!231270 (size!3015 arr!237))))

(declare-fun lt!231275 () (_ BitVec 32))

(assert (=> b!148337 (= lt!231275 #b00000000000000000000000000000000)))

(declare-fun lt!231271 () (_ BitVec 32))

(assert (=> b!148337 (= lt!231271 from!447)))

(assert (=> b!148337 (= lt!231277 (arrayRangesEqSlicedLemma!14 lt!231247 lt!231263 lt!231272 lt!231270 lt!231275 lt!231271))))

(declare-fun call!2018 () Bool)

(assert (=> b!148337 call!2018))

(declare-fun lt!231253 () tuple3!576)

(declare-fun bm!2015 () Bool)

(assert (=> bm!2015 (= call!2018 (arrayRangesEq!331 (ite c!8021 arr!237 lt!231247) (ite c!8021 (_3!359 lt!231253) lt!231263) (ite c!8021 #b00000000000000000000000000000000 lt!231275) (ite c!8021 from!447 lt!231271)))))

(declare-fun b!148338 () Bool)

(assert (=> b!148338 (= e!98947 (arrayRangesEq!331 arr!237 (_3!359 lt!231246) #b00000000000000000000000000000000 from!447))))

(declare-fun b!148339 () Bool)

(assert (=> b!148339 (= e!98946 (= (select (arr!3784 (_3!359 lt!231246)) from!447) (_2!6956 (readBytePure!0 (_1!6955 lt!230255)))))))

(assert (=> b!148339 (and (bvsge from!447 #b00000000000000000000000000000000) (bvslt from!447 (size!3015 (_3!359 lt!231246))))))

(declare-fun bm!2016 () Bool)

(assert (=> bm!2016 (= call!2019 (bitIndex!0 (size!3015 (buf!3480 (_1!6955 lt!230255))) (currentByte!6388 (_1!6955 lt!230255)) (currentBit!6383 (_1!6955 lt!230255))))))

(declare-fun lt!231267 () (_ BitVec 32))

(declare-fun bm!2017 () Bool)

(assert (=> bm!2017 (= call!2020 (arrayRangesEq!331 arr!237 (ite c!8021 (_3!359 lt!231253) arr!237) (ite c!8021 lt!231267 #b00000000000000000000000000000000) (ite c!8021 from!447 (size!3015 arr!237))))))

(declare-fun b!148340 () Bool)

(declare-fun lt!231268 () Unit!9318)

(assert (=> b!148340 (= e!98948 (tuple3!577 lt!231268 (_2!6958 lt!231253) (_3!359 lt!231253)))))

(declare-fun lt!231248 () tuple2!13196)

(assert (=> b!148340 (= lt!231248 (readByte!0 (_1!6955 lt!230255)))))

(declare-fun lt!231273 () array!6663)

(assert (=> b!148340 (= lt!231273 (array!6664 (store (arr!3784 arr!237) from!447 (_1!6957 lt!231248)) (size!3015 arr!237)))))

(declare-fun lt!231259 () (_ BitVec 64))

(assert (=> b!148340 (= lt!231259 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!231265 () (_ BitVec 32))

(assert (=> b!148340 (= lt!231265 (bvsub to!404 from!447))))

(declare-fun lt!231244 () Unit!9318)

(assert (=> b!148340 (= lt!231244 (validateOffsetBytesFromBitIndexLemma!0 (_1!6955 lt!230255) (_2!6957 lt!231248) lt!231259 lt!231265))))

(assert (=> b!148340 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6957 lt!231248)))) ((_ sign_extend 32) (currentByte!6388 (_2!6957 lt!231248))) ((_ sign_extend 32) (currentBit!6383 (_2!6957 lt!231248))) (bvsub lt!231265 ((_ extract 31 0) (bvsdiv (bvadd lt!231259 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!231255 () Unit!9318)

(assert (=> b!148340 (= lt!231255 lt!231244)))

(assert (=> b!148340 (= lt!231253 (readByteArrayLoop!0 (_2!6957 lt!231248) lt!231273 (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!148340 (= (bitIndex!0 (size!3015 (buf!3480 (_2!6957 lt!231248))) (currentByte!6388 (_2!6957 lt!231248)) (currentBit!6383 (_2!6957 lt!231248))) (bvadd call!2019 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!231269 () Unit!9318)

(declare-fun Unit!9357 () Unit!9318)

(assert (=> b!148340 (= lt!231269 Unit!9357)))

(assert (=> b!148340 (= (bvadd (bitIndex!0 (size!3015 (buf!3480 (_2!6957 lt!231248))) (currentByte!6388 (_2!6957 lt!231248)) (currentBit!6383 (_2!6957 lt!231248))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3015 (buf!3480 (_2!6958 lt!231253))) (currentByte!6388 (_2!6958 lt!231253)) (currentBit!6383 (_2!6958 lt!231253))))))

(declare-fun lt!231252 () Unit!9318)

(declare-fun Unit!9358 () Unit!9318)

(assert (=> b!148340 (= lt!231252 Unit!9358)))

(assert (=> b!148340 (= (bvadd call!2019 (bvmul ((_ sign_extend 32) (bvsub to!404 from!447)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3015 (buf!3480 (_2!6958 lt!231253))) (currentByte!6388 (_2!6958 lt!231253)) (currentBit!6383 (_2!6958 lt!231253))))))

(declare-fun lt!231261 () Unit!9318)

(declare-fun Unit!9359 () Unit!9318)

(assert (=> b!148340 (= lt!231261 Unit!9359)))

(assert (=> b!148340 (and (= (buf!3480 (_1!6955 lt!230255)) (buf!3480 (_2!6958 lt!231253))) (= (size!3015 arr!237) (size!3015 (_3!359 lt!231253))))))

(declare-fun lt!231242 () Unit!9318)

(declare-fun Unit!9360 () Unit!9318)

(assert (=> b!148340 (= lt!231242 Unit!9360)))

(declare-fun lt!231256 () Unit!9318)

(assert (=> b!148340 (= lt!231256 (arrayUpdatedAtPrefixLemma!14 arr!237 from!447 (_1!6957 lt!231248)))))

(assert (=> b!148340 (arrayRangesEq!331 arr!237 (array!6664 (store (arr!3784 arr!237) from!447 (_1!6957 lt!231248)) (size!3015 arr!237)) #b00000000000000000000000000000000 from!447)))

(declare-fun lt!231266 () Unit!9318)

(assert (=> b!148340 (= lt!231266 lt!231256)))

(assert (=> b!148340 (= lt!231267 #b00000000000000000000000000000000)))

(declare-fun lt!231276 () Unit!9318)

(assert (=> b!148340 (= lt!231276 (arrayRangesEqTransitive!54 arr!237 lt!231273 (_3!359 lt!231253) lt!231267 from!447 (bvadd from!447 #b00000000000000000000000000000001)))))

(assert (=> b!148340 call!2020))

(declare-fun lt!231264 () Unit!9318)

(assert (=> b!148340 (= lt!231264 lt!231276)))

(assert (=> b!148340 call!2018))

(declare-fun lt!231249 () Unit!9318)

(declare-fun Unit!9361 () Unit!9318)

(assert (=> b!148340 (= lt!231249 Unit!9361)))

(declare-fun lt!231258 () Unit!9318)

(assert (=> b!148340 (= lt!231258 (arrayRangesEqImpliesEq!14 lt!231273 (_3!359 lt!231253) #b00000000000000000000000000000000 from!447 (bvadd from!447 #b00000000000000000000000000000001)))))

(assert (=> b!148340 (= (select (store (arr!3784 arr!237) from!447 (_1!6957 lt!231248)) from!447) (select (arr!3784 (_3!359 lt!231253)) from!447))))

(declare-fun lt!231243 () Unit!9318)

(assert (=> b!148340 (= lt!231243 lt!231258)))

(declare-fun lt!231254 () Bool)

(assert (=> b!148340 (= lt!231254 (= (select (arr!3784 (_3!359 lt!231253)) from!447) (_1!6957 lt!231248)))))

(declare-fun Unit!9362 () Unit!9318)

(assert (=> b!148340 (= lt!231268 Unit!9362)))

(assert (=> b!148340 lt!231254))

(assert (= (and d!48253 c!8021) b!148340))

(assert (= (and d!48253 (not c!8021)) b!148337))

(assert (= (or b!148340 b!148337) bm!2015))

(assert (= (or b!148340 b!148337) bm!2017))

(assert (= (or b!148340 b!148337) bm!2016))

(assert (= (and d!48253 res!124171) b!148336))

(assert (= (and b!148336 res!124172) b!148338))

(assert (= (and d!48253 (not res!124170)) b!148339))

(assert (=> bm!2016 m!229943))

(declare-fun m!230161 () Bool)

(assert (=> b!148339 m!230161))

(assert (=> b!148339 m!229223))

(declare-fun m!230163 () Bool)

(assert (=> bm!2015 m!230163))

(declare-fun m!230165 () Bool)

(assert (=> bm!2017 m!230165))

(declare-fun m!230167 () Bool)

(assert (=> d!48253 m!230167))

(assert (=> d!48253 m!229943))

(declare-fun m!230169 () Bool)

(assert (=> b!148338 m!230169))

(declare-fun m!230171 () Bool)

(assert (=> b!148337 m!230171))

(declare-fun m!230173 () Bool)

(assert (=> b!148337 m!230173))

(declare-fun m!230175 () Bool)

(assert (=> b!148340 m!230175))

(declare-fun m!230177 () Bool)

(assert (=> b!148340 m!230177))

(declare-fun m!230179 () Bool)

(assert (=> b!148340 m!230179))

(declare-fun m!230181 () Bool)

(assert (=> b!148340 m!230181))

(declare-fun m!230183 () Bool)

(assert (=> b!148340 m!230183))

(declare-fun m!230185 () Bool)

(assert (=> b!148340 m!230185))

(declare-fun m!230187 () Bool)

(assert (=> b!148340 m!230187))

(declare-fun m!230189 () Bool)

(assert (=> b!148340 m!230189))

(declare-fun m!230191 () Bool)

(assert (=> b!148340 m!230191))

(declare-fun m!230193 () Bool)

(assert (=> b!148340 m!230193))

(declare-fun m!230195 () Bool)

(assert (=> b!148340 m!230195))

(declare-fun m!230197 () Bool)

(assert (=> b!148340 m!230197))

(assert (=> b!148340 m!229429))

(assert (=> d!47970 d!48253))

(declare-fun d!48255 () Bool)

(declare-fun res!124173 () Bool)

(declare-fun e!98949 () Bool)

(assert (=> d!48255 (=> res!124173 e!98949)))

(assert (=> d!48255 (= res!124173 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!48255 (= (arrayRangesEq!331 (_2!6954 lt!230269) (_2!6954 lt!230268) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!98949)))

(declare-fun b!148341 () Bool)

(declare-fun e!98950 () Bool)

(assert (=> b!148341 (= e!98949 e!98950)))

(declare-fun res!124174 () Bool)

(assert (=> b!148341 (=> (not res!124174) (not e!98950))))

(assert (=> b!148341 (= res!124174 (= (select (arr!3784 (_2!6954 lt!230269)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3784 (_2!6954 lt!230268)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!148342 () Bool)

(assert (=> b!148342 (= e!98950 (arrayRangesEq!331 (_2!6954 lt!230269) (_2!6954 lt!230268) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48255 (not res!124173)) b!148341))

(assert (= (and b!148341 res!124174) b!148342))

(assert (=> b!148341 m!229897))

(declare-fun m!230199 () Bool)

(assert (=> b!148341 m!230199))

(declare-fun m!230201 () Bool)

(assert (=> b!148342 m!230201))

(assert (=> b!148030 d!48255))

(declare-fun b!148343 () Bool)

(declare-fun res!124177 () Bool)

(declare-fun e!98952 () Bool)

(assert (=> b!148343 (=> (not res!124177) (not e!98952))))

(declare-fun lt!231282 () tuple3!576)

(assert (=> b!148343 (= res!124177 (and (= (buf!3480 (_1!6955 lt!230270)) (buf!3480 (_2!6958 lt!231282))) (= (size!3015 arr!237) (size!3015 (_3!359 lt!231282)))))))

(declare-fun d!48257 () Bool)

(declare-fun e!98951 () Bool)

(assert (=> d!48257 e!98951))

(declare-fun res!124175 () Bool)

(assert (=> d!48257 (=> res!124175 e!98951)))

(assert (=> d!48257 (= res!124175 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!231310 () Bool)

(assert (=> d!48257 (= lt!231310 e!98952)))

(declare-fun res!124176 () Bool)

(assert (=> d!48257 (=> (not res!124176) (not e!98952))))

(declare-fun lt!231296 () (_ BitVec 64))

(declare-fun lt!231287 () (_ BitVec 64))

(assert (=> d!48257 (= res!124176 (= (bvadd lt!231296 lt!231287) (bitIndex!0 (size!3015 (buf!3480 (_2!6958 lt!231282))) (currentByte!6388 (_2!6958 lt!231282)) (currentBit!6383 (_2!6958 lt!231282)))))))

(assert (=> d!48257 (or (not (= (bvand lt!231296 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!231287 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!231296 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!231296 lt!231287) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!231281 () (_ BitVec 64))

(assert (=> d!48257 (= lt!231287 (bvmul lt!231281 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!48257 (or (= lt!231281 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!231281 #b0000000000000000000000000000000000000000000000000000000000001000) lt!231281)))))

(assert (=> d!48257 (= lt!231281 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!48257 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!48257 (= lt!231296 (bitIndex!0 (size!3015 (buf!3480 (_1!6955 lt!230270))) (currentByte!6388 (_1!6955 lt!230270)) (currentBit!6383 (_1!6955 lt!230270))))))

(declare-fun e!98953 () tuple3!576)

(assert (=> d!48257 (= lt!231282 e!98953)))

(declare-fun c!8022 () Bool)

(assert (=> d!48257 (= c!8022 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!48257 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!3015 arr!237)))))

(assert (=> d!48257 (= (readByteArrayLoop!0 (_1!6955 lt!230270) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!231282)))

(declare-fun lt!231313 () Unit!9318)

(declare-fun b!148344 () Bool)

(assert (=> b!148344 (= e!98953 (tuple3!577 lt!231313 (_1!6955 lt!230270) arr!237))))

(declare-fun call!2022 () (_ BitVec 64))

(assert (=> b!148344 (= call!2022 call!2022)))

(declare-fun lt!231293 () Unit!9318)

(declare-fun Unit!9363 () Unit!9318)

(assert (=> b!148344 (= lt!231293 Unit!9363)))

(declare-fun lt!231298 () Unit!9318)

(assert (=> b!148344 (= lt!231298 (arrayRangesEqReflexiveLemma!14 arr!237))))

(declare-fun call!2023 () Bool)

(assert (=> b!148344 call!2023))

(declare-fun lt!231286 () Unit!9318)

(assert (=> b!148344 (= lt!231286 lt!231298)))

(declare-fun lt!231283 () array!6663)

(assert (=> b!148344 (= lt!231283 arr!237)))

(declare-fun lt!231299 () array!6663)

(assert (=> b!148344 (= lt!231299 arr!237)))

(declare-fun lt!231308 () (_ BitVec 32))

(assert (=> b!148344 (= lt!231308 #b00000000000000000000000000000000)))

(declare-fun lt!231306 () (_ BitVec 32))

(assert (=> b!148344 (= lt!231306 (size!3015 arr!237))))

(declare-fun lt!231311 () (_ BitVec 32))

(assert (=> b!148344 (= lt!231311 #b00000000000000000000000000000000)))

(declare-fun lt!231307 () (_ BitVec 32))

(assert (=> b!148344 (= lt!231307 (bvadd #b00000000000000000000000000000001 from!447))))

(assert (=> b!148344 (= lt!231313 (arrayRangesEqSlicedLemma!14 lt!231283 lt!231299 lt!231308 lt!231306 lt!231311 lt!231307))))

(declare-fun call!2021 () Bool)

(assert (=> b!148344 call!2021))

(declare-fun lt!231289 () tuple3!576)

(declare-fun bm!2018 () Bool)

(assert (=> bm!2018 (= call!2021 (arrayRangesEq!331 (ite c!8022 arr!237 lt!231283) (ite c!8022 (_3!359 lt!231289) lt!231299) (ite c!8022 #b00000000000000000000000000000000 lt!231311) (ite c!8022 (bvadd #b00000000000000000000000000000001 from!447) lt!231307)))))

(declare-fun b!148345 () Bool)

(assert (=> b!148345 (= e!98952 (arrayRangesEq!331 arr!237 (_3!359 lt!231282) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun b!148346 () Bool)

(assert (=> b!148346 (= e!98951 (= (select (arr!3784 (_3!359 lt!231282)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!6956 (readBytePure!0 (_1!6955 lt!230270)))))))

(assert (=> b!148346 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!3015 (_3!359 lt!231282))))))

(declare-fun bm!2019 () Bool)

(assert (=> bm!2019 (= call!2022 (bitIndex!0 (size!3015 (buf!3480 (_1!6955 lt!230270))) (currentByte!6388 (_1!6955 lt!230270)) (currentBit!6383 (_1!6955 lt!230270))))))

(declare-fun lt!231303 () (_ BitVec 32))

(declare-fun bm!2020 () Bool)

(assert (=> bm!2020 (= call!2023 (arrayRangesEq!331 arr!237 (ite c!8022 (_3!359 lt!231289) arr!237) (ite c!8022 lt!231303 #b00000000000000000000000000000000) (ite c!8022 (bvadd #b00000000000000000000000000000001 from!447) (size!3015 arr!237))))))

(declare-fun b!148347 () Bool)

(declare-fun lt!231304 () Unit!9318)

(assert (=> b!148347 (= e!98953 (tuple3!577 lt!231304 (_2!6958 lt!231289) (_3!359 lt!231289)))))

(declare-fun lt!231284 () tuple2!13196)

(assert (=> b!148347 (= lt!231284 (readByte!0 (_1!6955 lt!230270)))))

(declare-fun lt!231309 () array!6663)

(assert (=> b!148347 (= lt!231309 (array!6664 (store (arr!3784 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6957 lt!231284)) (size!3015 arr!237)))))

(declare-fun lt!231295 () (_ BitVec 64))

(assert (=> b!148347 (= lt!231295 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!231301 () (_ BitVec 32))

(assert (=> b!148347 (= lt!231301 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!231280 () Unit!9318)

(assert (=> b!148347 (= lt!231280 (validateOffsetBytesFromBitIndexLemma!0 (_1!6955 lt!230270) (_2!6957 lt!231284) lt!231295 lt!231301))))

(assert (=> b!148347 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6957 lt!231284)))) ((_ sign_extend 32) (currentByte!6388 (_2!6957 lt!231284))) ((_ sign_extend 32) (currentBit!6383 (_2!6957 lt!231284))) (bvsub lt!231301 ((_ extract 31 0) (bvsdiv (bvadd lt!231295 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!231291 () Unit!9318)

(assert (=> b!148347 (= lt!231291 lt!231280)))

(assert (=> b!148347 (= lt!231289 (readByteArrayLoop!0 (_2!6957 lt!231284) lt!231309 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!148347 (= (bitIndex!0 (size!3015 (buf!3480 (_2!6957 lt!231284))) (currentByte!6388 (_2!6957 lt!231284)) (currentBit!6383 (_2!6957 lt!231284))) (bvadd call!2022 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!231305 () Unit!9318)

(declare-fun Unit!9364 () Unit!9318)

(assert (=> b!148347 (= lt!231305 Unit!9364)))

(assert (=> b!148347 (= (bvadd (bitIndex!0 (size!3015 (buf!3480 (_2!6957 lt!231284))) (currentByte!6388 (_2!6957 lt!231284)) (currentBit!6383 (_2!6957 lt!231284))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3015 (buf!3480 (_2!6958 lt!231289))) (currentByte!6388 (_2!6958 lt!231289)) (currentBit!6383 (_2!6958 lt!231289))))))

(declare-fun lt!231288 () Unit!9318)

(declare-fun Unit!9365 () Unit!9318)

(assert (=> b!148347 (= lt!231288 Unit!9365)))

(assert (=> b!148347 (= (bvadd call!2022 (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3015 (buf!3480 (_2!6958 lt!231289))) (currentByte!6388 (_2!6958 lt!231289)) (currentBit!6383 (_2!6958 lt!231289))))))

(declare-fun lt!231297 () Unit!9318)

(declare-fun Unit!9366 () Unit!9318)

(assert (=> b!148347 (= lt!231297 Unit!9366)))

(assert (=> b!148347 (and (= (buf!3480 (_1!6955 lt!230270)) (buf!3480 (_2!6958 lt!231289))) (= (size!3015 arr!237) (size!3015 (_3!359 lt!231289))))))

(declare-fun lt!231278 () Unit!9318)

(declare-fun Unit!9367 () Unit!9318)

(assert (=> b!148347 (= lt!231278 Unit!9367)))

(declare-fun lt!231292 () Unit!9318)

(assert (=> b!148347 (= lt!231292 (arrayUpdatedAtPrefixLemma!14 arr!237 (bvadd #b00000000000000000000000000000001 from!447) (_1!6957 lt!231284)))))

(assert (=> b!148347 (arrayRangesEq!331 arr!237 (array!6664 (store (arr!3784 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6957 lt!231284)) (size!3015 arr!237)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!231302 () Unit!9318)

(assert (=> b!148347 (= lt!231302 lt!231292)))

(assert (=> b!148347 (= lt!231303 #b00000000000000000000000000000000)))

(declare-fun lt!231312 () Unit!9318)

(assert (=> b!148347 (= lt!231312 (arrayRangesEqTransitive!54 arr!237 lt!231309 (_3!359 lt!231289) lt!231303 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!148347 call!2023))

(declare-fun lt!231300 () Unit!9318)

(assert (=> b!148347 (= lt!231300 lt!231312)))

(assert (=> b!148347 call!2021))

(declare-fun lt!231285 () Unit!9318)

(declare-fun Unit!9368 () Unit!9318)

(assert (=> b!148347 (= lt!231285 Unit!9368)))

(declare-fun lt!231294 () Unit!9318)

(assert (=> b!148347 (= lt!231294 (arrayRangesEqImpliesEq!14 lt!231309 (_3!359 lt!231289) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!148347 (= (select (store (arr!3784 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6957 lt!231284)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3784 (_3!359 lt!231289)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!231279 () Unit!9318)

(assert (=> b!148347 (= lt!231279 lt!231294)))

(declare-fun lt!231290 () Bool)

(assert (=> b!148347 (= lt!231290 (= (select (arr!3784 (_3!359 lt!231289)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!6957 lt!231284)))))

(declare-fun Unit!9369 () Unit!9318)

(assert (=> b!148347 (= lt!231304 Unit!9369)))

(assert (=> b!148347 lt!231290))

(assert (= (and d!48257 c!8022) b!148347))

(assert (= (and d!48257 (not c!8022)) b!148344))

(assert (= (or b!148347 b!148344) bm!2018))

(assert (= (or b!148347 b!148344) bm!2020))

(assert (= (or b!148347 b!148344) bm!2019))

(assert (= (and d!48257 res!124176) b!148343))

(assert (= (and b!148343 res!124177) b!148345))

(assert (= (and d!48257 (not res!124175)) b!148346))

(declare-fun m!230203 () Bool)

(assert (=> bm!2019 m!230203))

(declare-fun m!230205 () Bool)

(assert (=> b!148346 m!230205))

(declare-fun m!230207 () Bool)

(assert (=> b!148346 m!230207))

(declare-fun m!230209 () Bool)

(assert (=> bm!2018 m!230209))

(declare-fun m!230211 () Bool)

(assert (=> bm!2020 m!230211))

(declare-fun m!230213 () Bool)

(assert (=> d!48257 m!230213))

(assert (=> d!48257 m!230203))

(declare-fun m!230215 () Bool)

(assert (=> b!148345 m!230215))

(assert (=> b!148344 m!230171))

(declare-fun m!230217 () Bool)

(assert (=> b!148344 m!230217))

(declare-fun m!230219 () Bool)

(assert (=> b!148347 m!230219))

(declare-fun m!230221 () Bool)

(assert (=> b!148347 m!230221))

(declare-fun m!230223 () Bool)

(assert (=> b!148347 m!230223))

(declare-fun m!230225 () Bool)

(assert (=> b!148347 m!230225))

(declare-fun m!230227 () Bool)

(assert (=> b!148347 m!230227))

(declare-fun m!230229 () Bool)

(assert (=> b!148347 m!230229))

(declare-fun m!230231 () Bool)

(assert (=> b!148347 m!230231))

(declare-fun m!230233 () Bool)

(assert (=> b!148347 m!230233))

(declare-fun m!230235 () Bool)

(assert (=> b!148347 m!230235))

(declare-fun m!230237 () Bool)

(assert (=> b!148347 m!230237))

(declare-fun m!230239 () Bool)

(assert (=> b!148347 m!230239))

(declare-fun m!230241 () Bool)

(assert (=> b!148347 m!230241))

(declare-fun m!230243 () Bool)

(assert (=> b!148347 m!230243))

(assert (=> d!48015 d!48257))

(declare-fun d!48259 () Bool)

(declare-fun lt!231314 () tuple2!13196)

(assert (=> d!48259 (= lt!231314 (readByte!0 (_1!6955 lt!230542)))))

(assert (=> d!48259 (= (readBytePure!0 (_1!6955 lt!230542)) (tuple2!13195 (_2!6957 lt!231314) (_1!6957 lt!231314)))))

(declare-fun bs!11781 () Bool)

(assert (= bs!11781 d!48259))

(declare-fun m!230245 () Bool)

(assert (=> bs!11781 m!230245))

(assert (=> b!148023 d!48259))

(declare-fun d!48261 () Bool)

(declare-fun e!98955 () Bool)

(assert (=> d!48261 e!98955))

(declare-fun res!124178 () Bool)

(assert (=> d!48261 (=> (not res!124178) (not e!98955))))

(declare-fun lt!231327 () tuple2!13192)

(assert (=> d!48261 (= res!124178 (isPrefixOf!0 (_1!6955 lt!231327) (_2!6955 lt!231327)))))

(declare-fun lt!231325 () BitStream!5288)

(assert (=> d!48261 (= lt!231327 (tuple2!13193 lt!231325 (_2!6953 lt!230545)))))

(declare-fun lt!231319 () Unit!9318)

(declare-fun lt!231321 () Unit!9318)

(assert (=> d!48261 (= lt!231319 lt!231321)))

(assert (=> d!48261 (isPrefixOf!0 lt!231325 (_2!6953 lt!230545))))

(assert (=> d!48261 (= lt!231321 (lemmaIsPrefixTransitive!0 lt!231325 (_2!6953 lt!230545) (_2!6953 lt!230545)))))

(declare-fun lt!231315 () Unit!9318)

(declare-fun lt!231323 () Unit!9318)

(assert (=> d!48261 (= lt!231315 lt!231323)))

(assert (=> d!48261 (isPrefixOf!0 lt!231325 (_2!6953 lt!230545))))

(assert (=> d!48261 (= lt!231323 (lemmaIsPrefixTransitive!0 lt!231325 thiss!1634 (_2!6953 lt!230545)))))

(declare-fun lt!231330 () Unit!9318)

(declare-fun e!98954 () Unit!9318)

(assert (=> d!48261 (= lt!231330 e!98954)))

(declare-fun c!8023 () Bool)

(assert (=> d!48261 (= c!8023 (not (= (size!3015 (buf!3480 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!231320 () Unit!9318)

(declare-fun lt!231326 () Unit!9318)

(assert (=> d!48261 (= lt!231320 lt!231326)))

(assert (=> d!48261 (isPrefixOf!0 (_2!6953 lt!230545) (_2!6953 lt!230545))))

(assert (=> d!48261 (= lt!231326 (lemmaIsPrefixRefl!0 (_2!6953 lt!230545)))))

(declare-fun lt!231324 () Unit!9318)

(declare-fun lt!231332 () Unit!9318)

(assert (=> d!48261 (= lt!231324 lt!231332)))

(assert (=> d!48261 (= lt!231332 (lemmaIsPrefixRefl!0 (_2!6953 lt!230545)))))

(declare-fun lt!231334 () Unit!9318)

(declare-fun lt!231317 () Unit!9318)

(assert (=> d!48261 (= lt!231334 lt!231317)))

(assert (=> d!48261 (isPrefixOf!0 lt!231325 lt!231325)))

(assert (=> d!48261 (= lt!231317 (lemmaIsPrefixRefl!0 lt!231325))))

(declare-fun lt!231333 () Unit!9318)

(declare-fun lt!231328 () Unit!9318)

(assert (=> d!48261 (= lt!231333 lt!231328)))

(assert (=> d!48261 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!48261 (= lt!231328 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!48261 (= lt!231325 (BitStream!5289 (buf!3480 (_2!6953 lt!230545)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634)))))

(assert (=> d!48261 (isPrefixOf!0 thiss!1634 (_2!6953 lt!230545))))

(assert (=> d!48261 (= (reader!0 thiss!1634 (_2!6953 lt!230545)) lt!231327)))

(declare-fun b!148348 () Bool)

(declare-fun lt!231322 () (_ BitVec 64))

(declare-fun lt!231331 () (_ BitVec 64))

(assert (=> b!148348 (= e!98955 (= (_1!6955 lt!231327) (withMovedBitIndex!0 (_2!6955 lt!231327) (bvsub lt!231331 lt!231322))))))

(assert (=> b!148348 (or (= (bvand lt!231331 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!231322 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!231331 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!231331 lt!231322) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!148348 (= lt!231322 (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230545))) (currentByte!6388 (_2!6953 lt!230545)) (currentBit!6383 (_2!6953 lt!230545))))))

(assert (=> b!148348 (= lt!231331 (bitIndex!0 (size!3015 (buf!3480 thiss!1634)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634)))))

(declare-fun b!148349 () Bool)

(declare-fun res!124179 () Bool)

(assert (=> b!148349 (=> (not res!124179) (not e!98955))))

(assert (=> b!148349 (= res!124179 (isPrefixOf!0 (_1!6955 lt!231327) thiss!1634))))

(declare-fun b!148350 () Bool)

(declare-fun Unit!9370 () Unit!9318)

(assert (=> b!148350 (= e!98954 Unit!9370)))

(declare-fun b!148351 () Bool)

(declare-fun lt!231318 () Unit!9318)

(assert (=> b!148351 (= e!98954 lt!231318)))

(declare-fun lt!231329 () (_ BitVec 64))

(assert (=> b!148351 (= lt!231329 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!231316 () (_ BitVec 64))

(assert (=> b!148351 (= lt!231316 (bitIndex!0 (size!3015 (buf!3480 thiss!1634)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634)))))

(assert (=> b!148351 (= lt!231318 (arrayBitRangesEqSymmetric!0 (buf!3480 thiss!1634) (buf!3480 (_2!6953 lt!230545)) lt!231329 lt!231316))))

(assert (=> b!148351 (arrayBitRangesEq!0 (buf!3480 (_2!6953 lt!230545)) (buf!3480 thiss!1634) lt!231329 lt!231316)))

(declare-fun b!148352 () Bool)

(declare-fun res!124180 () Bool)

(assert (=> b!148352 (=> (not res!124180) (not e!98955))))

(assert (=> b!148352 (= res!124180 (isPrefixOf!0 (_2!6955 lt!231327) (_2!6953 lt!230545)))))

(assert (= (and d!48261 c!8023) b!148351))

(assert (= (and d!48261 (not c!8023)) b!148350))

(assert (= (and d!48261 res!124178) b!148349))

(assert (= (and b!148349 res!124179) b!148352))

(assert (= (and b!148352 res!124180) b!148348))

(declare-fun m!230247 () Bool)

(assert (=> b!148349 m!230247))

(assert (=> b!148351 m!229207))

(declare-fun m!230249 () Bool)

(assert (=> b!148351 m!230249))

(declare-fun m!230251 () Bool)

(assert (=> b!148351 m!230251))

(declare-fun m!230253 () Bool)

(assert (=> b!148348 m!230253))

(assert (=> b!148348 m!229447))

(assert (=> b!148348 m!229207))

(declare-fun m!230255 () Bool)

(assert (=> d!48261 m!230255))

(declare-fun m!230257 () Bool)

(assert (=> d!48261 m!230257))

(declare-fun m!230259 () Bool)

(assert (=> d!48261 m!230259))

(assert (=> d!48261 m!229449))

(declare-fun m!230261 () Bool)

(assert (=> d!48261 m!230261))

(declare-fun m!230263 () Bool)

(assert (=> d!48261 m!230263))

(declare-fun m!230265 () Bool)

(assert (=> d!48261 m!230265))

(declare-fun m!230267 () Bool)

(assert (=> d!48261 m!230267))

(assert (=> d!48261 m!229317))

(declare-fun m!230269 () Bool)

(assert (=> d!48261 m!230269))

(assert (=> d!48261 m!229321))

(declare-fun m!230271 () Bool)

(assert (=> b!148352 m!230271))

(assert (=> b!148023 d!48261))

(assert (=> b!148037 d!48013))

(declare-fun d!48263 () Bool)

(assert (=> d!48263 (arrayBitRangesEq!0 (buf!3480 (_2!6953 lt!230274)) (buf!3480 thiss!1634) lt!230585 lt!230572)))

(declare-fun lt!231335 () Unit!9318)

(assert (=> d!48263 (= lt!231335 (choose!8 (buf!3480 thiss!1634) (buf!3480 (_2!6953 lt!230274)) lt!230585 lt!230572))))

(assert (=> d!48263 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!230585) (bvsle lt!230585 lt!230572))))

(assert (=> d!48263 (= (arrayBitRangesEqSymmetric!0 (buf!3480 thiss!1634) (buf!3480 (_2!6953 lt!230274)) lt!230585 lt!230572) lt!231335)))

(declare-fun bs!11782 () Bool)

(assert (= bs!11782 d!48263))

(assert (=> bs!11782 m!229503))

(declare-fun m!230273 () Bool)

(assert (=> bs!11782 m!230273))

(assert (=> b!148037 d!48263))

(declare-fun d!48265 () Bool)

(declare-fun res!124182 () Bool)

(declare-fun e!98961 () Bool)

(assert (=> d!48265 (=> res!124182 e!98961)))

(assert (=> d!48265 (= res!124182 (bvsge lt!230585 lt!230572))))

(assert (=> d!48265 (= (arrayBitRangesEq!0 (buf!3480 (_2!6953 lt!230274)) (buf!3480 thiss!1634) lt!230585 lt!230572) e!98961)))

(declare-fun b!148353 () Bool)

(declare-fun e!98956 () Bool)

(declare-fun e!98959 () Bool)

(assert (=> b!148353 (= e!98956 e!98959)))

(declare-fun res!124181 () Bool)

(declare-fun lt!231337 () tuple4!142)

(declare-fun lt!231336 () (_ BitVec 32))

(assert (=> b!148353 (= res!124181 (byteRangesEq!0 (select (arr!3784 (buf!3480 (_2!6953 lt!230274))) (_3!362 lt!231337)) (select (arr!3784 (buf!3480 thiss!1634)) (_3!362 lt!231337)) lt!231336 #b00000000000000000000000000001000))))

(assert (=> b!148353 (=> (not res!124181) (not e!98959))))

(declare-fun call!2024 () Bool)

(declare-fun bm!2021 () Bool)

(declare-fun c!8024 () Bool)

(declare-fun lt!231338 () (_ BitVec 32))

(assert (=> bm!2021 (= call!2024 (byteRangesEq!0 (ite c!8024 (select (arr!3784 (buf!3480 (_2!6953 lt!230274))) (_3!362 lt!231337)) (select (arr!3784 (buf!3480 (_2!6953 lt!230274))) (_4!71 lt!231337))) (ite c!8024 (select (arr!3784 (buf!3480 thiss!1634)) (_3!362 lt!231337)) (select (arr!3784 (buf!3480 thiss!1634)) (_4!71 lt!231337))) (ite c!8024 lt!231336 #b00000000000000000000000000000000) lt!231338))))

(declare-fun b!148354 () Bool)

(declare-fun res!124183 () Bool)

(assert (=> b!148354 (= res!124183 (= lt!231338 #b00000000000000000000000000000000))))

(declare-fun e!98958 () Bool)

(assert (=> b!148354 (=> res!124183 e!98958)))

(assert (=> b!148354 (= e!98959 e!98958)))

(declare-fun b!148355 () Bool)

(declare-fun e!98960 () Bool)

(assert (=> b!148355 (= e!98961 e!98960)))

(declare-fun res!124184 () Bool)

(assert (=> b!148355 (=> (not res!124184) (not e!98960))))

(declare-fun e!98957 () Bool)

(assert (=> b!148355 (= res!124184 e!98957)))

(declare-fun res!124185 () Bool)

(assert (=> b!148355 (=> res!124185 e!98957)))

(assert (=> b!148355 (= res!124185 (bvsge (_1!6964 lt!231337) (_2!6964 lt!231337)))))

(assert (=> b!148355 (= lt!231338 ((_ extract 31 0) (bvsrem lt!230572 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!148355 (= lt!231336 ((_ extract 31 0) (bvsrem lt!230585 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!148355 (= lt!231337 (arrayBitIndices!0 lt!230585 lt!230572))))

(declare-fun b!148356 () Bool)

(assert (=> b!148356 (= e!98958 call!2024)))

(declare-fun b!148357 () Bool)

(assert (=> b!148357 (= e!98960 e!98956)))

(assert (=> b!148357 (= c!8024 (= (_3!362 lt!231337) (_4!71 lt!231337)))))

(declare-fun b!148358 () Bool)

(assert (=> b!148358 (= e!98957 (arrayRangesEq!331 (buf!3480 (_2!6953 lt!230274)) (buf!3480 thiss!1634) (_1!6964 lt!231337) (_2!6964 lt!231337)))))

(declare-fun b!148359 () Bool)

(assert (=> b!148359 (= e!98956 call!2024)))

(assert (= (and d!48265 (not res!124182)) b!148355))

(assert (= (and b!148355 (not res!124185)) b!148358))

(assert (= (and b!148355 res!124184) b!148357))

(assert (= (and b!148357 c!8024) b!148359))

(assert (= (and b!148357 (not c!8024)) b!148353))

(assert (= (and b!148353 res!124181) b!148354))

(assert (= (and b!148354 (not res!124183)) b!148356))

(assert (= (or b!148359 b!148356) bm!2021))

(declare-fun m!230275 () Bool)

(assert (=> b!148353 m!230275))

(declare-fun m!230277 () Bool)

(assert (=> b!148353 m!230277))

(assert (=> b!148353 m!230275))

(assert (=> b!148353 m!230277))

(declare-fun m!230279 () Bool)

(assert (=> b!148353 m!230279))

(declare-fun m!230281 () Bool)

(assert (=> bm!2021 m!230281))

(declare-fun m!230283 () Bool)

(assert (=> bm!2021 m!230283))

(assert (=> bm!2021 m!230277))

(declare-fun m!230285 () Bool)

(assert (=> bm!2021 m!230285))

(assert (=> bm!2021 m!230275))

(declare-fun m!230287 () Bool)

(assert (=> b!148355 m!230287))

(declare-fun m!230289 () Bool)

(assert (=> b!148358 m!230289))

(assert (=> b!148037 d!48265))

(declare-fun lt!231339 () (_ BitVec 8))

(declare-fun d!48267 () Bool)

(declare-fun lt!231342 () (_ BitVec 8))

(assert (=> d!48267 (= lt!231339 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3784 (buf!3480 (BitStream!5289 (buf!3480 (_2!6953 lt!230274)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634)))) (currentByte!6388 (BitStream!5289 (buf!3480 (_2!6953 lt!230274)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634))))) ((_ sign_extend 24) lt!231342))))))

(assert (=> d!48267 (= lt!231342 ((_ extract 7 0) (currentBit!6383 (BitStream!5289 (buf!3480 (_2!6953 lt!230274)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634)))))))

(declare-fun e!98963 () Bool)

(assert (=> d!48267 e!98963))

(declare-fun res!124187 () Bool)

(assert (=> d!48267 (=> (not res!124187) (not e!98963))))

(assert (=> d!48267 (= res!124187 (validate_offset_bits!1 ((_ sign_extend 32) (size!3015 (buf!3480 (BitStream!5289 (buf!3480 (_2!6953 lt!230274)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634))))) ((_ sign_extend 32) (currentByte!6388 (BitStream!5289 (buf!3480 (_2!6953 lt!230274)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634)))) ((_ sign_extend 32) (currentBit!6383 (BitStream!5289 (buf!3480 (_2!6953 lt!230274)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634)))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!9371 () Unit!9318)

(declare-fun Unit!9372 () Unit!9318)

(assert (=> d!48267 (= (readByte!0 (BitStream!5289 (buf!3480 (_2!6953 lt!230274)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634))) (tuple2!13197 (_2!6963 (ite (bvsgt ((_ sign_extend 24) lt!231342) #b00000000000000000000000000000000) (tuple2!13203 Unit!9371 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!231339) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3784 (buf!3480 (BitStream!5289 (buf!3480 (_2!6953 lt!230274)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634)))) (bvadd (currentByte!6388 (BitStream!5289 (buf!3480 (_2!6953 lt!230274)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!231342)))))))) (tuple2!13203 Unit!9372 lt!231339))) (BitStream!5289 (buf!3480 (BitStream!5289 (buf!3480 (_2!6953 lt!230274)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634))) (bvadd (currentByte!6388 (BitStream!5289 (buf!3480 (_2!6953 lt!230274)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634))) #b00000000000000000000000000000001) (currentBit!6383 (BitStream!5289 (buf!3480 (_2!6953 lt!230274)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634))))))))

(declare-fun b!148360 () Bool)

(declare-fun e!98962 () Bool)

(assert (=> b!148360 (= e!98963 e!98962)))

(declare-fun res!124186 () Bool)

(assert (=> b!148360 (=> (not res!124186) (not e!98962))))

(declare-fun lt!231343 () tuple2!13196)

(assert (=> b!148360 (= res!124186 (= (buf!3480 (_2!6957 lt!231343)) (buf!3480 (BitStream!5289 (buf!3480 (_2!6953 lt!230274)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634)))))))

(declare-fun lt!231341 () (_ BitVec 8))

(declare-fun lt!231340 () (_ BitVec 8))

(declare-fun Unit!9373 () Unit!9318)

(declare-fun Unit!9374 () Unit!9318)

(assert (=> b!148360 (= lt!231343 (tuple2!13197 (_2!6963 (ite (bvsgt ((_ sign_extend 24) lt!231340) #b00000000000000000000000000000000) (tuple2!13203 Unit!9373 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!231341) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3784 (buf!3480 (BitStream!5289 (buf!3480 (_2!6953 lt!230274)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634)))) (bvadd (currentByte!6388 (BitStream!5289 (buf!3480 (_2!6953 lt!230274)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!231340)))))))) (tuple2!13203 Unit!9374 lt!231341))) (BitStream!5289 (buf!3480 (BitStream!5289 (buf!3480 (_2!6953 lt!230274)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634))) (bvadd (currentByte!6388 (BitStream!5289 (buf!3480 (_2!6953 lt!230274)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634))) #b00000000000000000000000000000001) (currentBit!6383 (BitStream!5289 (buf!3480 (_2!6953 lt!230274)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634))))))))

(assert (=> b!148360 (= lt!231341 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3784 (buf!3480 (BitStream!5289 (buf!3480 (_2!6953 lt!230274)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634)))) (currentByte!6388 (BitStream!5289 (buf!3480 (_2!6953 lt!230274)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634))))) ((_ sign_extend 24) lt!231340))))))

(assert (=> b!148360 (= lt!231340 ((_ extract 7 0) (currentBit!6383 (BitStream!5289 (buf!3480 (_2!6953 lt!230274)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634)))))))

(declare-fun b!148361 () Bool)

(declare-fun lt!231345 () (_ BitVec 64))

(declare-fun lt!231344 () (_ BitVec 64))

(assert (=> b!148361 (= e!98962 (= (bitIndex!0 (size!3015 (buf!3480 (_2!6957 lt!231343))) (currentByte!6388 (_2!6957 lt!231343)) (currentBit!6383 (_2!6957 lt!231343))) (bvadd lt!231345 lt!231344)))))

(assert (=> b!148361 (or (not (= (bvand lt!231345 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!231344 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!231345 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!231345 lt!231344) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!148361 (= lt!231344 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!148361 (= lt!231345 (bitIndex!0 (size!3015 (buf!3480 (BitStream!5289 (buf!3480 (_2!6953 lt!230274)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634)))) (currentByte!6388 (BitStream!5289 (buf!3480 (_2!6953 lt!230274)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634))) (currentBit!6383 (BitStream!5289 (buf!3480 (_2!6953 lt!230274)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634)))))))

(assert (= (and d!48267 res!124187) b!148360))

(assert (= (and b!148360 res!124186) b!148361))

(declare-fun m!230291 () Bool)

(assert (=> d!48267 m!230291))

(declare-fun m!230293 () Bool)

(assert (=> d!48267 m!230293))

(declare-fun m!230295 () Bool)

(assert (=> d!48267 m!230295))

(assert (=> b!148360 m!230295))

(assert (=> b!148360 m!230291))

(declare-fun m!230297 () Bool)

(assert (=> b!148361 m!230297))

(declare-fun m!230299 () Bool)

(assert (=> b!148361 m!230299))

(assert (=> d!47995 d!48267))

(declare-fun d!48269 () Bool)

(declare-fun e!98966 () Bool)

(assert (=> d!48269 e!98966))

(declare-fun res!124190 () Bool)

(assert (=> d!48269 (=> (not res!124190) (not e!98966))))

(declare-fun lt!231350 () BitStream!5288)

(declare-fun lt!231351 () (_ BitVec 64))

(assert (=> d!48269 (= res!124190 (= (bvadd lt!231351 (bvsub lt!230339 lt!230330)) (bitIndex!0 (size!3015 (buf!3480 lt!231350)) (currentByte!6388 lt!231350) (currentBit!6383 lt!231350))))))

(assert (=> d!48269 (or (not (= (bvand lt!231351 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!230339 lt!230330) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!231351 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!231351 (bvsub lt!230339 lt!230330)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48269 (= lt!231351 (bitIndex!0 (size!3015 (buf!3480 (_2!6955 lt!230335))) (currentByte!6388 (_2!6955 lt!230335)) (currentBit!6383 (_2!6955 lt!230335))))))

(declare-fun moveBitIndex!0 (BitStream!5288 (_ BitVec 64)) tuple2!13188)

(assert (=> d!48269 (= lt!231350 (_2!6953 (moveBitIndex!0 (_2!6955 lt!230335) (bvsub lt!230339 lt!230330))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!5288 (_ BitVec 64)) Bool)

(assert (=> d!48269 (moveBitIndexPrecond!0 (_2!6955 lt!230335) (bvsub lt!230339 lt!230330))))

(assert (=> d!48269 (= (withMovedBitIndex!0 (_2!6955 lt!230335) (bvsub lt!230339 lt!230330)) lt!231350)))

(declare-fun b!148364 () Bool)

(assert (=> b!148364 (= e!98966 (= (size!3015 (buf!3480 (_2!6955 lt!230335))) (size!3015 (buf!3480 lt!231350))))))

(assert (= (and d!48269 res!124190) b!148364))

(declare-fun m!230301 () Bool)

(assert (=> d!48269 m!230301))

(declare-fun m!230303 () Bool)

(assert (=> d!48269 m!230303))

(declare-fun m!230305 () Bool)

(assert (=> d!48269 m!230305))

(declare-fun m!230307 () Bool)

(assert (=> d!48269 m!230307))

(assert (=> b!147947 d!48269))

(assert (=> b!147947 d!48009))

(assert (=> b!147947 d!48013))

(declare-fun d!48271 () Bool)

(assert (=> d!48271 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230272)))) ((_ sign_extend 32) (currentByte!6388 (_2!6953 lt!230272))) ((_ sign_extend 32) (currentBit!6383 (_2!6953 lt!230272))) (bvsub (bvsub to!404 from!447) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!48271 true))

(declare-fun _$7!85 () Unit!9318)

(assert (=> d!48271 (= (choose!57 thiss!1634 (_2!6953 lt!230272) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) _$7!85)))

(declare-fun bs!11783 () Bool)

(assert (= bs!11783 d!48271))

(declare-fun m!230309 () Bool)

(assert (=> bs!11783 m!230309))

(assert (=> d!47986 d!48271))

(assert (=> d!47964 d!47924))

(declare-fun d!48273 () Bool)

(assert (=> d!48273 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230274)))) ((_ sign_extend 32) (currentByte!6388 (_2!6953 lt!230272))) ((_ sign_extend 32) (currentBit!6383 (_2!6953 lt!230272))) lt!230257)))

(assert (=> d!48273 true))

(declare-fun _$5!79 () Unit!9318)

(assert (=> d!48273 (= (choose!26 (_2!6953 lt!230272) (buf!3480 (_2!6953 lt!230274)) lt!230257 (BitStream!5289 (buf!3480 (_2!6953 lt!230274)) (currentByte!6388 (_2!6953 lt!230272)) (currentBit!6383 (_2!6953 lt!230272)))) _$5!79)))

(declare-fun bs!11784 () Bool)

(assert (= bs!11784 d!48273))

(assert (=> bs!11784 m!229229))

(assert (=> d!47964 d!48273))

(declare-fun d!48275 () Bool)

(declare-fun res!124193 () Bool)

(declare-fun e!98968 () Bool)

(assert (=> d!48275 (=> (not res!124193) (not e!98968))))

(assert (=> d!48275 (= res!124193 (= (size!3015 (buf!3480 (_2!6955 lt!230335))) (size!3015 (buf!3480 (_2!6953 lt!230272)))))))

(assert (=> d!48275 (= (isPrefixOf!0 (_2!6955 lt!230335) (_2!6953 lt!230272)) e!98968)))

(declare-fun b!148365 () Bool)

(declare-fun res!124192 () Bool)

(assert (=> b!148365 (=> (not res!124192) (not e!98968))))

(assert (=> b!148365 (= res!124192 (bvsle (bitIndex!0 (size!3015 (buf!3480 (_2!6955 lt!230335))) (currentByte!6388 (_2!6955 lt!230335)) (currentBit!6383 (_2!6955 lt!230335))) (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230272))) (currentByte!6388 (_2!6953 lt!230272)) (currentBit!6383 (_2!6953 lt!230272)))))))

(declare-fun b!148366 () Bool)

(declare-fun e!98967 () Bool)

(assert (=> b!148366 (= e!98968 e!98967)))

(declare-fun res!124191 () Bool)

(assert (=> b!148366 (=> res!124191 e!98967)))

(assert (=> b!148366 (= res!124191 (= (size!3015 (buf!3480 (_2!6955 lt!230335))) #b00000000000000000000000000000000))))

(declare-fun b!148367 () Bool)

(assert (=> b!148367 (= e!98967 (arrayBitRangesEq!0 (buf!3480 (_2!6955 lt!230335)) (buf!3480 (_2!6953 lt!230272)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3015 (buf!3480 (_2!6955 lt!230335))) (currentByte!6388 (_2!6955 lt!230335)) (currentBit!6383 (_2!6955 lt!230335)))))))

(assert (= (and d!48275 res!124193) b!148365))

(assert (= (and b!148365 res!124192) b!148366))

(assert (= (and b!148366 (not res!124191)) b!148367))

(assert (=> b!148365 m!230303))

(assert (=> b!148365 m!229205))

(assert (=> b!148367 m!230303))

(assert (=> b!148367 m!230303))

(declare-fun m!230311 () Bool)

(assert (=> b!148367 m!230311))

(assert (=> b!147951 d!48275))

(assert (=> d!48019 d!48017))

(declare-fun d!48277 () Bool)

(assert (=> d!48277 (validate_offset_bits!1 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230274)))) ((_ sign_extend 32) (currentByte!6388 (_2!6953 lt!230272))) ((_ sign_extend 32) (currentBit!6383 (_2!6953 lt!230272))) lt!230273)))

(assert (=> d!48277 true))

(declare-fun _$6!322 () Unit!9318)

(assert (=> d!48277 (= (choose!9 (_2!6953 lt!230272) (buf!3480 (_2!6953 lt!230274)) lt!230273 (BitStream!5289 (buf!3480 (_2!6953 lt!230274)) (currentByte!6388 (_2!6953 lt!230272)) (currentBit!6383 (_2!6953 lt!230272)))) _$6!322)))

(declare-fun bs!11785 () Bool)

(assert (= bs!11785 d!48277))

(assert (=> bs!11785 m!229279))

(assert (=> d!48019 d!48277))

(declare-fun d!48279 () Bool)

(declare-fun e!98969 () Bool)

(assert (=> d!48279 e!98969))

(declare-fun res!124194 () Bool)

(assert (=> d!48279 (=> (not res!124194) (not e!98969))))

(declare-fun lt!231353 () (_ BitVec 64))

(declare-fun lt!231352 () BitStream!5288)

(assert (=> d!48279 (= res!124194 (= (bvadd lt!231353 (bvsub lt!230563 lt!230554)) (bitIndex!0 (size!3015 (buf!3480 lt!231352)) (currentByte!6388 lt!231352) (currentBit!6383 lt!231352))))))

(assert (=> d!48279 (or (not (= (bvand lt!231353 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!230563 lt!230554) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!231353 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!231353 (bvsub lt!230563 lt!230554)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48279 (= lt!231353 (bitIndex!0 (size!3015 (buf!3480 (_2!6955 lt!230559))) (currentByte!6388 (_2!6955 lt!230559)) (currentBit!6383 (_2!6955 lt!230559))))))

(assert (=> d!48279 (= lt!231352 (_2!6953 (moveBitIndex!0 (_2!6955 lt!230559) (bvsub lt!230563 lt!230554))))))

(assert (=> d!48279 (moveBitIndexPrecond!0 (_2!6955 lt!230559) (bvsub lt!230563 lt!230554))))

(assert (=> d!48279 (= (withMovedBitIndex!0 (_2!6955 lt!230559) (bvsub lt!230563 lt!230554)) lt!231352)))

(declare-fun b!148368 () Bool)

(assert (=> b!148368 (= e!98969 (= (size!3015 (buf!3480 (_2!6955 lt!230559))) (size!3015 (buf!3480 lt!231352))))))

(assert (= (and d!48279 res!124194) b!148368))

(declare-fun m!230313 () Bool)

(assert (=> d!48279 m!230313))

(assert (=> d!48279 m!229945))

(declare-fun m!230315 () Bool)

(assert (=> d!48279 m!230315))

(declare-fun m!230317 () Bool)

(assert (=> d!48279 m!230317))

(assert (=> b!148024 d!48279))

(assert (=> b!148024 d!48022))

(assert (=> b!148024 d!48009))

(declare-fun d!48281 () Bool)

(assert (=> d!48281 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230272)))) ((_ sign_extend 32) (currentByte!6388 (_2!6953 lt!230272))) ((_ sign_extend 32) (currentBit!6383 (_2!6953 lt!230272))) lt!230505) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230272)))) ((_ sign_extend 32) (currentByte!6388 (_2!6953 lt!230272))) ((_ sign_extend 32) (currentBit!6383 (_2!6953 lt!230272)))) lt!230505))))

(declare-fun bs!11786 () Bool)

(assert (= bs!11786 d!48281))

(assert (=> bs!11786 m!229497))

(assert (=> b!148009 d!48281))

(declare-fun d!48283 () Bool)

(declare-fun e!98980 () Bool)

(assert (=> d!48283 e!98980))

(declare-fun res!124204 () Bool)

(assert (=> d!48283 (=> (not res!124204) (not e!98980))))

(declare-fun _$39!54 () tuple2!13188)

(assert (=> d!48283 (= res!124204 (= (size!3015 (buf!3480 (_2!6953 lt!230272))) (size!3015 (buf!3480 (_2!6953 _$39!54)))))))

(declare-fun e!98978 () Bool)

(assert (=> d!48283 (and (inv!12 (_2!6953 _$39!54)) e!98978)))

(assert (=> d!48283 (= (choose!64 (_2!6953 lt!230272) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) _$39!54)))

(declare-fun b!148379 () Bool)

(assert (=> b!148379 (= e!98978 (array_inv!2804 (buf!3480 (_2!6953 _$39!54))))))

(declare-fun b!148380 () Bool)

(declare-fun res!124205 () Bool)

(assert (=> b!148380 (=> (not res!124205) (not e!98980))))

(assert (=> b!148380 (= res!124205 (isPrefixOf!0 (_2!6953 lt!230272) (_2!6953 _$39!54)))))

(declare-fun b!148381 () Bool)

(declare-fun res!124206 () Bool)

(assert (=> b!148381 (=> (not res!124206) (not e!98980))))

(assert (=> b!148381 (= res!124206 (= (bitIndex!0 (size!3015 (buf!3480 (_2!6953 _$39!54))) (currentByte!6388 (_2!6953 _$39!54)) (currentBit!6383 (_2!6953 _$39!54))) (bvadd (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230272))) (currentByte!6388 (_2!6953 lt!230272)) (currentBit!6383 (_2!6953 lt!230272))) (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!148382 () Bool)

(declare-fun e!98981 () Bool)

(assert (=> b!148382 (= e!98980 e!98981)))

(declare-fun res!124203 () Bool)

(assert (=> b!148382 (=> (not res!124203) (not e!98981))))

(declare-fun lt!231367 () tuple2!13192)

(declare-fun lt!231366 () tuple2!13190)

(assert (=> b!148382 (= res!124203 (and (= (size!3015 (_2!6954 lt!231366)) (size!3015 arr!237)) (= (_1!6954 lt!231366) (_2!6955 lt!231367))))))

(assert (=> b!148382 (= lt!231366 (readByteArrayLoopPure!0 (_1!6955 lt!231367) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!231365 () Unit!9318)

(declare-fun lt!231368 () Unit!9318)

(assert (=> b!148382 (= lt!231365 lt!231368)))

(declare-fun lt!231364 () (_ BitVec 64))

(assert (=> b!148382 (validate_offset_bits!1 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 _$39!54)))) ((_ sign_extend 32) (currentByte!6388 (_2!6953 lt!230272))) ((_ sign_extend 32) (currentBit!6383 (_2!6953 lt!230272))) lt!231364)))

(assert (=> b!148382 (= lt!231368 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6953 lt!230272) (buf!3480 (_2!6953 _$39!54)) lt!231364))))

(assert (=> b!148382 (= lt!231364 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!148382 (= lt!231367 (reader!0 (_2!6953 lt!230272) (_2!6953 _$39!54)))))

(declare-fun b!148383 () Bool)

(assert (=> b!148383 (= e!98981 (arrayRangesEq!331 arr!237 (_2!6954 lt!231366) #b00000000000000000000000000000000 to!404))))

(assert (= d!48283 b!148379))

(assert (= (and d!48283 res!124204) b!148381))

(assert (= (and b!148381 res!124206) b!148380))

(assert (= (and b!148380 res!124205) b!148382))

(assert (= (and b!148382 res!124203) b!148383))

(declare-fun m!230319 () Bool)

(assert (=> b!148380 m!230319))

(declare-fun m!230321 () Bool)

(assert (=> d!48283 m!230321))

(declare-fun m!230323 () Bool)

(assert (=> b!148383 m!230323))

(declare-fun m!230325 () Bool)

(assert (=> b!148381 m!230325))

(assert (=> b!148381 m!229205))

(declare-fun m!230327 () Bool)

(assert (=> b!148379 m!230327))

(declare-fun m!230329 () Bool)

(assert (=> b!148382 m!230329))

(declare-fun m!230331 () Bool)

(assert (=> b!148382 m!230331))

(declare-fun m!230333 () Bool)

(assert (=> b!148382 m!230333))

(declare-fun m!230335 () Bool)

(assert (=> b!148382 m!230335))

(assert (=> d!47938 d!48283))

(declare-fun d!48285 () Bool)

(declare-fun res!124207 () Bool)

(declare-fun e!98982 () Bool)

(assert (=> d!48285 (=> res!124207 e!98982)))

(assert (=> d!48285 (= res!124207 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!48285 (= (arrayRangesEq!331 arr!237 (_2!6954 lt!230261) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!98982)))

(declare-fun b!148384 () Bool)

(declare-fun e!98983 () Bool)

(assert (=> b!148384 (= e!98982 e!98983)))

(declare-fun res!124208 () Bool)

(assert (=> b!148384 (=> (not res!124208) (not e!98983))))

(assert (=> b!148384 (= res!124208 (= (select (arr!3784 arr!237) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3784 (_2!6954 lt!230261)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!148385 () Bool)

(assert (=> b!148385 (= e!98983 (arrayRangesEq!331 arr!237 (_2!6954 lt!230261) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48285 (not res!124207)) b!148384))

(assert (= (and b!148384 res!124208) b!148385))

(declare-fun m!230337 () Bool)

(assert (=> b!148384 m!230337))

(declare-fun m!230339 () Bool)

(assert (=> b!148384 m!230339))

(declare-fun m!230341 () Bool)

(assert (=> b!148385 m!230341))

(assert (=> b!147936 d!48285))

(assert (=> d!47912 d!47908))

(declare-fun d!48287 () Bool)

(assert (=> d!48287 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230272)))) ((_ sign_extend 32) (currentByte!6388 (_2!6953 lt!230272))) ((_ sign_extend 32) (currentBit!6383 (_2!6953 lt!230272))) (bvsub (bvsub to!404 from!447) lt!230615)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) lt!230615)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230272)))) ((_ sign_extend 32) (currentByte!6388 (_2!6953 lt!230272))) ((_ sign_extend 32) (currentBit!6383 (_2!6953 lt!230272)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11787 () Bool)

(assert (= bs!11787 d!48287))

(assert (=> bs!11787 m!229497))

(assert (=> b!148051 d!48287))

(assert (=> b!147958 d!48009))

(assert (=> b!147958 d!48022))

(declare-fun d!48289 () Bool)

(declare-fun e!98984 () Bool)

(assert (=> d!48289 e!98984))

(declare-fun res!124209 () Bool)

(assert (=> d!48289 (=> (not res!124209) (not e!98984))))

(declare-fun lt!231370 () (_ BitVec 64))

(declare-fun lt!231369 () BitStream!5288)

(assert (=> d!48289 (= res!124209 (= (bvadd lt!231370 (bvsub lt!230587 lt!230578)) (bitIndex!0 (size!3015 (buf!3480 lt!231369)) (currentByte!6388 lt!231369) (currentBit!6383 lt!231369))))))

(assert (=> d!48289 (or (not (= (bvand lt!231370 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!230587 lt!230578) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!231370 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!231370 (bvsub lt!230587 lt!230578)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48289 (= lt!231370 (bitIndex!0 (size!3015 (buf!3480 (_2!6955 lt!230583))) (currentByte!6388 (_2!6955 lt!230583)) (currentBit!6383 (_2!6955 lt!230583))))))

(assert (=> d!48289 (= lt!231369 (_2!6953 (moveBitIndex!0 (_2!6955 lt!230583) (bvsub lt!230587 lt!230578))))))

(assert (=> d!48289 (moveBitIndexPrecond!0 (_2!6955 lt!230583) (bvsub lt!230587 lt!230578))))

(assert (=> d!48289 (= (withMovedBitIndex!0 (_2!6955 lt!230583) (bvsub lt!230587 lt!230578)) lt!231369)))

(declare-fun b!148386 () Bool)

(assert (=> b!148386 (= e!98984 (= (size!3015 (buf!3480 (_2!6955 lt!230583))) (size!3015 (buf!3480 lt!231369))))))

(assert (= (and d!48289 res!124209) b!148386))

(declare-fun m!230343 () Bool)

(assert (=> d!48289 m!230343))

(assert (=> d!48289 m!229911))

(declare-fun m!230345 () Bool)

(assert (=> d!48289 m!230345))

(declare-fun m!230347 () Bool)

(assert (=> d!48289 m!230347))

(assert (=> b!148034 d!48289))

(assert (=> b!148034 d!48022))

(assert (=> b!148034 d!48013))

(declare-fun lt!231371 () tuple3!576)

(declare-fun d!48291 () Bool)

(assert (=> d!48291 (= lt!231371 (readByteArrayLoop!0 (_1!6955 lt!230506) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!48291 (= (readByteArrayLoopPure!0 (_1!6955 lt!230506) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13191 (_2!6958 lt!231371) (_3!359 lt!231371)))))

(declare-fun bs!11788 () Bool)

(assert (= bs!11788 d!48291))

(declare-fun m!230349 () Bool)

(assert (=> bs!11788 m!230349))

(assert (=> b!148011 d!48291))

(declare-fun d!48293 () Bool)

(assert (=> d!48293 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230503)))) ((_ sign_extend 32) (currentByte!6388 (_2!6953 lt!230272))) ((_ sign_extend 32) (currentBit!6383 (_2!6953 lt!230272))) lt!230505) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230503)))) ((_ sign_extend 32) (currentByte!6388 (_2!6953 lt!230272))) ((_ sign_extend 32) (currentBit!6383 (_2!6953 lt!230272)))) lt!230505))))

(declare-fun bs!11789 () Bool)

(assert (= bs!11789 d!48293))

(declare-fun m!230351 () Bool)

(assert (=> bs!11789 m!230351))

(assert (=> b!148011 d!48293))

(declare-fun d!48295 () Bool)

(assert (=> d!48295 (validate_offset_bits!1 ((_ sign_extend 32) (size!3015 (buf!3480 (_2!6953 lt!230503)))) ((_ sign_extend 32) (currentByte!6388 (_2!6953 lt!230272))) ((_ sign_extend 32) (currentBit!6383 (_2!6953 lt!230272))) lt!230505)))

(declare-fun lt!231372 () Unit!9318)

(assert (=> d!48295 (= lt!231372 (choose!9 (_2!6953 lt!230272) (buf!3480 (_2!6953 lt!230503)) lt!230505 (BitStream!5289 (buf!3480 (_2!6953 lt!230503)) (currentByte!6388 (_2!6953 lt!230272)) (currentBit!6383 (_2!6953 lt!230272)))))))

(assert (=> d!48295 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6953 lt!230272) (buf!3480 (_2!6953 lt!230503)) lt!230505) lt!231372)))

(declare-fun bs!11790 () Bool)

(assert (= bs!11790 d!48295))

(assert (=> bs!11790 m!229413))

(declare-fun m!230353 () Bool)

(assert (=> bs!11790 m!230353))

(assert (=> b!148011 d!48295))

(declare-fun d!48297 () Bool)

(declare-fun e!98986 () Bool)

(assert (=> d!48297 e!98986))

(declare-fun res!124210 () Bool)

(assert (=> d!48297 (=> (not res!124210) (not e!98986))))

(declare-fun lt!231385 () tuple2!13192)

(assert (=> d!48297 (= res!124210 (isPrefixOf!0 (_1!6955 lt!231385) (_2!6955 lt!231385)))))

(declare-fun lt!231383 () BitStream!5288)

(assert (=> d!48297 (= lt!231385 (tuple2!13193 lt!231383 (_2!6953 lt!230503)))))

(declare-fun lt!231377 () Unit!9318)

(declare-fun lt!231379 () Unit!9318)

(assert (=> d!48297 (= lt!231377 lt!231379)))

(assert (=> d!48297 (isPrefixOf!0 lt!231383 (_2!6953 lt!230503))))

(assert (=> d!48297 (= lt!231379 (lemmaIsPrefixTransitive!0 lt!231383 (_2!6953 lt!230503) (_2!6953 lt!230503)))))

(declare-fun lt!231373 () Unit!9318)

(declare-fun lt!231381 () Unit!9318)

(assert (=> d!48297 (= lt!231373 lt!231381)))

(assert (=> d!48297 (isPrefixOf!0 lt!231383 (_2!6953 lt!230503))))

(assert (=> d!48297 (= lt!231381 (lemmaIsPrefixTransitive!0 lt!231383 (_2!6953 lt!230272) (_2!6953 lt!230503)))))

(declare-fun lt!231388 () Unit!9318)

(declare-fun e!98985 () Unit!9318)

(assert (=> d!48297 (= lt!231388 e!98985)))

(declare-fun c!8025 () Bool)

(assert (=> d!48297 (= c!8025 (not (= (size!3015 (buf!3480 (_2!6953 lt!230272))) #b00000000000000000000000000000000)))))

(declare-fun lt!231378 () Unit!9318)

(declare-fun lt!231384 () Unit!9318)

(assert (=> d!48297 (= lt!231378 lt!231384)))

(assert (=> d!48297 (isPrefixOf!0 (_2!6953 lt!230503) (_2!6953 lt!230503))))

(assert (=> d!48297 (= lt!231384 (lemmaIsPrefixRefl!0 (_2!6953 lt!230503)))))

(declare-fun lt!231382 () Unit!9318)

(declare-fun lt!231390 () Unit!9318)

(assert (=> d!48297 (= lt!231382 lt!231390)))

(assert (=> d!48297 (= lt!231390 (lemmaIsPrefixRefl!0 (_2!6953 lt!230503)))))

(declare-fun lt!231392 () Unit!9318)

(declare-fun lt!231375 () Unit!9318)

(assert (=> d!48297 (= lt!231392 lt!231375)))

(assert (=> d!48297 (isPrefixOf!0 lt!231383 lt!231383)))

(assert (=> d!48297 (= lt!231375 (lemmaIsPrefixRefl!0 lt!231383))))

(declare-fun lt!231391 () Unit!9318)

(declare-fun lt!231386 () Unit!9318)

(assert (=> d!48297 (= lt!231391 lt!231386)))

(assert (=> d!48297 (isPrefixOf!0 (_2!6953 lt!230272) (_2!6953 lt!230272))))

(assert (=> d!48297 (= lt!231386 (lemmaIsPrefixRefl!0 (_2!6953 lt!230272)))))

(assert (=> d!48297 (= lt!231383 (BitStream!5289 (buf!3480 (_2!6953 lt!230503)) (currentByte!6388 (_2!6953 lt!230272)) (currentBit!6383 (_2!6953 lt!230272))))))

(assert (=> d!48297 (isPrefixOf!0 (_2!6953 lt!230272) (_2!6953 lt!230503))))

(assert (=> d!48297 (= (reader!0 (_2!6953 lt!230272) (_2!6953 lt!230503)) lt!231385)))

(declare-fun lt!231389 () (_ BitVec 64))

(declare-fun b!148387 () Bool)

(declare-fun lt!231380 () (_ BitVec 64))

(assert (=> b!148387 (= e!98986 (= (_1!6955 lt!231385) (withMovedBitIndex!0 (_2!6955 lt!231385) (bvsub lt!231389 lt!231380))))))

(assert (=> b!148387 (or (= (bvand lt!231389 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!231380 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!231389 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!231389 lt!231380) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!148387 (= lt!231380 (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230503))) (currentByte!6388 (_2!6953 lt!230503)) (currentBit!6383 (_2!6953 lt!230503))))))

(assert (=> b!148387 (= lt!231389 (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230272))) (currentByte!6388 (_2!6953 lt!230272)) (currentBit!6383 (_2!6953 lt!230272))))))

(declare-fun b!148388 () Bool)

(declare-fun res!124211 () Bool)

(assert (=> b!148388 (=> (not res!124211) (not e!98986))))

(assert (=> b!148388 (= res!124211 (isPrefixOf!0 (_1!6955 lt!231385) (_2!6953 lt!230272)))))

(declare-fun b!148389 () Bool)

(declare-fun Unit!9375 () Unit!9318)

(assert (=> b!148389 (= e!98985 Unit!9375)))

(declare-fun b!148390 () Bool)

(declare-fun lt!231376 () Unit!9318)

(assert (=> b!148390 (= e!98985 lt!231376)))

(declare-fun lt!231387 () (_ BitVec 64))

(assert (=> b!148390 (= lt!231387 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!231374 () (_ BitVec 64))

(assert (=> b!148390 (= lt!231374 (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230272))) (currentByte!6388 (_2!6953 lt!230272)) (currentBit!6383 (_2!6953 lt!230272))))))

(assert (=> b!148390 (= lt!231376 (arrayBitRangesEqSymmetric!0 (buf!3480 (_2!6953 lt!230272)) (buf!3480 (_2!6953 lt!230503)) lt!231387 lt!231374))))

(assert (=> b!148390 (arrayBitRangesEq!0 (buf!3480 (_2!6953 lt!230503)) (buf!3480 (_2!6953 lt!230272)) lt!231387 lt!231374)))

(declare-fun b!148391 () Bool)

(declare-fun res!124212 () Bool)

(assert (=> b!148391 (=> (not res!124212) (not e!98986))))

(assert (=> b!148391 (= res!124212 (isPrefixOf!0 (_2!6955 lt!231385) (_2!6953 lt!230503)))))

(assert (= (and d!48297 c!8025) b!148390))

(assert (= (and d!48297 (not c!8025)) b!148389))

(assert (= (and d!48297 res!124210) b!148388))

(assert (= (and b!148388 res!124211) b!148391))

(assert (= (and b!148391 res!124212) b!148387))

(declare-fun m!230355 () Bool)

(assert (=> b!148388 m!230355))

(assert (=> b!148390 m!229205))

(declare-fun m!230357 () Bool)

(assert (=> b!148390 m!230357))

(declare-fun m!230359 () Bool)

(assert (=> b!148390 m!230359))

(declare-fun m!230361 () Bool)

(assert (=> b!148387 m!230361))

(assert (=> b!148387 m!229393))

(assert (=> b!148387 m!229205))

(declare-fun m!230363 () Bool)

(assert (=> d!48297 m!230363))

(declare-fun m!230365 () Bool)

(assert (=> d!48297 m!230365))

(declare-fun m!230367 () Bool)

(assert (=> d!48297 m!230367))

(assert (=> d!48297 m!229407))

(declare-fun m!230369 () Bool)

(assert (=> d!48297 m!230369))

(declare-fun m!230371 () Bool)

(assert (=> d!48297 m!230371))

(declare-fun m!230373 () Bool)

(assert (=> d!48297 m!230373))

(declare-fun m!230375 () Bool)

(assert (=> d!48297 m!230375))

(assert (=> d!48297 m!229307))

(declare-fun m!230377 () Bool)

(assert (=> d!48297 m!230377))

(assert (=> d!48297 m!229303))

(declare-fun m!230379 () Bool)

(assert (=> b!148391 m!230379))

(assert (=> b!148011 d!48297))

(assert (=> d!47976 d!47980))

(declare-fun d!48299 () Bool)

(assert (=> d!48299 (isPrefixOf!0 thiss!1634 (_2!6953 lt!230274))))

(assert (=> d!48299 true))

(declare-fun _$15!240 () Unit!9318)

(assert (=> d!48299 (= (choose!30 thiss!1634 (_2!6953 lt!230272) (_2!6953 lt!230274)) _$15!240)))

(declare-fun bs!11791 () Bool)

(assert (= bs!11791 d!48299))

(assert (=> bs!11791 m!229253))

(assert (=> d!47976 d!48299))

(assert (=> d!47976 d!47999))

(declare-fun d!48301 () Bool)

(declare-fun res!124215 () Bool)

(declare-fun e!98988 () Bool)

(assert (=> d!48301 (=> (not res!124215) (not e!98988))))

(assert (=> d!48301 (= res!124215 (= (size!3015 (buf!3480 (_1!6955 lt!230559))) (size!3015 (buf!3480 (_2!6955 lt!230559)))))))

(assert (=> d!48301 (= (isPrefixOf!0 (_1!6955 lt!230559) (_2!6955 lt!230559)) e!98988)))

(declare-fun b!148392 () Bool)

(declare-fun res!124214 () Bool)

(assert (=> b!148392 (=> (not res!124214) (not e!98988))))

(assert (=> b!148392 (= res!124214 (bvsle (bitIndex!0 (size!3015 (buf!3480 (_1!6955 lt!230559))) (currentByte!6388 (_1!6955 lt!230559)) (currentBit!6383 (_1!6955 lt!230559))) (bitIndex!0 (size!3015 (buf!3480 (_2!6955 lt!230559))) (currentByte!6388 (_2!6955 lt!230559)) (currentBit!6383 (_2!6955 lt!230559)))))))

(declare-fun b!148393 () Bool)

(declare-fun e!98987 () Bool)

(assert (=> b!148393 (= e!98988 e!98987)))

(declare-fun res!124213 () Bool)

(assert (=> b!148393 (=> res!124213 e!98987)))

(assert (=> b!148393 (= res!124213 (= (size!3015 (buf!3480 (_1!6955 lt!230559))) #b00000000000000000000000000000000))))

(declare-fun b!148394 () Bool)

(assert (=> b!148394 (= e!98987 (arrayBitRangesEq!0 (buf!3480 (_1!6955 lt!230559)) (buf!3480 (_2!6955 lt!230559)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3015 (buf!3480 (_1!6955 lt!230559))) (currentByte!6388 (_1!6955 lt!230559)) (currentBit!6383 (_1!6955 lt!230559)))))))

(assert (= (and d!48301 res!124215) b!148392))

(assert (= (and b!148392 res!124214) b!148393))

(assert (= (and b!148393 (not res!124213)) b!148394))

(assert (=> b!148392 m!230007))

(assert (=> b!148392 m!229945))

(assert (=> b!148394 m!230007))

(assert (=> b!148394 m!230007))

(declare-fun m!230381 () Bool)

(assert (=> b!148394 m!230381))

(assert (=> d!47972 d!48301))

(declare-fun d!48303 () Bool)

(assert (=> d!48303 (isPrefixOf!0 lt!230557 (_2!6953 lt!230274))))

(declare-fun lt!231393 () Unit!9318)

(assert (=> d!48303 (= lt!231393 (choose!30 lt!230557 (_2!6953 lt!230274) (_2!6953 lt!230274)))))

(assert (=> d!48303 (isPrefixOf!0 lt!230557 (_2!6953 lt!230274))))

(assert (=> d!48303 (= (lemmaIsPrefixTransitive!0 lt!230557 (_2!6953 lt!230274) (_2!6953 lt!230274)) lt!231393)))

(declare-fun bs!11792 () Bool)

(assert (= bs!11792 d!48303))

(assert (=> bs!11792 m!229469))

(declare-fun m!230383 () Bool)

(assert (=> bs!11792 m!230383))

(assert (=> bs!11792 m!229469))

(assert (=> d!47972 d!48303))

(declare-fun d!48305 () Bool)

(assert (=> d!48305 (isPrefixOf!0 lt!230557 (_2!6953 lt!230274))))

(declare-fun lt!231394 () Unit!9318)

(assert (=> d!48305 (= lt!231394 (choose!30 lt!230557 (_2!6953 lt!230272) (_2!6953 lt!230274)))))

(assert (=> d!48305 (isPrefixOf!0 lt!230557 (_2!6953 lt!230272))))

(assert (=> d!48305 (= (lemmaIsPrefixTransitive!0 lt!230557 (_2!6953 lt!230272) (_2!6953 lt!230274)) lt!231394)))

(declare-fun bs!11793 () Bool)

(assert (= bs!11793 d!48305))

(assert (=> bs!11793 m!229469))

(declare-fun m!230385 () Bool)

(assert (=> bs!11793 m!230385))

(declare-fun m!230387 () Bool)

(assert (=> bs!11793 m!230387))

(assert (=> d!47972 d!48305))

(declare-fun d!48307 () Bool)

(assert (=> d!48307 (isPrefixOf!0 (_2!6953 lt!230272) (_2!6953 lt!230272))))

(declare-fun lt!231397 () Unit!9318)

(declare-fun choose!11 (BitStream!5288) Unit!9318)

(assert (=> d!48307 (= lt!231397 (choose!11 (_2!6953 lt!230272)))))

(assert (=> d!48307 (= (lemmaIsPrefixRefl!0 (_2!6953 lt!230272)) lt!231397)))

(declare-fun bs!11795 () Bool)

(assert (= bs!11795 d!48307))

(assert (=> bs!11795 m!229307))

(declare-fun m!230389 () Bool)

(assert (=> bs!11795 m!230389))

(assert (=> d!47972 d!48307))

(declare-fun d!48309 () Bool)

(declare-fun res!124218 () Bool)

(declare-fun e!98990 () Bool)

(assert (=> d!48309 (=> (not res!124218) (not e!98990))))

(assert (=> d!48309 (= res!124218 (= (size!3015 (buf!3480 (_2!6953 lt!230274))) (size!3015 (buf!3480 (_2!6953 lt!230274)))))))

(assert (=> d!48309 (= (isPrefixOf!0 (_2!6953 lt!230274) (_2!6953 lt!230274)) e!98990)))

(declare-fun b!148395 () Bool)

(declare-fun res!124217 () Bool)

(assert (=> b!148395 (=> (not res!124217) (not e!98990))))

(assert (=> b!148395 (= res!124217 (bvsle (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230274))) (currentByte!6388 (_2!6953 lt!230274)) (currentBit!6383 (_2!6953 lt!230274))) (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230274))) (currentByte!6388 (_2!6953 lt!230274)) (currentBit!6383 (_2!6953 lt!230274)))))))

(declare-fun b!148396 () Bool)

(declare-fun e!98989 () Bool)

(assert (=> b!148396 (= e!98990 e!98989)))

(declare-fun res!124216 () Bool)

(assert (=> b!148396 (=> res!124216 e!98989)))

(assert (=> b!148396 (= res!124216 (= (size!3015 (buf!3480 (_2!6953 lt!230274))) #b00000000000000000000000000000000))))

(declare-fun b!148397 () Bool)

(assert (=> b!148397 (= e!98989 (arrayBitRangesEq!0 (buf!3480 (_2!6953 lt!230274)) (buf!3480 (_2!6953 lt!230274)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230274))) (currentByte!6388 (_2!6953 lt!230274)) (currentBit!6383 (_2!6953 lt!230274)))))))

(assert (= (and d!48309 res!124218) b!148395))

(assert (= (and b!148395 res!124217) b!148396))

(assert (= (and b!148396 (not res!124216)) b!148397))

(assert (=> b!148395 m!229273))

(assert (=> b!148395 m!229273))

(assert (=> b!148397 m!229273))

(assert (=> b!148397 m!229273))

(declare-fun m!230391 () Bool)

(assert (=> b!148397 m!230391))

(assert (=> d!47972 d!48309))

(assert (=> d!47972 d!47920))

(declare-fun d!48311 () Bool)

(assert (=> d!48311 (isPrefixOf!0 lt!230557 lt!230557)))

(declare-fun lt!231398 () Unit!9318)

(assert (=> d!48311 (= lt!231398 (choose!11 lt!230557))))

(assert (=> d!48311 (= (lemmaIsPrefixRefl!0 lt!230557) lt!231398)))

(declare-fun bs!11796 () Bool)

(assert (= bs!11796 d!48311))

(assert (=> bs!11796 m!229477))

(declare-fun m!230393 () Bool)

(assert (=> bs!11796 m!230393))

(assert (=> d!47972 d!48311))

(declare-fun d!48313 () Bool)

(declare-fun res!124221 () Bool)

(declare-fun e!98992 () Bool)

(assert (=> d!48313 (=> (not res!124221) (not e!98992))))

(assert (=> d!48313 (= res!124221 (= (size!3015 (buf!3480 lt!230557)) (size!3015 (buf!3480 lt!230557))))))

(assert (=> d!48313 (= (isPrefixOf!0 lt!230557 lt!230557) e!98992)))

(declare-fun b!148398 () Bool)

(declare-fun res!124220 () Bool)

(assert (=> b!148398 (=> (not res!124220) (not e!98992))))

(assert (=> b!148398 (= res!124220 (bvsle (bitIndex!0 (size!3015 (buf!3480 lt!230557)) (currentByte!6388 lt!230557) (currentBit!6383 lt!230557)) (bitIndex!0 (size!3015 (buf!3480 lt!230557)) (currentByte!6388 lt!230557) (currentBit!6383 lt!230557))))))

(declare-fun b!148399 () Bool)

(declare-fun e!98991 () Bool)

(assert (=> b!148399 (= e!98992 e!98991)))

(declare-fun res!124219 () Bool)

(assert (=> b!148399 (=> res!124219 e!98991)))

(assert (=> b!148399 (= res!124219 (= (size!3015 (buf!3480 lt!230557)) #b00000000000000000000000000000000))))

(declare-fun b!148400 () Bool)

(assert (=> b!148400 (= e!98991 (arrayBitRangesEq!0 (buf!3480 lt!230557) (buf!3480 lt!230557) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3015 (buf!3480 lt!230557)) (currentByte!6388 lt!230557) (currentBit!6383 lt!230557))))))

(assert (= (and d!48313 res!124221) b!148398))

(assert (= (and b!148398 res!124220) b!148399))

(assert (= (and b!148399 (not res!124219)) b!148400))

(declare-fun m!230395 () Bool)

(assert (=> b!148398 m!230395))

(assert (=> b!148398 m!230395))

(assert (=> b!148400 m!230395))

(assert (=> b!148400 m!230395))

(declare-fun m!230397 () Bool)

(assert (=> b!148400 m!230397))

(assert (=> d!47972 d!48313))

(declare-fun d!48315 () Bool)

(declare-fun res!124224 () Bool)

(declare-fun e!98994 () Bool)

(assert (=> d!48315 (=> (not res!124224) (not e!98994))))

(assert (=> d!48315 (= res!124224 (= (size!3015 (buf!3480 lt!230557)) (size!3015 (buf!3480 (_2!6953 lt!230274)))))))

(assert (=> d!48315 (= (isPrefixOf!0 lt!230557 (_2!6953 lt!230274)) e!98994)))

(declare-fun b!148401 () Bool)

(declare-fun res!124223 () Bool)

(assert (=> b!148401 (=> (not res!124223) (not e!98994))))

(assert (=> b!148401 (= res!124223 (bvsle (bitIndex!0 (size!3015 (buf!3480 lt!230557)) (currentByte!6388 lt!230557) (currentBit!6383 lt!230557)) (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230274))) (currentByte!6388 (_2!6953 lt!230274)) (currentBit!6383 (_2!6953 lt!230274)))))))

(declare-fun b!148402 () Bool)

(declare-fun e!98993 () Bool)

(assert (=> b!148402 (= e!98994 e!98993)))

(declare-fun res!124222 () Bool)

(assert (=> b!148402 (=> res!124222 e!98993)))

(assert (=> b!148402 (= res!124222 (= (size!3015 (buf!3480 lt!230557)) #b00000000000000000000000000000000))))

(declare-fun b!148403 () Bool)

(assert (=> b!148403 (= e!98993 (arrayBitRangesEq!0 (buf!3480 lt!230557) (buf!3480 (_2!6953 lt!230274)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3015 (buf!3480 lt!230557)) (currentByte!6388 lt!230557) (currentBit!6383 lt!230557))))))

(assert (= (and d!48315 res!124224) b!148401))

(assert (= (and b!148401 res!124223) b!148402))

(assert (= (and b!148402 (not res!124222)) b!148403))

(assert (=> b!148401 m!230395))

(assert (=> b!148401 m!229273))

(assert (=> b!148403 m!230395))

(assert (=> b!148403 m!230395))

(declare-fun m!230399 () Bool)

(assert (=> b!148403 m!230399))

(assert (=> d!47972 d!48315))

(declare-fun d!48317 () Bool)

(declare-fun res!124227 () Bool)

(declare-fun e!98996 () Bool)

(assert (=> d!48317 (=> (not res!124227) (not e!98996))))

(assert (=> d!48317 (= res!124227 (= (size!3015 (buf!3480 (_2!6953 lt!230272))) (size!3015 (buf!3480 (_2!6953 lt!230272)))))))

(assert (=> d!48317 (= (isPrefixOf!0 (_2!6953 lt!230272) (_2!6953 lt!230272)) e!98996)))

(declare-fun b!148404 () Bool)

(declare-fun res!124226 () Bool)

(assert (=> b!148404 (=> (not res!124226) (not e!98996))))

(assert (=> b!148404 (= res!124226 (bvsle (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230272))) (currentByte!6388 (_2!6953 lt!230272)) (currentBit!6383 (_2!6953 lt!230272))) (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230272))) (currentByte!6388 (_2!6953 lt!230272)) (currentBit!6383 (_2!6953 lt!230272)))))))

(declare-fun b!148405 () Bool)

(declare-fun e!98995 () Bool)

(assert (=> b!148405 (= e!98996 e!98995)))

(declare-fun res!124225 () Bool)

(assert (=> b!148405 (=> res!124225 e!98995)))

(assert (=> b!148405 (= res!124225 (= (size!3015 (buf!3480 (_2!6953 lt!230272))) #b00000000000000000000000000000000))))

(declare-fun b!148406 () Bool)

(assert (=> b!148406 (= e!98995 (arrayBitRangesEq!0 (buf!3480 (_2!6953 lt!230272)) (buf!3480 (_2!6953 lt!230272)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230272))) (currentByte!6388 (_2!6953 lt!230272)) (currentBit!6383 (_2!6953 lt!230272)))))))

(assert (= (and d!48317 res!124227) b!148404))

(assert (= (and b!148404 res!124226) b!148405))

(assert (= (and b!148405 (not res!124225)) b!148406))

(assert (=> b!148404 m!229205))

(assert (=> b!148404 m!229205))

(assert (=> b!148406 m!229205))

(assert (=> b!148406 m!229205))

(declare-fun m!230401 () Bool)

(assert (=> b!148406 m!230401))

(assert (=> d!47972 d!48317))

(declare-fun d!48319 () Bool)

(assert (=> d!48319 (isPrefixOf!0 (_2!6953 lt!230274) (_2!6953 lt!230274))))

(declare-fun lt!231399 () Unit!9318)

(assert (=> d!48319 (= lt!231399 (choose!11 (_2!6953 lt!230274)))))

(assert (=> d!48319 (= (lemmaIsPrefixRefl!0 (_2!6953 lt!230274)) lt!231399)))

(declare-fun bs!11797 () Bool)

(assert (= bs!11797 d!48319))

(assert (=> bs!11797 m!229471))

(declare-fun m!230403 () Bool)

(assert (=> bs!11797 m!230403))

(assert (=> d!47972 d!48319))

(declare-fun d!48321 () Bool)

(declare-fun e!99003 () Bool)

(assert (=> d!48321 e!99003))

(declare-fun res!124236 () Bool)

(assert (=> d!48321 (=> (not res!124236) (not e!99003))))

(declare-fun _$37!50 () tuple2!13188)

(assert (=> d!48321 (= res!124236 (= (size!3015 (buf!3480 thiss!1634)) (size!3015 (buf!3480 (_2!6953 _$37!50)))))))

(declare-fun e!99005 () Bool)

(assert (=> d!48321 (and (inv!12 (_2!6953 _$37!50)) e!99005)))

(assert (=> d!48321 (= (choose!6 thiss!1634 (select (arr!3784 arr!237) from!447)) _$37!50)))

(declare-fun lt!231404 () tuple2!13192)

(declare-fun b!148418 () Bool)

(declare-fun lt!231405 () tuple2!13194)

(assert (=> b!148418 (= e!99003 (and (= (_2!6956 lt!231405) (select (arr!3784 arr!237) from!447)) (= (_1!6956 lt!231405) (_2!6955 lt!231404))))))

(assert (=> b!148418 (= lt!231405 (readBytePure!0 (_1!6955 lt!231404)))))

(assert (=> b!148418 (= lt!231404 (reader!0 thiss!1634 (_2!6953 _$37!50)))))

(declare-fun b!148417 () Bool)

(declare-fun res!124234 () Bool)

(assert (=> b!148417 (=> (not res!124234) (not e!99003))))

(assert (=> b!148417 (= res!124234 (isPrefixOf!0 thiss!1634 (_2!6953 _$37!50)))))

(declare-fun b!148416 () Bool)

(declare-fun res!124235 () Bool)

(assert (=> b!148416 (=> (not res!124235) (not e!99003))))

(assert (=> b!148416 (= res!124235 (= (bitIndex!0 (size!3015 (buf!3480 (_2!6953 _$37!50))) (currentByte!6388 (_2!6953 _$37!50)) (currentBit!6383 (_2!6953 _$37!50))) (bvadd (bitIndex!0 (size!3015 (buf!3480 thiss!1634)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!148415 () Bool)

(assert (=> b!148415 (= e!99005 (array_inv!2804 (buf!3480 (_2!6953 _$37!50))))))

(assert (= d!48321 b!148415))

(assert (= (and d!48321 res!124236) b!148416))

(assert (= (and b!148416 res!124235) b!148417))

(assert (= (and b!148417 res!124234) b!148418))

(declare-fun m!230405 () Bool)

(assert (=> b!148415 m!230405))

(declare-fun m!230407 () Bool)

(assert (=> b!148418 m!230407))

(declare-fun m!230409 () Bool)

(assert (=> b!148418 m!230409))

(declare-fun m!230411 () Bool)

(assert (=> b!148417 m!230411))

(declare-fun m!230413 () Bool)

(assert (=> d!48321 m!230413))

(declare-fun m!230415 () Bool)

(assert (=> b!148416 m!230415))

(assert (=> b!148416 m!229207))

(assert (=> d!47966 d!48321))

(declare-fun d!48323 () Bool)

(assert (=> d!48323 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3015 (buf!3480 thiss!1634))) ((_ sign_extend 32) (currentByte!6388 thiss!1634)) ((_ sign_extend 32) (currentBit!6383 thiss!1634))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3015 (buf!3480 thiss!1634))) ((_ sign_extend 32) (currentByte!6388 thiss!1634)) ((_ sign_extend 32) (currentBit!6383 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!11798 () Bool)

(assert (= bs!11798 d!48323))

(assert (=> bs!11798 m!229537))

(assert (=> d!47966 d!48323))

(declare-fun d!48325 () Bool)

(declare-fun res!124237 () Bool)

(declare-fun e!99006 () Bool)

(assert (=> d!48325 (=> res!124237 e!99006)))

(assert (=> d!48325 (= res!124237 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!48325 (= (arrayRangesEq!331 (_2!6954 lt!230269) (_2!6954 lt!230260) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!99006)))

(declare-fun b!148419 () Bool)

(declare-fun e!99007 () Bool)

(assert (=> b!148419 (= e!99006 e!99007)))

(declare-fun res!124238 () Bool)

(assert (=> b!148419 (=> (not res!124238) (not e!99007))))

(assert (=> b!148419 (= res!124238 (= (select (arr!3784 (_2!6954 lt!230269)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3784 (_2!6954 lt!230260)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!148420 () Bool)

(assert (=> b!148420 (= e!99007 (arrayRangesEq!331 (_2!6954 lt!230269) (_2!6954 lt!230260) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48325 (not res!124237)) b!148419))

(assert (= (and b!148419 res!124238) b!148420))

(assert (=> b!148419 m!229897))

(assert (=> b!148419 m!229895))

(declare-fun m!230417 () Bool)

(assert (=> b!148420 m!230417))

(assert (=> b!148055 d!48325))

(declare-fun d!48327 () Bool)

(declare-fun res!124241 () Bool)

(declare-fun e!99009 () Bool)

(assert (=> d!48327 (=> (not res!124241) (not e!99009))))

(assert (=> d!48327 (= res!124241 (= (size!3015 (buf!3480 (_2!6953 lt!230272))) (size!3015 (buf!3480 (_2!6953 lt!230503)))))))

(assert (=> d!48327 (= (isPrefixOf!0 (_2!6953 lt!230272) (_2!6953 lt!230503)) e!99009)))

(declare-fun b!148421 () Bool)

(declare-fun res!124240 () Bool)

(assert (=> b!148421 (=> (not res!124240) (not e!99009))))

(assert (=> b!148421 (= res!124240 (bvsle (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230272))) (currentByte!6388 (_2!6953 lt!230272)) (currentBit!6383 (_2!6953 lt!230272))) (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230503))) (currentByte!6388 (_2!6953 lt!230503)) (currentBit!6383 (_2!6953 lt!230503)))))))

(declare-fun b!148422 () Bool)

(declare-fun e!99008 () Bool)

(assert (=> b!148422 (= e!99009 e!99008)))

(declare-fun res!124239 () Bool)

(assert (=> b!148422 (=> res!124239 e!99008)))

(assert (=> b!148422 (= res!124239 (= (size!3015 (buf!3480 (_2!6953 lt!230272))) #b00000000000000000000000000000000))))

(declare-fun b!148423 () Bool)

(assert (=> b!148423 (= e!99008 (arrayBitRangesEq!0 (buf!3480 (_2!6953 lt!230272)) (buf!3480 (_2!6953 lt!230503)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230272))) (currentByte!6388 (_2!6953 lt!230272)) (currentBit!6383 (_2!6953 lt!230272)))))))

(assert (= (and d!48327 res!124241) b!148421))

(assert (= (and b!148421 res!124240) b!148422))

(assert (= (and b!148422 (not res!124239)) b!148423))

(assert (=> b!148421 m!229205))

(assert (=> b!148421 m!229393))

(assert (=> b!148423 m!229205))

(assert (=> b!148423 m!229205))

(declare-fun m!230419 () Bool)

(assert (=> b!148423 m!230419))

(assert (=> b!148007 d!48327))

(assert (=> d!48017 d!48243))

(declare-fun d!48329 () Bool)

(declare-fun res!124244 () Bool)

(declare-fun e!99011 () Bool)

(assert (=> d!48329 (=> (not res!124244) (not e!99011))))

(assert (=> d!48329 (= res!124244 (= (size!3015 (buf!3480 (_1!6955 lt!230335))) (size!3015 (buf!3480 (_2!6955 lt!230335)))))))

(assert (=> d!48329 (= (isPrefixOf!0 (_1!6955 lt!230335) (_2!6955 lt!230335)) e!99011)))

(declare-fun b!148424 () Bool)

(declare-fun res!124243 () Bool)

(assert (=> b!148424 (=> (not res!124243) (not e!99011))))

(assert (=> b!148424 (= res!124243 (bvsle (bitIndex!0 (size!3015 (buf!3480 (_1!6955 lt!230335))) (currentByte!6388 (_1!6955 lt!230335)) (currentBit!6383 (_1!6955 lt!230335))) (bitIndex!0 (size!3015 (buf!3480 (_2!6955 lt!230335))) (currentByte!6388 (_2!6955 lt!230335)) (currentBit!6383 (_2!6955 lt!230335)))))))

(declare-fun b!148425 () Bool)

(declare-fun e!99010 () Bool)

(assert (=> b!148425 (= e!99011 e!99010)))

(declare-fun res!124242 () Bool)

(assert (=> b!148425 (=> res!124242 e!99010)))

(assert (=> b!148425 (= res!124242 (= (size!3015 (buf!3480 (_1!6955 lt!230335))) #b00000000000000000000000000000000))))

(declare-fun b!148426 () Bool)

(assert (=> b!148426 (= e!99010 (arrayBitRangesEq!0 (buf!3480 (_1!6955 lt!230335)) (buf!3480 (_2!6955 lt!230335)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3015 (buf!3480 (_1!6955 lt!230335))) (currentByte!6388 (_1!6955 lt!230335)) (currentBit!6383 (_1!6955 lt!230335)))))))

(assert (= (and d!48329 res!124244) b!148424))

(assert (= (and b!148424 res!124243) b!148425))

(assert (= (and b!148425 (not res!124242)) b!148426))

(assert (=> b!148424 m!229915))

(assert (=> b!148424 m!230303))

(assert (=> b!148426 m!229915))

(assert (=> b!148426 m!229915))

(declare-fun m!230421 () Bool)

(assert (=> b!148426 m!230421))

(assert (=> d!47918 d!48329))

(declare-fun d!48331 () Bool)

(declare-fun res!124247 () Bool)

(declare-fun e!99013 () Bool)

(assert (=> d!48331 (=> (not res!124247) (not e!99013))))

(assert (=> d!48331 (= res!124247 (= (size!3015 (buf!3480 lt!230333)) (size!3015 (buf!3480 lt!230333))))))

(assert (=> d!48331 (= (isPrefixOf!0 lt!230333 lt!230333) e!99013)))

(declare-fun b!148427 () Bool)

(declare-fun res!124246 () Bool)

(assert (=> b!148427 (=> (not res!124246) (not e!99013))))

(assert (=> b!148427 (= res!124246 (bvsle (bitIndex!0 (size!3015 (buf!3480 lt!230333)) (currentByte!6388 lt!230333) (currentBit!6383 lt!230333)) (bitIndex!0 (size!3015 (buf!3480 lt!230333)) (currentByte!6388 lt!230333) (currentBit!6383 lt!230333))))))

(declare-fun b!148428 () Bool)

(declare-fun e!99012 () Bool)

(assert (=> b!148428 (= e!99013 e!99012)))

(declare-fun res!124245 () Bool)

(assert (=> b!148428 (=> res!124245 e!99012)))

(assert (=> b!148428 (= res!124245 (= (size!3015 (buf!3480 lt!230333)) #b00000000000000000000000000000000))))

(declare-fun b!148429 () Bool)

(assert (=> b!148429 (= e!99012 (arrayBitRangesEq!0 (buf!3480 lt!230333) (buf!3480 lt!230333) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3015 (buf!3480 lt!230333)) (currentByte!6388 lt!230333) (currentBit!6383 lt!230333))))))

(assert (= (and d!48331 res!124247) b!148427))

(assert (= (and b!148427 res!124246) b!148428))

(assert (= (and b!148428 (not res!124245)) b!148429))

(declare-fun m!230423 () Bool)

(assert (=> b!148427 m!230423))

(assert (=> b!148427 m!230423))

(assert (=> b!148429 m!230423))

(assert (=> b!148429 m!230423))

(declare-fun m!230425 () Bool)

(assert (=> b!148429 m!230425))

(assert (=> d!47918 d!48331))

(declare-fun d!48333 () Bool)

(assert (=> d!48333 (isPrefixOf!0 lt!230333 (_2!6953 lt!230272))))

(declare-fun lt!231406 () Unit!9318)

(assert (=> d!48333 (= lt!231406 (choose!30 lt!230333 (_2!6953 lt!230272) (_2!6953 lt!230272)))))

(assert (=> d!48333 (isPrefixOf!0 lt!230333 (_2!6953 lt!230272))))

(assert (=> d!48333 (= (lemmaIsPrefixTransitive!0 lt!230333 (_2!6953 lt!230272) (_2!6953 lt!230272)) lt!231406)))

(declare-fun bs!11799 () Bool)

(assert (= bs!11799 d!48333))

(assert (=> bs!11799 m!229305))

(declare-fun m!230427 () Bool)

(assert (=> bs!11799 m!230427))

(assert (=> bs!11799 m!229305))

(assert (=> d!47918 d!48333))

(declare-fun d!48335 () Bool)

(assert (=> d!48335 (isPrefixOf!0 lt!230333 lt!230333)))

(declare-fun lt!231407 () Unit!9318)

(assert (=> d!48335 (= lt!231407 (choose!11 lt!230333))))

(assert (=> d!48335 (= (lemmaIsPrefixRefl!0 lt!230333) lt!231407)))

(declare-fun bs!11800 () Bool)

(assert (= bs!11800 d!48335))

(assert (=> bs!11800 m!229313))

(declare-fun m!230429 () Bool)

(assert (=> bs!11800 m!230429))

(assert (=> d!47918 d!48335))

(assert (=> d!47918 d!47999))

(declare-fun d!48337 () Bool)

(declare-fun res!124250 () Bool)

(declare-fun e!99015 () Bool)

(assert (=> d!48337 (=> (not res!124250) (not e!99015))))

(assert (=> d!48337 (= res!124250 (= (size!3015 (buf!3480 thiss!1634)) (size!3015 (buf!3480 thiss!1634))))))

(assert (=> d!48337 (= (isPrefixOf!0 thiss!1634 thiss!1634) e!99015)))

(declare-fun b!148430 () Bool)

(declare-fun res!124249 () Bool)

(assert (=> b!148430 (=> (not res!124249) (not e!99015))))

(assert (=> b!148430 (= res!124249 (bvsle (bitIndex!0 (size!3015 (buf!3480 thiss!1634)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634)) (bitIndex!0 (size!3015 (buf!3480 thiss!1634)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634))))))

(declare-fun b!148431 () Bool)

(declare-fun e!99014 () Bool)

(assert (=> b!148431 (= e!99015 e!99014)))

(declare-fun res!124248 () Bool)

(assert (=> b!148431 (=> res!124248 e!99014)))

(assert (=> b!148431 (= res!124248 (= (size!3015 (buf!3480 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!148432 () Bool)

(assert (=> b!148432 (= e!99014 (arrayBitRangesEq!0 (buf!3480 thiss!1634) (buf!3480 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3015 (buf!3480 thiss!1634)) (currentByte!6388 thiss!1634) (currentBit!6383 thiss!1634))))))

(assert (= (and d!48337 res!124250) b!148430))

(assert (= (and b!148430 res!124249) b!148431))

(assert (= (and b!148431 (not res!124248)) b!148432))

(assert (=> b!148430 m!229207))

(assert (=> b!148430 m!229207))

(assert (=> b!148432 m!229207))

(assert (=> b!148432 m!229207))

(declare-fun m!230431 () Bool)

(assert (=> b!148432 m!230431))

(assert (=> d!47918 d!48337))

(declare-fun d!48339 () Bool)

(assert (=> d!48339 (isPrefixOf!0 lt!230333 (_2!6953 lt!230272))))

(declare-fun lt!231408 () Unit!9318)

(assert (=> d!48339 (= lt!231408 (choose!30 lt!230333 thiss!1634 (_2!6953 lt!230272)))))

(assert (=> d!48339 (isPrefixOf!0 lt!230333 thiss!1634)))

(assert (=> d!48339 (= (lemmaIsPrefixTransitive!0 lt!230333 thiss!1634 (_2!6953 lt!230272)) lt!231408)))

(declare-fun bs!11801 () Bool)

(assert (= bs!11801 d!48339))

(assert (=> bs!11801 m!229305))

(declare-fun m!230433 () Bool)

(assert (=> bs!11801 m!230433))

(declare-fun m!230435 () Bool)

(assert (=> bs!11801 m!230435))

(assert (=> d!47918 d!48339))

(assert (=> d!47918 d!48307))

(declare-fun d!48341 () Bool)

(assert (=> d!48341 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-fun lt!231409 () Unit!9318)

(assert (=> d!48341 (= lt!231409 (choose!11 thiss!1634))))

(assert (=> d!48341 (= (lemmaIsPrefixRefl!0 thiss!1634) lt!231409)))

(declare-fun bs!11802 () Bool)

(assert (= bs!11802 d!48341))

(assert (=> bs!11802 m!229317))

(declare-fun m!230437 () Bool)

(assert (=> bs!11802 m!230437))

(assert (=> d!47918 d!48341))

(assert (=> d!47918 d!48317))

(declare-fun d!48343 () Bool)

(declare-fun res!124253 () Bool)

(declare-fun e!99017 () Bool)

(assert (=> d!48343 (=> (not res!124253) (not e!99017))))

(assert (=> d!48343 (= res!124253 (= (size!3015 (buf!3480 lt!230333)) (size!3015 (buf!3480 (_2!6953 lt!230272)))))))

(assert (=> d!48343 (= (isPrefixOf!0 lt!230333 (_2!6953 lt!230272)) e!99017)))

(declare-fun b!148433 () Bool)

(declare-fun res!124252 () Bool)

(assert (=> b!148433 (=> (not res!124252) (not e!99017))))

(assert (=> b!148433 (= res!124252 (bvsle (bitIndex!0 (size!3015 (buf!3480 lt!230333)) (currentByte!6388 lt!230333) (currentBit!6383 lt!230333)) (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230272))) (currentByte!6388 (_2!6953 lt!230272)) (currentBit!6383 (_2!6953 lt!230272)))))))

(declare-fun b!148434 () Bool)

(declare-fun e!99016 () Bool)

(assert (=> b!148434 (= e!99017 e!99016)))

(declare-fun res!124251 () Bool)

(assert (=> b!148434 (=> res!124251 e!99016)))

(assert (=> b!148434 (= res!124251 (= (size!3015 (buf!3480 lt!230333)) #b00000000000000000000000000000000))))

(declare-fun b!148435 () Bool)

(assert (=> b!148435 (= e!99016 (arrayBitRangesEq!0 (buf!3480 lt!230333) (buf!3480 (_2!6953 lt!230272)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3015 (buf!3480 lt!230333)) (currentByte!6388 lt!230333) (currentBit!6383 lt!230333))))))

(assert (= (and d!48343 res!124253) b!148433))

(assert (= (and b!148433 res!124252) b!148434))

(assert (= (and b!148434 (not res!124251)) b!148435))

(assert (=> b!148433 m!230423))

(assert (=> b!148433 m!229205))

(assert (=> b!148435 m!230423))

(assert (=> b!148435 m!230423))

(declare-fun m!230439 () Bool)

(assert (=> b!148435 m!230439))

(assert (=> d!47918 d!48343))

(declare-fun d!48345 () Bool)

(assert (=> d!48345 (isPrefixOf!0 lt!230581 (_2!6953 lt!230274))))

(declare-fun lt!231410 () Unit!9318)

(assert (=> d!48345 (= lt!231410 (choose!30 lt!230581 thiss!1634 (_2!6953 lt!230274)))))

(assert (=> d!48345 (isPrefixOf!0 lt!230581 thiss!1634)))

(assert (=> d!48345 (= (lemmaIsPrefixTransitive!0 lt!230581 thiss!1634 (_2!6953 lt!230274)) lt!231410)))

(declare-fun bs!11803 () Bool)

(assert (= bs!11803 d!48345))

(assert (=> bs!11803 m!229507))

(declare-fun m!230441 () Bool)

(assert (=> bs!11803 m!230441))

(declare-fun m!230443 () Bool)

(assert (=> bs!11803 m!230443))

(assert (=> d!47984 d!48345))

(assert (=> d!47984 d!48309))

(assert (=> d!47984 d!47980))

(declare-fun d!48347 () Bool)

(assert (=> d!48347 (isPrefixOf!0 lt!230581 (_2!6953 lt!230274))))

(declare-fun lt!231411 () Unit!9318)

(assert (=> d!48347 (= lt!231411 (choose!30 lt!230581 (_2!6953 lt!230274) (_2!6953 lt!230274)))))

(assert (=> d!48347 (isPrefixOf!0 lt!230581 (_2!6953 lt!230274))))

(assert (=> d!48347 (= (lemmaIsPrefixTransitive!0 lt!230581 (_2!6953 lt!230274) (_2!6953 lt!230274)) lt!231411)))

(declare-fun bs!11804 () Bool)

(assert (= bs!11804 d!48347))

(assert (=> bs!11804 m!229507))

(declare-fun m!230445 () Bool)

(assert (=> bs!11804 m!230445))

(assert (=> bs!11804 m!229507))

(assert (=> d!47984 d!48347))

(assert (=> d!47984 d!48319))

(declare-fun d!48349 () Bool)

(declare-fun res!124256 () Bool)

(declare-fun e!99019 () Bool)

(assert (=> d!48349 (=> (not res!124256) (not e!99019))))

(assert (=> d!48349 (= res!124256 (= (size!3015 (buf!3480 (_1!6955 lt!230583))) (size!3015 (buf!3480 (_2!6955 lt!230583)))))))

(assert (=> d!48349 (= (isPrefixOf!0 (_1!6955 lt!230583) (_2!6955 lt!230583)) e!99019)))

(declare-fun b!148436 () Bool)

(declare-fun res!124255 () Bool)

(assert (=> b!148436 (=> (not res!124255) (not e!99019))))

(assert (=> b!148436 (= res!124255 (bvsle (bitIndex!0 (size!3015 (buf!3480 (_1!6955 lt!230583))) (currentByte!6388 (_1!6955 lt!230583)) (currentBit!6383 (_1!6955 lt!230583))) (bitIndex!0 (size!3015 (buf!3480 (_2!6955 lt!230583))) (currentByte!6388 (_2!6955 lt!230583)) (currentBit!6383 (_2!6955 lt!230583)))))))

(declare-fun b!148437 () Bool)

(declare-fun e!99018 () Bool)

(assert (=> b!148437 (= e!99019 e!99018)))

(declare-fun res!124254 () Bool)

(assert (=> b!148437 (=> res!124254 e!99018)))

(assert (=> b!148437 (= res!124254 (= (size!3015 (buf!3480 (_1!6955 lt!230583))) #b00000000000000000000000000000000))))

(declare-fun b!148438 () Bool)

(assert (=> b!148438 (= e!99018 (arrayBitRangesEq!0 (buf!3480 (_1!6955 lt!230583)) (buf!3480 (_2!6955 lt!230583)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3015 (buf!3480 (_1!6955 lt!230583))) (currentByte!6388 (_1!6955 lt!230583)) (currentBit!6383 (_1!6955 lt!230583)))))))

(assert (= (and d!48349 res!124256) b!148436))

(assert (= (and b!148436 res!124255) b!148437))

(assert (= (and b!148437 (not res!124254)) b!148438))

(assert (=> b!148436 m!230019))

(assert (=> b!148436 m!229911))

(assert (=> b!148438 m!230019))

(assert (=> b!148438 m!230019))

(declare-fun m!230447 () Bool)

(assert (=> b!148438 m!230447))

(assert (=> d!47984 d!48349))

(assert (=> d!47984 d!48341))

(declare-fun d!48351 () Bool)

(assert (=> d!48351 (isPrefixOf!0 lt!230581 lt!230581)))

(declare-fun lt!231412 () Unit!9318)

(assert (=> d!48351 (= lt!231412 (choose!11 lt!230581))))

(assert (=> d!48351 (= (lemmaIsPrefixRefl!0 lt!230581) lt!231412)))

(declare-fun bs!11805 () Bool)

(assert (= bs!11805 d!48351))

(assert (=> bs!11805 m!229513))

(declare-fun m!230449 () Bool)

(assert (=> bs!11805 m!230449))

(assert (=> d!47984 d!48351))

(declare-fun d!48353 () Bool)

(declare-fun res!124259 () Bool)

(declare-fun e!99021 () Bool)

(assert (=> d!48353 (=> (not res!124259) (not e!99021))))

(assert (=> d!48353 (= res!124259 (= (size!3015 (buf!3480 lt!230581)) (size!3015 (buf!3480 lt!230581))))))

(assert (=> d!48353 (= (isPrefixOf!0 lt!230581 lt!230581) e!99021)))

(declare-fun b!148439 () Bool)

(declare-fun res!124258 () Bool)

(assert (=> b!148439 (=> (not res!124258) (not e!99021))))

(assert (=> b!148439 (= res!124258 (bvsle (bitIndex!0 (size!3015 (buf!3480 lt!230581)) (currentByte!6388 lt!230581) (currentBit!6383 lt!230581)) (bitIndex!0 (size!3015 (buf!3480 lt!230581)) (currentByte!6388 lt!230581) (currentBit!6383 lt!230581))))))

(declare-fun b!148440 () Bool)

(declare-fun e!99020 () Bool)

(assert (=> b!148440 (= e!99021 e!99020)))

(declare-fun res!124257 () Bool)

(assert (=> b!148440 (=> res!124257 e!99020)))

(assert (=> b!148440 (= res!124257 (= (size!3015 (buf!3480 lt!230581)) #b00000000000000000000000000000000))))

(declare-fun b!148441 () Bool)

(assert (=> b!148441 (= e!99020 (arrayBitRangesEq!0 (buf!3480 lt!230581) (buf!3480 lt!230581) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3015 (buf!3480 lt!230581)) (currentByte!6388 lt!230581) (currentBit!6383 lt!230581))))))

(assert (= (and d!48353 res!124259) b!148439))

(assert (= (and b!148439 res!124258) b!148440))

(assert (= (and b!148440 (not res!124257)) b!148441))

(declare-fun m!230451 () Bool)

(assert (=> b!148439 m!230451))

(assert (=> b!148439 m!230451))

(assert (=> b!148441 m!230451))

(assert (=> b!148441 m!230451))

(declare-fun m!230453 () Bool)

(assert (=> b!148441 m!230453))

(assert (=> d!47984 d!48353))

(declare-fun d!48355 () Bool)

(declare-fun res!124262 () Bool)

(declare-fun e!99023 () Bool)

(assert (=> d!48355 (=> (not res!124262) (not e!99023))))

(assert (=> d!48355 (= res!124262 (= (size!3015 (buf!3480 lt!230581)) (size!3015 (buf!3480 (_2!6953 lt!230274)))))))

(assert (=> d!48355 (= (isPrefixOf!0 lt!230581 (_2!6953 lt!230274)) e!99023)))

(declare-fun b!148442 () Bool)

(declare-fun res!124261 () Bool)

(assert (=> b!148442 (=> (not res!124261) (not e!99023))))

(assert (=> b!148442 (= res!124261 (bvsle (bitIndex!0 (size!3015 (buf!3480 lt!230581)) (currentByte!6388 lt!230581) (currentBit!6383 lt!230581)) (bitIndex!0 (size!3015 (buf!3480 (_2!6953 lt!230274))) (currentByte!6388 (_2!6953 lt!230274)) (currentBit!6383 (_2!6953 lt!230274)))))))

(declare-fun b!148443 () Bool)

(declare-fun e!99022 () Bool)

(assert (=> b!148443 (= e!99023 e!99022)))

(declare-fun res!124260 () Bool)

(assert (=> b!148443 (=> res!124260 e!99022)))

(assert (=> b!148443 (= res!124260 (= (size!3015 (buf!3480 lt!230581)) #b00000000000000000000000000000000))))

(declare-fun b!148444 () Bool)

(assert (=> b!148444 (= e!99022 (arrayBitRangesEq!0 (buf!3480 lt!230581) (buf!3480 (_2!6953 lt!230274)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3015 (buf!3480 lt!230581)) (currentByte!6388 lt!230581) (currentBit!6383 lt!230581))))))

(assert (= (and d!48355 res!124262) b!148442))

(assert (= (and b!148442 res!124261) b!148443))

(assert (= (and b!148443 (not res!124260)) b!148444))

(assert (=> b!148442 m!230451))

(assert (=> b!148442 m!229273))

(assert (=> b!148444 m!230451))

(assert (=> b!148444 m!230451))

(declare-fun m!230455 () Bool)

(assert (=> b!148444 m!230455))

(assert (=> d!47984 d!48355))

(assert (=> d!47984 d!48337))

(declare-fun d!48357 () Bool)

(assert (=> d!48357 (= (remainingBits!0 ((_ sign_extend 32) (size!3015 (buf!3480 (_1!6956 lt!230256)))) ((_ sign_extend 32) (currentByte!6388 (_1!6956 lt!230256))) ((_ sign_extend 32) (currentBit!6383 (_1!6956 lt!230256)))) (bvsub (bvmul ((_ sign_extend 32) (size!3015 (buf!3480 (_1!6956 lt!230256)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6388 (_1!6956 lt!230256))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6383 (_1!6956 lt!230256))))))))

(assert (=> d!47991 d!48357))

(declare-fun d!48359 () Bool)

(assert (=> d!48359 (= (invariant!0 (currentBit!6383 (_1!6956 lt!230256)) (currentByte!6388 (_1!6956 lt!230256)) (size!3015 (buf!3480 (_1!6956 lt!230256)))) (and (bvsge (currentBit!6383 (_1!6956 lt!230256)) #b00000000000000000000000000000000) (bvslt (currentBit!6383 (_1!6956 lt!230256)) #b00000000000000000000000000001000) (bvsge (currentByte!6388 (_1!6956 lt!230256)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6388 (_1!6956 lt!230256)) (size!3015 (buf!3480 (_1!6956 lt!230256)))) (and (= (currentBit!6383 (_1!6956 lt!230256)) #b00000000000000000000000000000000) (= (currentByte!6388 (_1!6956 lt!230256)) (size!3015 (buf!3480 (_1!6956 lt!230256))))))))))

(assert (=> d!47991 d!48359))

(push 1)

(assert (not b!148382))

(assert (not d!48281))

(assert (not b!148415))

(assert (not b!148387))

(assert (not b!148337))

(assert (not bm!2017))

(assert (not b!148346))

(assert (not b!148302))

(assert (not b!148430))

(assert (not b!148429))

(assert (not d!48307))

(assert (not b!148282))

(assert (not d!48293))

(assert (not b!148230))

(assert (not b!148258))

(assert (not d!48345))

(assert (not b!148423))

(assert (not b!148424))

(assert (not b!148331))

(assert (not b!148293))

(assert (not b!148344))

(assert (not d!48245))

(assert (not d!48333))

(assert (not d!48237))

(assert (not b!148365))

(assert (not b!148292))

(assert (not b!148383))

(assert (not d!48291))

(assert (not b!148233))

(assert (not b!148385))

(assert (not b!148255))

(assert (not d!48235))

(assert (not b!148300))

(assert (not d!48273))

(assert (not b!148326))

(assert (not b!148400))

(assert (not b!148348))

(assert (not d!48271))

(assert (not d!48249))

(assert (not d!48251))

(assert (not d!48217))

(assert (not b!148325))

(assert (not b!148273))

(assert (not bm!2016))

(assert (not d!48177))

(assert (not d!48259))

(assert (not b!148332))

(assert (not b!148259))

(assert (not b!148390))

(assert (not b!148264))

(assert (not d!48239))

(assert (not bm!2002))

(assert (not b!148426))

(assert (not b!148436))

(assert (not b!148442))

(assert (not b!148345))

(assert (not d!48341))

(assert (not b!148287))

(assert (not b!148229))

(assert (not d!48303))

(assert (not b!148338))

(assert (not d!48347))

(assert (not b!148421))

(assert (not d!48295))

(assert (not b!148404))

(assert (not b!148395))

(assert (not d!48297))

(assert (not b!148441))

(assert (not b!148340))

(assert (not b!148438))

(assert (not d!48247))

(assert (not b!148432))

(assert (not b!148305))

(assert (not d!48267))

(assert (not b!148439))

(assert (not d!48253))

(assert (not b!148330))

(assert (not b!148352))

(assert (not d!48311))

(assert (not d!48277))

(assert (not d!48263))

(assert (not bm!2012))

(assert (not bm!2014))

(assert (not d!48207))

(assert (not d!48319))

(assert (not b!148232))

(assert (not b!148380))

(assert (not b!148394))

(assert (not d!48261))

(assert (not bm!1998))

(assert (not b!148379))

(assert (not b!148353))

(assert (not b!148355))

(assert (not b!148427))

(assert (not b!148295))

(assert (not b!148367))

(assert (not b!148406))

(assert (not b!148298))

(assert (not d!48279))

(assert (not d!48193))

(assert (not bm!2009))

(assert (not d!48223))

(assert (not d!48257))

(assert (not bm!2013))

(assert (not d!48287))

(assert (not b!148417))

(assert (not b!148403))

(assert (not b!148262))

(assert (not b!148339))

(assert (not b!148235))

(assert (not bm!2001))

(assert (not d!48203))

(assert (not bm!2020))

(assert (not b!148267))

(assert (not b!148418))

(assert (not b!148279))

(assert (not bm!2018))

(assert (not d!48321))

(assert (not d!48211))

(assert (not bm!2019))

(assert (not b!148433))

(assert (not d!48339))

(assert (not d!48335))

(assert (not b!148276))

(assert (not b!148285))

(assert (not d!48289))

(assert (not b!148444))

(assert (not b!148252))

(assert (not b!148416))

(assert (not d!48283))

(assert (not b!148219))

(assert (not b!148221))

(assert (not bm!2011))

(assert (not d!48299))

(assert (not d!48173))

(assert (not d!48269))

(assert (not b!148401))

(assert (not bm!2000))

(assert (not b!148420))

(assert (not b!148274))

(assert (not b!148333))

(assert (not d!48205))

(assert (not b!148327))

(assert (not d!48199))

(assert (not b!148349))

(assert (not b!148397))

(assert (not b!148283))

(assert (not d!48323))

(assert (not d!48241))

(assert (not b!148223))

(assert (not d!48351))

(assert (not bm!2015))

(assert (not bm!1999))

(assert (not b!148358))

(assert (not b!148351))

(assert (not b!148392))

(assert (not b!148398))

(assert (not bm!2021))

(assert (not b!148388))

(assert (not b!148290))

(assert (not d!48305))

(assert (not b!148435))

(assert (not b!148347))

(assert (not b!148328))

(assert (not b!148361))

(assert (not bm!2010))

(assert (not b!148250))

(assert (not b!148391))

(assert (not b!148261))

(assert (not b!148381))

(assert (not b!148342))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

