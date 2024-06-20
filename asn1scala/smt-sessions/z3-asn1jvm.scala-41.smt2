; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!814 () Bool)

(assert start!814)

(declare-fun b!2877 () Bool)

(declare-fun e!2001 () Bool)

(declare-datatypes ((array!260 0))(
  ( (array!261 (arr!494 (Array (_ BitVec 32) (_ BitVec 8))) (size!107 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!192 0))(
  ( (BitStream!193 (buf!419 array!260) (currentByte!1380 (_ BitVec 32)) (currentBit!1375 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!192)

(declare-fun array_inv!102 (array!260) Bool)

(assert (=> b!2877 (= e!2001 (array_inv!102 (buf!419 thiss!1486)))))

(declare-fun b!2878 () Bool)

(declare-fun e!2000 () Bool)

(declare-fun e!2003 () Bool)

(assert (=> b!2878 (= e!2000 e!2003)))

(declare-fun res!4517 () Bool)

(assert (=> b!2878 (=> (not res!4517) (not e!2003))))

(declare-datatypes ((Unit!192 0))(
  ( (Unit!193) )
))
(declare-datatypes ((tuple2!274 0))(
  ( (tuple2!275 (_1!144 Unit!192) (_2!144 BitStream!192)) )
))
(declare-fun lt!2639 () tuple2!274)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!2878 (= res!4517 (invariant!0 (currentBit!1375 (_2!144 lt!2639)) (currentByte!1380 (_2!144 lt!2639)) (size!107 (buf!419 (_2!144 lt!2639)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!260)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!192 array!260 (_ BitVec 64) (_ BitVec 64)) tuple2!274)

(assert (=> b!2878 (= lt!2639 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!2879 () Bool)

(declare-fun res!4520 () Bool)

(assert (=> b!2879 (=> (not res!4520) (not e!2000))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!2879 (= res!4520 (validate_offset_bits!1 ((_ sign_extend 32) (size!107 (buf!419 thiss!1486))) ((_ sign_extend 32) (currentByte!1380 thiss!1486)) ((_ sign_extend 32) (currentBit!1375 thiss!1486)) nBits!460))))

(declare-fun b!2880 () Bool)

(declare-fun res!4518 () Bool)

(assert (=> b!2880 (=> (not res!4518) (not e!2003))))

(assert (=> b!2880 (= res!4518 (= (size!107 (buf!419 thiss!1486)) (size!107 (buf!419 (_2!144 lt!2639)))))))

(declare-fun b!2881 () Bool)

(declare-fun res!4521 () Bool)

(assert (=> b!2881 (=> (not res!4521) (not e!2003))))

(declare-fun isPrefixOf!0 (BitStream!192 BitStream!192) Bool)

(assert (=> b!2881 (= res!4521 (isPrefixOf!0 thiss!1486 (_2!144 lt!2639)))))

(declare-fun b!2883 () Bool)

(assert (=> b!2883 (= e!2003 (not (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460))))))

(declare-datatypes ((tuple2!276 0))(
  ( (tuple2!277 (_1!145 array!260) (_2!145 BitStream!192)) )
))
(declare-fun lt!2641 () tuple2!276)

(declare-datatypes ((tuple2!278 0))(
  ( (tuple2!279 (_1!146 BitStream!192) (_2!146 BitStream!192)) )
))
(declare-fun lt!2642 () tuple2!278)

(declare-fun readBits!0 (BitStream!192 (_ BitVec 64)) tuple2!276)

(assert (=> b!2883 (= lt!2641 (readBits!0 (_1!146 lt!2642) nBits!460))))

(assert (=> b!2883 (validate_offset_bits!1 ((_ sign_extend 32) (size!107 (buf!419 (_2!144 lt!2639)))) ((_ sign_extend 32) (currentByte!1380 thiss!1486)) ((_ sign_extend 32) (currentBit!1375 thiss!1486)) nBits!460)))

(declare-fun lt!2640 () Unit!192)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!192 array!260 (_ BitVec 64)) Unit!192)

(assert (=> b!2883 (= lt!2640 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!419 (_2!144 lt!2639)) nBits!460))))

(declare-fun reader!0 (BitStream!192 BitStream!192) tuple2!278)

(assert (=> b!2883 (= lt!2642 (reader!0 thiss!1486 (_2!144 lt!2639)))))

(declare-fun res!4522 () Bool)

(assert (=> start!814 (=> (not res!4522) (not e!2000))))

(assert (=> start!814 (= res!4522 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!107 srcBuffer!6))))))))

(assert (=> start!814 e!2000))

(assert (=> start!814 true))

(assert (=> start!814 (array_inv!102 srcBuffer!6)))

(declare-fun inv!12 (BitStream!192) Bool)

(assert (=> start!814 (and (inv!12 thiss!1486) e!2001)))

(declare-fun b!2882 () Bool)

(declare-fun res!4519 () Bool)

(assert (=> b!2882 (=> (not res!4519) (not e!2003))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!2882 (= res!4519 (= (bitIndex!0 (size!107 (buf!419 (_2!144 lt!2639))) (currentByte!1380 (_2!144 lt!2639)) (currentBit!1375 (_2!144 lt!2639))) (bvadd (bitIndex!0 (size!107 (buf!419 thiss!1486)) (currentByte!1380 thiss!1486) (currentBit!1375 thiss!1486)) nBits!460)))))

(assert (= (and start!814 res!4522) b!2879))

(assert (= (and b!2879 res!4520) b!2878))

(assert (= (and b!2878 res!4517) b!2880))

(assert (= (and b!2880 res!4518) b!2882))

(assert (= (and b!2882 res!4519) b!2881))

(assert (= (and b!2881 res!4521) b!2883))

(assert (= start!814 b!2877))

(declare-fun m!2795 () Bool)

(assert (=> b!2879 m!2795))

(declare-fun m!2797 () Bool)

(assert (=> b!2881 m!2797))

(declare-fun m!2799 () Bool)

(assert (=> b!2883 m!2799))

(declare-fun m!2801 () Bool)

(assert (=> b!2883 m!2801))

(declare-fun m!2803 () Bool)

(assert (=> b!2883 m!2803))

(declare-fun m!2805 () Bool)

(assert (=> b!2883 m!2805))

(declare-fun m!2807 () Bool)

(assert (=> start!814 m!2807))

(declare-fun m!2809 () Bool)

(assert (=> start!814 m!2809))

(declare-fun m!2811 () Bool)

(assert (=> b!2877 m!2811))

(declare-fun m!2813 () Bool)

(assert (=> b!2882 m!2813))

(declare-fun m!2815 () Bool)

(assert (=> b!2882 m!2815))

(declare-fun m!2817 () Bool)

(assert (=> b!2878 m!2817))

(declare-fun m!2819 () Bool)

(assert (=> b!2878 m!2819))

(check-sat (not b!2879) (not b!2881) (not b!2877) (not b!2878) (not b!2883) (not b!2882) (not start!814))
(check-sat)
