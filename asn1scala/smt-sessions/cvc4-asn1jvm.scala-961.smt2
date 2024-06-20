; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27120 () Bool)

(assert start!27120)

(declare-fun res!116250 () Bool)

(declare-fun e!92911 () Bool)

(assert (=> start!27120 (=> (not res!116250) (not e!92911))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6364 0))(
  ( (array!6365 (arr!3575 (Array (_ BitVec 32) (_ BitVec 8))) (size!2880 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6364)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!27120 (= res!116250 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2880 arr!237))))))

(assert (=> start!27120 e!92911))

(assert (=> start!27120 true))

(declare-fun array_inv!2669 (array!6364) Bool)

(assert (=> start!27120 (array_inv!2669 arr!237)))

(declare-datatypes ((BitStream!5024 0))(
  ( (BitStream!5025 (buf!3296 array!6364) (currentByte!6132 (_ BitVec 32)) (currentBit!6127 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5024)

(declare-fun e!92913 () Bool)

(declare-fun inv!12 (BitStream!5024) Bool)

(assert (=> start!27120 (and (inv!12 thiss!1634) e!92913)))

(declare-fun b!139463 () Bool)

(declare-fun res!116253 () Bool)

(assert (=> b!139463 (=> (not res!116253) (not e!92911))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!139463 (= res!116253 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2880 (buf!3296 thiss!1634))) ((_ sign_extend 32) (currentByte!6132 thiss!1634)) ((_ sign_extend 32) (currentBit!6127 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!139464 () Bool)

(declare-fun res!116256 () Bool)

(declare-fun e!92912 () Bool)

(assert (=> b!139464 (=> (not res!116256) (not e!92912))))

(declare-datatypes ((Unit!8713 0))(
  ( (Unit!8714) )
))
(declare-datatypes ((tuple2!12230 0))(
  ( (tuple2!12231 (_1!6441 Unit!8713) (_2!6441 BitStream!5024)) )
))
(declare-fun lt!217313 () tuple2!12230)

(declare-fun isPrefixOf!0 (BitStream!5024 BitStream!5024) Bool)

(assert (=> b!139464 (= res!116256 (isPrefixOf!0 thiss!1634 (_2!6441 lt!217313)))))

(declare-fun b!139465 () Bool)

(assert (=> b!139465 (= e!92911 (not true))))

(assert (=> b!139465 e!92912))

(declare-fun res!116252 () Bool)

(assert (=> b!139465 (=> (not res!116252) (not e!92912))))

(assert (=> b!139465 (= res!116252 (= (size!2880 (buf!3296 thiss!1634)) (size!2880 (buf!3296 (_2!6441 lt!217313)))))))

(declare-fun appendByte!0 (BitStream!5024 (_ BitVec 8)) tuple2!12230)

(assert (=> b!139465 (= lt!217313 (appendByte!0 thiss!1634 (select (arr!3575 arr!237) from!447)))))

(declare-fun b!139466 () Bool)

(declare-fun res!116254 () Bool)

(assert (=> b!139466 (=> (not res!116254) (not e!92911))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!139466 (= res!116254 (invariant!0 (currentBit!6127 thiss!1634) (currentByte!6132 thiss!1634) (size!2880 (buf!3296 thiss!1634))))))

(declare-datatypes ((tuple2!12232 0))(
  ( (tuple2!12233 (_1!6442 BitStream!5024) (_2!6442 BitStream!5024)) )
))
(declare-fun lt!217314 () tuple2!12232)

(declare-fun b!139467 () Bool)

(declare-datatypes ((tuple2!12234 0))(
  ( (tuple2!12235 (_1!6443 BitStream!5024) (_2!6443 (_ BitVec 8))) )
))
(declare-fun lt!217312 () tuple2!12234)

(assert (=> b!139467 (= e!92912 (and (= (_2!6443 lt!217312) (select (arr!3575 arr!237) from!447)) (= (_1!6443 lt!217312) (_2!6442 lt!217314))))))

(declare-fun readBytePure!0 (BitStream!5024) tuple2!12234)

(assert (=> b!139467 (= lt!217312 (readBytePure!0 (_1!6442 lt!217314)))))

(declare-fun reader!0 (BitStream!5024 BitStream!5024) tuple2!12232)

(assert (=> b!139467 (= lt!217314 (reader!0 thiss!1634 (_2!6441 lt!217313)))))

(declare-fun b!139468 () Bool)

(declare-fun res!116251 () Bool)

(assert (=> b!139468 (=> (not res!116251) (not e!92912))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!139468 (= res!116251 (= (bitIndex!0 (size!2880 (buf!3296 (_2!6441 lt!217313))) (currentByte!6132 (_2!6441 lt!217313)) (currentBit!6127 (_2!6441 lt!217313))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2880 (buf!3296 thiss!1634)) (currentByte!6132 thiss!1634) (currentBit!6127 thiss!1634)))))))

(declare-fun b!139469 () Bool)

(assert (=> b!139469 (= e!92913 (array_inv!2669 (buf!3296 thiss!1634)))))

(declare-fun b!139470 () Bool)

(declare-fun res!116255 () Bool)

(assert (=> b!139470 (=> (not res!116255) (not e!92911))))

(assert (=> b!139470 (= res!116255 (bvslt from!447 to!404))))

(assert (= (and start!27120 res!116250) b!139463))

(assert (= (and b!139463 res!116253) b!139470))

(assert (= (and b!139470 res!116255) b!139466))

(assert (= (and b!139466 res!116254) b!139465))

(assert (= (and b!139465 res!116252) b!139468))

(assert (= (and b!139468 res!116251) b!139464))

(assert (= (and b!139464 res!116256) b!139467))

(assert (= start!27120 b!139469))

(declare-fun m!214489 () Bool)

(assert (=> b!139469 m!214489))

(declare-fun m!214491 () Bool)

(assert (=> b!139463 m!214491))

(declare-fun m!214493 () Bool)

(assert (=> start!27120 m!214493))

(declare-fun m!214495 () Bool)

(assert (=> start!27120 m!214495))

(declare-fun m!214497 () Bool)

(assert (=> b!139467 m!214497))

(declare-fun m!214499 () Bool)

(assert (=> b!139467 m!214499))

(declare-fun m!214501 () Bool)

(assert (=> b!139467 m!214501))

(declare-fun m!214503 () Bool)

(assert (=> b!139466 m!214503))

(declare-fun m!214505 () Bool)

(assert (=> b!139468 m!214505))

(declare-fun m!214507 () Bool)

(assert (=> b!139468 m!214507))

(declare-fun m!214509 () Bool)

(assert (=> b!139464 m!214509))

(assert (=> b!139465 m!214497))

(assert (=> b!139465 m!214497))

(declare-fun m!214511 () Bool)

(assert (=> b!139465 m!214511))

(push 1)

(assert (not b!139464))

(assert (not b!139465))

(assert (not b!139469))

(assert (not b!139463))

(assert (not b!139467))

(assert (not b!139468))

(assert (not start!27120))

(assert (not b!139466))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

