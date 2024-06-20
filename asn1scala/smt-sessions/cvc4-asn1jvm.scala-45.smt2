; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!960 () Bool)

(assert start!960)

(declare-fun b!3576 () Bool)

(declare-fun res!5108 () Bool)

(declare-fun e!2362 () Bool)

(assert (=> b!3576 (=> (not res!5108) (not e!2362))))

(declare-datatypes ((array!292 0))(
  ( (array!293 (arr!507 (Array (_ BitVec 32) (_ BitVec 8))) (size!120 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!218 0))(
  ( (BitStream!219 (buf!438 array!292) (currentByte!1411 (_ BitVec 32)) (currentBit!1406 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!266 0))(
  ( (Unit!267) )
))
(declare-datatypes ((tuple2!352 0))(
  ( (tuple2!353 (_1!189 Unit!266) (_2!189 BitStream!218)) )
))
(declare-fun lt!4283 () tuple2!352)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun thiss!1486 () BitStream!218)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!3576 (= res!5108 (= (bitIndex!0 (size!120 (buf!438 (_2!189 lt!4283))) (currentByte!1411 (_2!189 lt!4283)) (currentBit!1406 (_2!189 lt!4283))) (bvadd (bitIndex!0 (size!120 (buf!438 thiss!1486)) (currentByte!1411 thiss!1486) (currentBit!1406 thiss!1486)) nBits!460)))))

(declare-fun b!3577 () Bool)

(declare-fun e!2366 () Bool)

(declare-fun array_inv!115 (array!292) Bool)

(assert (=> b!3577 (= e!2366 (array_inv!115 (buf!438 thiss!1486)))))

(declare-fun b!3578 () Bool)

(declare-fun e!2365 () Bool)

(assert (=> b!3578 (= e!2365 e!2362)))

(declare-fun res!5106 () Bool)

(assert (=> b!3578 (=> (not res!5106) (not e!2362))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!3578 (= res!5106 (invariant!0 (currentBit!1406 (_2!189 lt!4283)) (currentByte!1411 (_2!189 lt!4283)) (size!120 (buf!438 (_2!189 lt!4283)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!292)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!218 array!292 (_ BitVec 64) (_ BitVec 64)) tuple2!352)

(assert (=> b!3578 (= lt!4283 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!3579 () Bool)

(assert (=> b!3579 (= e!2362 (not true))))

(declare-datatypes ((List!20 0))(
  ( (Nil!17) (Cons!16 (h!135 Bool) (t!770 List!20)) )
))
(declare-fun lt!4282 () List!20)

(declare-datatypes ((tuple2!354 0))(
  ( (tuple2!355 (_1!190 BitStream!218) (_2!190 BitStream!218)) )
))
(declare-fun lt!4281 () tuple2!354)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!218 BitStream!218 (_ BitVec 64)) List!20)

(assert (=> b!3579 (= lt!4282 (bitStreamReadBitsIntoList!0 (_2!189 lt!4283) (_1!190 lt!4281) nBits!460))))

(declare-datatypes ((tuple2!356 0))(
  ( (tuple2!357 (_1!191 array!292) (_2!191 BitStream!218)) )
))
(declare-fun lt!4280 () tuple2!356)

(declare-fun readBits!0 (BitStream!218 (_ BitVec 64)) tuple2!356)

(assert (=> b!3579 (= lt!4280 (readBits!0 (_1!190 lt!4281) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!3579 (validate_offset_bits!1 ((_ sign_extend 32) (size!120 (buf!438 (_2!189 lt!4283)))) ((_ sign_extend 32) (currentByte!1411 thiss!1486)) ((_ sign_extend 32) (currentBit!1406 thiss!1486)) nBits!460)))

(declare-fun lt!4279 () Unit!266)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!218 array!292 (_ BitVec 64)) Unit!266)

(assert (=> b!3579 (= lt!4279 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!438 (_2!189 lt!4283)) nBits!460))))

(declare-fun reader!0 (BitStream!218 BitStream!218) tuple2!354)

(assert (=> b!3579 (= lt!4281 (reader!0 thiss!1486 (_2!189 lt!4283)))))

(declare-fun b!3581 () Bool)

(declare-fun res!5110 () Bool)

(assert (=> b!3581 (=> (not res!5110) (not e!2362))))

(declare-fun isPrefixOf!0 (BitStream!218 BitStream!218) Bool)

(assert (=> b!3581 (= res!5110 (isPrefixOf!0 thiss!1486 (_2!189 lt!4283)))))

(declare-fun b!3582 () Bool)

(declare-fun res!5107 () Bool)

(assert (=> b!3582 (=> (not res!5107) (not e!2365))))

(assert (=> b!3582 (= res!5107 (validate_offset_bits!1 ((_ sign_extend 32) (size!120 (buf!438 thiss!1486))) ((_ sign_extend 32) (currentByte!1411 thiss!1486)) ((_ sign_extend 32) (currentBit!1406 thiss!1486)) nBits!460))))

(declare-fun res!5109 () Bool)

(assert (=> start!960 (=> (not res!5109) (not e!2365))))

(assert (=> start!960 (= res!5109 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!120 srcBuffer!6))))))))

(assert (=> start!960 e!2365))

(assert (=> start!960 true))

(assert (=> start!960 (array_inv!115 srcBuffer!6)))

(declare-fun inv!12 (BitStream!218) Bool)

(assert (=> start!960 (and (inv!12 thiss!1486) e!2366)))

(declare-fun b!3580 () Bool)

(declare-fun res!5105 () Bool)

(assert (=> b!3580 (=> (not res!5105) (not e!2362))))

(assert (=> b!3580 (= res!5105 (= (size!120 (buf!438 thiss!1486)) (size!120 (buf!438 (_2!189 lt!4283)))))))

(assert (= (and start!960 res!5109) b!3582))

(assert (= (and b!3582 res!5107) b!3578))

(assert (= (and b!3578 res!5106) b!3580))

(assert (= (and b!3580 res!5105) b!3576))

(assert (= (and b!3576 res!5108) b!3581))

(assert (= (and b!3581 res!5110) b!3579))

(assert (= start!960 b!3577))

(declare-fun m!3989 () Bool)

(assert (=> b!3579 m!3989))

(declare-fun m!3991 () Bool)

(assert (=> b!3579 m!3991))

(declare-fun m!3993 () Bool)

(assert (=> b!3579 m!3993))

(declare-fun m!3995 () Bool)

(assert (=> b!3579 m!3995))

(declare-fun m!3997 () Bool)

(assert (=> b!3579 m!3997))

(declare-fun m!3999 () Bool)

(assert (=> b!3577 m!3999))

(declare-fun m!4001 () Bool)

(assert (=> start!960 m!4001))

(declare-fun m!4003 () Bool)

(assert (=> start!960 m!4003))

(declare-fun m!4005 () Bool)

(assert (=> b!3582 m!4005))

(declare-fun m!4007 () Bool)

(assert (=> b!3581 m!4007))

(declare-fun m!4009 () Bool)

(assert (=> b!3578 m!4009))

(declare-fun m!4011 () Bool)

(assert (=> b!3578 m!4011))

(declare-fun m!4013 () Bool)

(assert (=> b!3576 m!4013))

(declare-fun m!4015 () Bool)

(assert (=> b!3576 m!4015))

(push 1)

(assert (not b!3576))

(assert (not b!3578))

(assert (not b!3577))

(assert (not start!960))

(assert (not b!3582))

(assert (not b!3581))

(assert (not b!3579))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

