; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25816 () Bool)

(assert start!25816)

(declare-fun b!131945 () Bool)

(declare-fun res!109520 () Bool)

(declare-fun e!87485 () Bool)

(assert (=> b!131945 (=> (not res!109520) (not e!87485))))

(declare-datatypes ((array!6091 0))(
  ( (array!6092 (arr!3387 (Array (_ BitVec 32) (_ BitVec 8))) (size!2758 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4780 0))(
  ( (BitStream!4781 (buf!3125 array!6091) (currentByte!5904 (_ BitVec 32)) (currentBit!5899 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8139 0))(
  ( (Unit!8140) )
))
(declare-datatypes ((tuple2!11434 0))(
  ( (tuple2!11435 (_1!6020 Unit!8139) (_2!6020 BitStream!4780)) )
))
(declare-fun lt!203506 () tuple2!11434)

(declare-fun thiss!1634 () BitStream!4780)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!131945 (= res!109520 (= (bitIndex!0 (size!2758 (buf!3125 (_2!6020 lt!203506))) (currentByte!5904 (_2!6020 lt!203506)) (currentBit!5899 (_2!6020 lt!203506))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2758 (buf!3125 thiss!1634)) (currentByte!5904 thiss!1634) (currentBit!5899 thiss!1634)))))))

(declare-fun b!131946 () Bool)

(declare-fun res!109516 () Bool)

(declare-fun e!87483 () Bool)

(assert (=> b!131946 (=> (not res!109516) (not e!87483))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!131946 (= res!109516 (invariant!0 (currentBit!5899 thiss!1634) (currentByte!5904 thiss!1634) (size!2758 (buf!3125 thiss!1634))))))

(declare-fun b!131947 () Bool)

(declare-fun e!87480 () Bool)

(declare-fun array_inv!2547 (array!6091) Bool)

(assert (=> b!131947 (= e!87480 (array_inv!2547 (buf!3125 thiss!1634)))))

(declare-datatypes ((tuple2!11436 0))(
  ( (tuple2!11437 (_1!6021 BitStream!4780) (_2!6021 (_ BitVec 8))) )
))
(declare-fun lt!203509 () tuple2!11436)

(declare-fun b!131948 () Bool)

(declare-fun arr!237 () array!6091)

(declare-datatypes ((tuple2!11438 0))(
  ( (tuple2!11439 (_1!6022 BitStream!4780) (_2!6022 BitStream!4780)) )
))
(declare-fun lt!203520 () tuple2!11438)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!131948 (= e!87485 (and (= (_2!6021 lt!203509) (select (arr!3387 arr!237) from!447)) (= (_1!6021 lt!203509) (_2!6022 lt!203520))))))

(declare-fun readBytePure!0 (BitStream!4780) tuple2!11436)

(assert (=> b!131948 (= lt!203509 (readBytePure!0 (_1!6022 lt!203520)))))

(declare-fun reader!0 (BitStream!4780 BitStream!4780) tuple2!11438)

(assert (=> b!131948 (= lt!203520 (reader!0 thiss!1634 (_2!6020 lt!203506)))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun e!87484 () Bool)

(declare-fun b!131949 () Bool)

(declare-fun lt!203517 () tuple2!11438)

(declare-datatypes ((tuple2!11440 0))(
  ( (tuple2!11441 (_1!6023 BitStream!4780) (_2!6023 array!6091)) )
))
(declare-fun readByteArrayLoopPure!0 (BitStream!4780 array!6091 (_ BitVec 32) (_ BitVec 32)) tuple2!11440)

(assert (=> b!131949 (= e!87484 (= (_1!6023 (readByteArrayLoopPure!0 (_1!6022 lt!203517) arr!237 from!447 to!404)) (_2!6022 lt!203517)))))

(declare-fun b!131950 () Bool)

(declare-fun e!87482 () Bool)

(assert (=> b!131950 (= e!87483 (not e!87482))))

(declare-fun res!109512 () Bool)

(assert (=> b!131950 (=> res!109512 e!87482)))

(assert (=> b!131950 (= res!109512 (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!203518 () tuple2!11434)

(declare-fun lt!203510 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!131950 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2758 (buf!3125 (_2!6020 lt!203518)))) ((_ sign_extend 32) (currentByte!5904 (_2!6020 lt!203506))) ((_ sign_extend 32) (currentBit!5899 (_2!6020 lt!203506))) lt!203510)))

(declare-fun lt!203521 () Unit!8139)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4780 array!6091 (_ BitVec 32)) Unit!8139)

(assert (=> b!131950 (= lt!203521 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6020 lt!203506) (buf!3125 (_2!6020 lt!203518)) lt!203510))))

(assert (=> b!131950 e!87484))

(declare-fun res!109514 () Bool)

(assert (=> b!131950 (=> (not res!109514) (not e!87484))))

(assert (=> b!131950 (= res!109514 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2758 (buf!3125 (_2!6020 lt!203518)))) ((_ sign_extend 32) (currentByte!5904 thiss!1634)) ((_ sign_extend 32) (currentBit!5899 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!203515 () Unit!8139)

(assert (=> b!131950 (= lt!203515 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3125 (_2!6020 lt!203518)) (bvsub to!404 from!447)))))

(assert (=> b!131950 (= (_2!6021 (readBytePure!0 (_1!6022 lt!203517))) (select (arr!3387 arr!237) from!447))))

(declare-fun lt!203519 () tuple2!11438)

(assert (=> b!131950 (= lt!203519 (reader!0 (_2!6020 lt!203506) (_2!6020 lt!203518)))))

(assert (=> b!131950 (= lt!203517 (reader!0 thiss!1634 (_2!6020 lt!203518)))))

(declare-fun e!87479 () Bool)

(assert (=> b!131950 e!87479))

(declare-fun res!109508 () Bool)

(assert (=> b!131950 (=> (not res!109508) (not e!87479))))

(declare-fun lt!203516 () tuple2!11436)

(declare-fun lt!203511 () tuple2!11436)

(assert (=> b!131950 (= res!109508 (= (bitIndex!0 (size!2758 (buf!3125 (_1!6021 lt!203516))) (currentByte!5904 (_1!6021 lt!203516)) (currentBit!5899 (_1!6021 lt!203516))) (bitIndex!0 (size!2758 (buf!3125 (_1!6021 lt!203511))) (currentByte!5904 (_1!6021 lt!203511)) (currentBit!5899 (_1!6021 lt!203511)))))))

(declare-fun lt!203512 () Unit!8139)

(declare-fun lt!203504 () BitStream!4780)

(declare-fun readBytePrefixLemma!0 (BitStream!4780 BitStream!4780) Unit!8139)

(assert (=> b!131950 (= lt!203512 (readBytePrefixLemma!0 lt!203504 (_2!6020 lt!203518)))))

(assert (=> b!131950 (= lt!203511 (readBytePure!0 (BitStream!4781 (buf!3125 (_2!6020 lt!203518)) (currentByte!5904 thiss!1634) (currentBit!5899 thiss!1634))))))

(assert (=> b!131950 (= lt!203516 (readBytePure!0 lt!203504))))

(assert (=> b!131950 (= lt!203504 (BitStream!4781 (buf!3125 (_2!6020 lt!203506)) (currentByte!5904 thiss!1634) (currentBit!5899 thiss!1634)))))

(declare-fun e!87478 () Bool)

(assert (=> b!131950 e!87478))

(declare-fun res!109513 () Bool)

(assert (=> b!131950 (=> (not res!109513) (not e!87478))))

(declare-fun isPrefixOf!0 (BitStream!4780 BitStream!4780) Bool)

(assert (=> b!131950 (= res!109513 (isPrefixOf!0 thiss!1634 (_2!6020 lt!203518)))))

(declare-fun lt!203507 () Unit!8139)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4780 BitStream!4780 BitStream!4780) Unit!8139)

(assert (=> b!131950 (= lt!203507 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6020 lt!203506) (_2!6020 lt!203518)))))

(declare-fun e!87481 () Bool)

(assert (=> b!131950 e!87481))

(declare-fun res!109511 () Bool)

(assert (=> b!131950 (=> (not res!109511) (not e!87481))))

(assert (=> b!131950 (= res!109511 (= (size!2758 (buf!3125 (_2!6020 lt!203506))) (size!2758 (buf!3125 (_2!6020 lt!203518)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4780 array!6091 (_ BitVec 32) (_ BitVec 32)) tuple2!11434)

(assert (=> b!131950 (= lt!203518 (appendByteArrayLoop!0 (_2!6020 lt!203506) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!131950 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2758 (buf!3125 (_2!6020 lt!203506)))) ((_ sign_extend 32) (currentByte!5904 (_2!6020 lt!203506))) ((_ sign_extend 32) (currentBit!5899 (_2!6020 lt!203506))) lt!203510)))

(assert (=> b!131950 (= lt!203510 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!203513 () Unit!8139)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4780 BitStream!4780 (_ BitVec 64) (_ BitVec 32)) Unit!8139)

(assert (=> b!131950 (= lt!203513 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6020 lt!203506) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!131950 e!87485))

(declare-fun res!109519 () Bool)

(assert (=> b!131950 (=> (not res!109519) (not e!87485))))

(assert (=> b!131950 (= res!109519 (= (size!2758 (buf!3125 thiss!1634)) (size!2758 (buf!3125 (_2!6020 lt!203506)))))))

(declare-fun appendByte!0 (BitStream!4780 (_ BitVec 8)) tuple2!11434)

(assert (=> b!131950 (= lt!203506 (appendByte!0 thiss!1634 (select (arr!3387 arr!237) from!447)))))

(declare-fun b!131951 () Bool)

(declare-fun res!109509 () Bool)

(assert (=> b!131951 (=> (not res!109509) (not e!87483))))

(assert (=> b!131951 (= res!109509 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2758 (buf!3125 thiss!1634))) ((_ sign_extend 32) (currentByte!5904 thiss!1634)) ((_ sign_extend 32) (currentBit!5899 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!131952 () Bool)

(declare-fun e!87488 () Bool)

(declare-fun e!87486 () Bool)

(assert (=> b!131952 (= e!87488 (not e!87486))))

(declare-fun res!109517 () Bool)

(assert (=> b!131952 (=> res!109517 e!87486)))

(declare-fun lt!203522 () tuple2!11438)

(declare-fun lt!203514 () tuple2!11440)

(assert (=> b!131952 (= res!109517 (or (not (= (size!2758 (_2!6023 lt!203514)) (size!2758 arr!237))) (not (= (_1!6023 lt!203514) (_2!6022 lt!203522)))))))

(assert (=> b!131952 (= lt!203514 (readByteArrayLoopPure!0 (_1!6022 lt!203522) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!203508 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!131952 (validate_offset_bits!1 ((_ sign_extend 32) (size!2758 (buf!3125 (_2!6020 lt!203518)))) ((_ sign_extend 32) (currentByte!5904 (_2!6020 lt!203506))) ((_ sign_extend 32) (currentBit!5899 (_2!6020 lt!203506))) lt!203508)))

(declare-fun lt!203505 () Unit!8139)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4780 array!6091 (_ BitVec 64)) Unit!8139)

(assert (=> b!131952 (= lt!203505 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6020 lt!203506) (buf!3125 (_2!6020 lt!203518)) lt!203508))))

(assert (=> b!131952 (= lt!203522 (reader!0 (_2!6020 lt!203506) (_2!6020 lt!203518)))))

(declare-fun b!131953 () Bool)

(assert (=> b!131953 (= e!87479 (= (_2!6021 lt!203516) (_2!6021 lt!203511)))))

(declare-fun b!131954 () Bool)

(declare-fun res!109518 () Bool)

(assert (=> b!131954 (=> (not res!109518) (not e!87483))))

(assert (=> b!131954 (= res!109518 (bvslt from!447 to!404))))

(declare-fun b!131955 () Bool)

(declare-fun res!109522 () Bool)

(assert (=> b!131955 (=> (not res!109522) (not e!87485))))

(assert (=> b!131955 (= res!109522 (isPrefixOf!0 thiss!1634 (_2!6020 lt!203506)))))

(declare-fun b!131957 () Bool)

(declare-fun arrayRangesEq!161 (array!6091 array!6091 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!131957 (= e!87486 (not (arrayRangesEq!161 arr!237 (_2!6023 lt!203514) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!131958 () Bool)

(assert (=> b!131958 (= e!87482 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2758 (buf!3125 (_1!6022 lt!203519)))) ((_ sign_extend 32) (currentByte!5904 (_1!6022 lt!203519))) ((_ sign_extend 32) (currentBit!5899 (_1!6022 lt!203519))) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!131959 () Bool)

(assert (=> b!131959 (= e!87478 (invariant!0 (currentBit!5899 thiss!1634) (currentByte!5904 thiss!1634) (size!2758 (buf!3125 (_2!6020 lt!203506)))))))

(declare-fun b!131960 () Bool)

(assert (=> b!131960 (= e!87481 e!87488)))

(declare-fun res!109521 () Bool)

(assert (=> b!131960 (=> (not res!109521) (not e!87488))))

(assert (=> b!131960 (= res!109521 (= (bitIndex!0 (size!2758 (buf!3125 (_2!6020 lt!203518))) (currentByte!5904 (_2!6020 lt!203518)) (currentBit!5899 (_2!6020 lt!203518))) (bvadd (bitIndex!0 (size!2758 (buf!3125 (_2!6020 lt!203506))) (currentByte!5904 (_2!6020 lt!203506)) (currentBit!5899 (_2!6020 lt!203506))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!203508))))))

(assert (=> b!131960 (= lt!203508 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun res!109510 () Bool)

(assert (=> start!25816 (=> (not res!109510) (not e!87483))))

(assert (=> start!25816 (= res!109510 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2758 arr!237))))))

(assert (=> start!25816 e!87483))

(assert (=> start!25816 true))

(assert (=> start!25816 (array_inv!2547 arr!237)))

(declare-fun inv!12 (BitStream!4780) Bool)

(assert (=> start!25816 (and (inv!12 thiss!1634) e!87480)))

(declare-fun b!131956 () Bool)

(declare-fun res!109515 () Bool)

(assert (=> b!131956 (=> (not res!109515) (not e!87488))))

(assert (=> b!131956 (= res!109515 (isPrefixOf!0 (_2!6020 lt!203506) (_2!6020 lt!203518)))))

(assert (= (and start!25816 res!109510) b!131951))

(assert (= (and b!131951 res!109509) b!131954))

(assert (= (and b!131954 res!109518) b!131946))

(assert (= (and b!131946 res!109516) b!131950))

(assert (= (and b!131950 res!109519) b!131945))

(assert (= (and b!131945 res!109520) b!131955))

(assert (= (and b!131955 res!109522) b!131948))

(assert (= (and b!131950 res!109511) b!131960))

(assert (= (and b!131960 res!109521) b!131956))

(assert (= (and b!131956 res!109515) b!131952))

(assert (= (and b!131952 (not res!109517)) b!131957))

(assert (= (and b!131950 res!109513) b!131959))

(assert (= (and b!131950 res!109508) b!131953))

(assert (= (and b!131950 res!109514) b!131949))

(assert (= (and b!131950 (not res!109512)) b!131958))

(assert (= start!25816 b!131947))

(declare-fun m!199195 () Bool)

(assert (=> b!131951 m!199195))

(declare-fun m!199197 () Bool)

(assert (=> b!131948 m!199197))

(declare-fun m!199199 () Bool)

(assert (=> b!131948 m!199199))

(declare-fun m!199201 () Bool)

(assert (=> b!131948 m!199201))

(declare-fun m!199203 () Bool)

(assert (=> b!131945 m!199203))

(declare-fun m!199205 () Bool)

(assert (=> b!131945 m!199205))

(declare-fun m!199207 () Bool)

(assert (=> b!131959 m!199207))

(declare-fun m!199209 () Bool)

(assert (=> b!131958 m!199209))

(declare-fun m!199211 () Bool)

(assert (=> b!131957 m!199211))

(declare-fun m!199213 () Bool)

(assert (=> b!131952 m!199213))

(declare-fun m!199215 () Bool)

(assert (=> b!131952 m!199215))

(declare-fun m!199217 () Bool)

(assert (=> b!131952 m!199217))

(declare-fun m!199219 () Bool)

(assert (=> b!131952 m!199219))

(declare-fun m!199221 () Bool)

(assert (=> b!131946 m!199221))

(declare-fun m!199223 () Bool)

(assert (=> b!131947 m!199223))

(declare-fun m!199225 () Bool)

(assert (=> b!131960 m!199225))

(assert (=> b!131960 m!199203))

(declare-fun m!199227 () Bool)

(assert (=> start!25816 m!199227))

(declare-fun m!199229 () Bool)

(assert (=> start!25816 m!199229))

(declare-fun m!199231 () Bool)

(assert (=> b!131949 m!199231))

(declare-fun m!199233 () Bool)

(assert (=> b!131955 m!199233))

(declare-fun m!199235 () Bool)

(assert (=> b!131956 m!199235))

(declare-fun m!199237 () Bool)

(assert (=> b!131950 m!199237))

(declare-fun m!199239 () Bool)

(assert (=> b!131950 m!199239))

(declare-fun m!199241 () Bool)

(assert (=> b!131950 m!199241))

(declare-fun m!199243 () Bool)

(assert (=> b!131950 m!199243))

(declare-fun m!199245 () Bool)

(assert (=> b!131950 m!199245))

(declare-fun m!199247 () Bool)

(assert (=> b!131950 m!199247))

(declare-fun m!199249 () Bool)

(assert (=> b!131950 m!199249))

(assert (=> b!131950 m!199219))

(declare-fun m!199251 () Bool)

(assert (=> b!131950 m!199251))

(declare-fun m!199253 () Bool)

(assert (=> b!131950 m!199253))

(declare-fun m!199255 () Bool)

(assert (=> b!131950 m!199255))

(declare-fun m!199257 () Bool)

(assert (=> b!131950 m!199257))

(declare-fun m!199259 () Bool)

(assert (=> b!131950 m!199259))

(declare-fun m!199261 () Bool)

(assert (=> b!131950 m!199261))

(declare-fun m!199263 () Bool)

(assert (=> b!131950 m!199263))

(declare-fun m!199265 () Bool)

(assert (=> b!131950 m!199265))

(assert (=> b!131950 m!199197))

(declare-fun m!199267 () Bool)

(assert (=> b!131950 m!199267))

(declare-fun m!199269 () Bool)

(assert (=> b!131950 m!199269))

(assert (=> b!131950 m!199197))

(push 1)

(assert (not b!131956))

(assert (not b!131959))

(assert (not b!131951))

(assert (not b!131952))

(assert (not b!131949))

(assert (not b!131948))

(assert (not b!131947))

(assert (not b!131960))

(assert (not b!131955))

(assert (not b!131946))

(assert (not b!131957))

(assert (not b!131945))

(assert (not b!131950))

(assert (not start!25816))

(assert (not b!131958))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!41934 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!41934 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2758 (buf!3125 (_1!6022 lt!203519)))) ((_ sign_extend 32) (currentByte!5904 (_1!6022 lt!203519))) ((_ sign_extend 32) (currentBit!5899 (_1!6022 lt!203519))) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) (bvsle ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2758 (buf!3125 (_1!6022 lt!203519)))) ((_ sign_extend 32) (currentByte!5904 (_1!6022 lt!203519))) ((_ sign_extend 32) (currentBit!5899 (_1!6022 lt!203519)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10245 () Bool)

(assert (= bs!10245 d!41934))

(declare-fun m!199423 () Bool)

(assert (=> bs!10245 m!199423))

(assert (=> b!131958 d!41934))

(declare-fun d!41936 () Bool)

(assert (=> d!41936 (= (array_inv!2547 (buf!3125 thiss!1634)) (bvsge (size!2758 (buf!3125 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!131947 d!41936))

(declare-fun d!41938 () Bool)

(declare-datatypes ((tuple2!11458 0))(
  ( (tuple2!11459 (_1!6032 (_ BitVec 8)) (_2!6032 BitStream!4780)) )
))
(declare-fun lt!203639 () tuple2!11458)

(declare-fun readByte!0 (BitStream!4780) tuple2!11458)

(assert (=> d!41938 (= lt!203639 (readByte!0 (_1!6022 lt!203520)))))

(assert (=> d!41938 (= (readBytePure!0 (_1!6022 lt!203520)) (tuple2!11437 (_2!6032 lt!203639) (_1!6032 lt!203639)))))

(declare-fun bs!10246 () Bool)

(assert (= bs!10246 d!41938))

(declare-fun m!199425 () Bool)

(assert (=> bs!10246 m!199425))

(assert (=> b!131948 d!41938))

(declare-fun lt!203697 () (_ BitVec 64))

(declare-fun b!132067 () Bool)

(declare-fun lt!203682 () tuple2!11438)

(declare-fun lt!203699 () (_ BitVec 64))

(declare-fun e!87565 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!4780 (_ BitVec 64)) BitStream!4780)

(assert (=> b!132067 (= e!87565 (= (_1!6022 lt!203682) (withMovedBitIndex!0 (_2!6022 lt!203682) (bvsub lt!203697 lt!203699))))))

(assert (=> b!132067 (or (= (bvand lt!203697 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!203699 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!203697 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!203697 lt!203699) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!132067 (= lt!203699 (bitIndex!0 (size!2758 (buf!3125 (_2!6020 lt!203506))) (currentByte!5904 (_2!6020 lt!203506)) (currentBit!5899 (_2!6020 lt!203506))))))

(assert (=> b!132067 (= lt!203697 (bitIndex!0 (size!2758 (buf!3125 thiss!1634)) (currentByte!5904 thiss!1634) (currentBit!5899 thiss!1634)))))

(declare-fun d!41940 () Bool)

(assert (=> d!41940 e!87565))

(declare-fun res!109621 () Bool)

(assert (=> d!41940 (=> (not res!109621) (not e!87565))))

(assert (=> d!41940 (= res!109621 (isPrefixOf!0 (_1!6022 lt!203682) (_2!6022 lt!203682)))))

(declare-fun lt!203687 () BitStream!4780)

(assert (=> d!41940 (= lt!203682 (tuple2!11439 lt!203687 (_2!6020 lt!203506)))))

(declare-fun lt!203690 () Unit!8139)

(declare-fun lt!203691 () Unit!8139)

(assert (=> d!41940 (= lt!203690 lt!203691)))

(assert (=> d!41940 (isPrefixOf!0 lt!203687 (_2!6020 lt!203506))))

(assert (=> d!41940 (= lt!203691 (lemmaIsPrefixTransitive!0 lt!203687 (_2!6020 lt!203506) (_2!6020 lt!203506)))))

(declare-fun lt!203693 () Unit!8139)

(declare-fun lt!203696 () Unit!8139)

(assert (=> d!41940 (= lt!203693 lt!203696)))

(assert (=> d!41940 (isPrefixOf!0 lt!203687 (_2!6020 lt!203506))))

(assert (=> d!41940 (= lt!203696 (lemmaIsPrefixTransitive!0 lt!203687 thiss!1634 (_2!6020 lt!203506)))))

(declare-fun lt!203685 () Unit!8139)

(declare-fun e!87566 () Unit!8139)

(assert (=> d!41940 (= lt!203685 e!87566)))

(declare-fun c!7572 () Bool)

(assert (=> d!41940 (= c!7572 (not (= (size!2758 (buf!3125 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!203692 () Unit!8139)

(declare-fun lt!203695 () Unit!8139)

(assert (=> d!41940 (= lt!203692 lt!203695)))

(assert (=> d!41940 (isPrefixOf!0 (_2!6020 lt!203506) (_2!6020 lt!203506))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4780) Unit!8139)

(assert (=> d!41940 (= lt!203695 (lemmaIsPrefixRefl!0 (_2!6020 lt!203506)))))

(declare-fun lt!203683 () Unit!8139)

(declare-fun lt!203689 () Unit!8139)

(assert (=> d!41940 (= lt!203683 lt!203689)))

(assert (=> d!41940 (= lt!203689 (lemmaIsPrefixRefl!0 (_2!6020 lt!203506)))))

(declare-fun lt!203680 () Unit!8139)

(declare-fun lt!203694 () Unit!8139)

(assert (=> d!41940 (= lt!203680 lt!203694)))

(assert (=> d!41940 (isPrefixOf!0 lt!203687 lt!203687)))

(assert (=> d!41940 (= lt!203694 (lemmaIsPrefixRefl!0 lt!203687))))

(declare-fun lt!203681 () Unit!8139)

(declare-fun lt!203688 () Unit!8139)

(assert (=> d!41940 (= lt!203681 lt!203688)))

(assert (=> d!41940 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!41940 (= lt!203688 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!41940 (= lt!203687 (BitStream!4781 (buf!3125 (_2!6020 lt!203506)) (currentByte!5904 thiss!1634) (currentBit!5899 thiss!1634)))))

(assert (=> d!41940 (isPrefixOf!0 thiss!1634 (_2!6020 lt!203506))))

(assert (=> d!41940 (= (reader!0 thiss!1634 (_2!6020 lt!203506)) lt!203682)))

(declare-fun b!132068 () Bool)

(declare-fun Unit!8145 () Unit!8139)

(assert (=> b!132068 (= e!87566 Unit!8145)))

(declare-fun b!132069 () Bool)

(declare-fun lt!203698 () Unit!8139)

(assert (=> b!132069 (= e!87566 lt!203698)))

(declare-fun lt!203684 () (_ BitVec 64))

(assert (=> b!132069 (= lt!203684 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!203686 () (_ BitVec 64))

(assert (=> b!132069 (= lt!203686 (bitIndex!0 (size!2758 (buf!3125 thiss!1634)) (currentByte!5904 thiss!1634) (currentBit!5899 thiss!1634)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6091 array!6091 (_ BitVec 64) (_ BitVec 64)) Unit!8139)

(assert (=> b!132069 (= lt!203698 (arrayBitRangesEqSymmetric!0 (buf!3125 thiss!1634) (buf!3125 (_2!6020 lt!203506)) lt!203684 lt!203686))))

(declare-fun arrayBitRangesEq!0 (array!6091 array!6091 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!132069 (arrayBitRangesEq!0 (buf!3125 (_2!6020 lt!203506)) (buf!3125 thiss!1634) lt!203684 lt!203686)))

(declare-fun b!132070 () Bool)

(declare-fun res!109620 () Bool)

(assert (=> b!132070 (=> (not res!109620) (not e!87565))))

(assert (=> b!132070 (= res!109620 (isPrefixOf!0 (_1!6022 lt!203682) thiss!1634))))

(declare-fun b!132071 () Bool)

(declare-fun res!109619 () Bool)

(assert (=> b!132071 (=> (not res!109619) (not e!87565))))

(assert (=> b!132071 (= res!109619 (isPrefixOf!0 (_2!6022 lt!203682) (_2!6020 lt!203506)))))

(assert (= (and d!41940 c!7572) b!132069))

(assert (= (and d!41940 (not c!7572)) b!132068))

(assert (= (and d!41940 res!109621) b!132070))

(assert (= (and b!132070 res!109620) b!132071))

(assert (= (and b!132071 res!109619) b!132067))

(assert (=> b!132069 m!199205))

(declare-fun m!199427 () Bool)

(assert (=> b!132069 m!199427))

(declare-fun m!199429 () Bool)

(assert (=> b!132069 m!199429))

(declare-fun m!199431 () Bool)

(assert (=> b!132070 m!199431))

(declare-fun m!199433 () Bool)

(assert (=> b!132067 m!199433))

(assert (=> b!132067 m!199203))

(assert (=> b!132067 m!199205))

(declare-fun m!199435 () Bool)

(assert (=> b!132071 m!199435))

(declare-fun m!199437 () Bool)

(assert (=> d!41940 m!199437))

(declare-fun m!199439 () Bool)

(assert (=> d!41940 m!199439))

(declare-fun m!199441 () Bool)

(assert (=> d!41940 m!199441))

(declare-fun m!199443 () Bool)

(assert (=> d!41940 m!199443))

(declare-fun m!199445 () Bool)

(assert (=> d!41940 m!199445))

(declare-fun m!199447 () Bool)

(assert (=> d!41940 m!199447))

(assert (=> d!41940 m!199233))

(declare-fun m!199449 () Bool)

(assert (=> d!41940 m!199449))

(declare-fun m!199451 () Bool)

(assert (=> d!41940 m!199451))

(declare-fun m!199453 () Bool)

(assert (=> d!41940 m!199453))

(declare-fun m!199455 () Bool)

(assert (=> d!41940 m!199455))

(assert (=> b!131948 d!41940))

(declare-fun d!41942 () Bool)

(assert (=> d!41942 (= (invariant!0 (currentBit!5899 thiss!1634) (currentByte!5904 thiss!1634) (size!2758 (buf!3125 thiss!1634))) (and (bvsge (currentBit!5899 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!5899 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!5904 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!5904 thiss!1634) (size!2758 (buf!3125 thiss!1634))) (and (= (currentBit!5899 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!5904 thiss!1634) (size!2758 (buf!3125 thiss!1634)))))))))

(assert (=> b!131946 d!41942))

(declare-fun d!41944 () Bool)

(declare-fun res!109626 () Bool)

(declare-fun e!87571 () Bool)

(assert (=> d!41944 (=> res!109626 e!87571)))

(assert (=> d!41944 (= res!109626 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!41944 (= (arrayRangesEq!161 arr!237 (_2!6023 lt!203514) #b00000000000000000000000000000000 to!404) e!87571)))

(declare-fun b!132076 () Bool)

(declare-fun e!87572 () Bool)

(assert (=> b!132076 (= e!87571 e!87572)))

(declare-fun res!109627 () Bool)

(assert (=> b!132076 (=> (not res!109627) (not e!87572))))

(assert (=> b!132076 (= res!109627 (= (select (arr!3387 arr!237) #b00000000000000000000000000000000) (select (arr!3387 (_2!6023 lt!203514)) #b00000000000000000000000000000000)))))

(declare-fun b!132077 () Bool)

(assert (=> b!132077 (= e!87572 (arrayRangesEq!161 arr!237 (_2!6023 lt!203514) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!41944 (not res!109626)) b!132076))

(assert (= (and b!132076 res!109627) b!132077))

(declare-fun m!199457 () Bool)

(assert (=> b!132076 m!199457))

(declare-fun m!199459 () Bool)

(assert (=> b!132076 m!199459))

(declare-fun m!199461 () Bool)

(assert (=> b!132077 m!199461))

(assert (=> b!131957 d!41944))

(declare-fun d!41948 () Bool)

(assert (=> d!41948 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2758 (buf!3125 (_2!6020 lt!203518)))) ((_ sign_extend 32) (currentByte!5904 (_2!6020 lt!203506))) ((_ sign_extend 32) (currentBit!5899 (_2!6020 lt!203506))) lt!203510) (bvsle ((_ sign_extend 32) lt!203510) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2758 (buf!3125 (_2!6020 lt!203518)))) ((_ sign_extend 32) (currentByte!5904 (_2!6020 lt!203506))) ((_ sign_extend 32) (currentBit!5899 (_2!6020 lt!203506)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10247 () Bool)

(assert (= bs!10247 d!41948))

(declare-fun m!199463 () Bool)

(assert (=> bs!10247 m!199463))

(assert (=> b!131950 d!41948))

(declare-fun d!41950 () Bool)

(assert (=> d!41950 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2758 (buf!3125 (_2!6020 lt!203506)))) ((_ sign_extend 32) (currentByte!5904 (_2!6020 lt!203506))) ((_ sign_extend 32) (currentBit!5899 (_2!6020 lt!203506))) lt!203510) (bvsle ((_ sign_extend 32) lt!203510) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2758 (buf!3125 (_2!6020 lt!203506)))) ((_ sign_extend 32) (currentByte!5904 (_2!6020 lt!203506))) ((_ sign_extend 32) (currentBit!5899 (_2!6020 lt!203506)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10248 () Bool)

(assert (= bs!10248 d!41950))

(declare-fun m!199465 () Bool)

(assert (=> bs!10248 m!199465))

(assert (=> b!131950 d!41950))

(declare-fun d!41952 () Bool)

(declare-fun lt!203700 () tuple2!11458)

(assert (=> d!41952 (= lt!203700 (readByte!0 (BitStream!4781 (buf!3125 (_2!6020 lt!203518)) (currentByte!5904 thiss!1634) (currentBit!5899 thiss!1634))))))

(assert (=> d!41952 (= (readBytePure!0 (BitStream!4781 (buf!3125 (_2!6020 lt!203518)) (currentByte!5904 thiss!1634) (currentBit!5899 thiss!1634))) (tuple2!11437 (_2!6032 lt!203700) (_1!6032 lt!203700)))))

(declare-fun bs!10249 () Bool)

(assert (= bs!10249 d!41952))

(declare-fun m!199467 () Bool)

(assert (=> bs!10249 m!199467))

(assert (=> b!131950 d!41952))

(declare-fun b!132078 () Bool)

(declare-fun lt!203720 () (_ BitVec 64))

(declare-fun lt!203718 () (_ BitVec 64))

(declare-fun e!87573 () Bool)

(declare-fun lt!203703 () tuple2!11438)

(assert (=> b!132078 (= e!87573 (= (_1!6022 lt!203703) (withMovedBitIndex!0 (_2!6022 lt!203703) (bvsub lt!203718 lt!203720))))))

(assert (=> b!132078 (or (= (bvand lt!203718 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!203720 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!203718 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!203718 lt!203720) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!132078 (= lt!203720 (bitIndex!0 (size!2758 (buf!3125 (_2!6020 lt!203518))) (currentByte!5904 (_2!6020 lt!203518)) (currentBit!5899 (_2!6020 lt!203518))))))

(assert (=> b!132078 (= lt!203718 (bitIndex!0 (size!2758 (buf!3125 (_2!6020 lt!203506))) (currentByte!5904 (_2!6020 lt!203506)) (currentBit!5899 (_2!6020 lt!203506))))))

(declare-fun d!41954 () Bool)

(assert (=> d!41954 e!87573))

(declare-fun res!109630 () Bool)

(assert (=> d!41954 (=> (not res!109630) (not e!87573))))

(assert (=> d!41954 (= res!109630 (isPrefixOf!0 (_1!6022 lt!203703) (_2!6022 lt!203703)))))

(declare-fun lt!203708 () BitStream!4780)

(assert (=> d!41954 (= lt!203703 (tuple2!11439 lt!203708 (_2!6020 lt!203518)))))

(declare-fun lt!203711 () Unit!8139)

(declare-fun lt!203712 () Unit!8139)

(assert (=> d!41954 (= lt!203711 lt!203712)))

(assert (=> d!41954 (isPrefixOf!0 lt!203708 (_2!6020 lt!203518))))

(assert (=> d!41954 (= lt!203712 (lemmaIsPrefixTransitive!0 lt!203708 (_2!6020 lt!203518) (_2!6020 lt!203518)))))

(declare-fun lt!203714 () Unit!8139)

(declare-fun lt!203717 () Unit!8139)

(assert (=> d!41954 (= lt!203714 lt!203717)))

(assert (=> d!41954 (isPrefixOf!0 lt!203708 (_2!6020 lt!203518))))

(assert (=> d!41954 (= lt!203717 (lemmaIsPrefixTransitive!0 lt!203708 (_2!6020 lt!203506) (_2!6020 lt!203518)))))

(declare-fun lt!203706 () Unit!8139)

(declare-fun e!87574 () Unit!8139)

(assert (=> d!41954 (= lt!203706 e!87574)))

(declare-fun c!7573 () Bool)

(assert (=> d!41954 (= c!7573 (not (= (size!2758 (buf!3125 (_2!6020 lt!203506))) #b00000000000000000000000000000000)))))

(declare-fun lt!203713 () Unit!8139)

(declare-fun lt!203716 () Unit!8139)

(assert (=> d!41954 (= lt!203713 lt!203716)))

(assert (=> d!41954 (isPrefixOf!0 (_2!6020 lt!203518) (_2!6020 lt!203518))))

(assert (=> d!41954 (= lt!203716 (lemmaIsPrefixRefl!0 (_2!6020 lt!203518)))))

(declare-fun lt!203704 () Unit!8139)

(declare-fun lt!203710 () Unit!8139)

(assert (=> d!41954 (= lt!203704 lt!203710)))

(assert (=> d!41954 (= lt!203710 (lemmaIsPrefixRefl!0 (_2!6020 lt!203518)))))

(declare-fun lt!203701 () Unit!8139)

(declare-fun lt!203715 () Unit!8139)

(assert (=> d!41954 (= lt!203701 lt!203715)))

(assert (=> d!41954 (isPrefixOf!0 lt!203708 lt!203708)))

(assert (=> d!41954 (= lt!203715 (lemmaIsPrefixRefl!0 lt!203708))))

(declare-fun lt!203702 () Unit!8139)

(declare-fun lt!203709 () Unit!8139)

(assert (=> d!41954 (= lt!203702 lt!203709)))

(assert (=> d!41954 (isPrefixOf!0 (_2!6020 lt!203506) (_2!6020 lt!203506))))

(assert (=> d!41954 (= lt!203709 (lemmaIsPrefixRefl!0 (_2!6020 lt!203506)))))

(assert (=> d!41954 (= lt!203708 (BitStream!4781 (buf!3125 (_2!6020 lt!203518)) (currentByte!5904 (_2!6020 lt!203506)) (currentBit!5899 (_2!6020 lt!203506))))))

(assert (=> d!41954 (isPrefixOf!0 (_2!6020 lt!203506) (_2!6020 lt!203518))))

(assert (=> d!41954 (= (reader!0 (_2!6020 lt!203506) (_2!6020 lt!203518)) lt!203703)))

(declare-fun b!132079 () Bool)

(declare-fun Unit!8146 () Unit!8139)

(assert (=> b!132079 (= e!87574 Unit!8146)))

(declare-fun b!132080 () Bool)

(declare-fun lt!203719 () Unit!8139)

(assert (=> b!132080 (= e!87574 lt!203719)))

(declare-fun lt!203705 () (_ BitVec 64))

(assert (=> b!132080 (= lt!203705 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!203707 () (_ BitVec 64))

(assert (=> b!132080 (= lt!203707 (bitIndex!0 (size!2758 (buf!3125 (_2!6020 lt!203506))) (currentByte!5904 (_2!6020 lt!203506)) (currentBit!5899 (_2!6020 lt!203506))))))

(assert (=> b!132080 (= lt!203719 (arrayBitRangesEqSymmetric!0 (buf!3125 (_2!6020 lt!203506)) (buf!3125 (_2!6020 lt!203518)) lt!203705 lt!203707))))

(assert (=> b!132080 (arrayBitRangesEq!0 (buf!3125 (_2!6020 lt!203518)) (buf!3125 (_2!6020 lt!203506)) lt!203705 lt!203707)))

(declare-fun b!132081 () Bool)

(declare-fun res!109629 () Bool)

(assert (=> b!132081 (=> (not res!109629) (not e!87573))))

(assert (=> b!132081 (= res!109629 (isPrefixOf!0 (_1!6022 lt!203703) (_2!6020 lt!203506)))))

(declare-fun b!132082 () Bool)

(declare-fun res!109628 () Bool)

(assert (=> b!132082 (=> (not res!109628) (not e!87573))))

(assert (=> b!132082 (= res!109628 (isPrefixOf!0 (_2!6022 lt!203703) (_2!6020 lt!203518)))))

(assert (= (and d!41954 c!7573) b!132080))

(assert (= (and d!41954 (not c!7573)) b!132079))

(assert (= (and d!41954 res!109630) b!132081))

(assert (= (and b!132081 res!109629) b!132082))

(assert (= (and b!132082 res!109628) b!132078))

(assert (=> b!132080 m!199203))

(declare-fun m!199471 () Bool)

(assert (=> b!132080 m!199471))

(declare-fun m!199473 () Bool)

(assert (=> b!132080 m!199473))

(declare-fun m!199475 () Bool)

(assert (=> b!132081 m!199475))

(declare-fun m!199477 () Bool)

(assert (=> b!132078 m!199477))

(assert (=> b!132078 m!199225))

(assert (=> b!132078 m!199203))

(declare-fun m!199479 () Bool)

(assert (=> b!132082 m!199479))

(assert (=> d!41954 m!199443))

(declare-fun m!199481 () Bool)

(assert (=> d!41954 m!199481))

(declare-fun m!199483 () Bool)

(assert (=> d!41954 m!199483))

(declare-fun m!199485 () Bool)

(assert (=> d!41954 m!199485))

(assert (=> d!41954 m!199447))

(declare-fun m!199487 () Bool)

(assert (=> d!41954 m!199487))

(assert (=> d!41954 m!199235))

(declare-fun m!199489 () Bool)

(assert (=> d!41954 m!199489))

(declare-fun m!199491 () Bool)

(assert (=> d!41954 m!199491))

(declare-fun m!199493 () Bool)

(assert (=> d!41954 m!199493))

(declare-fun m!199495 () Bool)

(assert (=> d!41954 m!199495))

(assert (=> b!131950 d!41954))

(declare-fun d!41958 () Bool)

(assert (=> d!41958 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2758 (buf!3125 (_2!6020 lt!203518)))) ((_ sign_extend 32) (currentByte!5904 (_2!6020 lt!203506))) ((_ sign_extend 32) (currentBit!5899 (_2!6020 lt!203506))) lt!203510)))

(declare-fun lt!203723 () Unit!8139)

(declare-fun choose!26 (BitStream!4780 array!6091 (_ BitVec 32) BitStream!4780) Unit!8139)

(assert (=> d!41958 (= lt!203723 (choose!26 (_2!6020 lt!203506) (buf!3125 (_2!6020 lt!203518)) lt!203510 (BitStream!4781 (buf!3125 (_2!6020 lt!203518)) (currentByte!5904 (_2!6020 lt!203506)) (currentBit!5899 (_2!6020 lt!203506)))))))

(assert (=> d!41958 (= (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6020 lt!203506) (buf!3125 (_2!6020 lt!203518)) lt!203510) lt!203723)))

(declare-fun bs!10251 () Bool)

(assert (= bs!10251 d!41958))

(assert (=> bs!10251 m!199245))

(declare-fun m!199497 () Bool)

(assert (=> bs!10251 m!199497))

(assert (=> b!131950 d!41958))

(declare-fun d!41962 () Bool)

(assert (=> d!41962 (isPrefixOf!0 thiss!1634 (_2!6020 lt!203518))))

(declare-fun lt!203726 () Unit!8139)

(declare-fun choose!30 (BitStream!4780 BitStream!4780 BitStream!4780) Unit!8139)

(assert (=> d!41962 (= lt!203726 (choose!30 thiss!1634 (_2!6020 lt!203506) (_2!6020 lt!203518)))))

(assert (=> d!41962 (isPrefixOf!0 thiss!1634 (_2!6020 lt!203506))))

(assert (=> d!41962 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6020 lt!203506) (_2!6020 lt!203518)) lt!203726)))

(declare-fun bs!10252 () Bool)

(assert (= bs!10252 d!41962))

(assert (=> bs!10252 m!199253))

(declare-fun m!199505 () Bool)

(assert (=> bs!10252 m!199505))

(assert (=> bs!10252 m!199233))

(assert (=> b!131950 d!41962))

(declare-fun d!41966 () Bool)

(declare-fun e!87583 () Bool)

(assert (=> d!41966 e!87583))

(declare-fun res!109642 () Bool)

(assert (=> d!41966 (=> (not res!109642) (not e!87583))))

(declare-fun lt!203745 () (_ BitVec 64))

(declare-fun lt!203747 () (_ BitVec 64))

(declare-fun lt!203746 () (_ BitVec 64))

(assert (=> d!41966 (= res!109642 (= lt!203745 (bvsub lt!203746 lt!203747)))))

(assert (=> d!41966 (or (= (bvand lt!203746 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!203747 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!203746 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!203746 lt!203747) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41966 (= lt!203747 (remainingBits!0 ((_ sign_extend 32) (size!2758 (buf!3125 (_1!6021 lt!203511)))) ((_ sign_extend 32) (currentByte!5904 (_1!6021 lt!203511))) ((_ sign_extend 32) (currentBit!5899 (_1!6021 lt!203511)))))))

(declare-fun lt!203750 () (_ BitVec 64))

(declare-fun lt!203748 () (_ BitVec 64))

(assert (=> d!41966 (= lt!203746 (bvmul lt!203750 lt!203748))))

(assert (=> d!41966 (or (= lt!203750 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!203748 (bvsdiv (bvmul lt!203750 lt!203748) lt!203750)))))

(assert (=> d!41966 (= lt!203748 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41966 (= lt!203750 ((_ sign_extend 32) (size!2758 (buf!3125 (_1!6021 lt!203511)))))))

(assert (=> d!41966 (= lt!203745 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5904 (_1!6021 lt!203511))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5899 (_1!6021 lt!203511)))))))

(assert (=> d!41966 (invariant!0 (currentBit!5899 (_1!6021 lt!203511)) (currentByte!5904 (_1!6021 lt!203511)) (size!2758 (buf!3125 (_1!6021 lt!203511))))))

(assert (=> d!41966 (= (bitIndex!0 (size!2758 (buf!3125 (_1!6021 lt!203511))) (currentByte!5904 (_1!6021 lt!203511)) (currentBit!5899 (_1!6021 lt!203511))) lt!203745)))

(declare-fun b!132093 () Bool)

(declare-fun res!109641 () Bool)

(assert (=> b!132093 (=> (not res!109641) (not e!87583))))

(assert (=> b!132093 (= res!109641 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!203745))))

(declare-fun b!132094 () Bool)

(declare-fun lt!203749 () (_ BitVec 64))

(assert (=> b!132094 (= e!87583 (bvsle lt!203745 (bvmul lt!203749 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!132094 (or (= lt!203749 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!203749 #b0000000000000000000000000000000000000000000000000000000000001000) lt!203749)))))

(assert (=> b!132094 (= lt!203749 ((_ sign_extend 32) (size!2758 (buf!3125 (_1!6021 lt!203511)))))))

(assert (= (and d!41966 res!109642) b!132093))

(assert (= (and b!132093 res!109641) b!132094))

(declare-fun m!199511 () Bool)

(assert (=> d!41966 m!199511))

(declare-fun m!199513 () Bool)

(assert (=> d!41966 m!199513))

(assert (=> b!131950 d!41966))

(declare-fun b!132126 () Bool)

(declare-fun res!109669 () Bool)

(declare-fun e!87600 () Bool)

(assert (=> b!132126 (=> (not res!109669) (not e!87600))))

(declare-fun lt!203858 () tuple2!11434)

(assert (=> b!132126 (= res!109669 (isPrefixOf!0 (_2!6020 lt!203506) (_2!6020 lt!203858)))))

(declare-fun lt!203852 () tuple2!11440)

(declare-fun e!87599 () Bool)

(declare-fun b!132127 () Bool)

(assert (=> b!132127 (= e!87599 (arrayRangesEq!161 arr!237 (_2!6023 lt!203852) #b00000000000000000000000000000000 to!404))))

(declare-fun b!132128 () Bool)

(declare-fun e!87601 () Bool)

(declare-fun lt!203856 () (_ BitVec 64))

(assert (=> b!132128 (= e!87601 (validate_offset_bits!1 ((_ sign_extend 32) (size!2758 (buf!3125 (_2!6020 lt!203506)))) ((_ sign_extend 32) (currentByte!5904 (_2!6020 lt!203506))) ((_ sign_extend 32) (currentBit!5899 (_2!6020 lt!203506))) lt!203856))))

(declare-fun b!132129 () Bool)

(declare-fun res!109672 () Bool)

(assert (=> b!132129 (=> (not res!109672) (not e!87600))))

(declare-fun lt!203851 () (_ BitVec 64))

(declare-fun lt!203855 () (_ BitVec 64))

(assert (=> b!132129 (= res!109672 (= (bitIndex!0 (size!2758 (buf!3125 (_2!6020 lt!203858))) (currentByte!5904 (_2!6020 lt!203858)) (currentBit!5899 (_2!6020 lt!203858))) (bvadd lt!203855 lt!203851)))))

(assert (=> b!132129 (or (not (= (bvand lt!203855 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!203851 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!203855 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!203855 lt!203851) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!203854 () (_ BitVec 64))

(assert (=> b!132129 (= lt!203851 (bvmul lt!203854 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!132129 (or (= lt!203854 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!203854 #b0000000000000000000000000000000000000000000000000000000000001000) lt!203854)))))

(assert (=> b!132129 (= lt!203854 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!132129 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!132129 (= lt!203855 (bitIndex!0 (size!2758 (buf!3125 (_2!6020 lt!203506))) (currentByte!5904 (_2!6020 lt!203506)) (currentBit!5899 (_2!6020 lt!203506))))))

(declare-fun b!132130 () Bool)

(assert (=> b!132130 (= e!87600 e!87599)))

(declare-fun res!109668 () Bool)

(assert (=> b!132130 (=> (not res!109668) (not e!87599))))

(declare-fun lt!203853 () tuple2!11438)

(assert (=> b!132130 (= res!109668 (and (= (size!2758 (_2!6023 lt!203852)) (size!2758 arr!237)) (= (_1!6023 lt!203852) (_2!6022 lt!203853))))))

(assert (=> b!132130 (= lt!203852 (readByteArrayLoopPure!0 (_1!6022 lt!203853) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!203857 () Unit!8139)

(declare-fun lt!203859 () Unit!8139)

(assert (=> b!132130 (= lt!203857 lt!203859)))

(assert (=> b!132130 (validate_offset_bits!1 ((_ sign_extend 32) (size!2758 (buf!3125 (_2!6020 lt!203858)))) ((_ sign_extend 32) (currentByte!5904 (_2!6020 lt!203506))) ((_ sign_extend 32) (currentBit!5899 (_2!6020 lt!203506))) lt!203856)))

(assert (=> b!132130 (= lt!203859 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6020 lt!203506) (buf!3125 (_2!6020 lt!203858)) lt!203856))))

(assert (=> b!132130 e!87601))

(declare-fun res!109671 () Bool)

(assert (=> b!132130 (=> (not res!109671) (not e!87601))))

(assert (=> b!132130 (= res!109671 (and (= (size!2758 (buf!3125 (_2!6020 lt!203506))) (size!2758 (buf!3125 (_2!6020 lt!203858)))) (bvsge lt!203856 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!132130 (= lt!203856 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!132130 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!132130 (= lt!203853 (reader!0 (_2!6020 lt!203506) (_2!6020 lt!203858)))))

(declare-fun d!41972 () Bool)

(assert (=> d!41972 e!87600))

(declare-fun res!109670 () Bool)

(assert (=> d!41972 (=> (not res!109670) (not e!87600))))

(assert (=> d!41972 (= res!109670 (= (size!2758 (buf!3125 (_2!6020 lt!203506))) (size!2758 (buf!3125 (_2!6020 lt!203858)))))))

(declare-fun choose!64 (BitStream!4780 array!6091 (_ BitVec 32) (_ BitVec 32)) tuple2!11434)

(assert (=> d!41972 (= lt!203858 (choose!64 (_2!6020 lt!203506) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!41972 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2758 arr!237)))))

(assert (=> d!41972 (= (appendByteArrayLoop!0 (_2!6020 lt!203506) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!203858)))

(assert (= (and d!41972 res!109670) b!132129))

(assert (= (and b!132129 res!109672) b!132126))

(assert (= (and b!132126 res!109669) b!132130))

(assert (= (and b!132130 res!109671) b!132128))

(assert (= (and b!132130 res!109668) b!132127))

(declare-fun m!199553 () Bool)

(assert (=> b!132127 m!199553))

(declare-fun m!199555 () Bool)

(assert (=> d!41972 m!199555))

(declare-fun m!199557 () Bool)

(assert (=> b!132128 m!199557))

(declare-fun m!199559 () Bool)

(assert (=> b!132126 m!199559))

(declare-fun m!199561 () Bool)

(assert (=> b!132130 m!199561))

(declare-fun m!199563 () Bool)

(assert (=> b!132130 m!199563))

(declare-fun m!199565 () Bool)

(assert (=> b!132130 m!199565))

(declare-fun m!199567 () Bool)

(assert (=> b!132130 m!199567))

(declare-fun m!199569 () Bool)

(assert (=> b!132129 m!199569))

(assert (=> b!132129 m!199203))

(assert (=> b!131950 d!41972))

(declare-fun d!41982 () Bool)

(assert (=> d!41982 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2758 (buf!3125 (_2!6020 lt!203518)))) ((_ sign_extend 32) (currentByte!5904 thiss!1634)) ((_ sign_extend 32) (currentBit!5899 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!203860 () Unit!8139)

(assert (=> d!41982 (= lt!203860 (choose!26 thiss!1634 (buf!3125 (_2!6020 lt!203518)) (bvsub to!404 from!447) (BitStream!4781 (buf!3125 (_2!6020 lt!203518)) (currentByte!5904 thiss!1634) (currentBit!5899 thiss!1634))))))

(assert (=> d!41982 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3125 (_2!6020 lt!203518)) (bvsub to!404 from!447)) lt!203860)))

(declare-fun bs!10257 () Bool)

(assert (= bs!10257 d!41982))

(assert (=> bs!10257 m!199269))

(declare-fun m!199571 () Bool)

(assert (=> bs!10257 m!199571))

(assert (=> b!131950 d!41982))

(declare-fun d!41984 () Bool)

(declare-fun e!87604 () Bool)

(assert (=> d!41984 e!87604))

(declare-fun res!109675 () Bool)

(assert (=> d!41984 (=> (not res!109675) (not e!87604))))

(declare-fun lt!203872 () tuple2!11436)

(declare-fun lt!203871 () tuple2!11436)

(assert (=> d!41984 (= res!109675 (= (bitIndex!0 (size!2758 (buf!3125 (_1!6021 lt!203872))) (currentByte!5904 (_1!6021 lt!203872)) (currentBit!5899 (_1!6021 lt!203872))) (bitIndex!0 (size!2758 (buf!3125 (_1!6021 lt!203871))) (currentByte!5904 (_1!6021 lt!203871)) (currentBit!5899 (_1!6021 lt!203871)))))))

(declare-fun lt!203869 () BitStream!4780)

(declare-fun lt!203870 () Unit!8139)

(declare-fun choose!14 (BitStream!4780 BitStream!4780 BitStream!4780 tuple2!11436 tuple2!11436 BitStream!4780 (_ BitVec 8) tuple2!11436 tuple2!11436 BitStream!4780 (_ BitVec 8)) Unit!8139)

(assert (=> d!41984 (= lt!203870 (choose!14 lt!203504 (_2!6020 lt!203518) lt!203869 lt!203872 (tuple2!11437 (_1!6021 lt!203872) (_2!6021 lt!203872)) (_1!6021 lt!203872) (_2!6021 lt!203872) lt!203871 (tuple2!11437 (_1!6021 lt!203871) (_2!6021 lt!203871)) (_1!6021 lt!203871) (_2!6021 lt!203871)))))

(assert (=> d!41984 (= lt!203871 (readBytePure!0 lt!203869))))

(assert (=> d!41984 (= lt!203872 (readBytePure!0 lt!203504))))

(assert (=> d!41984 (= lt!203869 (BitStream!4781 (buf!3125 (_2!6020 lt!203518)) (currentByte!5904 lt!203504) (currentBit!5899 lt!203504)))))

(assert (=> d!41984 (= (readBytePrefixLemma!0 lt!203504 (_2!6020 lt!203518)) lt!203870)))

(declare-fun b!132133 () Bool)

(assert (=> b!132133 (= e!87604 (= (_2!6021 lt!203872) (_2!6021 lt!203871)))))

(assert (= (and d!41984 res!109675) b!132133))

(declare-fun m!199573 () Bool)

(assert (=> d!41984 m!199573))

(declare-fun m!199575 () Bool)

(assert (=> d!41984 m!199575))

(assert (=> d!41984 m!199261))

(declare-fun m!199577 () Bool)

(assert (=> d!41984 m!199577))

(declare-fun m!199579 () Bool)

(assert (=> d!41984 m!199579))

(assert (=> b!131950 d!41984))

(declare-fun d!41986 () Bool)

(declare-fun e!87607 () Bool)

(assert (=> d!41986 e!87607))

(declare-fun res!109678 () Bool)

(assert (=> d!41986 (=> (not res!109678) (not e!87607))))

(assert (=> d!41986 (= res!109678 (and (or (let ((rhs!3088 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3088 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3088) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!41987 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!41987 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!41987 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3087 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3087 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3087) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!203881 () Unit!8139)

(declare-fun choose!57 (BitStream!4780 BitStream!4780 (_ BitVec 64) (_ BitVec 32)) Unit!8139)

(assert (=> d!41986 (= lt!203881 (choose!57 thiss!1634 (_2!6020 lt!203506) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!41986 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6020 lt!203506) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!203881)))

(declare-fun b!132136 () Bool)

(declare-fun lt!203879 () (_ BitVec 32))

(assert (=> b!132136 (= e!87607 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2758 (buf!3125 (_2!6020 lt!203506)))) ((_ sign_extend 32) (currentByte!5904 (_2!6020 lt!203506))) ((_ sign_extend 32) (currentBit!5899 (_2!6020 lt!203506))) (bvsub (bvsub to!404 from!447) lt!203879)))))

(assert (=> b!132136 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!203879 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!203879) #b10000000000000000000000000000000)))))

(declare-fun lt!203880 () (_ BitVec 64))

(assert (=> b!132136 (= lt!203879 ((_ extract 31 0) lt!203880))))

(assert (=> b!132136 (and (bvslt lt!203880 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!203880 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!132136 (= lt!203880 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!41986 res!109678) b!132136))

(declare-fun m!199581 () Bool)

(assert (=> d!41986 m!199581))

(declare-fun m!199583 () Bool)

(assert (=> b!132136 m!199583))

(assert (=> b!131950 d!41986))

(declare-fun lt!203901 () (_ BitVec 64))

(declare-fun e!87608 () Bool)

(declare-fun b!132137 () Bool)

(declare-fun lt!203899 () (_ BitVec 64))

(declare-fun lt!203884 () tuple2!11438)

(assert (=> b!132137 (= e!87608 (= (_1!6022 lt!203884) (withMovedBitIndex!0 (_2!6022 lt!203884) (bvsub lt!203899 lt!203901))))))

(assert (=> b!132137 (or (= (bvand lt!203899 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!203901 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!203899 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!203899 lt!203901) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!132137 (= lt!203901 (bitIndex!0 (size!2758 (buf!3125 (_2!6020 lt!203518))) (currentByte!5904 (_2!6020 lt!203518)) (currentBit!5899 (_2!6020 lt!203518))))))

(assert (=> b!132137 (= lt!203899 (bitIndex!0 (size!2758 (buf!3125 thiss!1634)) (currentByte!5904 thiss!1634) (currentBit!5899 thiss!1634)))))

(declare-fun d!41989 () Bool)

(assert (=> d!41989 e!87608))

(declare-fun res!109681 () Bool)

(assert (=> d!41989 (=> (not res!109681) (not e!87608))))

(assert (=> d!41989 (= res!109681 (isPrefixOf!0 (_1!6022 lt!203884) (_2!6022 lt!203884)))))

(declare-fun lt!203889 () BitStream!4780)

(assert (=> d!41989 (= lt!203884 (tuple2!11439 lt!203889 (_2!6020 lt!203518)))))

(declare-fun lt!203892 () Unit!8139)

(declare-fun lt!203893 () Unit!8139)

(assert (=> d!41989 (= lt!203892 lt!203893)))

(assert (=> d!41989 (isPrefixOf!0 lt!203889 (_2!6020 lt!203518))))

(assert (=> d!41989 (= lt!203893 (lemmaIsPrefixTransitive!0 lt!203889 (_2!6020 lt!203518) (_2!6020 lt!203518)))))

(declare-fun lt!203895 () Unit!8139)

(declare-fun lt!203898 () Unit!8139)

(assert (=> d!41989 (= lt!203895 lt!203898)))

(assert (=> d!41989 (isPrefixOf!0 lt!203889 (_2!6020 lt!203518))))

(assert (=> d!41989 (= lt!203898 (lemmaIsPrefixTransitive!0 lt!203889 thiss!1634 (_2!6020 lt!203518)))))

(declare-fun lt!203887 () Unit!8139)

(declare-fun e!87609 () Unit!8139)

(assert (=> d!41989 (= lt!203887 e!87609)))

(declare-fun c!7577 () Bool)

(assert (=> d!41989 (= c!7577 (not (= (size!2758 (buf!3125 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!203894 () Unit!8139)

(declare-fun lt!203897 () Unit!8139)

(assert (=> d!41989 (= lt!203894 lt!203897)))

(assert (=> d!41989 (isPrefixOf!0 (_2!6020 lt!203518) (_2!6020 lt!203518))))

(assert (=> d!41989 (= lt!203897 (lemmaIsPrefixRefl!0 (_2!6020 lt!203518)))))

(declare-fun lt!203885 () Unit!8139)

(declare-fun lt!203891 () Unit!8139)

(assert (=> d!41989 (= lt!203885 lt!203891)))

(assert (=> d!41989 (= lt!203891 (lemmaIsPrefixRefl!0 (_2!6020 lt!203518)))))

(declare-fun lt!203882 () Unit!8139)

(declare-fun lt!203896 () Unit!8139)

(assert (=> d!41989 (= lt!203882 lt!203896)))

(assert (=> d!41989 (isPrefixOf!0 lt!203889 lt!203889)))

(assert (=> d!41989 (= lt!203896 (lemmaIsPrefixRefl!0 lt!203889))))

(declare-fun lt!203883 () Unit!8139)

(declare-fun lt!203890 () Unit!8139)

(assert (=> d!41989 (= lt!203883 lt!203890)))

(assert (=> d!41989 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!41989 (= lt!203890 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!41989 (= lt!203889 (BitStream!4781 (buf!3125 (_2!6020 lt!203518)) (currentByte!5904 thiss!1634) (currentBit!5899 thiss!1634)))))

(assert (=> d!41989 (isPrefixOf!0 thiss!1634 (_2!6020 lt!203518))))

(assert (=> d!41989 (= (reader!0 thiss!1634 (_2!6020 lt!203518)) lt!203884)))

(declare-fun b!132138 () Bool)

(declare-fun Unit!8148 () Unit!8139)

(assert (=> b!132138 (= e!87609 Unit!8148)))

(declare-fun b!132139 () Bool)

(declare-fun lt!203900 () Unit!8139)

(assert (=> b!132139 (= e!87609 lt!203900)))

(declare-fun lt!203886 () (_ BitVec 64))

(assert (=> b!132139 (= lt!203886 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!203888 () (_ BitVec 64))

(assert (=> b!132139 (= lt!203888 (bitIndex!0 (size!2758 (buf!3125 thiss!1634)) (currentByte!5904 thiss!1634) (currentBit!5899 thiss!1634)))))

(assert (=> b!132139 (= lt!203900 (arrayBitRangesEqSymmetric!0 (buf!3125 thiss!1634) (buf!3125 (_2!6020 lt!203518)) lt!203886 lt!203888))))

(assert (=> b!132139 (arrayBitRangesEq!0 (buf!3125 (_2!6020 lt!203518)) (buf!3125 thiss!1634) lt!203886 lt!203888)))

(declare-fun b!132140 () Bool)

(declare-fun res!109680 () Bool)

(assert (=> b!132140 (=> (not res!109680) (not e!87608))))

(assert (=> b!132140 (= res!109680 (isPrefixOf!0 (_1!6022 lt!203884) thiss!1634))))

(declare-fun b!132141 () Bool)

(declare-fun res!109679 () Bool)

(assert (=> b!132141 (=> (not res!109679) (not e!87608))))

(assert (=> b!132141 (= res!109679 (isPrefixOf!0 (_2!6022 lt!203884) (_2!6020 lt!203518)))))

(assert (= (and d!41989 c!7577) b!132139))

(assert (= (and d!41989 (not c!7577)) b!132138))

(assert (= (and d!41989 res!109681) b!132140))

(assert (= (and b!132140 res!109680) b!132141))

(assert (= (and b!132141 res!109679) b!132137))

(assert (=> b!132139 m!199205))

(declare-fun m!199585 () Bool)

(assert (=> b!132139 m!199585))

(declare-fun m!199587 () Bool)

(assert (=> b!132139 m!199587))

(declare-fun m!199589 () Bool)

(assert (=> b!132140 m!199589))

(declare-fun m!199591 () Bool)

(assert (=> b!132137 m!199591))

(assert (=> b!132137 m!199225))

(assert (=> b!132137 m!199205))

(declare-fun m!199593 () Bool)

(assert (=> b!132141 m!199593))

(assert (=> d!41989 m!199437))

(declare-fun m!199595 () Bool)

(assert (=> d!41989 m!199595))

(declare-fun m!199597 () Bool)

(assert (=> d!41989 m!199597))

(assert (=> d!41989 m!199485))

(assert (=> d!41989 m!199445))

(assert (=> d!41989 m!199487))

(assert (=> d!41989 m!199253))

(declare-fun m!199599 () Bool)

(assert (=> d!41989 m!199599))

(declare-fun m!199601 () Bool)

(assert (=> d!41989 m!199601))

(declare-fun m!199603 () Bool)

(assert (=> d!41989 m!199603))

(declare-fun m!199605 () Bool)

(assert (=> d!41989 m!199605))

(assert (=> b!131950 d!41989))

(declare-fun d!41991 () Bool)

(declare-fun res!109698 () Bool)

(declare-fun e!87621 () Bool)

(assert (=> d!41991 (=> (not res!109698) (not e!87621))))

(assert (=> d!41991 (= res!109698 (= (size!2758 (buf!3125 thiss!1634)) (size!2758 (buf!3125 (_2!6020 lt!203518)))))))

(assert (=> d!41991 (= (isPrefixOf!0 thiss!1634 (_2!6020 lt!203518)) e!87621)))

(declare-fun b!132158 () Bool)

(declare-fun res!109700 () Bool)

(assert (=> b!132158 (=> (not res!109700) (not e!87621))))

(assert (=> b!132158 (= res!109700 (bvsle (bitIndex!0 (size!2758 (buf!3125 thiss!1634)) (currentByte!5904 thiss!1634) (currentBit!5899 thiss!1634)) (bitIndex!0 (size!2758 (buf!3125 (_2!6020 lt!203518))) (currentByte!5904 (_2!6020 lt!203518)) (currentBit!5899 (_2!6020 lt!203518)))))))

(declare-fun b!132159 () Bool)

(declare-fun e!87620 () Bool)

(assert (=> b!132159 (= e!87621 e!87620)))

(declare-fun res!109699 () Bool)

(assert (=> b!132159 (=> res!109699 e!87620)))

(assert (=> b!132159 (= res!109699 (= (size!2758 (buf!3125 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!132160 () Bool)

(assert (=> b!132160 (= e!87620 (arrayBitRangesEq!0 (buf!3125 thiss!1634) (buf!3125 (_2!6020 lt!203518)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2758 (buf!3125 thiss!1634)) (currentByte!5904 thiss!1634) (currentBit!5899 thiss!1634))))))

(assert (= (and d!41991 res!109698) b!132158))

(assert (= (and b!132158 res!109700) b!132159))

(assert (= (and b!132159 (not res!109699)) b!132160))

(assert (=> b!132158 m!199205))

(assert (=> b!132158 m!199225))

(assert (=> b!132160 m!199205))

(assert (=> b!132160 m!199205))

(declare-fun m!199607 () Bool)

(assert (=> b!132160 m!199607))

(assert (=> b!131950 d!41991))

(declare-fun d!41993 () Bool)

(declare-fun e!87622 () Bool)

(assert (=> d!41993 e!87622))

(declare-fun res!109702 () Bool)

(assert (=> d!41993 (=> (not res!109702) (not e!87622))))

(declare-fun lt!203922 () (_ BitVec 64))

(declare-fun lt!203920 () (_ BitVec 64))

(declare-fun lt!203921 () (_ BitVec 64))

(assert (=> d!41993 (= res!109702 (= lt!203920 (bvsub lt!203921 lt!203922)))))

(assert (=> d!41993 (or (= (bvand lt!203921 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!203922 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!203921 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!203921 lt!203922) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41993 (= lt!203922 (remainingBits!0 ((_ sign_extend 32) (size!2758 (buf!3125 (_1!6021 lt!203516)))) ((_ sign_extend 32) (currentByte!5904 (_1!6021 lt!203516))) ((_ sign_extend 32) (currentBit!5899 (_1!6021 lt!203516)))))))

(declare-fun lt!203925 () (_ BitVec 64))

(declare-fun lt!203923 () (_ BitVec 64))

(assert (=> d!41993 (= lt!203921 (bvmul lt!203925 lt!203923))))

(assert (=> d!41993 (or (= lt!203925 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!203923 (bvsdiv (bvmul lt!203925 lt!203923) lt!203925)))))

(assert (=> d!41993 (= lt!203923 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41993 (= lt!203925 ((_ sign_extend 32) (size!2758 (buf!3125 (_1!6021 lt!203516)))))))

(assert (=> d!41993 (= lt!203920 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5904 (_1!6021 lt!203516))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5899 (_1!6021 lt!203516)))))))

(assert (=> d!41993 (invariant!0 (currentBit!5899 (_1!6021 lt!203516)) (currentByte!5904 (_1!6021 lt!203516)) (size!2758 (buf!3125 (_1!6021 lt!203516))))))

(assert (=> d!41993 (= (bitIndex!0 (size!2758 (buf!3125 (_1!6021 lt!203516))) (currentByte!5904 (_1!6021 lt!203516)) (currentBit!5899 (_1!6021 lt!203516))) lt!203920)))

(declare-fun b!132161 () Bool)

(declare-fun res!109701 () Bool)

(assert (=> b!132161 (=> (not res!109701) (not e!87622))))

(assert (=> b!132161 (= res!109701 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!203920))))

(declare-fun b!132162 () Bool)

(declare-fun lt!203924 () (_ BitVec 64))

(assert (=> b!132162 (= e!87622 (bvsle lt!203920 (bvmul lt!203924 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!132162 (or (= lt!203924 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!203924 #b0000000000000000000000000000000000000000000000000000000000001000) lt!203924)))))

(assert (=> b!132162 (= lt!203924 ((_ sign_extend 32) (size!2758 (buf!3125 (_1!6021 lt!203516)))))))

(assert (= (and d!41993 res!109702) b!132161))

(assert (= (and b!132161 res!109701) b!132162))

(declare-fun m!199609 () Bool)

(assert (=> d!41993 m!199609))

(declare-fun m!199611 () Bool)

(assert (=> d!41993 m!199611))

(assert (=> b!131950 d!41993))

(declare-fun d!41995 () Bool)

(assert (=> d!41995 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2758 (buf!3125 (_2!6020 lt!203518)))) ((_ sign_extend 32) (currentByte!5904 thiss!1634)) ((_ sign_extend 32) (currentBit!5899 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2758 (buf!3125 (_2!6020 lt!203518)))) ((_ sign_extend 32) (currentByte!5904 thiss!1634)) ((_ sign_extend 32) (currentBit!5899 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10258 () Bool)

(assert (= bs!10258 d!41995))

(declare-fun m!199613 () Bool)

(assert (=> bs!10258 m!199613))

(assert (=> b!131950 d!41995))

(declare-fun d!41997 () Bool)

(declare-fun lt!203926 () tuple2!11458)

(assert (=> d!41997 (= lt!203926 (readByte!0 (_1!6022 lt!203517)))))

(assert (=> d!41997 (= (readBytePure!0 (_1!6022 lt!203517)) (tuple2!11437 (_2!6032 lt!203926) (_1!6032 lt!203926)))))

(declare-fun bs!10259 () Bool)

(assert (= bs!10259 d!41997))

(declare-fun m!199615 () Bool)

(assert (=> bs!10259 m!199615))

(assert (=> b!131950 d!41997))

(declare-fun d!41999 () Bool)

(declare-fun e!87641 () Bool)

(assert (=> d!41999 e!87641))

(declare-fun res!109732 () Bool)

(assert (=> d!41999 (=> (not res!109732) (not e!87641))))

(declare-fun lt!204005 () tuple2!11434)

(assert (=> d!41999 (= res!109732 (= (size!2758 (buf!3125 thiss!1634)) (size!2758 (buf!3125 (_2!6020 lt!204005)))))))

(declare-fun choose!6 (BitStream!4780 (_ BitVec 8)) tuple2!11434)

(assert (=> d!41999 (= lt!204005 (choose!6 thiss!1634 (select (arr!3387 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!41999 (validate_offset_byte!0 ((_ sign_extend 32) (size!2758 (buf!3125 thiss!1634))) ((_ sign_extend 32) (currentByte!5904 thiss!1634)) ((_ sign_extend 32) (currentBit!5899 thiss!1634)))))

(assert (=> d!41999 (= (appendByte!0 thiss!1634 (select (arr!3387 arr!237) from!447)) lt!204005)))

(declare-fun b!132196 () Bool)

(declare-fun res!109734 () Bool)

(assert (=> b!132196 (=> (not res!109734) (not e!87641))))

(declare-fun lt!204007 () (_ BitVec 64))

(declare-fun lt!204003 () (_ BitVec 64))

(assert (=> b!132196 (= res!109734 (= (bitIndex!0 (size!2758 (buf!3125 (_2!6020 lt!204005))) (currentByte!5904 (_2!6020 lt!204005)) (currentBit!5899 (_2!6020 lt!204005))) (bvadd lt!204003 lt!204007)))))

(assert (=> b!132196 (or (not (= (bvand lt!204003 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!204007 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!204003 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!204003 lt!204007) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!132196 (= lt!204007 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!132196 (= lt!204003 (bitIndex!0 (size!2758 (buf!3125 thiss!1634)) (currentByte!5904 thiss!1634) (currentBit!5899 thiss!1634)))))

(declare-fun b!132197 () Bool)

(declare-fun res!109733 () Bool)

(assert (=> b!132197 (=> (not res!109733) (not e!87641))))

(assert (=> b!132197 (= res!109733 (isPrefixOf!0 thiss!1634 (_2!6020 lt!204005)))))

(declare-fun b!132198 () Bool)

(declare-fun lt!204006 () tuple2!11436)

(declare-fun lt!204004 () tuple2!11438)

(assert (=> b!132198 (= e!87641 (and (= (_2!6021 lt!204006) (select (arr!3387 arr!237) from!447)) (= (_1!6021 lt!204006) (_2!6022 lt!204004))))))

(assert (=> b!132198 (= lt!204006 (readBytePure!0 (_1!6022 lt!204004)))))

(assert (=> b!132198 (= lt!204004 (reader!0 thiss!1634 (_2!6020 lt!204005)))))

(assert (= (and d!41999 res!109732) b!132196))

(assert (= (and b!132196 res!109734) b!132197))

(assert (= (and b!132197 res!109733) b!132198))

(assert (=> d!41999 m!199197))

(declare-fun m!199681 () Bool)

(assert (=> d!41999 m!199681))

(declare-fun m!199685 () Bool)

(assert (=> d!41999 m!199685))

(declare-fun m!199687 () Bool)

(assert (=> b!132196 m!199687))

(assert (=> b!132196 m!199205))

(declare-fun m!199691 () Bool)

(assert (=> b!132197 m!199691))

(declare-fun m!199695 () Bool)

(assert (=> b!132198 m!199695))

(declare-fun m!199699 () Bool)

(assert (=> b!132198 m!199699))

(assert (=> b!131950 d!41999))

(declare-fun d!42019 () Bool)

(declare-fun lt!204008 () tuple2!11458)

(assert (=> d!42019 (= lt!204008 (readByte!0 lt!203504))))

(assert (=> d!42019 (= (readBytePure!0 lt!203504) (tuple2!11437 (_2!6032 lt!204008) (_1!6032 lt!204008)))))

(declare-fun bs!10265 () Bool)

(assert (= bs!10265 d!42019))

(declare-fun m!199707 () Bool)

(assert (=> bs!10265 m!199707))

(assert (=> b!131950 d!42019))

(declare-fun d!42021 () Bool)

(assert (=> d!42021 (= (invariant!0 (currentBit!5899 thiss!1634) (currentByte!5904 thiss!1634) (size!2758 (buf!3125 (_2!6020 lt!203506)))) (and (bvsge (currentBit!5899 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!5899 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!5904 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!5904 thiss!1634) (size!2758 (buf!3125 (_2!6020 lt!203506)))) (and (= (currentBit!5899 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!5904 thiss!1634) (size!2758 (buf!3125 (_2!6020 lt!203506))))))))))

(assert (=> b!131959 d!42021))

(declare-fun d!42025 () Bool)

(declare-fun e!87643 () Bool)

(assert (=> d!42025 e!87643))

(declare-fun res!109738 () Bool)

(assert (=> d!42025 (=> (not res!109738) (not e!87643))))

(declare-fun lt!204016 () (_ BitVec 64))

(declare-fun lt!204015 () (_ BitVec 64))

(declare-fun lt!204017 () (_ BitVec 64))

(assert (=> d!42025 (= res!109738 (= lt!204015 (bvsub lt!204016 lt!204017)))))

(assert (=> d!42025 (or (= (bvand lt!204016 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!204017 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!204016 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!204016 lt!204017) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42025 (= lt!204017 (remainingBits!0 ((_ sign_extend 32) (size!2758 (buf!3125 (_2!6020 lt!203518)))) ((_ sign_extend 32) (currentByte!5904 (_2!6020 lt!203518))) ((_ sign_extend 32) (currentBit!5899 (_2!6020 lt!203518)))))))

(declare-fun lt!204020 () (_ BitVec 64))

(declare-fun lt!204018 () (_ BitVec 64))

(assert (=> d!42025 (= lt!204016 (bvmul lt!204020 lt!204018))))

(assert (=> d!42025 (or (= lt!204020 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!204018 (bvsdiv (bvmul lt!204020 lt!204018) lt!204020)))))

(assert (=> d!42025 (= lt!204018 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42025 (= lt!204020 ((_ sign_extend 32) (size!2758 (buf!3125 (_2!6020 lt!203518)))))))

(assert (=> d!42025 (= lt!204015 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5904 (_2!6020 lt!203518))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5899 (_2!6020 lt!203518)))))))

(assert (=> d!42025 (invariant!0 (currentBit!5899 (_2!6020 lt!203518)) (currentByte!5904 (_2!6020 lt!203518)) (size!2758 (buf!3125 (_2!6020 lt!203518))))))

(assert (=> d!42025 (= (bitIndex!0 (size!2758 (buf!3125 (_2!6020 lt!203518))) (currentByte!5904 (_2!6020 lt!203518)) (currentBit!5899 (_2!6020 lt!203518))) lt!204015)))

(declare-fun b!132201 () Bool)

(declare-fun res!109737 () Bool)

(assert (=> b!132201 (=> (not res!109737) (not e!87643))))

(assert (=> b!132201 (= res!109737 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!204015))))

(declare-fun b!132202 () Bool)

(declare-fun lt!204019 () (_ BitVec 64))

(assert (=> b!132202 (= e!87643 (bvsle lt!204015 (bvmul lt!204019 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!132202 (or (= lt!204019 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!204019 #b0000000000000000000000000000000000000000000000000000000000001000) lt!204019)))))

(assert (=> b!132202 (= lt!204019 ((_ sign_extend 32) (size!2758 (buf!3125 (_2!6020 lt!203518)))))))

(assert (= (and d!42025 res!109738) b!132201))

(assert (= (and b!132201 res!109737) b!132202))

(declare-fun m!199721 () Bool)

(assert (=> d!42025 m!199721))

(declare-fun m!199723 () Bool)

(assert (=> d!42025 m!199723))

(assert (=> b!131960 d!42025))

(declare-fun d!42029 () Bool)

(declare-fun e!87644 () Bool)

(assert (=> d!42029 e!87644))

(declare-fun res!109740 () Bool)

(assert (=> d!42029 (=> (not res!109740) (not e!87644))))

(declare-fun lt!204022 () (_ BitVec 64))

(declare-fun lt!204021 () (_ BitVec 64))

(declare-fun lt!204023 () (_ BitVec 64))

(assert (=> d!42029 (= res!109740 (= lt!204021 (bvsub lt!204022 lt!204023)))))

(assert (=> d!42029 (or (= (bvand lt!204022 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!204023 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!204022 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!204022 lt!204023) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42029 (= lt!204023 (remainingBits!0 ((_ sign_extend 32) (size!2758 (buf!3125 (_2!6020 lt!203506)))) ((_ sign_extend 32) (currentByte!5904 (_2!6020 lt!203506))) ((_ sign_extend 32) (currentBit!5899 (_2!6020 lt!203506)))))))

(declare-fun lt!204026 () (_ BitVec 64))

(declare-fun lt!204024 () (_ BitVec 64))

(assert (=> d!42029 (= lt!204022 (bvmul lt!204026 lt!204024))))

(assert (=> d!42029 (or (= lt!204026 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!204024 (bvsdiv (bvmul lt!204026 lt!204024) lt!204026)))))

(assert (=> d!42029 (= lt!204024 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42029 (= lt!204026 ((_ sign_extend 32) (size!2758 (buf!3125 (_2!6020 lt!203506)))))))

(assert (=> d!42029 (= lt!204021 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5904 (_2!6020 lt!203506))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5899 (_2!6020 lt!203506)))))))

(assert (=> d!42029 (invariant!0 (currentBit!5899 (_2!6020 lt!203506)) (currentByte!5904 (_2!6020 lt!203506)) (size!2758 (buf!3125 (_2!6020 lt!203506))))))

(assert (=> d!42029 (= (bitIndex!0 (size!2758 (buf!3125 (_2!6020 lt!203506))) (currentByte!5904 (_2!6020 lt!203506)) (currentBit!5899 (_2!6020 lt!203506))) lt!204021)))

(declare-fun b!132203 () Bool)

(declare-fun res!109739 () Bool)

(assert (=> b!132203 (=> (not res!109739) (not e!87644))))

(assert (=> b!132203 (= res!109739 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!204021))))

(declare-fun b!132204 () Bool)

(declare-fun lt!204025 () (_ BitVec 64))

(assert (=> b!132204 (= e!87644 (bvsle lt!204021 (bvmul lt!204025 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!132204 (or (= lt!204025 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!204025 #b0000000000000000000000000000000000000000000000000000000000001000) lt!204025)))))

(assert (=> b!132204 (= lt!204025 ((_ sign_extend 32) (size!2758 (buf!3125 (_2!6020 lt!203506)))))))

(assert (= (and d!42029 res!109740) b!132203))

(assert (= (and b!132203 res!109739) b!132204))

(assert (=> d!42029 m!199465))

(declare-fun m!199725 () Bool)

(assert (=> d!42029 m!199725))

(assert (=> b!131960 d!42029))

(declare-datatypes ((tuple3!498 0))(
  ( (tuple3!499 (_1!6035 Unit!8139) (_2!6035 BitStream!4780) (_3!304 array!6091)) )
))
(declare-fun lt!204029 () tuple3!498)

(declare-fun d!42031 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!4780 array!6091 (_ BitVec 32) (_ BitVec 32)) tuple3!498)

(assert (=> d!42031 (= lt!204029 (readByteArrayLoop!0 (_1!6022 lt!203517) arr!237 from!447 to!404))))

(assert (=> d!42031 (= (readByteArrayLoopPure!0 (_1!6022 lt!203517) arr!237 from!447 to!404) (tuple2!11441 (_2!6035 lt!204029) (_3!304 lt!204029)))))

(declare-fun bs!10266 () Bool)

(assert (= bs!10266 d!42031))

(declare-fun m!199727 () Bool)

(assert (=> bs!10266 m!199727))

(assert (=> b!131949 d!42031))

(declare-fun d!42034 () Bool)

(assert (=> d!42034 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2758 (buf!3125 thiss!1634))) ((_ sign_extend 32) (currentByte!5904 thiss!1634)) ((_ sign_extend 32) (currentBit!5899 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2758 (buf!3125 thiss!1634))) ((_ sign_extend 32) (currentByte!5904 thiss!1634)) ((_ sign_extend 32) (currentBit!5899 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10267 () Bool)

(assert (= bs!10267 d!42034))

(declare-fun m!199729 () Bool)

(assert (=> bs!10267 m!199729))

(assert (=> b!131951 d!42034))

(declare-fun lt!204030 () tuple3!498)

(declare-fun d!42036 () Bool)

(assert (=> d!42036 (= lt!204030 (readByteArrayLoop!0 (_1!6022 lt!203522) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!42036 (= (readByteArrayLoopPure!0 (_1!6022 lt!203522) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11441 (_2!6035 lt!204030) (_3!304 lt!204030)))))

(declare-fun bs!10268 () Bool)

(assert (= bs!10268 d!42036))

(declare-fun m!199731 () Bool)

(assert (=> bs!10268 m!199731))

(assert (=> b!131952 d!42036))

(declare-fun d!42038 () Bool)

(assert (=> d!42038 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2758 (buf!3125 (_2!6020 lt!203518)))) ((_ sign_extend 32) (currentByte!5904 (_2!6020 lt!203506))) ((_ sign_extend 32) (currentBit!5899 (_2!6020 lt!203506))) lt!203508) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2758 (buf!3125 (_2!6020 lt!203518)))) ((_ sign_extend 32) (currentByte!5904 (_2!6020 lt!203506))) ((_ sign_extend 32) (currentBit!5899 (_2!6020 lt!203506)))) lt!203508))))

(declare-fun bs!10269 () Bool)

(assert (= bs!10269 d!42038))

(assert (=> bs!10269 m!199463))

(assert (=> b!131952 d!42038))

(declare-fun d!42040 () Bool)

(assert (=> d!42040 (validate_offset_bits!1 ((_ sign_extend 32) (size!2758 (buf!3125 (_2!6020 lt!203518)))) ((_ sign_extend 32) (currentByte!5904 (_2!6020 lt!203506))) ((_ sign_extend 32) (currentBit!5899 (_2!6020 lt!203506))) lt!203508)))

(declare-fun lt!204039 () Unit!8139)

(declare-fun choose!9 (BitStream!4780 array!6091 (_ BitVec 64) BitStream!4780) Unit!8139)

(assert (=> d!42040 (= lt!204039 (choose!9 (_2!6020 lt!203506) (buf!3125 (_2!6020 lt!203518)) lt!203508 (BitStream!4781 (buf!3125 (_2!6020 lt!203518)) (currentByte!5904 (_2!6020 lt!203506)) (currentBit!5899 (_2!6020 lt!203506)))))))

(assert (=> d!42040 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6020 lt!203506) (buf!3125 (_2!6020 lt!203518)) lt!203508) lt!204039)))

(declare-fun bs!10270 () Bool)

(assert (= bs!10270 d!42040))

(assert (=> bs!10270 m!199215))

(declare-fun m!199733 () Bool)

(assert (=> bs!10270 m!199733))

(assert (=> b!131952 d!42040))

(assert (=> b!131952 d!41954))

(declare-fun d!42042 () Bool)

(declare-fun res!109743 () Bool)

(declare-fun e!87648 () Bool)

(assert (=> d!42042 (=> (not res!109743) (not e!87648))))

(assert (=> d!42042 (= res!109743 (= (size!2758 (buf!3125 thiss!1634)) (size!2758 (buf!3125 (_2!6020 lt!203506)))))))

(assert (=> d!42042 (= (isPrefixOf!0 thiss!1634 (_2!6020 lt!203506)) e!87648)))

(declare-fun b!132207 () Bool)

(declare-fun res!109745 () Bool)

(assert (=> b!132207 (=> (not res!109745) (not e!87648))))

(assert (=> b!132207 (= res!109745 (bvsle (bitIndex!0 (size!2758 (buf!3125 thiss!1634)) (currentByte!5904 thiss!1634) (currentBit!5899 thiss!1634)) (bitIndex!0 (size!2758 (buf!3125 (_2!6020 lt!203506))) (currentByte!5904 (_2!6020 lt!203506)) (currentBit!5899 (_2!6020 lt!203506)))))))

(declare-fun b!132208 () Bool)

(declare-fun e!87647 () Bool)

(assert (=> b!132208 (= e!87648 e!87647)))

(declare-fun res!109744 () Bool)

(assert (=> b!132208 (=> res!109744 e!87647)))

(assert (=> b!132208 (= res!109744 (= (size!2758 (buf!3125 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!132209 () Bool)

(assert (=> b!132209 (= e!87647 (arrayBitRangesEq!0 (buf!3125 thiss!1634) (buf!3125 (_2!6020 lt!203506)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2758 (buf!3125 thiss!1634)) (currentByte!5904 thiss!1634) (currentBit!5899 thiss!1634))))))

(assert (= (and d!42042 res!109743) b!132207))

(assert (= (and b!132207 res!109745) b!132208))

(assert (= (and b!132208 (not res!109744)) b!132209))

(assert (=> b!132207 m!199205))

(assert (=> b!132207 m!199203))

(assert (=> b!132209 m!199205))

(assert (=> b!132209 m!199205))

(declare-fun m!199735 () Bool)

(assert (=> b!132209 m!199735))

(assert (=> b!131955 d!42042))

(declare-fun d!42044 () Bool)

(declare-fun res!109746 () Bool)

(declare-fun e!87650 () Bool)

(assert (=> d!42044 (=> (not res!109746) (not e!87650))))

(assert (=> d!42044 (= res!109746 (= (size!2758 (buf!3125 (_2!6020 lt!203506))) (size!2758 (buf!3125 (_2!6020 lt!203518)))))))

(assert (=> d!42044 (= (isPrefixOf!0 (_2!6020 lt!203506) (_2!6020 lt!203518)) e!87650)))

(declare-fun b!132210 () Bool)

(declare-fun res!109748 () Bool)

(assert (=> b!132210 (=> (not res!109748) (not e!87650))))

(assert (=> b!132210 (= res!109748 (bvsle (bitIndex!0 (size!2758 (buf!3125 (_2!6020 lt!203506))) (currentByte!5904 (_2!6020 lt!203506)) (currentBit!5899 (_2!6020 lt!203506))) (bitIndex!0 (size!2758 (buf!3125 (_2!6020 lt!203518))) (currentByte!5904 (_2!6020 lt!203518)) (currentBit!5899 (_2!6020 lt!203518)))))))

(declare-fun b!132211 () Bool)

(declare-fun e!87649 () Bool)

(assert (=> b!132211 (= e!87650 e!87649)))

(declare-fun res!109747 () Bool)

(assert (=> b!132211 (=> res!109747 e!87649)))

(assert (=> b!132211 (= res!109747 (= (size!2758 (buf!3125 (_2!6020 lt!203506))) #b00000000000000000000000000000000))))

(declare-fun b!132212 () Bool)

(assert (=> b!132212 (= e!87649 (arrayBitRangesEq!0 (buf!3125 (_2!6020 lt!203506)) (buf!3125 (_2!6020 lt!203518)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2758 (buf!3125 (_2!6020 lt!203506))) (currentByte!5904 (_2!6020 lt!203506)) (currentBit!5899 (_2!6020 lt!203506)))))))

(assert (= (and d!42044 res!109746) b!132210))

(assert (= (and b!132210 res!109748) b!132211))

(assert (= (and b!132211 (not res!109747)) b!132212))

(assert (=> b!132210 m!199203))

(assert (=> b!132210 m!199225))

(assert (=> b!132212 m!199203))

(assert (=> b!132212 m!199203))

(declare-fun m!199737 () Bool)

(assert (=> b!132212 m!199737))

(assert (=> b!131956 d!42044))

(assert (=> b!131945 d!42029))

(declare-fun d!42046 () Bool)

(declare-fun e!87652 () Bool)

(assert (=> d!42046 e!87652))

(declare-fun res!109751 () Bool)

(assert (=> d!42046 (=> (not res!109751) (not e!87652))))

(declare-fun lt!204044 () (_ BitVec 64))

(declare-fun lt!204045 () (_ BitVec 64))

(declare-fun lt!204043 () (_ BitVec 64))

(assert (=> d!42046 (= res!109751 (= lt!204043 (bvsub lt!204044 lt!204045)))))

(assert (=> d!42046 (or (= (bvand lt!204044 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!204045 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!204044 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!204044 lt!204045) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42046 (= lt!204045 (remainingBits!0 ((_ sign_extend 32) (size!2758 (buf!3125 thiss!1634))) ((_ sign_extend 32) (currentByte!5904 thiss!1634)) ((_ sign_extend 32) (currentBit!5899 thiss!1634))))))

(declare-fun lt!204048 () (_ BitVec 64))

(declare-fun lt!204046 () (_ BitVec 64))

(assert (=> d!42046 (= lt!204044 (bvmul lt!204048 lt!204046))))

(assert (=> d!42046 (or (= lt!204048 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!204046 (bvsdiv (bvmul lt!204048 lt!204046) lt!204048)))))

(assert (=> d!42046 (= lt!204046 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42046 (= lt!204048 ((_ sign_extend 32) (size!2758 (buf!3125 thiss!1634))))))

(assert (=> d!42046 (= lt!204043 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5904 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5899 thiss!1634))))))

(assert (=> d!42046 (invariant!0 (currentBit!5899 thiss!1634) (currentByte!5904 thiss!1634) (size!2758 (buf!3125 thiss!1634)))))

(assert (=> d!42046 (= (bitIndex!0 (size!2758 (buf!3125 thiss!1634)) (currentByte!5904 thiss!1634) (currentBit!5899 thiss!1634)) lt!204043)))

(declare-fun b!132214 () Bool)

(declare-fun res!109750 () Bool)

(assert (=> b!132214 (=> (not res!109750) (not e!87652))))

(assert (=> b!132214 (= res!109750 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!204043))))

(declare-fun b!132215 () Bool)

(declare-fun lt!204047 () (_ BitVec 64))

(assert (=> b!132215 (= e!87652 (bvsle lt!204043 (bvmul lt!204047 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!132215 (or (= lt!204047 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!204047 #b0000000000000000000000000000000000000000000000000000000000001000) lt!204047)))))

(assert (=> b!132215 (= lt!204047 ((_ sign_extend 32) (size!2758 (buf!3125 thiss!1634))))))

(assert (= (and d!42046 res!109751) b!132214))

(assert (= (and b!132214 res!109750) b!132215))

(assert (=> d!42046 m!199729))

(assert (=> d!42046 m!199221))

(assert (=> b!131945 d!42046))

(declare-fun d!42052 () Bool)

(assert (=> d!42052 (= (array_inv!2547 arr!237) (bvsge (size!2758 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!25816 d!42052))

(declare-fun d!42054 () Bool)

(assert (=> d!42054 (= (inv!12 thiss!1634) (invariant!0 (currentBit!5899 thiss!1634) (currentByte!5904 thiss!1634) (size!2758 (buf!3125 thiss!1634))))))

(declare-fun bs!10273 () Bool)

(assert (= bs!10273 d!42054))

(assert (=> bs!10273 m!199221))

(assert (=> start!25816 d!42054))

(push 1)

(assert (not d!41972))

(assert (not d!42029))

(assert (not d!41954))

(assert (not b!132082))

(assert (not b!132078))

(assert (not b!132136))

(assert (not d!42054))

(assert (not b!132067))

(assert (not d!41989))

(assert (not d!42040))

(assert (not d!41948))

(assert (not b!132081))

(assert (not b!132077))

(assert (not b!132209))

(assert (not b!132130))

(assert (not d!41934))

(assert (not b!132129))

(assert (not b!132080))

(assert (not d!41966))

(assert (not b!132196))

(assert (not d!41952))

(assert (not b!132139))

(assert (not b!132127))

(assert (not d!42046))

(assert (not b!132160))

(assert (not d!41938))

(assert (not d!41962))

(assert (not d!41940))

(assert (not d!41997))

(assert (not b!132158))

(assert (not d!42034))

(assert (not b!132071))

(assert (not b!132141))

(assert (not b!132137))

(assert (not d!41984))

(assert (not b!132197))

(assert (not d!41999))

(assert (not d!41958))

(assert (not b!132069))

(assert (not d!42019))

(assert (not d!41995))

(assert (not d!42031))

(assert (not b!132070))

(assert (not b!132198))

(assert (not b!132212))

(assert (not b!132128))

(assert (not d!42036))

(assert (not b!132126))

(assert (not d!41950))

(assert (not b!132210))

(assert (not d!41982))

(assert (not d!42025))

(assert (not b!132140))

(assert (not d!41993))

(assert (not d!42038))

(assert (not d!41986))

(assert (not b!132207))

(check-sat)

(pop 1)

(push 1)

(check-sat)

