; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1054 () Bool)

(assert start!1054)

(declare-fun b!4083 () Bool)

(declare-fun res!5492 () Bool)

(declare-fun e!2648 () Bool)

(assert (=> b!4083 (=> (not res!5492) (not e!2648))))

(declare-datatypes ((array!317 0))(
  ( (array!318 (arr!521 (Array (_ BitVec 32) (_ BitVec 8))) (size!131 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!240 0))(
  ( (BitStream!241 (buf!452 array!317) (currentByte!1431 (_ BitVec 32)) (currentBit!1426 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!240)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!4083 (= res!5492 (validate_offset_bits!1 ((_ sign_extend 32) (size!131 (buf!452 thiss!1486))) ((_ sign_extend 32) (currentByte!1431 thiss!1486)) ((_ sign_extend 32) (currentBit!1426 thiss!1486)) nBits!460))))

(declare-fun b!4084 () Bool)

(declare-fun res!5494 () Bool)

(declare-fun e!2649 () Bool)

(assert (=> b!4084 (=> (not res!5494) (not e!2649))))

(declare-datatypes ((Unit!312 0))(
  ( (Unit!313) )
))
(declare-datatypes ((tuple2!430 0))(
  ( (tuple2!431 (_1!231 Unit!312) (_2!231 BitStream!240)) )
))
(declare-fun lt!5191 () tuple2!430)

(declare-fun isPrefixOf!0 (BitStream!240 BitStream!240) Bool)

(assert (=> b!4084 (= res!5494 (isPrefixOf!0 thiss!1486 (_2!231 lt!5191)))))

(declare-fun b!4085 () Bool)

(declare-fun res!5493 () Bool)

(assert (=> b!4085 (=> (not res!5493) (not e!2649))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!4085 (= res!5493 (= (bitIndex!0 (size!131 (buf!452 (_2!231 lt!5191))) (currentByte!1431 (_2!231 lt!5191)) (currentBit!1426 (_2!231 lt!5191))) (bvadd (bitIndex!0 (size!131 (buf!452 thiss!1486)) (currentByte!1431 thiss!1486) (currentBit!1426 thiss!1486)) nBits!460)))))

(declare-fun res!5490 () Bool)

(assert (=> start!1054 (=> (not res!5490) (not e!2648))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!317)

(assert (=> start!1054 (= res!5490 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!131 srcBuffer!6))))))))

(assert (=> start!1054 e!2648))

(assert (=> start!1054 true))

(declare-fun array_inv!126 (array!317) Bool)

(assert (=> start!1054 (array_inv!126 srcBuffer!6)))

(declare-fun e!2650 () Bool)

(declare-fun inv!12 (BitStream!240) Bool)

(assert (=> start!1054 (and (inv!12 thiss!1486) e!2650)))

(declare-fun b!4086 () Bool)

(assert (=> b!4086 (= e!2648 e!2649)))

(declare-fun res!5491 () Bool)

(assert (=> b!4086 (=> (not res!5491) (not e!2649))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!4086 (= res!5491 (invariant!0 (currentBit!1426 (_2!231 lt!5191)) (currentByte!1431 (_2!231 lt!5191)) (size!131 (buf!452 (_2!231 lt!5191)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!240 array!317 (_ BitVec 64) (_ BitVec 64)) tuple2!430)

(assert (=> b!4086 (= lt!5191 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!4087 () Bool)

(assert (=> b!4087 (= e!2650 (array_inv!126 (buf!452 thiss!1486)))))

(declare-fun b!4088 () Bool)

(declare-fun res!5489 () Bool)

(assert (=> b!4088 (=> (not res!5489) (not e!2649))))

(assert (=> b!4088 (= res!5489 (= (size!131 (buf!452 thiss!1486)) (size!131 (buf!452 (_2!231 lt!5191)))))))

(declare-fun b!4089 () Bool)

(assert (=> b!4089 (= e!2649 (not true))))

(declare-datatypes ((tuple2!432 0))(
  ( (tuple2!433 (_1!232 BitStream!240) (_2!232 BitStream!240)) )
))
(declare-fun lt!5195 () tuple2!432)

(declare-datatypes ((List!31 0))(
  ( (Nil!28) (Cons!27 (h!146 Bool) (t!781 List!31)) )
))
(declare-fun lt!5194 () List!31)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!240 BitStream!240 (_ BitVec 64)) List!31)

(assert (=> b!4089 (= lt!5194 (bitStreamReadBitsIntoList!0 (_2!231 lt!5191) (_1!232 lt!5195) nBits!460))))

(declare-datatypes ((tuple2!434 0))(
  ( (tuple2!435 (_1!233 array!317) (_2!233 BitStream!240)) )
))
(declare-fun lt!5192 () tuple2!434)

(declare-fun readBits!0 (BitStream!240 (_ BitVec 64)) tuple2!434)

(assert (=> b!4089 (= lt!5192 (readBits!0 (_1!232 lt!5195) nBits!460))))

(assert (=> b!4089 (validate_offset_bits!1 ((_ sign_extend 32) (size!131 (buf!452 (_2!231 lt!5191)))) ((_ sign_extend 32) (currentByte!1431 thiss!1486)) ((_ sign_extend 32) (currentBit!1426 thiss!1486)) nBits!460)))

(declare-fun lt!5193 () Unit!312)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!240 array!317 (_ BitVec 64)) Unit!312)

(assert (=> b!4089 (= lt!5193 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!452 (_2!231 lt!5191)) nBits!460))))

(declare-fun reader!0 (BitStream!240 BitStream!240) tuple2!432)

(assert (=> b!4089 (= lt!5195 (reader!0 thiss!1486 (_2!231 lt!5191)))))

(assert (= (and start!1054 res!5490) b!4083))

(assert (= (and b!4083 res!5492) b!4086))

(assert (= (and b!4086 res!5491) b!4088))

(assert (= (and b!4088 res!5489) b!4085))

(assert (= (and b!4085 res!5493) b!4084))

(assert (= (and b!4084 res!5494) b!4089))

(assert (= start!1054 b!4087))

(declare-fun m!4777 () Bool)

(assert (=> b!4084 m!4777))

(declare-fun m!4779 () Bool)

(assert (=> b!4083 m!4779))

(declare-fun m!4781 () Bool)

(assert (=> start!1054 m!4781))

(declare-fun m!4783 () Bool)

(assert (=> start!1054 m!4783))

(declare-fun m!4785 () Bool)

(assert (=> b!4087 m!4785))

(declare-fun m!4787 () Bool)

(assert (=> b!4086 m!4787))

(declare-fun m!4789 () Bool)

(assert (=> b!4086 m!4789))

(declare-fun m!4791 () Bool)

(assert (=> b!4085 m!4791))

(declare-fun m!4793 () Bool)

(assert (=> b!4085 m!4793))

(declare-fun m!4795 () Bool)

(assert (=> b!4089 m!4795))

(declare-fun m!4797 () Bool)

(assert (=> b!4089 m!4797))

(declare-fun m!4799 () Bool)

(assert (=> b!4089 m!4799))

(declare-fun m!4801 () Bool)

(assert (=> b!4089 m!4801))

(declare-fun m!4803 () Bool)

(assert (=> b!4089 m!4803))

(check-sat (not b!4084) (not b!4086) (not b!4087) (not b!4083) (not b!4085) (not start!1054) (not b!4089))
