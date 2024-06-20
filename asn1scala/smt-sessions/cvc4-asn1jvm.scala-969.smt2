; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27352 () Bool)

(assert start!27352)

(declare-fun b!140401 () Bool)

(declare-fun res!117058 () Bool)

(declare-fun e!93576 () Bool)

(assert (=> b!140401 (=> (not res!117058) (not e!93576))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!140401 (= res!117058 (bvslt from!447 to!404))))

(declare-fun b!140402 () Bool)

(assert (=> b!140402 (= e!93576 (not (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000)))))))

(declare-fun e!93577 () Bool)

(assert (=> b!140402 e!93577))

(declare-fun res!117063 () Bool)

(assert (=> b!140402 (=> (not res!117063) (not e!93577))))

(declare-datatypes ((array!6418 0))(
  ( (array!6419 (arr!3611 (Array (_ BitVec 32) (_ BitVec 8))) (size!2904 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5066 0))(
  ( (BitStream!5067 (buf!3325 array!6418) (currentByte!6176 (_ BitVec 32)) (currentBit!6171 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5066)

(declare-datatypes ((Unit!8787 0))(
  ( (Unit!8788) )
))
(declare-datatypes ((tuple2!12298 0))(
  ( (tuple2!12299 (_1!6479 Unit!8787) (_2!6479 BitStream!5066)) )
))
(declare-fun lt!218715 () tuple2!12298)

(assert (=> b!140402 (= res!117063 (= (size!2904 (buf!3325 thiss!1634)) (size!2904 (buf!3325 (_2!6479 lt!218715)))))))

(declare-fun arr!237 () array!6418)

(declare-fun appendByte!0 (BitStream!5066 (_ BitVec 8)) tuple2!12298)

(assert (=> b!140402 (= lt!218715 (appendByte!0 thiss!1634 (select (arr!3611 arr!237) from!447)))))

(declare-fun b!140403 () Bool)

(declare-fun res!117064 () Bool)

(assert (=> b!140403 (=> (not res!117064) (not e!93577))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!140403 (= res!117064 (= (bitIndex!0 (size!2904 (buf!3325 (_2!6479 lt!218715))) (currentByte!6176 (_2!6479 lt!218715)) (currentBit!6171 (_2!6479 lt!218715))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2904 (buf!3325 thiss!1634)) (currentByte!6176 thiss!1634) (currentBit!6171 thiss!1634)))))))

(declare-fun b!140404 () Bool)

(declare-fun res!117062 () Bool)

(assert (=> b!140404 (=> (not res!117062) (not e!93577))))

(declare-fun isPrefixOf!0 (BitStream!5066 BitStream!5066) Bool)

(assert (=> b!140404 (= res!117062 (isPrefixOf!0 thiss!1634 (_2!6479 lt!218715)))))

(declare-fun res!117059 () Bool)

(assert (=> start!27352 (=> (not res!117059) (not e!93576))))

(assert (=> start!27352 (= res!117059 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2904 arr!237))))))

(assert (=> start!27352 e!93576))

(assert (=> start!27352 true))

(declare-fun array_inv!2693 (array!6418) Bool)

(assert (=> start!27352 (array_inv!2693 arr!237)))

(declare-fun e!93575 () Bool)

(declare-fun inv!12 (BitStream!5066) Bool)

(assert (=> start!27352 (and (inv!12 thiss!1634) e!93575)))

(declare-fun b!140405 () Bool)

(declare-fun res!117060 () Bool)

(assert (=> b!140405 (=> (not res!117060) (not e!93576))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!140405 (= res!117060 (invariant!0 (currentBit!6171 thiss!1634) (currentByte!6176 thiss!1634) (size!2904 (buf!3325 thiss!1634))))))

(declare-datatypes ((tuple2!12300 0))(
  ( (tuple2!12301 (_1!6480 BitStream!5066) (_2!6480 (_ BitVec 8))) )
))
(declare-fun lt!218716 () tuple2!12300)

(declare-fun b!140406 () Bool)

(declare-datatypes ((tuple2!12302 0))(
  ( (tuple2!12303 (_1!6481 BitStream!5066) (_2!6481 BitStream!5066)) )
))
(declare-fun lt!218717 () tuple2!12302)

(assert (=> b!140406 (= e!93577 (and (= (_2!6480 lt!218716) (select (arr!3611 arr!237) from!447)) (= (_1!6480 lt!218716) (_2!6481 lt!218717))))))

(declare-fun readBytePure!0 (BitStream!5066) tuple2!12300)

(assert (=> b!140406 (= lt!218716 (readBytePure!0 (_1!6481 lt!218717)))))

(declare-fun reader!0 (BitStream!5066 BitStream!5066) tuple2!12302)

(assert (=> b!140406 (= lt!218717 (reader!0 thiss!1634 (_2!6479 lt!218715)))))

(declare-fun b!140407 () Bool)

(declare-fun res!117061 () Bool)

(assert (=> b!140407 (=> (not res!117061) (not e!93576))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!140407 (= res!117061 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2904 (buf!3325 thiss!1634))) ((_ sign_extend 32) (currentByte!6176 thiss!1634)) ((_ sign_extend 32) (currentBit!6171 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!140408 () Bool)

(assert (=> b!140408 (= e!93575 (array_inv!2693 (buf!3325 thiss!1634)))))

(assert (= (and start!27352 res!117059) b!140407))

(assert (= (and b!140407 res!117061) b!140401))

(assert (= (and b!140401 res!117058) b!140405))

(assert (= (and b!140405 res!117060) b!140402))

(assert (= (and b!140402 res!117063) b!140403))

(assert (= (and b!140403 res!117064) b!140404))

(assert (= (and b!140404 res!117062) b!140406))

(assert (= start!27352 b!140408))

(declare-fun m!216185 () Bool)

(assert (=> b!140405 m!216185))

(declare-fun m!216187 () Bool)

(assert (=> b!140407 m!216187))

(declare-fun m!216189 () Bool)

(assert (=> b!140402 m!216189))

(assert (=> b!140402 m!216189))

(declare-fun m!216191 () Bool)

(assert (=> b!140402 m!216191))

(declare-fun m!216193 () Bool)

(assert (=> b!140408 m!216193))

(declare-fun m!216195 () Bool)

(assert (=> b!140403 m!216195))

(declare-fun m!216197 () Bool)

(assert (=> b!140403 m!216197))

(assert (=> b!140406 m!216189))

(declare-fun m!216199 () Bool)

(assert (=> b!140406 m!216199))

(declare-fun m!216201 () Bool)

(assert (=> b!140406 m!216201))

(declare-fun m!216203 () Bool)

(assert (=> start!27352 m!216203))

(declare-fun m!216205 () Bool)

(assert (=> start!27352 m!216205))

(declare-fun m!216207 () Bool)

(assert (=> b!140404 m!216207))

(push 1)

(assert (not b!140407))

(assert (not b!140403))

(assert (not b!140404))

(assert (not b!140405))

(assert (not b!140406))

(assert (not b!140408))

(assert (not start!27352))

(assert (not b!140402))

(check-sat)

(pop 1)

(push 1)

(check-sat)

