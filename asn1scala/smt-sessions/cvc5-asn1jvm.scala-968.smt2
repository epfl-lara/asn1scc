; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27342 () Bool)

(assert start!27342)

(declare-fun b!140281 () Bool)

(declare-fun res!116956 () Bool)

(declare-fun e!93503 () Bool)

(assert (=> b!140281 (=> (not res!116956) (not e!93503))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6408 0))(
  ( (array!6409 (arr!3606 (Array (_ BitVec 32) (_ BitVec 8))) (size!2899 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5056 0))(
  ( (BitStream!5057 (buf!3320 array!6408) (currentByte!6171 (_ BitVec 32)) (currentBit!6166 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5056)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!140281 (= res!116956 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2899 (buf!3320 thiss!1634))) ((_ sign_extend 32) (currentByte!6171 thiss!1634)) ((_ sign_extend 32) (currentBit!6166 thiss!1634)) (bvsub to!404 from!447)))))

(declare-datatypes ((tuple2!12268 0))(
  ( (tuple2!12269 (_1!6464 BitStream!5056) (_2!6464 (_ BitVec 8))) )
))
(declare-fun lt!218670 () tuple2!12268)

(declare-datatypes ((tuple2!12270 0))(
  ( (tuple2!12271 (_1!6465 BitStream!5056) (_2!6465 BitStream!5056)) )
))
(declare-fun lt!218671 () tuple2!12270)

(declare-fun arr!237 () array!6408)

(declare-fun e!93501 () Bool)

(declare-fun b!140282 () Bool)

(assert (=> b!140282 (= e!93501 (and (= (_2!6464 lt!218670) (select (arr!3606 arr!237) from!447)) (= (_1!6464 lt!218670) (_2!6465 lt!218671))))))

(declare-fun readBytePure!0 (BitStream!5056) tuple2!12268)

(assert (=> b!140282 (= lt!218670 (readBytePure!0 (_1!6465 lt!218671)))))

(declare-datatypes ((Unit!8777 0))(
  ( (Unit!8778) )
))
(declare-datatypes ((tuple2!12272 0))(
  ( (tuple2!12273 (_1!6466 Unit!8777) (_2!6466 BitStream!5056)) )
))
(declare-fun lt!218672 () tuple2!12272)

(declare-fun reader!0 (BitStream!5056 BitStream!5056) tuple2!12270)

(assert (=> b!140282 (= lt!218671 (reader!0 thiss!1634 (_2!6466 lt!218672)))))

(declare-fun res!116953 () Bool)

(assert (=> start!27342 (=> (not res!116953) (not e!93503))))

(assert (=> start!27342 (= res!116953 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2899 arr!237))))))

(assert (=> start!27342 e!93503))

(assert (=> start!27342 true))

(declare-fun array_inv!2688 (array!6408) Bool)

(assert (=> start!27342 (array_inv!2688 arr!237)))

(declare-fun e!93502 () Bool)

(declare-fun inv!12 (BitStream!5056) Bool)

(assert (=> start!27342 (and (inv!12 thiss!1634) e!93502)))

(declare-fun b!140283 () Bool)

(declare-fun res!116957 () Bool)

(assert (=> b!140283 (=> (not res!116957) (not e!93503))))

(assert (=> b!140283 (= res!116957 (bvslt from!447 to!404))))

(declare-fun b!140284 () Bool)

(declare-fun res!116958 () Bool)

(assert (=> b!140284 (=> (not res!116958) (not e!93501))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!140284 (= res!116958 (= (bitIndex!0 (size!2899 (buf!3320 (_2!6466 lt!218672))) (currentByte!6171 (_2!6466 lt!218672)) (currentBit!6166 (_2!6466 lt!218672))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2899 (buf!3320 thiss!1634)) (currentByte!6171 thiss!1634) (currentBit!6166 thiss!1634)))))))

(declare-fun b!140285 () Bool)

(declare-fun res!116954 () Bool)

(assert (=> b!140285 (=> (not res!116954) (not e!93501))))

(declare-fun isPrefixOf!0 (BitStream!5056 BitStream!5056) Bool)

(assert (=> b!140285 (= res!116954 (isPrefixOf!0 thiss!1634 (_2!6466 lt!218672)))))

(declare-fun b!140286 () Bool)

(declare-fun res!116955 () Bool)

(assert (=> b!140286 (=> (not res!116955) (not e!93503))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!140286 (= res!116955 (invariant!0 (currentBit!6166 thiss!1634) (currentByte!6171 thiss!1634) (size!2899 (buf!3320 thiss!1634))))))

(declare-fun b!140287 () Bool)

(assert (=> b!140287 (= e!93502 (array_inv!2688 (buf!3320 thiss!1634)))))

(declare-fun b!140288 () Bool)

(assert (=> b!140288 (= e!93503 (not (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000)))))))

(assert (=> b!140288 e!93501))

(declare-fun res!116959 () Bool)

(assert (=> b!140288 (=> (not res!116959) (not e!93501))))

(assert (=> b!140288 (= res!116959 (= (size!2899 (buf!3320 thiss!1634)) (size!2899 (buf!3320 (_2!6466 lt!218672)))))))

(declare-fun appendByte!0 (BitStream!5056 (_ BitVec 8)) tuple2!12272)

(assert (=> b!140288 (= lt!218672 (appendByte!0 thiss!1634 (select (arr!3606 arr!237) from!447)))))

(assert (= (and start!27342 res!116953) b!140281))

(assert (= (and b!140281 res!116956) b!140283))

(assert (= (and b!140283 res!116957) b!140286))

(assert (= (and b!140286 res!116955) b!140288))

(assert (= (and b!140288 res!116959) b!140284))

(assert (= (and b!140284 res!116958) b!140285))

(assert (= (and b!140285 res!116954) b!140282))

(assert (= start!27342 b!140287))

(declare-fun m!216065 () Bool)

(assert (=> b!140286 m!216065))

(declare-fun m!216067 () Bool)

(assert (=> b!140288 m!216067))

(assert (=> b!140288 m!216067))

(declare-fun m!216069 () Bool)

(assert (=> b!140288 m!216069))

(declare-fun m!216071 () Bool)

(assert (=> b!140284 m!216071))

(declare-fun m!216073 () Bool)

(assert (=> b!140284 m!216073))

(declare-fun m!216075 () Bool)

(assert (=> b!140281 m!216075))

(assert (=> b!140282 m!216067))

(declare-fun m!216077 () Bool)

(assert (=> b!140282 m!216077))

(declare-fun m!216079 () Bool)

(assert (=> b!140282 m!216079))

(declare-fun m!216081 () Bool)

(assert (=> b!140287 m!216081))

(declare-fun m!216083 () Bool)

(assert (=> start!27342 m!216083))

(declare-fun m!216085 () Bool)

(assert (=> start!27342 m!216085))

(declare-fun m!216087 () Bool)

(assert (=> b!140285 m!216087))

(push 1)

(assert (not b!140281))

(assert (not b!140286))

(assert (not b!140288))

(assert (not b!140287))

(assert (not b!140285))

(assert (not b!140282))

(assert (not start!27342))

(assert (not b!140284))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

