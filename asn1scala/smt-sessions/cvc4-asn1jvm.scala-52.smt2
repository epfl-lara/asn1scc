; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1074 () Bool)

(assert start!1074)

(declare-fun b!4293 () Bool)

(declare-fun res!5672 () Bool)

(declare-fun e!2797 () Bool)

(assert (=> b!4293 (=> (not res!5672) (not e!2797))))

(declare-datatypes ((array!337 0))(
  ( (array!338 (arr!531 (Array (_ BitVec 32) (_ BitVec 8))) (size!141 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!260 0))(
  ( (BitStream!261 (buf!462 array!337) (currentByte!1441 (_ BitVec 32)) (currentBit!1436 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!260)

(declare-datatypes ((Unit!332 0))(
  ( (Unit!333) )
))
(declare-datatypes ((tuple2!490 0))(
  ( (tuple2!491 (_1!261 Unit!332) (_2!261 BitStream!260)) )
))
(declare-fun lt!5344 () tuple2!490)

(declare-fun isPrefixOf!0 (BitStream!260 BitStream!260) Bool)

(assert (=> b!4293 (= res!5672 (isPrefixOf!0 thiss!1486 (_2!261 lt!5344)))))

(declare-fun b!4294 () Bool)

(declare-fun res!5670 () Bool)

(assert (=> b!4294 (=> (not res!5670) (not e!2797))))

(assert (=> b!4294 (= res!5670 (= (size!141 (buf!462 thiss!1486)) (size!141 (buf!462 (_2!261 lt!5344)))))))

(declare-fun b!4295 () Bool)

(declare-fun e!2798 () Bool)

(declare-fun array_inv!136 (array!337) Bool)

(assert (=> b!4295 (= e!2798 (array_inv!136 (buf!462 thiss!1486)))))

(declare-fun b!4296 () Bool)

(declare-fun res!5673 () Bool)

(declare-fun e!2799 () Bool)

(assert (=> b!4296 (=> (not res!5673) (not e!2799))))

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!4296 (= res!5673 (validate_offset_bits!1 ((_ sign_extend 32) (size!141 (buf!462 thiss!1486))) ((_ sign_extend 32) (currentByte!1441 thiss!1486)) ((_ sign_extend 32) (currentBit!1436 thiss!1486)) nBits!460))))

(declare-fun b!4297 () Bool)

(assert (=> b!4297 (= e!2799 e!2797)))

(declare-fun res!5671 () Bool)

(assert (=> b!4297 (=> (not res!5671) (not e!2797))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!4297 (= res!5671 (invariant!0 (currentBit!1436 (_2!261 lt!5344)) (currentByte!1441 (_2!261 lt!5344)) (size!141 (buf!462 (_2!261 lt!5344)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!337)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!260 array!337 (_ BitVec 64) (_ BitVec 64)) tuple2!490)

(assert (=> b!4297 (= lt!5344 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!4298 () Bool)

(declare-fun res!5669 () Bool)

(assert (=> b!4298 (=> (not res!5669) (not e!2797))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!4298 (= res!5669 (= (bitIndex!0 (size!141 (buf!462 (_2!261 lt!5344))) (currentByte!1441 (_2!261 lt!5344)) (currentBit!1436 (_2!261 lt!5344))) (bvadd (bitIndex!0 (size!141 (buf!462 thiss!1486)) (currentByte!1441 thiss!1486) (currentBit!1436 thiss!1486)) nBits!460)))))

(declare-fun b!4299 () Bool)

(assert (=> b!4299 (= e!2797 (not true))))

(declare-datatypes ((tuple2!492 0))(
  ( (tuple2!493 (_1!262 BitStream!260) (_2!262 BitStream!260)) )
))
(declare-fun lt!5341 () tuple2!492)

(declare-datatypes ((List!41 0))(
  ( (Nil!38) (Cons!37 (h!156 Bool) (t!791 List!41)) )
))
(declare-fun lt!5343 () List!41)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!260 BitStream!260 (_ BitVec 64)) List!41)

(assert (=> b!4299 (= lt!5343 (bitStreamReadBitsIntoList!0 (_2!261 lt!5344) (_1!262 lt!5341) nBits!460))))

(declare-datatypes ((tuple2!494 0))(
  ( (tuple2!495 (_1!263 array!337) (_2!263 BitStream!260)) )
))
(declare-fun lt!5345 () tuple2!494)

(declare-fun readBits!0 (BitStream!260 (_ BitVec 64)) tuple2!494)

(assert (=> b!4299 (= lt!5345 (readBits!0 (_1!262 lt!5341) nBits!460))))

(assert (=> b!4299 (validate_offset_bits!1 ((_ sign_extend 32) (size!141 (buf!462 (_2!261 lt!5344)))) ((_ sign_extend 32) (currentByte!1441 thiss!1486)) ((_ sign_extend 32) (currentBit!1436 thiss!1486)) nBits!460)))

(declare-fun lt!5342 () Unit!332)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!260 array!337 (_ BitVec 64)) Unit!332)

(assert (=> b!4299 (= lt!5342 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!462 (_2!261 lt!5344)) nBits!460))))

(declare-fun reader!0 (BitStream!260 BitStream!260) tuple2!492)

(assert (=> b!4299 (= lt!5341 (reader!0 thiss!1486 (_2!261 lt!5344)))))

(declare-fun res!5674 () Bool)

(assert (=> start!1074 (=> (not res!5674) (not e!2799))))

(assert (=> start!1074 (= res!5674 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!141 srcBuffer!6))))))))

(assert (=> start!1074 e!2799))

(assert (=> start!1074 true))

(assert (=> start!1074 (array_inv!136 srcBuffer!6)))

(declare-fun inv!12 (BitStream!260) Bool)

(assert (=> start!1074 (and (inv!12 thiss!1486) e!2798)))

(assert (= (and start!1074 res!5674) b!4296))

(assert (= (and b!4296 res!5673) b!4297))

(assert (= (and b!4297 res!5671) b!4294))

(assert (= (and b!4294 res!5670) b!4298))

(assert (= (and b!4298 res!5669) b!4293))

(assert (= (and b!4293 res!5672) b!4299))

(assert (= start!1074 b!4295))

(declare-fun m!5057 () Bool)

(assert (=> start!1074 m!5057))

(declare-fun m!5059 () Bool)

(assert (=> start!1074 m!5059))

(declare-fun m!5061 () Bool)

(assert (=> b!4299 m!5061))

(declare-fun m!5063 () Bool)

(assert (=> b!4299 m!5063))

(declare-fun m!5065 () Bool)

(assert (=> b!4299 m!5065))

(declare-fun m!5067 () Bool)

(assert (=> b!4299 m!5067))

(declare-fun m!5069 () Bool)

(assert (=> b!4299 m!5069))

(declare-fun m!5071 () Bool)

(assert (=> b!4297 m!5071))

(declare-fun m!5073 () Bool)

(assert (=> b!4297 m!5073))

(declare-fun m!5075 () Bool)

(assert (=> b!4298 m!5075))

(declare-fun m!5077 () Bool)

(assert (=> b!4298 m!5077))

(declare-fun m!5079 () Bool)

(assert (=> b!4295 m!5079))

(declare-fun m!5081 () Bool)

(assert (=> b!4293 m!5081))

(declare-fun m!5083 () Bool)

(assert (=> b!4296 m!5083))

(push 1)

(assert (not b!4296))

(assert (not b!4298))

(assert (not b!4297))

(assert (not b!4299))

(assert (not b!4293))

(assert (not start!1074))

(assert (not b!4295))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

