; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1082 () Bool)

(assert start!1082)

(declare-fun b!4377 () Bool)

(declare-fun res!5741 () Bool)

(declare-fun e!2860 () Bool)

(assert (=> b!4377 (=> (not res!5741) (not e!2860))))

(declare-datatypes ((array!345 0))(
  ( (array!346 (arr!535 (Array (_ BitVec 32) (_ BitVec 8))) (size!145 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!268 0))(
  ( (BitStream!269 (buf!466 array!345) (currentByte!1445 (_ BitVec 32)) (currentBit!1440 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!268)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!4377 (= res!5741 (validate_offset_bits!1 ((_ sign_extend 32) (size!145 (buf!466 thiss!1486))) ((_ sign_extend 32) (currentByte!1445 thiss!1486)) ((_ sign_extend 32) (currentBit!1440 thiss!1486)) nBits!460))))

(declare-fun res!5745 () Bool)

(assert (=> start!1082 (=> (not res!5745) (not e!2860))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!345)

(assert (=> start!1082 (= res!5745 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!145 srcBuffer!6))))))))

(assert (=> start!1082 e!2860))

(assert (=> start!1082 true))

(declare-fun array_inv!140 (array!345) Bool)

(assert (=> start!1082 (array_inv!140 srcBuffer!6)))

(declare-fun e!2861 () Bool)

(declare-fun inv!12 (BitStream!268) Bool)

(assert (=> start!1082 (and (inv!12 thiss!1486) e!2861)))

(declare-fun b!4378 () Bool)

(assert (=> b!4378 (= e!2861 (array_inv!140 (buf!466 thiss!1486)))))

(declare-fun b!4379 () Bool)

(declare-fun res!5744 () Bool)

(declare-fun e!2859 () Bool)

(assert (=> b!4379 (=> (not res!5744) (not e!2859))))

(declare-datatypes ((Unit!340 0))(
  ( (Unit!341) )
))
(declare-datatypes ((tuple2!514 0))(
  ( (tuple2!515 (_1!273 Unit!340) (_2!273 BitStream!268)) )
))
(declare-fun lt!5404 () tuple2!514)

(assert (=> b!4379 (= res!5744 (= (size!145 (buf!466 thiss!1486)) (size!145 (buf!466 (_2!273 lt!5404)))))))

(declare-fun b!4380 () Bool)

(declare-fun res!5742 () Bool)

(assert (=> b!4380 (=> (not res!5742) (not e!2859))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!4380 (= res!5742 (= (bitIndex!0 (size!145 (buf!466 (_2!273 lt!5404))) (currentByte!1445 (_2!273 lt!5404)) (currentBit!1440 (_2!273 lt!5404))) (bvadd (bitIndex!0 (size!145 (buf!466 thiss!1486)) (currentByte!1445 thiss!1486) (currentBit!1440 thiss!1486)) nBits!460)))))

(declare-fun b!4381 () Bool)

(declare-fun res!5746 () Bool)

(assert (=> b!4381 (=> (not res!5746) (not e!2859))))

(declare-fun isPrefixOf!0 (BitStream!268 BitStream!268) Bool)

(assert (=> b!4381 (= res!5746 (isPrefixOf!0 thiss!1486 (_2!273 lt!5404)))))

(declare-fun b!4382 () Bool)

(assert (=> b!4382 (= e!2860 e!2859)))

(declare-fun res!5743 () Bool)

(assert (=> b!4382 (=> (not res!5743) (not e!2859))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!4382 (= res!5743 (invariant!0 (currentBit!1440 (_2!273 lt!5404)) (currentByte!1445 (_2!273 lt!5404)) (size!145 (buf!466 (_2!273 lt!5404)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!268 array!345 (_ BitVec 64) (_ BitVec 64)) tuple2!514)

(assert (=> b!4382 (= lt!5404 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!4383 () Bool)

(assert (=> b!4383 (= e!2859 (not true))))

(declare-datatypes ((List!45 0))(
  ( (Nil!42) (Cons!41 (h!160 Bool) (t!795 List!45)) )
))
(declare-fun lt!5405 () List!45)

(declare-datatypes ((tuple2!516 0))(
  ( (tuple2!517 (_1!274 BitStream!268) (_2!274 BitStream!268)) )
))
(declare-fun lt!5401 () tuple2!516)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!268 BitStream!268 (_ BitVec 64)) List!45)

(assert (=> b!4383 (= lt!5405 (bitStreamReadBitsIntoList!0 (_2!273 lt!5404) (_1!274 lt!5401) nBits!460))))

(declare-datatypes ((tuple2!518 0))(
  ( (tuple2!519 (_1!275 array!345) (_2!275 BitStream!268)) )
))
(declare-fun lt!5402 () tuple2!518)

(declare-fun readBits!0 (BitStream!268 (_ BitVec 64)) tuple2!518)

(assert (=> b!4383 (= lt!5402 (readBits!0 (_1!274 lt!5401) nBits!460))))

(assert (=> b!4383 (validate_offset_bits!1 ((_ sign_extend 32) (size!145 (buf!466 (_2!273 lt!5404)))) ((_ sign_extend 32) (currentByte!1445 thiss!1486)) ((_ sign_extend 32) (currentBit!1440 thiss!1486)) nBits!460)))

(declare-fun lt!5403 () Unit!340)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!268 array!345 (_ BitVec 64)) Unit!340)

(assert (=> b!4383 (= lt!5403 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!466 (_2!273 lt!5404)) nBits!460))))

(declare-fun reader!0 (BitStream!268 BitStream!268) tuple2!516)

(assert (=> b!4383 (= lt!5401 (reader!0 thiss!1486 (_2!273 lt!5404)))))

(assert (= (and start!1082 res!5745) b!4377))

(assert (= (and b!4377 res!5741) b!4382))

(assert (= (and b!4382 res!5743) b!4379))

(assert (= (and b!4379 res!5744) b!4380))

(assert (= (and b!4380 res!5742) b!4381))

(assert (= (and b!4381 res!5746) b!4383))

(assert (= start!1082 b!4378))

(declare-fun m!5169 () Bool)

(assert (=> b!4382 m!5169))

(declare-fun m!5171 () Bool)

(assert (=> b!4382 m!5171))

(declare-fun m!5173 () Bool)

(assert (=> b!4378 m!5173))

(declare-fun m!5175 () Bool)

(assert (=> b!4377 m!5175))

(declare-fun m!5177 () Bool)

(assert (=> b!4383 m!5177))

(declare-fun m!5179 () Bool)

(assert (=> b!4383 m!5179))

(declare-fun m!5181 () Bool)

(assert (=> b!4383 m!5181))

(declare-fun m!5183 () Bool)

(assert (=> b!4383 m!5183))

(declare-fun m!5185 () Bool)

(assert (=> b!4383 m!5185))

(declare-fun m!5187 () Bool)

(assert (=> b!4380 m!5187))

(declare-fun m!5189 () Bool)

(assert (=> b!4380 m!5189))

(declare-fun m!5191 () Bool)

(assert (=> start!1082 m!5191))

(declare-fun m!5193 () Bool)

(assert (=> start!1082 m!5193))

(declare-fun m!5195 () Bool)

(assert (=> b!4381 m!5195))

(push 1)

(assert (not b!4378))

(assert (not b!4381))

(assert (not start!1082))

(assert (not b!4380))

(assert (not b!4382))

(assert (not b!4377))

(assert (not b!4383))

(check-sat)

(pop 1)

