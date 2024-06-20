; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3148 () Bool)

(assert start!3148)

(declare-fun b!14268 () Bool)

(declare-fun e!8806 () Bool)

(declare-fun e!8808 () Bool)

(assert (=> b!14268 (= e!8806 e!8808)))

(declare-fun res!13543 () Bool)

(assert (=> b!14268 (=> (not res!13543) (not e!8808))))

(declare-fun lt!21927 () (_ BitVec 64))

(declare-fun lt!21928 () (_ BitVec 64))

(assert (=> b!14268 (= res!13543 (= lt!21927 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!21928)))))

(declare-datatypes ((array!797 0))(
  ( (array!798 (arr!770 (Array (_ BitVec 32) (_ BitVec 8))) (size!341 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!642 0))(
  ( (BitStream!643 (buf!692 array!797) (currentByte!1830 (_ BitVec 32)) (currentBit!1825 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1147 0))(
  ( (Unit!1148) )
))
(declare-datatypes ((tuple2!1674 0))(
  ( (tuple2!1675 (_1!892 Unit!1147) (_2!892 BitStream!642)) )
))
(declare-fun lt!21926 () tuple2!1674)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!14268 (= lt!21927 (bitIndex!0 (size!341 (buf!692 (_2!892 lt!21926))) (currentByte!1830 (_2!892 lt!21926)) (currentBit!1825 (_2!892 lt!21926))))))

(declare-fun thiss!957 () BitStream!642)

(assert (=> b!14268 (= lt!21928 (bitIndex!0 (size!341 (buf!692 thiss!957)) (currentByte!1830 thiss!957) (currentBit!1825 thiss!957)))))

(declare-fun b!14269 () Bool)

(declare-fun e!8802 () Bool)

(declare-fun e!8809 () Bool)

(assert (=> b!14269 (= e!8802 e!8809)))

(declare-fun res!13535 () Bool)

(assert (=> b!14269 (=> (not res!13535) (not e!8809))))

(declare-datatypes ((tuple2!1676 0))(
  ( (tuple2!1677 (_1!893 BitStream!642) (_2!893 Bool)) )
))
(declare-fun lt!21923 () tuple2!1676)

(assert (=> b!14269 (= res!13535 (and (not (_2!893 lt!21923)) (= (_1!893 lt!21923) (_2!892 lt!21926))))))

(declare-fun readBitPure!0 (BitStream!642) tuple2!1676)

(declare-fun readerFrom!0 (BitStream!642 (_ BitVec 32) (_ BitVec 32)) BitStream!642)

(assert (=> b!14269 (= lt!21923 (readBitPure!0 (readerFrom!0 (_2!892 lt!21926) (currentBit!1825 thiss!957) (currentByte!1830 thiss!957))))))

(declare-fun res!13538 () Bool)

(declare-fun e!8810 () Bool)

(assert (=> start!3148 (=> (not res!13538) (not e!8810))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!3148 (= res!13538 (validate_offset_bit!0 ((_ sign_extend 32) (size!341 (buf!692 thiss!957))) ((_ sign_extend 32) (currentByte!1830 thiss!957)) ((_ sign_extend 32) (currentBit!1825 thiss!957))))))

(assert (=> start!3148 e!8810))

(declare-fun e!8805 () Bool)

(declare-fun inv!12 (BitStream!642) Bool)

(assert (=> start!3148 (and (inv!12 thiss!957) e!8805)))

(declare-fun b!14270 () Bool)

(declare-fun e!8807 () Bool)

(assert (=> b!14270 (= e!8810 (not e!8807))))

(declare-fun res!13537 () Bool)

(assert (=> b!14270 (=> (not res!13537) (not e!8807))))

(assert (=> b!14270 (= res!13537 (= (size!341 (buf!692 (_2!892 lt!21926))) (size!341 (buf!692 thiss!957))))))

(assert (=> b!14270 e!8806))

(declare-fun res!13540 () Bool)

(assert (=> b!14270 (=> (not res!13540) (not e!8806))))

(assert (=> b!14270 (= res!13540 (= (size!341 (buf!692 thiss!957)) (size!341 (buf!692 (_2!892 lt!21926)))))))

(declare-fun appendBit!0 (BitStream!642 Bool) tuple2!1674)

(assert (=> b!14270 (= lt!21926 (appendBit!0 thiss!957 false))))

(declare-fun b!14271 () Bool)

(declare-fun e!8804 () Bool)

(declare-fun lt!21924 () tuple2!1676)

(assert (=> b!14271 (= e!8804 (= (bitIndex!0 (size!341 (buf!692 (_1!893 lt!21924))) (currentByte!1830 (_1!893 lt!21924)) (currentBit!1825 (_1!893 lt!21924))) lt!21927))))

(declare-fun b!14272 () Bool)

(assert (=> b!14272 (= e!8807 e!8802)))

(declare-fun res!13539 () Bool)

(assert (=> b!14272 (=> (not res!13539) (not e!8802))))

(declare-fun lt!21925 () (_ BitVec 64))

(declare-fun lt!21929 () (_ BitVec 64))

(assert (=> b!14272 (= res!13539 (= lt!21925 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!21929)))))

(assert (=> b!14272 (= lt!21925 (bitIndex!0 (size!341 (buf!692 (_2!892 lt!21926))) (currentByte!1830 (_2!892 lt!21926)) (currentBit!1825 (_2!892 lt!21926))))))

(assert (=> b!14272 (= lt!21929 (bitIndex!0 (size!341 (buf!692 thiss!957)) (currentByte!1830 thiss!957) (currentBit!1825 thiss!957)))))

(declare-fun b!14273 () Bool)

(declare-fun res!13541 () Bool)

(assert (=> b!14273 (=> (not res!13541) (not e!8808))))

(declare-fun isPrefixOf!0 (BitStream!642 BitStream!642) Bool)

(assert (=> b!14273 (= res!13541 (isPrefixOf!0 thiss!957 (_2!892 lt!21926)))))

(declare-fun b!14274 () Bool)

(assert (=> b!14274 (= e!8809 (= (bitIndex!0 (size!341 (buf!692 (_1!893 lt!21923))) (currentByte!1830 (_1!893 lt!21923)) (currentBit!1825 (_1!893 lt!21923))) lt!21925))))

(declare-fun b!14275 () Bool)

(assert (=> b!14275 (= e!8808 e!8804)))

(declare-fun res!13542 () Bool)

(assert (=> b!14275 (=> (not res!13542) (not e!8804))))

(assert (=> b!14275 (= res!13542 (and (not (_2!893 lt!21924)) (= (_1!893 lt!21924) (_2!892 lt!21926))))))

(assert (=> b!14275 (= lt!21924 (readBitPure!0 (readerFrom!0 (_2!892 lt!21926) (currentBit!1825 thiss!957) (currentByte!1830 thiss!957))))))

(declare-fun b!14276 () Bool)

(declare-fun array_inv!330 (array!797) Bool)

(assert (=> b!14276 (= e!8805 (array_inv!330 (buf!692 thiss!957)))))

(declare-fun b!14277 () Bool)

(declare-fun res!13536 () Bool)

(assert (=> b!14277 (=> (not res!13536) (not e!8802))))

(assert (=> b!14277 (= res!13536 (isPrefixOf!0 thiss!957 (_2!892 lt!21926)))))

(assert (= (and start!3148 res!13538) b!14270))

(assert (= (and b!14270 res!13540) b!14268))

(assert (= (and b!14268 res!13543) b!14273))

(assert (= (and b!14273 res!13541) b!14275))

(assert (= (and b!14275 res!13542) b!14271))

(assert (= (and b!14270 res!13537) b!14272))

(assert (= (and b!14272 res!13539) b!14277))

(assert (= (and b!14277 res!13536) b!14269))

(assert (= (and b!14269 res!13535) b!14274))

(assert (= start!3148 b!14276))

(declare-fun m!20749 () Bool)

(assert (=> b!14268 m!20749))

(declare-fun m!20751 () Bool)

(assert (=> b!14268 m!20751))

(declare-fun m!20753 () Bool)

(assert (=> b!14273 m!20753))

(assert (=> b!14272 m!20749))

(assert (=> b!14272 m!20751))

(declare-fun m!20755 () Bool)

(assert (=> start!3148 m!20755))

(declare-fun m!20757 () Bool)

(assert (=> start!3148 m!20757))

(declare-fun m!20759 () Bool)

(assert (=> b!14269 m!20759))

(assert (=> b!14269 m!20759))

(declare-fun m!20761 () Bool)

(assert (=> b!14269 m!20761))

(assert (=> b!14275 m!20759))

(assert (=> b!14275 m!20759))

(assert (=> b!14275 m!20761))

(declare-fun m!20763 () Bool)

(assert (=> b!14271 m!20763))

(assert (=> b!14277 m!20753))

(declare-fun m!20765 () Bool)

(assert (=> b!14276 m!20765))

(declare-fun m!20767 () Bool)

(assert (=> b!14274 m!20767))

(declare-fun m!20769 () Bool)

(assert (=> b!14270 m!20769))

(check-sat (not b!14269) (not b!14270) (not b!14271) (not start!3148) (not b!14274) (not b!14277) (not b!14268) (not b!14273) (not b!14272) (not b!14275) (not b!14276))
(check-sat)
