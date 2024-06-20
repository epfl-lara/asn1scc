; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15208 () Bool)

(assert start!15208)

(declare-fun b!77767 () Bool)

(declare-fun e!50973 () Bool)

(assert (=> b!77767 (= e!50973 (not true))))

(declare-datatypes ((array!3268 0))(
  ( (array!3269 (arr!2119 (Array (_ BitVec 32) (_ BitVec 8))) (size!1518 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2610 0))(
  ( (BitStream!2611 (buf!1914 array!3268) (currentByte!3731 (_ BitVec 32)) (currentBit!3726 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!6902 0))(
  ( (tuple2!6903 (_1!3585 BitStream!2610) (_2!3585 BitStream!2610)) )
))
(declare-fun lt!124723 () tuple2!6902)

(declare-fun thiss!1090 () BitStream!2610)

(declare-datatypes ((Unit!5133 0))(
  ( (Unit!5134) )
))
(declare-datatypes ((tuple2!6904 0))(
  ( (tuple2!6905 (_1!3586 Unit!5133) (_2!3586 BitStream!2610)) )
))
(declare-fun lt!124724 () tuple2!6904)

(declare-fun reader!0 (BitStream!2610 BitStream!2610) tuple2!6902)

(assert (=> b!77767 (= lt!124723 (reader!0 thiss!1090 (_2!3586 lt!124724)))))

(declare-fun lt!124722 () Bool)

(declare-fun isPrefixOf!0 (BitStream!2610 BitStream!2610) Bool)

(assert (=> b!77767 (= lt!124722 (isPrefixOf!0 thiss!1090 (_2!3586 lt!124724)))))

(declare-fun lt!124718 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!77767 (= lt!124718 (bitIndex!0 (size!1518 (buf!1914 (_2!3586 lt!124724))) (currentByte!3731 (_2!3586 lt!124724)) (currentBit!3726 (_2!3586 lt!124724))))))

(declare-fun lt!124719 () (_ BitVec 64))

(assert (=> b!77767 (= lt!124719 (bitIndex!0 (size!1518 (buf!1914 thiss!1090)) (currentByte!3731 thiss!1090) (currentBit!3726 thiss!1090)))))

(declare-fun e!50976 () Bool)

(assert (=> b!77767 e!50976))

(declare-fun res!64271 () Bool)

(assert (=> b!77767 (=> (not res!64271) (not e!50976))))

(assert (=> b!77767 (= res!64271 (= (size!1518 (buf!1914 thiss!1090)) (size!1518 (buf!1914 (_2!3586 lt!124724)))))))

(declare-fun nBits!322 () (_ BitVec 64))

(declare-fun appendNBits!0 (BitStream!2610 (_ BitVec 64) Bool) tuple2!6904)

(assert (=> b!77767 (= lt!124724 (appendNBits!0 thiss!1090 nBits!322 false))))

(declare-fun b!77768 () Bool)

(declare-fun res!64273 () Bool)

(assert (=> b!77768 (=> (not res!64273) (not e!50976))))

(assert (=> b!77768 (= res!64273 (= (bitIndex!0 (size!1518 (buf!1914 (_2!3586 lt!124724))) (currentByte!3731 (_2!3586 lt!124724)) (currentBit!3726 (_2!3586 lt!124724))) (bvadd (bitIndex!0 (size!1518 (buf!1914 thiss!1090)) (currentByte!3731 thiss!1090) (currentBit!3726 thiss!1090)) nBits!322)))))

(declare-fun b!77769 () Bool)

(declare-fun e!50974 () Bool)

(declare-fun array_inv!1364 (array!3268) Bool)

(assert (=> b!77769 (= e!50974 (array_inv!1364 (buf!1914 thiss!1090)))))

(declare-fun b!77770 () Bool)

(declare-fun res!64270 () Bool)

(assert (=> b!77770 (=> (not res!64270) (not e!50976))))

(assert (=> b!77770 (= res!64270 (isPrefixOf!0 thiss!1090 (_2!3586 lt!124724)))))

(declare-fun b!77771 () Bool)

(declare-datatypes ((tuple2!6906 0))(
  ( (tuple2!6907 (_1!3587 BitStream!2610) (_2!3587 Bool)) )
))
(declare-fun lt!124721 () tuple2!6906)

(declare-fun lt!124720 () tuple2!6902)

(assert (=> b!77771 (= e!50976 (not (or (not (_2!3587 lt!124721)) (not (= (_1!3587 lt!124721) (_2!3585 lt!124720))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!2610 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6906)

(assert (=> b!77771 (= lt!124721 (checkBitsLoopPure!0 (_1!3585 lt!124720) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!77771 (validate_offset_bits!1 ((_ sign_extend 32) (size!1518 (buf!1914 (_2!3586 lt!124724)))) ((_ sign_extend 32) (currentByte!3731 thiss!1090)) ((_ sign_extend 32) (currentBit!3726 thiss!1090)) nBits!322)))

(declare-fun lt!124725 () Unit!5133)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2610 array!3268 (_ BitVec 64)) Unit!5133)

(assert (=> b!77771 (= lt!124725 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1914 (_2!3586 lt!124724)) nBits!322))))

(assert (=> b!77771 (= lt!124720 (reader!0 thiss!1090 (_2!3586 lt!124724)))))

(declare-fun res!64269 () Bool)

(assert (=> start!15208 (=> (not res!64269) (not e!50973))))

(assert (=> start!15208 (= res!64269 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15208 e!50973))

(assert (=> start!15208 true))

(declare-fun inv!12 (BitStream!2610) Bool)

(assert (=> start!15208 (and (inv!12 thiss!1090) e!50974)))

(declare-fun b!77772 () Bool)

(declare-fun res!64272 () Bool)

(assert (=> b!77772 (=> (not res!64272) (not e!50973))))

(assert (=> b!77772 (= res!64272 (validate_offset_bits!1 ((_ sign_extend 32) (size!1518 (buf!1914 thiss!1090))) ((_ sign_extend 32) (currentByte!3731 thiss!1090)) ((_ sign_extend 32) (currentBit!3726 thiss!1090)) nBits!322))))

(assert (= (and start!15208 res!64269) b!77772))

(assert (= (and b!77772 res!64272) b!77767))

(assert (= (and b!77767 res!64271) b!77768))

(assert (= (and b!77768 res!64273) b!77770))

(assert (= (and b!77770 res!64270) b!77771))

(assert (= start!15208 b!77769))

(declare-fun m!123357 () Bool)

(assert (=> start!15208 m!123357))

(declare-fun m!123359 () Bool)

(assert (=> b!77771 m!123359))

(declare-fun m!123361 () Bool)

(assert (=> b!77771 m!123361))

(declare-fun m!123363 () Bool)

(assert (=> b!77771 m!123363))

(declare-fun m!123365 () Bool)

(assert (=> b!77771 m!123365))

(declare-fun m!123367 () Bool)

(assert (=> b!77767 m!123367))

(assert (=> b!77767 m!123365))

(declare-fun m!123369 () Bool)

(assert (=> b!77767 m!123369))

(declare-fun m!123371 () Bool)

(assert (=> b!77767 m!123371))

(declare-fun m!123373 () Bool)

(assert (=> b!77767 m!123373))

(declare-fun m!123375 () Bool)

(assert (=> b!77769 m!123375))

(declare-fun m!123377 () Bool)

(assert (=> b!77772 m!123377))

(assert (=> b!77768 m!123369))

(assert (=> b!77768 m!123367))

(assert (=> b!77770 m!123371))

(check-sat (not b!77767) (not b!77772) (not b!77770) (not b!77769) (not start!15208) (not b!77771) (not b!77768))
