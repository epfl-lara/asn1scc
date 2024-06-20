; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43192 () Bool)

(assert start!43192)

(declare-fun b!203671 () Bool)

(declare-fun e!139554 () Bool)

(declare-fun e!139547 () Bool)

(assert (=> b!203671 (= e!139554 e!139547)))

(declare-fun res!170638 () Bool)

(assert (=> b!203671 (=> (not res!170638) (not e!139547))))

(declare-fun lt!317905 () Bool)

(declare-datatypes ((array!10320 0))(
  ( (array!10321 (arr!5469 (Array (_ BitVec 32) (_ BitVec 8))) (size!4539 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8186 0))(
  ( (BitStream!8187 (buf!5044 array!10320) (currentByte!9511 (_ BitVec 32)) (currentBit!9506 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!17428 0))(
  ( (tuple2!17429 (_1!9366 BitStream!8186) (_2!9366 Bool)) )
))
(declare-fun lt!317906 () tuple2!17428)

(declare-datatypes ((Unit!14503 0))(
  ( (Unit!14504) )
))
(declare-datatypes ((tuple2!17430 0))(
  ( (tuple2!17431 (_1!9367 Unit!14503) (_2!9367 BitStream!8186)) )
))
(declare-fun lt!317900 () tuple2!17430)

(assert (=> b!203671 (= res!170638 (and (= (_2!9366 lt!317906) lt!317905) (= (_1!9366 lt!317906) (_2!9367 lt!317900))))))

(declare-fun thiss!1204 () BitStream!8186)

(declare-fun readBitPure!0 (BitStream!8186) tuple2!17428)

(declare-fun readerFrom!0 (BitStream!8186 (_ BitVec 32) (_ BitVec 32)) BitStream!8186)

(assert (=> b!203671 (= lt!317906 (readBitPure!0 (readerFrom!0 (_2!9367 lt!317900) (currentBit!9506 thiss!1204) (currentByte!9511 thiss!1204))))))

(declare-fun res!170640 () Bool)

(declare-fun e!139552 () Bool)

(assert (=> start!43192 (=> (not res!170640) (not e!139552))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!43192 (= res!170640 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43192 e!139552))

(assert (=> start!43192 true))

(declare-fun e!139548 () Bool)

(declare-fun inv!12 (BitStream!8186) Bool)

(assert (=> start!43192 (and (inv!12 thiss!1204) e!139548)))

(declare-fun lt!317901 () tuple2!17430)

(declare-fun lt!317904 () (_ BitVec 64))

(declare-fun b!203672 () Bool)

(declare-fun e!139551 () Bool)

(assert (=> b!203672 (= e!139551 (or (not (= (size!4539 (buf!5044 (_2!9367 lt!317901))) (size!4539 (buf!5044 thiss!1204)))) (let ((bdg!12230 (bvand lt!317904 #b1000000000000000000000000000000000000000000000000000000000000000))) (or (not (= bdg!12230 (bvand ((_ sign_extend 32) nBits!348) #b1000000000000000000000000000000000000000000000000000000000000000))) (= bdg!12230 (bvand (bvadd lt!317904 ((_ sign_extend 32) nBits!348)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!203673 () Bool)

(declare-fun e!139553 () Bool)

(assert (=> b!203673 (= e!139553 e!139554)))

(declare-fun res!170636 () Bool)

(assert (=> b!203673 (=> (not res!170636) (not e!139554))))

(declare-fun lt!317902 () (_ BitVec 64))

(declare-fun lt!317903 () (_ BitVec 64))

(assert (=> b!203673 (= res!170636 (= lt!317902 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!317903)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!203673 (= lt!317902 (bitIndex!0 (size!4539 (buf!5044 (_2!9367 lt!317900))) (currentByte!9511 (_2!9367 lt!317900)) (currentBit!9506 (_2!9367 lt!317900))))))

(assert (=> b!203673 (= lt!317903 (bitIndex!0 (size!4539 (buf!5044 thiss!1204)) (currentByte!9511 thiss!1204) (currentBit!9506 thiss!1204)))))

(declare-fun b!203674 () Bool)

(declare-fun e!139549 () Bool)

(assert (=> b!203674 (= e!139549 e!139551)))

(declare-fun res!170639 () Bool)

(assert (=> b!203674 (=> res!170639 e!139551)))

(declare-fun lt!317899 () (_ BitVec 64))

(assert (=> b!203674 (= res!170639 (not (= (bitIndex!0 (size!4539 (buf!5044 (_2!9367 lt!317901))) (currentByte!9511 (_2!9367 lt!317901)) (currentBit!9506 (_2!9367 lt!317901))) (bvsub (bvsub (bvadd lt!317899 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun isPrefixOf!0 (BitStream!8186 BitStream!8186) Bool)

(assert (=> b!203674 (isPrefixOf!0 thiss!1204 (_2!9367 lt!317901))))

(declare-fun lt!317898 () Unit!14503)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8186 BitStream!8186 BitStream!8186) Unit!14503)

(assert (=> b!203674 (= lt!317898 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9367 lt!317900) (_2!9367 lt!317901)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8186 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17430)

(assert (=> b!203674 (= lt!317901 (appendBitsLSBFirstLoopTR!0 (_2!9367 lt!317900) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!203675 () Bool)

(declare-fun res!170634 () Bool)

(assert (=> b!203675 (=> (not res!170634) (not e!139552))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!203675 (= res!170634 (validate_offset_bits!1 ((_ sign_extend 32) (size!4539 (buf!5044 thiss!1204))) ((_ sign_extend 32) (currentByte!9511 thiss!1204)) ((_ sign_extend 32) (currentBit!9506 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!203676 () Bool)

(assert (=> b!203676 (= e!139552 (not e!139549))))

(declare-fun res!170641 () Bool)

(assert (=> b!203676 (=> res!170641 e!139549)))

(assert (=> b!203676 (= res!170641 (not (= lt!317899 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!317904))))))

(assert (=> b!203676 (= lt!317899 (bitIndex!0 (size!4539 (buf!5044 (_2!9367 lt!317900))) (currentByte!9511 (_2!9367 lt!317900)) (currentBit!9506 (_2!9367 lt!317900))))))

(assert (=> b!203676 (= lt!317904 (bitIndex!0 (size!4539 (buf!5044 thiss!1204)) (currentByte!9511 thiss!1204) (currentBit!9506 thiss!1204)))))

(assert (=> b!203676 e!139553))

(declare-fun res!170632 () Bool)

(assert (=> b!203676 (=> (not res!170632) (not e!139553))))

(assert (=> b!203676 (= res!170632 (= (size!4539 (buf!5044 thiss!1204)) (size!4539 (buf!5044 (_2!9367 lt!317900)))))))

(declare-fun appendBit!0 (BitStream!8186 Bool) tuple2!17430)

(assert (=> b!203676 (= lt!317900 (appendBit!0 thiss!1204 lt!317905))))

(assert (=> b!203676 (= lt!317905 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!203677 () Bool)

(declare-fun res!170642 () Bool)

(assert (=> b!203677 (=> (not res!170642) (not e!139554))))

(assert (=> b!203677 (= res!170642 (isPrefixOf!0 thiss!1204 (_2!9367 lt!317900)))))

(declare-fun b!203678 () Bool)

(declare-fun array_inv!4280 (array!10320) Bool)

(assert (=> b!203678 (= e!139548 (array_inv!4280 (buf!5044 thiss!1204)))))

(declare-fun b!203679 () Bool)

(assert (=> b!203679 (= e!139547 (= (bitIndex!0 (size!4539 (buf!5044 (_1!9366 lt!317906))) (currentByte!9511 (_1!9366 lt!317906)) (currentBit!9506 (_1!9366 lt!317906))) lt!317902))))

(declare-fun b!203680 () Bool)

(declare-fun res!170637 () Bool)

(assert (=> b!203680 (=> (not res!170637) (not e!139552))))

(assert (=> b!203680 (= res!170637 (not (= i!590 nBits!348)))))

(declare-fun b!203681 () Bool)

(declare-fun res!170633 () Bool)

(assert (=> b!203681 (=> res!170633 e!139551)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!203681 (= res!170633 (not (invariant!0 (currentBit!9506 (_2!9367 lt!317901)) (currentByte!9511 (_2!9367 lt!317901)) (size!4539 (buf!5044 (_2!9367 lt!317901))))))))

(declare-fun b!203682 () Bool)

(declare-fun res!170635 () Bool)

(assert (=> b!203682 (=> (not res!170635) (not e!139552))))

(assert (=> b!203682 (= res!170635 (invariant!0 (currentBit!9506 thiss!1204) (currentByte!9511 thiss!1204) (size!4539 (buf!5044 thiss!1204))))))

(assert (= (and start!43192 res!170640) b!203675))

(assert (= (and b!203675 res!170634) b!203682))

(assert (= (and b!203682 res!170635) b!203680))

(assert (= (and b!203680 res!170637) b!203676))

(assert (= (and b!203676 res!170632) b!203673))

(assert (= (and b!203673 res!170636) b!203677))

(assert (= (and b!203677 res!170642) b!203671))

(assert (= (and b!203671 res!170638) b!203679))

(assert (= (and b!203676 (not res!170641)) b!203674))

(assert (= (and b!203674 (not res!170639)) b!203681))

(assert (= (and b!203681 (not res!170633)) b!203672))

(assert (= start!43192 b!203678))

(declare-fun m!314587 () Bool)

(assert (=> b!203675 m!314587))

(declare-fun m!314589 () Bool)

(assert (=> b!203682 m!314589))

(declare-fun m!314591 () Bool)

(assert (=> b!203679 m!314591))

(declare-fun m!314593 () Bool)

(assert (=> b!203676 m!314593))

(declare-fun m!314595 () Bool)

(assert (=> b!203676 m!314595))

(declare-fun m!314597 () Bool)

(assert (=> b!203676 m!314597))

(declare-fun m!314599 () Bool)

(assert (=> b!203671 m!314599))

(assert (=> b!203671 m!314599))

(declare-fun m!314601 () Bool)

(assert (=> b!203671 m!314601))

(declare-fun m!314603 () Bool)

(assert (=> b!203674 m!314603))

(declare-fun m!314605 () Bool)

(assert (=> b!203674 m!314605))

(declare-fun m!314607 () Bool)

(assert (=> b!203674 m!314607))

(declare-fun m!314609 () Bool)

(assert (=> b!203674 m!314609))

(declare-fun m!314611 () Bool)

(assert (=> b!203677 m!314611))

(declare-fun m!314613 () Bool)

(assert (=> b!203681 m!314613))

(assert (=> b!203673 m!314593))

(assert (=> b!203673 m!314595))

(declare-fun m!314615 () Bool)

(assert (=> b!203678 m!314615))

(declare-fun m!314617 () Bool)

(assert (=> start!43192 m!314617))

(push 1)

(assert (not b!203681))

(assert (not start!43192))

(assert (not b!203677))

(assert (not b!203678))

(assert (not b!203673))

(assert (not b!203674))

(assert (not b!203682))

(assert (not b!203675))

(assert (not b!203679))

(assert (not b!203676))

(assert (not b!203671))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!69579 () Bool)

(declare-fun e!139588 () Bool)

(assert (=> d!69579 e!139588))

(declare-fun res!170698 () Bool)

(assert (=> d!69579 (=> (not res!170698) (not e!139588))))

(declare-fun lt!317985 () (_ BitVec 64))

(declare-fun lt!317983 () (_ BitVec 64))

(declare-fun lt!317987 () (_ BitVec 64))

(assert (=> d!69579 (= res!170698 (= lt!317987 (bvsub lt!317983 lt!317985)))))

(assert (=> d!69579 (or (= (bvand lt!317983 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!317985 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!317983 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!317983 lt!317985) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!69579 (= lt!317985 (remainingBits!0 ((_ sign_extend 32) (size!4539 (buf!5044 (_2!9367 lt!317900)))) ((_ sign_extend 32) (currentByte!9511 (_2!9367 lt!317900))) ((_ sign_extend 32) (currentBit!9506 (_2!9367 lt!317900)))))))

(declare-fun lt!317986 () (_ BitVec 64))

(declare-fun lt!317988 () (_ BitVec 64))

(assert (=> d!69579 (= lt!317983 (bvmul lt!317986 lt!317988))))

(assert (=> d!69579 (or (= lt!317986 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!317988 (bvsdiv (bvmul lt!317986 lt!317988) lt!317986)))))

(assert (=> d!69579 (= lt!317988 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69579 (= lt!317986 ((_ sign_extend 32) (size!4539 (buf!5044 (_2!9367 lt!317900)))))))

(assert (=> d!69579 (= lt!317987 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9511 (_2!9367 lt!317900))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9506 (_2!9367 lt!317900)))))))

(assert (=> d!69579 (invariant!0 (currentBit!9506 (_2!9367 lt!317900)) (currentByte!9511 (_2!9367 lt!317900)) (size!4539 (buf!5044 (_2!9367 lt!317900))))))

(assert (=> d!69579 (= (bitIndex!0 (size!4539 (buf!5044 (_2!9367 lt!317900))) (currentByte!9511 (_2!9367 lt!317900)) (currentBit!9506 (_2!9367 lt!317900))) lt!317987)))

(declare-fun b!203738 () Bool)

(declare-fun res!170699 () Bool)

(assert (=> b!203738 (=> (not res!170699) (not e!139588))))

(assert (=> b!203738 (= res!170699 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!317987))))

(declare-fun b!203739 () Bool)

(declare-fun lt!317984 () (_ BitVec 64))

(assert (=> b!203739 (= e!139588 (bvsle lt!317987 (bvmul lt!317984 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!203739 (or (= lt!317984 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!317984 #b0000000000000000000000000000000000000000000000000000000000001000) lt!317984)))))

(assert (=> b!203739 (= lt!317984 ((_ sign_extend 32) (size!4539 (buf!5044 (_2!9367 lt!317900)))))))

(assert (= (and d!69579 res!170698) b!203738))

(assert (= (and b!203738 res!170699) b!203739))

(declare-fun m!314661 () Bool)

(assert (=> d!69579 m!314661))

(declare-fun m!314663 () Bool)

(assert (=> d!69579 m!314663))

(assert (=> b!203673 d!69579))

(declare-fun d!69587 () Bool)

(declare-fun e!139589 () Bool)

(assert (=> d!69587 e!139589))

(declare-fun res!170702 () Bool)

(assert (=> d!69587 (=> (not res!170702) (not e!139589))))

(declare-fun lt!317993 () (_ BitVec 64))

(declare-fun lt!317995 () (_ BitVec 64))

(declare-fun lt!317991 () (_ BitVec 64))

(assert (=> d!69587 (= res!170702 (= lt!317995 (bvsub lt!317991 lt!317993)))))

(assert (=> d!69587 (or (= (bvand lt!317991 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!317993 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!317991 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!317991 lt!317993) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69587 (= lt!317993 (remainingBits!0 ((_ sign_extend 32) (size!4539 (buf!5044 thiss!1204))) ((_ sign_extend 32) (currentByte!9511 thiss!1204)) ((_ sign_extend 32) (currentBit!9506 thiss!1204))))))

(declare-fun lt!317994 () (_ BitVec 64))

(declare-fun lt!317996 () (_ BitVec 64))

(assert (=> d!69587 (= lt!317991 (bvmul lt!317994 lt!317996))))

(assert (=> d!69587 (or (= lt!317994 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!317996 (bvsdiv (bvmul lt!317994 lt!317996) lt!317994)))))

(assert (=> d!69587 (= lt!317996 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69587 (= lt!317994 ((_ sign_extend 32) (size!4539 (buf!5044 thiss!1204))))))

(assert (=> d!69587 (= lt!317995 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9511 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9506 thiss!1204))))))

(assert (=> d!69587 (invariant!0 (currentBit!9506 thiss!1204) (currentByte!9511 thiss!1204) (size!4539 (buf!5044 thiss!1204)))))

(assert (=> d!69587 (= (bitIndex!0 (size!4539 (buf!5044 thiss!1204)) (currentByte!9511 thiss!1204) (currentBit!9506 thiss!1204)) lt!317995)))

(declare-fun b!203742 () Bool)

(declare-fun res!170703 () Bool)

(assert (=> b!203742 (=> (not res!170703) (not e!139589))))

(assert (=> b!203742 (= res!170703 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!317995))))

(declare-fun b!203743 () Bool)

(declare-fun lt!317992 () (_ BitVec 64))

(assert (=> b!203743 (= e!139589 (bvsle lt!317995 (bvmul lt!317992 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!203743 (or (= lt!317992 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!317992 #b0000000000000000000000000000000000000000000000000000000000001000) lt!317992)))))

(assert (=> b!203743 (= lt!317992 ((_ sign_extend 32) (size!4539 (buf!5044 thiss!1204))))))

(assert (= (and d!69587 res!170702) b!203742))

(assert (= (and b!203742 res!170703) b!203743))

(declare-fun m!314665 () Bool)

(assert (=> d!69587 m!314665))

(assert (=> d!69587 m!314589))

(assert (=> b!203673 d!69587))

(declare-fun d!69589 () Bool)

(declare-fun e!139590 () Bool)

(assert (=> d!69589 e!139590))

(declare-fun res!170704 () Bool)

(assert (=> d!69589 (=> (not res!170704) (not e!139590))))

(declare-fun lt!317997 () (_ BitVec 64))

(declare-fun lt!318001 () (_ BitVec 64))

(declare-fun lt!317999 () (_ BitVec 64))

(assert (=> d!69589 (= res!170704 (= lt!318001 (bvsub lt!317997 lt!317999)))))

(assert (=> d!69589 (or (= (bvand lt!317997 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!317999 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!317997 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!317997 lt!317999) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69589 (= lt!317999 (remainingBits!0 ((_ sign_extend 32) (size!4539 (buf!5044 (_2!9367 lt!317901)))) ((_ sign_extend 32) (currentByte!9511 (_2!9367 lt!317901))) ((_ sign_extend 32) (currentBit!9506 (_2!9367 lt!317901)))))))

(declare-fun lt!318000 () (_ BitVec 64))

(declare-fun lt!318002 () (_ BitVec 64))

(assert (=> d!69589 (= lt!317997 (bvmul lt!318000 lt!318002))))

(assert (=> d!69589 (or (= lt!318000 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!318002 (bvsdiv (bvmul lt!318000 lt!318002) lt!318000)))))

(assert (=> d!69589 (= lt!318002 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69589 (= lt!318000 ((_ sign_extend 32) (size!4539 (buf!5044 (_2!9367 lt!317901)))))))

(assert (=> d!69589 (= lt!318001 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9511 (_2!9367 lt!317901))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9506 (_2!9367 lt!317901)))))))

(assert (=> d!69589 (invariant!0 (currentBit!9506 (_2!9367 lt!317901)) (currentByte!9511 (_2!9367 lt!317901)) (size!4539 (buf!5044 (_2!9367 lt!317901))))))

(assert (=> d!69589 (= (bitIndex!0 (size!4539 (buf!5044 (_2!9367 lt!317901))) (currentByte!9511 (_2!9367 lt!317901)) (currentBit!9506 (_2!9367 lt!317901))) lt!318001)))

(declare-fun b!203744 () Bool)

(declare-fun res!170705 () Bool)

(assert (=> b!203744 (=> (not res!170705) (not e!139590))))

(assert (=> b!203744 (= res!170705 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!318001))))

(declare-fun b!203745 () Bool)

(declare-fun lt!317998 () (_ BitVec 64))

(assert (=> b!203745 (= e!139590 (bvsle lt!318001 (bvmul lt!317998 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!203745 (or (= lt!317998 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!317998 #b0000000000000000000000000000000000000000000000000000000000001000) lt!317998)))))

(assert (=> b!203745 (= lt!317998 ((_ sign_extend 32) (size!4539 (buf!5044 (_2!9367 lt!317901)))))))

(assert (= (and d!69589 res!170704) b!203744))

(assert (= (and b!203744 res!170705) b!203745))

(declare-fun m!314667 () Bool)

(assert (=> d!69589 m!314667))

(assert (=> d!69589 m!314613))

(assert (=> b!203674 d!69589))

(declare-fun d!69591 () Bool)

(declare-fun res!170718 () Bool)

(declare-fun e!139598 () Bool)

(assert (=> d!69591 (=> (not res!170718) (not e!139598))))

(assert (=> d!69591 (= res!170718 (= (size!4539 (buf!5044 thiss!1204)) (size!4539 (buf!5044 (_2!9367 lt!317901)))))))

(assert (=> d!69591 (= (isPrefixOf!0 thiss!1204 (_2!9367 lt!317901)) e!139598)))

(declare-fun b!203756 () Bool)

(declare-fun res!170717 () Bool)

(assert (=> b!203756 (=> (not res!170717) (not e!139598))))

(assert (=> b!203756 (= res!170717 (bvsle (bitIndex!0 (size!4539 (buf!5044 thiss!1204)) (currentByte!9511 thiss!1204) (currentBit!9506 thiss!1204)) (bitIndex!0 (size!4539 (buf!5044 (_2!9367 lt!317901))) (currentByte!9511 (_2!9367 lt!317901)) (currentBit!9506 (_2!9367 lt!317901)))))))

(declare-fun b!203757 () Bool)

(declare-fun e!139597 () Bool)

(assert (=> b!203757 (= e!139598 e!139597)))

(declare-fun res!170716 () Bool)

(assert (=> b!203757 (=> res!170716 e!139597)))

(assert (=> b!203757 (= res!170716 (= (size!4539 (buf!5044 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!203758 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10320 array!10320 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!203758 (= e!139597 (arrayBitRangesEq!0 (buf!5044 thiss!1204) (buf!5044 (_2!9367 lt!317901)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4539 (buf!5044 thiss!1204)) (currentByte!9511 thiss!1204) (currentBit!9506 thiss!1204))))))

(assert (= (and d!69591 res!170718) b!203756))

(assert (= (and b!203756 res!170717) b!203757))

(assert (= (and b!203757 (not res!170716)) b!203758))

(assert (=> b!203756 m!314595))

(assert (=> b!203756 m!314603))

(assert (=> b!203758 m!314595))

(assert (=> b!203758 m!314595))

(declare-fun m!314671 () Bool)

(assert (=> b!203758 m!314671))

(assert (=> b!203674 d!69591))

(declare-fun d!69599 () Bool)

(assert (=> d!69599 (isPrefixOf!0 thiss!1204 (_2!9367 lt!317901))))

(declare-fun lt!318017 () Unit!14503)

(declare-fun choose!30 (BitStream!8186 BitStream!8186 BitStream!8186) Unit!14503)

(assert (=> d!69599 (= lt!318017 (choose!30 thiss!1204 (_2!9367 lt!317900) (_2!9367 lt!317901)))))

(assert (=> d!69599 (isPrefixOf!0 thiss!1204 (_2!9367 lt!317900))))

(assert (=> d!69599 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9367 lt!317900) (_2!9367 lt!317901)) lt!318017)))

(declare-fun bs!17144 () Bool)

(assert (= bs!17144 d!69599))

(assert (=> bs!17144 m!314605))

(declare-fun m!314673 () Bool)

(assert (=> bs!17144 m!314673))

(assert (=> bs!17144 m!314611))

(assert (=> b!203674 d!69599))

(declare-fun b!203862 () Bool)

(declare-fun e!139663 () Bool)

(declare-fun lt!318344 () (_ BitVec 64))

(assert (=> b!203862 (= e!139663 (validate_offset_bits!1 ((_ sign_extend 32) (size!4539 (buf!5044 (_2!9367 lt!317900)))) ((_ sign_extend 32) (currentByte!9511 (_2!9367 lt!317900))) ((_ sign_extend 32) (currentBit!9506 (_2!9367 lt!317900))) lt!318344))))

(declare-fun b!203863 () Bool)

(declare-fun res!170810 () Bool)

(declare-fun lt!318358 () tuple2!17430)

(assert (=> b!203863 (= res!170810 (= (bitIndex!0 (size!4539 (buf!5044 (_2!9367 lt!318358))) (currentByte!9511 (_2!9367 lt!318358)) (currentBit!9506 (_2!9367 lt!318358))) (bvadd (bitIndex!0 (size!4539 (buf!5044 (_2!9367 lt!317900))) (currentByte!9511 (_2!9367 lt!317900)) (currentBit!9506 (_2!9367 lt!317900))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!139664 () Bool)

(assert (=> b!203863 (=> (not res!170810) (not e!139664))))

(declare-fun b!203864 () Bool)

(declare-fun e!139665 () (_ BitVec 64))

(assert (=> b!203864 (= e!139665 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!203865 () Bool)

(declare-fun res!170811 () Bool)

(declare-fun e!139662 () Bool)

(assert (=> b!203865 (=> (not res!170811) (not e!139662))))

(declare-fun lt!318353 () tuple2!17430)

(assert (=> b!203865 (= res!170811 (isPrefixOf!0 (_2!9367 lt!317900) (_2!9367 lt!318353)))))

(declare-fun b!203866 () Bool)

(declare-fun e!139658 () tuple2!17430)

(declare-fun Unit!14516 () Unit!14503)

(assert (=> b!203866 (= e!139658 (tuple2!17431 Unit!14516 (_2!9367 lt!317900)))))

(declare-fun lt!318338 () Unit!14503)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8186) Unit!14503)

(assert (=> b!203866 (= lt!318338 (lemmaIsPrefixRefl!0 (_2!9367 lt!317900)))))

(declare-fun call!3222 () Bool)

(assert (=> b!203866 call!3222))

(declare-fun lt!318381 () Unit!14503)

(assert (=> b!203866 (= lt!318381 lt!318338)))

(declare-fun b!203867 () Bool)

(declare-fun lt!318367 () tuple2!17428)

(assert (=> b!203867 (= lt!318367 (readBitPure!0 (readerFrom!0 (_2!9367 lt!318358) (currentBit!9506 (_2!9367 lt!317900)) (currentByte!9511 (_2!9367 lt!317900)))))))

(declare-fun lt!318341 () Bool)

(declare-fun res!170809 () Bool)

(assert (=> b!203867 (= res!170809 (and (= (_2!9366 lt!318367) lt!318341) (= (_1!9366 lt!318367) (_2!9367 lt!318358))))))

(declare-fun e!139660 () Bool)

(assert (=> b!203867 (=> (not res!170809) (not e!139660))))

(assert (=> b!203867 (= e!139664 e!139660)))

(declare-fun b!203868 () Bool)

(assert (=> b!203868 (= e!139665 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!203869 () Bool)

(declare-fun e!139661 () Bool)

(declare-fun lt!318351 () tuple2!17428)

(declare-fun lt!318336 () tuple2!17428)

(assert (=> b!203869 (= e!139661 (= (_2!9366 lt!318351) (_2!9366 lt!318336)))))

(declare-fun b!203870 () Bool)

(declare-fun res!170802 () Bool)

(assert (=> b!203870 (=> (not res!170802) (not e!139662))))

(declare-fun lt!318337 () (_ BitVec 64))

(declare-fun lt!318361 () (_ BitVec 64))

(assert (=> b!203870 (= res!170802 (= (bitIndex!0 (size!4539 (buf!5044 (_2!9367 lt!318353))) (currentByte!9511 (_2!9367 lt!318353)) (currentBit!9506 (_2!9367 lt!318353))) (bvsub lt!318361 lt!318337)))))

(assert (=> b!203870 (or (= (bvand lt!318361 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!318337 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!318361 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!318361 lt!318337) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!203870 (= lt!318337 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!318357 () (_ BitVec 64))

(declare-fun lt!318354 () (_ BitVec 64))

(assert (=> b!203870 (= lt!318361 (bvadd lt!318357 lt!318354))))

(assert (=> b!203870 (or (not (= (bvand lt!318357 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!318354 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!318357 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!318357 lt!318354) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!203870 (= lt!318354 ((_ sign_extend 32) nBits!348))))

(assert (=> b!203870 (= lt!318357 (bitIndex!0 (size!4539 (buf!5044 (_2!9367 lt!317900))) (currentByte!9511 (_2!9367 lt!317900)) (currentBit!9506 (_2!9367 lt!317900))))))

(declare-fun b!203871 () Bool)

(declare-fun res!170803 () Bool)

(assert (=> b!203871 (= res!170803 call!3222)))

(assert (=> b!203871 (=> (not res!170803) (not e!139664))))

(declare-fun d!69601 () Bool)

(assert (=> d!69601 e!139662))

(declare-fun res!170804 () Bool)

(assert (=> d!69601 (=> (not res!170804) (not e!139662))))

(assert (=> d!69601 (= res!170804 (invariant!0 (currentBit!9506 (_2!9367 lt!318353)) (currentByte!9511 (_2!9367 lt!318353)) (size!4539 (buf!5044 (_2!9367 lt!318353)))))))

(assert (=> d!69601 (= lt!318353 e!139658)))

(declare-fun c!10108 () Bool)

(assert (=> d!69601 (= c!10108 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!69601 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!69601 (= (appendBitsLSBFirstLoopTR!0 (_2!9367 lt!317900) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!318353)))

(declare-fun b!203872 () Bool)

(declare-fun lt!318343 () tuple2!17430)

(assert (=> b!203872 (= e!139658 (tuple2!17431 (_1!9367 lt!318343) (_2!9367 lt!318343)))))

(assert (=> b!203872 (= lt!318341 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!203872 (= lt!318358 (appendBit!0 (_2!9367 lt!317900) lt!318341))))

(declare-fun res!170806 () Bool)

(assert (=> b!203872 (= res!170806 (= (size!4539 (buf!5044 (_2!9367 lt!317900))) (size!4539 (buf!5044 (_2!9367 lt!318358)))))))

(assert (=> b!203872 (=> (not res!170806) (not e!139664))))

(assert (=> b!203872 e!139664))

(declare-fun lt!318369 () tuple2!17430)

(assert (=> b!203872 (= lt!318369 lt!318358)))

(assert (=> b!203872 (= lt!318343 (appendBitsLSBFirstLoopTR!0 (_2!9367 lt!318369) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!318331 () Unit!14503)

(assert (=> b!203872 (= lt!318331 (lemmaIsPrefixTransitive!0 (_2!9367 lt!317900) (_2!9367 lt!318369) (_2!9367 lt!318343)))))

(assert (=> b!203872 (isPrefixOf!0 (_2!9367 lt!317900) (_2!9367 lt!318343))))

(declare-fun lt!318330 () Unit!14503)

(assert (=> b!203872 (= lt!318330 lt!318331)))

(assert (=> b!203872 (invariant!0 (currentBit!9506 (_2!9367 lt!317900)) (currentByte!9511 (_2!9367 lt!317900)) (size!4539 (buf!5044 (_2!9367 lt!318369))))))

(declare-fun lt!318366 () BitStream!8186)

(assert (=> b!203872 (= lt!318366 (BitStream!8187 (buf!5044 (_2!9367 lt!318369)) (currentByte!9511 (_2!9367 lt!317900)) (currentBit!9506 (_2!9367 lt!317900))))))

(assert (=> b!203872 (invariant!0 (currentBit!9506 lt!318366) (currentByte!9511 lt!318366) (size!4539 (buf!5044 (_2!9367 lt!318343))))))

(declare-fun lt!318376 () BitStream!8186)

(assert (=> b!203872 (= lt!318376 (BitStream!8187 (buf!5044 (_2!9367 lt!318343)) (currentByte!9511 lt!318366) (currentBit!9506 lt!318366)))))

(assert (=> b!203872 (= lt!318351 (readBitPure!0 lt!318366))))

(assert (=> b!203872 (= lt!318336 (readBitPure!0 lt!318376))))

(declare-fun lt!318359 () Unit!14503)

(declare-fun readBitPrefixLemma!0 (BitStream!8186 BitStream!8186) Unit!14503)

(assert (=> b!203872 (= lt!318359 (readBitPrefixLemma!0 lt!318366 (_2!9367 lt!318343)))))

(declare-fun res!170813 () Bool)

(assert (=> b!203872 (= res!170813 (= (bitIndex!0 (size!4539 (buf!5044 (_1!9366 lt!318351))) (currentByte!9511 (_1!9366 lt!318351)) (currentBit!9506 (_1!9366 lt!318351))) (bitIndex!0 (size!4539 (buf!5044 (_1!9366 lt!318336))) (currentByte!9511 (_1!9366 lt!318336)) (currentBit!9506 (_1!9366 lt!318336)))))))

(assert (=> b!203872 (=> (not res!170813) (not e!139661))))

(assert (=> b!203872 e!139661))

(declare-fun lt!318347 () Unit!14503)

(assert (=> b!203872 (= lt!318347 lt!318359)))

(declare-datatypes ((tuple2!17440 0))(
  ( (tuple2!17441 (_1!9372 BitStream!8186) (_2!9372 BitStream!8186)) )
))
(declare-fun lt!318333 () tuple2!17440)

(declare-fun reader!0 (BitStream!8186 BitStream!8186) tuple2!17440)

(assert (=> b!203872 (= lt!318333 (reader!0 (_2!9367 lt!317900) (_2!9367 lt!318343)))))

(declare-fun lt!318355 () tuple2!17440)

(assert (=> b!203872 (= lt!318355 (reader!0 (_2!9367 lt!318369) (_2!9367 lt!318343)))))

(declare-fun lt!318364 () tuple2!17428)

(assert (=> b!203872 (= lt!318364 (readBitPure!0 (_1!9372 lt!318333)))))

(assert (=> b!203872 (= (_2!9366 lt!318364) lt!318341)))

(declare-fun lt!318329 () Unit!14503)

(declare-fun Unit!14517 () Unit!14503)

(assert (=> b!203872 (= lt!318329 Unit!14517)))

(declare-fun lt!318378 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!203872 (= lt!318378 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!318340 () (_ BitVec 64))

(assert (=> b!203872 (= lt!318340 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!318368 () Unit!14503)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8186 array!10320 (_ BitVec 64)) Unit!14503)

(assert (=> b!203872 (= lt!318368 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9367 lt!317900) (buf!5044 (_2!9367 lt!318343)) lt!318340))))

(assert (=> b!203872 (validate_offset_bits!1 ((_ sign_extend 32) (size!4539 (buf!5044 (_2!9367 lt!318343)))) ((_ sign_extend 32) (currentByte!9511 (_2!9367 lt!317900))) ((_ sign_extend 32) (currentBit!9506 (_2!9367 lt!317900))) lt!318340)))

(declare-fun lt!318348 () Unit!14503)

(assert (=> b!203872 (= lt!318348 lt!318368)))

(declare-datatypes ((tuple2!17442 0))(
  ( (tuple2!17443 (_1!9373 BitStream!8186) (_2!9373 (_ BitVec 64))) )
))
(declare-fun lt!318374 () tuple2!17442)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8186 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17442)

(assert (=> b!203872 (= lt!318374 (readNBitsLSBFirstsLoopPure!0 (_1!9372 lt!318333) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!318378))))

(declare-fun lt!318373 () (_ BitVec 64))

(assert (=> b!203872 (= lt!318373 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!318332 () Unit!14503)

(assert (=> b!203872 (= lt!318332 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9367 lt!318369) (buf!5044 (_2!9367 lt!318343)) lt!318373))))

(assert (=> b!203872 (validate_offset_bits!1 ((_ sign_extend 32) (size!4539 (buf!5044 (_2!9367 lt!318343)))) ((_ sign_extend 32) (currentByte!9511 (_2!9367 lt!318369))) ((_ sign_extend 32) (currentBit!9506 (_2!9367 lt!318369))) lt!318373)))

(declare-fun lt!318350 () Unit!14503)

(assert (=> b!203872 (= lt!318350 lt!318332)))

(declare-fun lt!318372 () tuple2!17442)

(assert (=> b!203872 (= lt!318372 (readNBitsLSBFirstsLoopPure!0 (_1!9372 lt!318355) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!318378 (ite (_2!9366 lt!318364) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!318363 () tuple2!17442)

(assert (=> b!203872 (= lt!318363 (readNBitsLSBFirstsLoopPure!0 (_1!9372 lt!318333) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!318378))))

(declare-fun c!10109 () Bool)

(assert (=> b!203872 (= c!10109 (_2!9366 (readBitPure!0 (_1!9372 lt!318333))))))

(declare-fun lt!318346 () tuple2!17442)

(declare-fun withMovedBitIndex!0 (BitStream!8186 (_ BitVec 64)) BitStream!8186)

(assert (=> b!203872 (= lt!318346 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9372 lt!318333) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!318378 e!139665)))))

(declare-fun lt!318339 () Unit!14503)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8186 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14503)

(assert (=> b!203872 (= lt!318339 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9372 lt!318333) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!318378))))

(assert (=> b!203872 (and (= (_2!9373 lt!318363) (_2!9373 lt!318346)) (= (_1!9373 lt!318363) (_1!9373 lt!318346)))))

(declare-fun lt!318383 () Unit!14503)

(assert (=> b!203872 (= lt!318383 lt!318339)))

(assert (=> b!203872 (= (_1!9372 lt!318333) (withMovedBitIndex!0 (_2!9372 lt!318333) (bvsub (bitIndex!0 (size!4539 (buf!5044 (_2!9367 lt!317900))) (currentByte!9511 (_2!9367 lt!317900)) (currentBit!9506 (_2!9367 lt!317900))) (bitIndex!0 (size!4539 (buf!5044 (_2!9367 lt!318343))) (currentByte!9511 (_2!9367 lt!318343)) (currentBit!9506 (_2!9367 lt!318343))))))))

(declare-fun lt!318335 () Unit!14503)

(declare-fun Unit!14518 () Unit!14503)

(assert (=> b!203872 (= lt!318335 Unit!14518)))

(assert (=> b!203872 (= (_1!9372 lt!318355) (withMovedBitIndex!0 (_2!9372 lt!318355) (bvsub (bitIndex!0 (size!4539 (buf!5044 (_2!9367 lt!318369))) (currentByte!9511 (_2!9367 lt!318369)) (currentBit!9506 (_2!9367 lt!318369))) (bitIndex!0 (size!4539 (buf!5044 (_2!9367 lt!318343))) (currentByte!9511 (_2!9367 lt!318343)) (currentBit!9506 (_2!9367 lt!318343))))))))

(declare-fun lt!318334 () Unit!14503)

(declare-fun Unit!14519 () Unit!14503)

(assert (=> b!203872 (= lt!318334 Unit!14519)))

(assert (=> b!203872 (= (bitIndex!0 (size!4539 (buf!5044 (_2!9367 lt!317900))) (currentByte!9511 (_2!9367 lt!317900)) (currentBit!9506 (_2!9367 lt!317900))) (bvsub (bitIndex!0 (size!4539 (buf!5044 (_2!9367 lt!318369))) (currentByte!9511 (_2!9367 lt!318369)) (currentBit!9506 (_2!9367 lt!318369))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!318379 () Unit!14503)

(declare-fun Unit!14520 () Unit!14503)

(assert (=> b!203872 (= lt!318379 Unit!14520)))

(assert (=> b!203872 (= (_2!9373 lt!318374) (_2!9373 lt!318372))))

(declare-fun lt!318370 () Unit!14503)

(declare-fun Unit!14521 () Unit!14503)

(assert (=> b!203872 (= lt!318370 Unit!14521)))

(assert (=> b!203872 (invariant!0 (currentBit!9506 (_2!9367 lt!318343)) (currentByte!9511 (_2!9367 lt!318343)) (size!4539 (buf!5044 (_2!9367 lt!318343))))))

(declare-fun lt!318360 () Unit!14503)

(declare-fun Unit!14523 () Unit!14503)

(assert (=> b!203872 (= lt!318360 Unit!14523)))

(assert (=> b!203872 (= (size!4539 (buf!5044 (_2!9367 lt!317900))) (size!4539 (buf!5044 (_2!9367 lt!318343))))))

(declare-fun lt!318349 () Unit!14503)

(declare-fun Unit!14524 () Unit!14503)

(assert (=> b!203872 (= lt!318349 Unit!14524)))

(assert (=> b!203872 (= (bitIndex!0 (size!4539 (buf!5044 (_2!9367 lt!318343))) (currentByte!9511 (_2!9367 lt!318343)) (currentBit!9506 (_2!9367 lt!318343))) (bvsub (bvadd (bitIndex!0 (size!4539 (buf!5044 (_2!9367 lt!317900))) (currentByte!9511 (_2!9367 lt!317900)) (currentBit!9506 (_2!9367 lt!317900))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!318382 () Unit!14503)

(declare-fun Unit!14525 () Unit!14503)

(assert (=> b!203872 (= lt!318382 Unit!14525)))

(declare-fun lt!318365 () Unit!14503)

(declare-fun Unit!14526 () Unit!14503)

(assert (=> b!203872 (= lt!318365 Unit!14526)))

(declare-fun lt!318371 () tuple2!17440)

(assert (=> b!203872 (= lt!318371 (reader!0 (_2!9367 lt!317900) (_2!9367 lt!318343)))))

(declare-fun lt!318345 () (_ BitVec 64))

(assert (=> b!203872 (= lt!318345 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!318375 () Unit!14503)

(assert (=> b!203872 (= lt!318375 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9367 lt!317900) (buf!5044 (_2!9367 lt!318343)) lt!318345))))

(assert (=> b!203872 (validate_offset_bits!1 ((_ sign_extend 32) (size!4539 (buf!5044 (_2!9367 lt!318343)))) ((_ sign_extend 32) (currentByte!9511 (_2!9367 lt!317900))) ((_ sign_extend 32) (currentBit!9506 (_2!9367 lt!317900))) lt!318345)))

(declare-fun lt!318377 () Unit!14503)

(assert (=> b!203872 (= lt!318377 lt!318375)))

(declare-fun lt!318356 () tuple2!17442)

(assert (=> b!203872 (= lt!318356 (readNBitsLSBFirstsLoopPure!0 (_1!9372 lt!318371) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!170808 () Bool)

(assert (=> b!203872 (= res!170808 (= (_2!9373 lt!318356) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!139659 () Bool)

(assert (=> b!203872 (=> (not res!170808) (not e!139659))))

(assert (=> b!203872 e!139659))

(declare-fun lt!318362 () Unit!14503)

(declare-fun Unit!14527 () Unit!14503)

(assert (=> b!203872 (= lt!318362 Unit!14527)))

(declare-fun b!203873 () Bool)

(assert (=> b!203873 (= e!139659 (= (_1!9373 lt!318356) (_2!9372 lt!318371)))))

(declare-fun b!203874 () Bool)

(declare-fun e!139657 () Bool)

(declare-fun lt!318342 () tuple2!17442)

(declare-fun lt!318380 () tuple2!17440)

(assert (=> b!203874 (= e!139657 (= (_1!9373 lt!318342) (_2!9372 lt!318380)))))

(declare-fun b!203875 () Bool)

(declare-fun res!170807 () Bool)

(assert (=> b!203875 (=> (not res!170807) (not e!139662))))

(assert (=> b!203875 (= res!170807 (= (size!4539 (buf!5044 (_2!9367 lt!317900))) (size!4539 (buf!5044 (_2!9367 lt!318353)))))))

(declare-fun bm!3219 () Bool)

(assert (=> bm!3219 (= call!3222 (isPrefixOf!0 (_2!9367 lt!317900) (ite c!10108 (_2!9367 lt!317900) (_2!9367 lt!318358))))))

(declare-fun b!203876 () Bool)

(assert (=> b!203876 (= e!139660 (= (bitIndex!0 (size!4539 (buf!5044 (_1!9366 lt!318367))) (currentByte!9511 (_1!9366 lt!318367)) (currentBit!9506 (_1!9366 lt!318367))) (bitIndex!0 (size!4539 (buf!5044 (_2!9367 lt!318358))) (currentByte!9511 (_2!9367 lt!318358)) (currentBit!9506 (_2!9367 lt!318358)))))))

(declare-fun b!203877 () Bool)

(assert (=> b!203877 (= e!139662 e!139657)))

(declare-fun res!170805 () Bool)

(assert (=> b!203877 (=> (not res!170805) (not e!139657))))

(assert (=> b!203877 (= res!170805 (= (_2!9373 lt!318342) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!203877 (= lt!318342 (readNBitsLSBFirstsLoopPure!0 (_1!9372 lt!318380) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!318352 () Unit!14503)

(declare-fun lt!318328 () Unit!14503)

(assert (=> b!203877 (= lt!318352 lt!318328)))

(assert (=> b!203877 (validate_offset_bits!1 ((_ sign_extend 32) (size!4539 (buf!5044 (_2!9367 lt!318353)))) ((_ sign_extend 32) (currentByte!9511 (_2!9367 lt!317900))) ((_ sign_extend 32) (currentBit!9506 (_2!9367 lt!317900))) lt!318344)))

(assert (=> b!203877 (= lt!318328 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9367 lt!317900) (buf!5044 (_2!9367 lt!318353)) lt!318344))))

(assert (=> b!203877 e!139663))

(declare-fun res!170812 () Bool)

(assert (=> b!203877 (=> (not res!170812) (not e!139663))))

(assert (=> b!203877 (= res!170812 (and (= (size!4539 (buf!5044 (_2!9367 lt!317900))) (size!4539 (buf!5044 (_2!9367 lt!318353)))) (bvsge lt!318344 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!203877 (= lt!318344 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!203877 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!203877 (= lt!318380 (reader!0 (_2!9367 lt!317900) (_2!9367 lt!318353)))))

(assert (= (and d!69601 c!10108) b!203866))

(assert (= (and d!69601 (not c!10108)) b!203872))

(assert (= (and b!203872 res!170806) b!203863))

(assert (= (and b!203863 res!170810) b!203871))

(assert (= (and b!203871 res!170803) b!203867))

(assert (= (and b!203867 res!170809) b!203876))

(assert (= (and b!203872 res!170813) b!203869))

(assert (= (and b!203872 c!10109) b!203868))

(assert (= (and b!203872 (not c!10109)) b!203864))

(assert (= (and b!203872 res!170808) b!203873))

(assert (= (or b!203866 b!203871) bm!3219))

(assert (= (and d!69601 res!170804) b!203875))

(assert (= (and b!203875 res!170807) b!203870))

(assert (= (and b!203870 res!170802) b!203865))

(assert (= (and b!203865 res!170811) b!203877))

(assert (= (and b!203877 res!170812) b!203862))

(assert (= (and b!203877 res!170805) b!203874))

(declare-fun m!314797 () Bool)

(assert (=> d!69601 m!314797))

(assert (=> b!203872 m!314593))

(declare-fun m!314799 () Bool)

(assert (=> b!203872 m!314799))

(declare-fun m!314801 () Bool)

(assert (=> b!203872 m!314801))

(declare-fun m!314803 () Bool)

(assert (=> b!203872 m!314803))

(declare-fun m!314805 () Bool)

(assert (=> b!203872 m!314805))

(declare-fun m!314807 () Bool)

(assert (=> b!203872 m!314807))

(declare-fun m!314809 () Bool)

(assert (=> b!203872 m!314809))

(declare-fun m!314811 () Bool)

(assert (=> b!203872 m!314811))

(declare-fun m!314813 () Bool)

(assert (=> b!203872 m!314813))

(declare-fun m!314815 () Bool)

(assert (=> b!203872 m!314815))

(declare-fun m!314817 () Bool)

(assert (=> b!203872 m!314817))

(declare-fun m!314819 () Bool)

(assert (=> b!203872 m!314819))

(declare-fun m!314821 () Bool)

(assert (=> b!203872 m!314821))

(declare-fun m!314823 () Bool)

(assert (=> b!203872 m!314823))

(declare-fun m!314825 () Bool)

(assert (=> b!203872 m!314825))

(declare-fun m!314827 () Bool)

(assert (=> b!203872 m!314827))

(declare-fun m!314829 () Bool)

(assert (=> b!203872 m!314829))

(declare-fun m!314831 () Bool)

(assert (=> b!203872 m!314831))

(declare-fun m!314833 () Bool)

(assert (=> b!203872 m!314833))

(declare-fun m!314835 () Bool)

(assert (=> b!203872 m!314835))

(assert (=> b!203872 m!314815))

(declare-fun m!314837 () Bool)

(assert (=> b!203872 m!314837))

(declare-fun m!314839 () Bool)

(assert (=> b!203872 m!314839))

(declare-fun m!314841 () Bool)

(assert (=> b!203872 m!314841))

(declare-fun m!314843 () Bool)

(assert (=> b!203872 m!314843))

(declare-fun m!314845 () Bool)

(assert (=> b!203872 m!314845))

(declare-fun m!314847 () Bool)

(assert (=> b!203872 m!314847))

(declare-fun m!314849 () Bool)

(assert (=> b!203872 m!314849))

(declare-fun m!314851 () Bool)

(assert (=> b!203872 m!314851))

(declare-fun m!314853 () Bool)

(assert (=> b!203872 m!314853))

(declare-fun m!314855 () Bool)

(assert (=> b!203872 m!314855))

(declare-fun m!314857 () Bool)

(assert (=> b!203872 m!314857))

(declare-fun m!314859 () Bool)

(assert (=> b!203872 m!314859))

(declare-fun m!314861 () Bool)

(assert (=> b!203872 m!314861))

(declare-fun m!314863 () Bool)

(assert (=> b!203872 m!314863))

(declare-fun m!314865 () Bool)

(assert (=> b!203866 m!314865))

(declare-fun m!314867 () Bool)

(assert (=> b!203877 m!314867))

(assert (=> b!203877 m!314837))

(declare-fun m!314869 () Bool)

(assert (=> b!203877 m!314869))

(declare-fun m!314871 () Bool)

(assert (=> b!203877 m!314871))

(declare-fun m!314873 () Bool)

(assert (=> b!203877 m!314873))

(assert (=> b!203877 m!314823))

(declare-fun m!314875 () Bool)

(assert (=> b!203862 m!314875))

(declare-fun m!314877 () Bool)

(assert (=> b!203863 m!314877))

(assert (=> b!203863 m!314593))

(declare-fun m!314879 () Bool)

(assert (=> b!203876 m!314879))

(assert (=> b!203876 m!314877))

(declare-fun m!314881 () Bool)

(assert (=> b!203870 m!314881))

(assert (=> b!203870 m!314593))

(declare-fun m!314883 () Bool)

(assert (=> bm!3219 m!314883))

(declare-fun m!314885 () Bool)

(assert (=> b!203865 m!314885))

(declare-fun m!314887 () Bool)

(assert (=> b!203867 m!314887))

(assert (=> b!203867 m!314887))

(declare-fun m!314889 () Bool)

(assert (=> b!203867 m!314889))

(assert (=> b!203674 d!69601))

(declare-fun d!69623 () Bool)

(assert (=> d!69623 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4539 (buf!5044 thiss!1204))) ((_ sign_extend 32) (currentByte!9511 thiss!1204)) ((_ sign_extend 32) (currentBit!9506 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4539 (buf!5044 thiss!1204))) ((_ sign_extend 32) (currentByte!9511 thiss!1204)) ((_ sign_extend 32) (currentBit!9506 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!17148 () Bool)

(assert (= bs!17148 d!69623))

(assert (=> bs!17148 m!314665))

(assert (=> b!203675 d!69623))

(assert (=> b!203676 d!69579))

(assert (=> b!203676 d!69587))

(declare-fun b!203903 () Bool)

(declare-fun e!139678 () Bool)

(declare-fun e!139679 () Bool)

(assert (=> b!203903 (= e!139678 e!139679)))

(declare-fun res!170832 () Bool)

(assert (=> b!203903 (=> (not res!170832) (not e!139679))))

(declare-fun lt!318429 () tuple2!17428)

(declare-fun lt!318428 () tuple2!17430)

(assert (=> b!203903 (= res!170832 (and (= (_2!9366 lt!318429) lt!317905) (= (_1!9366 lt!318429) (_2!9367 lt!318428))))))

(assert (=> b!203903 (= lt!318429 (readBitPure!0 (readerFrom!0 (_2!9367 lt!318428) (currentBit!9506 thiss!1204) (currentByte!9511 thiss!1204))))))

(declare-fun b!203901 () Bool)

(declare-fun res!170834 () Bool)

(assert (=> b!203901 (=> (not res!170834) (not e!139678))))

(declare-fun lt!318426 () (_ BitVec 64))

(declare-fun lt!318427 () (_ BitVec 64))

(assert (=> b!203901 (= res!170834 (= (bitIndex!0 (size!4539 (buf!5044 (_2!9367 lt!318428))) (currentByte!9511 (_2!9367 lt!318428)) (currentBit!9506 (_2!9367 lt!318428))) (bvadd lt!318427 lt!318426)))))

(assert (=> b!203901 (or (not (= (bvand lt!318427 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!318426 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!318427 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!318427 lt!318426) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!203901 (= lt!318426 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!203901 (= lt!318427 (bitIndex!0 (size!4539 (buf!5044 thiss!1204)) (currentByte!9511 thiss!1204) (currentBit!9506 thiss!1204)))))

(declare-fun b!203904 () Bool)

(assert (=> b!203904 (= e!139679 (= (bitIndex!0 (size!4539 (buf!5044 (_1!9366 lt!318429))) (currentByte!9511 (_1!9366 lt!318429)) (currentBit!9506 (_1!9366 lt!318429))) (bitIndex!0 (size!4539 (buf!5044 (_2!9367 lt!318428))) (currentByte!9511 (_2!9367 lt!318428)) (currentBit!9506 (_2!9367 lt!318428)))))))

(declare-fun d!69625 () Bool)

(assert (=> d!69625 e!139678))

(declare-fun res!170835 () Bool)

(assert (=> d!69625 (=> (not res!170835) (not e!139678))))

(assert (=> d!69625 (= res!170835 (= (size!4539 (buf!5044 thiss!1204)) (size!4539 (buf!5044 (_2!9367 lt!318428)))))))

(declare-fun choose!16 (BitStream!8186 Bool) tuple2!17430)

(assert (=> d!69625 (= lt!318428 (choose!16 thiss!1204 lt!317905))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!69625 (validate_offset_bit!0 ((_ sign_extend 32) (size!4539 (buf!5044 thiss!1204))) ((_ sign_extend 32) (currentByte!9511 thiss!1204)) ((_ sign_extend 32) (currentBit!9506 thiss!1204)))))

(assert (=> d!69625 (= (appendBit!0 thiss!1204 lt!317905) lt!318428)))

(declare-fun b!203902 () Bool)

(declare-fun res!170833 () Bool)

(assert (=> b!203902 (=> (not res!170833) (not e!139678))))

(assert (=> b!203902 (= res!170833 (isPrefixOf!0 thiss!1204 (_2!9367 lt!318428)))))

(assert (= (and d!69625 res!170835) b!203901))

(assert (= (and b!203901 res!170834) b!203902))

(assert (= (and b!203902 res!170833) b!203903))

(assert (= (and b!203903 res!170832) b!203904))

(declare-fun m!314891 () Bool)

(assert (=> d!69625 m!314891))

(declare-fun m!314893 () Bool)

(assert (=> d!69625 m!314893))

(declare-fun m!314895 () Bool)

(assert (=> b!203902 m!314895))

(declare-fun m!314897 () Bool)

(assert (=> b!203901 m!314897))

(assert (=> b!203901 m!314595))

(declare-fun m!314899 () Bool)

(assert (=> b!203903 m!314899))

(assert (=> b!203903 m!314899))

(declare-fun m!314901 () Bool)

(assert (=> b!203903 m!314901))

(declare-fun m!314903 () Bool)

(assert (=> b!203904 m!314903))

(assert (=> b!203904 m!314897))

(assert (=> b!203676 d!69625))

(declare-fun d!69627 () Bool)

(declare-fun res!170838 () Bool)

(declare-fun e!139681 () Bool)

(assert (=> d!69627 (=> (not res!170838) (not e!139681))))

(assert (=> d!69627 (= res!170838 (= (size!4539 (buf!5044 thiss!1204)) (size!4539 (buf!5044 (_2!9367 lt!317900)))))))

(assert (=> d!69627 (= (isPrefixOf!0 thiss!1204 (_2!9367 lt!317900)) e!139681)))

(declare-fun b!203905 () Bool)

(declare-fun res!170837 () Bool)

(assert (=> b!203905 (=> (not res!170837) (not e!139681))))

(assert (=> b!203905 (= res!170837 (bvsle (bitIndex!0 (size!4539 (buf!5044 thiss!1204)) (currentByte!9511 thiss!1204) (currentBit!9506 thiss!1204)) (bitIndex!0 (size!4539 (buf!5044 (_2!9367 lt!317900))) (currentByte!9511 (_2!9367 lt!317900)) (currentBit!9506 (_2!9367 lt!317900)))))))

(declare-fun b!203906 () Bool)

(declare-fun e!139680 () Bool)

(assert (=> b!203906 (= e!139681 e!139680)))

(declare-fun res!170836 () Bool)

(assert (=> b!203906 (=> res!170836 e!139680)))

(assert (=> b!203906 (= res!170836 (= (size!4539 (buf!5044 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!203907 () Bool)

(assert (=> b!203907 (= e!139680 (arrayBitRangesEq!0 (buf!5044 thiss!1204) (buf!5044 (_2!9367 lt!317900)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4539 (buf!5044 thiss!1204)) (currentByte!9511 thiss!1204) (currentBit!9506 thiss!1204))))))

(assert (= (and d!69627 res!170838) b!203905))

(assert (= (and b!203905 res!170837) b!203906))

(assert (= (and b!203906 (not res!170836)) b!203907))

(assert (=> b!203905 m!314595))

(assert (=> b!203905 m!314593))

(assert (=> b!203907 m!314595))

(assert (=> b!203907 m!314595))

(declare-fun m!314905 () Bool)

(assert (=> b!203907 m!314905))

(assert (=> b!203677 d!69627))

(declare-fun d!69629 () Bool)

(assert (=> d!69629 (= (array_inv!4280 (buf!5044 thiss!1204)) (bvsge (size!4539 (buf!5044 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!203678 d!69629))

(declare-fun d!69631 () Bool)

(assert (=> d!69631 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9506 thiss!1204) (currentByte!9511 thiss!1204) (size!4539 (buf!5044 thiss!1204))))))

(declare-fun bs!17149 () Bool)

(assert (= bs!17149 d!69631))

(assert (=> bs!17149 m!314589))

(assert (=> start!43192 d!69631))

(declare-fun d!69633 () Bool)

(declare-fun e!139682 () Bool)

(assert (=> d!69633 e!139682))

(declare-fun res!170839 () Bool)

(assert (=> d!69633 (=> (not res!170839) (not e!139682))))

(declare-fun lt!318456 () (_ BitVec 64))

(declare-fun lt!318454 () (_ BitVec 64))

(declare-fun lt!318452 () (_ BitVec 64))

(assert (=> d!69633 (= res!170839 (= lt!318456 (bvsub lt!318452 lt!318454)))))

(assert (=> d!69633 (or (= (bvand lt!318452 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!318454 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!318452 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!318452 lt!318454) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69633 (= lt!318454 (remainingBits!0 ((_ sign_extend 32) (size!4539 (buf!5044 (_1!9366 lt!317906)))) ((_ sign_extend 32) (currentByte!9511 (_1!9366 lt!317906))) ((_ sign_extend 32) (currentBit!9506 (_1!9366 lt!317906)))))))

(declare-fun lt!318455 () (_ BitVec 64))

(declare-fun lt!318457 () (_ BitVec 64))

(assert (=> d!69633 (= lt!318452 (bvmul lt!318455 lt!318457))))

(assert (=> d!69633 (or (= lt!318455 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!318457 (bvsdiv (bvmul lt!318455 lt!318457) lt!318455)))))

(assert (=> d!69633 (= lt!318457 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69633 (= lt!318455 ((_ sign_extend 32) (size!4539 (buf!5044 (_1!9366 lt!317906)))))))

(assert (=> d!69633 (= lt!318456 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9511 (_1!9366 lt!317906))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9506 (_1!9366 lt!317906)))))))

(assert (=> d!69633 (invariant!0 (currentBit!9506 (_1!9366 lt!317906)) (currentByte!9511 (_1!9366 lt!317906)) (size!4539 (buf!5044 (_1!9366 lt!317906))))))

(assert (=> d!69633 (= (bitIndex!0 (size!4539 (buf!5044 (_1!9366 lt!317906))) (currentByte!9511 (_1!9366 lt!317906)) (currentBit!9506 (_1!9366 lt!317906))) lt!318456)))

(declare-fun b!203908 () Bool)

(declare-fun res!170840 () Bool)

(assert (=> b!203908 (=> (not res!170840) (not e!139682))))

(assert (=> b!203908 (= res!170840 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!318456))))

(declare-fun b!203909 () Bool)

(declare-fun lt!318453 () (_ BitVec 64))

(assert (=> b!203909 (= e!139682 (bvsle lt!318456 (bvmul lt!318453 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!203909 (or (= lt!318453 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!318453 #b0000000000000000000000000000000000000000000000000000000000001000) lt!318453)))))

(assert (=> b!203909 (= lt!318453 ((_ sign_extend 32) (size!4539 (buf!5044 (_1!9366 lt!317906)))))))

(assert (= (and d!69633 res!170839) b!203908))

(assert (= (and b!203908 res!170840) b!203909))

(declare-fun m!314907 () Bool)

(assert (=> d!69633 m!314907))

(declare-fun m!314909 () Bool)

(assert (=> d!69633 m!314909))

(assert (=> b!203679 d!69633))

(declare-fun d!69635 () Bool)

(assert (=> d!69635 (= (invariant!0 (currentBit!9506 (_2!9367 lt!317901)) (currentByte!9511 (_2!9367 lt!317901)) (size!4539 (buf!5044 (_2!9367 lt!317901)))) (and (bvsge (currentBit!9506 (_2!9367 lt!317901)) #b00000000000000000000000000000000) (bvslt (currentBit!9506 (_2!9367 lt!317901)) #b00000000000000000000000000001000) (bvsge (currentByte!9511 (_2!9367 lt!317901)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9511 (_2!9367 lt!317901)) (size!4539 (buf!5044 (_2!9367 lt!317901)))) (and (= (currentBit!9506 (_2!9367 lt!317901)) #b00000000000000000000000000000000) (= (currentByte!9511 (_2!9367 lt!317901)) (size!4539 (buf!5044 (_2!9367 lt!317901))))))))))

(assert (=> b!203681 d!69635))

(declare-fun d!69637 () Bool)

(assert (=> d!69637 (= (invariant!0 (currentBit!9506 thiss!1204) (currentByte!9511 thiss!1204) (size!4539 (buf!5044 thiss!1204))) (and (bvsge (currentBit!9506 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9506 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9511 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9511 thiss!1204) (size!4539 (buf!5044 thiss!1204))) (and (= (currentBit!9506 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9511 thiss!1204) (size!4539 (buf!5044 thiss!1204)))))))))

(assert (=> b!203682 d!69637))

(declare-fun d!69639 () Bool)

(declare-datatypes ((tuple2!17448 0))(
  ( (tuple2!17449 (_1!9376 Bool) (_2!9376 BitStream!8186)) )
))
(declare-fun lt!318498 () tuple2!17448)

(declare-fun readBit!0 (BitStream!8186) tuple2!17448)

(assert (=> d!69639 (= lt!318498 (readBit!0 (readerFrom!0 (_2!9367 lt!317900) (currentBit!9506 thiss!1204) (currentByte!9511 thiss!1204))))))

(assert (=> d!69639 (= (readBitPure!0 (readerFrom!0 (_2!9367 lt!317900) (currentBit!9506 thiss!1204) (currentByte!9511 thiss!1204))) (tuple2!17429 (_2!9376 lt!318498) (_1!9376 lt!318498)))))

(declare-fun bs!17150 () Bool)

(assert (= bs!17150 d!69639))

(assert (=> bs!17150 m!314599))

(declare-fun m!314911 () Bool)

(assert (=> bs!17150 m!314911))

(assert (=> b!203671 d!69639))

(declare-fun d!69641 () Bool)

(declare-fun e!139691 () Bool)

(assert (=> d!69641 e!139691))

(declare-fun res!170852 () Bool)

(assert (=> d!69641 (=> (not res!170852) (not e!139691))))

(assert (=> d!69641 (= res!170852 (invariant!0 (currentBit!9506 (_2!9367 lt!317900)) (currentByte!9511 (_2!9367 lt!317900)) (size!4539 (buf!5044 (_2!9367 lt!317900)))))))

(assert (=> d!69641 (= (readerFrom!0 (_2!9367 lt!317900) (currentBit!9506 thiss!1204) (currentByte!9511 thiss!1204)) (BitStream!8187 (buf!5044 (_2!9367 lt!317900)) (currentByte!9511 thiss!1204) (currentBit!9506 thiss!1204)))))

(declare-fun b!203922 () Bool)

(assert (=> b!203922 (= e!139691 (invariant!0 (currentBit!9506 thiss!1204) (currentByte!9511 thiss!1204) (size!4539 (buf!5044 (_2!9367 lt!317900)))))))

(assert (= (and d!69641 res!170852) b!203922))

(assert (=> d!69641 m!314663))

(declare-fun m!314913 () Bool)

(assert (=> b!203922 m!314913))

(assert (=> b!203671 d!69641))

(push 1)

(assert (not b!203866))

(assert (not b!203907))

(assert (not b!203870))

(assert (not b!203758))

(assert (not d!69625))

(assert (not bm!3219))

(assert (not b!203903))

(assert (not b!203863))

(assert (not b!203905))

(assert (not b!203922))

(assert (not d!69589))

(assert (not b!203862))

(assert (not d!69623))

(assert (not b!203867))

(assert (not b!203904))

(assert (not d!69601))

(assert (not d!69639))

(assert (not d!69633))

(assert (not d!69631))

(assert (not b!203872))

(assert (not b!203876))

(assert (not d!69579))

(assert (not d!69599))

(assert (not d!69641))

(assert (not b!203901))

(assert (not b!203756))

(assert (not b!203877))

(assert (not b!203902))

(assert (not d!69587))

(assert (not b!203865))

(check-sat)

(pop 1)

(push 1)

(check-sat)

