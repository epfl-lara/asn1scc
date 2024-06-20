; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!722 () Bool)

(assert start!722)

(declare-fun b!2301 () Bool)

(declare-fun e!1631 () Bool)

(declare-fun e!1632 () Bool)

(assert (=> b!2301 (= e!1631 e!1632)))

(declare-fun res!4038 () Bool)

(assert (=> b!2301 (=> (not res!4038) (not e!1632))))

(declare-datatypes ((array!219 0))(
  ( (array!220 (arr!475 (Array (_ BitVec 32) (_ BitVec 8))) (size!88 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!154 0))(
  ( (BitStream!155 (buf!397 array!219) (currentByte!1352 (_ BitVec 32)) (currentBit!1347 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!130 0))(
  ( (Unit!131) )
))
(declare-datatypes ((tuple2!172 0))(
  ( (tuple2!173 (_1!93 Unit!130) (_2!93 BitStream!154)) )
))
(declare-fun lt!1786 () tuple2!172)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!2301 (= res!4038 (invariant!0 (currentBit!1347 (_2!93 lt!1786)) (currentByte!1352 (_2!93 lt!1786)) (size!88 (buf!397 (_2!93 lt!1786)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!219)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun thiss!1486 () BitStream!154)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!154 array!219 (_ BitVec 64) (_ BitVec 64)) tuple2!172)

(assert (=> b!2301 (= lt!1786 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!2302 () Bool)

(declare-fun res!4036 () Bool)

(assert (=> b!2302 (=> (not res!4036) (not e!1632))))

(assert (=> b!2302 (= res!4036 (= (size!88 (buf!397 thiss!1486)) (size!88 (buf!397 (_2!93 lt!1786)))))))

(declare-fun b!2303 () Bool)

(assert (=> b!2303 (= e!1632 false)))

(declare-datatypes ((tuple2!174 0))(
  ( (tuple2!175 (_1!94 BitStream!154) (_2!94 BitStream!154)) )
))
(declare-fun lt!1787 () tuple2!174)

(declare-fun reader!0 (BitStream!154 BitStream!154) tuple2!174)

(assert (=> b!2303 (= lt!1787 (reader!0 thiss!1486 (_2!93 lt!1786)))))

(declare-fun b!2304 () Bool)

(declare-fun res!4039 () Bool)

(assert (=> b!2304 (=> (not res!4039) (not e!1632))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!2304 (= res!4039 (= (bitIndex!0 (size!88 (buf!397 (_2!93 lt!1786))) (currentByte!1352 (_2!93 lt!1786)) (currentBit!1347 (_2!93 lt!1786))) (bvadd (bitIndex!0 (size!88 (buf!397 thiss!1486)) (currentByte!1352 thiss!1486) (currentBit!1347 thiss!1486)) nBits!460)))))

(declare-fun res!4037 () Bool)

(assert (=> start!722 (=> (not res!4037) (not e!1631))))

(assert (=> start!722 (= res!4037 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!88 srcBuffer!6))))))))

(assert (=> start!722 e!1631))

(assert (=> start!722 true))

(declare-fun array_inv!83 (array!219) Bool)

(assert (=> start!722 (array_inv!83 srcBuffer!6)))

(declare-fun e!1634 () Bool)

(declare-fun inv!12 (BitStream!154) Bool)

(assert (=> start!722 (and (inv!12 thiss!1486) e!1634)))

(declare-fun b!2305 () Bool)

(declare-fun res!4034 () Bool)

(assert (=> b!2305 (=> (not res!4034) (not e!1632))))

(declare-fun isPrefixOf!0 (BitStream!154 BitStream!154) Bool)

(assert (=> b!2305 (= res!4034 (isPrefixOf!0 thiss!1486 (_2!93 lt!1786)))))

(declare-fun b!2306 () Bool)

(declare-fun res!4035 () Bool)

(assert (=> b!2306 (=> (not res!4035) (not e!1631))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!2306 (= res!4035 (validate_offset_bits!1 ((_ sign_extend 32) (size!88 (buf!397 thiss!1486))) ((_ sign_extend 32) (currentByte!1352 thiss!1486)) ((_ sign_extend 32) (currentBit!1347 thiss!1486)) nBits!460))))

(declare-fun b!2307 () Bool)

(assert (=> b!2307 (= e!1634 (array_inv!83 (buf!397 thiss!1486)))))

(assert (= (and start!722 res!4037) b!2306))

(assert (= (and b!2306 res!4035) b!2301))

(assert (= (and b!2301 res!4038) b!2302))

(assert (= (and b!2302 res!4036) b!2304))

(assert (= (and b!2304 res!4039) b!2305))

(assert (= (and b!2305 res!4034) b!2303))

(assert (= start!722 b!2307))

(declare-fun m!1935 () Bool)

(assert (=> b!2307 m!1935))

(declare-fun m!1937 () Bool)

(assert (=> b!2301 m!1937))

(declare-fun m!1939 () Bool)

(assert (=> b!2301 m!1939))

(declare-fun m!1941 () Bool)

(assert (=> b!2305 m!1941))

(declare-fun m!1943 () Bool)

(assert (=> start!722 m!1943))

(declare-fun m!1945 () Bool)

(assert (=> start!722 m!1945))

(declare-fun m!1947 () Bool)

(assert (=> b!2303 m!1947))

(declare-fun m!1949 () Bool)

(assert (=> b!2306 m!1949))

(declare-fun m!1951 () Bool)

(assert (=> b!2304 m!1951))

(declare-fun m!1953 () Bool)

(assert (=> b!2304 m!1953))

(push 1)

(assert (not start!722))

(assert (not b!2301))

(assert (not b!2303))

(assert (not b!2306))

(assert (not b!2304))

(assert (not b!2305))

(assert (not b!2307))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

