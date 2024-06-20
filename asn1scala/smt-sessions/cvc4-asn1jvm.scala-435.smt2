; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11806 () Bool)

(assert start!11806)

(declare-fun b!58530 () Bool)

(declare-fun e!38831 () Bool)

(declare-fun e!38835 () Bool)

(assert (=> b!58530 (= e!38831 e!38835)))

(declare-fun res!48630 () Bool)

(assert (=> b!58530 (=> res!48630 e!38835)))

(declare-datatypes ((array!2663 0))(
  ( (array!2664 (arr!1771 (Array (_ BitVec 32) (_ BitVec 8))) (size!1207 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2102 0))(
  ( (BitStream!2103 (buf!1588 array!2663) (currentByte!3206 (_ BitVec 32)) (currentBit!3201 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4037 0))(
  ( (Unit!4038) )
))
(declare-datatypes ((tuple2!5326 0))(
  ( (tuple2!5327 (_1!2774 Unit!4037) (_2!2774 BitStream!2102)) )
))
(declare-fun lt!92405 () tuple2!5326)

(declare-fun lt!92404 () tuple2!5326)

(declare-fun isPrefixOf!0 (BitStream!2102 BitStream!2102) Bool)

(assert (=> b!58530 (= res!48630 (not (isPrefixOf!0 (_2!2774 lt!92405) (_2!2774 lt!92404))))))

(declare-fun thiss!1379 () BitStream!2102)

(assert (=> b!58530 (isPrefixOf!0 thiss!1379 (_2!2774 lt!92404))))

(declare-fun lt!92408 () Unit!4037)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2102 BitStream!2102 BitStream!2102) Unit!4037)

(assert (=> b!58530 (= lt!92408 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2774 lt!92405) (_2!2774 lt!92404)))))

(declare-fun srcBuffer!2 () array!2663)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2102 array!2663 (_ BitVec 64) (_ BitVec 64)) tuple2!5326)

(assert (=> b!58530 (= lt!92404 (appendBitsMSBFirstLoop!0 (_2!2774 lt!92405) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!38834 () Bool)

(assert (=> b!58530 e!38834))

(declare-fun res!48628 () Bool)

(assert (=> b!58530 (=> (not res!48628) (not e!38834))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!58530 (= res!48628 (validate_offset_bits!1 ((_ sign_extend 32) (size!1207 (buf!1588 (_2!2774 lt!92405)))) ((_ sign_extend 32) (currentByte!3206 thiss!1379)) ((_ sign_extend 32) (currentBit!3201 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92407 () Unit!4037)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2102 array!2663 (_ BitVec 64)) Unit!4037)

(assert (=> b!58530 (= lt!92407 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1588 (_2!2774 lt!92405)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!5328 0))(
  ( (tuple2!5329 (_1!2775 BitStream!2102) (_2!2775 BitStream!2102)) )
))
(declare-fun lt!92403 () tuple2!5328)

(declare-fun reader!0 (BitStream!2102 BitStream!2102) tuple2!5328)

(assert (=> b!58530 (= lt!92403 (reader!0 thiss!1379 (_2!2774 lt!92405)))))

(declare-fun b!58531 () Bool)

(declare-fun res!48621 () Bool)

(declare-fun e!38837 () Bool)

(assert (=> b!58531 (=> (not res!48621) (not e!38837))))

(assert (=> b!58531 (= res!48621 (validate_offset_bits!1 ((_ sign_extend 32) (size!1207 (buf!1588 thiss!1379))) ((_ sign_extend 32) (currentByte!3206 thiss!1379)) ((_ sign_extend 32) (currentBit!3201 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!58532 () Bool)

(declare-fun e!38838 () Bool)

(assert (=> b!58532 (= e!38838 e!38831)))

(declare-fun res!48625 () Bool)

(assert (=> b!58532 (=> res!48625 e!38831)))

(assert (=> b!58532 (= res!48625 (not (isPrefixOf!0 thiss!1379 (_2!2774 lt!92405))))))

(assert (=> b!58532 (validate_offset_bits!1 ((_ sign_extend 32) (size!1207 (buf!1588 (_2!2774 lt!92405)))) ((_ sign_extend 32) (currentByte!3206 (_2!2774 lt!92405))) ((_ sign_extend 32) (currentBit!3201 (_2!2774 lt!92405))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92402 () Unit!4037)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2102 BitStream!2102 (_ BitVec 64) (_ BitVec 64)) Unit!4037)

(assert (=> b!58532 (= lt!92402 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2774 lt!92405) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2102 (_ BitVec 8) (_ BitVec 32)) tuple2!5326)

(assert (=> b!58532 (= lt!92405 (appendBitFromByte!0 thiss!1379 (select (arr!1771 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!58533 () Bool)

(declare-fun e!38830 () Bool)

(declare-fun lt!92410 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!58533 (= e!38830 (= lt!92410 (bvsub (bvsub (bvadd (bitIndex!0 (size!1207 (buf!1588 (_2!2774 lt!92405))) (currentByte!3206 (_2!2774 lt!92405)) (currentBit!3201 (_2!2774 lt!92405))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!58534 () Bool)

(declare-fun res!48633 () Bool)

(declare-fun e!38840 () Bool)

(assert (=> b!58534 (=> res!48633 e!38840)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!58534 (= res!48633 (not (invariant!0 (currentBit!3201 (_2!2774 lt!92405)) (currentByte!3206 (_2!2774 lt!92405)) (size!1207 (buf!1588 (_2!2774 lt!92405))))))))

(declare-fun b!58535 () Bool)

(declare-fun res!48626 () Bool)

(declare-fun e!38836 () Bool)

(assert (=> b!58535 (=> res!48626 e!38836)))

(assert (=> b!58535 (= res!48626 (not (= (size!1207 (buf!1588 thiss!1379)) (size!1207 (buf!1588 (_2!2774 lt!92404))))))))

(declare-fun b!58536 () Bool)

(assert (=> b!58536 (= e!38837 (not e!38838))))

(declare-fun res!48632 () Bool)

(assert (=> b!58536 (=> res!48632 e!38838)))

(assert (=> b!58536 (= res!48632 (bvsge i!635 to!314))))

(assert (=> b!58536 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!92406 () Unit!4037)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2102) Unit!4037)

(assert (=> b!58536 (= lt!92406 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!92401 () (_ BitVec 64))

(assert (=> b!58536 (= lt!92401 (bitIndex!0 (size!1207 (buf!1588 thiss!1379)) (currentByte!3206 thiss!1379) (currentBit!3201 thiss!1379)))))

(declare-fun b!58537 () Bool)

(declare-datatypes ((List!626 0))(
  ( (Nil!623) (Cons!622 (h!741 Bool) (t!1376 List!626)) )
))
(declare-fun head!445 (List!626) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2102 array!2663 (_ BitVec 64) (_ BitVec 64)) List!626)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2102 BitStream!2102 (_ BitVec 64)) List!626)

(assert (=> b!58537 (= e!38834 (= (head!445 (byteArrayBitContentToList!0 (_2!2774 lt!92405) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!445 (bitStreamReadBitsIntoList!0 (_2!2774 lt!92405) (_1!2775 lt!92403) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!58538 () Bool)

(declare-fun res!48627 () Bool)

(assert (=> b!58538 (=> res!48627 e!38836)))

(assert (=> b!58538 (= res!48627 (not (invariant!0 (currentBit!3201 (_2!2774 lt!92404)) (currentByte!3206 (_2!2774 lt!92404)) (size!1207 (buf!1588 (_2!2774 lt!92404))))))))

(declare-fun b!58539 () Bool)

(declare-fun e!38832 () Bool)

(declare-fun array_inv!1110 (array!2663) Bool)

(assert (=> b!58539 (= e!38832 (array_inv!1110 (buf!1588 thiss!1379)))))

(declare-fun b!58540 () Bool)

(declare-fun res!48629 () Bool)

(assert (=> b!58540 (=> res!48629 e!38840)))

(assert (=> b!58540 (= res!48629 (not (invariant!0 (currentBit!3201 (_2!2774 lt!92405)) (currentByte!3206 (_2!2774 lt!92405)) (size!1207 (buf!1588 (_2!2774 lt!92404))))))))

(declare-fun b!58541 () Bool)

(assert (=> b!58541 (= e!38836 e!38840)))

(declare-fun res!48623 () Bool)

(assert (=> b!58541 (=> res!48623 e!38840)))

(assert (=> b!58541 (= res!48623 (not (= (size!1207 (buf!1588 (_2!2774 lt!92405))) (size!1207 (buf!1588 (_2!2774 lt!92404))))))))

(assert (=> b!58541 e!38830))

(declare-fun res!48622 () Bool)

(assert (=> b!58541 (=> (not res!48622) (not e!38830))))

(assert (=> b!58541 (= res!48622 (= (size!1207 (buf!1588 (_2!2774 lt!92404))) (size!1207 (buf!1588 thiss!1379))))))

(declare-fun res!48631 () Bool)

(assert (=> start!11806 (=> (not res!48631) (not e!38837))))

(assert (=> start!11806 (= res!48631 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1207 srcBuffer!2))))))))

(assert (=> start!11806 e!38837))

(assert (=> start!11806 true))

(assert (=> start!11806 (array_inv!1110 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2102) Bool)

(assert (=> start!11806 (and (inv!12 thiss!1379) e!38832)))

(declare-fun b!58542 () Bool)

(assert (=> b!58542 (= e!38840 true)))

(declare-fun lt!92409 () tuple2!5328)

(assert (=> b!58542 (= lt!92409 (reader!0 thiss!1379 (_2!2774 lt!92404)))))

(declare-fun b!58543 () Bool)

(assert (=> b!58543 (= e!38835 e!38836)))

(declare-fun res!48624 () Bool)

(assert (=> b!58543 (=> res!48624 e!38836)))

(assert (=> b!58543 (= res!48624 (not (= lt!92410 (bvsub (bvadd lt!92401 to!314) i!635))))))

(assert (=> b!58543 (= lt!92410 (bitIndex!0 (size!1207 (buf!1588 (_2!2774 lt!92404))) (currentByte!3206 (_2!2774 lt!92404)) (currentBit!3201 (_2!2774 lt!92404))))))

(assert (= (and start!11806 res!48631) b!58531))

(assert (= (and b!58531 res!48621) b!58536))

(assert (= (and b!58536 (not res!48632)) b!58532))

(assert (= (and b!58532 (not res!48625)) b!58530))

(assert (= (and b!58530 res!48628) b!58537))

(assert (= (and b!58530 (not res!48630)) b!58543))

(assert (= (and b!58543 (not res!48624)) b!58538))

(assert (= (and b!58538 (not res!48627)) b!58535))

(assert (= (and b!58535 (not res!48626)) b!58541))

(assert (= (and b!58541 res!48622) b!58533))

(assert (= (and b!58541 (not res!48623)) b!58534))

(assert (= (and b!58534 (not res!48633)) b!58540))

(assert (= (and b!58540 (not res!48629)) b!58542))

(assert (= start!11806 b!58539))

(declare-fun m!92199 () Bool)

(assert (=> b!58531 m!92199))

(declare-fun m!92201 () Bool)

(assert (=> b!58533 m!92201))

(declare-fun m!92203 () Bool)

(assert (=> b!58539 m!92203))

(declare-fun m!92205 () Bool)

(assert (=> b!58530 m!92205))

(declare-fun m!92207 () Bool)

(assert (=> b!58530 m!92207))

(declare-fun m!92209 () Bool)

(assert (=> b!58530 m!92209))

(declare-fun m!92211 () Bool)

(assert (=> b!58530 m!92211))

(declare-fun m!92213 () Bool)

(assert (=> b!58530 m!92213))

(declare-fun m!92215 () Bool)

(assert (=> b!58530 m!92215))

(declare-fun m!92217 () Bool)

(assert (=> b!58530 m!92217))

(declare-fun m!92219 () Bool)

(assert (=> b!58532 m!92219))

(assert (=> b!58532 m!92219))

(declare-fun m!92221 () Bool)

(assert (=> b!58532 m!92221))

(declare-fun m!92223 () Bool)

(assert (=> b!58532 m!92223))

(declare-fun m!92225 () Bool)

(assert (=> b!58532 m!92225))

(declare-fun m!92227 () Bool)

(assert (=> b!58532 m!92227))

(declare-fun m!92229 () Bool)

(assert (=> start!11806 m!92229))

(declare-fun m!92231 () Bool)

(assert (=> start!11806 m!92231))

(declare-fun m!92233 () Bool)

(assert (=> b!58540 m!92233))

(declare-fun m!92235 () Bool)

(assert (=> b!58543 m!92235))

(declare-fun m!92237 () Bool)

(assert (=> b!58534 m!92237))

(declare-fun m!92239 () Bool)

(assert (=> b!58538 m!92239))

(declare-fun m!92241 () Bool)

(assert (=> b!58536 m!92241))

(declare-fun m!92243 () Bool)

(assert (=> b!58536 m!92243))

(declare-fun m!92245 () Bool)

(assert (=> b!58536 m!92245))

(declare-fun m!92247 () Bool)

(assert (=> b!58542 m!92247))

(declare-fun m!92249 () Bool)

(assert (=> b!58537 m!92249))

(assert (=> b!58537 m!92249))

(declare-fun m!92251 () Bool)

(assert (=> b!58537 m!92251))

(declare-fun m!92253 () Bool)

(assert (=> b!58537 m!92253))

(assert (=> b!58537 m!92253))

(declare-fun m!92255 () Bool)

(assert (=> b!58537 m!92255))

(push 1)

