; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27346 () Bool)

(assert start!27346)

(declare-fun b!140329 () Bool)

(declare-fun res!116999 () Bool)

(declare-fun e!93534 () Bool)

(assert (=> b!140329 (=> (not res!116999) (not e!93534))))

(declare-datatypes ((array!6412 0))(
  ( (array!6413 (arr!3608 (Array (_ BitVec 32) (_ BitVec 8))) (size!2901 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5060 0))(
  ( (BitStream!5061 (buf!3322 array!6412) (currentByte!6173 (_ BitVec 32)) (currentBit!6168 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8781 0))(
  ( (Unit!8782) )
))
(declare-datatypes ((tuple2!12280 0))(
  ( (tuple2!12281 (_1!6470 Unit!8781) (_2!6470 BitStream!5060)) )
))
(declare-fun lt!218689 () tuple2!12280)

(declare-fun thiss!1634 () BitStream!5060)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!140329 (= res!116999 (= (bitIndex!0 (size!2901 (buf!3322 (_2!6470 lt!218689))) (currentByte!6173 (_2!6470 lt!218689)) (currentBit!6168 (_2!6470 lt!218689))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2901 (buf!3322 thiss!1634)) (currentByte!6173 thiss!1634) (currentBit!6168 thiss!1634)))))))

(declare-datatypes ((tuple2!12282 0))(
  ( (tuple2!12283 (_1!6471 BitStream!5060) (_2!6471 BitStream!5060)) )
))
(declare-fun lt!218688 () tuple2!12282)

(declare-datatypes ((tuple2!12284 0))(
  ( (tuple2!12285 (_1!6472 BitStream!5060) (_2!6472 (_ BitVec 8))) )
))
(declare-fun lt!218690 () tuple2!12284)

(declare-fun b!140330 () Bool)

(declare-fun arr!237 () array!6412)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!140330 (= e!93534 (and (= (_2!6472 lt!218690) (select (arr!3608 arr!237) from!447)) (= (_1!6472 lt!218690) (_2!6471 lt!218688))))))

(declare-fun readBytePure!0 (BitStream!5060) tuple2!12284)

(assert (=> b!140330 (= lt!218690 (readBytePure!0 (_1!6471 lt!218688)))))

(declare-fun reader!0 (BitStream!5060 BitStream!5060) tuple2!12282)

(assert (=> b!140330 (= lt!218688 (reader!0 thiss!1634 (_2!6470 lt!218689)))))

(declare-fun res!116998 () Bool)

(declare-fun e!93532 () Bool)

(assert (=> start!27346 (=> (not res!116998) (not e!93532))))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> start!27346 (= res!116998 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2901 arr!237))))))

(assert (=> start!27346 e!93532))

(assert (=> start!27346 true))

(declare-fun array_inv!2690 (array!6412) Bool)

(assert (=> start!27346 (array_inv!2690 arr!237)))

(declare-fun e!93533 () Bool)

(declare-fun inv!12 (BitStream!5060) Bool)

(assert (=> start!27346 (and (inv!12 thiss!1634) e!93533)))

(declare-fun b!140331 () Bool)

(declare-fun res!116996 () Bool)

(assert (=> b!140331 (=> (not res!116996) (not e!93532))))

(assert (=> b!140331 (= res!116996 (bvslt from!447 to!404))))

(declare-fun b!140332 () Bool)

(declare-fun res!117001 () Bool)

(assert (=> b!140332 (=> (not res!117001) (not e!93532))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!140332 (= res!117001 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2901 (buf!3322 thiss!1634))) ((_ sign_extend 32) (currentByte!6173 thiss!1634)) ((_ sign_extend 32) (currentBit!6168 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!140333 () Bool)

(assert (=> b!140333 (= e!93533 (array_inv!2690 (buf!3322 thiss!1634)))))

(declare-fun b!140334 () Bool)

(declare-fun res!116997 () Bool)

(assert (=> b!140334 (=> (not res!116997) (not e!93532))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!140334 (= res!116997 (invariant!0 (currentBit!6168 thiss!1634) (currentByte!6173 thiss!1634) (size!2901 (buf!3322 thiss!1634))))))

(declare-fun b!140335 () Bool)

(assert (=> b!140335 (= e!93532 (not (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000)))))))

(assert (=> b!140335 e!93534))

(declare-fun res!117000 () Bool)

(assert (=> b!140335 (=> (not res!117000) (not e!93534))))

(assert (=> b!140335 (= res!117000 (= (size!2901 (buf!3322 thiss!1634)) (size!2901 (buf!3322 (_2!6470 lt!218689)))))))

(declare-fun appendByte!0 (BitStream!5060 (_ BitVec 8)) tuple2!12280)

(assert (=> b!140335 (= lt!218689 (appendByte!0 thiss!1634 (select (arr!3608 arr!237) from!447)))))

(declare-fun b!140336 () Bool)

(declare-fun res!116995 () Bool)

(assert (=> b!140336 (=> (not res!116995) (not e!93534))))

(declare-fun isPrefixOf!0 (BitStream!5060 BitStream!5060) Bool)

(assert (=> b!140336 (= res!116995 (isPrefixOf!0 thiss!1634 (_2!6470 lt!218689)))))

(assert (= (and start!27346 res!116998) b!140332))

(assert (= (and b!140332 res!117001) b!140331))

(assert (= (and b!140331 res!116996) b!140334))

(assert (= (and b!140334 res!116997) b!140335))

(assert (= (and b!140335 res!117000) b!140329))

(assert (= (and b!140329 res!116999) b!140336))

(assert (= (and b!140336 res!116995) b!140330))

(assert (= start!27346 b!140333))

(declare-fun m!216113 () Bool)

(assert (=> b!140335 m!216113))

(assert (=> b!140335 m!216113))

(declare-fun m!216115 () Bool)

(assert (=> b!140335 m!216115))

(declare-fun m!216117 () Bool)

(assert (=> b!140332 m!216117))

(declare-fun m!216119 () Bool)

(assert (=> b!140329 m!216119))

(declare-fun m!216121 () Bool)

(assert (=> b!140329 m!216121))

(declare-fun m!216123 () Bool)

(assert (=> b!140333 m!216123))

(assert (=> b!140330 m!216113))

(declare-fun m!216125 () Bool)

(assert (=> b!140330 m!216125))

(declare-fun m!216127 () Bool)

(assert (=> b!140330 m!216127))

(declare-fun m!216129 () Bool)

(assert (=> b!140336 m!216129))

(declare-fun m!216131 () Bool)

(assert (=> b!140334 m!216131))

(declare-fun m!216133 () Bool)

(assert (=> start!27346 m!216133))

(declare-fun m!216135 () Bool)

(assert (=> start!27346 m!216135))

(push 1)

(assert (not start!27346))

(assert (not b!140329))

(assert (not b!140334))

(assert (not b!140335))

(assert (not b!140336))

(assert (not b!140333))

(assert (not b!140332))

(assert (not b!140330))

(check-sat)

(pop 1)

(push 1)

(check-sat)

