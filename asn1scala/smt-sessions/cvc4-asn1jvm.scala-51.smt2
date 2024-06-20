; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1068 () Bool)

(assert start!1068)

(declare-fun b!4230 () Bool)

(declare-fun res!5615 () Bool)

(declare-fun e!2752 () Bool)

(assert (=> b!4230 (=> (not res!5615) (not e!2752))))

(declare-datatypes ((array!331 0))(
  ( (array!332 (arr!528 (Array (_ BitVec 32) (_ BitVec 8))) (size!138 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!254 0))(
  ( (BitStream!255 (buf!459 array!331) (currentByte!1438 (_ BitVec 32)) (currentBit!1433 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!254)

(declare-datatypes ((Unit!326 0))(
  ( (Unit!327) )
))
(declare-datatypes ((tuple2!472 0))(
  ( (tuple2!473 (_1!252 Unit!326) (_2!252 BitStream!254)) )
))
(declare-fun lt!5297 () tuple2!472)

(assert (=> b!4230 (= res!5615 (= (size!138 (buf!459 thiss!1486)) (size!138 (buf!459 (_2!252 lt!5297)))))))

(declare-fun b!4231 () Bool)

(declare-fun res!5620 () Bool)

(declare-fun e!2753 () Bool)

(assert (=> b!4231 (=> (not res!5620) (not e!2753))))

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!4231 (= res!5620 (validate_offset_bits!1 ((_ sign_extend 32) (size!138 (buf!459 thiss!1486))) ((_ sign_extend 32) (currentByte!1438 thiss!1486)) ((_ sign_extend 32) (currentBit!1433 thiss!1486)) nBits!460))))

(declare-fun b!4232 () Bool)

(assert (=> b!4232 (= e!2753 e!2752)))

(declare-fun res!5619 () Bool)

(assert (=> b!4232 (=> (not res!5619) (not e!2752))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!4232 (= res!5619 (invariant!0 (currentBit!1433 (_2!252 lt!5297)) (currentByte!1438 (_2!252 lt!5297)) (size!138 (buf!459 (_2!252 lt!5297)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!331)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!254 array!331 (_ BitVec 64) (_ BitVec 64)) tuple2!472)

(assert (=> b!4232 (= lt!5297 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun res!5618 () Bool)

(assert (=> start!1068 (=> (not res!5618) (not e!2753))))

(assert (=> start!1068 (= res!5618 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!138 srcBuffer!6))))))))

(assert (=> start!1068 e!2753))

(assert (=> start!1068 true))

(declare-fun array_inv!133 (array!331) Bool)

(assert (=> start!1068 (array_inv!133 srcBuffer!6)))

(declare-fun e!2755 () Bool)

(declare-fun inv!12 (BitStream!254) Bool)

(assert (=> start!1068 (and (inv!12 thiss!1486) e!2755)))

(declare-fun b!4233 () Bool)

(assert (=> b!4233 (= e!2752 (not true))))

(declare-datatypes ((tuple2!474 0))(
  ( (tuple2!475 (_1!253 BitStream!254) (_2!253 BitStream!254)) )
))
(declare-fun lt!5299 () tuple2!474)

(declare-datatypes ((List!38 0))(
  ( (Nil!35) (Cons!34 (h!153 Bool) (t!788 List!38)) )
))
(declare-fun lt!5296 () List!38)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!254 BitStream!254 (_ BitVec 64)) List!38)

(assert (=> b!4233 (= lt!5296 (bitStreamReadBitsIntoList!0 (_2!252 lt!5297) (_1!253 lt!5299) nBits!460))))

(declare-datatypes ((tuple2!476 0))(
  ( (tuple2!477 (_1!254 array!331) (_2!254 BitStream!254)) )
))
(declare-fun lt!5300 () tuple2!476)

(declare-fun readBits!0 (BitStream!254 (_ BitVec 64)) tuple2!476)

(assert (=> b!4233 (= lt!5300 (readBits!0 (_1!253 lt!5299) nBits!460))))

(assert (=> b!4233 (validate_offset_bits!1 ((_ sign_extend 32) (size!138 (buf!459 (_2!252 lt!5297)))) ((_ sign_extend 32) (currentByte!1438 thiss!1486)) ((_ sign_extend 32) (currentBit!1433 thiss!1486)) nBits!460)))

(declare-fun lt!5298 () Unit!326)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!254 array!331 (_ BitVec 64)) Unit!326)

(assert (=> b!4233 (= lt!5298 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!459 (_2!252 lt!5297)) nBits!460))))

(declare-fun reader!0 (BitStream!254 BitStream!254) tuple2!474)

(assert (=> b!4233 (= lt!5299 (reader!0 thiss!1486 (_2!252 lt!5297)))))

(declare-fun b!4234 () Bool)

(declare-fun res!5616 () Bool)

(assert (=> b!4234 (=> (not res!5616) (not e!2752))))

(declare-fun isPrefixOf!0 (BitStream!254 BitStream!254) Bool)

(assert (=> b!4234 (= res!5616 (isPrefixOf!0 thiss!1486 (_2!252 lt!5297)))))

(declare-fun b!4235 () Bool)

(assert (=> b!4235 (= e!2755 (array_inv!133 (buf!459 thiss!1486)))))

(declare-fun b!4236 () Bool)

(declare-fun res!5617 () Bool)

(assert (=> b!4236 (=> (not res!5617) (not e!2752))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!4236 (= res!5617 (= (bitIndex!0 (size!138 (buf!459 (_2!252 lt!5297))) (currentByte!1438 (_2!252 lt!5297)) (currentBit!1433 (_2!252 lt!5297))) (bvadd (bitIndex!0 (size!138 (buf!459 thiss!1486)) (currentByte!1438 thiss!1486) (currentBit!1433 thiss!1486)) nBits!460)))))

(assert (= (and start!1068 res!5618) b!4231))

(assert (= (and b!4231 res!5620) b!4232))

(assert (= (and b!4232 res!5619) b!4230))

(assert (= (and b!4230 res!5615) b!4236))

(assert (= (and b!4236 res!5617) b!4234))

(assert (= (and b!4234 res!5616) b!4233))

(assert (= start!1068 b!4235))

(declare-fun m!4973 () Bool)

(assert (=> b!4233 m!4973))

(declare-fun m!4975 () Bool)

(assert (=> b!4233 m!4975))

(declare-fun m!4977 () Bool)

(assert (=> b!4233 m!4977))

(declare-fun m!4979 () Bool)

(assert (=> b!4233 m!4979))

(declare-fun m!4981 () Bool)

(assert (=> b!4233 m!4981))

(declare-fun m!4983 () Bool)

(assert (=> start!1068 m!4983))

(declare-fun m!4985 () Bool)

(assert (=> start!1068 m!4985))

(declare-fun m!4987 () Bool)

(assert (=> b!4232 m!4987))

(declare-fun m!4989 () Bool)

(assert (=> b!4232 m!4989))

(declare-fun m!4991 () Bool)

(assert (=> b!4235 m!4991))

(declare-fun m!4993 () Bool)

(assert (=> b!4231 m!4993))

(declare-fun m!4995 () Bool)

(assert (=> b!4236 m!4995))

(declare-fun m!4997 () Bool)

(assert (=> b!4236 m!4997))

(declare-fun m!4999 () Bool)

(assert (=> b!4234 m!4999))

(push 1)

(assert (not b!4233))

(assert (not b!4235))

(assert (not b!4231))

(assert (not b!4236))

(assert (not b!4234))

(assert (not b!4232))

(assert (not start!1068))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

