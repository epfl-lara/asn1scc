; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53660 () Bool)

(assert start!53660)

(declare-fun b!249148 () Bool)

(declare-fun res!208505 () Bool)

(declare-fun e!172634 () Bool)

(assert (=> b!249148 (=> (not res!208505) (not e!172634))))

(declare-fun from!289 () (_ BitVec 64))

(declare-datatypes ((array!13569 0))(
  ( (array!13570 (arr!6935 (Array (_ BitVec 32) (_ BitVec 8))) (size!5948 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10818 0))(
  ( (BitStream!10819 (buf!6441 array!13569) (currentByte!11872 (_ BitVec 32)) (currentBit!11867 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10818)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249148 (= res!208505 (validate_offset_bits!1 ((_ sign_extend 32) (size!5948 (buf!6441 thiss!1005))) ((_ sign_extend 32) (currentByte!11872 thiss!1005)) ((_ sign_extend 32) (currentBit!11867 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!249149 () Bool)

(declare-fun res!208509 () Bool)

(declare-fun e!172631 () Bool)

(assert (=> b!249149 (=> (not res!208509) (not e!172631))))

(declare-datatypes ((Unit!18032 0))(
  ( (Unit!18033) )
))
(declare-datatypes ((tuple2!21298 0))(
  ( (tuple2!21299 (_1!11574 Unit!18032) (_2!11574 BitStream!10818)) )
))
(declare-fun lt!388067 () tuple2!21298)

(declare-fun isPrefixOf!0 (BitStream!10818 BitStream!10818) Bool)

(assert (=> b!249149 (= res!208509 (isPrefixOf!0 thiss!1005 (_2!11574 lt!388067)))))

(declare-fun b!249150 () Bool)

(declare-fun e!172632 () Bool)

(assert (=> b!249150 (= e!172632 e!172631)))

(declare-fun res!208503 () Bool)

(assert (=> b!249150 (=> (not res!208503) (not e!172631))))

(declare-fun lt!388066 () (_ BitVec 64))

(declare-fun lt!388068 () (_ BitVec 64))

(assert (=> b!249150 (= res!208503 (= lt!388066 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388068)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!249150 (= lt!388066 (bitIndex!0 (size!5948 (buf!6441 (_2!11574 lt!388067))) (currentByte!11872 (_2!11574 lt!388067)) (currentBit!11867 (_2!11574 lt!388067))))))

(assert (=> b!249150 (= lt!388068 (bitIndex!0 (size!5948 (buf!6441 thiss!1005)) (currentByte!11872 thiss!1005) (currentBit!11867 thiss!1005)))))

(declare-fun b!249151 () Bool)

(assert (=> b!249151 (= e!172634 (not (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!249151 e!172632))

(declare-fun res!208504 () Bool)

(assert (=> b!249151 (=> (not res!208504) (not e!172632))))

(assert (=> b!249151 (= res!208504 (= (size!5948 (buf!6441 thiss!1005)) (size!5948 (buf!6441 (_2!11574 lt!388067)))))))

(declare-fun bit!26 () Bool)

(declare-fun appendBit!0 (BitStream!10818 Bool) tuple2!21298)

(assert (=> b!249151 (= lt!388067 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!249153 () Bool)

(declare-fun res!208506 () Bool)

(assert (=> b!249153 (=> (not res!208506) (not e!172634))))

(assert (=> b!249153 (= res!208506 (bvslt from!289 nBits!297))))

(declare-fun b!249152 () Bool)

(declare-fun e!172633 () Bool)

(declare-datatypes ((tuple2!21300 0))(
  ( (tuple2!21301 (_1!11575 BitStream!10818) (_2!11575 Bool)) )
))
(declare-fun lt!388065 () tuple2!21300)

(assert (=> b!249152 (= e!172633 (= (bitIndex!0 (size!5948 (buf!6441 (_1!11575 lt!388065))) (currentByte!11872 (_1!11575 lt!388065)) (currentBit!11867 (_1!11575 lt!388065))) lt!388066))))

(declare-fun res!208508 () Bool)

(assert (=> start!53660 (=> (not res!208508) (not e!172634))))

(assert (=> start!53660 (= res!208508 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53660 e!172634))

(assert (=> start!53660 true))

(declare-fun e!172630 () Bool)

(declare-fun inv!12 (BitStream!10818) Bool)

(assert (=> start!53660 (and (inv!12 thiss!1005) e!172630)))

(declare-fun b!249154 () Bool)

(declare-fun array_inv!5689 (array!13569) Bool)

(assert (=> b!249154 (= e!172630 (array_inv!5689 (buf!6441 thiss!1005)))))

(declare-fun b!249155 () Bool)

(assert (=> b!249155 (= e!172631 e!172633)))

(declare-fun res!208507 () Bool)

(assert (=> b!249155 (=> (not res!208507) (not e!172633))))

(assert (=> b!249155 (= res!208507 (and (= (_2!11575 lt!388065) bit!26) (= (_1!11575 lt!388065) (_2!11574 lt!388067))))))

(declare-fun readBitPure!0 (BitStream!10818) tuple2!21300)

(declare-fun readerFrom!0 (BitStream!10818 (_ BitVec 32) (_ BitVec 32)) BitStream!10818)

(assert (=> b!249155 (= lt!388065 (readBitPure!0 (readerFrom!0 (_2!11574 lt!388067) (currentBit!11867 thiss!1005) (currentByte!11872 thiss!1005))))))

(assert (= (and start!53660 res!208508) b!249148))

(assert (= (and b!249148 res!208505) b!249153))

(assert (= (and b!249153 res!208506) b!249151))

(assert (= (and b!249151 res!208504) b!249150))

(assert (= (and b!249150 res!208503) b!249149))

(assert (= (and b!249149 res!208509) b!249155))

(assert (= (and b!249155 res!208507) b!249152))

(assert (= start!53660 b!249154))

(declare-fun m!375605 () Bool)

(assert (=> b!249149 m!375605))

(declare-fun m!375607 () Bool)

(assert (=> b!249151 m!375607))

(declare-fun m!375609 () Bool)

(assert (=> b!249155 m!375609))

(assert (=> b!249155 m!375609))

(declare-fun m!375611 () Bool)

(assert (=> b!249155 m!375611))

(declare-fun m!375613 () Bool)

(assert (=> b!249154 m!375613))

(declare-fun m!375615 () Bool)

(assert (=> start!53660 m!375615))

(declare-fun m!375617 () Bool)

(assert (=> b!249148 m!375617))

(declare-fun m!375619 () Bool)

(assert (=> b!249150 m!375619))

(declare-fun m!375621 () Bool)

(assert (=> b!249150 m!375621))

(declare-fun m!375623 () Bool)

(assert (=> b!249152 m!375623))

(check-sat (not b!249151) (not b!249154) (not b!249150) (not b!249148) (not start!53660) (not b!249152) (not b!249149) (not b!249155))
(check-sat)
