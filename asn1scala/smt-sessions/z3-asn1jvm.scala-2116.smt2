; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53684 () Bool)

(assert start!53684)

(declare-fun b!249436 () Bool)

(declare-fun e!172845 () Bool)

(declare-datatypes ((array!13593 0))(
  ( (array!13594 (arr!6947 (Array (_ BitVec 32) (_ BitVec 8))) (size!5960 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10842 0))(
  ( (BitStream!10843 (buf!6453 array!13593) (currentByte!11884 (_ BitVec 32)) (currentBit!11879 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10842)

(declare-fun array_inv!5701 (array!13593) Bool)

(assert (=> b!249436 (= e!172845 (array_inv!5701 (buf!6453 thiss!1005)))))

(declare-fun res!208760 () Bool)

(declare-fun e!172847 () Bool)

(assert (=> start!53684 (=> (not res!208760) (not e!172847))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!53684 (= res!208760 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53684 e!172847))

(assert (=> start!53684 true))

(declare-fun inv!12 (BitStream!10842) Bool)

(assert (=> start!53684 (and (inv!12 thiss!1005) e!172845)))

(declare-fun b!249437 () Bool)

(declare-fun res!208757 () Bool)

(assert (=> b!249437 (=> (not res!208757) (not e!172847))))

(assert (=> b!249437 (= res!208757 (bvslt from!289 nBits!297))))

(declare-fun b!249438 () Bool)

(declare-fun res!208758 () Bool)

(declare-fun e!172846 () Bool)

(assert (=> b!249438 (=> (not res!208758) (not e!172846))))

(declare-datatypes ((Unit!18056 0))(
  ( (Unit!18057) )
))
(declare-datatypes ((tuple2!21346 0))(
  ( (tuple2!21347 (_1!11598 Unit!18056) (_2!11598 BitStream!10842)) )
))
(declare-fun lt!388209 () tuple2!21346)

(declare-fun isPrefixOf!0 (BitStream!10842 BitStream!10842) Bool)

(assert (=> b!249438 (= res!208758 (isPrefixOf!0 thiss!1005 (_2!11598 lt!388209)))))

(declare-fun b!249439 () Bool)

(declare-fun e!172848 () Bool)

(assert (=> b!249439 (= e!172846 e!172848)))

(declare-fun res!208759 () Bool)

(assert (=> b!249439 (=> (not res!208759) (not e!172848))))

(declare-datatypes ((tuple2!21348 0))(
  ( (tuple2!21349 (_1!11599 BitStream!10842) (_2!11599 Bool)) )
))
(declare-fun lt!388211 () tuple2!21348)

(declare-fun bit!26 () Bool)

(assert (=> b!249439 (= res!208759 (and (= (_2!11599 lt!388211) bit!26) (= (_1!11599 lt!388211) (_2!11598 lt!388209))))))

(declare-fun readBitPure!0 (BitStream!10842) tuple2!21348)

(declare-fun readerFrom!0 (BitStream!10842 (_ BitVec 32) (_ BitVec 32)) BitStream!10842)

(assert (=> b!249439 (= lt!388211 (readBitPure!0 (readerFrom!0 (_2!11598 lt!388209) (currentBit!11879 thiss!1005) (currentByte!11884 thiss!1005))))))

(declare-fun b!249440 () Bool)

(declare-fun e!172850 () Bool)

(assert (=> b!249440 (= e!172850 e!172846)))

(declare-fun res!208761 () Bool)

(assert (=> b!249440 (=> (not res!208761) (not e!172846))))

(declare-fun lt!388212 () (_ BitVec 64))

(declare-fun lt!388210 () (_ BitVec 64))

(assert (=> b!249440 (= res!208761 (= lt!388212 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388210)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!249440 (= lt!388212 (bitIndex!0 (size!5960 (buf!6453 (_2!11598 lt!388209))) (currentByte!11884 (_2!11598 lt!388209)) (currentBit!11879 (_2!11598 lt!388209))))))

(assert (=> b!249440 (= lt!388210 (bitIndex!0 (size!5960 (buf!6453 thiss!1005)) (currentByte!11884 thiss!1005) (currentBit!11879 thiss!1005)))))

(declare-fun b!249441 () Bool)

(assert (=> b!249441 (= e!172848 (= (bitIndex!0 (size!5960 (buf!6453 (_1!11599 lt!388211))) (currentByte!11884 (_1!11599 lt!388211)) (currentBit!11879 (_1!11599 lt!388211))) lt!388212))))

(declare-fun b!249442 () Bool)

(declare-fun res!208756 () Bool)

(assert (=> b!249442 (=> (not res!208756) (not e!172847))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249442 (= res!208756 (validate_offset_bits!1 ((_ sign_extend 32) (size!5960 (buf!6453 thiss!1005))) ((_ sign_extend 32) (currentByte!11884 thiss!1005)) ((_ sign_extend 32) (currentBit!11879 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!249443 () Bool)

(assert (=> b!249443 (= e!172847 (not (bvsle (bitIndex!0 (size!5960 (buf!6453 (_2!11598 lt!388209))) (currentByte!11884 (_2!11598 lt!388209)) (currentBit!11879 (_2!11598 lt!388209))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!5960 (buf!6453 thiss!1005)) (currentByte!11884 thiss!1005) (currentBit!11879 thiss!1005))))))))

(assert (=> b!249443 e!172850))

(declare-fun res!208755 () Bool)

(assert (=> b!249443 (=> (not res!208755) (not e!172850))))

(assert (=> b!249443 (= res!208755 (= (size!5960 (buf!6453 thiss!1005)) (size!5960 (buf!6453 (_2!11598 lt!388209)))))))

(declare-fun appendBit!0 (BitStream!10842 Bool) tuple2!21346)

(assert (=> b!249443 (= lt!388209 (appendBit!0 thiss!1005 bit!26))))

(assert (= (and start!53684 res!208760) b!249442))

(assert (= (and b!249442 res!208756) b!249437))

(assert (= (and b!249437 res!208757) b!249443))

(assert (= (and b!249443 res!208755) b!249440))

(assert (= (and b!249440 res!208761) b!249438))

(assert (= (and b!249438 res!208758) b!249439))

(assert (= (and b!249439 res!208759) b!249441))

(assert (= start!53684 b!249436))

(declare-fun m!375845 () Bool)

(assert (=> start!53684 m!375845))

(declare-fun m!375847 () Bool)

(assert (=> b!249438 m!375847))

(declare-fun m!375849 () Bool)

(assert (=> b!249439 m!375849))

(assert (=> b!249439 m!375849))

(declare-fun m!375851 () Bool)

(assert (=> b!249439 m!375851))

(declare-fun m!375853 () Bool)

(assert (=> b!249441 m!375853))

(declare-fun m!375855 () Bool)

(assert (=> b!249443 m!375855))

(declare-fun m!375857 () Bool)

(assert (=> b!249443 m!375857))

(declare-fun m!375859 () Bool)

(assert (=> b!249443 m!375859))

(declare-fun m!375861 () Bool)

(assert (=> b!249442 m!375861))

(declare-fun m!375863 () Bool)

(assert (=> b!249436 m!375863))

(assert (=> b!249440 m!375855))

(assert (=> b!249440 m!375857))

(check-sat (not b!249439) (not b!249438) (not b!249443) (not b!249442) (not b!249436) (not start!53684) (not b!249440) (not b!249441))
(check-sat)
