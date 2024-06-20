; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1064 () Bool)

(assert start!1064)

(declare-fun b!4188 () Bool)

(declare-fun res!5580 () Bool)

(declare-fun e!2722 () Bool)

(assert (=> b!4188 (=> (not res!5580) (not e!2722))))

(declare-datatypes ((array!327 0))(
  ( (array!328 (arr!526 (Array (_ BitVec 32) (_ BitVec 8))) (size!136 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!250 0))(
  ( (BitStream!251 (buf!457 array!327) (currentByte!1436 (_ BitVec 32)) (currentBit!1431 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!250)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!4188 (= res!5580 (validate_offset_bits!1 ((_ sign_extend 32) (size!136 (buf!457 thiss!1486))) ((_ sign_extend 32) (currentByte!1436 thiss!1486)) ((_ sign_extend 32) (currentBit!1431 thiss!1486)) nBits!460))))

(declare-fun b!4189 () Bool)

(declare-fun res!5581 () Bool)

(declare-fun e!2723 () Bool)

(assert (=> b!4189 (=> (not res!5581) (not e!2723))))

(declare-datatypes ((Unit!322 0))(
  ( (Unit!323) )
))
(declare-datatypes ((tuple2!460 0))(
  ( (tuple2!461 (_1!246 Unit!322) (_2!246 BitStream!250)) )
))
(declare-fun lt!5268 () tuple2!460)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!4189 (= res!5581 (= (bitIndex!0 (size!136 (buf!457 (_2!246 lt!5268))) (currentByte!1436 (_2!246 lt!5268)) (currentBit!1431 (_2!246 lt!5268))) (bvadd (bitIndex!0 (size!136 (buf!457 thiss!1486)) (currentByte!1436 thiss!1486) (currentBit!1431 thiss!1486)) nBits!460)))))

(declare-fun res!5583 () Bool)

(assert (=> start!1064 (=> (not res!5583) (not e!2722))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!327)

(assert (=> start!1064 (= res!5583 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!136 srcBuffer!6))))))))

(assert (=> start!1064 e!2722))

(assert (=> start!1064 true))

(declare-fun array_inv!131 (array!327) Bool)

(assert (=> start!1064 (array_inv!131 srcBuffer!6)))

(declare-fun e!2724 () Bool)

(declare-fun inv!12 (BitStream!250) Bool)

(assert (=> start!1064 (and (inv!12 thiss!1486) e!2724)))

(declare-fun b!4190 () Bool)

(assert (=> b!4190 (= e!2724 (array_inv!131 (buf!457 thiss!1486)))))

(declare-fun b!4191 () Bool)

(declare-fun res!5584 () Bool)

(assert (=> b!4191 (=> (not res!5584) (not e!2723))))

(assert (=> b!4191 (= res!5584 (= (size!136 (buf!457 thiss!1486)) (size!136 (buf!457 (_2!246 lt!5268)))))))

(declare-fun b!4192 () Bool)

(assert (=> b!4192 (= e!2722 e!2723)))

(declare-fun res!5582 () Bool)

(assert (=> b!4192 (=> (not res!5582) (not e!2723))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!4192 (= res!5582 (invariant!0 (currentBit!1431 (_2!246 lt!5268)) (currentByte!1436 (_2!246 lt!5268)) (size!136 (buf!457 (_2!246 lt!5268)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!250 array!327 (_ BitVec 64) (_ BitVec 64)) tuple2!460)

(assert (=> b!4192 (= lt!5268 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!4193 () Bool)

(assert (=> b!4193 (= e!2723 (not true))))

(declare-datatypes ((tuple2!462 0))(
  ( (tuple2!463 (_1!247 BitStream!250) (_2!247 BitStream!250)) )
))
(declare-fun lt!5269 () tuple2!462)

(declare-datatypes ((List!36 0))(
  ( (Nil!33) (Cons!32 (h!151 Bool) (t!786 List!36)) )
))
(declare-fun lt!5266 () List!36)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!250 BitStream!250 (_ BitVec 64)) List!36)

(assert (=> b!4193 (= lt!5266 (bitStreamReadBitsIntoList!0 (_2!246 lt!5268) (_1!247 lt!5269) nBits!460))))

(declare-datatypes ((tuple2!464 0))(
  ( (tuple2!465 (_1!248 array!327) (_2!248 BitStream!250)) )
))
(declare-fun lt!5267 () tuple2!464)

(declare-fun readBits!0 (BitStream!250 (_ BitVec 64)) tuple2!464)

(assert (=> b!4193 (= lt!5267 (readBits!0 (_1!247 lt!5269) nBits!460))))

(assert (=> b!4193 (validate_offset_bits!1 ((_ sign_extend 32) (size!136 (buf!457 (_2!246 lt!5268)))) ((_ sign_extend 32) (currentByte!1436 thiss!1486)) ((_ sign_extend 32) (currentBit!1431 thiss!1486)) nBits!460)))

(declare-fun lt!5270 () Unit!322)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!250 array!327 (_ BitVec 64)) Unit!322)

(assert (=> b!4193 (= lt!5270 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!457 (_2!246 lt!5268)) nBits!460))))

(declare-fun reader!0 (BitStream!250 BitStream!250) tuple2!462)

(assert (=> b!4193 (= lt!5269 (reader!0 thiss!1486 (_2!246 lt!5268)))))

(declare-fun b!4194 () Bool)

(declare-fun res!5579 () Bool)

(assert (=> b!4194 (=> (not res!5579) (not e!2723))))

(declare-fun isPrefixOf!0 (BitStream!250 BitStream!250) Bool)

(assert (=> b!4194 (= res!5579 (isPrefixOf!0 thiss!1486 (_2!246 lt!5268)))))

(assert (= (and start!1064 res!5583) b!4188))

(assert (= (and b!4188 res!5580) b!4192))

(assert (= (and b!4192 res!5582) b!4191))

(assert (= (and b!4191 res!5584) b!4189))

(assert (= (and b!4189 res!5581) b!4194))

(assert (= (and b!4194 res!5579) b!4193))

(assert (= start!1064 b!4190))

(declare-fun m!4917 () Bool)

(assert (=> b!4193 m!4917))

(declare-fun m!4919 () Bool)

(assert (=> b!4193 m!4919))

(declare-fun m!4921 () Bool)

(assert (=> b!4193 m!4921))

(declare-fun m!4923 () Bool)

(assert (=> b!4193 m!4923))

(declare-fun m!4925 () Bool)

(assert (=> b!4193 m!4925))

(declare-fun m!4927 () Bool)

(assert (=> b!4189 m!4927))

(declare-fun m!4929 () Bool)

(assert (=> b!4189 m!4929))

(declare-fun m!4931 () Bool)

(assert (=> b!4190 m!4931))

(declare-fun m!4933 () Bool)

(assert (=> b!4188 m!4933))

(declare-fun m!4935 () Bool)

(assert (=> b!4192 m!4935))

(declare-fun m!4937 () Bool)

(assert (=> b!4192 m!4937))

(declare-fun m!4939 () Bool)

(assert (=> b!4194 m!4939))

(declare-fun m!4941 () Bool)

(assert (=> start!1064 m!4941))

(declare-fun m!4943 () Bool)

(assert (=> start!1064 m!4943))

(push 1)

(assert (not b!4189))

(assert (not b!4193))

(assert (not b!4190))

(assert (not b!4194))

(assert (not b!4188))

(assert (not start!1064))

(assert (not b!4192))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

