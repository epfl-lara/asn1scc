; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!966 () Bool)

(assert start!966)

(declare-fun b!3639 () Bool)

(declare-fun e!2410 () Bool)

(declare-fun e!2407 () Bool)

(assert (=> b!3639 (= e!2410 e!2407)))

(declare-fun res!5163 () Bool)

(assert (=> b!3639 (=> (not res!5163) (not e!2407))))

(declare-datatypes ((array!298 0))(
  ( (array!299 (arr!510 (Array (_ BitVec 32) (_ BitVec 8))) (size!123 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!224 0))(
  ( (BitStream!225 (buf!441 array!298) (currentByte!1414 (_ BitVec 32)) (currentBit!1409 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!272 0))(
  ( (Unit!273) )
))
(declare-datatypes ((tuple2!370 0))(
  ( (tuple2!371 (_1!198 Unit!272) (_2!198 BitStream!224)) )
))
(declare-fun lt!4328 () tuple2!370)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!3639 (= res!5163 (invariant!0 (currentBit!1409 (_2!198 lt!4328)) (currentByte!1414 (_2!198 lt!4328)) (size!123 (buf!441 (_2!198 lt!4328)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!298)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun thiss!1486 () BitStream!224)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!224 array!298 (_ BitVec 64) (_ BitVec 64)) tuple2!370)

(assert (=> b!3639 (= lt!4328 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!3640 () Bool)

(declare-fun e!2411 () Bool)

(declare-fun array_inv!118 (array!298) Bool)

(assert (=> b!3640 (= e!2411 (array_inv!118 (buf!441 thiss!1486)))))

(declare-fun b!3642 () Bool)

(declare-fun res!5161 () Bool)

(assert (=> b!3642 (=> (not res!5161) (not e!2407))))

(assert (=> b!3642 (= res!5161 (= (size!123 (buf!441 thiss!1486)) (size!123 (buf!441 (_2!198 lt!4328)))))))

(declare-fun b!3643 () Bool)

(declare-fun res!5162 () Bool)

(assert (=> b!3643 (=> (not res!5162) (not e!2407))))

(declare-fun isPrefixOf!0 (BitStream!224 BitStream!224) Bool)

(assert (=> b!3643 (= res!5162 (isPrefixOf!0 thiss!1486 (_2!198 lt!4328)))))

(declare-fun b!3644 () Bool)

(declare-fun res!5159 () Bool)

(assert (=> b!3644 (=> (not res!5159) (not e!2407))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!3644 (= res!5159 (= (bitIndex!0 (size!123 (buf!441 (_2!198 lt!4328))) (currentByte!1414 (_2!198 lt!4328)) (currentBit!1409 (_2!198 lt!4328))) (bvadd (bitIndex!0 (size!123 (buf!441 thiss!1486)) (currentByte!1414 thiss!1486) (currentBit!1409 thiss!1486)) nBits!460)))))

(declare-fun b!3645 () Bool)

(assert (=> b!3645 (= e!2407 (not true))))

(declare-datatypes ((tuple2!372 0))(
  ( (tuple2!373 (_1!199 BitStream!224) (_2!199 BitStream!224)) )
))
(declare-fun lt!4326 () tuple2!372)

(declare-datatypes ((List!23 0))(
  ( (Nil!20) (Cons!19 (h!138 Bool) (t!773 List!23)) )
))
(declare-fun lt!4324 () List!23)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!224 BitStream!224 (_ BitVec 64)) List!23)

(assert (=> b!3645 (= lt!4324 (bitStreamReadBitsIntoList!0 (_2!198 lt!4328) (_1!199 lt!4326) nBits!460))))

(declare-datatypes ((tuple2!374 0))(
  ( (tuple2!375 (_1!200 array!298) (_2!200 BitStream!224)) )
))
(declare-fun lt!4325 () tuple2!374)

(declare-fun readBits!0 (BitStream!224 (_ BitVec 64)) tuple2!374)

(assert (=> b!3645 (= lt!4325 (readBits!0 (_1!199 lt!4326) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!3645 (validate_offset_bits!1 ((_ sign_extend 32) (size!123 (buf!441 (_2!198 lt!4328)))) ((_ sign_extend 32) (currentByte!1414 thiss!1486)) ((_ sign_extend 32) (currentBit!1409 thiss!1486)) nBits!460)))

(declare-fun lt!4327 () Unit!272)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!224 array!298 (_ BitVec 64)) Unit!272)

(assert (=> b!3645 (= lt!4327 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!441 (_2!198 lt!4328)) nBits!460))))

(declare-fun reader!0 (BitStream!224 BitStream!224) tuple2!372)

(assert (=> b!3645 (= lt!4326 (reader!0 thiss!1486 (_2!198 lt!4328)))))

(declare-fun res!5164 () Bool)

(assert (=> start!966 (=> (not res!5164) (not e!2410))))

(assert (=> start!966 (= res!5164 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!123 srcBuffer!6))))))))

(assert (=> start!966 e!2410))

(assert (=> start!966 true))

(assert (=> start!966 (array_inv!118 srcBuffer!6)))

(declare-fun inv!12 (BitStream!224) Bool)

(assert (=> start!966 (and (inv!12 thiss!1486) e!2411)))

(declare-fun b!3641 () Bool)

(declare-fun res!5160 () Bool)

(assert (=> b!3641 (=> (not res!5160) (not e!2410))))

(assert (=> b!3641 (= res!5160 (validate_offset_bits!1 ((_ sign_extend 32) (size!123 (buf!441 thiss!1486))) ((_ sign_extend 32) (currentByte!1414 thiss!1486)) ((_ sign_extend 32) (currentBit!1409 thiss!1486)) nBits!460))))

(assert (= (and start!966 res!5164) b!3641))

(assert (= (and b!3641 res!5160) b!3639))

(assert (= (and b!3639 res!5163) b!3642))

(assert (= (and b!3642 res!5161) b!3644))

(assert (= (and b!3644 res!5159) b!3643))

(assert (= (and b!3643 res!5162) b!3645))

(assert (= start!966 b!3640))

(declare-fun m!4073 () Bool)

(assert (=> b!3641 m!4073))

(declare-fun m!4075 () Bool)

(assert (=> b!3644 m!4075))

(declare-fun m!4077 () Bool)

(assert (=> b!3644 m!4077))

(declare-fun m!4079 () Bool)

(assert (=> start!966 m!4079))

(declare-fun m!4081 () Bool)

(assert (=> start!966 m!4081))

(declare-fun m!4083 () Bool)

(assert (=> b!3643 m!4083))

(declare-fun m!4085 () Bool)

(assert (=> b!3645 m!4085))

(declare-fun m!4087 () Bool)

(assert (=> b!3645 m!4087))

(declare-fun m!4089 () Bool)

(assert (=> b!3645 m!4089))

(declare-fun m!4091 () Bool)

(assert (=> b!3645 m!4091))

(declare-fun m!4093 () Bool)

(assert (=> b!3645 m!4093))

(declare-fun m!4095 () Bool)

(assert (=> b!3639 m!4095))

(declare-fun m!4097 () Bool)

(assert (=> b!3639 m!4097))

(declare-fun m!4099 () Bool)

(assert (=> b!3640 m!4099))

(push 1)

(assert (not start!966))

(assert (not b!3640))

(assert (not b!3641))

(assert (not b!3643))

(assert (not b!3644))

(assert (not b!3639))

(assert (not b!3645))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

