; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43344 () Bool)

(assert start!43344)

(declare-fun res!171476 () Bool)

(declare-fun e!140094 () Bool)

(assert (=> start!43344 (=> (not res!171476) (not e!140094))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!43344 (= res!171476 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43344 e!140094))

(assert (=> start!43344 true))

(declare-datatypes ((array!10346 0))(
  ( (array!10347 (arr!5479 (Array (_ BitVec 32) (_ BitVec 8))) (size!4549 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8206 0))(
  ( (BitStream!8207 (buf!5054 array!10346) (currentByte!9539 (_ BitVec 32)) (currentBit!9534 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8206)

(declare-fun e!140092 () Bool)

(declare-fun inv!12 (BitStream!8206) Bool)

(assert (=> start!43344 (and (inv!12 thiss!1204) e!140092)))

(declare-fun b!204612 () Bool)

(declare-fun array_inv!4290 (array!10346) Bool)

(assert (=> b!204612 (= e!140092 (array_inv!4290 (buf!5054 thiss!1204)))))

(declare-fun b!204613 () Bool)

(declare-fun res!171472 () Bool)

(assert (=> b!204613 (=> (not res!171472) (not e!140094))))

(assert (=> b!204613 (= res!171472 (not (= i!590 nBits!348)))))

(declare-fun b!204614 () Bool)

(declare-fun e!140095 () Bool)

(declare-fun e!140093 () Bool)

(assert (=> b!204614 (= e!140095 e!140093)))

(declare-fun res!171485 () Bool)

(assert (=> b!204614 (=> res!171485 e!140093)))

(declare-fun lt!319534 () (_ BitVec 64))

(declare-fun lt!319531 () (_ BitVec 64))

(assert (=> b!204614 (= res!171485 (not (= lt!319531 (bvsub (bvsub (bvadd lt!319534 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-datatypes ((Unit!14589 0))(
  ( (Unit!14590) )
))
(declare-datatypes ((tuple2!17504 0))(
  ( (tuple2!17505 (_1!9404 Unit!14589) (_2!9404 BitStream!8206)) )
))
(declare-fun lt!319536 () tuple2!17504)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!204614 (= lt!319531 (bitIndex!0 (size!4549 (buf!5054 (_2!9404 lt!319536))) (currentByte!9539 (_2!9404 lt!319536)) (currentBit!9534 (_2!9404 lt!319536))))))

(declare-fun isPrefixOf!0 (BitStream!8206 BitStream!8206) Bool)

(assert (=> b!204614 (isPrefixOf!0 thiss!1204 (_2!9404 lt!319536))))

(declare-fun lt!319530 () tuple2!17504)

(declare-fun lt!319538 () Unit!14589)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8206 BitStream!8206 BitStream!8206) Unit!14589)

(assert (=> b!204614 (= lt!319538 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9404 lt!319530) (_2!9404 lt!319536)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8206 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17504)

(assert (=> b!204614 (= lt!319536 (appendBitsLSBFirstLoopTR!0 (_2!9404 lt!319530) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!204615 () Bool)

(declare-fun e!140091 () Bool)

(declare-fun e!140096 () Bool)

(assert (=> b!204615 (= e!140091 e!140096)))

(declare-fun res!171481 () Bool)

(assert (=> b!204615 (=> (not res!171481) (not e!140096))))

(declare-fun lt!319535 () Bool)

(declare-datatypes ((tuple2!17506 0))(
  ( (tuple2!17507 (_1!9405 BitStream!8206) (_2!9405 Bool)) )
))
(declare-fun lt!319537 () tuple2!17506)

(assert (=> b!204615 (= res!171481 (and (= (_2!9405 lt!319537) lt!319535) (= (_1!9405 lt!319537) (_2!9404 lt!319530))))))

(declare-fun readBitPure!0 (BitStream!8206) tuple2!17506)

(declare-fun readerFrom!0 (BitStream!8206 (_ BitVec 32) (_ BitVec 32)) BitStream!8206)

(assert (=> b!204615 (= lt!319537 (readBitPure!0 (readerFrom!0 (_2!9404 lt!319530) (currentBit!9534 thiss!1204) (currentByte!9539 thiss!1204))))))

(declare-fun b!204616 () Bool)

(declare-fun res!171478 () Bool)

(assert (=> b!204616 (=> res!171478 e!140093)))

(declare-fun lt!319529 () (_ BitVec 64))

(assert (=> b!204616 (= res!171478 (or (not (= (size!4549 (buf!5054 (_2!9404 lt!319536))) (size!4549 (buf!5054 thiss!1204)))) (not (= lt!319531 (bvsub (bvadd lt!319529 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!204617 () Bool)

(declare-fun res!171482 () Bool)

(assert (=> b!204617 (=> res!171482 e!140093)))

(assert (=> b!204617 (= res!171482 (not (isPrefixOf!0 thiss!1204 (_2!9404 lt!319530))))))

(declare-fun b!204618 () Bool)

(declare-fun res!171483 () Bool)

(assert (=> b!204618 (=> (not res!171483) (not e!140094))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!204618 (= res!171483 (validate_offset_bits!1 ((_ sign_extend 32) (size!4549 (buf!5054 thiss!1204))) ((_ sign_extend 32) (currentByte!9539 thiss!1204)) ((_ sign_extend 32) (currentBit!9534 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!204619 () Bool)

(declare-fun e!140089 () Bool)

(assert (=> b!204619 (= e!140093 e!140089)))

(declare-fun res!171475 () Bool)

(assert (=> b!204619 (=> res!171475 e!140089)))

(assert (=> b!204619 (= res!171475 (not (= (size!4549 (buf!5054 (_2!9404 lt!319530))) (size!4549 (buf!5054 (_2!9404 lt!319536))))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!204619 (invariant!0 (currentBit!9534 thiss!1204) (currentByte!9539 thiss!1204) (size!4549 (buf!5054 (_2!9404 lt!319530))))))

(declare-fun b!204620 () Bool)

(assert (=> b!204620 (= e!140094 (not e!140095))))

(declare-fun res!171477 () Bool)

(assert (=> b!204620 (=> res!171477 e!140095)))

(assert (=> b!204620 (= res!171477 (not (= lt!319534 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!319529))))))

(assert (=> b!204620 (= lt!319534 (bitIndex!0 (size!4549 (buf!5054 (_2!9404 lt!319530))) (currentByte!9539 (_2!9404 lt!319530)) (currentBit!9534 (_2!9404 lt!319530))))))

(assert (=> b!204620 (= lt!319529 (bitIndex!0 (size!4549 (buf!5054 thiss!1204)) (currentByte!9539 thiss!1204) (currentBit!9534 thiss!1204)))))

(declare-fun e!140097 () Bool)

(assert (=> b!204620 e!140097))

(declare-fun res!171479 () Bool)

(assert (=> b!204620 (=> (not res!171479) (not e!140097))))

(assert (=> b!204620 (= res!171479 (= (size!4549 (buf!5054 thiss!1204)) (size!4549 (buf!5054 (_2!9404 lt!319530)))))))

(declare-fun appendBit!0 (BitStream!8206 Bool) tuple2!17504)

(assert (=> b!204620 (= lt!319530 (appendBit!0 thiss!1204 lt!319535))))

(assert (=> b!204620 (= lt!319535 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!204621 () Bool)

(declare-fun res!171484 () Bool)

(assert (=> b!204621 (=> res!171484 e!140093)))

(assert (=> b!204621 (= res!171484 (not (isPrefixOf!0 (_2!9404 lt!319530) (_2!9404 lt!319536))))))

(declare-fun b!204622 () Bool)

(declare-fun lt!319533 () (_ BitVec 64))

(assert (=> b!204622 (= e!140096 (= (bitIndex!0 (size!4549 (buf!5054 (_1!9405 lt!319537))) (currentByte!9539 (_1!9405 lt!319537)) (currentBit!9534 (_1!9405 lt!319537))) lt!319533))))

(declare-fun b!204623 () Bool)

(assert (=> b!204623 (= e!140097 e!140091)))

(declare-fun res!171471 () Bool)

(assert (=> b!204623 (=> (not res!171471) (not e!140091))))

(declare-fun lt!319532 () (_ BitVec 64))

(assert (=> b!204623 (= res!171471 (= lt!319533 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!319532)))))

(assert (=> b!204623 (= lt!319533 (bitIndex!0 (size!4549 (buf!5054 (_2!9404 lt!319530))) (currentByte!9539 (_2!9404 lt!319530)) (currentBit!9534 (_2!9404 lt!319530))))))

(assert (=> b!204623 (= lt!319532 (bitIndex!0 (size!4549 (buf!5054 thiss!1204)) (currentByte!9539 thiss!1204) (currentBit!9534 thiss!1204)))))

(declare-fun b!204624 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!204624 (= e!140089 (validate_offset_bit!0 ((_ sign_extend 32) (size!4549 (buf!5054 (_2!9404 lt!319530)))) ((_ sign_extend 32) (currentByte!9539 thiss!1204)) ((_ sign_extend 32) (currentBit!9534 thiss!1204))))))

(declare-fun b!204625 () Bool)

(declare-fun res!171480 () Bool)

(assert (=> b!204625 (=> (not res!171480) (not e!140094))))

(assert (=> b!204625 (= res!171480 (invariant!0 (currentBit!9534 thiss!1204) (currentByte!9539 thiss!1204) (size!4549 (buf!5054 thiss!1204))))))

(declare-fun b!204626 () Bool)

(declare-fun res!171473 () Bool)

(assert (=> b!204626 (=> res!171473 e!140093)))

(assert (=> b!204626 (= res!171473 (not (invariant!0 (currentBit!9534 (_2!9404 lt!319536)) (currentByte!9539 (_2!9404 lt!319536)) (size!4549 (buf!5054 (_2!9404 lt!319536))))))))

(declare-fun b!204627 () Bool)

(declare-fun res!171474 () Bool)

(assert (=> b!204627 (=> (not res!171474) (not e!140091))))

(assert (=> b!204627 (= res!171474 (isPrefixOf!0 thiss!1204 (_2!9404 lt!319530)))))

(assert (= (and start!43344 res!171476) b!204618))

(assert (= (and b!204618 res!171483) b!204625))

(assert (= (and b!204625 res!171480) b!204613))

(assert (= (and b!204613 res!171472) b!204620))

(assert (= (and b!204620 res!171479) b!204623))

(assert (= (and b!204623 res!171471) b!204627))

(assert (= (and b!204627 res!171474) b!204615))

(assert (= (and b!204615 res!171481) b!204622))

(assert (= (and b!204620 (not res!171477)) b!204614))

(assert (= (and b!204614 (not res!171485)) b!204626))

(assert (= (and b!204626 (not res!171473)) b!204616))

(assert (= (and b!204616 (not res!171478)) b!204621))

(assert (= (and b!204621 (not res!171484)) b!204617))

(assert (= (and b!204617 (not res!171482)) b!204619))

(assert (= (and b!204619 (not res!171475)) b!204624))

(assert (= start!43344 b!204612))

(declare-fun m!315705 () Bool)

(assert (=> b!204627 m!315705))

(declare-fun m!315707 () Bool)

(assert (=> b!204626 m!315707))

(declare-fun m!315709 () Bool)

(assert (=> b!204614 m!315709))

(declare-fun m!315711 () Bool)

(assert (=> b!204614 m!315711))

(declare-fun m!315713 () Bool)

(assert (=> b!204614 m!315713))

(declare-fun m!315715 () Bool)

(assert (=> b!204614 m!315715))

(declare-fun m!315717 () Bool)

(assert (=> b!204622 m!315717))

(declare-fun m!315719 () Bool)

(assert (=> start!43344 m!315719))

(declare-fun m!315721 () Bool)

(assert (=> b!204624 m!315721))

(declare-fun m!315723 () Bool)

(assert (=> b!204619 m!315723))

(declare-fun m!315725 () Bool)

(assert (=> b!204620 m!315725))

(declare-fun m!315727 () Bool)

(assert (=> b!204620 m!315727))

(declare-fun m!315729 () Bool)

(assert (=> b!204620 m!315729))

(assert (=> b!204617 m!315705))

(declare-fun m!315731 () Bool)

(assert (=> b!204625 m!315731))

(declare-fun m!315733 () Bool)

(assert (=> b!204618 m!315733))

(declare-fun m!315735 () Bool)

(assert (=> b!204612 m!315735))

(declare-fun m!315737 () Bool)

(assert (=> b!204615 m!315737))

(assert (=> b!204615 m!315737))

(declare-fun m!315739 () Bool)

(assert (=> b!204615 m!315739))

(assert (=> b!204623 m!315725))

(assert (=> b!204623 m!315727))

(declare-fun m!315741 () Bool)

(assert (=> b!204621 m!315741))

(push 1)

(assert (not b!204614))

(assert (not b!204622))

(assert (not b!204624))

(assert (not b!204625))

(assert (not b!204620))

(assert (not b!204617))

(assert (not b!204626))

(assert (not b!204612))

(assert (not b!204619))

(assert (not b!204621))

(assert (not start!43344))

(assert (not b!204627))

(assert (not b!204615))

(assert (not b!204623))

(assert (not b!204618))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!69765 () Bool)

(declare-fun e!140175 () Bool)

(assert (=> d!69765 e!140175))

(declare-fun res!171616 () Bool)

(assert (=> d!69765 (=> (not res!171616) (not e!140175))))

(declare-fun lt!319661 () (_ BitVec 64))

(declare-fun lt!319656 () (_ BitVec 64))

(declare-fun lt!319659 () (_ BitVec 64))

(assert (=> d!69765 (= res!171616 (= lt!319656 (bvsub lt!319661 lt!319659)))))

(assert (=> d!69765 (or (= (bvand lt!319661 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!319659 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!319661 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!319661 lt!319659) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!69765 (= lt!319659 (remainingBits!0 ((_ sign_extend 32) (size!4549 (buf!5054 (_2!9404 lt!319530)))) ((_ sign_extend 32) (currentByte!9539 (_2!9404 lt!319530))) ((_ sign_extend 32) (currentBit!9534 (_2!9404 lt!319530)))))))

(declare-fun lt!319657 () (_ BitVec 64))

(declare-fun lt!319658 () (_ BitVec 64))

(assert (=> d!69765 (= lt!319661 (bvmul lt!319657 lt!319658))))

(assert (=> d!69765 (or (= lt!319657 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!319658 (bvsdiv (bvmul lt!319657 lt!319658) lt!319657)))))

(assert (=> d!69765 (= lt!319658 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69765 (= lt!319657 ((_ sign_extend 32) (size!4549 (buf!5054 (_2!9404 lt!319530)))))))

(assert (=> d!69765 (= lt!319656 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9539 (_2!9404 lt!319530))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9534 (_2!9404 lt!319530)))))))

(assert (=> d!69765 (invariant!0 (currentBit!9534 (_2!9404 lt!319530)) (currentByte!9539 (_2!9404 lt!319530)) (size!4549 (buf!5054 (_2!9404 lt!319530))))))

(assert (=> d!69765 (= (bitIndex!0 (size!4549 (buf!5054 (_2!9404 lt!319530))) (currentByte!9539 (_2!9404 lt!319530)) (currentBit!9534 (_2!9404 lt!319530))) lt!319656)))

(declare-fun b!204763 () Bool)

(declare-fun res!171615 () Bool)

(assert (=> b!204763 (=> (not res!171615) (not e!140175))))

(assert (=> b!204763 (= res!171615 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!319656))))

(declare-fun b!204764 () Bool)

(declare-fun lt!319660 () (_ BitVec 64))

(assert (=> b!204764 (= e!140175 (bvsle lt!319656 (bvmul lt!319660 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!204764 (or (= lt!319660 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!319660 #b0000000000000000000000000000000000000000000000000000000000001000) lt!319660)))))

(assert (=> b!204764 (= lt!319660 ((_ sign_extend 32) (size!4549 (buf!5054 (_2!9404 lt!319530)))))))

(assert (= (and d!69765 res!171616) b!204763))

(assert (= (and b!204763 res!171615) b!204764))

(declare-fun m!315837 () Bool)

(assert (=> d!69765 m!315837))

(declare-fun m!315839 () Bool)

(assert (=> d!69765 m!315839))

(assert (=> b!204620 d!69765))

(declare-fun d!69777 () Bool)

(declare-fun e!140177 () Bool)

(assert (=> d!69777 e!140177))

(declare-fun res!171620 () Bool)

(assert (=> d!69777 (=> (not res!171620) (not e!140177))))

(declare-fun lt!319673 () (_ BitVec 64))

(declare-fun lt!319668 () (_ BitVec 64))

(declare-fun lt!319671 () (_ BitVec 64))

(assert (=> d!69777 (= res!171620 (= lt!319668 (bvsub lt!319673 lt!319671)))))

(assert (=> d!69777 (or (= (bvand lt!319673 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!319671 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!319673 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!319673 lt!319671) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69777 (= lt!319671 (remainingBits!0 ((_ sign_extend 32) (size!4549 (buf!5054 thiss!1204))) ((_ sign_extend 32) (currentByte!9539 thiss!1204)) ((_ sign_extend 32) (currentBit!9534 thiss!1204))))))

(declare-fun lt!319669 () (_ BitVec 64))

(declare-fun lt!319670 () (_ BitVec 64))

(assert (=> d!69777 (= lt!319673 (bvmul lt!319669 lt!319670))))

(assert (=> d!69777 (or (= lt!319669 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!319670 (bvsdiv (bvmul lt!319669 lt!319670) lt!319669)))))

(assert (=> d!69777 (= lt!319670 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69777 (= lt!319669 ((_ sign_extend 32) (size!4549 (buf!5054 thiss!1204))))))

(assert (=> d!69777 (= lt!319668 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9539 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9534 thiss!1204))))))

(assert (=> d!69777 (invariant!0 (currentBit!9534 thiss!1204) (currentByte!9539 thiss!1204) (size!4549 (buf!5054 thiss!1204)))))

(assert (=> d!69777 (= (bitIndex!0 (size!4549 (buf!5054 thiss!1204)) (currentByte!9539 thiss!1204) (currentBit!9534 thiss!1204)) lt!319668)))

(declare-fun b!204767 () Bool)

(declare-fun res!171619 () Bool)

(assert (=> b!204767 (=> (not res!171619) (not e!140177))))

(assert (=> b!204767 (= res!171619 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!319668))))

(declare-fun b!204768 () Bool)

(declare-fun lt!319672 () (_ BitVec 64))

(assert (=> b!204768 (= e!140177 (bvsle lt!319668 (bvmul lt!319672 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!204768 (or (= lt!319672 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!319672 #b0000000000000000000000000000000000000000000000000000000000001000) lt!319672)))))

(assert (=> b!204768 (= lt!319672 ((_ sign_extend 32) (size!4549 (buf!5054 thiss!1204))))))

(assert (= (and d!69777 res!171620) b!204767))

(assert (= (and b!204767 res!171619) b!204768))

(declare-fun m!315843 () Bool)

(assert (=> d!69777 m!315843))

(assert (=> d!69777 m!315731))

(assert (=> b!204620 d!69777))

(declare-fun b!204782 () Bool)

(declare-fun res!171633 () Bool)

(declare-fun e!140184 () Bool)

(assert (=> b!204782 (=> (not res!171633) (not e!140184))))

(declare-fun lt!319685 () tuple2!17504)

(assert (=> b!204782 (= res!171633 (isPrefixOf!0 thiss!1204 (_2!9404 lt!319685)))))

(declare-fun b!204781 () Bool)

(declare-fun res!171635 () Bool)

(assert (=> b!204781 (=> (not res!171635) (not e!140184))))

(declare-fun lt!319686 () (_ BitVec 64))

(declare-fun lt!319688 () (_ BitVec 64))

(assert (=> b!204781 (= res!171635 (= (bitIndex!0 (size!4549 (buf!5054 (_2!9404 lt!319685))) (currentByte!9539 (_2!9404 lt!319685)) (currentBit!9534 (_2!9404 lt!319685))) (bvadd lt!319686 lt!319688)))))

(assert (=> b!204781 (or (not (= (bvand lt!319686 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!319688 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!319686 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!319686 lt!319688) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!204781 (= lt!319688 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!204781 (= lt!319686 (bitIndex!0 (size!4549 (buf!5054 thiss!1204)) (currentByte!9539 thiss!1204) (currentBit!9534 thiss!1204)))))

(declare-fun b!204784 () Bool)

(declare-fun e!140185 () Bool)

(declare-fun lt!319687 () tuple2!17506)

(assert (=> b!204784 (= e!140185 (= (bitIndex!0 (size!4549 (buf!5054 (_1!9405 lt!319687))) (currentByte!9539 (_1!9405 lt!319687)) (currentBit!9534 (_1!9405 lt!319687))) (bitIndex!0 (size!4549 (buf!5054 (_2!9404 lt!319685))) (currentByte!9539 (_2!9404 lt!319685)) (currentBit!9534 (_2!9404 lt!319685)))))))

(declare-fun d!69781 () Bool)

(assert (=> d!69781 e!140184))

(declare-fun res!171634 () Bool)

(assert (=> d!69781 (=> (not res!171634) (not e!140184))))

(assert (=> d!69781 (= res!171634 (= (size!4549 (buf!5054 thiss!1204)) (size!4549 (buf!5054 (_2!9404 lt!319685)))))))

(declare-fun choose!16 (BitStream!8206 Bool) tuple2!17504)

(assert (=> d!69781 (= lt!319685 (choose!16 thiss!1204 lt!319535))))

(assert (=> d!69781 (validate_offset_bit!0 ((_ sign_extend 32) (size!4549 (buf!5054 thiss!1204))) ((_ sign_extend 32) (currentByte!9539 thiss!1204)) ((_ sign_extend 32) (currentBit!9534 thiss!1204)))))

(assert (=> d!69781 (= (appendBit!0 thiss!1204 lt!319535) lt!319685)))

(declare-fun b!204783 () Bool)

(assert (=> b!204783 (= e!140184 e!140185)))

(declare-fun res!171632 () Bool)

(assert (=> b!204783 (=> (not res!171632) (not e!140185))))

(assert (=> b!204783 (= res!171632 (and (= (_2!9405 lt!319687) lt!319535) (= (_1!9405 lt!319687) (_2!9404 lt!319685))))))

(assert (=> b!204783 (= lt!319687 (readBitPure!0 (readerFrom!0 (_2!9404 lt!319685) (currentBit!9534 thiss!1204) (currentByte!9539 thiss!1204))))))

(assert (= (and d!69781 res!171634) b!204781))

(assert (= (and b!204781 res!171635) b!204782))

(assert (= (and b!204782 res!171633) b!204783))

(assert (= (and b!204783 res!171632) b!204784))

(declare-fun m!315849 () Bool)

(assert (=> b!204781 m!315849))

(assert (=> b!204781 m!315727))

(declare-fun m!315851 () Bool)

(assert (=> b!204783 m!315851))

(assert (=> b!204783 m!315851))

(declare-fun m!315853 () Bool)

(assert (=> b!204783 m!315853))

(declare-fun m!315855 () Bool)

(assert (=> b!204782 m!315855))

(declare-fun m!315857 () Bool)

(assert (=> b!204784 m!315857))

(assert (=> b!204784 m!315849))

(declare-fun m!315859 () Bool)

(assert (=> d!69781 m!315859))

(declare-fun m!315861 () Bool)

(assert (=> d!69781 m!315861))

(assert (=> b!204620 d!69781))

(declare-fun d!69787 () Bool)

(declare-fun e!140186 () Bool)

(assert (=> d!69787 e!140186))

(declare-fun res!171637 () Bool)

(assert (=> d!69787 (=> (not res!171637) (not e!140186))))

(declare-fun lt!319694 () (_ BitVec 64))

(declare-fun lt!319689 () (_ BitVec 64))

(declare-fun lt!319692 () (_ BitVec 64))

(assert (=> d!69787 (= res!171637 (= lt!319689 (bvsub lt!319694 lt!319692)))))

(assert (=> d!69787 (or (= (bvand lt!319694 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!319692 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!319694 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!319694 lt!319692) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69787 (= lt!319692 (remainingBits!0 ((_ sign_extend 32) (size!4549 (buf!5054 (_1!9405 lt!319537)))) ((_ sign_extend 32) (currentByte!9539 (_1!9405 lt!319537))) ((_ sign_extend 32) (currentBit!9534 (_1!9405 lt!319537)))))))

(declare-fun lt!319690 () (_ BitVec 64))

(declare-fun lt!319691 () (_ BitVec 64))

(assert (=> d!69787 (= lt!319694 (bvmul lt!319690 lt!319691))))

(assert (=> d!69787 (or (= lt!319690 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!319691 (bvsdiv (bvmul lt!319690 lt!319691) lt!319690)))))

(assert (=> d!69787 (= lt!319691 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69787 (= lt!319690 ((_ sign_extend 32) (size!4549 (buf!5054 (_1!9405 lt!319537)))))))

(assert (=> d!69787 (= lt!319689 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9539 (_1!9405 lt!319537))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9534 (_1!9405 lt!319537)))))))

(assert (=> d!69787 (invariant!0 (currentBit!9534 (_1!9405 lt!319537)) (currentByte!9539 (_1!9405 lt!319537)) (size!4549 (buf!5054 (_1!9405 lt!319537))))))

(assert (=> d!69787 (= (bitIndex!0 (size!4549 (buf!5054 (_1!9405 lt!319537))) (currentByte!9539 (_1!9405 lt!319537)) (currentBit!9534 (_1!9405 lt!319537))) lt!319689)))

(declare-fun b!204785 () Bool)

(declare-fun res!171636 () Bool)

(assert (=> b!204785 (=> (not res!171636) (not e!140186))))

(assert (=> b!204785 (= res!171636 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!319689))))

(declare-fun b!204786 () Bool)

(declare-fun lt!319693 () (_ BitVec 64))

(assert (=> b!204786 (= e!140186 (bvsle lt!319689 (bvmul lt!319693 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!204786 (or (= lt!319693 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!319693 #b0000000000000000000000000000000000000000000000000000000000001000) lt!319693)))))

(assert (=> b!204786 (= lt!319693 ((_ sign_extend 32) (size!4549 (buf!5054 (_1!9405 lt!319537)))))))

(assert (= (and d!69787 res!171637) b!204785))

(assert (= (and b!204785 res!171636) b!204786))

(declare-fun m!315863 () Bool)

(assert (=> d!69787 m!315863))

(declare-fun m!315865 () Bool)

(assert (=> d!69787 m!315865))

(assert (=> b!204622 d!69787))

(declare-fun d!69789 () Bool)

(declare-fun res!171645 () Bool)

(declare-fun e!140191 () Bool)

(assert (=> d!69789 (=> (not res!171645) (not e!140191))))

(assert (=> d!69789 (= res!171645 (= (size!4549 (buf!5054 (_2!9404 lt!319530))) (size!4549 (buf!5054 (_2!9404 lt!319536)))))))

(assert (=> d!69789 (= (isPrefixOf!0 (_2!9404 lt!319530) (_2!9404 lt!319536)) e!140191)))

(declare-fun b!204793 () Bool)

(declare-fun res!171644 () Bool)

(assert (=> b!204793 (=> (not res!171644) (not e!140191))))

(assert (=> b!204793 (= res!171644 (bvsle (bitIndex!0 (size!4549 (buf!5054 (_2!9404 lt!319530))) (currentByte!9539 (_2!9404 lt!319530)) (currentBit!9534 (_2!9404 lt!319530))) (bitIndex!0 (size!4549 (buf!5054 (_2!9404 lt!319536))) (currentByte!9539 (_2!9404 lt!319536)) (currentBit!9534 (_2!9404 lt!319536)))))))

(declare-fun b!204794 () Bool)

(declare-fun e!140192 () Bool)

(assert (=> b!204794 (= e!140191 e!140192)))

(declare-fun res!171646 () Bool)

(assert (=> b!204794 (=> res!171646 e!140192)))

(assert (=> b!204794 (= res!171646 (= (size!4549 (buf!5054 (_2!9404 lt!319530))) #b00000000000000000000000000000000))))

(declare-fun b!204795 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10346 array!10346 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!204795 (= e!140192 (arrayBitRangesEq!0 (buf!5054 (_2!9404 lt!319530)) (buf!5054 (_2!9404 lt!319536)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4549 (buf!5054 (_2!9404 lt!319530))) (currentByte!9539 (_2!9404 lt!319530)) (currentBit!9534 (_2!9404 lt!319530)))))))

(assert (= (and d!69789 res!171645) b!204793))

(assert (= (and b!204793 res!171644) b!204794))

(assert (= (and b!204794 (not res!171646)) b!204795))

(assert (=> b!204793 m!315725))

(assert (=> b!204793 m!315709))

(assert (=> b!204795 m!315725))

(assert (=> b!204795 m!315725))

(declare-fun m!315867 () Bool)

(assert (=> b!204795 m!315867))

(assert (=> b!204621 d!69789))

(declare-fun d!69791 () Bool)

(assert (=> d!69791 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4549 (buf!5054 thiss!1204))) ((_ sign_extend 32) (currentByte!9539 thiss!1204)) ((_ sign_extend 32) (currentBit!9534 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4549 (buf!5054 thiss!1204))) ((_ sign_extend 32) (currentByte!9539 thiss!1204)) ((_ sign_extend 32) (currentBit!9534 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!17179 () Bool)

(assert (= bs!17179 d!69791))

(assert (=> bs!17179 m!315843))

(assert (=> b!204618 d!69791))

(declare-fun d!69793 () Bool)

(declare-fun res!171648 () Bool)

(declare-fun e!140193 () Bool)

(assert (=> d!69793 (=> (not res!171648) (not e!140193))))

(assert (=> d!69793 (= res!171648 (= (size!4549 (buf!5054 thiss!1204)) (size!4549 (buf!5054 (_2!9404 lt!319530)))))))

(assert (=> d!69793 (= (isPrefixOf!0 thiss!1204 (_2!9404 lt!319530)) e!140193)))

(declare-fun b!204796 () Bool)

(declare-fun res!171647 () Bool)

(assert (=> b!204796 (=> (not res!171647) (not e!140193))))

(assert (=> b!204796 (= res!171647 (bvsle (bitIndex!0 (size!4549 (buf!5054 thiss!1204)) (currentByte!9539 thiss!1204) (currentBit!9534 thiss!1204)) (bitIndex!0 (size!4549 (buf!5054 (_2!9404 lt!319530))) (currentByte!9539 (_2!9404 lt!319530)) (currentBit!9534 (_2!9404 lt!319530)))))))

(declare-fun b!204797 () Bool)

(declare-fun e!140194 () Bool)

(assert (=> b!204797 (= e!140193 e!140194)))

(declare-fun res!171649 () Bool)

(assert (=> b!204797 (=> res!171649 e!140194)))

(assert (=> b!204797 (= res!171649 (= (size!4549 (buf!5054 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!204798 () Bool)

(assert (=> b!204798 (= e!140194 (arrayBitRangesEq!0 (buf!5054 thiss!1204) (buf!5054 (_2!9404 lt!319530)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4549 (buf!5054 thiss!1204)) (currentByte!9539 thiss!1204) (currentBit!9534 thiss!1204))))))

(assert (= (and d!69793 res!171648) b!204796))

(assert (= (and b!204796 res!171647) b!204797))

(assert (= (and b!204797 (not res!171649)) b!204798))

(assert (=> b!204796 m!315727))

(assert (=> b!204796 m!315725))

(assert (=> b!204798 m!315727))

(assert (=> b!204798 m!315727))

(declare-fun m!315869 () Bool)

(assert (=> b!204798 m!315869))

(assert (=> b!204617 d!69793))

(declare-fun d!69795 () Bool)

(assert (=> d!69795 (= (invariant!0 (currentBit!9534 thiss!1204) (currentByte!9539 thiss!1204) (size!4549 (buf!5054 (_2!9404 lt!319530)))) (and (bvsge (currentBit!9534 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9534 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9539 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9539 thiss!1204) (size!4549 (buf!5054 (_2!9404 lt!319530)))) (and (= (currentBit!9534 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9539 thiss!1204) (size!4549 (buf!5054 (_2!9404 lt!319530))))))))))

(assert (=> b!204619 d!69795))

(declare-fun d!69797 () Bool)

(declare-datatypes ((tuple2!17528 0))(
  ( (tuple2!17529 (_1!9416 Bool) (_2!9416 BitStream!8206)) )
))
(declare-fun lt!319697 () tuple2!17528)

(declare-fun readBit!0 (BitStream!8206) tuple2!17528)

(assert (=> d!69797 (= lt!319697 (readBit!0 (readerFrom!0 (_2!9404 lt!319530) (currentBit!9534 thiss!1204) (currentByte!9539 thiss!1204))))))

(assert (=> d!69797 (= (readBitPure!0 (readerFrom!0 (_2!9404 lt!319530) (currentBit!9534 thiss!1204) (currentByte!9539 thiss!1204))) (tuple2!17507 (_2!9416 lt!319697) (_1!9416 lt!319697)))))

(declare-fun bs!17180 () Bool)

(assert (= bs!17180 d!69797))

(assert (=> bs!17180 m!315737))

(declare-fun m!315871 () Bool)

(assert (=> bs!17180 m!315871))

(assert (=> b!204615 d!69797))

(declare-fun d!69799 () Bool)

(declare-fun e!140197 () Bool)

(assert (=> d!69799 e!140197))

(declare-fun res!171653 () Bool)

(assert (=> d!69799 (=> (not res!171653) (not e!140197))))

(assert (=> d!69799 (= res!171653 (invariant!0 (currentBit!9534 (_2!9404 lt!319530)) (currentByte!9539 (_2!9404 lt!319530)) (size!4549 (buf!5054 (_2!9404 lt!319530)))))))

(assert (=> d!69799 (= (readerFrom!0 (_2!9404 lt!319530) (currentBit!9534 thiss!1204) (currentByte!9539 thiss!1204)) (BitStream!8207 (buf!5054 (_2!9404 lt!319530)) (currentByte!9539 thiss!1204) (currentBit!9534 thiss!1204)))))

(declare-fun b!204801 () Bool)

(assert (=> b!204801 (= e!140197 (invariant!0 (currentBit!9534 thiss!1204) (currentByte!9539 thiss!1204) (size!4549 (buf!5054 (_2!9404 lt!319530)))))))

(assert (= (and d!69799 res!171653) b!204801))

(assert (=> d!69799 m!315839))

(assert (=> b!204801 m!315723))

(assert (=> b!204615 d!69799))

(declare-fun d!69801 () Bool)

(assert (=> d!69801 (= (invariant!0 (currentBit!9534 (_2!9404 lt!319536)) (currentByte!9539 (_2!9404 lt!319536)) (size!4549 (buf!5054 (_2!9404 lt!319536)))) (and (bvsge (currentBit!9534 (_2!9404 lt!319536)) #b00000000000000000000000000000000) (bvslt (currentBit!9534 (_2!9404 lt!319536)) #b00000000000000000000000000001000) (bvsge (currentByte!9539 (_2!9404 lt!319536)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9539 (_2!9404 lt!319536)) (size!4549 (buf!5054 (_2!9404 lt!319536)))) (and (= (currentBit!9534 (_2!9404 lt!319536)) #b00000000000000000000000000000000) (= (currentByte!9539 (_2!9404 lt!319536)) (size!4549 (buf!5054 (_2!9404 lt!319536))))))))))

(assert (=> b!204626 d!69801))

(declare-fun d!69803 () Bool)

(assert (=> d!69803 (= (invariant!0 (currentBit!9534 thiss!1204) (currentByte!9539 thiss!1204) (size!4549 (buf!5054 thiss!1204))) (and (bvsge (currentBit!9534 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9534 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9539 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9539 thiss!1204) (size!4549 (buf!5054 thiss!1204))) (and (= (currentBit!9534 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9539 thiss!1204) (size!4549 (buf!5054 thiss!1204)))))))))

(assert (=> b!204625 d!69803))

(assert (=> b!204627 d!69793))

(declare-fun d!69805 () Bool)

(assert (=> d!69805 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9534 thiss!1204) (currentByte!9539 thiss!1204) (size!4549 (buf!5054 thiss!1204))))))

(declare-fun bs!17181 () Bool)

(assert (= bs!17181 d!69805))

(assert (=> bs!17181 m!315731))

(assert (=> start!43344 d!69805))

(assert (=> b!204623 d!69765))

(assert (=> b!204623 d!69777))

(declare-fun d!69807 () Bool)

(assert (=> d!69807 (= (array_inv!4290 (buf!5054 thiss!1204)) (bvsge (size!4549 (buf!5054 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!204612 d!69807))

(declare-fun d!69809 () Bool)

(declare-fun e!140198 () Bool)

(assert (=> d!69809 e!140198))

(declare-fun res!171655 () Bool)

(assert (=> d!69809 (=> (not res!171655) (not e!140198))))

(declare-fun lt!319703 () (_ BitVec 64))

(declare-fun lt!319701 () (_ BitVec 64))

(declare-fun lt!319698 () (_ BitVec 64))

(assert (=> d!69809 (= res!171655 (= lt!319698 (bvsub lt!319703 lt!319701)))))

(assert (=> d!69809 (or (= (bvand lt!319703 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!319701 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!319703 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!319703 lt!319701) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69809 (= lt!319701 (remainingBits!0 ((_ sign_extend 32) (size!4549 (buf!5054 (_2!9404 lt!319536)))) ((_ sign_extend 32) (currentByte!9539 (_2!9404 lt!319536))) ((_ sign_extend 32) (currentBit!9534 (_2!9404 lt!319536)))))))

(declare-fun lt!319699 () (_ BitVec 64))

(declare-fun lt!319700 () (_ BitVec 64))

(assert (=> d!69809 (= lt!319703 (bvmul lt!319699 lt!319700))))

(assert (=> d!69809 (or (= lt!319699 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!319700 (bvsdiv (bvmul lt!319699 lt!319700) lt!319699)))))

(assert (=> d!69809 (= lt!319700 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69809 (= lt!319699 ((_ sign_extend 32) (size!4549 (buf!5054 (_2!9404 lt!319536)))))))

(assert (=> d!69809 (= lt!319698 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9539 (_2!9404 lt!319536))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9534 (_2!9404 lt!319536)))))))

(assert (=> d!69809 (invariant!0 (currentBit!9534 (_2!9404 lt!319536)) (currentByte!9539 (_2!9404 lt!319536)) (size!4549 (buf!5054 (_2!9404 lt!319536))))))

(assert (=> d!69809 (= (bitIndex!0 (size!4549 (buf!5054 (_2!9404 lt!319536))) (currentByte!9539 (_2!9404 lt!319536)) (currentBit!9534 (_2!9404 lt!319536))) lt!319698)))

(declare-fun b!204802 () Bool)

(declare-fun res!171654 () Bool)

(assert (=> b!204802 (=> (not res!171654) (not e!140198))))

(assert (=> b!204802 (= res!171654 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!319698))))

(declare-fun b!204803 () Bool)

(declare-fun lt!319702 () (_ BitVec 64))

(assert (=> b!204803 (= e!140198 (bvsle lt!319698 (bvmul lt!319702 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!204803 (or (= lt!319702 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!319702 #b0000000000000000000000000000000000000000000000000000000000001000) lt!319702)))))

(assert (=> b!204803 (= lt!319702 ((_ sign_extend 32) (size!4549 (buf!5054 (_2!9404 lt!319536)))))))

(assert (= (and d!69809 res!171655) b!204802))

(assert (= (and b!204802 res!171654) b!204803))

(declare-fun m!315873 () Bool)

(assert (=> d!69809 m!315873))

(assert (=> d!69809 m!315707))

(assert (=> b!204614 d!69809))

(declare-fun d!69811 () Bool)

(declare-fun res!171657 () Bool)

(declare-fun e!140199 () Bool)

(assert (=> d!69811 (=> (not res!171657) (not e!140199))))

(assert (=> d!69811 (= res!171657 (= (size!4549 (buf!5054 thiss!1204)) (size!4549 (buf!5054 (_2!9404 lt!319536)))))))

(assert (=> d!69811 (= (isPrefixOf!0 thiss!1204 (_2!9404 lt!319536)) e!140199)))

(declare-fun b!204804 () Bool)

(declare-fun res!171656 () Bool)

(assert (=> b!204804 (=> (not res!171656) (not e!140199))))

(assert (=> b!204804 (= res!171656 (bvsle (bitIndex!0 (size!4549 (buf!5054 thiss!1204)) (currentByte!9539 thiss!1204) (currentBit!9534 thiss!1204)) (bitIndex!0 (size!4549 (buf!5054 (_2!9404 lt!319536))) (currentByte!9539 (_2!9404 lt!319536)) (currentBit!9534 (_2!9404 lt!319536)))))))

(declare-fun b!204805 () Bool)

(declare-fun e!140200 () Bool)

(assert (=> b!204805 (= e!140199 e!140200)))

(declare-fun res!171658 () Bool)

(assert (=> b!204805 (=> res!171658 e!140200)))

(assert (=> b!204805 (= res!171658 (= (size!4549 (buf!5054 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!204806 () Bool)

(assert (=> b!204806 (= e!140200 (arrayBitRangesEq!0 (buf!5054 thiss!1204) (buf!5054 (_2!9404 lt!319536)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4549 (buf!5054 thiss!1204)) (currentByte!9539 thiss!1204) (currentBit!9534 thiss!1204))))))

(assert (= (and d!69811 res!171657) b!204804))

(assert (= (and b!204804 res!171656) b!204805))

(assert (= (and b!204805 (not res!171658)) b!204806))

(assert (=> b!204804 m!315727))

(assert (=> b!204804 m!315709))

(assert (=> b!204806 m!315727))

(assert (=> b!204806 m!315727))

(declare-fun m!315875 () Bool)

(assert (=> b!204806 m!315875))

(assert (=> b!204614 d!69811))

(declare-fun d!69813 () Bool)

(assert (=> d!69813 (isPrefixOf!0 thiss!1204 (_2!9404 lt!319536))))

(declare-fun lt!319706 () Unit!14589)

(declare-fun choose!30 (BitStream!8206 BitStream!8206 BitStream!8206) Unit!14589)

(assert (=> d!69813 (= lt!319706 (choose!30 thiss!1204 (_2!9404 lt!319530) (_2!9404 lt!319536)))))

(assert (=> d!69813 (isPrefixOf!0 thiss!1204 (_2!9404 lt!319530))))

(assert (=> d!69813 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9404 lt!319530) (_2!9404 lt!319536)) lt!319706)))

(declare-fun bs!17182 () Bool)

(assert (= bs!17182 d!69813))

(assert (=> bs!17182 m!315711))

(declare-fun m!315877 () Bool)

(assert (=> bs!17182 m!315877))

(assert (=> bs!17182 m!315705))

(assert (=> b!204614 d!69813))

(declare-fun lt!320255 () tuple2!17504)

(declare-fun bm!3240 () Bool)

(declare-fun call!3243 () Bool)

(declare-fun c!10150 () Bool)

(assert (=> bm!3240 (= call!3243 (isPrefixOf!0 (_2!9404 lt!319530) (ite c!10150 (_2!9404 lt!319530) (_2!9404 lt!320255))))))

(declare-fun b!204981 () Bool)

(declare-fun e!140299 () Bool)

(declare-fun lt!320243 () tuple2!17506)

(assert (=> b!204981 (= e!140299 (= (bitIndex!0 (size!4549 (buf!5054 (_1!9405 lt!320243))) (currentByte!9539 (_1!9405 lt!320243)) (currentBit!9534 (_1!9405 lt!320243))) (bitIndex!0 (size!4549 (buf!5054 (_2!9404 lt!320255))) (currentByte!9539 (_2!9404 lt!320255)) (currentBit!9534 (_2!9404 lt!320255)))))))

(declare-fun b!204982 () Bool)

(declare-fun res!171804 () Bool)

(assert (=> b!204982 (= res!171804 (= (bitIndex!0 (size!4549 (buf!5054 (_2!9404 lt!320255))) (currentByte!9539 (_2!9404 lt!320255)) (currentBit!9534 (_2!9404 lt!320255))) (bvadd (bitIndex!0 (size!4549 (buf!5054 (_2!9404 lt!319530))) (currentByte!9539 (_2!9404 lt!319530)) (currentBit!9534 (_2!9404 lt!319530))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!140300 () Bool)

(assert (=> b!204982 (=> (not res!171804) (not e!140300))))

(declare-fun b!204983 () Bool)

(declare-fun e!140304 () Bool)

(declare-fun lt!320263 () tuple2!17506)

(declare-fun lt!320234 () tuple2!17506)

(assert (=> b!204983 (= e!140304 (= (_2!9405 lt!320263) (_2!9405 lt!320234)))))

(declare-fun b!204984 () Bool)

(assert (=> b!204984 (= lt!320243 (readBitPure!0 (readerFrom!0 (_2!9404 lt!320255) (currentBit!9534 (_2!9404 lt!319530)) (currentByte!9539 (_2!9404 lt!319530)))))))

(declare-fun res!171812 () Bool)

(declare-fun lt!320224 () Bool)

(assert (=> b!204984 (= res!171812 (and (= (_2!9405 lt!320243) lt!320224) (= (_1!9405 lt!320243) (_2!9404 lt!320255))))))

(assert (=> b!204984 (=> (not res!171812) (not e!140299))))

(assert (=> b!204984 (= e!140300 e!140299)))

(declare-fun b!204985 () Bool)

(declare-fun e!140306 () tuple2!17504)

(declare-fun Unit!14617 () Unit!14589)

(assert (=> b!204985 (= e!140306 (tuple2!17505 Unit!14617 (_2!9404 lt!319530)))))

(declare-fun lt!320239 () Unit!14589)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8206) Unit!14589)

(assert (=> b!204985 (= lt!320239 (lemmaIsPrefixRefl!0 (_2!9404 lt!319530)))))

(assert (=> b!204985 call!3243))

(declare-fun lt!320259 () Unit!14589)

(assert (=> b!204985 (= lt!320259 lt!320239)))

(declare-fun b!204986 () Bool)

(declare-fun e!140303 () (_ BitVec 64))

(assert (=> b!204986 (= e!140303 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!204987 () Bool)

(declare-fun e!140307 () Bool)

(declare-datatypes ((tuple2!17530 0))(
  ( (tuple2!17531 (_1!9417 BitStream!8206) (_2!9417 (_ BitVec 64))) )
))
(declare-fun lt!320251 () tuple2!17530)

(declare-datatypes ((tuple2!17532 0))(
  ( (tuple2!17533 (_1!9418 BitStream!8206) (_2!9418 BitStream!8206)) )
))
(declare-fun lt!320237 () tuple2!17532)

(assert (=> b!204987 (= e!140307 (= (_1!9417 lt!320251) (_2!9418 lt!320237)))))

(declare-fun b!204988 () Bool)

(declare-fun e!140302 () Bool)

(declare-fun lt!320216 () (_ BitVec 64))

(assert (=> b!204988 (= e!140302 (validate_offset_bits!1 ((_ sign_extend 32) (size!4549 (buf!5054 (_2!9404 lt!319530)))) ((_ sign_extend 32) (currentByte!9539 (_2!9404 lt!319530))) ((_ sign_extend 32) (currentBit!9534 (_2!9404 lt!319530))) lt!320216))))

(declare-fun b!204989 () Bool)

(declare-fun e!140305 () Bool)

(assert (=> b!204989 (= e!140305 e!140307)))

(declare-fun res!171806 () Bool)

(assert (=> b!204989 (=> (not res!171806) (not e!140307))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!204989 (= res!171806 (= (_2!9417 lt!320251) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8206 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17530)

(assert (=> b!204989 (= lt!320251 (readNBitsLSBFirstsLoopPure!0 (_1!9418 lt!320237) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!320223 () Unit!14589)

(declare-fun lt!320252 () Unit!14589)

(assert (=> b!204989 (= lt!320223 lt!320252)))

(declare-fun lt!320221 () tuple2!17504)

(assert (=> b!204989 (validate_offset_bits!1 ((_ sign_extend 32) (size!4549 (buf!5054 (_2!9404 lt!320221)))) ((_ sign_extend 32) (currentByte!9539 (_2!9404 lt!319530))) ((_ sign_extend 32) (currentBit!9534 (_2!9404 lt!319530))) lt!320216)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8206 array!10346 (_ BitVec 64)) Unit!14589)

(assert (=> b!204989 (= lt!320252 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9404 lt!319530) (buf!5054 (_2!9404 lt!320221)) lt!320216))))

(assert (=> b!204989 e!140302))

(declare-fun res!171808 () Bool)

(assert (=> b!204989 (=> (not res!171808) (not e!140302))))

(assert (=> b!204989 (= res!171808 (and (= (size!4549 (buf!5054 (_2!9404 lt!319530))) (size!4549 (buf!5054 (_2!9404 lt!320221)))) (bvsge lt!320216 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!204989 (= lt!320216 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!204989 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!8206 BitStream!8206) tuple2!17532)

(assert (=> b!204989 (= lt!320237 (reader!0 (_2!9404 lt!319530) (_2!9404 lt!320221)))))

(declare-fun b!204990 () Bool)

(declare-fun lt!320235 () tuple2!17504)

(assert (=> b!204990 (= e!140306 (tuple2!17505 (_1!9404 lt!320235) (_2!9404 lt!320235)))))

(assert (=> b!204990 (= lt!320224 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!204990 (= lt!320255 (appendBit!0 (_2!9404 lt!319530) lt!320224))))

(declare-fun res!171803 () Bool)

(assert (=> b!204990 (= res!171803 (= (size!4549 (buf!5054 (_2!9404 lt!319530))) (size!4549 (buf!5054 (_2!9404 lt!320255)))))))

(assert (=> b!204990 (=> (not res!171803) (not e!140300))))

(assert (=> b!204990 e!140300))

(declare-fun lt!320230 () tuple2!17504)

(assert (=> b!204990 (= lt!320230 lt!320255)))

(assert (=> b!204990 (= lt!320235 (appendBitsLSBFirstLoopTR!0 (_2!9404 lt!320230) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!320247 () Unit!14589)

(assert (=> b!204990 (= lt!320247 (lemmaIsPrefixTransitive!0 (_2!9404 lt!319530) (_2!9404 lt!320230) (_2!9404 lt!320235)))))

(assert (=> b!204990 (isPrefixOf!0 (_2!9404 lt!319530) (_2!9404 lt!320235))))

(declare-fun lt!320248 () Unit!14589)

(assert (=> b!204990 (= lt!320248 lt!320247)))

(assert (=> b!204990 (invariant!0 (currentBit!9534 (_2!9404 lt!319530)) (currentByte!9539 (_2!9404 lt!319530)) (size!4549 (buf!5054 (_2!9404 lt!320230))))))

(declare-fun lt!320256 () BitStream!8206)

(assert (=> b!204990 (= lt!320256 (BitStream!8207 (buf!5054 (_2!9404 lt!320230)) (currentByte!9539 (_2!9404 lt!319530)) (currentBit!9534 (_2!9404 lt!319530))))))

(assert (=> b!204990 (invariant!0 (currentBit!9534 lt!320256) (currentByte!9539 lt!320256) (size!4549 (buf!5054 (_2!9404 lt!320235))))))

(declare-fun lt!320233 () BitStream!8206)

(assert (=> b!204990 (= lt!320233 (BitStream!8207 (buf!5054 (_2!9404 lt!320235)) (currentByte!9539 lt!320256) (currentBit!9534 lt!320256)))))

(assert (=> b!204990 (= lt!320263 (readBitPure!0 lt!320256))))

(assert (=> b!204990 (= lt!320234 (readBitPure!0 lt!320233))))

(declare-fun lt!320250 () Unit!14589)

(declare-fun readBitPrefixLemma!0 (BitStream!8206 BitStream!8206) Unit!14589)

(assert (=> b!204990 (= lt!320250 (readBitPrefixLemma!0 lt!320256 (_2!9404 lt!320235)))))

(declare-fun res!171809 () Bool)

(assert (=> b!204990 (= res!171809 (= (bitIndex!0 (size!4549 (buf!5054 (_1!9405 lt!320263))) (currentByte!9539 (_1!9405 lt!320263)) (currentBit!9534 (_1!9405 lt!320263))) (bitIndex!0 (size!4549 (buf!5054 (_1!9405 lt!320234))) (currentByte!9539 (_1!9405 lt!320234)) (currentBit!9534 (_1!9405 lt!320234)))))))

(assert (=> b!204990 (=> (not res!171809) (not e!140304))))

(assert (=> b!204990 e!140304))

(declare-fun lt!320241 () Unit!14589)

(assert (=> b!204990 (= lt!320241 lt!320250)))

(declare-fun lt!320258 () tuple2!17532)

(assert (=> b!204990 (= lt!320258 (reader!0 (_2!9404 lt!319530) (_2!9404 lt!320235)))))

(declare-fun lt!320225 () tuple2!17532)

(assert (=> b!204990 (= lt!320225 (reader!0 (_2!9404 lt!320230) (_2!9404 lt!320235)))))

(declare-fun lt!320212 () tuple2!17506)

(assert (=> b!204990 (= lt!320212 (readBitPure!0 (_1!9418 lt!320258)))))

(assert (=> b!204990 (= (_2!9405 lt!320212) lt!320224)))

(declare-fun lt!320215 () Unit!14589)

(declare-fun Unit!14618 () Unit!14589)

(assert (=> b!204990 (= lt!320215 Unit!14618)))

(declare-fun lt!320227 () (_ BitVec 64))

(assert (=> b!204990 (= lt!320227 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!320253 () (_ BitVec 64))

(assert (=> b!204990 (= lt!320253 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!320238 () Unit!14589)

(assert (=> b!204990 (= lt!320238 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9404 lt!319530) (buf!5054 (_2!9404 lt!320235)) lt!320253))))

(assert (=> b!204990 (validate_offset_bits!1 ((_ sign_extend 32) (size!4549 (buf!5054 (_2!9404 lt!320235)))) ((_ sign_extend 32) (currentByte!9539 (_2!9404 lt!319530))) ((_ sign_extend 32) (currentBit!9534 (_2!9404 lt!319530))) lt!320253)))

(declare-fun lt!320264 () Unit!14589)

(assert (=> b!204990 (= lt!320264 lt!320238)))

(declare-fun lt!320242 () tuple2!17530)

(assert (=> b!204990 (= lt!320242 (readNBitsLSBFirstsLoopPure!0 (_1!9418 lt!320258) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!320227))))

(declare-fun lt!320232 () (_ BitVec 64))

(assert (=> b!204990 (= lt!320232 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!320211 () Unit!14589)

(assert (=> b!204990 (= lt!320211 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9404 lt!320230) (buf!5054 (_2!9404 lt!320235)) lt!320232))))

(assert (=> b!204990 (validate_offset_bits!1 ((_ sign_extend 32) (size!4549 (buf!5054 (_2!9404 lt!320235)))) ((_ sign_extend 32) (currentByte!9539 (_2!9404 lt!320230))) ((_ sign_extend 32) (currentBit!9534 (_2!9404 lt!320230))) lt!320232)))

(declare-fun lt!320249 () Unit!14589)

(assert (=> b!204990 (= lt!320249 lt!320211)))

(declare-fun lt!320222 () tuple2!17530)

(assert (=> b!204990 (= lt!320222 (readNBitsLSBFirstsLoopPure!0 (_1!9418 lt!320225) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!320227 (ite (_2!9405 lt!320212) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!320210 () tuple2!17530)

(assert (=> b!204990 (= lt!320210 (readNBitsLSBFirstsLoopPure!0 (_1!9418 lt!320258) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!320227))))

(declare-fun c!10151 () Bool)

(assert (=> b!204990 (= c!10151 (_2!9405 (readBitPure!0 (_1!9418 lt!320258))))))

(declare-fun lt!320244 () tuple2!17530)

(declare-fun withMovedBitIndex!0 (BitStream!8206 (_ BitVec 64)) BitStream!8206)

(assert (=> b!204990 (= lt!320244 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9418 lt!320258) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!320227 e!140303)))))

(declare-fun lt!320262 () Unit!14589)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8206 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14589)

(assert (=> b!204990 (= lt!320262 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9418 lt!320258) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!320227))))

(assert (=> b!204990 (and (= (_2!9417 lt!320210) (_2!9417 lt!320244)) (= (_1!9417 lt!320210) (_1!9417 lt!320244)))))

(declare-fun lt!320219 () Unit!14589)

(assert (=> b!204990 (= lt!320219 lt!320262)))

(assert (=> b!204990 (= (_1!9418 lt!320258) (withMovedBitIndex!0 (_2!9418 lt!320258) (bvsub (bitIndex!0 (size!4549 (buf!5054 (_2!9404 lt!319530))) (currentByte!9539 (_2!9404 lt!319530)) (currentBit!9534 (_2!9404 lt!319530))) (bitIndex!0 (size!4549 (buf!5054 (_2!9404 lt!320235))) (currentByte!9539 (_2!9404 lt!320235)) (currentBit!9534 (_2!9404 lt!320235))))))))

(declare-fun lt!320246 () Unit!14589)

(declare-fun Unit!14619 () Unit!14589)

(assert (=> b!204990 (= lt!320246 Unit!14619)))

(assert (=> b!204990 (= (_1!9418 lt!320225) (withMovedBitIndex!0 (_2!9418 lt!320225) (bvsub (bitIndex!0 (size!4549 (buf!5054 (_2!9404 lt!320230))) (currentByte!9539 (_2!9404 lt!320230)) (currentBit!9534 (_2!9404 lt!320230))) (bitIndex!0 (size!4549 (buf!5054 (_2!9404 lt!320235))) (currentByte!9539 (_2!9404 lt!320235)) (currentBit!9534 (_2!9404 lt!320235))))))))

(declare-fun lt!320213 () Unit!14589)

(declare-fun Unit!14620 () Unit!14589)

(assert (=> b!204990 (= lt!320213 Unit!14620)))

(assert (=> b!204990 (= (bitIndex!0 (size!4549 (buf!5054 (_2!9404 lt!319530))) (currentByte!9539 (_2!9404 lt!319530)) (currentBit!9534 (_2!9404 lt!319530))) (bvsub (bitIndex!0 (size!4549 (buf!5054 (_2!9404 lt!320230))) (currentByte!9539 (_2!9404 lt!320230)) (currentBit!9534 (_2!9404 lt!320230))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!320218 () Unit!14589)

(declare-fun Unit!14621 () Unit!14589)

(assert (=> b!204990 (= lt!320218 Unit!14621)))

(assert (=> b!204990 (= (_2!9417 lt!320242) (_2!9417 lt!320222))))

(declare-fun lt!320226 () Unit!14589)

(declare-fun Unit!14622 () Unit!14589)

(assert (=> b!204990 (= lt!320226 Unit!14622)))

(assert (=> b!204990 (invariant!0 (currentBit!9534 (_2!9404 lt!320235)) (currentByte!9539 (_2!9404 lt!320235)) (size!4549 (buf!5054 (_2!9404 lt!320235))))))

(declare-fun lt!320229 () Unit!14589)

(declare-fun Unit!14623 () Unit!14589)

(assert (=> b!204990 (= lt!320229 Unit!14623)))

(assert (=> b!204990 (= (size!4549 (buf!5054 (_2!9404 lt!319530))) (size!4549 (buf!5054 (_2!9404 lt!320235))))))

(declare-fun lt!320231 () Unit!14589)

(declare-fun Unit!14624 () Unit!14589)

(assert (=> b!204990 (= lt!320231 Unit!14624)))

(assert (=> b!204990 (= (bitIndex!0 (size!4549 (buf!5054 (_2!9404 lt!320235))) (currentByte!9539 (_2!9404 lt!320235)) (currentBit!9534 (_2!9404 lt!320235))) (bvsub (bvadd (bitIndex!0 (size!4549 (buf!5054 (_2!9404 lt!319530))) (currentByte!9539 (_2!9404 lt!319530)) (currentBit!9534 (_2!9404 lt!319530))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!320261 () Unit!14589)

(declare-fun Unit!14625 () Unit!14589)

(assert (=> b!204990 (= lt!320261 Unit!14625)))

(declare-fun lt!320245 () Unit!14589)

(declare-fun Unit!14626 () Unit!14589)

(assert (=> b!204990 (= lt!320245 Unit!14626)))

(declare-fun lt!320217 () tuple2!17532)

(assert (=> b!204990 (= lt!320217 (reader!0 (_2!9404 lt!319530) (_2!9404 lt!320235)))))

(declare-fun lt!320260 () (_ BitVec 64))

(assert (=> b!204990 (= lt!320260 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!320240 () Unit!14589)

(assert (=> b!204990 (= lt!320240 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9404 lt!319530) (buf!5054 (_2!9404 lt!320235)) lt!320260))))

(assert (=> b!204990 (validate_offset_bits!1 ((_ sign_extend 32) (size!4549 (buf!5054 (_2!9404 lt!320235)))) ((_ sign_extend 32) (currentByte!9539 (_2!9404 lt!319530))) ((_ sign_extend 32) (currentBit!9534 (_2!9404 lt!319530))) lt!320260)))

(declare-fun lt!320220 () Unit!14589)

(assert (=> b!204990 (= lt!320220 lt!320240)))

(declare-fun lt!320228 () tuple2!17530)

(assert (=> b!204990 (= lt!320228 (readNBitsLSBFirstsLoopPure!0 (_1!9418 lt!320217) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!171801 () Bool)

(assert (=> b!204990 (= res!171801 (= (_2!9417 lt!320228) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!140301 () Bool)

(assert (=> b!204990 (=> (not res!171801) (not e!140301))))

(assert (=> b!204990 e!140301))

(declare-fun lt!320236 () Unit!14589)

(declare-fun Unit!14627 () Unit!14589)

(assert (=> b!204990 (= lt!320236 Unit!14627)))

(declare-fun b!204991 () Bool)

(assert (=> b!204991 (= e!140301 (= (_1!9417 lt!320228) (_2!9418 lt!320217)))))

(declare-fun b!204992 () Bool)

(declare-fun res!171811 () Bool)

(assert (=> b!204992 (= res!171811 call!3243)))

(assert (=> b!204992 (=> (not res!171811) (not e!140300))))

(declare-fun b!204993 () Bool)

(declare-fun res!171802 () Bool)

(assert (=> b!204993 (=> (not res!171802) (not e!140305))))

(assert (=> b!204993 (= res!171802 (= (size!4549 (buf!5054 (_2!9404 lt!319530))) (size!4549 (buf!5054 (_2!9404 lt!320221)))))))

(declare-fun d!69815 () Bool)

(assert (=> d!69815 e!140305))

(declare-fun res!171810 () Bool)

(assert (=> d!69815 (=> (not res!171810) (not e!140305))))

(assert (=> d!69815 (= res!171810 (invariant!0 (currentBit!9534 (_2!9404 lt!320221)) (currentByte!9539 (_2!9404 lt!320221)) (size!4549 (buf!5054 (_2!9404 lt!320221)))))))

(assert (=> d!69815 (= lt!320221 e!140306)))

(assert (=> d!69815 (= c!10150 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!69815 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!69815 (= (appendBitsLSBFirstLoopTR!0 (_2!9404 lt!319530) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!320221)))

(declare-fun b!204994 () Bool)

(declare-fun res!171805 () Bool)

(assert (=> b!204994 (=> (not res!171805) (not e!140305))))

(declare-fun lt!320257 () (_ BitVec 64))

(declare-fun lt!320254 () (_ BitVec 64))

(assert (=> b!204994 (= res!171805 (= (bitIndex!0 (size!4549 (buf!5054 (_2!9404 lt!320221))) (currentByte!9539 (_2!9404 lt!320221)) (currentBit!9534 (_2!9404 lt!320221))) (bvsub lt!320257 lt!320254)))))

(assert (=> b!204994 (or (= (bvand lt!320257 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!320254 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!320257 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!320257 lt!320254) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!204994 (= lt!320254 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!320214 () (_ BitVec 64))

(declare-fun lt!320209 () (_ BitVec 64))

(assert (=> b!204994 (= lt!320257 (bvadd lt!320214 lt!320209))))

(assert (=> b!204994 (or (not (= (bvand lt!320214 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!320209 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!320214 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!320214 lt!320209) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!204994 (= lt!320209 ((_ sign_extend 32) nBits!348))))

(assert (=> b!204994 (= lt!320214 (bitIndex!0 (size!4549 (buf!5054 (_2!9404 lt!319530))) (currentByte!9539 (_2!9404 lt!319530)) (currentBit!9534 (_2!9404 lt!319530))))))

(declare-fun b!204995 () Bool)

(declare-fun res!171807 () Bool)

(assert (=> b!204995 (=> (not res!171807) (not e!140305))))

(assert (=> b!204995 (= res!171807 (isPrefixOf!0 (_2!9404 lt!319530) (_2!9404 lt!320221)))))

(declare-fun b!204996 () Bool)

(assert (=> b!204996 (= e!140303 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (= (and d!69815 c!10150) b!204985))

(assert (= (and d!69815 (not c!10150)) b!204990))

(assert (= (and b!204990 res!171803) b!204982))

(assert (= (and b!204982 res!171804) b!204992))

(assert (= (and b!204992 res!171811) b!204984))

(assert (= (and b!204984 res!171812) b!204981))

(assert (= (and b!204990 res!171809) b!204983))

(assert (= (and b!204990 c!10151) b!204996))

(assert (= (and b!204990 (not c!10151)) b!204986))

(assert (= (and b!204990 res!171801) b!204991))

(assert (= (or b!204985 b!204992) bm!3240))

(assert (= (and d!69815 res!171810) b!204993))

(assert (= (and b!204993 res!171802) b!204994))

(assert (= (and b!204994 res!171805) b!204995))

(assert (= (and b!204995 res!171807) b!204989))

(assert (= (and b!204989 res!171808) b!204988))

(assert (= (and b!204989 res!171806) b!204987))

(declare-fun m!316119 () Bool)

(assert (=> b!204990 m!316119))

(declare-fun m!316121 () Bool)

(assert (=> b!204990 m!316121))

(declare-fun m!316123 () Bool)

(assert (=> b!204990 m!316123))

(declare-fun m!316125 () Bool)

(assert (=> b!204990 m!316125))

(declare-fun m!316127 () Bool)

(assert (=> b!204990 m!316127))

(declare-fun m!316129 () Bool)

(assert (=> b!204990 m!316129))

(declare-fun m!316131 () Bool)

(assert (=> b!204990 m!316131))

(declare-fun m!316133 () Bool)

(assert (=> b!204990 m!316133))

(declare-fun m!316135 () Bool)

(assert (=> b!204990 m!316135))

(declare-fun m!316137 () Bool)

(assert (=> b!204990 m!316137))

(assert (=> b!204990 m!315725))

(declare-fun m!316139 () Bool)

(assert (=> b!204990 m!316139))

(declare-fun m!316141 () Bool)

(assert (=> b!204990 m!316141))

(declare-fun m!316143 () Bool)

(assert (=> b!204990 m!316143))

(declare-fun m!316145 () Bool)

(assert (=> b!204990 m!316145))

(declare-fun m!316147 () Bool)

(assert (=> b!204990 m!316147))

(declare-fun m!316149 () Bool)

(assert (=> b!204990 m!316149))

(declare-fun m!316151 () Bool)

(assert (=> b!204990 m!316151))

(declare-fun m!316153 () Bool)

(assert (=> b!204990 m!316153))

(declare-fun m!316155 () Bool)

(assert (=> b!204990 m!316155))

(declare-fun m!316157 () Bool)

(assert (=> b!204990 m!316157))

(declare-fun m!316159 () Bool)

(assert (=> b!204990 m!316159))

(declare-fun m!316161 () Bool)

(assert (=> b!204990 m!316161))

(declare-fun m!316163 () Bool)

(assert (=> b!204990 m!316163))

(declare-fun m!316165 () Bool)

(assert (=> b!204990 m!316165))

(declare-fun m!316167 () Bool)

(assert (=> b!204990 m!316167))

(declare-fun m!316169 () Bool)

(assert (=> b!204990 m!316169))

(declare-fun m!316171 () Bool)

(assert (=> b!204990 m!316171))

(declare-fun m!316173 () Bool)

(assert (=> b!204990 m!316173))

(declare-fun m!316175 () Bool)

(assert (=> b!204990 m!316175))

(declare-fun m!316177 () Bool)

(assert (=> b!204990 m!316177))

(declare-fun m!316179 () Bool)

(assert (=> b!204990 m!316179))

(declare-fun m!316181 () Bool)

(assert (=> b!204990 m!316181))

(assert (=> b!204990 m!316171))

(declare-fun m!316183 () Bool)

(assert (=> b!204990 m!316183))

(declare-fun m!316185 () Bool)

(assert (=> bm!3240 m!316185))

(declare-fun m!316187 () Bool)

(assert (=> b!204981 m!316187))

(declare-fun m!316189 () Bool)

(assert (=> b!204981 m!316189))

(assert (=> b!204982 m!316189))

(assert (=> b!204982 m!315725))

(declare-fun m!316191 () Bool)

(assert (=> d!69815 m!316191))

(declare-fun m!316193 () Bool)

(assert (=> b!204994 m!316193))

(assert (=> b!204994 m!315725))

(declare-fun m!316195 () Bool)

(assert (=> b!204989 m!316195))

(declare-fun m!316197 () Bool)

(assert (=> b!204989 m!316197))

(declare-fun m!316199 () Bool)

(assert (=> b!204989 m!316199))

(assert (=> b!204989 m!316151))

(assert (=> b!204989 m!316155))

(declare-fun m!316201 () Bool)

(assert (=> b!204989 m!316201))

(declare-fun m!316203 () Bool)

(assert (=> b!204985 m!316203))

(declare-fun m!316205 () Bool)

(assert (=> b!204988 m!316205))

(declare-fun m!316207 () Bool)

(assert (=> b!204995 m!316207))

(declare-fun m!316209 () Bool)

(assert (=> b!204984 m!316209))

(assert (=> b!204984 m!316209))

(declare-fun m!316211 () Bool)

(assert (=> b!204984 m!316211))

(assert (=> b!204614 d!69815))

(declare-fun d!69859 () Bool)

(assert (=> d!69859 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!4549 (buf!5054 (_2!9404 lt!319530)))) ((_ sign_extend 32) (currentByte!9539 thiss!1204)) ((_ sign_extend 32) (currentBit!9534 thiss!1204))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4549 (buf!5054 (_2!9404 lt!319530)))) ((_ sign_extend 32) (currentByte!9539 thiss!1204)) ((_ sign_extend 32) (currentBit!9534 thiss!1204))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!17189 () Bool)

(assert (= bs!17189 d!69859))

(declare-fun m!316213 () Bool)

(assert (=> bs!17189 m!316213))

(assert (=> b!204624 d!69859))

(push 1)

(assert (not b!204982))

(assert (not b!204783))

(assert (not b!204995))

(assert (not b!204782))

(assert (not d!69815))

(assert (not d!69797))

(assert (not d!69813))

(assert (not d!69809))

(assert (not b!204994))

(assert (not b!204796))

(assert (not b!204989))

(assert (not d!69781))

(assert (not b!204781))

(assert (not bm!3240))

(assert (not b!204798))

(assert (not d!69859))

(assert (not b!204804))

(assert (not b!204984))

(assert (not b!204990))

(assert (not b!204988))

(assert (not d!69791))

(assert (not b!204793))

(assert (not d!69765))

(assert (not b!204795))

(assert (not b!204981))

(assert (not b!204784))

(assert (not b!204985))

(assert (not b!204801))

(assert (not d!69805))

(assert (not d!69799))

(assert (not d!69787))

(assert (not b!204806))

(assert (not d!69777))

(check-sat)

(pop 1)

(push 1)

(check-sat)

