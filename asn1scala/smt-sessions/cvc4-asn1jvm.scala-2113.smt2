; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53668 () Bool)

(assert start!53668)

(declare-fun b!249244 () Bool)

(declare-fun res!208587 () Bool)

(declare-fun e!172704 () Bool)

(assert (=> b!249244 (=> (not res!208587) (not e!172704))))

(declare-datatypes ((array!13577 0))(
  ( (array!13578 (arr!6939 (Array (_ BitVec 32) (_ BitVec 8))) (size!5952 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10826 0))(
  ( (BitStream!10827 (buf!6445 array!13577) (currentByte!11876 (_ BitVec 32)) (currentBit!11871 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10826)

(declare-datatypes ((Unit!18040 0))(
  ( (Unit!18041) )
))
(declare-datatypes ((tuple2!21314 0))(
  ( (tuple2!21315 (_1!11582 Unit!18040) (_2!11582 BitStream!10826)) )
))
(declare-fun lt!388115 () tuple2!21314)

(declare-fun isPrefixOf!0 (BitStream!10826 BitStream!10826) Bool)

(assert (=> b!249244 (= res!208587 (isPrefixOf!0 thiss!1005 (_2!11582 lt!388115)))))

(declare-fun res!208589 () Bool)

(declare-fun e!172703 () Bool)

(assert (=> start!53668 (=> (not res!208589) (not e!172703))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!53668 (= res!208589 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53668 e!172703))

(assert (=> start!53668 true))

(declare-fun e!172701 () Bool)

(declare-fun inv!12 (BitStream!10826) Bool)

(assert (=> start!53668 (and (inv!12 thiss!1005) e!172701)))

(declare-fun b!249245 () Bool)

(assert (=> b!249245 (= e!172703 (not true))))

(declare-fun e!172702 () Bool)

(assert (=> b!249245 e!172702))

(declare-fun res!208590 () Bool)

(assert (=> b!249245 (=> (not res!208590) (not e!172702))))

(assert (=> b!249245 (= res!208590 (= (size!5952 (buf!6445 thiss!1005)) (size!5952 (buf!6445 (_2!11582 lt!388115)))))))

(declare-fun bit!26 () Bool)

(declare-fun appendBit!0 (BitStream!10826 Bool) tuple2!21314)

(assert (=> b!249245 (= lt!388115 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!249246 () Bool)

(declare-fun res!208591 () Bool)

(assert (=> b!249246 (=> (not res!208591) (not e!172703))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249246 (= res!208591 (validate_offset_bits!1 ((_ sign_extend 32) (size!5952 (buf!6445 thiss!1005))) ((_ sign_extend 32) (currentByte!11876 thiss!1005)) ((_ sign_extend 32) (currentBit!11871 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!249247 () Bool)

(assert (=> b!249247 (= e!172702 e!172704)))

(declare-fun res!208592 () Bool)

(assert (=> b!249247 (=> (not res!208592) (not e!172704))))

(declare-fun lt!388116 () (_ BitVec 64))

(declare-fun lt!388113 () (_ BitVec 64))

(assert (=> b!249247 (= res!208592 (= lt!388116 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388113)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!249247 (= lt!388116 (bitIndex!0 (size!5952 (buf!6445 (_2!11582 lt!388115))) (currentByte!11876 (_2!11582 lt!388115)) (currentBit!11871 (_2!11582 lt!388115))))))

(assert (=> b!249247 (= lt!388113 (bitIndex!0 (size!5952 (buf!6445 thiss!1005)) (currentByte!11876 thiss!1005) (currentBit!11871 thiss!1005)))))

(declare-fun b!249248 () Bool)

(declare-fun array_inv!5693 (array!13577) Bool)

(assert (=> b!249248 (= e!172701 (array_inv!5693 (buf!6445 thiss!1005)))))

(declare-fun b!249249 () Bool)

(declare-fun e!172706 () Bool)

(assert (=> b!249249 (= e!172704 e!172706)))

(declare-fun res!208593 () Bool)

(assert (=> b!249249 (=> (not res!208593) (not e!172706))))

(declare-datatypes ((tuple2!21316 0))(
  ( (tuple2!21317 (_1!11583 BitStream!10826) (_2!11583 Bool)) )
))
(declare-fun lt!388114 () tuple2!21316)

(assert (=> b!249249 (= res!208593 (and (= (_2!11583 lt!388114) bit!26) (= (_1!11583 lt!388114) (_2!11582 lt!388115))))))

(declare-fun readBitPure!0 (BitStream!10826) tuple2!21316)

(declare-fun readerFrom!0 (BitStream!10826 (_ BitVec 32) (_ BitVec 32)) BitStream!10826)

(assert (=> b!249249 (= lt!388114 (readBitPure!0 (readerFrom!0 (_2!11582 lt!388115) (currentBit!11871 thiss!1005) (currentByte!11876 thiss!1005))))))

(declare-fun b!249250 () Bool)

(assert (=> b!249250 (= e!172706 (= (bitIndex!0 (size!5952 (buf!6445 (_1!11583 lt!388114))) (currentByte!11876 (_1!11583 lt!388114)) (currentBit!11871 (_1!11583 lt!388114))) lt!388116))))

(declare-fun b!249251 () Bool)

(declare-fun res!208588 () Bool)

(assert (=> b!249251 (=> (not res!208588) (not e!172703))))

(assert (=> b!249251 (= res!208588 (bvslt from!289 nBits!297))))

(assert (= (and start!53668 res!208589) b!249246))

(assert (= (and b!249246 res!208591) b!249251))

(assert (= (and b!249251 res!208588) b!249245))

(assert (= (and b!249245 res!208590) b!249247))

(assert (= (and b!249247 res!208592) b!249244))

(assert (= (and b!249244 res!208587) b!249249))

(assert (= (and b!249249 res!208593) b!249250))

(assert (= start!53668 b!249248))

(declare-fun m!375685 () Bool)

(assert (=> b!249250 m!375685))

(declare-fun m!375687 () Bool)

(assert (=> b!249247 m!375687))

(declare-fun m!375689 () Bool)

(assert (=> b!249247 m!375689))

(declare-fun m!375691 () Bool)

(assert (=> b!249249 m!375691))

(assert (=> b!249249 m!375691))

(declare-fun m!375693 () Bool)

(assert (=> b!249249 m!375693))

(declare-fun m!375695 () Bool)

(assert (=> b!249245 m!375695))

(declare-fun m!375697 () Bool)

(assert (=> b!249248 m!375697))

(declare-fun m!375699 () Bool)

(assert (=> b!249244 m!375699))

(declare-fun m!375701 () Bool)

(assert (=> start!53668 m!375701))

(declare-fun m!375703 () Bool)

(assert (=> b!249246 m!375703))

(push 1)

(assert (not b!249246))

(assert (not b!249250))

(assert (not b!249245))

(assert (not b!249244))

(assert (not b!249248))

(assert (not b!249247))

(assert (not b!249249))

(assert (not start!53668))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

