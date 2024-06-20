; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5694 () Bool)

(assert start!5694)

(declare-fun b!24210 () Bool)

(declare-fun res!20879 () Bool)

(declare-fun e!16474 () Bool)

(assert (=> b!24210 (=> res!20879 e!16474)))

(declare-datatypes ((array!1617 0))(
  ( (array!1618 (arr!1150 (Array (_ BitVec 32) (_ BitVec 8))) (size!694 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1220 0))(
  ( (BitStream!1221 (buf!1015 array!1617) (currentByte!2328 (_ BitVec 32)) (currentBit!2323 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2031 0))(
  ( (Unit!2032) )
))
(declare-datatypes ((tuple2!2758 0))(
  ( (tuple2!2759 (_1!1466 Unit!2031) (_2!1466 BitStream!1220)) )
))
(declare-fun lt!34697 () tuple2!2758)

(declare-fun lt!34694 () tuple2!2758)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!24210 (= res!20879 (not (invariant!0 (currentBit!2323 (_2!1466 lt!34697)) (currentByte!2328 (_2!1466 lt!34697)) (size!694 (buf!1015 (_2!1466 lt!34694))))))))

(declare-fun b!24211 () Bool)

(assert (=> b!24211 (= e!16474 true)))

(declare-fun lt!34689 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!24211 (validate_offset_bits!1 ((_ sign_extend 32) (size!694 (buf!1015 (_2!1466 lt!34694)))) ((_ sign_extend 32) (currentByte!2328 (_2!1466 lt!34697))) ((_ sign_extend 32) (currentBit!2323 (_2!1466 lt!34697))) lt!34689)))

(declare-fun lt!34687 () Unit!2031)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1220 array!1617 (_ BitVec 64)) Unit!2031)

(assert (=> b!24211 (= lt!34687 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1466 lt!34697) (buf!1015 (_2!1466 lt!34694)) lt!34689))))

(declare-datatypes ((tuple2!2760 0))(
  ( (tuple2!2761 (_1!1467 BitStream!1220) (_2!1467 BitStream!1220)) )
))
(declare-fun lt!34692 () tuple2!2760)

(declare-fun reader!0 (BitStream!1220 BitStream!1220) tuple2!2760)

(assert (=> b!24211 (= lt!34692 (reader!0 (_2!1466 lt!34697) (_2!1466 lt!34694)))))

(declare-fun thiss!1379 () BitStream!1220)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!24211 (validate_offset_bits!1 ((_ sign_extend 32) (size!694 (buf!1015 (_2!1466 lt!34694)))) ((_ sign_extend 32) (currentByte!2328 thiss!1379)) ((_ sign_extend 32) (currentBit!2323 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!34691 () Unit!2031)

(assert (=> b!24211 (= lt!34691 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1015 (_2!1466 lt!34694)) (bvsub to!314 i!635)))))

(declare-fun lt!34688 () tuple2!2760)

(assert (=> b!24211 (= lt!34688 (reader!0 thiss!1379 (_2!1466 lt!34694)))))

(declare-fun b!24212 () Bool)

(declare-fun res!20889 () Bool)

(assert (=> b!24212 (=> res!20889 e!16474)))

(assert (=> b!24212 (= res!20889 (not (invariant!0 (currentBit!2323 (_2!1466 lt!34697)) (currentByte!2328 (_2!1466 lt!34697)) (size!694 (buf!1015 (_2!1466 lt!34697))))))))

(declare-fun b!24213 () Bool)

(declare-fun res!20888 () Bool)

(declare-fun e!16473 () Bool)

(assert (=> b!24213 (=> res!20888 e!16473)))

(assert (=> b!24213 (= res!20888 (not (invariant!0 (currentBit!2323 (_2!1466 lt!34694)) (currentByte!2328 (_2!1466 lt!34694)) (size!694 (buf!1015 (_2!1466 lt!34694))))))))

(declare-fun b!24214 () Bool)

(declare-fun e!16476 () Bool)

(declare-fun e!16481 () Bool)

(assert (=> b!24214 (= e!16476 e!16481)))

(declare-fun res!20884 () Bool)

(assert (=> b!24214 (=> res!20884 e!16481)))

(declare-fun isPrefixOf!0 (BitStream!1220 BitStream!1220) Bool)

(assert (=> b!24214 (= res!20884 (not (isPrefixOf!0 thiss!1379 (_2!1466 lt!34697))))))

(assert (=> b!24214 (validate_offset_bits!1 ((_ sign_extend 32) (size!694 (buf!1015 (_2!1466 lt!34697)))) ((_ sign_extend 32) (currentByte!2328 (_2!1466 lt!34697))) ((_ sign_extend 32) (currentBit!2323 (_2!1466 lt!34697))) lt!34689)))

(assert (=> b!24214 (= lt!34689 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34699 () Unit!2031)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1220 BitStream!1220 (_ BitVec 64) (_ BitVec 64)) Unit!2031)

(assert (=> b!24214 (= lt!34699 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1466 lt!34697) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1617)

(declare-fun appendBitFromByte!0 (BitStream!1220 (_ BitVec 8) (_ BitVec 32)) tuple2!2758)

(assert (=> b!24214 (= lt!34697 (appendBitFromByte!0 thiss!1379 (select (arr!1150 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!24215 () Bool)

(declare-fun e!16478 () Bool)

(assert (=> b!24215 (= e!16481 e!16478)))

(declare-fun res!20880 () Bool)

(assert (=> b!24215 (=> res!20880 e!16478)))

(assert (=> b!24215 (= res!20880 (not (isPrefixOf!0 (_2!1466 lt!34697) (_2!1466 lt!34694))))))

(assert (=> b!24215 (isPrefixOf!0 thiss!1379 (_2!1466 lt!34694))))

(declare-fun lt!34696 () Unit!2031)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1220 BitStream!1220 BitStream!1220) Unit!2031)

(assert (=> b!24215 (= lt!34696 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1466 lt!34697) (_2!1466 lt!34694)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1220 array!1617 (_ BitVec 64) (_ BitVec 64)) tuple2!2758)

(assert (=> b!24215 (= lt!34694 (appendBitsMSBFirstLoop!0 (_2!1466 lt!34697) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!16480 () Bool)

(assert (=> b!24215 e!16480))

(declare-fun res!20887 () Bool)

(assert (=> b!24215 (=> (not res!20887) (not e!16480))))

(assert (=> b!24215 (= res!20887 (validate_offset_bits!1 ((_ sign_extend 32) (size!694 (buf!1015 (_2!1466 lt!34697)))) ((_ sign_extend 32) (currentByte!2328 thiss!1379)) ((_ sign_extend 32) (currentBit!2323 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34693 () Unit!2031)

(assert (=> b!24215 (= lt!34693 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1015 (_2!1466 lt!34697)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34698 () tuple2!2760)

(assert (=> b!24215 (= lt!34698 (reader!0 thiss!1379 (_2!1466 lt!34697)))))

(declare-fun res!20883 () Bool)

(declare-fun e!16475 () Bool)

(assert (=> start!5694 (=> (not res!20883) (not e!16475))))

(assert (=> start!5694 (= res!20883 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!694 srcBuffer!2))))))))

(assert (=> start!5694 e!16475))

(assert (=> start!5694 true))

(declare-fun array_inv!663 (array!1617) Bool)

(assert (=> start!5694 (array_inv!663 srcBuffer!2)))

(declare-fun e!16482 () Bool)

(declare-fun inv!12 (BitStream!1220) Bool)

(assert (=> start!5694 (and (inv!12 thiss!1379) e!16482)))

(declare-fun b!24216 () Bool)

(assert (=> b!24216 (= e!16473 e!16474)))

(declare-fun res!20886 () Bool)

(assert (=> b!24216 (=> res!20886 e!16474)))

(assert (=> b!24216 (= res!20886 (not (= (size!694 (buf!1015 (_2!1466 lt!34697))) (size!694 (buf!1015 (_2!1466 lt!34694))))))))

(declare-fun e!16483 () Bool)

(assert (=> b!24216 e!16483))

(declare-fun res!20882 () Bool)

(assert (=> b!24216 (=> (not res!20882) (not e!16483))))

(assert (=> b!24216 (= res!20882 (= (size!694 (buf!1015 (_2!1466 lt!34694))) (size!694 (buf!1015 thiss!1379))))))

(declare-fun b!24217 () Bool)

(declare-datatypes ((List!311 0))(
  ( (Nil!308) (Cons!307 (h!426 Bool) (t!1061 List!311)) )
))
(declare-fun head!148 (List!311) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1220 array!1617 (_ BitVec 64) (_ BitVec 64)) List!311)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1220 BitStream!1220 (_ BitVec 64)) List!311)

(assert (=> b!24217 (= e!16480 (= (head!148 (byteArrayBitContentToList!0 (_2!1466 lt!34697) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!148 (bitStreamReadBitsIntoList!0 (_2!1466 lt!34697) (_1!1467 lt!34698) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!24218 () Bool)

(declare-fun lt!34690 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!24218 (= e!16483 (= lt!34690 (bvsub (bvsub (bvadd (bitIndex!0 (size!694 (buf!1015 (_2!1466 lt!34697))) (currentByte!2328 (_2!1466 lt!34697)) (currentBit!2323 (_2!1466 lt!34697))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!24219 () Bool)

(assert (=> b!24219 (= e!16478 e!16473)))

(declare-fun res!20877 () Bool)

(assert (=> b!24219 (=> res!20877 e!16473)))

(declare-fun lt!34695 () (_ BitVec 64))

(assert (=> b!24219 (= res!20877 (not (= lt!34690 (bvsub (bvadd lt!34695 to!314) i!635))))))

(assert (=> b!24219 (= lt!34690 (bitIndex!0 (size!694 (buf!1015 (_2!1466 lt!34694))) (currentByte!2328 (_2!1466 lt!34694)) (currentBit!2323 (_2!1466 lt!34694))))))

(declare-fun b!24220 () Bool)

(assert (=> b!24220 (= e!16475 (not e!16476))))

(declare-fun res!20885 () Bool)

(assert (=> b!24220 (=> res!20885 e!16476)))

(assert (=> b!24220 (= res!20885 (bvsge i!635 to!314))))

(assert (=> b!24220 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!34686 () Unit!2031)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1220) Unit!2031)

(assert (=> b!24220 (= lt!34686 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!24220 (= lt!34695 (bitIndex!0 (size!694 (buf!1015 thiss!1379)) (currentByte!2328 thiss!1379) (currentBit!2323 thiss!1379)))))

(declare-fun b!24221 () Bool)

(assert (=> b!24221 (= e!16482 (array_inv!663 (buf!1015 thiss!1379)))))

(declare-fun b!24222 () Bool)

(declare-fun res!20881 () Bool)

(assert (=> b!24222 (=> res!20881 e!16473)))

(assert (=> b!24222 (= res!20881 (not (= (size!694 (buf!1015 thiss!1379)) (size!694 (buf!1015 (_2!1466 lt!34694))))))))

(declare-fun b!24223 () Bool)

(declare-fun res!20878 () Bool)

(assert (=> b!24223 (=> (not res!20878) (not e!16475))))

(assert (=> b!24223 (= res!20878 (validate_offset_bits!1 ((_ sign_extend 32) (size!694 (buf!1015 thiss!1379))) ((_ sign_extend 32) (currentByte!2328 thiss!1379)) ((_ sign_extend 32) (currentBit!2323 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!5694 res!20883) b!24223))

(assert (= (and b!24223 res!20878) b!24220))

(assert (= (and b!24220 (not res!20885)) b!24214))

(assert (= (and b!24214 (not res!20884)) b!24215))

(assert (= (and b!24215 res!20887) b!24217))

(assert (= (and b!24215 (not res!20880)) b!24219))

(assert (= (and b!24219 (not res!20877)) b!24213))

(assert (= (and b!24213 (not res!20888)) b!24222))

(assert (= (and b!24222 (not res!20881)) b!24216))

(assert (= (and b!24216 res!20882) b!24218))

(assert (= (and b!24216 (not res!20886)) b!24212))

(assert (= (and b!24212 (not res!20889)) b!24210))

(assert (= (and b!24210 (not res!20879)) b!24211))

(assert (= start!5694 b!24221))

(declare-fun m!34141 () Bool)

(assert (=> b!24223 m!34141))

(declare-fun m!34143 () Bool)

(assert (=> b!24211 m!34143))

(declare-fun m!34145 () Bool)

(assert (=> b!24211 m!34145))

(declare-fun m!34147 () Bool)

(assert (=> b!24211 m!34147))

(declare-fun m!34149 () Bool)

(assert (=> b!24211 m!34149))

(declare-fun m!34151 () Bool)

(assert (=> b!24211 m!34151))

(declare-fun m!34153 () Bool)

(assert (=> b!24211 m!34153))

(declare-fun m!34155 () Bool)

(assert (=> b!24221 m!34155))

(declare-fun m!34157 () Bool)

(assert (=> b!24220 m!34157))

(declare-fun m!34159 () Bool)

(assert (=> b!24220 m!34159))

(declare-fun m!34161 () Bool)

(assert (=> b!24220 m!34161))

(declare-fun m!34163 () Bool)

(assert (=> b!24219 m!34163))

(declare-fun m!34165 () Bool)

(assert (=> b!24210 m!34165))

(declare-fun m!34167 () Bool)

(assert (=> b!24217 m!34167))

(assert (=> b!24217 m!34167))

(declare-fun m!34169 () Bool)

(assert (=> b!24217 m!34169))

(declare-fun m!34171 () Bool)

(assert (=> b!24217 m!34171))

(assert (=> b!24217 m!34171))

(declare-fun m!34173 () Bool)

(assert (=> b!24217 m!34173))

(declare-fun m!34175 () Bool)

(assert (=> start!5694 m!34175))

(declare-fun m!34177 () Bool)

(assert (=> start!5694 m!34177))

(declare-fun m!34179 () Bool)

(assert (=> b!24213 m!34179))

(declare-fun m!34181 () Bool)

(assert (=> b!24215 m!34181))

(declare-fun m!34183 () Bool)

(assert (=> b!24215 m!34183))

(declare-fun m!34185 () Bool)

(assert (=> b!24215 m!34185))

(declare-fun m!34187 () Bool)

(assert (=> b!24215 m!34187))

(declare-fun m!34189 () Bool)

(assert (=> b!24215 m!34189))

(declare-fun m!34191 () Bool)

(assert (=> b!24215 m!34191))

(declare-fun m!34193 () Bool)

(assert (=> b!24215 m!34193))

(declare-fun m!34195 () Bool)

(assert (=> b!24218 m!34195))

(declare-fun m!34197 () Bool)

(assert (=> b!24214 m!34197))

(declare-fun m!34199 () Bool)

(assert (=> b!24214 m!34199))

(declare-fun m!34201 () Bool)

(assert (=> b!24214 m!34201))

(declare-fun m!34203 () Bool)

(assert (=> b!24214 m!34203))

(assert (=> b!24214 m!34197))

(declare-fun m!34205 () Bool)

(assert (=> b!24214 m!34205))

(declare-fun m!34207 () Bool)

(assert (=> b!24212 m!34207))

(push 1)

(assert (not b!24214))

(assert (not b!24215))

(assert (not b!24218))

(assert (not b!24212))

(assert (not b!24210))

(assert (not b!24217))

(assert (not b!24219))

(assert (not b!24220))

(assert (not start!5694))

(assert (not b!24221))

(assert (not b!24211))

(assert (not b!24223))

(assert (not b!24213))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

