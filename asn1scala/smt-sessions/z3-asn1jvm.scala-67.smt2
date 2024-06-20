; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1312 () Bool)

(assert start!1312)

(declare-fun b!5944 () Bool)

(declare-fun res!7001 () Bool)

(declare-fun e!3785 () Bool)

(assert (=> b!5944 (=> (not res!7001) (not e!3785))))

(declare-datatypes ((array!431 0))(
  ( (array!432 (arr!581 (Array (_ BitVec 32) (_ BitVec 8))) (size!185 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!348 0))(
  ( (BitStream!349 (buf!512 array!431) (currentByte!1503 (_ BitVec 32)) (currentBit!1498 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!348)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!5944 (= res!7001 (validate_offset_bits!1 ((_ sign_extend 32) (size!185 (buf!512 thiss!1486))) ((_ sign_extend 32) (currentByte!1503 thiss!1486)) ((_ sign_extend 32) (currentBit!1498 thiss!1486)) nBits!460))))

(declare-fun b!5945 () Bool)

(declare-fun e!3781 () Bool)

(assert (=> b!5945 (= e!3785 e!3781)))

(declare-fun res!6997 () Bool)

(assert (=> b!5945 (=> (not res!6997) (not e!3781))))

(declare-datatypes ((Unit!468 0))(
  ( (Unit!469) )
))
(declare-datatypes ((tuple2!778 0))(
  ( (tuple2!779 (_1!411 Unit!468) (_2!411 BitStream!348)) )
))
(declare-fun lt!7631 () tuple2!778)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!5945 (= res!6997 (invariant!0 (currentBit!1498 (_2!411 lt!7631)) (currentByte!1503 (_2!411 lt!7631)) (size!185 (buf!512 (_2!411 lt!7631)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!431)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!348 array!431 (_ BitVec 64) (_ BitVec 64)) tuple2!778)

(assert (=> b!5945 (= lt!7631 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!5946 () Bool)

(declare-fun res!6996 () Bool)

(assert (=> b!5946 (=> (not res!6996) (not e!3781))))

(declare-fun isPrefixOf!0 (BitStream!348 BitStream!348) Bool)

(assert (=> b!5946 (= res!6996 (isPrefixOf!0 thiss!1486 (_2!411 lt!7631)))))

(declare-fun b!5947 () Bool)

(declare-fun e!3783 () Bool)

(assert (=> b!5947 (= e!3783 true)))

(declare-fun lt!7630 () Unit!468)

(declare-datatypes ((tuple2!780 0))(
  ( (tuple2!781 (_1!412 array!431) (_2!412 BitStream!348)) )
))
(declare-fun lt!7626 () tuple2!780)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!348 array!431 array!431 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!468)

(assert (=> b!5947 (= lt!7630 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!411 lt!7631) srcBuffer!6 (_1!412 lt!7626) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!5948 () Bool)

(declare-fun res!6999 () Bool)

(assert (=> b!5948 (=> (not res!6999) (not e!3781))))

(assert (=> b!5948 (= res!6999 (= (size!185 (buf!512 thiss!1486)) (size!185 (buf!512 (_2!411 lt!7631)))))))

(declare-fun res!7000 () Bool)

(assert (=> start!1312 (=> (not res!7000) (not e!3785))))

(assert (=> start!1312 (= res!7000 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!185 srcBuffer!6))))))))

(assert (=> start!1312 e!3785))

(assert (=> start!1312 true))

(declare-fun array_inv!180 (array!431) Bool)

(assert (=> start!1312 (array_inv!180 srcBuffer!6)))

(declare-fun e!3784 () Bool)

(declare-fun inv!12 (BitStream!348) Bool)

(assert (=> start!1312 (and (inv!12 thiss!1486) e!3784)))

(declare-fun b!5949 () Bool)

(declare-fun res!7002 () Bool)

(assert (=> b!5949 (=> res!7002 e!3783)))

(declare-datatypes ((List!85 0))(
  ( (Nil!82) (Cons!81 (h!200 Bool) (t!835 List!85)) )
))
(declare-fun lt!7629 () List!85)

(declare-fun byteArrayBitContentToList!0 (BitStream!348 array!431 (_ BitVec 64) (_ BitVec 64)) List!85)

(assert (=> b!5949 (= res!7002 (not (= lt!7629 (byteArrayBitContentToList!0 (_2!411 lt!7631) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!5950 () Bool)

(assert (=> b!5950 (= e!3781 (not e!3783))))

(declare-fun res!6998 () Bool)

(assert (=> b!5950 (=> res!6998 e!3783)))

(assert (=> b!5950 (= res!6998 (not (= (byteArrayBitContentToList!0 (_2!411 lt!7631) (_1!412 lt!7626) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!7629)))))

(declare-datatypes ((tuple2!782 0))(
  ( (tuple2!783 (_1!413 BitStream!348) (_2!413 BitStream!348)) )
))
(declare-fun lt!7627 () tuple2!782)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!348 BitStream!348 (_ BitVec 64)) List!85)

(assert (=> b!5950 (= lt!7629 (bitStreamReadBitsIntoList!0 (_2!411 lt!7631) (_1!413 lt!7627) nBits!460))))

(declare-fun readBits!0 (BitStream!348 (_ BitVec 64)) tuple2!780)

(assert (=> b!5950 (= lt!7626 (readBits!0 (_1!413 lt!7627) nBits!460))))

(assert (=> b!5950 (validate_offset_bits!1 ((_ sign_extend 32) (size!185 (buf!512 (_2!411 lt!7631)))) ((_ sign_extend 32) (currentByte!1503 thiss!1486)) ((_ sign_extend 32) (currentBit!1498 thiss!1486)) nBits!460)))

(declare-fun lt!7628 () Unit!468)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!348 array!431 (_ BitVec 64)) Unit!468)

(assert (=> b!5950 (= lt!7628 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!512 (_2!411 lt!7631)) nBits!460))))

(declare-fun reader!0 (BitStream!348 BitStream!348) tuple2!782)

(assert (=> b!5950 (= lt!7627 (reader!0 thiss!1486 (_2!411 lt!7631)))))

(declare-fun b!5951 () Bool)

(declare-fun res!7003 () Bool)

(assert (=> b!5951 (=> (not res!7003) (not e!3781))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!5951 (= res!7003 (= (bitIndex!0 (size!185 (buf!512 (_2!411 lt!7631))) (currentByte!1503 (_2!411 lt!7631)) (currentBit!1498 (_2!411 lt!7631))) (bvadd (bitIndex!0 (size!185 (buf!512 thiss!1486)) (currentByte!1503 thiss!1486) (currentBit!1498 thiss!1486)) nBits!460)))))

(declare-fun b!5952 () Bool)

(assert (=> b!5952 (= e!3784 (array_inv!180 (buf!512 thiss!1486)))))

(assert (= (and start!1312 res!7000) b!5944))

(assert (= (and b!5944 res!7001) b!5945))

(assert (= (and b!5945 res!6997) b!5948))

(assert (= (and b!5948 res!6999) b!5951))

(assert (= (and b!5951 res!7003) b!5946))

(assert (= (and b!5946 res!6996) b!5950))

(assert (= (and b!5950 (not res!6998)) b!5949))

(assert (= (and b!5949 (not res!7002)) b!5947))

(assert (= start!1312 b!5952))

(declare-fun m!7417 () Bool)

(assert (=> b!5944 m!7417))

(declare-fun m!7419 () Bool)

(assert (=> b!5951 m!7419))

(declare-fun m!7421 () Bool)

(assert (=> b!5951 m!7421))

(declare-fun m!7423 () Bool)

(assert (=> b!5947 m!7423))

(declare-fun m!7425 () Bool)

(assert (=> b!5952 m!7425))

(declare-fun m!7427 () Bool)

(assert (=> b!5950 m!7427))

(declare-fun m!7429 () Bool)

(assert (=> b!5950 m!7429))

(declare-fun m!7431 () Bool)

(assert (=> b!5950 m!7431))

(declare-fun m!7433 () Bool)

(assert (=> b!5950 m!7433))

(declare-fun m!7435 () Bool)

(assert (=> b!5950 m!7435))

(declare-fun m!7437 () Bool)

(assert (=> b!5950 m!7437))

(declare-fun m!7439 () Bool)

(assert (=> b!5949 m!7439))

(declare-fun m!7441 () Bool)

(assert (=> b!5945 m!7441))

(declare-fun m!7443 () Bool)

(assert (=> b!5945 m!7443))

(declare-fun m!7445 () Bool)

(assert (=> start!1312 m!7445))

(declare-fun m!7447 () Bool)

(assert (=> start!1312 m!7447))

(declare-fun m!7449 () Bool)

(assert (=> b!5946 m!7449))

(check-sat (not b!5949) (not b!5947) (not start!1312) (not b!5946) (not b!5945) (not b!5952) (not b!5944) (not b!5951) (not b!5950))
