; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42830 () Bool)

(assert start!42830)

(declare-fun b!201759 () Bool)

(declare-fun e!138357 () Bool)

(declare-fun lt!314594 () (_ BitVec 64))

(declare-fun lt!314591 () (_ BitVec 64))

(assert (=> b!201759 (= e!138357 (or (not (= lt!314594 #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!314594 (bvand lt!314591 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!314597 () (_ BitVec 64))

(assert (=> b!201759 (= lt!314594 (bvand lt!314597 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!201760 () Bool)

(declare-fun e!138361 () Bool)

(declare-datatypes ((array!10255 0))(
  ( (array!10256 (arr!5444 (Array (_ BitVec 32) (_ BitVec 8))) (size!4514 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8136 0))(
  ( (BitStream!8137 (buf!5019 array!10255) (currentByte!9441 (_ BitVec 32)) (currentBit!9436 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8136)

(declare-fun array_inv!4255 (array!10255) Bool)

(assert (=> b!201760 (= e!138361 (array_inv!4255 (buf!5019 thiss!1204)))))

(declare-fun b!201762 () Bool)

(declare-fun res!168946 () Bool)

(declare-fun e!138363 () Bool)

(assert (=> b!201762 (=> (not res!168946) (not e!138363))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!201762 (= res!168946 (not (= i!590 nBits!348)))))

(declare-fun b!201763 () Bool)

(declare-fun e!138360 () Bool)

(declare-fun e!138362 () Bool)

(assert (=> b!201763 (= e!138360 e!138362)))

(declare-fun res!168944 () Bool)

(assert (=> b!201763 (=> (not res!168944) (not e!138362))))

(declare-datatypes ((tuple2!17250 0))(
  ( (tuple2!17251 (_1!9277 BitStream!8136) (_2!9277 Bool)) )
))
(declare-fun lt!314590 () tuple2!17250)

(declare-datatypes ((Unit!14321 0))(
  ( (Unit!14322) )
))
(declare-datatypes ((tuple2!17252 0))(
  ( (tuple2!17253 (_1!9278 Unit!14321) (_2!9278 BitStream!8136)) )
))
(declare-fun lt!314596 () tuple2!17252)

(declare-fun lt!314595 () Bool)

(assert (=> b!201763 (= res!168944 (and (= (_2!9277 lt!314590) lt!314595) (= (_1!9277 lt!314590) (_2!9278 lt!314596))))))

(declare-fun readBitPure!0 (BitStream!8136) tuple2!17250)

(declare-fun readerFrom!0 (BitStream!8136 (_ BitVec 32) (_ BitVec 32)) BitStream!8136)

(assert (=> b!201763 (= lt!314590 (readBitPure!0 (readerFrom!0 (_2!9278 lt!314596) (currentBit!9436 thiss!1204) (currentByte!9441 thiss!1204))))))

(declare-fun b!201764 () Bool)

(assert (=> b!201764 (= e!138363 (not e!138357))))

(declare-fun res!168939 () Bool)

(assert (=> b!201764 (=> res!168939 e!138357)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!201764 (= res!168939 (not (= (bitIndex!0 (size!4514 (buf!5019 (_2!9278 lt!314596))) (currentByte!9441 (_2!9278 lt!314596)) (currentBit!9436 (_2!9278 lt!314596))) lt!314591)))))

(assert (=> b!201764 (= lt!314591 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!314597))))

(assert (=> b!201764 (= lt!314597 (bitIndex!0 (size!4514 (buf!5019 thiss!1204)) (currentByte!9441 thiss!1204) (currentBit!9436 thiss!1204)))))

(declare-fun e!138359 () Bool)

(assert (=> b!201764 e!138359))

(declare-fun res!168941 () Bool)

(assert (=> b!201764 (=> (not res!168941) (not e!138359))))

(assert (=> b!201764 (= res!168941 (= (size!4514 (buf!5019 thiss!1204)) (size!4514 (buf!5019 (_2!9278 lt!314596)))))))

(declare-fun appendBit!0 (BitStream!8136 Bool) tuple2!17252)

(assert (=> b!201764 (= lt!314596 (appendBit!0 thiss!1204 lt!314595))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!201764 (= lt!314595 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!201765 () Bool)

(assert (=> b!201765 (= e!138359 e!138360)))

(declare-fun res!168947 () Bool)

(assert (=> b!201765 (=> (not res!168947) (not e!138360))))

(declare-fun lt!314592 () (_ BitVec 64))

(declare-fun lt!314593 () (_ BitVec 64))

(assert (=> b!201765 (= res!168947 (= lt!314592 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!314593)))))

(assert (=> b!201765 (= lt!314592 (bitIndex!0 (size!4514 (buf!5019 (_2!9278 lt!314596))) (currentByte!9441 (_2!9278 lt!314596)) (currentBit!9436 (_2!9278 lt!314596))))))

(assert (=> b!201765 (= lt!314593 (bitIndex!0 (size!4514 (buf!5019 thiss!1204)) (currentByte!9441 thiss!1204) (currentBit!9436 thiss!1204)))))

(declare-fun b!201766 () Bool)

(declare-fun res!168945 () Bool)

(assert (=> b!201766 (=> (not res!168945) (not e!138363))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!201766 (= res!168945 (validate_offset_bits!1 ((_ sign_extend 32) (size!4514 (buf!5019 thiss!1204))) ((_ sign_extend 32) (currentByte!9441 thiss!1204)) ((_ sign_extend 32) (currentBit!9436 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!201761 () Bool)

(declare-fun res!168943 () Bool)

(assert (=> b!201761 (=> (not res!168943) (not e!138363))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!201761 (= res!168943 (invariant!0 (currentBit!9436 thiss!1204) (currentByte!9441 thiss!1204) (size!4514 (buf!5019 thiss!1204))))))

(declare-fun res!168942 () Bool)

(assert (=> start!42830 (=> (not res!168942) (not e!138363))))

(assert (=> start!42830 (= res!168942 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42830 e!138363))

(assert (=> start!42830 true))

(declare-fun inv!12 (BitStream!8136) Bool)

(assert (=> start!42830 (and (inv!12 thiss!1204) e!138361)))

(declare-fun b!201767 () Bool)

(assert (=> b!201767 (= e!138362 (= (bitIndex!0 (size!4514 (buf!5019 (_1!9277 lt!314590))) (currentByte!9441 (_1!9277 lt!314590)) (currentBit!9436 (_1!9277 lt!314590))) lt!314592))))

(declare-fun b!201768 () Bool)

(declare-fun res!168940 () Bool)

(assert (=> b!201768 (=> (not res!168940) (not e!138360))))

(declare-fun isPrefixOf!0 (BitStream!8136 BitStream!8136) Bool)

(assert (=> b!201768 (= res!168940 (isPrefixOf!0 thiss!1204 (_2!9278 lt!314596)))))

(assert (= (and start!42830 res!168942) b!201766))

(assert (= (and b!201766 res!168945) b!201761))

(assert (= (and b!201761 res!168943) b!201762))

(assert (= (and b!201762 res!168946) b!201764))

(assert (= (and b!201764 res!168941) b!201765))

(assert (= (and b!201765 res!168947) b!201768))

(assert (= (and b!201768 res!168940) b!201763))

(assert (= (and b!201763 res!168944) b!201767))

(assert (= (and b!201764 (not res!168939)) b!201759))

(assert (= start!42830 b!201760))

(declare-fun m!312301 () Bool)

(assert (=> b!201761 m!312301))

(declare-fun m!312303 () Bool)

(assert (=> b!201765 m!312303))

(declare-fun m!312305 () Bool)

(assert (=> b!201765 m!312305))

(declare-fun m!312307 () Bool)

(assert (=> start!42830 m!312307))

(declare-fun m!312309 () Bool)

(assert (=> b!201760 m!312309))

(declare-fun m!312311 () Bool)

(assert (=> b!201768 m!312311))

(declare-fun m!312313 () Bool)

(assert (=> b!201763 m!312313))

(assert (=> b!201763 m!312313))

(declare-fun m!312315 () Bool)

(assert (=> b!201763 m!312315))

(assert (=> b!201764 m!312303))

(assert (=> b!201764 m!312305))

(declare-fun m!312317 () Bool)

(assert (=> b!201764 m!312317))

(declare-fun m!312319 () Bool)

(assert (=> b!201767 m!312319))

(declare-fun m!312321 () Bool)

(assert (=> b!201766 m!312321))

(check-sat (not b!201765) (not b!201761) (not b!201768) (not b!201767) (not b!201760) (not start!42830) (not b!201763) (not b!201764) (not b!201766))
(check-sat)
(get-model)

(declare-fun d!69135 () Bool)

(assert (=> d!69135 (= (invariant!0 (currentBit!9436 thiss!1204) (currentByte!9441 thiss!1204) (size!4514 (buf!5019 thiss!1204))) (and (bvsge (currentBit!9436 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9436 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9441 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9441 thiss!1204) (size!4514 (buf!5019 thiss!1204))) (and (= (currentBit!9436 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9441 thiss!1204) (size!4514 (buf!5019 thiss!1204)))))))))

(assert (=> b!201761 d!69135))

(declare-fun d!69137 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!69137 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4514 (buf!5019 thiss!1204))) ((_ sign_extend 32) (currentByte!9441 thiss!1204)) ((_ sign_extend 32) (currentBit!9436 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4514 (buf!5019 thiss!1204))) ((_ sign_extend 32) (currentByte!9441 thiss!1204)) ((_ sign_extend 32) (currentBit!9436 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!17061 () Bool)

(assert (= bs!17061 d!69137))

(declare-fun m!312345 () Bool)

(assert (=> bs!17061 m!312345))

(assert (=> b!201766 d!69137))

(declare-fun d!69139 () Bool)

(declare-fun e!138387 () Bool)

(assert (=> d!69139 e!138387))

(declare-fun res!168979 () Bool)

(assert (=> d!69139 (=> (not res!168979) (not e!138387))))

(declare-fun lt!314639 () (_ BitVec 64))

(declare-fun lt!314637 () (_ BitVec 64))

(declare-fun lt!314634 () (_ BitVec 64))

(assert (=> d!69139 (= res!168979 (= lt!314634 (bvsub lt!314639 lt!314637)))))

(assert (=> d!69139 (or (= (bvand lt!314639 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!314637 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!314639 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!314639 lt!314637) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69139 (= lt!314637 (remainingBits!0 ((_ sign_extend 32) (size!4514 (buf!5019 (_1!9277 lt!314590)))) ((_ sign_extend 32) (currentByte!9441 (_1!9277 lt!314590))) ((_ sign_extend 32) (currentBit!9436 (_1!9277 lt!314590)))))))

(declare-fun lt!314636 () (_ BitVec 64))

(declare-fun lt!314638 () (_ BitVec 64))

(assert (=> d!69139 (= lt!314639 (bvmul lt!314636 lt!314638))))

(assert (=> d!69139 (or (= lt!314636 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!314638 (bvsdiv (bvmul lt!314636 lt!314638) lt!314636)))))

(assert (=> d!69139 (= lt!314638 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69139 (= lt!314636 ((_ sign_extend 32) (size!4514 (buf!5019 (_1!9277 lt!314590)))))))

(assert (=> d!69139 (= lt!314634 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9441 (_1!9277 lt!314590))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9436 (_1!9277 lt!314590)))))))

(assert (=> d!69139 (invariant!0 (currentBit!9436 (_1!9277 lt!314590)) (currentByte!9441 (_1!9277 lt!314590)) (size!4514 (buf!5019 (_1!9277 lt!314590))))))

(assert (=> d!69139 (= (bitIndex!0 (size!4514 (buf!5019 (_1!9277 lt!314590))) (currentByte!9441 (_1!9277 lt!314590)) (currentBit!9436 (_1!9277 lt!314590))) lt!314634)))

(declare-fun b!201803 () Bool)

(declare-fun res!168980 () Bool)

(assert (=> b!201803 (=> (not res!168980) (not e!138387))))

(assert (=> b!201803 (= res!168980 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!314634))))

(declare-fun b!201804 () Bool)

(declare-fun lt!314635 () (_ BitVec 64))

(assert (=> b!201804 (= e!138387 (bvsle lt!314634 (bvmul lt!314635 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!201804 (or (= lt!314635 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!314635 #b0000000000000000000000000000000000000000000000000000000000001000) lt!314635)))))

(assert (=> b!201804 (= lt!314635 ((_ sign_extend 32) (size!4514 (buf!5019 (_1!9277 lt!314590)))))))

(assert (= (and d!69139 res!168979) b!201803))

(assert (= (and b!201803 res!168980) b!201804))

(declare-fun m!312349 () Bool)

(assert (=> d!69139 m!312349))

(declare-fun m!312351 () Bool)

(assert (=> d!69139 m!312351))

(assert (=> b!201767 d!69139))

(declare-fun d!69145 () Bool)

(declare-fun e!138388 () Bool)

(assert (=> d!69145 e!138388))

(declare-fun res!168981 () Bool)

(assert (=> d!69145 (=> (not res!168981) (not e!138388))))

(declare-fun lt!314640 () (_ BitVec 64))

(declare-fun lt!314643 () (_ BitVec 64))

(declare-fun lt!314645 () (_ BitVec 64))

(assert (=> d!69145 (= res!168981 (= lt!314640 (bvsub lt!314645 lt!314643)))))

(assert (=> d!69145 (or (= (bvand lt!314645 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!314643 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!314645 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!314645 lt!314643) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69145 (= lt!314643 (remainingBits!0 ((_ sign_extend 32) (size!4514 (buf!5019 (_2!9278 lt!314596)))) ((_ sign_extend 32) (currentByte!9441 (_2!9278 lt!314596))) ((_ sign_extend 32) (currentBit!9436 (_2!9278 lt!314596)))))))

(declare-fun lt!314642 () (_ BitVec 64))

(declare-fun lt!314644 () (_ BitVec 64))

(assert (=> d!69145 (= lt!314645 (bvmul lt!314642 lt!314644))))

(assert (=> d!69145 (or (= lt!314642 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!314644 (bvsdiv (bvmul lt!314642 lt!314644) lt!314642)))))

(assert (=> d!69145 (= lt!314644 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69145 (= lt!314642 ((_ sign_extend 32) (size!4514 (buf!5019 (_2!9278 lt!314596)))))))

(assert (=> d!69145 (= lt!314640 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9441 (_2!9278 lt!314596))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9436 (_2!9278 lt!314596)))))))

(assert (=> d!69145 (invariant!0 (currentBit!9436 (_2!9278 lt!314596)) (currentByte!9441 (_2!9278 lt!314596)) (size!4514 (buf!5019 (_2!9278 lt!314596))))))

(assert (=> d!69145 (= (bitIndex!0 (size!4514 (buf!5019 (_2!9278 lt!314596))) (currentByte!9441 (_2!9278 lt!314596)) (currentBit!9436 (_2!9278 lt!314596))) lt!314640)))

(declare-fun b!201805 () Bool)

(declare-fun res!168982 () Bool)

(assert (=> b!201805 (=> (not res!168982) (not e!138388))))

(assert (=> b!201805 (= res!168982 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!314640))))

(declare-fun b!201806 () Bool)

(declare-fun lt!314641 () (_ BitVec 64))

(assert (=> b!201806 (= e!138388 (bvsle lt!314640 (bvmul lt!314641 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!201806 (or (= lt!314641 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!314641 #b0000000000000000000000000000000000000000000000000000000000001000) lt!314641)))))

(assert (=> b!201806 (= lt!314641 ((_ sign_extend 32) (size!4514 (buf!5019 (_2!9278 lt!314596)))))))

(assert (= (and d!69145 res!168981) b!201805))

(assert (= (and b!201805 res!168982) b!201806))

(declare-fun m!312353 () Bool)

(assert (=> d!69145 m!312353))

(declare-fun m!312355 () Bool)

(assert (=> d!69145 m!312355))

(assert (=> b!201765 d!69145))

(declare-fun d!69147 () Bool)

(declare-fun e!138389 () Bool)

(assert (=> d!69147 e!138389))

(declare-fun res!168983 () Bool)

(assert (=> d!69147 (=> (not res!168983) (not e!138389))))

(declare-fun lt!314649 () (_ BitVec 64))

(declare-fun lt!314646 () (_ BitVec 64))

(declare-fun lt!314651 () (_ BitVec 64))

(assert (=> d!69147 (= res!168983 (= lt!314646 (bvsub lt!314651 lt!314649)))))

(assert (=> d!69147 (or (= (bvand lt!314651 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!314649 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!314651 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!314651 lt!314649) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69147 (= lt!314649 (remainingBits!0 ((_ sign_extend 32) (size!4514 (buf!5019 thiss!1204))) ((_ sign_extend 32) (currentByte!9441 thiss!1204)) ((_ sign_extend 32) (currentBit!9436 thiss!1204))))))

(declare-fun lt!314648 () (_ BitVec 64))

(declare-fun lt!314650 () (_ BitVec 64))

(assert (=> d!69147 (= lt!314651 (bvmul lt!314648 lt!314650))))

(assert (=> d!69147 (or (= lt!314648 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!314650 (bvsdiv (bvmul lt!314648 lt!314650) lt!314648)))))

(assert (=> d!69147 (= lt!314650 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69147 (= lt!314648 ((_ sign_extend 32) (size!4514 (buf!5019 thiss!1204))))))

(assert (=> d!69147 (= lt!314646 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9441 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9436 thiss!1204))))))

(assert (=> d!69147 (invariant!0 (currentBit!9436 thiss!1204) (currentByte!9441 thiss!1204) (size!4514 (buf!5019 thiss!1204)))))

(assert (=> d!69147 (= (bitIndex!0 (size!4514 (buf!5019 thiss!1204)) (currentByte!9441 thiss!1204) (currentBit!9436 thiss!1204)) lt!314646)))

(declare-fun b!201807 () Bool)

(declare-fun res!168984 () Bool)

(assert (=> b!201807 (=> (not res!168984) (not e!138389))))

(assert (=> b!201807 (= res!168984 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!314646))))

(declare-fun b!201808 () Bool)

(declare-fun lt!314647 () (_ BitVec 64))

(assert (=> b!201808 (= e!138389 (bvsle lt!314646 (bvmul lt!314647 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!201808 (or (= lt!314647 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!314647 #b0000000000000000000000000000000000000000000000000000000000001000) lt!314647)))))

(assert (=> b!201808 (= lt!314647 ((_ sign_extend 32) (size!4514 (buf!5019 thiss!1204))))))

(assert (= (and d!69147 res!168983) b!201807))

(assert (= (and b!201807 res!168984) b!201808))

(assert (=> d!69147 m!312345))

(assert (=> d!69147 m!312301))

(assert (=> b!201765 d!69147))

(declare-fun d!69151 () Bool)

(assert (=> d!69151 (= (array_inv!4255 (buf!5019 thiss!1204)) (bvsge (size!4514 (buf!5019 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!201760 d!69151))

(assert (=> b!201764 d!69145))

(assert (=> b!201764 d!69147))

(declare-fun b!201837 () Bool)

(declare-fun e!138402 () Bool)

(declare-fun lt!314710 () tuple2!17250)

(declare-fun lt!314711 () tuple2!17252)

(assert (=> b!201837 (= e!138402 (= (bitIndex!0 (size!4514 (buf!5019 (_1!9277 lt!314710))) (currentByte!9441 (_1!9277 lt!314710)) (currentBit!9436 (_1!9277 lt!314710))) (bitIndex!0 (size!4514 (buf!5019 (_2!9278 lt!314711))) (currentByte!9441 (_2!9278 lt!314711)) (currentBit!9436 (_2!9278 lt!314711)))))))

(declare-fun b!201834 () Bool)

(declare-fun res!169012 () Bool)

(declare-fun e!138403 () Bool)

(assert (=> b!201834 (=> (not res!169012) (not e!138403))))

(declare-fun lt!314709 () (_ BitVec 64))

(declare-fun lt!314708 () (_ BitVec 64))

(assert (=> b!201834 (= res!169012 (= (bitIndex!0 (size!4514 (buf!5019 (_2!9278 lt!314711))) (currentByte!9441 (_2!9278 lt!314711)) (currentBit!9436 (_2!9278 lt!314711))) (bvadd lt!314709 lt!314708)))))

(assert (=> b!201834 (or (not (= (bvand lt!314709 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!314708 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!314709 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!314709 lt!314708) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!201834 (= lt!314708 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!201834 (= lt!314709 (bitIndex!0 (size!4514 (buf!5019 thiss!1204)) (currentByte!9441 thiss!1204) (currentBit!9436 thiss!1204)))))

(declare-fun d!69153 () Bool)

(assert (=> d!69153 e!138403))

(declare-fun res!169009 () Bool)

(assert (=> d!69153 (=> (not res!169009) (not e!138403))))

(assert (=> d!69153 (= res!169009 (= (size!4514 (buf!5019 thiss!1204)) (size!4514 (buf!5019 (_2!9278 lt!314711)))))))

(declare-fun choose!16 (BitStream!8136 Bool) tuple2!17252)

(assert (=> d!69153 (= lt!314711 (choose!16 thiss!1204 lt!314595))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!69153 (validate_offset_bit!0 ((_ sign_extend 32) (size!4514 (buf!5019 thiss!1204))) ((_ sign_extend 32) (currentByte!9441 thiss!1204)) ((_ sign_extend 32) (currentBit!9436 thiss!1204)))))

(assert (=> d!69153 (= (appendBit!0 thiss!1204 lt!314595) lt!314711)))

(declare-fun b!201835 () Bool)

(declare-fun res!169010 () Bool)

(assert (=> b!201835 (=> (not res!169010) (not e!138403))))

(assert (=> b!201835 (= res!169010 (isPrefixOf!0 thiss!1204 (_2!9278 lt!314711)))))

(declare-fun b!201836 () Bool)

(assert (=> b!201836 (= e!138403 e!138402)))

(declare-fun res!169011 () Bool)

(assert (=> b!201836 (=> (not res!169011) (not e!138402))))

(assert (=> b!201836 (= res!169011 (and (= (_2!9277 lt!314710) lt!314595) (= (_1!9277 lt!314710) (_2!9278 lt!314711))))))

(assert (=> b!201836 (= lt!314710 (readBitPure!0 (readerFrom!0 (_2!9278 lt!314711) (currentBit!9436 thiss!1204) (currentByte!9441 thiss!1204))))))

(assert (= (and d!69153 res!169009) b!201834))

(assert (= (and b!201834 res!169012) b!201835))

(assert (= (and b!201835 res!169010) b!201836))

(assert (= (and b!201836 res!169011) b!201837))

(declare-fun m!312367 () Bool)

(assert (=> b!201834 m!312367))

(assert (=> b!201834 m!312305))

(declare-fun m!312369 () Bool)

(assert (=> b!201836 m!312369))

(assert (=> b!201836 m!312369))

(declare-fun m!312371 () Bool)

(assert (=> b!201836 m!312371))

(declare-fun m!312373 () Bool)

(assert (=> b!201837 m!312373))

(assert (=> b!201837 m!312367))

(declare-fun m!312375 () Bool)

(assert (=> b!201835 m!312375))

(declare-fun m!312377 () Bool)

(assert (=> d!69153 m!312377))

(declare-fun m!312379 () Bool)

(assert (=> d!69153 m!312379))

(assert (=> b!201764 d!69153))

(declare-fun d!69163 () Bool)

(assert (=> d!69163 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9436 thiss!1204) (currentByte!9441 thiss!1204) (size!4514 (buf!5019 thiss!1204))))))

(declare-fun bs!17063 () Bool)

(assert (= bs!17063 d!69163))

(assert (=> bs!17063 m!312301))

(assert (=> start!42830 d!69163))

(declare-fun d!69165 () Bool)

(declare-datatypes ((tuple2!17258 0))(
  ( (tuple2!17259 (_1!9281 Bool) (_2!9281 BitStream!8136)) )
))
(declare-fun lt!314720 () tuple2!17258)

(declare-fun readBit!0 (BitStream!8136) tuple2!17258)

(assert (=> d!69165 (= lt!314720 (readBit!0 (readerFrom!0 (_2!9278 lt!314596) (currentBit!9436 thiss!1204) (currentByte!9441 thiss!1204))))))

(assert (=> d!69165 (= (readBitPure!0 (readerFrom!0 (_2!9278 lt!314596) (currentBit!9436 thiss!1204) (currentByte!9441 thiss!1204))) (tuple2!17251 (_2!9281 lt!314720) (_1!9281 lt!314720)))))

(declare-fun bs!17064 () Bool)

(assert (= bs!17064 d!69165))

(assert (=> bs!17064 m!312313))

(declare-fun m!312381 () Bool)

(assert (=> bs!17064 m!312381))

(assert (=> b!201763 d!69165))

(declare-fun d!69167 () Bool)

(declare-fun e!138410 () Bool)

(assert (=> d!69167 e!138410))

(declare-fun res!169024 () Bool)

(assert (=> d!69167 (=> (not res!169024) (not e!138410))))

(assert (=> d!69167 (= res!169024 (invariant!0 (currentBit!9436 (_2!9278 lt!314596)) (currentByte!9441 (_2!9278 lt!314596)) (size!4514 (buf!5019 (_2!9278 lt!314596)))))))

(assert (=> d!69167 (= (readerFrom!0 (_2!9278 lt!314596) (currentBit!9436 thiss!1204) (currentByte!9441 thiss!1204)) (BitStream!8137 (buf!5019 (_2!9278 lt!314596)) (currentByte!9441 thiss!1204) (currentBit!9436 thiss!1204)))))

(declare-fun b!201849 () Bool)

(assert (=> b!201849 (= e!138410 (invariant!0 (currentBit!9436 thiss!1204) (currentByte!9441 thiss!1204) (size!4514 (buf!5019 (_2!9278 lt!314596)))))))

(assert (= (and d!69167 res!169024) b!201849))

(assert (=> d!69167 m!312355))

(declare-fun m!312383 () Bool)

(assert (=> b!201849 m!312383))

(assert (=> b!201763 d!69167))

(declare-fun d!69169 () Bool)

(declare-fun res!169045 () Bool)

(declare-fun e!138421 () Bool)

(assert (=> d!69169 (=> (not res!169045) (not e!138421))))

(assert (=> d!69169 (= res!169045 (= (size!4514 (buf!5019 thiss!1204)) (size!4514 (buf!5019 (_2!9278 lt!314596)))))))

(assert (=> d!69169 (= (isPrefixOf!0 thiss!1204 (_2!9278 lt!314596)) e!138421)))

(declare-fun b!201869 () Bool)

(declare-fun res!169044 () Bool)

(assert (=> b!201869 (=> (not res!169044) (not e!138421))))

(assert (=> b!201869 (= res!169044 (bvsle (bitIndex!0 (size!4514 (buf!5019 thiss!1204)) (currentByte!9441 thiss!1204) (currentBit!9436 thiss!1204)) (bitIndex!0 (size!4514 (buf!5019 (_2!9278 lt!314596))) (currentByte!9441 (_2!9278 lt!314596)) (currentBit!9436 (_2!9278 lt!314596)))))))

(declare-fun b!201870 () Bool)

(declare-fun e!138422 () Bool)

(assert (=> b!201870 (= e!138421 e!138422)))

(declare-fun res!169043 () Bool)

(assert (=> b!201870 (=> res!169043 e!138422)))

(assert (=> b!201870 (= res!169043 (= (size!4514 (buf!5019 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!201871 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10255 array!10255 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!201871 (= e!138422 (arrayBitRangesEq!0 (buf!5019 thiss!1204) (buf!5019 (_2!9278 lt!314596)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4514 (buf!5019 thiss!1204)) (currentByte!9441 thiss!1204) (currentBit!9436 thiss!1204))))))

(assert (= (and d!69169 res!169045) b!201869))

(assert (= (and b!201869 res!169044) b!201870))

(assert (= (and b!201870 (not res!169043)) b!201871))

(assert (=> b!201869 m!312305))

(assert (=> b!201869 m!312303))

(assert (=> b!201871 m!312305))

(assert (=> b!201871 m!312305))

(declare-fun m!312399 () Bool)

(assert (=> b!201871 m!312399))

(assert (=> b!201768 d!69169))

(check-sat (not b!201871) (not d!69163) (not b!201834) (not d!69145) (not b!201835) (not d!69165) (not d!69147) (not d!69137) (not d!69139) (not d!69167) (not b!201849) (not b!201836) (not d!69153) (not b!201869) (not b!201837))
