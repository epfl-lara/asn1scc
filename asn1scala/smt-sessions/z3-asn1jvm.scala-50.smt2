; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1060 () Bool)

(assert start!1060)

(declare-fun b!4146 () Bool)

(declare-fun res!5544 () Bool)

(declare-fun e!2694 () Bool)

(assert (=> b!4146 (=> (not res!5544) (not e!2694))))

(declare-datatypes ((array!323 0))(
  ( (array!324 (arr!524 (Array (_ BitVec 32) (_ BitVec 8))) (size!134 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!246 0))(
  ( (BitStream!247 (buf!455 array!323) (currentByte!1434 (_ BitVec 32)) (currentBit!1429 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!246)

(declare-datatypes ((Unit!318 0))(
  ( (Unit!319) )
))
(declare-datatypes ((tuple2!448 0))(
  ( (tuple2!449 (_1!240 Unit!318) (_2!240 BitStream!246)) )
))
(declare-fun lt!5237 () tuple2!448)

(assert (=> b!4146 (= res!5544 (= (size!134 (buf!455 thiss!1486)) (size!134 (buf!455 (_2!240 lt!5237)))))))

(declare-fun b!4147 () Bool)

(declare-fun e!2692 () Bool)

(declare-fun array_inv!129 (array!323) Bool)

(assert (=> b!4147 (= e!2692 (array_inv!129 (buf!455 thiss!1486)))))

(declare-fun res!5543 () Bool)

(declare-fun e!2693 () Bool)

(assert (=> start!1060 (=> (not res!5543) (not e!2693))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!323)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!1060 (= res!5543 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!134 srcBuffer!6))))))))

(assert (=> start!1060 e!2693))

(assert (=> start!1060 true))

(assert (=> start!1060 (array_inv!129 srcBuffer!6)))

(declare-fun inv!12 (BitStream!246) Bool)

(assert (=> start!1060 (and (inv!12 thiss!1486) e!2692)))

(declare-fun b!4148 () Bool)

(declare-fun res!5545 () Bool)

(assert (=> b!4148 (=> (not res!5545) (not e!2694))))

(declare-fun isPrefixOf!0 (BitStream!246 BitStream!246) Bool)

(assert (=> b!4148 (= res!5545 (isPrefixOf!0 thiss!1486 (_2!240 lt!5237)))))

(declare-fun b!4149 () Bool)

(declare-fun res!5546 () Bool)

(assert (=> b!4149 (=> (not res!5546) (not e!2693))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!4149 (= res!5546 (validate_offset_bits!1 ((_ sign_extend 32) (size!134 (buf!455 thiss!1486))) ((_ sign_extend 32) (currentByte!1434 thiss!1486)) ((_ sign_extend 32) (currentBit!1429 thiss!1486)) nBits!460))))

(declare-fun b!4150 () Bool)

(assert (=> b!4150 (= e!2693 e!2694)))

(declare-fun res!5548 () Bool)

(assert (=> b!4150 (=> (not res!5548) (not e!2694))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!4150 (= res!5548 (invariant!0 (currentBit!1429 (_2!240 lt!5237)) (currentByte!1434 (_2!240 lt!5237)) (size!134 (buf!455 (_2!240 lt!5237)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!246 array!323 (_ BitVec 64) (_ BitVec 64)) tuple2!448)

(assert (=> b!4150 (= lt!5237 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!4151 () Bool)

(declare-fun res!5547 () Bool)

(assert (=> b!4151 (=> (not res!5547) (not e!2694))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!4151 (= res!5547 (= (bitIndex!0 (size!134 (buf!455 (_2!240 lt!5237))) (currentByte!1434 (_2!240 lt!5237)) (currentBit!1429 (_2!240 lt!5237))) (bvadd (bitIndex!0 (size!134 (buf!455 thiss!1486)) (currentByte!1434 thiss!1486) (currentBit!1429 thiss!1486)) nBits!460)))))

(declare-fun b!4152 () Bool)

(assert (=> b!4152 (= e!2694 (not true))))

(declare-datatypes ((List!34 0))(
  ( (Nil!31) (Cons!30 (h!149 Bool) (t!784 List!34)) )
))
(declare-fun lt!5239 () List!34)

(declare-datatypes ((tuple2!450 0))(
  ( (tuple2!451 (_1!241 BitStream!246) (_2!241 BitStream!246)) )
))
(declare-fun lt!5240 () tuple2!450)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!246 BitStream!246 (_ BitVec 64)) List!34)

(assert (=> b!4152 (= lt!5239 (bitStreamReadBitsIntoList!0 (_2!240 lt!5237) (_1!241 lt!5240) nBits!460))))

(declare-datatypes ((tuple2!452 0))(
  ( (tuple2!453 (_1!242 array!323) (_2!242 BitStream!246)) )
))
(declare-fun lt!5238 () tuple2!452)

(declare-fun readBits!0 (BitStream!246 (_ BitVec 64)) tuple2!452)

(assert (=> b!4152 (= lt!5238 (readBits!0 (_1!241 lt!5240) nBits!460))))

(assert (=> b!4152 (validate_offset_bits!1 ((_ sign_extend 32) (size!134 (buf!455 (_2!240 lt!5237)))) ((_ sign_extend 32) (currentByte!1434 thiss!1486)) ((_ sign_extend 32) (currentBit!1429 thiss!1486)) nBits!460)))

(declare-fun lt!5236 () Unit!318)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!246 array!323 (_ BitVec 64)) Unit!318)

(assert (=> b!4152 (= lt!5236 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!455 (_2!240 lt!5237)) nBits!460))))

(declare-fun reader!0 (BitStream!246 BitStream!246) tuple2!450)

(assert (=> b!4152 (= lt!5240 (reader!0 thiss!1486 (_2!240 lt!5237)))))

(assert (= (and start!1060 res!5543) b!4149))

(assert (= (and b!4149 res!5546) b!4150))

(assert (= (and b!4150 res!5548) b!4146))

(assert (= (and b!4146 res!5544) b!4151))

(assert (= (and b!4151 res!5547) b!4148))

(assert (= (and b!4148 res!5545) b!4152))

(assert (= start!1060 b!4147))

(declare-fun m!4861 () Bool)

(assert (=> b!4150 m!4861))

(declare-fun m!4863 () Bool)

(assert (=> b!4150 m!4863))

(declare-fun m!4865 () Bool)

(assert (=> b!4152 m!4865))

(declare-fun m!4867 () Bool)

(assert (=> b!4152 m!4867))

(declare-fun m!4869 () Bool)

(assert (=> b!4152 m!4869))

(declare-fun m!4871 () Bool)

(assert (=> b!4152 m!4871))

(declare-fun m!4873 () Bool)

(assert (=> b!4152 m!4873))

(declare-fun m!4875 () Bool)

(assert (=> b!4148 m!4875))

(declare-fun m!4877 () Bool)

(assert (=> b!4149 m!4877))

(declare-fun m!4879 () Bool)

(assert (=> b!4151 m!4879))

(declare-fun m!4881 () Bool)

(assert (=> b!4151 m!4881))

(declare-fun m!4883 () Bool)

(assert (=> start!1060 m!4883))

(declare-fun m!4885 () Bool)

(assert (=> start!1060 m!4885))

(declare-fun m!4887 () Bool)

(assert (=> b!4147 m!4887))

(check-sat (not b!4150) (not b!4147) (not b!4149) (not b!4151) (not b!4152) (not b!4148) (not start!1060))
