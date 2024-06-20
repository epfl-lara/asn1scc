; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41614 () Bool)

(assert start!41614)

(declare-fun b!195609 () Bool)

(declare-fun e!134491 () Bool)

(declare-datatypes ((array!10051 0))(
  ( (array!10052 (arr!5363 (Array (_ BitVec 32) (_ BitVec 8))) (size!4433 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7974 0))(
  ( (BitStream!7975 (buf!4919 array!10051) (currentByte!9221 (_ BitVec 32)) (currentBit!9216 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!16920 0))(
  ( (tuple2!16921 (_1!9105 BitStream!7974) (_2!9105 Bool)) )
))
(declare-fun lt!303965 () tuple2!16920)

(declare-fun lt!303961 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!195609 (= e!134491 (= (bitIndex!0 (size!4433 (buf!4919 (_1!9105 lt!303965))) (currentByte!9221 (_1!9105 lt!303965)) (currentBit!9216 (_1!9105 lt!303965))) lt!303961))))

(declare-fun b!195610 () Bool)

(declare-fun res!163638 () Bool)

(declare-fun e!134490 () Bool)

(assert (=> b!195610 (=> (not res!163638) (not e!134490))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun thiss!1204 () BitStream!7974)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!195610 (= res!163638 (validate_offset_bits!1 ((_ sign_extend 32) (size!4433 (buf!4919 thiss!1204))) ((_ sign_extend 32) (currentByte!9221 thiss!1204)) ((_ sign_extend 32) (currentBit!9216 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!195611 () Bool)

(assert (=> b!195611 (= e!134490 (not true))))

(declare-fun lt!303964 () (_ BitVec 64))

(declare-datatypes ((Unit!13809 0))(
  ( (Unit!13810) )
))
(declare-datatypes ((tuple2!16922 0))(
  ( (tuple2!16923 (_1!9106 Unit!13809) (_2!9106 BitStream!7974)) )
))
(declare-fun lt!303966 () tuple2!16922)

(assert (=> b!195611 (= lt!303964 (bitIndex!0 (size!4433 (buf!4919 (_2!9106 lt!303966))) (currentByte!9221 (_2!9106 lt!303966)) (currentBit!9216 (_2!9106 lt!303966))))))

(declare-fun lt!303967 () (_ BitVec 64))

(assert (=> b!195611 (= lt!303967 (bitIndex!0 (size!4433 (buf!4919 thiss!1204)) (currentByte!9221 thiss!1204) (currentBit!9216 thiss!1204)))))

(declare-fun e!134492 () Bool)

(assert (=> b!195611 e!134492))

(declare-fun res!163635 () Bool)

(assert (=> b!195611 (=> (not res!163635) (not e!134492))))

(assert (=> b!195611 (= res!163635 (= (size!4433 (buf!4919 thiss!1204)) (size!4433 (buf!4919 (_2!9106 lt!303966)))))))

(declare-fun lt!303963 () Bool)

(declare-fun appendBit!0 (BitStream!7974 Bool) tuple2!16922)

(assert (=> b!195611 (= lt!303966 (appendBit!0 thiss!1204 lt!303963))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!195611 (= lt!303963 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!195613 () Bool)

(declare-fun e!134494 () Bool)

(declare-fun array_inv!4174 (array!10051) Bool)

(assert (=> b!195613 (= e!134494 (array_inv!4174 (buf!4919 thiss!1204)))))

(declare-fun b!195614 () Bool)

(declare-fun res!163633 () Bool)

(assert (=> b!195614 (=> (not res!163633) (not e!134490))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!195614 (= res!163633 (invariant!0 (currentBit!9216 thiss!1204) (currentByte!9221 thiss!1204) (size!4433 (buf!4919 thiss!1204))))))

(declare-fun b!195615 () Bool)

(declare-fun res!163631 () Bool)

(assert (=> b!195615 (=> (not res!163631) (not e!134490))))

(assert (=> b!195615 (= res!163631 (not (= i!590 nBits!348)))))

(declare-fun b!195616 () Bool)

(declare-fun res!163637 () Bool)

(declare-fun e!134495 () Bool)

(assert (=> b!195616 (=> (not res!163637) (not e!134495))))

(declare-fun isPrefixOf!0 (BitStream!7974 BitStream!7974) Bool)

(assert (=> b!195616 (= res!163637 (isPrefixOf!0 thiss!1204 (_2!9106 lt!303966)))))

(declare-fun b!195617 () Bool)

(assert (=> b!195617 (= e!134495 e!134491)))

(declare-fun res!163636 () Bool)

(assert (=> b!195617 (=> (not res!163636) (not e!134491))))

(assert (=> b!195617 (= res!163636 (and (= (_2!9105 lt!303965) lt!303963) (= (_1!9105 lt!303965) (_2!9106 lt!303966))))))

(declare-fun readBitPure!0 (BitStream!7974) tuple2!16920)

(declare-fun readerFrom!0 (BitStream!7974 (_ BitVec 32) (_ BitVec 32)) BitStream!7974)

(assert (=> b!195617 (= lt!303965 (readBitPure!0 (readerFrom!0 (_2!9106 lt!303966) (currentBit!9216 thiss!1204) (currentByte!9221 thiss!1204))))))

(declare-fun res!163632 () Bool)

(assert (=> start!41614 (=> (not res!163632) (not e!134490))))

(assert (=> start!41614 (= res!163632 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41614 e!134490))

(assert (=> start!41614 true))

(declare-fun inv!12 (BitStream!7974) Bool)

(assert (=> start!41614 (and (inv!12 thiss!1204) e!134494)))

(declare-fun b!195612 () Bool)

(assert (=> b!195612 (= e!134492 e!134495)))

(declare-fun res!163634 () Bool)

(assert (=> b!195612 (=> (not res!163634) (not e!134495))))

(declare-fun lt!303962 () (_ BitVec 64))

(assert (=> b!195612 (= res!163634 (= lt!303961 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!303962)))))

(assert (=> b!195612 (= lt!303961 (bitIndex!0 (size!4433 (buf!4919 (_2!9106 lt!303966))) (currentByte!9221 (_2!9106 lt!303966)) (currentBit!9216 (_2!9106 lt!303966))))))

(assert (=> b!195612 (= lt!303962 (bitIndex!0 (size!4433 (buf!4919 thiss!1204)) (currentByte!9221 thiss!1204) (currentBit!9216 thiss!1204)))))

(assert (= (and start!41614 res!163632) b!195610))

(assert (= (and b!195610 res!163638) b!195614))

(assert (= (and b!195614 res!163633) b!195615))

(assert (= (and b!195615 res!163631) b!195611))

(assert (= (and b!195611 res!163635) b!195612))

(assert (= (and b!195612 res!163634) b!195616))

(assert (= (and b!195616 res!163637) b!195617))

(assert (= (and b!195617 res!163636) b!195609))

(assert (= start!41614 b!195613))

(declare-fun m!302781 () Bool)

(assert (=> b!195611 m!302781))

(declare-fun m!302783 () Bool)

(assert (=> b!195611 m!302783))

(declare-fun m!302785 () Bool)

(assert (=> b!195611 m!302785))

(declare-fun m!302787 () Bool)

(assert (=> start!41614 m!302787))

(declare-fun m!302789 () Bool)

(assert (=> b!195617 m!302789))

(assert (=> b!195617 m!302789))

(declare-fun m!302791 () Bool)

(assert (=> b!195617 m!302791))

(assert (=> b!195612 m!302781))

(assert (=> b!195612 m!302783))

(declare-fun m!302793 () Bool)

(assert (=> b!195613 m!302793))

(declare-fun m!302795 () Bool)

(assert (=> b!195614 m!302795))

(declare-fun m!302797 () Bool)

(assert (=> b!195610 m!302797))

(declare-fun m!302799 () Bool)

(assert (=> b!195609 m!302799))

(declare-fun m!302801 () Bool)

(assert (=> b!195616 m!302801))

(check-sat (not b!195616) (not b!195617) (not b!195612) (not b!195609) (not b!195610) (not b!195614) (not b!195613) (not b!195611) (not start!41614))
