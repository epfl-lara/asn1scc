; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1410 () Bool)

(assert start!1410)

(declare-fun b!6433 () Bool)

(declare-fun res!7375 () Bool)

(declare-fun e!4052 () Bool)

(assert (=> b!6433 (=> (not res!7375) (not e!4052))))

(declare-datatypes ((array!448 0))(
  ( (array!449 (arr!591 (Array (_ BitVec 32) (_ BitVec 8))) (size!192 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!362 0))(
  ( (BitStream!363 (buf!522 array!448) (currentByte!1519 (_ BitVec 32)) (currentBit!1514 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!362)

(declare-datatypes ((Unit!506 0))(
  ( (Unit!507) )
))
(declare-datatypes ((tuple2!832 0))(
  ( (tuple2!833 (_1!441 Unit!506) (_2!441 BitStream!362)) )
))
(declare-fun lt!8527 () tuple2!832)

(declare-fun isPrefixOf!0 (BitStream!362 BitStream!362) Bool)

(assert (=> b!6433 (= res!7375 (isPrefixOf!0 thiss!1486 (_2!441 lt!8527)))))

(declare-fun b!6434 () Bool)

(declare-fun e!4048 () Bool)

(assert (=> b!6434 (= e!4048 e!4052)))

(declare-fun res!7369 () Bool)

(assert (=> b!6434 (=> (not res!7369) (not e!4052))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!6434 (= res!7369 (invariant!0 (currentBit!1514 (_2!441 lt!8527)) (currentByte!1519 (_2!441 lt!8527)) (size!192 (buf!522 (_2!441 lt!8527)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!448)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!362 array!448 (_ BitVec 64) (_ BitVec 64)) tuple2!832)

(assert (=> b!6434 (= lt!8527 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!6435 () Bool)

(declare-fun e!4047 () Bool)

(assert (=> b!6435 (= e!4052 (not e!4047))))

(declare-fun res!7374 () Bool)

(assert (=> b!6435 (=> res!7374 e!4047)))

(declare-datatypes ((tuple2!834 0))(
  ( (tuple2!835 (_1!442 array!448) (_2!442 BitStream!362)) )
))
(declare-fun lt!8526 () tuple2!834)

(declare-datatypes ((List!92 0))(
  ( (Nil!89) (Cons!88 (h!207 Bool) (t!842 List!92)) )
))
(declare-fun lt!8528 () List!92)

(declare-fun byteArrayBitContentToList!0 (BitStream!362 array!448 (_ BitVec 64) (_ BitVec 64)) List!92)

(assert (=> b!6435 (= res!7374 (not (= (byteArrayBitContentToList!0 (_2!441 lt!8527) (_1!442 lt!8526) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!8528)))))

(declare-datatypes ((tuple2!836 0))(
  ( (tuple2!837 (_1!443 BitStream!362) (_2!443 BitStream!362)) )
))
(declare-fun lt!8529 () tuple2!836)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!362 BitStream!362 (_ BitVec 64)) List!92)

(assert (=> b!6435 (= lt!8528 (bitStreamReadBitsIntoList!0 (_2!441 lt!8527) (_1!443 lt!8529) nBits!460))))

(declare-fun readBits!0 (BitStream!362 (_ BitVec 64)) tuple2!834)

(assert (=> b!6435 (= lt!8526 (readBits!0 (_1!443 lt!8529) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!6435 (validate_offset_bits!1 ((_ sign_extend 32) (size!192 (buf!522 (_2!441 lt!8527)))) ((_ sign_extend 32) (currentByte!1519 thiss!1486)) ((_ sign_extend 32) (currentBit!1514 thiss!1486)) nBits!460)))

(declare-fun lt!8531 () Unit!506)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!362 array!448 (_ BitVec 64)) Unit!506)

(assert (=> b!6435 (= lt!8531 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!522 (_2!441 lt!8527)) nBits!460))))

(declare-fun reader!0 (BitStream!362 BitStream!362) tuple2!836)

(assert (=> b!6435 (= lt!8529 (reader!0 thiss!1486 (_2!441 lt!8527)))))

(declare-fun b!6436 () Bool)

(declare-fun res!7372 () Bool)

(assert (=> b!6436 (=> (not res!7372) (not e!4052))))

(assert (=> b!6436 (= res!7372 (= (size!192 (buf!522 thiss!1486)) (size!192 (buf!522 (_2!441 lt!8527)))))))

(declare-fun b!6437 () Bool)

(declare-fun res!7368 () Bool)

(assert (=> b!6437 (=> (not res!7368) (not e!4048))))

(assert (=> b!6437 (= res!7368 (validate_offset_bits!1 ((_ sign_extend 32) (size!192 (buf!522 thiss!1486))) ((_ sign_extend 32) (currentByte!1519 thiss!1486)) ((_ sign_extend 32) (currentBit!1514 thiss!1486)) nBits!460))))

(declare-fun b!6438 () Bool)

(declare-fun e!4051 () Bool)

(declare-fun array_inv!187 (array!448) Bool)

(assert (=> b!6438 (= e!4051 (array_inv!187 (buf!522 thiss!1486)))))

(declare-fun b!6439 () Bool)

(declare-fun res!7371 () Bool)

(assert (=> b!6439 (=> res!7371 e!4047)))

(assert (=> b!6439 (= res!7371 (not (= lt!8528 (byteArrayBitContentToList!0 (_2!441 lt!8527) srcBuffer!6 from!367 nBits!460))))))

(declare-fun res!7373 () Bool)

(assert (=> start!1410 (=> (not res!7373) (not e!4048))))

(assert (=> start!1410 (= res!7373 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!192 srcBuffer!6))))))))

(assert (=> start!1410 e!4048))

(assert (=> start!1410 true))

(assert (=> start!1410 (array_inv!187 srcBuffer!6)))

(declare-fun inv!12 (BitStream!362) Bool)

(assert (=> start!1410 (and (inv!12 thiss!1486) e!4051)))

(declare-fun b!6440 () Bool)

(declare-fun res!7370 () Bool)

(assert (=> b!6440 (=> (not res!7370) (not e!4052))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!6440 (= res!7370 (= (bitIndex!0 (size!192 (buf!522 (_2!441 lt!8527))) (currentByte!1519 (_2!441 lt!8527)) (currentBit!1514 (_2!441 lt!8527))) (bvadd (bitIndex!0 (size!192 (buf!522 thiss!1486)) (currentByte!1519 thiss!1486) (currentBit!1514 thiss!1486)) nBits!460)))))

(declare-fun b!6441 () Bool)

(assert (=> b!6441 (= e!4047 true)))

(declare-fun lt!8530 () Unit!506)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!362 array!448 array!448 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!506)

(assert (=> b!6441 (= lt!8530 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!441 lt!8527) srcBuffer!6 (_1!442 lt!8526) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (= (and start!1410 res!7373) b!6437))

(assert (= (and b!6437 res!7368) b!6434))

(assert (= (and b!6434 res!7369) b!6436))

(assert (= (and b!6436 res!7372) b!6440))

(assert (= (and b!6440 res!7370) b!6433))

(assert (= (and b!6433 res!7375) b!6435))

(assert (= (and b!6435 (not res!7374)) b!6439))

(assert (= (and b!6439 (not res!7371)) b!6441))

(assert (= start!1410 b!6438))

(declare-fun m!8147 () Bool)

(assert (=> b!6438 m!8147))

(declare-fun m!8149 () Bool)

(assert (=> b!6437 m!8149))

(declare-fun m!8151 () Bool)

(assert (=> start!1410 m!8151))

(declare-fun m!8153 () Bool)

(assert (=> start!1410 m!8153))

(declare-fun m!8155 () Bool)

(assert (=> b!6441 m!8155))

(declare-fun m!8157 () Bool)

(assert (=> b!6434 m!8157))

(declare-fun m!8159 () Bool)

(assert (=> b!6434 m!8159))

(declare-fun m!8161 () Bool)

(assert (=> b!6435 m!8161))

(declare-fun m!8163 () Bool)

(assert (=> b!6435 m!8163))

(declare-fun m!8165 () Bool)

(assert (=> b!6435 m!8165))

(declare-fun m!8167 () Bool)

(assert (=> b!6435 m!8167))

(declare-fun m!8169 () Bool)

(assert (=> b!6435 m!8169))

(declare-fun m!8171 () Bool)

(assert (=> b!6435 m!8171))

(declare-fun m!8173 () Bool)

(assert (=> b!6433 m!8173))

(declare-fun m!8175 () Bool)

(assert (=> b!6440 m!8175))

(declare-fun m!8177 () Bool)

(assert (=> b!6440 m!8177))

(declare-fun m!8179 () Bool)

(assert (=> b!6439 m!8179))

(push 1)

(assert (not b!6433))

(assert (not b!6435))

(assert (not b!6437))

(assert (not start!1410))

(assert (not b!6438))

(assert (not b!6440))

(assert (not b!6439))

(assert (not b!6441))

(assert (not b!6434))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

