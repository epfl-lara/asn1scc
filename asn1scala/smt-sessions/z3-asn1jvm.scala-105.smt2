; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2674 () Bool)

(assert start!2674)

(declare-fun b!12751 () Bool)

(declare-fun e!7718 () Bool)

(declare-fun e!7716 () Bool)

(assert (=> b!12751 (= e!7718 e!7716)))

(declare-fun res!12145 () Bool)

(assert (=> b!12751 (=> (not res!12145) (not e!7716))))

(declare-datatypes ((array!689 0))(
  ( (array!690 (arr!728 (Array (_ BitVec 32) (_ BitVec 8))) (size!299 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!558 0))(
  ( (BitStream!559 (buf!650 array!689) (currentByte!1734 (_ BitVec 32)) (currentBit!1729 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1081 0))(
  ( (Unit!1082) )
))
(declare-datatypes ((tuple2!1480 0))(
  ( (tuple2!1481 (_1!795 Unit!1081) (_2!795 BitStream!558)) )
))
(declare-fun lt!20598 () tuple2!1480)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!12751 (= res!12145 (invariant!0 (currentBit!1729 (_2!795 lt!20598)) (currentByte!1734 (_2!795 lt!20598)) (size!299 (buf!650 (_2!795 lt!20598)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!689)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun thiss!1486 () BitStream!558)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!558 array!689 (_ BitVec 64) (_ BitVec 64)) tuple2!1480)

(assert (=> b!12751 (= lt!20598 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!12752 () Bool)

(declare-fun res!12147 () Bool)

(assert (=> b!12752 (=> (not res!12147) (not e!7716))))

(assert (=> b!12752 (= res!12147 (= (size!299 (buf!650 thiss!1486)) (size!299 (buf!650 (_2!795 lt!20598)))))))

(declare-fun b!12753 () Bool)

(declare-fun e!7717 () Bool)

(declare-fun array_inv!288 (array!689) Bool)

(assert (=> b!12753 (= e!7717 (array_inv!288 (buf!650 thiss!1486)))))

(declare-fun res!12146 () Bool)

(assert (=> start!2674 (=> (not res!12146) (not e!7718))))

(assert (=> start!2674 (= res!12146 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!299 srcBuffer!6))))))))

(assert (=> start!2674 e!7718))

(assert (=> start!2674 true))

(assert (=> start!2674 (array_inv!288 srcBuffer!6)))

(declare-fun inv!12 (BitStream!558) Bool)

(assert (=> start!2674 (and (inv!12 thiss!1486) e!7717)))

(declare-fun b!12754 () Bool)

(declare-fun res!12150 () Bool)

(declare-fun e!7720 () Bool)

(assert (=> b!12754 (=> res!12150 e!7720)))

(declare-datatypes ((List!175 0))(
  ( (Nil!172) (Cons!171 (h!290 Bool) (t!925 List!175)) )
))
(declare-fun lt!20596 () List!175)

(declare-fun byteArrayBitContentToList!0 (BitStream!558 array!689 (_ BitVec 64) (_ BitVec 64)) List!175)

(assert (=> b!12754 (= res!12150 (not (= lt!20596 (byteArrayBitContentToList!0 (_2!795 lt!20598) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!12755 () Bool)

(declare-fun res!12144 () Bool)

(assert (=> b!12755 (=> (not res!12144) (not e!7716))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!12755 (= res!12144 (= (bitIndex!0 (size!299 (buf!650 (_2!795 lt!20598))) (currentByte!1734 (_2!795 lt!20598)) (currentBit!1729 (_2!795 lt!20598))) (bvadd (bitIndex!0 (size!299 (buf!650 thiss!1486)) (currentByte!1734 thiss!1486) (currentBit!1729 thiss!1486)) nBits!460)))))

(declare-fun b!12756 () Bool)

(declare-fun res!12149 () Bool)

(assert (=> b!12756 (=> (not res!12149) (not e!7716))))

(declare-fun isPrefixOf!0 (BitStream!558 BitStream!558) Bool)

(assert (=> b!12756 (= res!12149 (isPrefixOf!0 thiss!1486 (_2!795 lt!20598)))))

(declare-fun b!12757 () Bool)

(assert (=> b!12757 (= e!7720 true)))

(declare-datatypes ((tuple2!1482 0))(
  ( (tuple2!1483 (_1!796 array!689) (_2!796 BitStream!558)) )
))
(declare-fun lt!20600 () tuple2!1482)

(declare-fun lt!20595 () Unit!1081)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!558 array!689 array!689 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1081)

(assert (=> b!12757 (= lt!20595 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!795 lt!20598) srcBuffer!6 (_1!796 lt!20600) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!12758 () Bool)

(declare-fun res!12151 () Bool)

(assert (=> b!12758 (=> (not res!12151) (not e!7718))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!12758 (= res!12151 (validate_offset_bits!1 ((_ sign_extend 32) (size!299 (buf!650 thiss!1486))) ((_ sign_extend 32) (currentByte!1734 thiss!1486)) ((_ sign_extend 32) (currentBit!1729 thiss!1486)) nBits!460))))

(declare-fun b!12759 () Bool)

(assert (=> b!12759 (= e!7716 (not e!7720))))

(declare-fun res!12148 () Bool)

(assert (=> b!12759 (=> res!12148 e!7720)))

(assert (=> b!12759 (= res!12148 (not (= (byteArrayBitContentToList!0 (_2!795 lt!20598) (_1!796 lt!20600) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!20596)))))

(declare-datatypes ((tuple2!1484 0))(
  ( (tuple2!1485 (_1!797 BitStream!558) (_2!797 BitStream!558)) )
))
(declare-fun lt!20599 () tuple2!1484)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!558 BitStream!558 (_ BitVec 64)) List!175)

(assert (=> b!12759 (= lt!20596 (bitStreamReadBitsIntoList!0 (_2!795 lt!20598) (_1!797 lt!20599) nBits!460))))

(declare-fun readBits!0 (BitStream!558 (_ BitVec 64)) tuple2!1482)

(assert (=> b!12759 (= lt!20600 (readBits!0 (_1!797 lt!20599) nBits!460))))

(assert (=> b!12759 (validate_offset_bits!1 ((_ sign_extend 32) (size!299 (buf!650 (_2!795 lt!20598)))) ((_ sign_extend 32) (currentByte!1734 thiss!1486)) ((_ sign_extend 32) (currentBit!1729 thiss!1486)) nBits!460)))

(declare-fun lt!20597 () Unit!1081)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!558 array!689 (_ BitVec 64)) Unit!1081)

(assert (=> b!12759 (= lt!20597 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!650 (_2!795 lt!20598)) nBits!460))))

(declare-fun reader!0 (BitStream!558 BitStream!558) tuple2!1484)

(assert (=> b!12759 (= lt!20599 (reader!0 thiss!1486 (_2!795 lt!20598)))))

(assert (= (and start!2674 res!12146) b!12758))

(assert (= (and b!12758 res!12151) b!12751))

(assert (= (and b!12751 res!12145) b!12752))

(assert (= (and b!12752 res!12147) b!12755))

(assert (= (and b!12755 res!12144) b!12756))

(assert (= (and b!12756 res!12149) b!12759))

(assert (= (and b!12759 (not res!12148)) b!12754))

(assert (= (and b!12754 (not res!12150)) b!12757))

(assert (= start!2674 b!12753))

(declare-fun m!19287 () Bool)

(assert (=> b!12759 m!19287))

(declare-fun m!19289 () Bool)

(assert (=> b!12759 m!19289))

(declare-fun m!19291 () Bool)

(assert (=> b!12759 m!19291))

(declare-fun m!19293 () Bool)

(assert (=> b!12759 m!19293))

(declare-fun m!19295 () Bool)

(assert (=> b!12759 m!19295))

(declare-fun m!19297 () Bool)

(assert (=> b!12759 m!19297))

(declare-fun m!19299 () Bool)

(assert (=> b!12757 m!19299))

(declare-fun m!19301 () Bool)

(assert (=> b!12756 m!19301))

(declare-fun m!19303 () Bool)

(assert (=> b!12753 m!19303))

(declare-fun m!19305 () Bool)

(assert (=> b!12751 m!19305))

(declare-fun m!19307 () Bool)

(assert (=> b!12751 m!19307))

(declare-fun m!19309 () Bool)

(assert (=> b!12758 m!19309))

(declare-fun m!19311 () Bool)

(assert (=> b!12755 m!19311))

(declare-fun m!19313 () Bool)

(assert (=> b!12755 m!19313))

(declare-fun m!19315 () Bool)

(assert (=> start!2674 m!19315))

(declare-fun m!19317 () Bool)

(assert (=> start!2674 m!19317))

(declare-fun m!19319 () Bool)

(assert (=> b!12754 m!19319))

(check-sat (not b!12751) (not b!12759) (not b!12758) (not b!12754) (not b!12755) (not start!2674) (not b!12753) (not b!12756) (not b!12757))
