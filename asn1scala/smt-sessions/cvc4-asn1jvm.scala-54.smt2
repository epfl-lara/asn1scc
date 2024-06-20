; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1086 () Bool)

(assert start!1086)

(declare-fun b!4419 () Bool)

(declare-fun res!5780 () Bool)

(declare-fun e!2889 () Bool)

(assert (=> b!4419 (=> (not res!5780) (not e!2889))))

(declare-datatypes ((array!349 0))(
  ( (array!350 (arr!537 (Array (_ BitVec 32) (_ BitVec 8))) (size!147 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!272 0))(
  ( (BitStream!273 (buf!468 array!349) (currentByte!1447 (_ BitVec 32)) (currentBit!1442 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!272)

(declare-datatypes ((Unit!344 0))(
  ( (Unit!345) )
))
(declare-datatypes ((tuple2!526 0))(
  ( (tuple2!527 (_1!279 Unit!344) (_2!279 BitStream!272)) )
))
(declare-fun lt!5432 () tuple2!526)

(assert (=> b!4419 (= res!5780 (= (size!147 (buf!468 thiss!1486)) (size!147 (buf!468 (_2!279 lt!5432)))))))

(declare-fun b!4420 () Bool)

(declare-fun res!5778 () Bool)

(assert (=> b!4420 (=> (not res!5778) (not e!2889))))

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!4420 (= res!5778 (= (bitIndex!0 (size!147 (buf!468 (_2!279 lt!5432))) (currentByte!1447 (_2!279 lt!5432)) (currentBit!1442 (_2!279 lt!5432))) (bvadd (bitIndex!0 (size!147 (buf!468 thiss!1486)) (currentByte!1447 thiss!1486) (currentBit!1442 thiss!1486)) nBits!460)))))

(declare-fun b!4421 () Bool)

(declare-fun e!2887 () Bool)

(declare-fun array_inv!142 (array!349) Bool)

(assert (=> b!4421 (= e!2887 (array_inv!142 (buf!468 thiss!1486)))))

(declare-fun b!4422 () Bool)

(assert (=> b!4422 (= e!2889 (not true))))

(declare-datatypes ((List!47 0))(
  ( (Nil!44) (Cons!43 (h!162 Bool) (t!797 List!47)) )
))
(declare-fun lt!5434 () List!47)

(declare-datatypes ((tuple2!528 0))(
  ( (tuple2!529 (_1!280 BitStream!272) (_2!280 BitStream!272)) )
))
(declare-fun lt!5435 () tuple2!528)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!272 BitStream!272 (_ BitVec 64)) List!47)

(assert (=> b!4422 (= lt!5434 (bitStreamReadBitsIntoList!0 (_2!279 lt!5432) (_1!280 lt!5435) nBits!460))))

(declare-datatypes ((tuple2!530 0))(
  ( (tuple2!531 (_1!281 array!349) (_2!281 BitStream!272)) )
))
(declare-fun lt!5431 () tuple2!530)

(declare-fun readBits!0 (BitStream!272 (_ BitVec 64)) tuple2!530)

(assert (=> b!4422 (= lt!5431 (readBits!0 (_1!280 lt!5435) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!4422 (validate_offset_bits!1 ((_ sign_extend 32) (size!147 (buf!468 (_2!279 lt!5432)))) ((_ sign_extend 32) (currentByte!1447 thiss!1486)) ((_ sign_extend 32) (currentBit!1442 thiss!1486)) nBits!460)))

(declare-fun lt!5433 () Unit!344)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!272 array!349 (_ BitVec 64)) Unit!344)

(assert (=> b!4422 (= lt!5433 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!468 (_2!279 lt!5432)) nBits!460))))

(declare-fun reader!0 (BitStream!272 BitStream!272) tuple2!528)

(assert (=> b!4422 (= lt!5435 (reader!0 thiss!1486 (_2!279 lt!5432)))))

(declare-fun b!4423 () Bool)

(declare-fun res!5781 () Bool)

(declare-fun e!2888 () Bool)

(assert (=> b!4423 (=> (not res!5781) (not e!2888))))

(assert (=> b!4423 (= res!5781 (validate_offset_bits!1 ((_ sign_extend 32) (size!147 (buf!468 thiss!1486))) ((_ sign_extend 32) (currentByte!1447 thiss!1486)) ((_ sign_extend 32) (currentBit!1442 thiss!1486)) nBits!460))))

(declare-fun res!5782 () Bool)

(assert (=> start!1086 (=> (not res!5782) (not e!2888))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!349)

(assert (=> start!1086 (= res!5782 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!147 srcBuffer!6))))))))

(assert (=> start!1086 e!2888))

(assert (=> start!1086 true))

(assert (=> start!1086 (array_inv!142 srcBuffer!6)))

(declare-fun inv!12 (BitStream!272) Bool)

(assert (=> start!1086 (and (inv!12 thiss!1486) e!2887)))

(declare-fun b!4424 () Bool)

(assert (=> b!4424 (= e!2888 e!2889)))

(declare-fun res!5777 () Bool)

(assert (=> b!4424 (=> (not res!5777) (not e!2889))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!4424 (= res!5777 (invariant!0 (currentBit!1442 (_2!279 lt!5432)) (currentByte!1447 (_2!279 lt!5432)) (size!147 (buf!468 (_2!279 lt!5432)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!272 array!349 (_ BitVec 64) (_ BitVec 64)) tuple2!526)

(assert (=> b!4424 (= lt!5432 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!4425 () Bool)

(declare-fun res!5779 () Bool)

(assert (=> b!4425 (=> (not res!5779) (not e!2889))))

(declare-fun isPrefixOf!0 (BitStream!272 BitStream!272) Bool)

(assert (=> b!4425 (= res!5779 (isPrefixOf!0 thiss!1486 (_2!279 lt!5432)))))

(assert (= (and start!1086 res!5782) b!4423))

(assert (= (and b!4423 res!5781) b!4424))

(assert (= (and b!4424 res!5777) b!4419))

(assert (= (and b!4419 res!5780) b!4420))

(assert (= (and b!4420 res!5778) b!4425))

(assert (= (and b!4425 res!5779) b!4422))

(assert (= start!1086 b!4421))

(declare-fun m!5225 () Bool)

(assert (=> b!4422 m!5225))

(declare-fun m!5227 () Bool)

(assert (=> b!4422 m!5227))

(declare-fun m!5229 () Bool)

(assert (=> b!4422 m!5229))

(declare-fun m!5231 () Bool)

(assert (=> b!4422 m!5231))

(declare-fun m!5233 () Bool)

(assert (=> b!4422 m!5233))

(declare-fun m!5235 () Bool)

(assert (=> b!4424 m!5235))

(declare-fun m!5237 () Bool)

(assert (=> b!4424 m!5237))

(declare-fun m!5239 () Bool)

(assert (=> start!1086 m!5239))

(declare-fun m!5241 () Bool)

(assert (=> start!1086 m!5241))

(declare-fun m!5243 () Bool)

(assert (=> b!4425 m!5243))

(declare-fun m!5245 () Bool)

(assert (=> b!4420 m!5245))

(declare-fun m!5247 () Bool)

(assert (=> b!4420 m!5247))

(declare-fun m!5249 () Bool)

(assert (=> b!4423 m!5249))

(declare-fun m!5251 () Bool)

(assert (=> b!4421 m!5251))

(push 1)

(assert (not b!4425))

(assert (not b!4421))

(assert (not start!1086))

(assert (not b!4423))

(assert (not b!4424))

(assert (not b!4420))

(assert (not b!4422))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

