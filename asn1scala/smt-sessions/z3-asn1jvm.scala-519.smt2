; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15202 () Bool)

(assert start!15202)

(declare-fun b!77713 () Bool)

(declare-fun res!64227 () Bool)

(declare-fun e!50937 () Bool)

(assert (=> b!77713 (=> (not res!64227) (not e!50937))))

(declare-datatypes ((array!3262 0))(
  ( (array!3263 (arr!2116 (Array (_ BitVec 32) (_ BitVec 8))) (size!1515 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2604 0))(
  ( (BitStream!2605 (buf!1911 array!3262) (currentByte!3728 (_ BitVec 32)) (currentBit!3723 (_ BitVec 32))) )
))
(declare-fun thiss!1090 () BitStream!2604)

(declare-datatypes ((Unit!5127 0))(
  ( (Unit!5128) )
))
(declare-datatypes ((tuple2!6884 0))(
  ( (tuple2!6885 (_1!3576 Unit!5127) (_2!3576 BitStream!2604)) )
))
(declare-fun lt!124653 () tuple2!6884)

(declare-fun nBits!322 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!77713 (= res!64227 (= (bitIndex!0 (size!1515 (buf!1911 (_2!3576 lt!124653))) (currentByte!3728 (_2!3576 lt!124653)) (currentBit!3723 (_2!3576 lt!124653))) (bvadd (bitIndex!0 (size!1515 (buf!1911 thiss!1090)) (currentByte!3728 thiss!1090) (currentBit!3723 thiss!1090)) nBits!322)))))

(declare-fun b!77714 () Bool)

(declare-fun e!50938 () Bool)

(declare-fun array_inv!1361 (array!3262) Bool)

(assert (=> b!77714 (= e!50938 (array_inv!1361 (buf!1911 thiss!1090)))))

(declare-fun b!77715 () Bool)

(declare-fun e!50940 () Bool)

(assert (=> b!77715 (= e!50940 (not true))))

(declare-datatypes ((tuple2!6886 0))(
  ( (tuple2!6887 (_1!3577 BitStream!2604) (_2!3577 BitStream!2604)) )
))
(declare-fun lt!124646 () tuple2!6886)

(declare-fun reader!0 (BitStream!2604 BitStream!2604) tuple2!6886)

(assert (=> b!77715 (= lt!124646 (reader!0 thiss!1090 (_2!3576 lt!124653)))))

(declare-fun lt!124647 () Bool)

(declare-fun isPrefixOf!0 (BitStream!2604 BitStream!2604) Bool)

(assert (=> b!77715 (= lt!124647 (isPrefixOf!0 thiss!1090 (_2!3576 lt!124653)))))

(declare-fun lt!124650 () (_ BitVec 64))

(assert (=> b!77715 (= lt!124650 (bitIndex!0 (size!1515 (buf!1911 (_2!3576 lt!124653))) (currentByte!3728 (_2!3576 lt!124653)) (currentBit!3723 (_2!3576 lt!124653))))))

(declare-fun lt!124649 () (_ BitVec 64))

(assert (=> b!77715 (= lt!124649 (bitIndex!0 (size!1515 (buf!1911 thiss!1090)) (currentByte!3728 thiss!1090) (currentBit!3723 thiss!1090)))))

(assert (=> b!77715 e!50937))

(declare-fun res!64225 () Bool)

(assert (=> b!77715 (=> (not res!64225) (not e!50937))))

(assert (=> b!77715 (= res!64225 (= (size!1515 (buf!1911 thiss!1090)) (size!1515 (buf!1911 (_2!3576 lt!124653)))))))

(declare-fun appendNBits!0 (BitStream!2604 (_ BitVec 64) Bool) tuple2!6884)

(assert (=> b!77715 (= lt!124653 (appendNBits!0 thiss!1090 nBits!322 false))))

(declare-fun b!77716 () Bool)

(declare-fun res!64226 () Bool)

(assert (=> b!77716 (=> (not res!64226) (not e!50937))))

(assert (=> b!77716 (= res!64226 (isPrefixOf!0 thiss!1090 (_2!3576 lt!124653)))))

(declare-fun res!64228 () Bool)

(assert (=> start!15202 (=> (not res!64228) (not e!50940))))

(assert (=> start!15202 (= res!64228 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15202 e!50940))

(assert (=> start!15202 true))

(declare-fun inv!12 (BitStream!2604) Bool)

(assert (=> start!15202 (and (inv!12 thiss!1090) e!50938)))

(declare-fun b!77717 () Bool)

(declare-datatypes ((tuple2!6888 0))(
  ( (tuple2!6889 (_1!3578 BitStream!2604) (_2!3578 Bool)) )
))
(declare-fun lt!124648 () tuple2!6888)

(declare-fun lt!124651 () tuple2!6886)

(assert (=> b!77717 (= e!50937 (not (or (not (_2!3578 lt!124648)) (not (= (_1!3578 lt!124648) (_2!3577 lt!124651))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!2604 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6888)

(assert (=> b!77717 (= lt!124648 (checkBitsLoopPure!0 (_1!3577 lt!124651) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!77717 (validate_offset_bits!1 ((_ sign_extend 32) (size!1515 (buf!1911 (_2!3576 lt!124653)))) ((_ sign_extend 32) (currentByte!3728 thiss!1090)) ((_ sign_extend 32) (currentBit!3723 thiss!1090)) nBits!322)))

(declare-fun lt!124652 () Unit!5127)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2604 array!3262 (_ BitVec 64)) Unit!5127)

(assert (=> b!77717 (= lt!124652 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1911 (_2!3576 lt!124653)) nBits!322))))

(assert (=> b!77717 (= lt!124651 (reader!0 thiss!1090 (_2!3576 lt!124653)))))

(declare-fun b!77718 () Bool)

(declare-fun res!64224 () Bool)

(assert (=> b!77718 (=> (not res!64224) (not e!50940))))

(assert (=> b!77718 (= res!64224 (validate_offset_bits!1 ((_ sign_extend 32) (size!1515 (buf!1911 thiss!1090))) ((_ sign_extend 32) (currentByte!3728 thiss!1090)) ((_ sign_extend 32) (currentBit!3723 thiss!1090)) nBits!322))))

(assert (= (and start!15202 res!64228) b!77718))

(assert (= (and b!77718 res!64224) b!77715))

(assert (= (and b!77715 res!64225) b!77713))

(assert (= (and b!77713 res!64227) b!77716))

(assert (= (and b!77716 res!64226) b!77717))

(assert (= start!15202 b!77714))

(declare-fun m!123291 () Bool)

(assert (=> b!77714 m!123291))

(declare-fun m!123293 () Bool)

(assert (=> start!15202 m!123293))

(declare-fun m!123295 () Bool)

(assert (=> b!77715 m!123295))

(declare-fun m!123297 () Bool)

(assert (=> b!77715 m!123297))

(declare-fun m!123299 () Bool)

(assert (=> b!77715 m!123299))

(declare-fun m!123301 () Bool)

(assert (=> b!77715 m!123301))

(declare-fun m!123303 () Bool)

(assert (=> b!77715 m!123303))

(assert (=> b!77716 m!123303))

(assert (=> b!77713 m!123301))

(assert (=> b!77713 m!123297))

(declare-fun m!123305 () Bool)

(assert (=> b!77718 m!123305))

(declare-fun m!123307 () Bool)

(assert (=> b!77717 m!123307))

(declare-fun m!123309 () Bool)

(assert (=> b!77717 m!123309))

(declare-fun m!123311 () Bool)

(assert (=> b!77717 m!123311))

(assert (=> b!77717 m!123295))

(check-sat (not b!77716) (not b!77718) (not b!77717) (not b!77715) (not b!77714) (not start!15202) (not b!77713))
