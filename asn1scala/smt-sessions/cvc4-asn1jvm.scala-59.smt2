; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1188 () Bool)

(assert start!1188)

(declare-fun b!5051 () Bool)

(declare-fun res!6268 () Bool)

(declare-fun e!3253 () Bool)

(assert (=> b!5051 (=> (not res!6268) (not e!3253))))

(declare-datatypes ((array!382 0))(
  ( (array!383 (arr!555 (Array (_ BitVec 32) (_ BitVec 8))) (size!162 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!302 0))(
  ( (BitStream!303 (buf!486 array!382) (currentByte!1471 (_ BitVec 32)) (currentBit!1466 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!302)

(declare-datatypes ((Unit!398 0))(
  ( (Unit!399) )
))
(declare-datatypes ((tuple2!628 0))(
  ( (tuple2!629 (_1!333 Unit!398) (_2!333 BitStream!302)) )
))
(declare-fun lt!6438 () tuple2!628)

(assert (=> b!5051 (= res!6268 (= (size!162 (buf!486 thiss!1486)) (size!162 (buf!486 (_2!333 lt!6438)))))))

(declare-fun b!5052 () Bool)

(declare-fun e!3257 () Bool)

(declare-fun array_inv!157 (array!382) Bool)

(assert (=> b!5052 (= e!3257 (array_inv!157 (buf!486 thiss!1486)))))

(declare-fun b!5053 () Bool)

(declare-fun e!3254 () Bool)

(assert (=> b!5053 (= e!3253 (not e!3254))))

(declare-fun res!6270 () Bool)

(assert (=> b!5053 (=> res!6270 e!3254)))

(declare-datatypes ((List!62 0))(
  ( (Nil!59) (Cons!58 (h!177 Bool) (t!812 List!62)) )
))
(declare-fun lt!6443 () List!62)

(declare-fun lt!6440 () List!62)

(assert (=> b!5053 (= res!6270 (not (= lt!6443 lt!6440)))))

(declare-datatypes ((tuple2!630 0))(
  ( (tuple2!631 (_1!334 BitStream!302) (_2!334 BitStream!302)) )
))
(declare-fun lt!6442 () tuple2!630)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!302 BitStream!302 (_ BitVec 64)) List!62)

(assert (=> b!5053 (= lt!6440 (bitStreamReadBitsIntoList!0 (_2!333 lt!6438) (_1!334 lt!6442) nBits!460))))

(declare-datatypes ((tuple2!632 0))(
  ( (tuple2!633 (_1!335 array!382) (_2!335 BitStream!302)) )
))
(declare-fun lt!6439 () tuple2!632)

(declare-fun byteArrayBitContentToList!0 (BitStream!302 array!382 (_ BitVec 64) (_ BitVec 64)) List!62)

(assert (=> b!5053 (= lt!6443 (byteArrayBitContentToList!0 (_2!333 lt!6438) (_1!335 lt!6439) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun readBits!0 (BitStream!302 (_ BitVec 64)) tuple2!632)

(assert (=> b!5053 (= lt!6439 (readBits!0 (_1!334 lt!6442) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!5053 (validate_offset_bits!1 ((_ sign_extend 32) (size!162 (buf!486 (_2!333 lt!6438)))) ((_ sign_extend 32) (currentByte!1471 thiss!1486)) ((_ sign_extend 32) (currentBit!1466 thiss!1486)) nBits!460)))

(declare-fun lt!6441 () Unit!398)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!302 array!382 (_ BitVec 64)) Unit!398)

(assert (=> b!5053 (= lt!6441 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!486 (_2!333 lt!6438)) nBits!460))))

(declare-fun reader!0 (BitStream!302 BitStream!302) tuple2!630)

(assert (=> b!5053 (= lt!6442 (reader!0 thiss!1486 (_2!333 lt!6438)))))

(declare-fun b!5054 () Bool)

(declare-fun lt!6437 () List!62)

(assert (=> b!5054 (= e!3254 (or (not (= lt!6440 lt!6437)) (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsgt nBits!460 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!162 (_1!335 lt!6439))))) (= lt!6443 lt!6437)))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!382)

(assert (=> b!5054 (= lt!6437 (byteArrayBitContentToList!0 (_2!333 lt!6438) srcBuffer!6 from!367 nBits!460))))

(declare-fun b!5056 () Bool)

(declare-fun e!3256 () Bool)

(assert (=> b!5056 (= e!3256 e!3253)))

(declare-fun res!6273 () Bool)

(assert (=> b!5056 (=> (not res!6273) (not e!3253))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!5056 (= res!6273 (invariant!0 (currentBit!1466 (_2!333 lt!6438)) (currentByte!1471 (_2!333 lt!6438)) (size!162 (buf!486 (_2!333 lt!6438)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!302 array!382 (_ BitVec 64) (_ BitVec 64)) tuple2!628)

(assert (=> b!5056 (= lt!6438 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!5057 () Bool)

(declare-fun res!6274 () Bool)

(assert (=> b!5057 (=> (not res!6274) (not e!3256))))

(assert (=> b!5057 (= res!6274 (validate_offset_bits!1 ((_ sign_extend 32) (size!162 (buf!486 thiss!1486))) ((_ sign_extend 32) (currentByte!1471 thiss!1486)) ((_ sign_extend 32) (currentBit!1466 thiss!1486)) nBits!460))))

(declare-fun b!5058 () Bool)

(declare-fun res!6272 () Bool)

(assert (=> b!5058 (=> (not res!6272) (not e!3253))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!5058 (= res!6272 (= (bitIndex!0 (size!162 (buf!486 (_2!333 lt!6438))) (currentByte!1471 (_2!333 lt!6438)) (currentBit!1466 (_2!333 lt!6438))) (bvadd (bitIndex!0 (size!162 (buf!486 thiss!1486)) (currentByte!1471 thiss!1486) (currentBit!1466 thiss!1486)) nBits!460)))))

(declare-fun res!6269 () Bool)

(assert (=> start!1188 (=> (not res!6269) (not e!3256))))

(assert (=> start!1188 (= res!6269 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!162 srcBuffer!6))))))))

(assert (=> start!1188 e!3256))

(assert (=> start!1188 true))

(assert (=> start!1188 (array_inv!157 srcBuffer!6)))

(declare-fun inv!12 (BitStream!302) Bool)

(assert (=> start!1188 (and (inv!12 thiss!1486) e!3257)))

(declare-fun b!5055 () Bool)

(declare-fun res!6271 () Bool)

(assert (=> b!5055 (=> (not res!6271) (not e!3253))))

(declare-fun isPrefixOf!0 (BitStream!302 BitStream!302) Bool)

(assert (=> b!5055 (= res!6271 (isPrefixOf!0 thiss!1486 (_2!333 lt!6438)))))

(assert (= (and start!1188 res!6269) b!5057))

(assert (= (and b!5057 res!6274) b!5056))

(assert (= (and b!5056 res!6273) b!5051))

(assert (= (and b!5051 res!6268) b!5058))

(assert (= (and b!5058 res!6272) b!5055))

(assert (= (and b!5055 res!6271) b!5053))

(assert (= (and b!5053 (not res!6270)) b!5054))

(assert (= start!1188 b!5052))

(declare-fun m!6151 () Bool)

(assert (=> start!1188 m!6151))

(declare-fun m!6153 () Bool)

(assert (=> start!1188 m!6153))

(declare-fun m!6155 () Bool)

(assert (=> b!5055 m!6155))

(declare-fun m!6157 () Bool)

(assert (=> b!5058 m!6157))

(declare-fun m!6159 () Bool)

(assert (=> b!5058 m!6159))

(declare-fun m!6161 () Bool)

(assert (=> b!5052 m!6161))

(declare-fun m!6163 () Bool)

(assert (=> b!5053 m!6163))

(declare-fun m!6165 () Bool)

(assert (=> b!5053 m!6165))

(declare-fun m!6167 () Bool)

(assert (=> b!5053 m!6167))

(declare-fun m!6169 () Bool)

(assert (=> b!5053 m!6169))

(declare-fun m!6171 () Bool)

(assert (=> b!5053 m!6171))

(declare-fun m!6173 () Bool)

(assert (=> b!5053 m!6173))

(declare-fun m!6175 () Bool)

(assert (=> b!5057 m!6175))

(declare-fun m!6177 () Bool)

(assert (=> b!5054 m!6177))

(declare-fun m!6179 () Bool)

(assert (=> b!5056 m!6179))

(declare-fun m!6181 () Bool)

(assert (=> b!5056 m!6181))

(push 1)

(assert (not start!1188))

(assert (not b!5052))

(assert (not b!5058))

(assert (not b!5056))

(assert (not b!5053))

(assert (not b!5057))

(assert (not b!5054))

(assert (not b!5055))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

