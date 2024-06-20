; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!962 () Bool)

(assert start!962)

(declare-fun b!3597 () Bool)

(declare-fun res!5124 () Bool)

(declare-fun e!2377 () Bool)

(assert (=> b!3597 (=> (not res!5124) (not e!2377))))

(declare-datatypes ((array!294 0))(
  ( (array!295 (arr!508 (Array (_ BitVec 32) (_ BitVec 8))) (size!121 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!220 0))(
  ( (BitStream!221 (buf!439 array!294) (currentByte!1412 (_ BitVec 32)) (currentBit!1407 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!268 0))(
  ( (Unit!269) )
))
(declare-datatypes ((tuple2!358 0))(
  ( (tuple2!359 (_1!192 Unit!268) (_2!192 BitStream!220)) )
))
(declare-fun lt!4296 () tuple2!358)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun thiss!1486 () BitStream!220)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!3597 (= res!5124 (= (bitIndex!0 (size!121 (buf!439 (_2!192 lt!4296))) (currentByte!1412 (_2!192 lt!4296)) (currentBit!1407 (_2!192 lt!4296))) (bvadd (bitIndex!0 (size!121 (buf!439 thiss!1486)) (currentByte!1412 thiss!1486) (currentBit!1407 thiss!1486)) nBits!460)))))

(declare-fun b!3598 () Bool)

(declare-fun res!5123 () Bool)

(assert (=> b!3598 (=> (not res!5123) (not e!2377))))

(assert (=> b!3598 (= res!5123 (= (size!121 (buf!439 thiss!1486)) (size!121 (buf!439 (_2!192 lt!4296)))))))

(declare-fun res!5128 () Bool)

(declare-fun e!2378 () Bool)

(assert (=> start!962 (=> (not res!5128) (not e!2378))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!294)

(assert (=> start!962 (= res!5128 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!121 srcBuffer!6))))))))

(assert (=> start!962 e!2378))

(assert (=> start!962 true))

(declare-fun array_inv!116 (array!294) Bool)

(assert (=> start!962 (array_inv!116 srcBuffer!6)))

(declare-fun e!2379 () Bool)

(declare-fun inv!12 (BitStream!220) Bool)

(assert (=> start!962 (and (inv!12 thiss!1486) e!2379)))

(declare-fun b!3599 () Bool)

(assert (=> b!3599 (= e!2377 (not true))))

(declare-datatypes ((List!21 0))(
  ( (Nil!18) (Cons!17 (h!136 Bool) (t!771 List!21)) )
))
(declare-fun lt!4295 () List!21)

(declare-datatypes ((tuple2!360 0))(
  ( (tuple2!361 (_1!193 BitStream!220) (_2!193 BitStream!220)) )
))
(declare-fun lt!4294 () tuple2!360)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!220 BitStream!220 (_ BitVec 64)) List!21)

(assert (=> b!3599 (= lt!4295 (bitStreamReadBitsIntoList!0 (_2!192 lt!4296) (_1!193 lt!4294) nBits!460))))

(declare-datatypes ((tuple2!362 0))(
  ( (tuple2!363 (_1!194 array!294) (_2!194 BitStream!220)) )
))
(declare-fun lt!4298 () tuple2!362)

(declare-fun readBits!0 (BitStream!220 (_ BitVec 64)) tuple2!362)

(assert (=> b!3599 (= lt!4298 (readBits!0 (_1!193 lt!4294) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!3599 (validate_offset_bits!1 ((_ sign_extend 32) (size!121 (buf!439 (_2!192 lt!4296)))) ((_ sign_extend 32) (currentByte!1412 thiss!1486)) ((_ sign_extend 32) (currentBit!1407 thiss!1486)) nBits!460)))

(declare-fun lt!4297 () Unit!268)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!220 array!294 (_ BitVec 64)) Unit!268)

(assert (=> b!3599 (= lt!4297 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!439 (_2!192 lt!4296)) nBits!460))))

(declare-fun reader!0 (BitStream!220 BitStream!220) tuple2!360)

(assert (=> b!3599 (= lt!4294 (reader!0 thiss!1486 (_2!192 lt!4296)))))

(declare-fun b!3600 () Bool)

(assert (=> b!3600 (= e!2378 e!2377)))

(declare-fun res!5125 () Bool)

(assert (=> b!3600 (=> (not res!5125) (not e!2377))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!3600 (= res!5125 (invariant!0 (currentBit!1407 (_2!192 lt!4296)) (currentByte!1412 (_2!192 lt!4296)) (size!121 (buf!439 (_2!192 lt!4296)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!220 array!294 (_ BitVec 64) (_ BitVec 64)) tuple2!358)

(assert (=> b!3600 (= lt!4296 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!3601 () Bool)

(assert (=> b!3601 (= e!2379 (array_inv!116 (buf!439 thiss!1486)))))

(declare-fun b!3602 () Bool)

(declare-fun res!5126 () Bool)

(assert (=> b!3602 (=> (not res!5126) (not e!2377))))

(declare-fun isPrefixOf!0 (BitStream!220 BitStream!220) Bool)

(assert (=> b!3602 (= res!5126 (isPrefixOf!0 thiss!1486 (_2!192 lt!4296)))))

(declare-fun b!3603 () Bool)

(declare-fun res!5127 () Bool)

(assert (=> b!3603 (=> (not res!5127) (not e!2378))))

(assert (=> b!3603 (= res!5127 (validate_offset_bits!1 ((_ sign_extend 32) (size!121 (buf!439 thiss!1486))) ((_ sign_extend 32) (currentByte!1412 thiss!1486)) ((_ sign_extend 32) (currentBit!1407 thiss!1486)) nBits!460))))

(assert (= (and start!962 res!5128) b!3603))

(assert (= (and b!3603 res!5127) b!3600))

(assert (= (and b!3600 res!5125) b!3598))

(assert (= (and b!3598 res!5123) b!3597))

(assert (= (and b!3597 res!5124) b!3602))

(assert (= (and b!3602 res!5126) b!3599))

(assert (= start!962 b!3601))

(declare-fun m!4017 () Bool)

(assert (=> b!3601 m!4017))

(declare-fun m!4019 () Bool)

(assert (=> b!3599 m!4019))

(declare-fun m!4021 () Bool)

(assert (=> b!3599 m!4021))

(declare-fun m!4023 () Bool)

(assert (=> b!3599 m!4023))

(declare-fun m!4025 () Bool)

(assert (=> b!3599 m!4025))

(declare-fun m!4027 () Bool)

(assert (=> b!3599 m!4027))

(declare-fun m!4029 () Bool)

(assert (=> start!962 m!4029))

(declare-fun m!4031 () Bool)

(assert (=> start!962 m!4031))

(declare-fun m!4033 () Bool)

(assert (=> b!3602 m!4033))

(declare-fun m!4035 () Bool)

(assert (=> b!3603 m!4035))

(declare-fun m!4037 () Bool)

(assert (=> b!3600 m!4037))

(declare-fun m!4039 () Bool)

(assert (=> b!3600 m!4039))

(declare-fun m!4041 () Bool)

(assert (=> b!3597 m!4041))

(declare-fun m!4043 () Bool)

(assert (=> b!3597 m!4043))

(push 1)

(assert (not start!962))

(assert (not b!3600))

(assert (not b!3602))

(assert (not b!3597))

(assert (not b!3599))

(assert (not b!3601))

(assert (not b!3603))

(check-sat)

(pop 1)

