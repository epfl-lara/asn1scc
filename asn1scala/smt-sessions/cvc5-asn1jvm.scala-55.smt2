; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1088 () Bool)

(assert start!1088)

(declare-fun b!4441 () Bool)

(declare-fun res!5796 () Bool)

(declare-fun e!2905 () Bool)

(assert (=> b!4441 (=> (not res!5796) (not e!2905))))

(declare-datatypes ((array!351 0))(
  ( (array!352 (arr!538 (Array (_ BitVec 32) (_ BitVec 8))) (size!148 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!274 0))(
  ( (BitStream!275 (buf!469 array!351) (currentByte!1448 (_ BitVec 32)) (currentBit!1443 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!274)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!4441 (= res!5796 (validate_offset_bits!1 ((_ sign_extend 32) (size!148 (buf!469 thiss!1486))) ((_ sign_extend 32) (currentByte!1448 thiss!1486)) ((_ sign_extend 32) (currentBit!1443 thiss!1486)) nBits!460))))

(declare-fun b!4442 () Bool)

(declare-fun e!2906 () Bool)

(declare-fun array_inv!143 (array!351) Bool)

(assert (=> b!4442 (= e!2906 (array_inv!143 (buf!469 thiss!1486)))))

(declare-fun b!4443 () Bool)

(declare-fun res!5800 () Bool)

(declare-fun e!2902 () Bool)

(assert (=> b!4443 (=> (not res!5800) (not e!2902))))

(declare-datatypes ((Unit!346 0))(
  ( (Unit!347) )
))
(declare-datatypes ((tuple2!532 0))(
  ( (tuple2!533 (_1!282 Unit!346) (_2!282 BitStream!274)) )
))
(declare-fun lt!5446 () tuple2!532)

(declare-fun isPrefixOf!0 (BitStream!274 BitStream!274) Bool)

(assert (=> b!4443 (= res!5800 (isPrefixOf!0 thiss!1486 (_2!282 lt!5446)))))

(declare-fun b!4444 () Bool)

(declare-fun res!5797 () Bool)

(assert (=> b!4444 (=> (not res!5797) (not e!2902))))

(assert (=> b!4444 (= res!5797 (= (size!148 (buf!469 thiss!1486)) (size!148 (buf!469 (_2!282 lt!5446)))))))

(declare-fun b!4445 () Bool)

(declare-fun res!5799 () Bool)

(assert (=> b!4445 (=> (not res!5799) (not e!2902))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!4445 (= res!5799 (= (bitIndex!0 (size!148 (buf!469 (_2!282 lt!5446))) (currentByte!1448 (_2!282 lt!5446)) (currentBit!1443 (_2!282 lt!5446))) (bvadd (bitIndex!0 (size!148 (buf!469 thiss!1486)) (currentByte!1448 thiss!1486) (currentBit!1443 thiss!1486)) nBits!460)))))

(declare-fun b!4446 () Bool)

(assert (=> b!4446 (= e!2905 e!2902)))

(declare-fun res!5798 () Bool)

(assert (=> b!4446 (=> (not res!5798) (not e!2902))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!4446 (= res!5798 (invariant!0 (currentBit!1443 (_2!282 lt!5446)) (currentByte!1448 (_2!282 lt!5446)) (size!148 (buf!469 (_2!282 lt!5446)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!351)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!274 array!351 (_ BitVec 64) (_ BitVec 64)) tuple2!532)

(assert (=> b!4446 (= lt!5446 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun res!5795 () Bool)

(assert (=> start!1088 (=> (not res!5795) (not e!2905))))

(assert (=> start!1088 (= res!5795 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!148 srcBuffer!6))))))))

(assert (=> start!1088 e!2905))

(assert (=> start!1088 true))

(assert (=> start!1088 (array_inv!143 srcBuffer!6)))

(declare-fun inv!12 (BitStream!274) Bool)

(assert (=> start!1088 (and (inv!12 thiss!1486) e!2906)))

(declare-fun b!4440 () Bool)

(assert (=> b!4440 (= e!2902 (not true))))

(declare-datatypes ((List!48 0))(
  ( (Nil!45) (Cons!44 (h!163 Bool) (t!798 List!48)) )
))
(declare-fun lt!5447 () List!48)

(declare-datatypes ((tuple2!534 0))(
  ( (tuple2!535 (_1!283 BitStream!274) (_2!283 BitStream!274)) )
))
(declare-fun lt!5449 () tuple2!534)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!274 BitStream!274 (_ BitVec 64)) List!48)

(assert (=> b!4440 (= lt!5447 (bitStreamReadBitsIntoList!0 (_2!282 lt!5446) (_1!283 lt!5449) nBits!460))))

(declare-datatypes ((tuple2!536 0))(
  ( (tuple2!537 (_1!284 array!351) (_2!284 BitStream!274)) )
))
(declare-fun lt!5448 () tuple2!536)

(declare-fun readBits!0 (BitStream!274 (_ BitVec 64)) tuple2!536)

(assert (=> b!4440 (= lt!5448 (readBits!0 (_1!283 lt!5449) nBits!460))))

(assert (=> b!4440 (validate_offset_bits!1 ((_ sign_extend 32) (size!148 (buf!469 (_2!282 lt!5446)))) ((_ sign_extend 32) (currentByte!1448 thiss!1486)) ((_ sign_extend 32) (currentBit!1443 thiss!1486)) nBits!460)))

(declare-fun lt!5450 () Unit!346)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!274 array!351 (_ BitVec 64)) Unit!346)

(assert (=> b!4440 (= lt!5450 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!469 (_2!282 lt!5446)) nBits!460))))

(declare-fun reader!0 (BitStream!274 BitStream!274) tuple2!534)

(assert (=> b!4440 (= lt!5449 (reader!0 thiss!1486 (_2!282 lt!5446)))))

(assert (= (and start!1088 res!5795) b!4441))

(assert (= (and b!4441 res!5796) b!4446))

(assert (= (and b!4446 res!5798) b!4444))

(assert (= (and b!4444 res!5797) b!4445))

(assert (= (and b!4445 res!5799) b!4443))

(assert (= (and b!4443 res!5800) b!4440))

(assert (= start!1088 b!4442))

(declare-fun m!5253 () Bool)

(assert (=> b!4443 m!5253))

(declare-fun m!5255 () Bool)

(assert (=> b!4441 m!5255))

(declare-fun m!5257 () Bool)

(assert (=> b!4440 m!5257))

(declare-fun m!5259 () Bool)

(assert (=> b!4440 m!5259))

(declare-fun m!5261 () Bool)

(assert (=> b!4440 m!5261))

(declare-fun m!5263 () Bool)

(assert (=> b!4440 m!5263))

(declare-fun m!5265 () Bool)

(assert (=> b!4440 m!5265))

(declare-fun m!5267 () Bool)

(assert (=> b!4445 m!5267))

(declare-fun m!5269 () Bool)

(assert (=> b!4445 m!5269))

(declare-fun m!5271 () Bool)

(assert (=> start!1088 m!5271))

(declare-fun m!5273 () Bool)

(assert (=> start!1088 m!5273))

(declare-fun m!5275 () Bool)

(assert (=> b!4442 m!5275))

(declare-fun m!5277 () Bool)

(assert (=> b!4446 m!5277))

(declare-fun m!5279 () Bool)

(assert (=> b!4446 m!5279))

(push 1)

(assert (not b!4443))

(assert (not b!4441))

(assert (not start!1088))

(assert (not b!4442))

(assert (not b!4440))

(assert (not b!4445))

(assert (not b!4446))

(check-sat)

(pop 1)

