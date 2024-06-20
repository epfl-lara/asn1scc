; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1190 () Bool)

(assert start!1190)

(declare-fun b!5077 () Bool)

(declare-fun res!6295 () Bool)

(declare-fun e!3275 () Bool)

(assert (=> b!5077 (=> res!6295 e!3275)))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((List!63 0))(
  ( (Nil!60) (Cons!59 (h!178 Bool) (t!813 List!63)) )
))
(declare-fun lt!6458 () List!63)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-datatypes ((array!384 0))(
  ( (array!385 (arr!556 (Array (_ BitVec 32) (_ BitVec 8))) (size!163 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!304 0))(
  ( (BitStream!305 (buf!487 array!384) (currentByte!1472 (_ BitVec 32)) (currentBit!1467 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!400 0))(
  ( (Unit!401) )
))
(declare-datatypes ((tuple2!634 0))(
  ( (tuple2!635 (_1!336 Unit!400) (_2!336 BitStream!304)) )
))
(declare-fun lt!6459 () tuple2!634)

(declare-fun srcBuffer!6 () array!384)

(declare-fun byteArrayBitContentToList!0 (BitStream!304 array!384 (_ BitVec 64) (_ BitVec 64)) List!63)

(assert (=> b!5077 (= res!6295 (not (= lt!6458 (byteArrayBitContentToList!0 (_2!336 lt!6459) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!5078 () Bool)

(declare-fun res!6292 () Bool)

(declare-fun e!3274 () Bool)

(assert (=> b!5078 (=> (not res!6292) (not e!3274))))

(declare-fun thiss!1486 () BitStream!304)

(declare-fun isPrefixOf!0 (BitStream!304 BitStream!304) Bool)

(assert (=> b!5078 (= res!6292 (isPrefixOf!0 thiss!1486 (_2!336 lt!6459)))))

(declare-fun b!5079 () Bool)

(assert (=> b!5079 (= e!3274 (not e!3275))))

(declare-fun res!6298 () Bool)

(assert (=> b!5079 (=> res!6298 e!3275)))

(declare-datatypes ((tuple2!636 0))(
  ( (tuple2!637 (_1!337 array!384) (_2!337 BitStream!304)) )
))
(declare-fun lt!6457 () tuple2!636)

(assert (=> b!5079 (= res!6298 (not (= (byteArrayBitContentToList!0 (_2!336 lt!6459) (_1!337 lt!6457) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!6458)))))

(declare-datatypes ((tuple2!638 0))(
  ( (tuple2!639 (_1!338 BitStream!304) (_2!338 BitStream!304)) )
))
(declare-fun lt!6461 () tuple2!638)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!304 BitStream!304 (_ BitVec 64)) List!63)

(assert (=> b!5079 (= lt!6458 (bitStreamReadBitsIntoList!0 (_2!336 lt!6459) (_1!338 lt!6461) nBits!460))))

(declare-fun readBits!0 (BitStream!304 (_ BitVec 64)) tuple2!636)

(assert (=> b!5079 (= lt!6457 (readBits!0 (_1!338 lt!6461) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!5079 (validate_offset_bits!1 ((_ sign_extend 32) (size!163 (buf!487 (_2!336 lt!6459)))) ((_ sign_extend 32) (currentByte!1472 thiss!1486)) ((_ sign_extend 32) (currentBit!1467 thiss!1486)) nBits!460)))

(declare-fun lt!6460 () Unit!400)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!304 array!384 (_ BitVec 64)) Unit!400)

(assert (=> b!5079 (= lt!6460 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!487 (_2!336 lt!6459)) nBits!460))))

(declare-fun reader!0 (BitStream!304 BitStream!304) tuple2!638)

(assert (=> b!5079 (= lt!6461 (reader!0 thiss!1486 (_2!336 lt!6459)))))

(declare-fun b!5080 () Bool)

(declare-fun e!3273 () Bool)

(assert (=> b!5080 (= e!3273 e!3274)))

(declare-fun res!6294 () Bool)

(assert (=> b!5080 (=> (not res!6294) (not e!3274))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!5080 (= res!6294 (invariant!0 (currentBit!1467 (_2!336 lt!6459)) (currentByte!1472 (_2!336 lt!6459)) (size!163 (buf!487 (_2!336 lt!6459)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!304 array!384 (_ BitVec 64) (_ BitVec 64)) tuple2!634)

(assert (=> b!5080 (= lt!6459 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!5081 () Bool)

(declare-fun res!6297 () Bool)

(assert (=> b!5081 (=> (not res!6297) (not e!3274))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!5081 (= res!6297 (= (bitIndex!0 (size!163 (buf!487 (_2!336 lt!6459))) (currentByte!1472 (_2!336 lt!6459)) (currentBit!1467 (_2!336 lt!6459))) (bvadd (bitIndex!0 (size!163 (buf!487 thiss!1486)) (currentByte!1472 thiss!1486) (currentBit!1467 thiss!1486)) nBits!460)))))

(declare-fun res!6291 () Bool)

(assert (=> start!1190 (=> (not res!6291) (not e!3273))))

(assert (=> start!1190 (= res!6291 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!163 srcBuffer!6))))))))

(assert (=> start!1190 e!3273))

(assert (=> start!1190 true))

(declare-fun array_inv!158 (array!384) Bool)

(assert (=> start!1190 (array_inv!158 srcBuffer!6)))

(declare-fun e!3271 () Bool)

(declare-fun inv!12 (BitStream!304) Bool)

(assert (=> start!1190 (and (inv!12 thiss!1486) e!3271)))

(declare-fun b!5082 () Bool)

(assert (=> b!5082 (= e!3275 true)))

(declare-fun lt!6456 () Unit!400)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!304 array!384 array!384 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!400)

(assert (=> b!5082 (= lt!6456 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!336 lt!6459) srcBuffer!6 (_1!337 lt!6457) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!5083 () Bool)

(declare-fun res!6296 () Bool)

(assert (=> b!5083 (=> (not res!6296) (not e!3273))))

(assert (=> b!5083 (= res!6296 (validate_offset_bits!1 ((_ sign_extend 32) (size!163 (buf!487 thiss!1486))) ((_ sign_extend 32) (currentByte!1472 thiss!1486)) ((_ sign_extend 32) (currentBit!1467 thiss!1486)) nBits!460))))

(declare-fun b!5084 () Bool)

(assert (=> b!5084 (= e!3271 (array_inv!158 (buf!487 thiss!1486)))))

(declare-fun b!5085 () Bool)

(declare-fun res!6293 () Bool)

(assert (=> b!5085 (=> (not res!6293) (not e!3274))))

(assert (=> b!5085 (= res!6293 (= (size!163 (buf!487 thiss!1486)) (size!163 (buf!487 (_2!336 lt!6459)))))))

(assert (= (and start!1190 res!6291) b!5083))

(assert (= (and b!5083 res!6296) b!5080))

(assert (= (and b!5080 res!6294) b!5085))

(assert (= (and b!5085 res!6293) b!5081))

(assert (= (and b!5081 res!6297) b!5078))

(assert (= (and b!5078 res!6292) b!5079))

(assert (= (and b!5079 (not res!6298)) b!5077))

(assert (= (and b!5077 (not res!6295)) b!5082))

(assert (= start!1190 b!5084))

(declare-fun m!6183 () Bool)

(assert (=> b!5079 m!6183))

(declare-fun m!6185 () Bool)

(assert (=> b!5079 m!6185))

(declare-fun m!6187 () Bool)

(assert (=> b!5079 m!6187))

(declare-fun m!6189 () Bool)

(assert (=> b!5079 m!6189))

(declare-fun m!6191 () Bool)

(assert (=> b!5079 m!6191))

(declare-fun m!6193 () Bool)

(assert (=> b!5079 m!6193))

(declare-fun m!6195 () Bool)

(assert (=> b!5081 m!6195))

(declare-fun m!6197 () Bool)

(assert (=> b!5081 m!6197))

(declare-fun m!6199 () Bool)

(assert (=> b!5083 m!6199))

(declare-fun m!6201 () Bool)

(assert (=> b!5077 m!6201))

(declare-fun m!6203 () Bool)

(assert (=> b!5080 m!6203))

(declare-fun m!6205 () Bool)

(assert (=> b!5080 m!6205))

(declare-fun m!6207 () Bool)

(assert (=> start!1190 m!6207))

(declare-fun m!6209 () Bool)

(assert (=> start!1190 m!6209))

(declare-fun m!6211 () Bool)

(assert (=> b!5084 m!6211))

(declare-fun m!6213 () Bool)

(assert (=> b!5078 m!6213))

(declare-fun m!6215 () Bool)

(assert (=> b!5082 m!6215))

(push 1)

(assert (not b!5081))

(assert (not start!1190))

(assert (not b!5080))

(assert (not b!5084))

(assert (not b!5082))

(assert (not b!5077))

(assert (not b!5078))

(assert (not b!5079))

(assert (not b!5083))

(check-sat)

(pop 1)

