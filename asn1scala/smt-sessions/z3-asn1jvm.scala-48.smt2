; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1048 () Bool)

(assert start!1048)

(declare-fun b!4020 () Bool)

(declare-fun e!2606 () Bool)

(declare-datatypes ((array!311 0))(
  ( (array!312 (arr!518 (Array (_ BitVec 32) (_ BitVec 8))) (size!128 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!234 0))(
  ( (BitStream!235 (buf!449 array!311) (currentByte!1428 (_ BitVec 32)) (currentBit!1423 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!234)

(declare-fun array_inv!123 (array!311) Bool)

(assert (=> b!4020 (= e!2606 (array_inv!123 (buf!449 thiss!1486)))))

(declare-fun b!4021 () Bool)

(declare-fun res!5435 () Bool)

(declare-fun e!2604 () Bool)

(assert (=> b!4021 (=> (not res!5435) (not e!2604))))

(declare-datatypes ((Unit!306 0))(
  ( (Unit!307) )
))
(declare-datatypes ((tuple2!412 0))(
  ( (tuple2!413 (_1!222 Unit!306) (_2!222 BitStream!234)) )
))
(declare-fun lt!5148 () tuple2!412)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!4021 (= res!5435 (= (bitIndex!0 (size!128 (buf!449 (_2!222 lt!5148))) (currentByte!1428 (_2!222 lt!5148)) (currentBit!1423 (_2!222 lt!5148))) (bvadd (bitIndex!0 (size!128 (buf!449 thiss!1486)) (currentByte!1428 thiss!1486) (currentBit!1423 thiss!1486)) nBits!460)))))

(declare-fun b!4022 () Bool)

(assert (=> b!4022 (= e!2604 (not true))))

(declare-datatypes ((List!28 0))(
  ( (Nil!25) (Cons!24 (h!143 Bool) (t!778 List!28)) )
))
(declare-fun lt!5149 () List!28)

(declare-datatypes ((tuple2!414 0))(
  ( (tuple2!415 (_1!223 BitStream!234) (_2!223 BitStream!234)) )
))
(declare-fun lt!5146 () tuple2!414)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!234 BitStream!234 (_ BitVec 64)) List!28)

(assert (=> b!4022 (= lt!5149 (bitStreamReadBitsIntoList!0 (_2!222 lt!5148) (_1!223 lt!5146) nBits!460))))

(declare-datatypes ((tuple2!416 0))(
  ( (tuple2!417 (_1!224 array!311) (_2!224 BitStream!234)) )
))
(declare-fun lt!5147 () tuple2!416)

(declare-fun readBits!0 (BitStream!234 (_ BitVec 64)) tuple2!416)

(assert (=> b!4022 (= lt!5147 (readBits!0 (_1!223 lt!5146) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!4022 (validate_offset_bits!1 ((_ sign_extend 32) (size!128 (buf!449 (_2!222 lt!5148)))) ((_ sign_extend 32) (currentByte!1428 thiss!1486)) ((_ sign_extend 32) (currentBit!1423 thiss!1486)) nBits!460)))

(declare-fun lt!5150 () Unit!306)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!234 array!311 (_ BitVec 64)) Unit!306)

(assert (=> b!4022 (= lt!5150 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!449 (_2!222 lt!5148)) nBits!460))))

(declare-fun reader!0 (BitStream!234 BitStream!234) tuple2!414)

(assert (=> b!4022 (= lt!5146 (reader!0 thiss!1486 (_2!222 lt!5148)))))

(declare-fun b!4023 () Bool)

(declare-fun res!5439 () Bool)

(assert (=> b!4023 (=> (not res!5439) (not e!2604))))

(assert (=> b!4023 (= res!5439 (= (size!128 (buf!449 thiss!1486)) (size!128 (buf!449 (_2!222 lt!5148)))))))

(declare-fun res!5437 () Bool)

(declare-fun e!2602 () Bool)

(assert (=> start!1048 (=> (not res!5437) (not e!2602))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!311)

(assert (=> start!1048 (= res!5437 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!128 srcBuffer!6))))))))

(assert (=> start!1048 e!2602))

(assert (=> start!1048 true))

(assert (=> start!1048 (array_inv!123 srcBuffer!6)))

(declare-fun inv!12 (BitStream!234) Bool)

(assert (=> start!1048 (and (inv!12 thiss!1486) e!2606)))

(declare-fun b!4024 () Bool)

(declare-fun res!5440 () Bool)

(assert (=> b!4024 (=> (not res!5440) (not e!2604))))

(declare-fun isPrefixOf!0 (BitStream!234 BitStream!234) Bool)

(assert (=> b!4024 (= res!5440 (isPrefixOf!0 thiss!1486 (_2!222 lt!5148)))))

(declare-fun b!4025 () Bool)

(assert (=> b!4025 (= e!2602 e!2604)))

(declare-fun res!5436 () Bool)

(assert (=> b!4025 (=> (not res!5436) (not e!2604))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!4025 (= res!5436 (invariant!0 (currentBit!1423 (_2!222 lt!5148)) (currentByte!1428 (_2!222 lt!5148)) (size!128 (buf!449 (_2!222 lt!5148)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!234 array!311 (_ BitVec 64) (_ BitVec 64)) tuple2!412)

(assert (=> b!4025 (= lt!5148 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!4026 () Bool)

(declare-fun res!5438 () Bool)

(assert (=> b!4026 (=> (not res!5438) (not e!2602))))

(assert (=> b!4026 (= res!5438 (validate_offset_bits!1 ((_ sign_extend 32) (size!128 (buf!449 thiss!1486))) ((_ sign_extend 32) (currentByte!1428 thiss!1486)) ((_ sign_extend 32) (currentBit!1423 thiss!1486)) nBits!460))))

(assert (= (and start!1048 res!5437) b!4026))

(assert (= (and b!4026 res!5438) b!4025))

(assert (= (and b!4025 res!5436) b!4023))

(assert (= (and b!4023 res!5439) b!4021))

(assert (= (and b!4021 res!5435) b!4024))

(assert (= (and b!4024 res!5440) b!4022))

(assert (= start!1048 b!4020))

(declare-fun m!4693 () Bool)

(assert (=> start!1048 m!4693))

(declare-fun m!4695 () Bool)

(assert (=> start!1048 m!4695))

(declare-fun m!4697 () Bool)

(assert (=> b!4020 m!4697))

(declare-fun m!4699 () Bool)

(assert (=> b!4025 m!4699))

(declare-fun m!4701 () Bool)

(assert (=> b!4025 m!4701))

(declare-fun m!4703 () Bool)

(assert (=> b!4021 m!4703))

(declare-fun m!4705 () Bool)

(assert (=> b!4021 m!4705))

(declare-fun m!4707 () Bool)

(assert (=> b!4022 m!4707))

(declare-fun m!4709 () Bool)

(assert (=> b!4022 m!4709))

(declare-fun m!4711 () Bool)

(assert (=> b!4022 m!4711))

(declare-fun m!4713 () Bool)

(assert (=> b!4022 m!4713))

(declare-fun m!4715 () Bool)

(assert (=> b!4022 m!4715))

(declare-fun m!4717 () Bool)

(assert (=> b!4024 m!4717))

(declare-fun m!4719 () Bool)

(assert (=> b!4026 m!4719))

(check-sat (not start!1048) (not b!4022) (not b!4026) (not b!4025) (not b!4020) (not b!4024) (not b!4021))
