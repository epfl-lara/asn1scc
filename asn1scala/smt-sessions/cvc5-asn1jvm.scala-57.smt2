; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1100 () Bool)

(assert start!1100)

(declare-fun b!4584 () Bool)

(declare-fun e!3004 () Bool)

(assert (=> b!4584 (= e!3004 (not true))))

(declare-datatypes ((array!363 0))(
  ( (array!364 (arr!544 (Array (_ BitVec 32) (_ BitVec 8))) (size!154 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!286 0))(
  ( (BitStream!287 (buf!475 array!363) (currentByte!1454 (_ BitVec 32)) (currentBit!1449 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!358 0))(
  ( (Unit!359) )
))
(declare-datatypes ((tuple2!568 0))(
  ( (tuple2!569 (_1!300 Unit!358) (_2!300 BitStream!286)) )
))
(declare-fun lt!5536 () tuple2!568)

(declare-datatypes ((tuple2!570 0))(
  ( (tuple2!571 (_1!301 BitStream!286) (_2!301 BitStream!286)) )
))
(declare-fun lt!5540 () tuple2!570)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-datatypes ((List!54 0))(
  ( (Nil!51) (Cons!50 (h!169 Bool) (t!804 List!54)) )
))
(declare-fun lt!5539 () List!54)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!286 BitStream!286 (_ BitVec 64)) List!54)

(assert (=> b!4584 (= lt!5539 (bitStreamReadBitsIntoList!0 (_2!300 lt!5536) (_1!301 lt!5540) nBits!460))))

(declare-datatypes ((tuple2!572 0))(
  ( (tuple2!573 (_1!302 array!363) (_2!302 BitStream!286)) )
))
(declare-fun lt!5537 () tuple2!572)

(declare-fun readBits!0 (BitStream!286 (_ BitVec 64)) tuple2!572)

(assert (=> b!4584 (= lt!5537 (readBits!0 (_1!301 lt!5540) nBits!460))))

(declare-fun thiss!1486 () BitStream!286)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!4584 (validate_offset_bits!1 ((_ sign_extend 32) (size!154 (buf!475 (_2!300 lt!5536)))) ((_ sign_extend 32) (currentByte!1454 thiss!1486)) ((_ sign_extend 32) (currentBit!1449 thiss!1486)) nBits!460)))

(declare-fun lt!5538 () Unit!358)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!286 array!363 (_ BitVec 64)) Unit!358)

(assert (=> b!4584 (= lt!5538 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!475 (_2!300 lt!5536)) nBits!460))))

(declare-fun reader!0 (BitStream!286 BitStream!286) tuple2!570)

(assert (=> b!4584 (= lt!5540 (reader!0 thiss!1486 (_2!300 lt!5536)))))

(declare-fun b!4585 () Bool)

(declare-fun res!5926 () Bool)

(assert (=> b!4585 (=> (not res!5926) (not e!3004))))

(declare-fun isPrefixOf!0 (BitStream!286 BitStream!286) Bool)

(assert (=> b!4585 (= res!5926 (isPrefixOf!0 thiss!1486 (_2!300 lt!5536)))))

(declare-fun b!4586 () Bool)

(declare-fun res!5923 () Bool)

(assert (=> b!4586 (=> (not res!5923) (not e!3004))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!4586 (= res!5923 (= (bitIndex!0 (size!154 (buf!475 (_2!300 lt!5536))) (currentByte!1454 (_2!300 lt!5536)) (currentBit!1449 (_2!300 lt!5536))) (bvadd (bitIndex!0 (size!154 (buf!475 thiss!1486)) (currentByte!1454 thiss!1486) (currentBit!1449 thiss!1486)) nBits!460)))))

(declare-fun b!4587 () Bool)

(declare-fun res!5925 () Bool)

(declare-fun e!3002 () Bool)

(assert (=> b!4587 (=> (not res!5925) (not e!3002))))

(assert (=> b!4587 (= res!5925 (validate_offset_bits!1 ((_ sign_extend 32) (size!154 (buf!475 thiss!1486))) ((_ sign_extend 32) (currentByte!1454 thiss!1486)) ((_ sign_extend 32) (currentBit!1449 thiss!1486)) nBits!460))))

(declare-fun res!5924 () Bool)

(assert (=> start!1100 (=> (not res!5924) (not e!3002))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!363)

(assert (=> start!1100 (= res!5924 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!154 srcBuffer!6))))))))

(assert (=> start!1100 e!3002))

(assert (=> start!1100 true))

(declare-fun array_inv!149 (array!363) Bool)

(assert (=> start!1100 (array_inv!149 srcBuffer!6)))

(declare-fun e!3005 () Bool)

(declare-fun inv!12 (BitStream!286) Bool)

(assert (=> start!1100 (and (inv!12 thiss!1486) e!3005)))

(declare-fun b!4588 () Bool)

(declare-fun res!5922 () Bool)

(assert (=> b!4588 (=> (not res!5922) (not e!3004))))

(assert (=> b!4588 (= res!5922 (= (size!154 (buf!475 thiss!1486)) (size!154 (buf!475 (_2!300 lt!5536)))))))

(declare-fun b!4589 () Bool)

(assert (=> b!4589 (= e!3002 e!3004)))

(declare-fun res!5921 () Bool)

(assert (=> b!4589 (=> (not res!5921) (not e!3004))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!4589 (= res!5921 (invariant!0 (currentBit!1449 (_2!300 lt!5536)) (currentByte!1454 (_2!300 lt!5536)) (size!154 (buf!475 (_2!300 lt!5536)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!286 array!363 (_ BitVec 64) (_ BitVec 64)) tuple2!568)

(assert (=> b!4589 (= lt!5536 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!4590 () Bool)

(assert (=> b!4590 (= e!3005 (array_inv!149 (buf!475 thiss!1486)))))

(assert (= (and start!1100 res!5924) b!4587))

(assert (= (and b!4587 res!5925) b!4589))

(assert (= (and b!4589 res!5921) b!4588))

(assert (= (and b!4588 res!5922) b!4586))

(assert (= (and b!4586 res!5923) b!4585))

(assert (= (and b!4585 res!5926) b!4584))

(assert (= start!1100 b!4590))

(declare-fun m!5433 () Bool)

(assert (=> b!4590 m!5433))

(declare-fun m!5435 () Bool)

(assert (=> b!4589 m!5435))

(declare-fun m!5437 () Bool)

(assert (=> b!4589 m!5437))

(declare-fun m!5439 () Bool)

(assert (=> start!1100 m!5439))

(declare-fun m!5441 () Bool)

(assert (=> start!1100 m!5441))

(declare-fun m!5443 () Bool)

(assert (=> b!4586 m!5443))

(declare-fun m!5445 () Bool)

(assert (=> b!4586 m!5445))

(declare-fun m!5447 () Bool)

(assert (=> b!4584 m!5447))

(declare-fun m!5449 () Bool)

(assert (=> b!4584 m!5449))

(declare-fun m!5451 () Bool)

(assert (=> b!4584 m!5451))

(declare-fun m!5453 () Bool)

(assert (=> b!4584 m!5453))

(declare-fun m!5455 () Bool)

(assert (=> b!4584 m!5455))

(declare-fun m!5457 () Bool)

(assert (=> b!4587 m!5457))

(declare-fun m!5459 () Bool)

(assert (=> b!4585 m!5459))

(push 1)

(assert (not start!1100))

(assert (not b!4586))

(assert (not b!4585))

(assert (not b!4587))

(assert (not b!4589))

(assert (not b!4584))

(assert (not b!4590))

(check-sat)

(pop 1)

