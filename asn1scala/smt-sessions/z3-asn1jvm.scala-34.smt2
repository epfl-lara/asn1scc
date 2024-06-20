; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!718 () Bool)

(assert start!718)

(declare-fun b!2259 () Bool)

(declare-fun e!1601 () Bool)

(assert (=> b!2259 (= e!1601 false)))

(declare-datatypes ((array!215 0))(
  ( (array!216 (arr!473 (Array (_ BitVec 32) (_ BitVec 8))) (size!86 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!150 0))(
  ( (BitStream!151 (buf!395 array!215) (currentByte!1350 (_ BitVec 32)) (currentBit!1345 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!164 0))(
  ( (tuple2!165 (_1!89 BitStream!150) (_2!89 BitStream!150)) )
))
(declare-fun lt!1775 () tuple2!164)

(declare-fun thiss!1486 () BitStream!150)

(declare-datatypes ((Unit!126 0))(
  ( (Unit!127) )
))
(declare-datatypes ((tuple2!166 0))(
  ( (tuple2!167 (_1!90 Unit!126) (_2!90 BitStream!150)) )
))
(declare-fun lt!1774 () tuple2!166)

(declare-fun reader!0 (BitStream!150 BitStream!150) tuple2!164)

(assert (=> b!2259 (= lt!1775 (reader!0 thiss!1486 (_2!90 lt!1774)))))

(declare-fun b!2260 () Bool)

(declare-fun res!4000 () Bool)

(assert (=> b!2260 (=> (not res!4000) (not e!1601))))

(declare-fun isPrefixOf!0 (BitStream!150 BitStream!150) Bool)

(assert (=> b!2260 (= res!4000 (isPrefixOf!0 thiss!1486 (_2!90 lt!1774)))))

(declare-fun res!4002 () Bool)

(declare-fun e!1602 () Bool)

(assert (=> start!718 (=> (not res!4002) (not e!1602))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!215)

(assert (=> start!718 (= res!4002 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!86 srcBuffer!6))))))))

(assert (=> start!718 e!1602))

(assert (=> start!718 true))

(declare-fun array_inv!81 (array!215) Bool)

(assert (=> start!718 (array_inv!81 srcBuffer!6)))

(declare-fun e!1603 () Bool)

(declare-fun inv!12 (BitStream!150) Bool)

(assert (=> start!718 (and (inv!12 thiss!1486) e!1603)))

(declare-fun b!2261 () Bool)

(declare-fun res!3998 () Bool)

(assert (=> b!2261 (=> (not res!3998) (not e!1601))))

(assert (=> b!2261 (= res!3998 (= (size!86 (buf!395 thiss!1486)) (size!86 (buf!395 (_2!90 lt!1774)))))))

(declare-fun b!2262 () Bool)

(assert (=> b!2262 (= e!1602 e!1601)))

(declare-fun res!4001 () Bool)

(assert (=> b!2262 (=> (not res!4001) (not e!1601))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!2262 (= res!4001 (invariant!0 (currentBit!1345 (_2!90 lt!1774)) (currentByte!1350 (_2!90 lt!1774)) (size!86 (buf!395 (_2!90 lt!1774)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!150 array!215 (_ BitVec 64) (_ BitVec 64)) tuple2!166)

(assert (=> b!2262 (= lt!1774 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!2263 () Bool)

(declare-fun res!4003 () Bool)

(assert (=> b!2263 (=> (not res!4003) (not e!1602))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!2263 (= res!4003 (validate_offset_bits!1 ((_ sign_extend 32) (size!86 (buf!395 thiss!1486))) ((_ sign_extend 32) (currentByte!1350 thiss!1486)) ((_ sign_extend 32) (currentBit!1345 thiss!1486)) nBits!460))))

(declare-fun b!2264 () Bool)

(assert (=> b!2264 (= e!1603 (array_inv!81 (buf!395 thiss!1486)))))

(declare-fun b!2265 () Bool)

(declare-fun res!3999 () Bool)

(assert (=> b!2265 (=> (not res!3999) (not e!1601))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!2265 (= res!3999 (= (bitIndex!0 (size!86 (buf!395 (_2!90 lt!1774))) (currentByte!1350 (_2!90 lt!1774)) (currentBit!1345 (_2!90 lt!1774))) (bvadd (bitIndex!0 (size!86 (buf!395 thiss!1486)) (currentByte!1350 thiss!1486) (currentBit!1345 thiss!1486)) nBits!460)))))

(assert (= (and start!718 res!4002) b!2263))

(assert (= (and b!2263 res!4003) b!2262))

(assert (= (and b!2262 res!4001) b!2261))

(assert (= (and b!2261 res!3998) b!2265))

(assert (= (and b!2265 res!3999) b!2260))

(assert (= (and b!2260 res!4000) b!2259))

(assert (= start!718 b!2264))

(declare-fun m!1895 () Bool)

(assert (=> b!2265 m!1895))

(declare-fun m!1897 () Bool)

(assert (=> b!2265 m!1897))

(declare-fun m!1899 () Bool)

(assert (=> start!718 m!1899))

(declare-fun m!1901 () Bool)

(assert (=> start!718 m!1901))

(declare-fun m!1903 () Bool)

(assert (=> b!2259 m!1903))

(declare-fun m!1905 () Bool)

(assert (=> b!2260 m!1905))

(declare-fun m!1907 () Bool)

(assert (=> b!2262 m!1907))

(declare-fun m!1909 () Bool)

(assert (=> b!2262 m!1909))

(declare-fun m!1911 () Bool)

(assert (=> b!2263 m!1911))

(declare-fun m!1913 () Bool)

(assert (=> b!2264 m!1913))

(check-sat (not b!2264) (not b!2259) (not b!2260) (not b!2265) (not b!2263) (not b!2262) (not start!718))
