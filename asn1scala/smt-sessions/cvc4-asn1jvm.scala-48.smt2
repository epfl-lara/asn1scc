; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1050 () Bool)

(assert start!1050)

(declare-fun b!4041 () Bool)

(declare-fun res!5454 () Bool)

(declare-fun e!2618 () Bool)

(assert (=> b!4041 (=> (not res!5454) (not e!2618))))

(declare-datatypes ((array!313 0))(
  ( (array!314 (arr!519 (Array (_ BitVec 32) (_ BitVec 8))) (size!129 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!236 0))(
  ( (BitStream!237 (buf!450 array!313) (currentByte!1429 (_ BitVec 32)) (currentBit!1424 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!308 0))(
  ( (Unit!309) )
))
(declare-datatypes ((tuple2!418 0))(
  ( (tuple2!419 (_1!225 Unit!308) (_2!225 BitStream!236)) )
))
(declare-fun lt!5161 () tuple2!418)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun thiss!1486 () BitStream!236)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!4041 (= res!5454 (= (bitIndex!0 (size!129 (buf!450 (_2!225 lt!5161))) (currentByte!1429 (_2!225 lt!5161)) (currentBit!1424 (_2!225 lt!5161))) (bvadd (bitIndex!0 (size!129 (buf!450 thiss!1486)) (currentByte!1429 thiss!1486) (currentBit!1424 thiss!1486)) nBits!460)))))

(declare-fun b!4042 () Bool)

(declare-fun e!2617 () Bool)

(declare-fun array_inv!124 (array!313) Bool)

(assert (=> b!4042 (= e!2617 (array_inv!124 (buf!450 thiss!1486)))))

(declare-fun b!4043 () Bool)

(declare-fun res!5456 () Bool)

(declare-fun e!2621 () Bool)

(assert (=> b!4043 (=> (not res!5456) (not e!2621))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!4043 (= res!5456 (validate_offset_bits!1 ((_ sign_extend 32) (size!129 (buf!450 thiss!1486))) ((_ sign_extend 32) (currentByte!1429 thiss!1486)) ((_ sign_extend 32) (currentBit!1424 thiss!1486)) nBits!460))))

(declare-fun b!4044 () Bool)

(declare-fun res!5455 () Bool)

(assert (=> b!4044 (=> (not res!5455) (not e!2618))))

(assert (=> b!4044 (= res!5455 (= (size!129 (buf!450 thiss!1486)) (size!129 (buf!450 (_2!225 lt!5161)))))))

(declare-fun b!4045 () Bool)

(declare-fun res!5457 () Bool)

(assert (=> b!4045 (=> (not res!5457) (not e!2618))))

(declare-fun isPrefixOf!0 (BitStream!236 BitStream!236) Bool)

(assert (=> b!4045 (= res!5457 (isPrefixOf!0 thiss!1486 (_2!225 lt!5161)))))

(declare-fun res!5458 () Bool)

(assert (=> start!1050 (=> (not res!5458) (not e!2621))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!313)

(assert (=> start!1050 (= res!5458 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!129 srcBuffer!6))))))))

(assert (=> start!1050 e!2621))

(assert (=> start!1050 true))

(assert (=> start!1050 (array_inv!124 srcBuffer!6)))

(declare-fun inv!12 (BitStream!236) Bool)

(assert (=> start!1050 (and (inv!12 thiss!1486) e!2617)))

(declare-fun b!4046 () Bool)

(assert (=> b!4046 (= e!2618 (not true))))

(declare-datatypes ((tuple2!420 0))(
  ( (tuple2!421 (_1!226 BitStream!236) (_2!226 BitStream!236)) )
))
(declare-fun lt!5164 () tuple2!420)

(declare-datatypes ((List!29 0))(
  ( (Nil!26) (Cons!25 (h!144 Bool) (t!779 List!29)) )
))
(declare-fun lt!5163 () List!29)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!236 BitStream!236 (_ BitVec 64)) List!29)

(assert (=> b!4046 (= lt!5163 (bitStreamReadBitsIntoList!0 (_2!225 lt!5161) (_1!226 lt!5164) nBits!460))))

(declare-datatypes ((tuple2!422 0))(
  ( (tuple2!423 (_1!227 array!313) (_2!227 BitStream!236)) )
))
(declare-fun lt!5165 () tuple2!422)

(declare-fun readBits!0 (BitStream!236 (_ BitVec 64)) tuple2!422)

(assert (=> b!4046 (= lt!5165 (readBits!0 (_1!226 lt!5164) nBits!460))))

(assert (=> b!4046 (validate_offset_bits!1 ((_ sign_extend 32) (size!129 (buf!450 (_2!225 lt!5161)))) ((_ sign_extend 32) (currentByte!1429 thiss!1486)) ((_ sign_extend 32) (currentBit!1424 thiss!1486)) nBits!460)))

(declare-fun lt!5162 () Unit!308)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!236 array!313 (_ BitVec 64)) Unit!308)

(assert (=> b!4046 (= lt!5162 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!450 (_2!225 lt!5161)) nBits!460))))

(declare-fun reader!0 (BitStream!236 BitStream!236) tuple2!420)

(assert (=> b!4046 (= lt!5164 (reader!0 thiss!1486 (_2!225 lt!5161)))))

(declare-fun b!4047 () Bool)

(assert (=> b!4047 (= e!2621 e!2618)))

(declare-fun res!5453 () Bool)

(assert (=> b!4047 (=> (not res!5453) (not e!2618))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!4047 (= res!5453 (invariant!0 (currentBit!1424 (_2!225 lt!5161)) (currentByte!1429 (_2!225 lt!5161)) (size!129 (buf!450 (_2!225 lt!5161)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!236 array!313 (_ BitVec 64) (_ BitVec 64)) tuple2!418)

(assert (=> b!4047 (= lt!5161 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(assert (= (and start!1050 res!5458) b!4043))

(assert (= (and b!4043 res!5456) b!4047))

(assert (= (and b!4047 res!5453) b!4044))

(assert (= (and b!4044 res!5455) b!4041))

(assert (= (and b!4041 res!5454) b!4045))

(assert (= (and b!4045 res!5457) b!4046))

(assert (= start!1050 b!4042))

(declare-fun m!4721 () Bool)

(assert (=> b!4045 m!4721))

(declare-fun m!4723 () Bool)

(assert (=> b!4046 m!4723))

(declare-fun m!4725 () Bool)

(assert (=> b!4046 m!4725))

(declare-fun m!4727 () Bool)

(assert (=> b!4046 m!4727))

(declare-fun m!4729 () Bool)

(assert (=> b!4046 m!4729))

(declare-fun m!4731 () Bool)

(assert (=> b!4046 m!4731))

(declare-fun m!4733 () Bool)

(assert (=> b!4047 m!4733))

(declare-fun m!4735 () Bool)

(assert (=> b!4047 m!4735))

(declare-fun m!4737 () Bool)

(assert (=> b!4041 m!4737))

(declare-fun m!4739 () Bool)

(assert (=> b!4041 m!4739))

(declare-fun m!4741 () Bool)

(assert (=> b!4042 m!4741))

(declare-fun m!4743 () Bool)

(assert (=> start!1050 m!4743))

(declare-fun m!4745 () Bool)

(assert (=> start!1050 m!4745))

(declare-fun m!4747 () Bool)

(assert (=> b!4043 m!4747))

(push 1)

(assert (not start!1050))

(assert (not b!4046))

(assert (not b!4043))

(assert (not b!4042))

(assert (not b!4041))

(assert (not b!4047))

(assert (not b!4045))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

