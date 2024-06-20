; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18446 () Bool)

(assert start!18446)

(declare-fun b!91580 () Bool)

(declare-fun e!60201 () Bool)

(declare-fun e!60197 () Bool)

(assert (=> b!91580 (= e!60201 e!60197)))

(declare-fun res!75627 () Bool)

(assert (=> b!91580 (=> (not res!75627) (not e!60197))))

(declare-fun lt!137918 () Bool)

(declare-datatypes ((array!4279 0))(
  ( (array!4280 (arr!2564 (Array (_ BitVec 32) (_ BitVec 8))) (size!1927 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3416 0))(
  ( (BitStream!3417 (buf!2317 array!4279) (currentByte!4616 (_ BitVec 32)) (currentBit!4611 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!5846 0))(
  ( (Unit!5847) )
))
(declare-datatypes ((tuple2!7614 0))(
  ( (tuple2!7615 (_1!4052 Unit!5846) (_2!4052 BitStream!3416)) )
))
(declare-fun lt!137921 () tuple2!7614)

(declare-datatypes ((tuple2!7616 0))(
  ( (tuple2!7617 (_1!4053 BitStream!3416) (_2!4053 Bool)) )
))
(declare-fun lt!137919 () tuple2!7616)

(assert (=> b!91580 (= res!75627 (and (= (_2!4053 lt!137919) lt!137918) (= (_1!4053 lt!137919) (_2!4052 lt!137921))))))

(declare-fun thiss!1152 () BitStream!3416)

(declare-fun readBitPure!0 (BitStream!3416) tuple2!7616)

(declare-fun readerFrom!0 (BitStream!3416 (_ BitVec 32) (_ BitVec 32)) BitStream!3416)

(assert (=> b!91580 (= lt!137919 (readBitPure!0 (readerFrom!0 (_2!4052 lt!137921) (currentBit!4611 thiss!1152) (currentByte!4616 thiss!1152))))))

(declare-fun res!75619 () Bool)

(declare-fun e!60198 () Bool)

(assert (=> start!18446 (=> (not res!75619) (not e!60198))))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> start!18446 (= res!75619 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18446 e!60198))

(declare-fun e!60199 () Bool)

(declare-fun inv!12 (BitStream!3416) Bool)

(assert (=> start!18446 (and (inv!12 thiss!1152) e!60199)))

(declare-fun thiss!1151 () BitStream!3416)

(declare-fun e!60196 () Bool)

(assert (=> start!18446 (and (inv!12 thiss!1151) e!60196)))

(assert (=> start!18446 true))

(declare-fun b!91581 () Bool)

(declare-fun e!60202 () Bool)

(assert (=> b!91581 (= e!60202 e!60201)))

(declare-fun res!75628 () Bool)

(assert (=> b!91581 (=> (not res!75628) (not e!60201))))

(declare-fun lt!137920 () (_ BitVec 64))

(declare-fun lt!137922 () (_ BitVec 64))

(assert (=> b!91581 (= res!75628 (= lt!137920 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!137922)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!91581 (= lt!137920 (bitIndex!0 (size!1927 (buf!2317 (_2!4052 lt!137921))) (currentByte!4616 (_2!4052 lt!137921)) (currentBit!4611 (_2!4052 lt!137921))))))

(declare-fun b!91582 () Bool)

(declare-fun res!75629 () Bool)

(assert (=> b!91582 (=> (not res!75629) (not e!60198))))

(declare-fun i!576 () (_ BitVec 32))

(assert (=> b!91582 (= res!75629 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!91583 () Bool)

(assert (=> b!91583 (= e!60197 (= (bitIndex!0 (size!1927 (buf!2317 (_1!4053 lt!137919))) (currentByte!4616 (_1!4053 lt!137919)) (currentBit!4611 (_1!4053 lt!137919))) lt!137920))))

(declare-fun b!91584 () Bool)

(declare-fun array_inv!1773 (array!4279) Bool)

(assert (=> b!91584 (= e!60196 (array_inv!1773 (buf!2317 thiss!1151)))))

(declare-fun b!91585 () Bool)

(declare-fun res!75621 () Bool)

(declare-fun e!60203 () Bool)

(assert (=> b!91585 (=> (not res!75621) (not e!60203))))

(assert (=> b!91585 (= res!75621 (bvslt i!576 nBits!336))))

(declare-fun b!91586 () Bool)

(declare-fun res!75625 () Bool)

(assert (=> b!91586 (=> (not res!75625) (not e!60201))))

(declare-fun isPrefixOf!0 (BitStream!3416 BitStream!3416) Bool)

(assert (=> b!91586 (= res!75625 (isPrefixOf!0 thiss!1152 (_2!4052 lt!137921)))))

(declare-fun b!91587 () Bool)

(declare-fun res!75620 () Bool)

(assert (=> b!91587 (=> (not res!75620) (not e!60198))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!91587 (= res!75620 (invariant!0 (currentBit!4611 thiss!1151) (currentByte!4616 thiss!1151) (size!1927 (buf!2317 thiss!1151))))))

(declare-fun b!91588 () Bool)

(assert (=> b!91588 (= e!60203 (not true))))

(assert (=> b!91588 e!60202))

(declare-fun res!75630 () Bool)

(assert (=> b!91588 (=> (not res!75630) (not e!60202))))

(assert (=> b!91588 (= res!75630 (= (size!1927 (buf!2317 thiss!1152)) (size!1927 (buf!2317 (_2!4052 lt!137921)))))))

(declare-fun appendBit!0 (BitStream!3416 Bool) tuple2!7614)

(assert (=> b!91588 (= lt!137921 (appendBit!0 thiss!1152 lt!137918))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!91588 (= lt!137918 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!91589 () Bool)

(declare-fun res!75631 () Bool)

(assert (=> b!91589 (=> (not res!75631) (not e!60198))))

(assert (=> b!91589 (= res!75631 (and (bvsle i!576 nBits!336) (= (size!1927 (buf!2317 thiss!1152)) (size!1927 (buf!2317 thiss!1151)))))))

(declare-fun b!91590 () Bool)

(assert (=> b!91590 (= e!60198 e!60203)))

(declare-fun res!75622 () Bool)

(assert (=> b!91590 (=> (not res!75622) (not e!60203))))

(declare-fun lt!137917 () (_ BitVec 64))

(assert (=> b!91590 (= res!75622 (= lt!137922 (bvadd lt!137917 ((_ sign_extend 32) i!576))))))

(assert (=> b!91590 (= lt!137922 (bitIndex!0 (size!1927 (buf!2317 thiss!1152)) (currentByte!4616 thiss!1152) (currentBit!4611 thiss!1152)))))

(assert (=> b!91590 (= lt!137917 (bitIndex!0 (size!1927 (buf!2317 thiss!1151)) (currentByte!4616 thiss!1151) (currentBit!4611 thiss!1151)))))

(declare-fun b!91591 () Bool)

(declare-fun res!75623 () Bool)

(assert (=> b!91591 (=> (not res!75623) (not e!60203))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!91591 (= res!75623 (validate_offset_bits!1 ((_ sign_extend 32) (size!1927 (buf!2317 thiss!1152))) ((_ sign_extend 32) (currentByte!4616 thiss!1152)) ((_ sign_extend 32) (currentBit!4611 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!91592 () Bool)

(declare-fun res!75626 () Bool)

(assert (=> b!91592 (=> (not res!75626) (not e!60198))))

(assert (=> b!91592 (= res!75626 (validate_offset_bits!1 ((_ sign_extend 32) (size!1927 (buf!2317 thiss!1151))) ((_ sign_extend 32) (currentByte!4616 thiss!1151)) ((_ sign_extend 32) (currentBit!4611 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!91593 () Bool)

(assert (=> b!91593 (= e!60199 (array_inv!1773 (buf!2317 thiss!1152)))))

(declare-fun b!91594 () Bool)

(declare-fun res!75624 () Bool)

(assert (=> b!91594 (=> (not res!75624) (not e!60198))))

(assert (=> b!91594 (= res!75624 (invariant!0 (currentBit!4611 thiss!1152) (currentByte!4616 thiss!1152) (size!1927 (buf!2317 thiss!1152))))))

(assert (= (and start!18446 res!75619) b!91592))

(assert (= (and b!91592 res!75626) b!91587))

(assert (= (and b!91587 res!75620) b!91582))

(assert (= (and b!91582 res!75629) b!91594))

(assert (= (and b!91594 res!75624) b!91589))

(assert (= (and b!91589 res!75631) b!91590))

(assert (= (and b!91590 res!75622) b!91591))

(assert (= (and b!91591 res!75623) b!91585))

(assert (= (and b!91585 res!75621) b!91588))

(assert (= (and b!91588 res!75630) b!91581))

(assert (= (and b!91581 res!75628) b!91586))

(assert (= (and b!91586 res!75625) b!91580))

(assert (= (and b!91580 res!75627) b!91583))

(assert (= start!18446 b!91593))

(assert (= start!18446 b!91584))

(declare-fun m!135693 () Bool)

(assert (=> b!91586 m!135693))

(declare-fun m!135695 () Bool)

(assert (=> b!91588 m!135695))

(declare-fun m!135697 () Bool)

(assert (=> b!91584 m!135697))

(declare-fun m!135699 () Bool)

(assert (=> b!91580 m!135699))

(assert (=> b!91580 m!135699))

(declare-fun m!135701 () Bool)

(assert (=> b!91580 m!135701))

(declare-fun m!135703 () Bool)

(assert (=> start!18446 m!135703))

(declare-fun m!135705 () Bool)

(assert (=> start!18446 m!135705))

(declare-fun m!135707 () Bool)

(assert (=> b!91583 m!135707))

(declare-fun m!135709 () Bool)

(assert (=> b!91592 m!135709))

(declare-fun m!135711 () Bool)

(assert (=> b!91587 m!135711))

(declare-fun m!135713 () Bool)

(assert (=> b!91593 m!135713))

(declare-fun m!135715 () Bool)

(assert (=> b!91581 m!135715))

(declare-fun m!135717 () Bool)

(assert (=> b!91594 m!135717))

(declare-fun m!135719 () Bool)

(assert (=> b!91590 m!135719))

(declare-fun m!135721 () Bool)

(assert (=> b!91590 m!135721))

(declare-fun m!135723 () Bool)

(assert (=> b!91591 m!135723))

(push 1)

(assert (not b!91591))

(assert (not b!91588))

(assert (not b!91590))

(assert (not b!91584))

(assert (not b!91583))

(assert (not b!91581))

(assert (not b!91586))

(assert (not b!91593))

(assert (not b!91587))

(assert (not b!91580))

(assert (not b!91594))

(assert (not start!18446))

(assert (not b!91592))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

