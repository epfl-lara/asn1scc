; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1046 () Bool)

(assert start!1046)

(declare-fun b!3999 () Bool)

(declare-fun e!2588 () Bool)

(declare-fun e!2591 () Bool)

(assert (=> b!3999 (= e!2588 e!2591)))

(declare-fun res!5417 () Bool)

(assert (=> b!3999 (=> (not res!5417) (not e!2591))))

(declare-datatypes ((array!309 0))(
  ( (array!310 (arr!517 (Array (_ BitVec 32) (_ BitVec 8))) (size!127 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!232 0))(
  ( (BitStream!233 (buf!448 array!309) (currentByte!1427 (_ BitVec 32)) (currentBit!1422 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!304 0))(
  ( (Unit!305) )
))
(declare-datatypes ((tuple2!406 0))(
  ( (tuple2!407 (_1!219 Unit!304) (_2!219 BitStream!232)) )
))
(declare-fun lt!5132 () tuple2!406)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!3999 (= res!5417 (invariant!0 (currentBit!1422 (_2!219 lt!5132)) (currentByte!1427 (_2!219 lt!5132)) (size!127 (buf!448 (_2!219 lt!5132)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!309)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun thiss!1486 () BitStream!232)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!232 array!309 (_ BitVec 64) (_ BitVec 64)) tuple2!406)

(assert (=> b!3999 (= lt!5132 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!4000 () Bool)

(declare-fun res!5420 () Bool)

(assert (=> b!4000 (=> (not res!5420) (not e!2591))))

(assert (=> b!4000 (= res!5420 (= (size!127 (buf!448 thiss!1486)) (size!127 (buf!448 (_2!219 lt!5132)))))))

(declare-fun res!5419 () Bool)

(assert (=> start!1046 (=> (not res!5419) (not e!2588))))

(assert (=> start!1046 (= res!5419 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!127 srcBuffer!6))))))))

(assert (=> start!1046 e!2588))

(assert (=> start!1046 true))

(declare-fun array_inv!122 (array!309) Bool)

(assert (=> start!1046 (array_inv!122 srcBuffer!6)))

(declare-fun e!2587 () Bool)

(declare-fun inv!12 (BitStream!232) Bool)

(assert (=> start!1046 (and (inv!12 thiss!1486) e!2587)))

(declare-fun b!4001 () Bool)

(declare-fun res!5421 () Bool)

(assert (=> b!4001 (=> (not res!5421) (not e!2591))))

(declare-fun isPrefixOf!0 (BitStream!232 BitStream!232) Bool)

(assert (=> b!4001 (= res!5421 (isPrefixOf!0 thiss!1486 (_2!219 lt!5132)))))

(declare-fun b!4002 () Bool)

(declare-fun res!5418 () Bool)

(assert (=> b!4002 (=> (not res!5418) (not e!2591))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!4002 (= res!5418 (= (bitIndex!0 (size!127 (buf!448 (_2!219 lt!5132))) (currentByte!1427 (_2!219 lt!5132)) (currentBit!1422 (_2!219 lt!5132))) (bvadd (bitIndex!0 (size!127 (buf!448 thiss!1486)) (currentByte!1427 thiss!1486) (currentBit!1422 thiss!1486)) nBits!460)))))

(declare-fun b!4003 () Bool)

(assert (=> b!4003 (= e!2587 (array_inv!122 (buf!448 thiss!1486)))))

(declare-fun b!4004 () Bool)

(declare-fun res!5422 () Bool)

(assert (=> b!4004 (=> (not res!5422) (not e!2588))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!4004 (= res!5422 (validate_offset_bits!1 ((_ sign_extend 32) (size!127 (buf!448 thiss!1486))) ((_ sign_extend 32) (currentByte!1427 thiss!1486)) ((_ sign_extend 32) (currentBit!1422 thiss!1486)) nBits!460))))

(declare-fun b!4005 () Bool)

(assert (=> b!4005 (= e!2591 (not true))))

(declare-datatypes ((tuple2!408 0))(
  ( (tuple2!409 (_1!220 BitStream!232) (_2!220 BitStream!232)) )
))
(declare-fun lt!5134 () tuple2!408)

(declare-datatypes ((List!27 0))(
  ( (Nil!24) (Cons!23 (h!142 Bool) (t!777 List!27)) )
))
(declare-fun lt!5131 () List!27)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!232 BitStream!232 (_ BitVec 64)) List!27)

(assert (=> b!4005 (= lt!5131 (bitStreamReadBitsIntoList!0 (_2!219 lt!5132) (_1!220 lt!5134) nBits!460))))

(declare-datatypes ((tuple2!410 0))(
  ( (tuple2!411 (_1!221 array!309) (_2!221 BitStream!232)) )
))
(declare-fun lt!5133 () tuple2!410)

(declare-fun readBits!0 (BitStream!232 (_ BitVec 64)) tuple2!410)

(assert (=> b!4005 (= lt!5133 (readBits!0 (_1!220 lt!5134) nBits!460))))

(assert (=> b!4005 (validate_offset_bits!1 ((_ sign_extend 32) (size!127 (buf!448 (_2!219 lt!5132)))) ((_ sign_extend 32) (currentByte!1427 thiss!1486)) ((_ sign_extend 32) (currentBit!1422 thiss!1486)) nBits!460)))

(declare-fun lt!5135 () Unit!304)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!232 array!309 (_ BitVec 64)) Unit!304)

(assert (=> b!4005 (= lt!5135 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!448 (_2!219 lt!5132)) nBits!460))))

(declare-fun reader!0 (BitStream!232 BitStream!232) tuple2!408)

(assert (=> b!4005 (= lt!5134 (reader!0 thiss!1486 (_2!219 lt!5132)))))

(assert (= (and start!1046 res!5419) b!4004))

(assert (= (and b!4004 res!5422) b!3999))

(assert (= (and b!3999 res!5417) b!4000))

(assert (= (and b!4000 res!5420) b!4002))

(assert (= (and b!4002 res!5418) b!4001))

(assert (= (and b!4001 res!5421) b!4005))

(assert (= start!1046 b!4003))

(declare-fun m!4665 () Bool)

(assert (=> b!3999 m!4665))

(declare-fun m!4667 () Bool)

(assert (=> b!3999 m!4667))

(declare-fun m!4669 () Bool)

(assert (=> b!4002 m!4669))

(declare-fun m!4671 () Bool)

(assert (=> b!4002 m!4671))

(declare-fun m!4673 () Bool)

(assert (=> b!4005 m!4673))

(declare-fun m!4675 () Bool)

(assert (=> b!4005 m!4675))

(declare-fun m!4677 () Bool)

(assert (=> b!4005 m!4677))

(declare-fun m!4679 () Bool)

(assert (=> b!4005 m!4679))

(declare-fun m!4681 () Bool)

(assert (=> b!4005 m!4681))

(declare-fun m!4683 () Bool)

(assert (=> b!4001 m!4683))

(declare-fun m!4685 () Bool)

(assert (=> start!1046 m!4685))

(declare-fun m!4687 () Bool)

(assert (=> start!1046 m!4687))

(declare-fun m!4689 () Bool)

(assert (=> b!4003 m!4689))

(declare-fun m!4691 () Bool)

(assert (=> b!4004 m!4691))

(push 1)

(assert (not b!4001))

(assert (not b!4005))

(assert (not b!4003))

(assert (not b!4004))

(assert (not b!3999))

(assert (not b!4002))

(assert (not start!1046))

(check-sat)

(pop 1)

