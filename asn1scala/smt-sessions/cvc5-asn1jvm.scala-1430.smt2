; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39290 () Bool)

(assert start!39290)

(declare-fun b!176613 () Bool)

(declare-fun res!146337 () Bool)

(declare-fun e!123104 () Bool)

(assert (=> b!176613 (=> (not res!146337) (not e!123104))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!176613 (= res!146337 (not (= i!590 nBits!348)))))

(declare-fun b!176614 () Bool)

(declare-fun e!123106 () Bool)

(declare-datatypes ((array!9533 0))(
  ( (array!9534 (arr!5134 (Array (_ BitVec 32) (_ BitVec 8))) (size!4204 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7516 0))(
  ( (BitStream!7517 (buf!4647 array!9533) (currentByte!8809 (_ BitVec 32)) (currentBit!8804 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!12722 0))(
  ( (Unit!12723) )
))
(declare-datatypes ((tuple2!15200 0))(
  ( (tuple2!15201 (_1!8245 Unit!12722) (_2!8245 BitStream!7516)) )
))
(declare-fun lt!271835 () tuple2!15200)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!176614 (= e!123106 (invariant!0 (currentBit!8804 (_2!8245 lt!271835)) (currentByte!8809 (_2!8245 lt!271835)) (size!4204 (buf!4647 (_2!8245 lt!271835)))))))

(declare-fun b!176615 () Bool)

(declare-fun res!146329 () Bool)

(assert (=> b!176615 (=> (not res!146329) (not e!123104))))

(declare-fun thiss!1204 () BitStream!7516)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!176615 (= res!146329 (validate_offset_bits!1 ((_ sign_extend 32) (size!4204 (buf!4647 thiss!1204))) ((_ sign_extend 32) (currentByte!8809 thiss!1204)) ((_ sign_extend 32) (currentBit!8804 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!176616 () Bool)

(declare-fun res!146335 () Bool)

(declare-fun e!123101 () Bool)

(assert (=> b!176616 (=> (not res!146335) (not e!123101))))

(declare-fun isPrefixOf!0 (BitStream!7516 BitStream!7516) Bool)

(assert (=> b!176616 (= res!146335 (isPrefixOf!0 thiss!1204 (_2!8245 lt!271835)))))

(declare-fun res!146332 () Bool)

(assert (=> start!39290 (=> (not res!146332) (not e!123104))))

(assert (=> start!39290 (= res!146332 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39290 e!123104))

(assert (=> start!39290 true))

(declare-fun e!123100 () Bool)

(declare-fun inv!12 (BitStream!7516) Bool)

(assert (=> start!39290 (and (inv!12 thiss!1204) e!123100)))

(declare-fun b!176617 () Bool)

(declare-fun res!146334 () Bool)

(assert (=> b!176617 (=> (not res!146334) (not e!123104))))

(assert (=> b!176617 (= res!146334 (invariant!0 (currentBit!8804 thiss!1204) (currentByte!8809 thiss!1204) (size!4204 (buf!4647 thiss!1204))))))

(declare-fun b!176618 () Bool)

(declare-fun e!123103 () Bool)

(assert (=> b!176618 (= e!123103 e!123101)))

(declare-fun res!146331 () Bool)

(assert (=> b!176618 (=> (not res!146331) (not e!123101))))

(declare-fun lt!271836 () (_ BitVec 64))

(declare-fun lt!271838 () (_ BitVec 64))

(assert (=> b!176618 (= res!146331 (= lt!271836 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!271838)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!176618 (= lt!271836 (bitIndex!0 (size!4204 (buf!4647 (_2!8245 lt!271835))) (currentByte!8809 (_2!8245 lt!271835)) (currentBit!8804 (_2!8245 lt!271835))))))

(assert (=> b!176618 (= lt!271838 (bitIndex!0 (size!4204 (buf!4647 thiss!1204)) (currentByte!8809 thiss!1204) (currentBit!8804 thiss!1204)))))

(declare-fun b!176619 () Bool)

(assert (=> b!176619 (= e!123104 (not e!123106))))

(declare-fun res!146333 () Bool)

(assert (=> b!176619 (=> res!146333 e!123106)))

(assert (=> b!176619 (= res!146333 (not (= (bitIndex!0 (size!4204 (buf!4647 (_2!8245 lt!271835))) (currentByte!8809 (_2!8245 lt!271835)) (currentBit!8804 (_2!8245 lt!271835))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4204 (buf!4647 thiss!1204)) (currentByte!8809 thiss!1204) (currentBit!8804 thiss!1204))))))))

(assert (=> b!176619 e!123103))

(declare-fun res!146336 () Bool)

(assert (=> b!176619 (=> (not res!146336) (not e!123103))))

(assert (=> b!176619 (= res!146336 (= (size!4204 (buf!4647 thiss!1204)) (size!4204 (buf!4647 (_2!8245 lt!271835)))))))

(declare-fun lt!271837 () Bool)

(declare-fun appendBit!0 (BitStream!7516 Bool) tuple2!15200)

(assert (=> b!176619 (= lt!271835 (appendBit!0 thiss!1204 lt!271837))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!176619 (= lt!271837 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!176620 () Bool)

(declare-fun array_inv!3945 (array!9533) Bool)

(assert (=> b!176620 (= e!123100 (array_inv!3945 (buf!4647 thiss!1204)))))

(declare-fun b!176621 () Bool)

(declare-fun e!123105 () Bool)

(declare-datatypes ((tuple2!15202 0))(
  ( (tuple2!15203 (_1!8246 BitStream!7516) (_2!8246 Bool)) )
))
(declare-fun lt!271834 () tuple2!15202)

(assert (=> b!176621 (= e!123105 (= (bitIndex!0 (size!4204 (buf!4647 (_1!8246 lt!271834))) (currentByte!8809 (_1!8246 lt!271834)) (currentBit!8804 (_1!8246 lt!271834))) lt!271836))))

(declare-fun b!176622 () Bool)

(assert (=> b!176622 (= e!123101 e!123105)))

(declare-fun res!146330 () Bool)

(assert (=> b!176622 (=> (not res!146330) (not e!123105))))

(assert (=> b!176622 (= res!146330 (and (= (_2!8246 lt!271834) lt!271837) (= (_1!8246 lt!271834) (_2!8245 lt!271835))))))

(declare-fun readBitPure!0 (BitStream!7516) tuple2!15202)

(declare-fun readerFrom!0 (BitStream!7516 (_ BitVec 32) (_ BitVec 32)) BitStream!7516)

(assert (=> b!176622 (= lt!271834 (readBitPure!0 (readerFrom!0 (_2!8245 lt!271835) (currentBit!8804 thiss!1204) (currentByte!8809 thiss!1204))))))

(assert (= (and start!39290 res!146332) b!176615))

(assert (= (and b!176615 res!146329) b!176617))

(assert (= (and b!176617 res!146334) b!176613))

(assert (= (and b!176613 res!146337) b!176619))

(assert (= (and b!176619 res!146336) b!176618))

(assert (= (and b!176618 res!146331) b!176616))

(assert (= (and b!176616 res!146335) b!176622))

(assert (= (and b!176622 res!146330) b!176621))

(assert (= (and b!176619 (not res!146333)) b!176614))

(assert (= start!39290 b!176620))

(declare-fun m!276685 () Bool)

(assert (=> b!176614 m!276685))

(declare-fun m!276687 () Bool)

(assert (=> b!176621 m!276687))

(declare-fun m!276689 () Bool)

(assert (=> b!176622 m!276689))

(assert (=> b!176622 m!276689))

(declare-fun m!276691 () Bool)

(assert (=> b!176622 m!276691))

(declare-fun m!276693 () Bool)

(assert (=> b!176617 m!276693))

(declare-fun m!276695 () Bool)

(assert (=> b!176619 m!276695))

(declare-fun m!276697 () Bool)

(assert (=> b!176619 m!276697))

(declare-fun m!276699 () Bool)

(assert (=> b!176619 m!276699))

(declare-fun m!276701 () Bool)

(assert (=> b!176620 m!276701))

(assert (=> b!176618 m!276695))

(assert (=> b!176618 m!276697))

(declare-fun m!276703 () Bool)

(assert (=> start!39290 m!276703))

(declare-fun m!276705 () Bool)

(assert (=> b!176615 m!276705))

(declare-fun m!276707 () Bool)

(assert (=> b!176616 m!276707))

(push 1)

(assert (not b!176617))

(assert (not b!176614))

(assert (not b!176621))

(assert (not b!176615))

(assert (not start!39290))

(assert (not b!176619))

(assert (not b!176622))

(assert (not b!176616))

(assert (not b!176618))

(assert (not b!176620))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!62301 () Bool)

(assert (=> d!62301 (= (array_inv!3945 (buf!4647 thiss!1204)) (bvsge (size!4204 (buf!4647 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!176620 d!62301))

(declare-fun d!62303 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!62303 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4204 (buf!4647 thiss!1204))) ((_ sign_extend 32) (currentByte!8809 thiss!1204)) ((_ sign_extend 32) (currentBit!8804 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4204 (buf!4647 thiss!1204))) ((_ sign_extend 32) (currentByte!8809 thiss!1204)) ((_ sign_extend 32) (currentBit!8804 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!15538 () Bool)

(assert (= bs!15538 d!62303))

(declare-fun m!276763 () Bool)

(assert (=> bs!15538 m!276763))

(assert (=> b!176615 d!62303))

(declare-fun d!62305 () Bool)

(declare-fun e!123156 () Bool)

(assert (=> d!62305 e!123156))

(declare-fun res!146404 () Bool)

(assert (=> d!62305 (=> (not res!146404) (not e!123156))))

(declare-fun lt!271900 () (_ BitVec 64))

(declare-fun lt!271896 () (_ BitVec 64))

(declare-fun lt!271897 () (_ BitVec 64))

(assert (=> d!62305 (= res!146404 (= lt!271897 (bvsub lt!271896 lt!271900)))))

(assert (=> d!62305 (or (= (bvand lt!271896 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271900 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!271896 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!271896 lt!271900) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62305 (= lt!271900 (remainingBits!0 ((_ sign_extend 32) (size!4204 (buf!4647 (_1!8246 lt!271834)))) ((_ sign_extend 32) (currentByte!8809 (_1!8246 lt!271834))) ((_ sign_extend 32) (currentBit!8804 (_1!8246 lt!271834)))))))

(declare-fun lt!271898 () (_ BitVec 64))

(declare-fun lt!271899 () (_ BitVec 64))

(assert (=> d!62305 (= lt!271896 (bvmul lt!271898 lt!271899))))

(assert (=> d!62305 (or (= lt!271898 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!271899 (bvsdiv (bvmul lt!271898 lt!271899) lt!271898)))))

(assert (=> d!62305 (= lt!271899 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62305 (= lt!271898 ((_ sign_extend 32) (size!4204 (buf!4647 (_1!8246 lt!271834)))))))

(assert (=> d!62305 (= lt!271897 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8809 (_1!8246 lt!271834))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8804 (_1!8246 lt!271834)))))))

(assert (=> d!62305 (invariant!0 (currentBit!8804 (_1!8246 lt!271834)) (currentByte!8809 (_1!8246 lt!271834)) (size!4204 (buf!4647 (_1!8246 lt!271834))))))

(assert (=> d!62305 (= (bitIndex!0 (size!4204 (buf!4647 (_1!8246 lt!271834))) (currentByte!8809 (_1!8246 lt!271834)) (currentBit!8804 (_1!8246 lt!271834))) lt!271897)))

(declare-fun b!176694 () Bool)

(declare-fun res!146405 () Bool)

(assert (=> b!176694 (=> (not res!146405) (not e!123156))))

(assert (=> b!176694 (= res!146405 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!271897))))

(declare-fun b!176695 () Bool)

(declare-fun lt!271901 () (_ BitVec 64))

(assert (=> b!176695 (= e!123156 (bvsle lt!271897 (bvmul lt!271901 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!176695 (or (= lt!271901 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!271901 #b0000000000000000000000000000000000000000000000000000000000001000) lt!271901)))))

(assert (=> b!176695 (= lt!271901 ((_ sign_extend 32) (size!4204 (buf!4647 (_1!8246 lt!271834)))))))

(assert (= (and d!62305 res!146404) b!176694))

(assert (= (and b!176694 res!146405) b!176695))

(declare-fun m!276765 () Bool)

(assert (=> d!62305 m!276765))

(declare-fun m!276767 () Bool)

(assert (=> d!62305 m!276767))

(assert (=> b!176621 d!62305))

(declare-fun d!62307 () Bool)

(declare-fun res!146414 () Bool)

(declare-fun e!123162 () Bool)

(assert (=> d!62307 (=> (not res!146414) (not e!123162))))

(assert (=> d!62307 (= res!146414 (= (size!4204 (buf!4647 thiss!1204)) (size!4204 (buf!4647 (_2!8245 lt!271835)))))))

(assert (=> d!62307 (= (isPrefixOf!0 thiss!1204 (_2!8245 lt!271835)) e!123162)))

(declare-fun b!176704 () Bool)

(declare-fun res!146415 () Bool)

(assert (=> b!176704 (=> (not res!146415) (not e!123162))))

(assert (=> b!176704 (= res!146415 (bvsle (bitIndex!0 (size!4204 (buf!4647 thiss!1204)) (currentByte!8809 thiss!1204) (currentBit!8804 thiss!1204)) (bitIndex!0 (size!4204 (buf!4647 (_2!8245 lt!271835))) (currentByte!8809 (_2!8245 lt!271835)) (currentBit!8804 (_2!8245 lt!271835)))))))

(declare-fun b!176705 () Bool)

(declare-fun e!123163 () Bool)

(assert (=> b!176705 (= e!123162 e!123163)))

(declare-fun res!146416 () Bool)

(assert (=> b!176705 (=> res!146416 e!123163)))

(assert (=> b!176705 (= res!146416 (= (size!4204 (buf!4647 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!176706 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9533 array!9533 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!176706 (= e!123163 (arrayBitRangesEq!0 (buf!4647 thiss!1204) (buf!4647 (_2!8245 lt!271835)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4204 (buf!4647 thiss!1204)) (currentByte!8809 thiss!1204) (currentBit!8804 thiss!1204))))))

(assert (= (and d!62307 res!146414) b!176704))

(assert (= (and b!176704 res!146415) b!176705))

(assert (= (and b!176705 (not res!146416)) b!176706))

(assert (=> b!176704 m!276697))

(assert (=> b!176704 m!276695))

(assert (=> b!176706 m!276697))

(assert (=> b!176706 m!276697))

(declare-fun m!276773 () Bool)

(assert (=> b!176706 m!276773))

(assert (=> b!176616 d!62307))

(declare-fun d!62311 () Bool)

(declare-datatypes ((tuple2!15214 0))(
  ( (tuple2!15215 (_1!8252 Bool) (_2!8252 BitStream!7516)) )
))
(declare-fun lt!271910 () tuple2!15214)

(declare-fun readBit!0 (BitStream!7516) tuple2!15214)

(assert (=> d!62311 (= lt!271910 (readBit!0 (readerFrom!0 (_2!8245 lt!271835) (currentBit!8804 thiss!1204) (currentByte!8809 thiss!1204))))))

(assert (=> d!62311 (= (readBitPure!0 (readerFrom!0 (_2!8245 lt!271835) (currentBit!8804 thiss!1204) (currentByte!8809 thiss!1204))) (tuple2!15203 (_2!8252 lt!271910) (_1!8252 lt!271910)))))

(declare-fun bs!15539 () Bool)

(assert (= bs!15539 d!62311))

(assert (=> bs!15539 m!276689))

(declare-fun m!276775 () Bool)

(assert (=> bs!15539 m!276775))

(assert (=> b!176622 d!62311))

(declare-fun d!62313 () Bool)

(declare-fun e!123173 () Bool)

(assert (=> d!62313 e!123173))

(declare-fun res!146431 () Bool)

(assert (=> d!62313 (=> (not res!146431) (not e!123173))))

(assert (=> d!62313 (= res!146431 (invariant!0 (currentBit!8804 (_2!8245 lt!271835)) (currentByte!8809 (_2!8245 lt!271835)) (size!4204 (buf!4647 (_2!8245 lt!271835)))))))

(assert (=> d!62313 (= (readerFrom!0 (_2!8245 lt!271835) (currentBit!8804 thiss!1204) (currentByte!8809 thiss!1204)) (BitStream!7517 (buf!4647 (_2!8245 lt!271835)) (currentByte!8809 thiss!1204) (currentBit!8804 thiss!1204)))))

(declare-fun b!176720 () Bool)

(assert (=> b!176720 (= e!123173 (invariant!0 (currentBit!8804 thiss!1204) (currentByte!8809 thiss!1204) (size!4204 (buf!4647 (_2!8245 lt!271835)))))))

(assert (= (and d!62313 res!146431) b!176720))

(assert (=> d!62313 m!276685))

(declare-fun m!276781 () Bool)

(assert (=> b!176720 m!276781))

(assert (=> b!176622 d!62313))

(declare-fun d!62319 () Bool)

(assert (=> d!62319 (= (invariant!0 (currentBit!8804 thiss!1204) (currentByte!8809 thiss!1204) (size!4204 (buf!4647 thiss!1204))) (and (bvsge (currentBit!8804 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8804 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8809 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8809 thiss!1204) (size!4204 (buf!4647 thiss!1204))) (and (= (currentBit!8804 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8809 thiss!1204) (size!4204 (buf!4647 thiss!1204)))))))))

(assert (=> b!176617 d!62319))

(declare-fun d!62323 () Bool)

(declare-fun e!123175 () Bool)

(assert (=> d!62323 e!123175))

(declare-fun res!146434 () Bool)

(assert (=> d!62323 (=> (not res!146434) (not e!123175))))

(declare-fun lt!271923 () (_ BitVec 64))

(declare-fun lt!271927 () (_ BitVec 64))

(declare-fun lt!271924 () (_ BitVec 64))

(assert (=> d!62323 (= res!146434 (= lt!271924 (bvsub lt!271923 lt!271927)))))

(assert (=> d!62323 (or (= (bvand lt!271923 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271927 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!271923 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!271923 lt!271927) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62323 (= lt!271927 (remainingBits!0 ((_ sign_extend 32) (size!4204 (buf!4647 (_2!8245 lt!271835)))) ((_ sign_extend 32) (currentByte!8809 (_2!8245 lt!271835))) ((_ sign_extend 32) (currentBit!8804 (_2!8245 lt!271835)))))))

(declare-fun lt!271925 () (_ BitVec 64))

(declare-fun lt!271926 () (_ BitVec 64))

(assert (=> d!62323 (= lt!271923 (bvmul lt!271925 lt!271926))))

(assert (=> d!62323 (or (= lt!271925 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!271926 (bvsdiv (bvmul lt!271925 lt!271926) lt!271925)))))

(assert (=> d!62323 (= lt!271926 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62323 (= lt!271925 ((_ sign_extend 32) (size!4204 (buf!4647 (_2!8245 lt!271835)))))))

(assert (=> d!62323 (= lt!271924 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8809 (_2!8245 lt!271835))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8804 (_2!8245 lt!271835)))))))

(assert (=> d!62323 (invariant!0 (currentBit!8804 (_2!8245 lt!271835)) (currentByte!8809 (_2!8245 lt!271835)) (size!4204 (buf!4647 (_2!8245 lt!271835))))))

(assert (=> d!62323 (= (bitIndex!0 (size!4204 (buf!4647 (_2!8245 lt!271835))) (currentByte!8809 (_2!8245 lt!271835)) (currentBit!8804 (_2!8245 lt!271835))) lt!271924)))

(declare-fun b!176723 () Bool)

(declare-fun res!146435 () Bool)

(assert (=> b!176723 (=> (not res!146435) (not e!123175))))

(assert (=> b!176723 (= res!146435 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!271924))))

(declare-fun b!176724 () Bool)

(declare-fun lt!271928 () (_ BitVec 64))

(assert (=> b!176724 (= e!123175 (bvsle lt!271924 (bvmul lt!271928 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!176724 (or (= lt!271928 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!271928 #b0000000000000000000000000000000000000000000000000000000000001000) lt!271928)))))

(assert (=> b!176724 (= lt!271928 ((_ sign_extend 32) (size!4204 (buf!4647 (_2!8245 lt!271835)))))))

(assert (= (and d!62323 res!146434) b!176723))

(assert (= (and b!176723 res!146435) b!176724))

(declare-fun m!276783 () Bool)

(assert (=> d!62323 m!276783))

(assert (=> d!62323 m!276685))

(assert (=> b!176618 d!62323))

(declare-fun d!62325 () Bool)

(declare-fun e!123176 () Bool)

(assert (=> d!62325 e!123176))

(declare-fun res!146436 () Bool)

(assert (=> d!62325 (=> (not res!146436) (not e!123176))))

(declare-fun lt!271929 () (_ BitVec 64))

(declare-fun lt!271933 () (_ BitVec 64))

(declare-fun lt!271930 () (_ BitVec 64))

(assert (=> d!62325 (= res!146436 (= lt!271930 (bvsub lt!271929 lt!271933)))))

(assert (=> d!62325 (or (= (bvand lt!271929 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271933 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!271929 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!271929 lt!271933) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62325 (= lt!271933 (remainingBits!0 ((_ sign_extend 32) (size!4204 (buf!4647 thiss!1204))) ((_ sign_extend 32) (currentByte!8809 thiss!1204)) ((_ sign_extend 32) (currentBit!8804 thiss!1204))))))

(declare-fun lt!271931 () (_ BitVec 64))

(declare-fun lt!271932 () (_ BitVec 64))

(assert (=> d!62325 (= lt!271929 (bvmul lt!271931 lt!271932))))

(assert (=> d!62325 (or (= lt!271931 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!271932 (bvsdiv (bvmul lt!271931 lt!271932) lt!271931)))))

(assert (=> d!62325 (= lt!271932 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62325 (= lt!271931 ((_ sign_extend 32) (size!4204 (buf!4647 thiss!1204))))))

(assert (=> d!62325 (= lt!271930 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8809 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8804 thiss!1204))))))

(assert (=> d!62325 (invariant!0 (currentBit!8804 thiss!1204) (currentByte!8809 thiss!1204) (size!4204 (buf!4647 thiss!1204)))))

(assert (=> d!62325 (= (bitIndex!0 (size!4204 (buf!4647 thiss!1204)) (currentByte!8809 thiss!1204) (currentBit!8804 thiss!1204)) lt!271930)))

(declare-fun b!176725 () Bool)

(declare-fun res!146437 () Bool)

(assert (=> b!176725 (=> (not res!146437) (not e!123176))))

(assert (=> b!176725 (= res!146437 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!271930))))

(declare-fun b!176726 () Bool)

(declare-fun lt!271934 () (_ BitVec 64))

(assert (=> b!176726 (= e!123176 (bvsle lt!271930 (bvmul lt!271934 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!176726 (or (= lt!271934 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!271934 #b0000000000000000000000000000000000000000000000000000000000001000) lt!271934)))))

(assert (=> b!176726 (= lt!271934 ((_ sign_extend 32) (size!4204 (buf!4647 thiss!1204))))))

(assert (= (and d!62325 res!146436) b!176725))

(assert (= (and b!176725 res!146437) b!176726))

(assert (=> d!62325 m!276763))

(assert (=> d!62325 m!276693))

(assert (=> b!176618 d!62325))

(assert (=> b!176619 d!62323))

(assert (=> b!176619 d!62325))

(declare-fun b!176757 () Bool)

(declare-fun res!146469 () Bool)

(declare-fun e!123192 () Bool)

(assert (=> b!176757 (=> (not res!146469) (not e!123192))))

(declare-fun lt!271983 () (_ BitVec 64))

(declare-fun lt!271982 () tuple2!15200)

(declare-fun lt!271984 () (_ BitVec 64))

(assert (=> b!176757 (= res!146469 (= (bitIndex!0 (size!4204 (buf!4647 (_2!8245 lt!271982))) (currentByte!8809 (_2!8245 lt!271982)) (currentBit!8804 (_2!8245 lt!271982))) (bvadd lt!271983 lt!271984)))))

(assert (=> b!176757 (or (not (= (bvand lt!271983 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271984 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!271983 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!271983 lt!271984) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!176757 (= lt!271984 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!176757 (= lt!271983 (bitIndex!0 (size!4204 (buf!4647 thiss!1204)) (currentByte!8809 thiss!1204) (currentBit!8804 thiss!1204)))))

(declare-fun d!62327 () Bool)

(assert (=> d!62327 e!123192))

(declare-fun res!146470 () Bool)

(assert (=> d!62327 (=> (not res!146470) (not e!123192))))

(assert (=> d!62327 (= res!146470 (= (size!4204 (buf!4647 thiss!1204)) (size!4204 (buf!4647 (_2!8245 lt!271982)))))))

(declare-fun choose!16 (BitStream!7516 Bool) tuple2!15200)

(assert (=> d!62327 (= lt!271982 (choose!16 thiss!1204 lt!271837))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!62327 (validate_offset_bit!0 ((_ sign_extend 32) (size!4204 (buf!4647 thiss!1204))) ((_ sign_extend 32) (currentByte!8809 thiss!1204)) ((_ sign_extend 32) (currentBit!8804 thiss!1204)))))

(assert (=> d!62327 (= (appendBit!0 thiss!1204 lt!271837) lt!271982)))

(declare-fun b!176760 () Bool)

(declare-fun e!123191 () Bool)

(declare-fun lt!271985 () tuple2!15202)

(assert (=> b!176760 (= e!123191 (= (bitIndex!0 (size!4204 (buf!4647 (_1!8246 lt!271985))) (currentByte!8809 (_1!8246 lt!271985)) (currentBit!8804 (_1!8246 lt!271985))) (bitIndex!0 (size!4204 (buf!4647 (_2!8245 lt!271982))) (currentByte!8809 (_2!8245 lt!271982)) (currentBit!8804 (_2!8245 lt!271982)))))))

(declare-fun b!176758 () Bool)

(declare-fun res!146467 () Bool)

(assert (=> b!176758 (=> (not res!146467) (not e!123192))))

(assert (=> b!176758 (= res!146467 (isPrefixOf!0 thiss!1204 (_2!8245 lt!271982)))))

(declare-fun b!176759 () Bool)

(assert (=> b!176759 (= e!123192 e!123191)))

(declare-fun res!146468 () Bool)

(assert (=> b!176759 (=> (not res!146468) (not e!123191))))

(assert (=> b!176759 (= res!146468 (and (= (_2!8246 lt!271985) lt!271837) (= (_1!8246 lt!271985) (_2!8245 lt!271982))))))

(assert (=> b!176759 (= lt!271985 (readBitPure!0 (readerFrom!0 (_2!8245 lt!271982) (currentBit!8804 thiss!1204) (currentByte!8809 thiss!1204))))))

(assert (= (and d!62327 res!146470) b!176757))

(assert (= (and b!176757 res!146469) b!176758))

(assert (= (and b!176758 res!146467) b!176759))

(assert (= (and b!176759 res!146468) b!176760))

(declare-fun m!276805 () Bool)

(assert (=> b!176759 m!276805))

(assert (=> b!176759 m!276805))

(declare-fun m!276807 () Bool)

(assert (=> b!176759 m!276807))

(declare-fun m!276809 () Bool)

(assert (=> b!176757 m!276809))

(assert (=> b!176757 m!276697))

(declare-fun m!276811 () Bool)

(assert (=> b!176760 m!276811))

(assert (=> b!176760 m!276809))

(declare-fun m!276813 () Bool)

(assert (=> d!62327 m!276813))

(declare-fun m!276815 () Bool)

(assert (=> d!62327 m!276815))

(declare-fun m!276817 () Bool)

(assert (=> b!176758 m!276817))

(assert (=> b!176619 d!62327))

(declare-fun d!62343 () Bool)

(assert (=> d!62343 (= (invariant!0 (currentBit!8804 (_2!8245 lt!271835)) (currentByte!8809 (_2!8245 lt!271835)) (size!4204 (buf!4647 (_2!8245 lt!271835)))) (and (bvsge (currentBit!8804 (_2!8245 lt!271835)) #b00000000000000000000000000000000) (bvslt (currentBit!8804 (_2!8245 lt!271835)) #b00000000000000000000000000001000) (bvsge (currentByte!8809 (_2!8245 lt!271835)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8809 (_2!8245 lt!271835)) (size!4204 (buf!4647 (_2!8245 lt!271835)))) (and (= (currentBit!8804 (_2!8245 lt!271835)) #b00000000000000000000000000000000) (= (currentByte!8809 (_2!8245 lt!271835)) (size!4204 (buf!4647 (_2!8245 lt!271835))))))))))

(assert (=> b!176614 d!62343))

(declare-fun d!62347 () Bool)

(assert (=> d!62347 (= (inv!12 thiss!1204) (invariant!0 (currentBit!8804 thiss!1204) (currentByte!8809 thiss!1204) (size!4204 (buf!4647 thiss!1204))))))

(declare-fun bs!15542 () Bool)

(assert (= bs!15542 d!62347))

(assert (=> bs!15542 m!276693))

(assert (=> start!39290 d!62347))

(push 1)

(assert (not b!176720))

(assert (not b!176758))

(assert (not b!176759))

(assert (not d!62313))

(assert (not d!62305))

(assert (not d!62325))

(assert (not d!62327))

(assert (not b!176704))

(assert (not d!62347))

(assert (not d!62303))

(assert (not b!176760))

(assert (not b!176706))

(assert (not d!62323))

(assert (not b!176757))

(assert (not d!62311))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

