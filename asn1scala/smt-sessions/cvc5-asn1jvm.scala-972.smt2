; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27420 () Bool)

(assert start!27420)

(declare-fun b!140692 () Bool)

(declare-fun res!117316 () Bool)

(declare-fun e!93739 () Bool)

(assert (=> b!140692 (=> (not res!117316) (not e!93739))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!140692 (= res!117316 (bvslt from!447 to!404))))

(declare-fun b!140693 () Bool)

(declare-fun res!117314 () Bool)

(declare-fun e!93738 () Bool)

(assert (=> b!140693 (=> (not res!117314) (not e!93738))))

(declare-datatypes ((array!6435 0))(
  ( (array!6436 (arr!3618 (Array (_ BitVec 32) (_ BitVec 8))) (size!2911 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5080 0))(
  ( (BitStream!5081 (buf!3332 array!6435) (currentByte!6192 (_ BitVec 32)) (currentBit!6187 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8804 0))(
  ( (Unit!8805) )
))
(declare-datatypes ((tuple2!12346 0))(
  ( (tuple2!12347 (_1!6503 Unit!8804) (_2!6503 BitStream!5080)) )
))
(declare-fun lt!219087 () tuple2!12346)

(declare-fun thiss!1634 () BitStream!5080)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!140693 (= res!117314 (= (bitIndex!0 (size!2911 (buf!3332 (_2!6503 lt!219087))) (currentByte!6192 (_2!6503 lt!219087)) (currentBit!6187 (_2!6503 lt!219087))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2911 (buf!3332 thiss!1634)) (currentByte!6192 thiss!1634) (currentBit!6187 thiss!1634)))))))

(declare-fun b!140694 () Bool)

(declare-fun res!117313 () Bool)

(assert (=> b!140694 (=> (not res!117313) (not e!93739))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!140694 (= res!117313 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2911 (buf!3332 thiss!1634))) ((_ sign_extend 32) (currentByte!6192 thiss!1634)) ((_ sign_extend 32) (currentBit!6187 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!140695 () Bool)

(declare-fun res!117310 () Bool)

(assert (=> b!140695 (=> (not res!117310) (not e!93738))))

(declare-fun isPrefixOf!0 (BitStream!5080 BitStream!5080) Bool)

(assert (=> b!140695 (= res!117310 (isPrefixOf!0 thiss!1634 (_2!6503 lt!219087)))))

(declare-fun res!117315 () Bool)

(assert (=> start!27420 (=> (not res!117315) (not e!93739))))

(declare-fun arr!237 () array!6435)

(assert (=> start!27420 (= res!117315 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2911 arr!237))))))

(assert (=> start!27420 e!93739))

(assert (=> start!27420 true))

(declare-fun array_inv!2700 (array!6435) Bool)

(assert (=> start!27420 (array_inv!2700 arr!237)))

(declare-fun e!93740 () Bool)

(declare-fun inv!12 (BitStream!5080) Bool)

(assert (=> start!27420 (and (inv!12 thiss!1634) e!93740)))

(declare-fun b!140696 () Bool)

(declare-fun res!117312 () Bool)

(assert (=> b!140696 (=> (not res!117312) (not e!93739))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!140696 (= res!117312 (invariant!0 (currentBit!6187 thiss!1634) (currentByte!6192 thiss!1634) (size!2911 (buf!3332 thiss!1634))))))

(declare-fun b!140697 () Bool)

(assert (=> b!140697 (= e!93740 (array_inv!2700 (buf!3332 thiss!1634)))))

(declare-fun b!140698 () Bool)

(assert (=> b!140698 (= e!93739 (not true))))

(declare-fun lt!219086 () (_ BitVec 64))

(assert (=> b!140698 (= lt!219086 (bitIndex!0 (size!2911 (buf!3332 (_2!6503 lt!219087))) (currentByte!6192 (_2!6503 lt!219087)) (currentBit!6187 (_2!6503 lt!219087))))))

(assert (=> b!140698 e!93738))

(declare-fun res!117311 () Bool)

(assert (=> b!140698 (=> (not res!117311) (not e!93738))))

(assert (=> b!140698 (= res!117311 (= (size!2911 (buf!3332 thiss!1634)) (size!2911 (buf!3332 (_2!6503 lt!219087)))))))

(declare-fun appendByte!0 (BitStream!5080 (_ BitVec 8)) tuple2!12346)

(assert (=> b!140698 (= lt!219087 (appendByte!0 thiss!1634 (select (arr!3618 arr!237) from!447)))))

(declare-datatypes ((tuple2!12348 0))(
  ( (tuple2!12349 (_1!6504 BitStream!5080) (_2!6504 BitStream!5080)) )
))
(declare-fun lt!219088 () tuple2!12348)

(declare-fun b!140699 () Bool)

(declare-datatypes ((tuple2!12350 0))(
  ( (tuple2!12351 (_1!6505 BitStream!5080) (_2!6505 (_ BitVec 8))) )
))
(declare-fun lt!219089 () tuple2!12350)

(assert (=> b!140699 (= e!93738 (and (= (_2!6505 lt!219089) (select (arr!3618 arr!237) from!447)) (= (_1!6505 lt!219089) (_2!6504 lt!219088))))))

(declare-fun readBytePure!0 (BitStream!5080) tuple2!12350)

(assert (=> b!140699 (= lt!219089 (readBytePure!0 (_1!6504 lt!219088)))))

(declare-fun reader!0 (BitStream!5080 BitStream!5080) tuple2!12348)

(assert (=> b!140699 (= lt!219088 (reader!0 thiss!1634 (_2!6503 lt!219087)))))

(assert (= (and start!27420 res!117315) b!140694))

(assert (= (and b!140694 res!117313) b!140692))

(assert (= (and b!140692 res!117316) b!140696))

(assert (= (and b!140696 res!117312) b!140698))

(assert (= (and b!140698 res!117311) b!140693))

(assert (= (and b!140693 res!117314) b!140695))

(assert (= (and b!140695 res!117310) b!140699))

(assert (= start!27420 b!140697))

(declare-fun m!216509 () Bool)

(assert (=> b!140696 m!216509))

(declare-fun m!216511 () Bool)

(assert (=> b!140694 m!216511))

(declare-fun m!216513 () Bool)

(assert (=> b!140699 m!216513))

(declare-fun m!216515 () Bool)

(assert (=> b!140699 m!216515))

(declare-fun m!216517 () Bool)

(assert (=> b!140699 m!216517))

(declare-fun m!216519 () Bool)

(assert (=> b!140698 m!216519))

(assert (=> b!140698 m!216513))

(assert (=> b!140698 m!216513))

(declare-fun m!216521 () Bool)

(assert (=> b!140698 m!216521))

(declare-fun m!216523 () Bool)

(assert (=> b!140695 m!216523))

(declare-fun m!216525 () Bool)

(assert (=> b!140697 m!216525))

(declare-fun m!216527 () Bool)

(assert (=> start!27420 m!216527))

(declare-fun m!216529 () Bool)

(assert (=> start!27420 m!216529))

(assert (=> b!140693 m!216519))

(declare-fun m!216531 () Bool)

(assert (=> b!140693 m!216531))

(push 1)

(assert (not b!140693))

(assert (not b!140694))

(assert (not start!27420))

(assert (not b!140699))

(assert (not b!140696))

(assert (not b!140698))

(assert (not b!140695))

(assert (not b!140697))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

