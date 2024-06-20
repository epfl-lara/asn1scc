; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1104 () Bool)

(assert start!1104)

(declare-fun b!4626 () Bool)

(declare-fun e!3034 () Bool)

(declare-datatypes ((array!367 0))(
  ( (array!368 (arr!546 (Array (_ BitVec 32) (_ BitVec 8))) (size!156 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!290 0))(
  ( (BitStream!291 (buf!477 array!367) (currentByte!1456 (_ BitVec 32)) (currentBit!1451 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!290)

(declare-fun array_inv!151 (array!367) Bool)

(assert (=> b!4626 (= e!3034 (array_inv!151 (buf!477 thiss!1486)))))

(declare-fun b!4627 () Bool)

(declare-fun res!5957 () Bool)

(declare-fun e!3031 () Bool)

(assert (=> b!4627 (=> (not res!5957) (not e!3031))))

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!4627 (= res!5957 (validate_offset_bits!1 ((_ sign_extend 32) (size!156 (buf!477 thiss!1486))) ((_ sign_extend 32) (currentByte!1456 thiss!1486)) ((_ sign_extend 32) (currentBit!1451 thiss!1486)) nBits!460))))

(declare-fun b!4628 () Bool)

(declare-fun e!3035 () Bool)

(assert (=> b!4628 (= e!3035 (not true))))

(declare-datatypes ((Unit!362 0))(
  ( (Unit!363) )
))
(declare-datatypes ((tuple2!580 0))(
  ( (tuple2!581 (_1!306 Unit!362) (_2!306 BitStream!290)) )
))
(declare-fun lt!5568 () tuple2!580)

(declare-datatypes ((tuple2!582 0))(
  ( (tuple2!583 (_1!307 BitStream!290) (_2!307 BitStream!290)) )
))
(declare-fun lt!5567 () tuple2!582)

(declare-datatypes ((List!56 0))(
  ( (Nil!53) (Cons!52 (h!171 Bool) (t!806 List!56)) )
))
(declare-fun lt!5566 () List!56)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!290 BitStream!290 (_ BitVec 64)) List!56)

(assert (=> b!4628 (= lt!5566 (bitStreamReadBitsIntoList!0 (_2!306 lt!5568) (_1!307 lt!5567) nBits!460))))

(declare-datatypes ((tuple2!584 0))(
  ( (tuple2!585 (_1!308 array!367) (_2!308 BitStream!290)) )
))
(declare-fun lt!5570 () tuple2!584)

(declare-fun readBits!0 (BitStream!290 (_ BitVec 64)) tuple2!584)

(assert (=> b!4628 (= lt!5570 (readBits!0 (_1!307 lt!5567) nBits!460))))

(assert (=> b!4628 (validate_offset_bits!1 ((_ sign_extend 32) (size!156 (buf!477 (_2!306 lt!5568)))) ((_ sign_extend 32) (currentByte!1456 thiss!1486)) ((_ sign_extend 32) (currentBit!1451 thiss!1486)) nBits!460)))

(declare-fun lt!5569 () Unit!362)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!290 array!367 (_ BitVec 64)) Unit!362)

(assert (=> b!4628 (= lt!5569 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!477 (_2!306 lt!5568)) nBits!460))))

(declare-fun reader!0 (BitStream!290 BitStream!290) tuple2!582)

(assert (=> b!4628 (= lt!5567 (reader!0 thiss!1486 (_2!306 lt!5568)))))

(declare-fun res!5959 () Bool)

(assert (=> start!1104 (=> (not res!5959) (not e!3031))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!367)

(assert (=> start!1104 (= res!5959 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!156 srcBuffer!6))))))))

(assert (=> start!1104 e!3031))

(assert (=> start!1104 true))

(assert (=> start!1104 (array_inv!151 srcBuffer!6)))

(declare-fun inv!12 (BitStream!290) Bool)

(assert (=> start!1104 (and (inv!12 thiss!1486) e!3034)))

(declare-fun b!4629 () Bool)

(assert (=> b!4629 (= e!3031 e!3035)))

(declare-fun res!5960 () Bool)

(assert (=> b!4629 (=> (not res!5960) (not e!3035))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!4629 (= res!5960 (invariant!0 (currentBit!1451 (_2!306 lt!5568)) (currentByte!1456 (_2!306 lt!5568)) (size!156 (buf!477 (_2!306 lt!5568)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!290 array!367 (_ BitVec 64) (_ BitVec 64)) tuple2!580)

(assert (=> b!4629 (= lt!5568 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!4630 () Bool)

(declare-fun res!5958 () Bool)

(assert (=> b!4630 (=> (not res!5958) (not e!3035))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!4630 (= res!5958 (= (bitIndex!0 (size!156 (buf!477 (_2!306 lt!5568))) (currentByte!1456 (_2!306 lt!5568)) (currentBit!1451 (_2!306 lt!5568))) (bvadd (bitIndex!0 (size!156 (buf!477 thiss!1486)) (currentByte!1456 thiss!1486) (currentBit!1451 thiss!1486)) nBits!460)))))

(declare-fun b!4631 () Bool)

(declare-fun res!5962 () Bool)

(assert (=> b!4631 (=> (not res!5962) (not e!3035))))

(declare-fun isPrefixOf!0 (BitStream!290 BitStream!290) Bool)

(assert (=> b!4631 (= res!5962 (isPrefixOf!0 thiss!1486 (_2!306 lt!5568)))))

(declare-fun b!4632 () Bool)

(declare-fun res!5961 () Bool)

(assert (=> b!4632 (=> (not res!5961) (not e!3035))))

(assert (=> b!4632 (= res!5961 (= (size!156 (buf!477 thiss!1486)) (size!156 (buf!477 (_2!306 lt!5568)))))))

(assert (= (and start!1104 res!5959) b!4627))

(assert (= (and b!4627 res!5957) b!4629))

(assert (= (and b!4629 res!5960) b!4632))

(assert (= (and b!4632 res!5961) b!4630))

(assert (= (and b!4630 res!5958) b!4631))

(assert (= (and b!4631 res!5962) b!4628))

(assert (= start!1104 b!4626))

(declare-fun m!5489 () Bool)

(assert (=> b!4628 m!5489))

(declare-fun m!5491 () Bool)

(assert (=> b!4628 m!5491))

(declare-fun m!5493 () Bool)

(assert (=> b!4628 m!5493))

(declare-fun m!5495 () Bool)

(assert (=> b!4628 m!5495))

(declare-fun m!5497 () Bool)

(assert (=> b!4628 m!5497))

(declare-fun m!5499 () Bool)

(assert (=> start!1104 m!5499))

(declare-fun m!5501 () Bool)

(assert (=> start!1104 m!5501))

(declare-fun m!5503 () Bool)

(assert (=> b!4631 m!5503))

(declare-fun m!5505 () Bool)

(assert (=> b!4627 m!5505))

(declare-fun m!5507 () Bool)

(assert (=> b!4629 m!5507))

(declare-fun m!5509 () Bool)

(assert (=> b!4629 m!5509))

(declare-fun m!5511 () Bool)

(assert (=> b!4626 m!5511))

(declare-fun m!5513 () Bool)

(assert (=> b!4630 m!5513))

(declare-fun m!5515 () Bool)

(assert (=> b!4630 m!5515))

(push 1)

(assert (not b!4630))

(assert (not b!4626))

(assert (not b!4631))

(assert (not b!4627))

(assert (not start!1104))

(assert (not b!4628))

(assert (not b!4629))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

