; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27116 () Bool)

(assert start!27116)

(declare-fun b!139415 () Bool)

(declare-fun e!92883 () Bool)

(declare-datatypes ((array!6360 0))(
  ( (array!6361 (arr!3573 (Array (_ BitVec 32) (_ BitVec 8))) (size!2878 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5020 0))(
  ( (BitStream!5021 (buf!3294 array!6360) (currentByte!6130 (_ BitVec 32)) (currentBit!6125 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5020)

(declare-fun array_inv!2667 (array!6360) Bool)

(assert (=> b!139415 (= e!92883 (array_inv!2667 (buf!3294 thiss!1634)))))

(declare-fun b!139416 () Bool)

(declare-fun res!116209 () Bool)

(declare-fun e!92882 () Bool)

(assert (=> b!139416 (=> (not res!116209) (not e!92882))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!139416 (= res!116209 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2878 (buf!3294 thiss!1634))) ((_ sign_extend 32) (currentByte!6130 thiss!1634)) ((_ sign_extend 32) (currentBit!6125 thiss!1634)) (bvsub to!404 from!447)))))

(declare-datatypes ((tuple2!12218 0))(
  ( (tuple2!12219 (_1!6435 BitStream!5020) (_2!6435 BitStream!5020)) )
))
(declare-fun lt!217295 () tuple2!12218)

(declare-fun arr!237 () array!6360)

(declare-datatypes ((tuple2!12220 0))(
  ( (tuple2!12221 (_1!6436 BitStream!5020) (_2!6436 (_ BitVec 8))) )
))
(declare-fun lt!217296 () tuple2!12220)

(declare-fun e!92881 () Bool)

(declare-fun b!139417 () Bool)

(assert (=> b!139417 (= e!92881 (and (= (_2!6436 lt!217296) (select (arr!3573 arr!237) from!447)) (= (_1!6436 lt!217296) (_2!6435 lt!217295))))))

(declare-fun readBytePure!0 (BitStream!5020) tuple2!12220)

(assert (=> b!139417 (= lt!217296 (readBytePure!0 (_1!6435 lt!217295)))))

(declare-datatypes ((Unit!8709 0))(
  ( (Unit!8710) )
))
(declare-datatypes ((tuple2!12222 0))(
  ( (tuple2!12223 (_1!6437 Unit!8709) (_2!6437 BitStream!5020)) )
))
(declare-fun lt!217294 () tuple2!12222)

(declare-fun reader!0 (BitStream!5020 BitStream!5020) tuple2!12218)

(assert (=> b!139417 (= lt!217295 (reader!0 thiss!1634 (_2!6437 lt!217294)))))

(declare-fun b!139418 () Bool)

(assert (=> b!139418 (= e!92882 (not true))))

(assert (=> b!139418 e!92881))

(declare-fun res!116214 () Bool)

(assert (=> b!139418 (=> (not res!116214) (not e!92881))))

(assert (=> b!139418 (= res!116214 (= (size!2878 (buf!3294 thiss!1634)) (size!2878 (buf!3294 (_2!6437 lt!217294)))))))

(declare-fun appendByte!0 (BitStream!5020 (_ BitVec 8)) tuple2!12222)

(assert (=> b!139418 (= lt!217294 (appendByte!0 thiss!1634 (select (arr!3573 arr!237) from!447)))))

(declare-fun b!139419 () Bool)

(declare-fun res!116212 () Bool)

(assert (=> b!139419 (=> (not res!116212) (not e!92881))))

(declare-fun isPrefixOf!0 (BitStream!5020 BitStream!5020) Bool)

(assert (=> b!139419 (= res!116212 (isPrefixOf!0 thiss!1634 (_2!6437 lt!217294)))))

(declare-fun b!139420 () Bool)

(declare-fun res!116208 () Bool)

(assert (=> b!139420 (=> (not res!116208) (not e!92882))))

(assert (=> b!139420 (= res!116208 (bvslt from!447 to!404))))

(declare-fun res!116211 () Bool)

(assert (=> start!27116 (=> (not res!116211) (not e!92882))))

(assert (=> start!27116 (= res!116211 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2878 arr!237))))))

(assert (=> start!27116 e!92882))

(assert (=> start!27116 true))

(assert (=> start!27116 (array_inv!2667 arr!237)))

(declare-fun inv!12 (BitStream!5020) Bool)

(assert (=> start!27116 (and (inv!12 thiss!1634) e!92883)))

(declare-fun b!139421 () Bool)

(declare-fun res!116213 () Bool)

(assert (=> b!139421 (=> (not res!116213) (not e!92882))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!139421 (= res!116213 (invariant!0 (currentBit!6125 thiss!1634) (currentByte!6130 thiss!1634) (size!2878 (buf!3294 thiss!1634))))))

(declare-fun b!139422 () Bool)

(declare-fun res!116210 () Bool)

(assert (=> b!139422 (=> (not res!116210) (not e!92881))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!139422 (= res!116210 (= (bitIndex!0 (size!2878 (buf!3294 (_2!6437 lt!217294))) (currentByte!6130 (_2!6437 lt!217294)) (currentBit!6125 (_2!6437 lt!217294))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2878 (buf!3294 thiss!1634)) (currentByte!6130 thiss!1634) (currentBit!6125 thiss!1634)))))))

(assert (= (and start!27116 res!116211) b!139416))

(assert (= (and b!139416 res!116209) b!139420))

(assert (= (and b!139420 res!116208) b!139421))

(assert (= (and b!139421 res!116213) b!139418))

(assert (= (and b!139418 res!116214) b!139422))

(assert (= (and b!139422 res!116210) b!139419))

(assert (= (and b!139419 res!116212) b!139417))

(assert (= start!27116 b!139415))

(declare-fun m!214441 () Bool)

(assert (=> b!139415 m!214441))

(declare-fun m!214443 () Bool)

(assert (=> b!139422 m!214443))

(declare-fun m!214445 () Bool)

(assert (=> b!139422 m!214445))

(declare-fun m!214447 () Bool)

(assert (=> b!139418 m!214447))

(assert (=> b!139418 m!214447))

(declare-fun m!214449 () Bool)

(assert (=> b!139418 m!214449))

(declare-fun m!214451 () Bool)

(assert (=> b!139421 m!214451))

(declare-fun m!214453 () Bool)

(assert (=> b!139419 m!214453))

(declare-fun m!214455 () Bool)

(assert (=> start!27116 m!214455))

(declare-fun m!214457 () Bool)

(assert (=> start!27116 m!214457))

(declare-fun m!214459 () Bool)

(assert (=> b!139416 m!214459))

(assert (=> b!139417 m!214447))

(declare-fun m!214461 () Bool)

(assert (=> b!139417 m!214461))

(declare-fun m!214463 () Bool)

(assert (=> b!139417 m!214463))

(push 1)

(assert (not b!139421))

(assert (not b!139422))

(assert (not start!27116))

(assert (not b!139418))

(assert (not b!139415))

(assert (not b!139417))

(assert (not b!139416))

(assert (not b!139419))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

