; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43346 () Bool)

(assert start!43346)

(declare-fun b!204660 () Bool)

(declare-fun e!140124 () Bool)

(declare-fun e!140118 () Bool)

(assert (=> b!204660 (= e!140124 e!140118)))

(declare-fun res!171527 () Bool)

(assert (=> b!204660 (=> (not res!171527) (not e!140118))))

(declare-datatypes ((array!10348 0))(
  ( (array!10349 (arr!5480 (Array (_ BitVec 32) (_ BitVec 8))) (size!4550 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8208 0))(
  ( (BitStream!8209 (buf!5055 array!10348) (currentByte!9540 (_ BitVec 32)) (currentBit!9535 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!17508 0))(
  ( (tuple2!17509 (_1!9406 BitStream!8208) (_2!9406 Bool)) )
))
(declare-fun lt!319566 () tuple2!17508)

(declare-fun lt!319565 () Bool)

(declare-datatypes ((Unit!14591 0))(
  ( (Unit!14592) )
))
(declare-datatypes ((tuple2!17510 0))(
  ( (tuple2!17511 (_1!9407 Unit!14591) (_2!9407 BitStream!8208)) )
))
(declare-fun lt!319568 () tuple2!17510)

(assert (=> b!204660 (= res!171527 (and (= (_2!9406 lt!319566) lt!319565) (= (_1!9406 lt!319566) (_2!9407 lt!319568))))))

(declare-fun thiss!1204 () BitStream!8208)

(declare-fun readBitPure!0 (BitStream!8208) tuple2!17508)

(declare-fun readerFrom!0 (BitStream!8208 (_ BitVec 32) (_ BitVec 32)) BitStream!8208)

(assert (=> b!204660 (= lt!319566 (readBitPure!0 (readerFrom!0 (_2!9407 lt!319568) (currentBit!9535 thiss!1204) (currentByte!9540 thiss!1204))))))

(declare-fun b!204661 () Bool)

(declare-fun e!140122 () Bool)

(assert (=> b!204661 (= e!140122 e!140124)))

(declare-fun res!171525 () Bool)

(assert (=> b!204661 (=> (not res!171525) (not e!140124))))

(declare-fun lt!319561 () (_ BitVec 64))

(declare-fun lt!319563 () (_ BitVec 64))

(assert (=> b!204661 (= res!171525 (= lt!319561 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!319563)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!204661 (= lt!319561 (bitIndex!0 (size!4550 (buf!5055 (_2!9407 lt!319568))) (currentByte!9540 (_2!9407 lt!319568)) (currentBit!9535 (_2!9407 lt!319568))))))

(assert (=> b!204661 (= lt!319563 (bitIndex!0 (size!4550 (buf!5055 thiss!1204)) (currentByte!9540 thiss!1204) (currentBit!9535 thiss!1204)))))

(declare-fun b!204662 () Bool)

(declare-fun res!171520 () Bool)

(declare-fun e!140119 () Bool)

(assert (=> b!204662 (=> (not res!171520) (not e!140119))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!204662 (= res!171520 (not (= i!590 nBits!348)))))

(declare-fun b!204663 () Bool)

(declare-fun e!140120 () Bool)

(declare-fun array_inv!4291 (array!10348) Bool)

(assert (=> b!204663 (= e!140120 (array_inv!4291 (buf!5055 thiss!1204)))))

(declare-fun b!204664 () Bool)

(declare-fun e!140121 () Bool)

(assert (=> b!204664 (= e!140119 (not e!140121))))

(declare-fun res!171523 () Bool)

(assert (=> b!204664 (=> res!171523 e!140121)))

(declare-fun lt!319560 () (_ BitVec 64))

(declare-fun lt!319562 () (_ BitVec 64))

(assert (=> b!204664 (= res!171523 (not (= lt!319560 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!319562))))))

(assert (=> b!204664 (= lt!319560 (bitIndex!0 (size!4550 (buf!5055 (_2!9407 lt!319568))) (currentByte!9540 (_2!9407 lt!319568)) (currentBit!9535 (_2!9407 lt!319568))))))

(assert (=> b!204664 (= lt!319562 (bitIndex!0 (size!4550 (buf!5055 thiss!1204)) (currentByte!9540 thiss!1204) (currentBit!9535 thiss!1204)))))

(assert (=> b!204664 e!140122))

(declare-fun res!171522 () Bool)

(assert (=> b!204664 (=> (not res!171522) (not e!140122))))

(assert (=> b!204664 (= res!171522 (= (size!4550 (buf!5055 thiss!1204)) (size!4550 (buf!5055 (_2!9407 lt!319568)))))))

(declare-fun appendBit!0 (BitStream!8208 Bool) tuple2!17510)

(assert (=> b!204664 (= lt!319568 (appendBit!0 thiss!1204 lt!319565))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!204664 (= lt!319565 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!204665 () Bool)

(declare-fun res!171519 () Bool)

(declare-fun e!140123 () Bool)

(assert (=> b!204665 (=> res!171519 e!140123)))

(declare-fun lt!319567 () tuple2!17510)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!204665 (= res!171519 (not (invariant!0 (currentBit!9535 (_2!9407 lt!319567)) (currentByte!9540 (_2!9407 lt!319567)) (size!4550 (buf!5055 (_2!9407 lt!319567))))))))

(declare-fun b!204666 () Bool)

(declare-fun res!171524 () Bool)

(assert (=> b!204666 (=> res!171524 e!140123)))

(declare-fun isPrefixOf!0 (BitStream!8208 BitStream!8208) Bool)

(assert (=> b!204666 (= res!171524 (not (isPrefixOf!0 (_2!9407 lt!319568) (_2!9407 lt!319567))))))

(declare-fun res!171521 () Bool)

(assert (=> start!43346 (=> (not res!171521) (not e!140119))))

(assert (=> start!43346 (= res!171521 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43346 e!140119))

(assert (=> start!43346 true))

(declare-fun inv!12 (BitStream!8208) Bool)

(assert (=> start!43346 (and (inv!12 thiss!1204) e!140120)))

(declare-fun b!204667 () Bool)

(declare-fun e!140117 () Bool)

(assert (=> b!204667 (= e!140123 e!140117)))

(declare-fun res!171526 () Bool)

(assert (=> b!204667 (=> res!171526 e!140117)))

(assert (=> b!204667 (= res!171526 (not (= (size!4550 (buf!5055 (_2!9407 lt!319568))) (size!4550 (buf!5055 (_2!9407 lt!319567))))))))

(assert (=> b!204667 (invariant!0 (currentBit!9535 thiss!1204) (currentByte!9540 thiss!1204) (size!4550 (buf!5055 (_2!9407 lt!319568))))))

(declare-fun b!204668 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!204668 (= e!140117 (validate_offset_bit!0 ((_ sign_extend 32) (size!4550 (buf!5055 (_2!9407 lt!319568)))) ((_ sign_extend 32) (currentByte!9540 thiss!1204)) ((_ sign_extend 32) (currentBit!9535 thiss!1204))))))

(declare-fun b!204669 () Bool)

(assert (=> b!204669 (= e!140118 (= (bitIndex!0 (size!4550 (buf!5055 (_1!9406 lt!319566))) (currentByte!9540 (_1!9406 lt!319566)) (currentBit!9535 (_1!9406 lt!319566))) lt!319561))))

(declare-fun b!204670 () Bool)

(declare-fun res!171529 () Bool)

(assert (=> b!204670 (=> res!171529 e!140123)))

(declare-fun lt!319559 () (_ BitVec 64))

(assert (=> b!204670 (= res!171529 (or (not (= (size!4550 (buf!5055 (_2!9407 lt!319567))) (size!4550 (buf!5055 thiss!1204)))) (not (= lt!319559 (bvsub (bvadd lt!319562 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!204671 () Bool)

(declare-fun res!171528 () Bool)

(assert (=> b!204671 (=> (not res!171528) (not e!140119))))

(assert (=> b!204671 (= res!171528 (invariant!0 (currentBit!9535 thiss!1204) (currentByte!9540 thiss!1204) (size!4550 (buf!5055 thiss!1204))))))

(declare-fun b!204672 () Bool)

(assert (=> b!204672 (= e!140121 e!140123)))

(declare-fun res!171530 () Bool)

(assert (=> b!204672 (=> res!171530 e!140123)))

(assert (=> b!204672 (= res!171530 (not (= lt!319559 (bvsub (bvsub (bvadd lt!319560 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!204672 (= lt!319559 (bitIndex!0 (size!4550 (buf!5055 (_2!9407 lt!319567))) (currentByte!9540 (_2!9407 lt!319567)) (currentBit!9535 (_2!9407 lt!319567))))))

(assert (=> b!204672 (isPrefixOf!0 thiss!1204 (_2!9407 lt!319567))))

(declare-fun lt!319564 () Unit!14591)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8208 BitStream!8208 BitStream!8208) Unit!14591)

(assert (=> b!204672 (= lt!319564 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9407 lt!319568) (_2!9407 lt!319567)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8208 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17510)

(assert (=> b!204672 (= lt!319567 (appendBitsLSBFirstLoopTR!0 (_2!9407 lt!319568) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!204673 () Bool)

(declare-fun res!171517 () Bool)

(assert (=> b!204673 (=> (not res!171517) (not e!140119))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!204673 (= res!171517 (validate_offset_bits!1 ((_ sign_extend 32) (size!4550 (buf!5055 thiss!1204))) ((_ sign_extend 32) (currentByte!9540 thiss!1204)) ((_ sign_extend 32) (currentBit!9535 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!204674 () Bool)

(declare-fun res!171518 () Bool)

(assert (=> b!204674 (=> res!171518 e!140123)))

(assert (=> b!204674 (= res!171518 (not (isPrefixOf!0 thiss!1204 (_2!9407 lt!319568))))))

(declare-fun b!204675 () Bool)

(declare-fun res!171516 () Bool)

(assert (=> b!204675 (=> (not res!171516) (not e!140124))))

(assert (=> b!204675 (= res!171516 (isPrefixOf!0 thiss!1204 (_2!9407 lt!319568)))))

(assert (= (and start!43346 res!171521) b!204673))

(assert (= (and b!204673 res!171517) b!204671))

(assert (= (and b!204671 res!171528) b!204662))

(assert (= (and b!204662 res!171520) b!204664))

(assert (= (and b!204664 res!171522) b!204661))

(assert (= (and b!204661 res!171525) b!204675))

(assert (= (and b!204675 res!171516) b!204660))

(assert (= (and b!204660 res!171527) b!204669))

(assert (= (and b!204664 (not res!171523)) b!204672))

(assert (= (and b!204672 (not res!171530)) b!204665))

(assert (= (and b!204665 (not res!171519)) b!204670))

(assert (= (and b!204670 (not res!171529)) b!204666))

(assert (= (and b!204666 (not res!171524)) b!204674))

(assert (= (and b!204674 (not res!171518)) b!204667))

(assert (= (and b!204667 (not res!171526)) b!204668))

(assert (= start!43346 b!204663))

(declare-fun m!315743 () Bool)

(assert (=> start!43346 m!315743))

(declare-fun m!315745 () Bool)

(assert (=> b!204664 m!315745))

(declare-fun m!315747 () Bool)

(assert (=> b!204664 m!315747))

(declare-fun m!315749 () Bool)

(assert (=> b!204664 m!315749))

(declare-fun m!315751 () Bool)

(assert (=> b!204668 m!315751))

(declare-fun m!315753 () Bool)

(assert (=> b!204660 m!315753))

(assert (=> b!204660 m!315753))

(declare-fun m!315755 () Bool)

(assert (=> b!204660 m!315755))

(declare-fun m!315757 () Bool)

(assert (=> b!204663 m!315757))

(declare-fun m!315759 () Bool)

(assert (=> b!204671 m!315759))

(declare-fun m!315761 () Bool)

(assert (=> b!204672 m!315761))

(declare-fun m!315763 () Bool)

(assert (=> b!204672 m!315763))

(declare-fun m!315765 () Bool)

(assert (=> b!204672 m!315765))

(declare-fun m!315767 () Bool)

(assert (=> b!204672 m!315767))

(declare-fun m!315769 () Bool)

(assert (=> b!204674 m!315769))

(assert (=> b!204675 m!315769))

(declare-fun m!315771 () Bool)

(assert (=> b!204667 m!315771))

(declare-fun m!315773 () Bool)

(assert (=> b!204666 m!315773))

(declare-fun m!315775 () Bool)

(assert (=> b!204673 m!315775))

(declare-fun m!315777 () Bool)

(assert (=> b!204669 m!315777))

(assert (=> b!204661 m!315745))

(assert (=> b!204661 m!315747))

(declare-fun m!315779 () Bool)

(assert (=> b!204665 m!315779))

(check-sat (not b!204669) (not b!204672) (not b!204660) (not b!204664) (not b!204663) (not b!204661) (not b!204665) (not b!204667) (not b!204673) (not start!43346) (not b!204675) (not b!204668) (not b!204666) (not b!204671) (not b!204674))
(check-sat)
(get-model)

(declare-fun d!69747 () Bool)

(declare-fun e!140154 () Bool)

(assert (=> d!69747 e!140154))

(declare-fun res!171581 () Bool)

(assert (=> d!69747 (=> (not res!171581) (not e!140154))))

(declare-fun lt!319614 () (_ BitVec 64))

(declare-fun lt!319616 () (_ BitVec 64))

(declare-fun lt!319613 () (_ BitVec 64))

(assert (=> d!69747 (= res!171581 (= lt!319613 (bvsub lt!319616 lt!319614)))))

(assert (=> d!69747 (or (= (bvand lt!319616 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!319614 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!319616 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!319616 lt!319614) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!69747 (= lt!319614 (remainingBits!0 ((_ sign_extend 32) (size!4550 (buf!5055 (_2!9407 lt!319568)))) ((_ sign_extend 32) (currentByte!9540 (_2!9407 lt!319568))) ((_ sign_extend 32) (currentBit!9535 (_2!9407 lt!319568)))))))

(declare-fun lt!319612 () (_ BitVec 64))

(declare-fun lt!319615 () (_ BitVec 64))

(assert (=> d!69747 (= lt!319616 (bvmul lt!319612 lt!319615))))

(assert (=> d!69747 (or (= lt!319612 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!319615 (bvsdiv (bvmul lt!319612 lt!319615) lt!319612)))))

(assert (=> d!69747 (= lt!319615 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69747 (= lt!319612 ((_ sign_extend 32) (size!4550 (buf!5055 (_2!9407 lt!319568)))))))

(assert (=> d!69747 (= lt!319613 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9540 (_2!9407 lt!319568))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9535 (_2!9407 lt!319568)))))))

(assert (=> d!69747 (invariant!0 (currentBit!9535 (_2!9407 lt!319568)) (currentByte!9540 (_2!9407 lt!319568)) (size!4550 (buf!5055 (_2!9407 lt!319568))))))

(assert (=> d!69747 (= (bitIndex!0 (size!4550 (buf!5055 (_2!9407 lt!319568))) (currentByte!9540 (_2!9407 lt!319568)) (currentBit!9535 (_2!9407 lt!319568))) lt!319613)))

(declare-fun b!204728 () Bool)

(declare-fun res!171580 () Bool)

(assert (=> b!204728 (=> (not res!171580) (not e!140154))))

(assert (=> b!204728 (= res!171580 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!319613))))

(declare-fun b!204729 () Bool)

(declare-fun lt!319611 () (_ BitVec 64))

(assert (=> b!204729 (= e!140154 (bvsle lt!319613 (bvmul lt!319611 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!204729 (or (= lt!319611 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!319611 #b0000000000000000000000000000000000000000000000000000000000001000) lt!319611)))))

(assert (=> b!204729 (= lt!319611 ((_ sign_extend 32) (size!4550 (buf!5055 (_2!9407 lt!319568)))))))

(assert (= (and d!69747 res!171581) b!204728))

(assert (= (and b!204728 res!171580) b!204729))

(declare-fun m!315819 () Bool)

(assert (=> d!69747 m!315819))

(declare-fun m!315821 () Bool)

(assert (=> d!69747 m!315821))

(assert (=> b!204661 d!69747))

(declare-fun d!69749 () Bool)

(declare-fun e!140155 () Bool)

(assert (=> d!69749 e!140155))

(declare-fun res!171583 () Bool)

(assert (=> d!69749 (=> (not res!171583) (not e!140155))))

(declare-fun lt!319620 () (_ BitVec 64))

(declare-fun lt!319622 () (_ BitVec 64))

(declare-fun lt!319619 () (_ BitVec 64))

(assert (=> d!69749 (= res!171583 (= lt!319619 (bvsub lt!319622 lt!319620)))))

(assert (=> d!69749 (or (= (bvand lt!319622 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!319620 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!319622 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!319622 lt!319620) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69749 (= lt!319620 (remainingBits!0 ((_ sign_extend 32) (size!4550 (buf!5055 thiss!1204))) ((_ sign_extend 32) (currentByte!9540 thiss!1204)) ((_ sign_extend 32) (currentBit!9535 thiss!1204))))))

(declare-fun lt!319618 () (_ BitVec 64))

(declare-fun lt!319621 () (_ BitVec 64))

(assert (=> d!69749 (= lt!319622 (bvmul lt!319618 lt!319621))))

(assert (=> d!69749 (or (= lt!319618 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!319621 (bvsdiv (bvmul lt!319618 lt!319621) lt!319618)))))

(assert (=> d!69749 (= lt!319621 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69749 (= lt!319618 ((_ sign_extend 32) (size!4550 (buf!5055 thiss!1204))))))

(assert (=> d!69749 (= lt!319619 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9540 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9535 thiss!1204))))))

(assert (=> d!69749 (invariant!0 (currentBit!9535 thiss!1204) (currentByte!9540 thiss!1204) (size!4550 (buf!5055 thiss!1204)))))

(assert (=> d!69749 (= (bitIndex!0 (size!4550 (buf!5055 thiss!1204)) (currentByte!9540 thiss!1204) (currentBit!9535 thiss!1204)) lt!319619)))

(declare-fun b!204730 () Bool)

(declare-fun res!171582 () Bool)

(assert (=> b!204730 (=> (not res!171582) (not e!140155))))

(assert (=> b!204730 (= res!171582 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!319619))))

(declare-fun b!204731 () Bool)

(declare-fun lt!319617 () (_ BitVec 64))

(assert (=> b!204731 (= e!140155 (bvsle lt!319619 (bvmul lt!319617 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!204731 (or (= lt!319617 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!319617 #b0000000000000000000000000000000000000000000000000000000000001000) lt!319617)))))

(assert (=> b!204731 (= lt!319617 ((_ sign_extend 32) (size!4550 (buf!5055 thiss!1204))))))

(assert (= (and d!69749 res!171583) b!204730))

(assert (= (and b!204730 res!171582) b!204731))

(declare-fun m!315823 () Bool)

(assert (=> d!69749 m!315823))

(assert (=> d!69749 m!315759))

(assert (=> b!204661 d!69749))

(declare-fun d!69751 () Bool)

(declare-fun e!140156 () Bool)

(assert (=> d!69751 e!140156))

(declare-fun res!171585 () Bool)

(assert (=> d!69751 (=> (not res!171585) (not e!140156))))

(declare-fun lt!319626 () (_ BitVec 64))

(declare-fun lt!319625 () (_ BitVec 64))

(declare-fun lt!319628 () (_ BitVec 64))

(assert (=> d!69751 (= res!171585 (= lt!319625 (bvsub lt!319628 lt!319626)))))

(assert (=> d!69751 (or (= (bvand lt!319628 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!319626 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!319628 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!319628 lt!319626) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69751 (= lt!319626 (remainingBits!0 ((_ sign_extend 32) (size!4550 (buf!5055 (_2!9407 lt!319567)))) ((_ sign_extend 32) (currentByte!9540 (_2!9407 lt!319567))) ((_ sign_extend 32) (currentBit!9535 (_2!9407 lt!319567)))))))

(declare-fun lt!319624 () (_ BitVec 64))

(declare-fun lt!319627 () (_ BitVec 64))

(assert (=> d!69751 (= lt!319628 (bvmul lt!319624 lt!319627))))

(assert (=> d!69751 (or (= lt!319624 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!319627 (bvsdiv (bvmul lt!319624 lt!319627) lt!319624)))))

(assert (=> d!69751 (= lt!319627 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69751 (= lt!319624 ((_ sign_extend 32) (size!4550 (buf!5055 (_2!9407 lt!319567)))))))

(assert (=> d!69751 (= lt!319625 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9540 (_2!9407 lt!319567))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9535 (_2!9407 lt!319567)))))))

(assert (=> d!69751 (invariant!0 (currentBit!9535 (_2!9407 lt!319567)) (currentByte!9540 (_2!9407 lt!319567)) (size!4550 (buf!5055 (_2!9407 lt!319567))))))

(assert (=> d!69751 (= (bitIndex!0 (size!4550 (buf!5055 (_2!9407 lt!319567))) (currentByte!9540 (_2!9407 lt!319567)) (currentBit!9535 (_2!9407 lt!319567))) lt!319625)))

(declare-fun b!204732 () Bool)

(declare-fun res!171584 () Bool)

(assert (=> b!204732 (=> (not res!171584) (not e!140156))))

(assert (=> b!204732 (= res!171584 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!319625))))

(declare-fun b!204733 () Bool)

(declare-fun lt!319623 () (_ BitVec 64))

(assert (=> b!204733 (= e!140156 (bvsle lt!319625 (bvmul lt!319623 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!204733 (or (= lt!319623 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!319623 #b0000000000000000000000000000000000000000000000000000000000001000) lt!319623)))))

(assert (=> b!204733 (= lt!319623 ((_ sign_extend 32) (size!4550 (buf!5055 (_2!9407 lt!319567)))))))

(assert (= (and d!69751 res!171585) b!204732))

(assert (= (and b!204732 res!171584) b!204733))

(declare-fun m!315825 () Bool)

(assert (=> d!69751 m!315825))

(assert (=> d!69751 m!315779))

(assert (=> b!204672 d!69751))

(declare-fun d!69753 () Bool)

(declare-fun res!171592 () Bool)

(declare-fun e!140162 () Bool)

(assert (=> d!69753 (=> (not res!171592) (not e!140162))))

(assert (=> d!69753 (= res!171592 (= (size!4550 (buf!5055 thiss!1204)) (size!4550 (buf!5055 (_2!9407 lt!319567)))))))

(assert (=> d!69753 (= (isPrefixOf!0 thiss!1204 (_2!9407 lt!319567)) e!140162)))

(declare-fun b!204740 () Bool)

(declare-fun res!171594 () Bool)

(assert (=> b!204740 (=> (not res!171594) (not e!140162))))

(assert (=> b!204740 (= res!171594 (bvsle (bitIndex!0 (size!4550 (buf!5055 thiss!1204)) (currentByte!9540 thiss!1204) (currentBit!9535 thiss!1204)) (bitIndex!0 (size!4550 (buf!5055 (_2!9407 lt!319567))) (currentByte!9540 (_2!9407 lt!319567)) (currentBit!9535 (_2!9407 lt!319567)))))))

(declare-fun b!204741 () Bool)

(declare-fun e!140161 () Bool)

(assert (=> b!204741 (= e!140162 e!140161)))

(declare-fun res!171593 () Bool)

(assert (=> b!204741 (=> res!171593 e!140161)))

(assert (=> b!204741 (= res!171593 (= (size!4550 (buf!5055 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!204742 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10348 array!10348 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!204742 (= e!140161 (arrayBitRangesEq!0 (buf!5055 thiss!1204) (buf!5055 (_2!9407 lt!319567)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4550 (buf!5055 thiss!1204)) (currentByte!9540 thiss!1204) (currentBit!9535 thiss!1204))))))

(assert (= (and d!69753 res!171592) b!204740))

(assert (= (and b!204740 res!171594) b!204741))

(assert (= (and b!204741 (not res!171593)) b!204742))

(assert (=> b!204740 m!315747))

(assert (=> b!204740 m!315761))

(assert (=> b!204742 m!315747))

(assert (=> b!204742 m!315747))

(declare-fun m!315827 () Bool)

(assert (=> b!204742 m!315827))

(assert (=> b!204672 d!69753))

(declare-fun d!69755 () Bool)

(assert (=> d!69755 (isPrefixOf!0 thiss!1204 (_2!9407 lt!319567))))

(declare-fun lt!319631 () Unit!14591)

(declare-fun choose!30 (BitStream!8208 BitStream!8208 BitStream!8208) Unit!14591)

(assert (=> d!69755 (= lt!319631 (choose!30 thiss!1204 (_2!9407 lt!319568) (_2!9407 lt!319567)))))

(assert (=> d!69755 (isPrefixOf!0 thiss!1204 (_2!9407 lt!319568))))

(assert (=> d!69755 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9407 lt!319568) (_2!9407 lt!319567)) lt!319631)))

(declare-fun bs!17175 () Bool)

(assert (= bs!17175 d!69755))

(assert (=> bs!17175 m!315763))

(declare-fun m!315829 () Bool)

(assert (=> bs!17175 m!315829))

(assert (=> bs!17175 m!315769))

(assert (=> b!204672 d!69755))

(declare-fun b!204839 () Bool)

(declare-fun e!140221 () Bool)

(declare-datatypes ((tuple2!17516 0))(
  ( (tuple2!17517 (_1!9410 BitStream!8208) (_2!9410 (_ BitVec 64))) )
))
(declare-fun lt!319855 () tuple2!17516)

(declare-datatypes ((tuple2!17518 0))(
  ( (tuple2!17519 (_1!9411 BitStream!8208) (_2!9411 BitStream!8208)) )
))
(declare-fun lt!319873 () tuple2!17518)

(assert (=> b!204839 (= e!140221 (= (_1!9410 lt!319855) (_2!9411 lt!319873)))))

(declare-fun b!204840 () Bool)

(declare-fun res!171688 () Bool)

(declare-fun call!3237 () Bool)

(assert (=> b!204840 (= res!171688 call!3237)))

(declare-fun e!140223 () Bool)

(assert (=> b!204840 (=> (not res!171688) (not e!140223))))

(declare-fun b!204841 () Bool)

(declare-fun res!171692 () Bool)

(declare-fun e!140227 () Bool)

(assert (=> b!204841 (=> (not res!171692) (not e!140227))))

(declare-fun lt!319823 () tuple2!17510)

(assert (=> b!204841 (= res!171692 (isPrefixOf!0 (_2!9407 lt!319568) (_2!9407 lt!319823)))))

(declare-fun b!204842 () Bool)

(declare-fun e!140222 () (_ BitVec 64))

(assert (=> b!204842 (= e!140222 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!204843 () Bool)

(declare-fun e!140225 () Bool)

(declare-fun lt!319847 () tuple2!17508)

(declare-fun lt!319851 () tuple2!17510)

(assert (=> b!204843 (= e!140225 (= (bitIndex!0 (size!4550 (buf!5055 (_1!9406 lt!319847))) (currentByte!9540 (_1!9406 lt!319847)) (currentBit!9535 (_1!9406 lt!319847))) (bitIndex!0 (size!4550 (buf!5055 (_2!9407 lt!319851))) (currentByte!9540 (_2!9407 lt!319851)) (currentBit!9535 (_2!9407 lt!319851)))))))

(declare-fun b!204844 () Bool)

(assert (=> b!204844 (= lt!319847 (readBitPure!0 (readerFrom!0 (_2!9407 lt!319851) (currentBit!9535 (_2!9407 lt!319568)) (currentByte!9540 (_2!9407 lt!319568)))))))

(declare-fun res!171684 () Bool)

(declare-fun lt!319835 () Bool)

(assert (=> b!204844 (= res!171684 (and (= (_2!9406 lt!319847) lt!319835) (= (_1!9406 lt!319847) (_2!9407 lt!319851))))))

(assert (=> b!204844 (=> (not res!171684) (not e!140225))))

(assert (=> b!204844 (= e!140223 e!140225)))

(declare-fun b!204845 () Bool)

(declare-fun res!171686 () Bool)

(assert (=> b!204845 (= res!171686 (= (bitIndex!0 (size!4550 (buf!5055 (_2!9407 lt!319851))) (currentByte!9540 (_2!9407 lt!319851)) (currentBit!9535 (_2!9407 lt!319851))) (bvadd (bitIndex!0 (size!4550 (buf!5055 (_2!9407 lt!319568))) (currentByte!9540 (_2!9407 lt!319568)) (currentBit!9535 (_2!9407 lt!319568))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!204845 (=> (not res!171686) (not e!140223))))

(declare-fun b!204846 () Bool)

(declare-fun res!171690 () Bool)

(assert (=> b!204846 (=> (not res!171690) (not e!140227))))

(assert (=> b!204846 (= res!171690 (= (size!4550 (buf!5055 (_2!9407 lt!319568))) (size!4550 (buf!5055 (_2!9407 lt!319823)))))))

(declare-fun b!204847 () Bool)

(declare-fun e!140220 () Bool)

(declare-fun lt!319863 () tuple2!17508)

(declare-fun lt!319848 () tuple2!17508)

(assert (=> b!204847 (= e!140220 (= (_2!9406 lt!319863) (_2!9406 lt!319848)))))

(declare-fun b!204848 () Bool)

(declare-fun e!140226 () tuple2!17510)

(declare-fun lt!319860 () tuple2!17510)

(assert (=> b!204848 (= e!140226 (tuple2!17511 (_1!9407 lt!319860) (_2!9407 lt!319860)))))

(assert (=> b!204848 (= lt!319835 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!204848 (= lt!319851 (appendBit!0 (_2!9407 lt!319568) lt!319835))))

(declare-fun res!171691 () Bool)

(assert (=> b!204848 (= res!171691 (= (size!4550 (buf!5055 (_2!9407 lt!319568))) (size!4550 (buf!5055 (_2!9407 lt!319851)))))))

(assert (=> b!204848 (=> (not res!171691) (not e!140223))))

(assert (=> b!204848 e!140223))

(declare-fun lt!319839 () tuple2!17510)

(assert (=> b!204848 (= lt!319839 lt!319851)))

(assert (=> b!204848 (= lt!319860 (appendBitsLSBFirstLoopTR!0 (_2!9407 lt!319839) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!319838 () Unit!14591)

(assert (=> b!204848 (= lt!319838 (lemmaIsPrefixTransitive!0 (_2!9407 lt!319568) (_2!9407 lt!319839) (_2!9407 lt!319860)))))

(assert (=> b!204848 (isPrefixOf!0 (_2!9407 lt!319568) (_2!9407 lt!319860))))

(declare-fun lt!319822 () Unit!14591)

(assert (=> b!204848 (= lt!319822 lt!319838)))

(assert (=> b!204848 (invariant!0 (currentBit!9535 (_2!9407 lt!319568)) (currentByte!9540 (_2!9407 lt!319568)) (size!4550 (buf!5055 (_2!9407 lt!319839))))))

(declare-fun lt!319869 () BitStream!8208)

(assert (=> b!204848 (= lt!319869 (BitStream!8209 (buf!5055 (_2!9407 lt!319839)) (currentByte!9540 (_2!9407 lt!319568)) (currentBit!9535 (_2!9407 lt!319568))))))

(assert (=> b!204848 (invariant!0 (currentBit!9535 lt!319869) (currentByte!9540 lt!319869) (size!4550 (buf!5055 (_2!9407 lt!319860))))))

(declare-fun lt!319828 () BitStream!8208)

(assert (=> b!204848 (= lt!319828 (BitStream!8209 (buf!5055 (_2!9407 lt!319860)) (currentByte!9540 lt!319869) (currentBit!9535 lt!319869)))))

(assert (=> b!204848 (= lt!319863 (readBitPure!0 lt!319869))))

(assert (=> b!204848 (= lt!319848 (readBitPure!0 lt!319828))))

(declare-fun lt!319862 () Unit!14591)

(declare-fun readBitPrefixLemma!0 (BitStream!8208 BitStream!8208) Unit!14591)

(assert (=> b!204848 (= lt!319862 (readBitPrefixLemma!0 lt!319869 (_2!9407 lt!319860)))))

(declare-fun res!171685 () Bool)

(assert (=> b!204848 (= res!171685 (= (bitIndex!0 (size!4550 (buf!5055 (_1!9406 lt!319863))) (currentByte!9540 (_1!9406 lt!319863)) (currentBit!9535 (_1!9406 lt!319863))) (bitIndex!0 (size!4550 (buf!5055 (_1!9406 lt!319848))) (currentByte!9540 (_1!9406 lt!319848)) (currentBit!9535 (_1!9406 lt!319848)))))))

(assert (=> b!204848 (=> (not res!171685) (not e!140220))))

(assert (=> b!204848 e!140220))

(declare-fun lt!319832 () Unit!14591)

(assert (=> b!204848 (= lt!319832 lt!319862)))

(declare-fun lt!319843 () tuple2!17518)

(declare-fun reader!0 (BitStream!8208 BitStream!8208) tuple2!17518)

(assert (=> b!204848 (= lt!319843 (reader!0 (_2!9407 lt!319568) (_2!9407 lt!319860)))))

(declare-fun lt!319824 () tuple2!17518)

(assert (=> b!204848 (= lt!319824 (reader!0 (_2!9407 lt!319839) (_2!9407 lt!319860)))))

(declare-fun lt!319821 () tuple2!17508)

(assert (=> b!204848 (= lt!319821 (readBitPure!0 (_1!9411 lt!319843)))))

(assert (=> b!204848 (= (_2!9406 lt!319821) lt!319835)))

(declare-fun lt!319856 () Unit!14591)

(declare-fun Unit!14595 () Unit!14591)

(assert (=> b!204848 (= lt!319856 Unit!14595)))

(declare-fun lt!319841 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!204848 (= lt!319841 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!319874 () (_ BitVec 64))

(assert (=> b!204848 (= lt!319874 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!319866 () Unit!14591)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8208 array!10348 (_ BitVec 64)) Unit!14591)

(assert (=> b!204848 (= lt!319866 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9407 lt!319568) (buf!5055 (_2!9407 lt!319860)) lt!319874))))

(assert (=> b!204848 (validate_offset_bits!1 ((_ sign_extend 32) (size!4550 (buf!5055 (_2!9407 lt!319860)))) ((_ sign_extend 32) (currentByte!9540 (_2!9407 lt!319568))) ((_ sign_extend 32) (currentBit!9535 (_2!9407 lt!319568))) lt!319874)))

(declare-fun lt!319834 () Unit!14591)

(assert (=> b!204848 (= lt!319834 lt!319866)))

(declare-fun lt!319859 () tuple2!17516)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8208 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17516)

(assert (=> b!204848 (= lt!319859 (readNBitsLSBFirstsLoopPure!0 (_1!9411 lt!319843) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!319841))))

(declare-fun lt!319865 () (_ BitVec 64))

(assert (=> b!204848 (= lt!319865 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!319864 () Unit!14591)

(assert (=> b!204848 (= lt!319864 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9407 lt!319839) (buf!5055 (_2!9407 lt!319860)) lt!319865))))

(assert (=> b!204848 (validate_offset_bits!1 ((_ sign_extend 32) (size!4550 (buf!5055 (_2!9407 lt!319860)))) ((_ sign_extend 32) (currentByte!9540 (_2!9407 lt!319839))) ((_ sign_extend 32) (currentBit!9535 (_2!9407 lt!319839))) lt!319865)))

(declare-fun lt!319829 () Unit!14591)

(assert (=> b!204848 (= lt!319829 lt!319864)))

(declare-fun lt!319850 () tuple2!17516)

(assert (=> b!204848 (= lt!319850 (readNBitsLSBFirstsLoopPure!0 (_1!9411 lt!319824) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!319841 (ite (_2!9406 lt!319821) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!319846 () tuple2!17516)

(assert (=> b!204848 (= lt!319846 (readNBitsLSBFirstsLoopPure!0 (_1!9411 lt!319843) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!319841))))

(declare-fun c!10139 () Bool)

(assert (=> b!204848 (= c!10139 (_2!9406 (readBitPure!0 (_1!9411 lt!319843))))))

(declare-fun lt!319845 () tuple2!17516)

(declare-fun withMovedBitIndex!0 (BitStream!8208 (_ BitVec 64)) BitStream!8208)

(assert (=> b!204848 (= lt!319845 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9411 lt!319843) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!319841 e!140222)))))

(declare-fun lt!319857 () Unit!14591)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8208 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14591)

(assert (=> b!204848 (= lt!319857 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9411 lt!319843) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!319841))))

(assert (=> b!204848 (and (= (_2!9410 lt!319846) (_2!9410 lt!319845)) (= (_1!9410 lt!319846) (_1!9410 lt!319845)))))

(declare-fun lt!319854 () Unit!14591)

(assert (=> b!204848 (= lt!319854 lt!319857)))

(assert (=> b!204848 (= (_1!9411 lt!319843) (withMovedBitIndex!0 (_2!9411 lt!319843) (bvsub (bitIndex!0 (size!4550 (buf!5055 (_2!9407 lt!319568))) (currentByte!9540 (_2!9407 lt!319568)) (currentBit!9535 (_2!9407 lt!319568))) (bitIndex!0 (size!4550 (buf!5055 (_2!9407 lt!319860))) (currentByte!9540 (_2!9407 lt!319860)) (currentBit!9535 (_2!9407 lt!319860))))))))

(declare-fun lt!319825 () Unit!14591)

(declare-fun Unit!14596 () Unit!14591)

(assert (=> b!204848 (= lt!319825 Unit!14596)))

(assert (=> b!204848 (= (_1!9411 lt!319824) (withMovedBitIndex!0 (_2!9411 lt!319824) (bvsub (bitIndex!0 (size!4550 (buf!5055 (_2!9407 lt!319839))) (currentByte!9540 (_2!9407 lt!319839)) (currentBit!9535 (_2!9407 lt!319839))) (bitIndex!0 (size!4550 (buf!5055 (_2!9407 lt!319860))) (currentByte!9540 (_2!9407 lt!319860)) (currentBit!9535 (_2!9407 lt!319860))))))))

(declare-fun lt!319826 () Unit!14591)

(declare-fun Unit!14597 () Unit!14591)

(assert (=> b!204848 (= lt!319826 Unit!14597)))

(assert (=> b!204848 (= (bitIndex!0 (size!4550 (buf!5055 (_2!9407 lt!319568))) (currentByte!9540 (_2!9407 lt!319568)) (currentBit!9535 (_2!9407 lt!319568))) (bvsub (bitIndex!0 (size!4550 (buf!5055 (_2!9407 lt!319839))) (currentByte!9540 (_2!9407 lt!319839)) (currentBit!9535 (_2!9407 lt!319839))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!319819 () Unit!14591)

(declare-fun Unit!14598 () Unit!14591)

(assert (=> b!204848 (= lt!319819 Unit!14598)))

(assert (=> b!204848 (= (_2!9410 lt!319859) (_2!9410 lt!319850))))

(declare-fun lt!319867 () Unit!14591)

(declare-fun Unit!14599 () Unit!14591)

(assert (=> b!204848 (= lt!319867 Unit!14599)))

(assert (=> b!204848 (invariant!0 (currentBit!9535 (_2!9407 lt!319860)) (currentByte!9540 (_2!9407 lt!319860)) (size!4550 (buf!5055 (_2!9407 lt!319860))))))

(declare-fun lt!319827 () Unit!14591)

(declare-fun Unit!14600 () Unit!14591)

(assert (=> b!204848 (= lt!319827 Unit!14600)))

(assert (=> b!204848 (= (size!4550 (buf!5055 (_2!9407 lt!319568))) (size!4550 (buf!5055 (_2!9407 lt!319860))))))

(declare-fun lt!319871 () Unit!14591)

(declare-fun Unit!14601 () Unit!14591)

(assert (=> b!204848 (= lt!319871 Unit!14601)))

(assert (=> b!204848 (= (bitIndex!0 (size!4550 (buf!5055 (_2!9407 lt!319860))) (currentByte!9540 (_2!9407 lt!319860)) (currentBit!9535 (_2!9407 lt!319860))) (bvsub (bvadd (bitIndex!0 (size!4550 (buf!5055 (_2!9407 lt!319568))) (currentByte!9540 (_2!9407 lt!319568)) (currentBit!9535 (_2!9407 lt!319568))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!319852 () Unit!14591)

(declare-fun Unit!14602 () Unit!14591)

(assert (=> b!204848 (= lt!319852 Unit!14602)))

(declare-fun lt!319872 () Unit!14591)

(declare-fun Unit!14603 () Unit!14591)

(assert (=> b!204848 (= lt!319872 Unit!14603)))

(assert (=> b!204848 (= lt!319873 (reader!0 (_2!9407 lt!319568) (_2!9407 lt!319860)))))

(declare-fun lt!319820 () (_ BitVec 64))

(assert (=> b!204848 (= lt!319820 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!319830 () Unit!14591)

(assert (=> b!204848 (= lt!319830 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9407 lt!319568) (buf!5055 (_2!9407 lt!319860)) lt!319820))))

(assert (=> b!204848 (validate_offset_bits!1 ((_ sign_extend 32) (size!4550 (buf!5055 (_2!9407 lt!319860)))) ((_ sign_extend 32) (currentByte!9540 (_2!9407 lt!319568))) ((_ sign_extend 32) (currentBit!9535 (_2!9407 lt!319568))) lt!319820)))

(declare-fun lt!319836 () Unit!14591)

(assert (=> b!204848 (= lt!319836 lt!319830)))

(assert (=> b!204848 (= lt!319855 (readNBitsLSBFirstsLoopPure!0 (_1!9411 lt!319873) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!171694 () Bool)

(assert (=> b!204848 (= res!171694 (= (_2!9410 lt!319855) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!204848 (=> (not res!171694) (not e!140221))))

(assert (=> b!204848 e!140221))

(declare-fun lt!319840 () Unit!14591)

(declare-fun Unit!14604 () Unit!14591)

(assert (=> b!204848 (= lt!319840 Unit!14604)))

(declare-fun bm!3234 () Bool)

(declare-fun c!10138 () Bool)

(assert (=> bm!3234 (= call!3237 (isPrefixOf!0 (_2!9407 lt!319568) (ite c!10138 (_2!9407 lt!319568) (_2!9407 lt!319851))))))

(declare-fun b!204850 () Bool)

(declare-fun res!171683 () Bool)

(assert (=> b!204850 (=> (not res!171683) (not e!140227))))

(declare-fun lt!319844 () (_ BitVec 64))

(declare-fun lt!319831 () (_ BitVec 64))

(assert (=> b!204850 (= res!171683 (= (bitIndex!0 (size!4550 (buf!5055 (_2!9407 lt!319823))) (currentByte!9540 (_2!9407 lt!319823)) (currentBit!9535 (_2!9407 lt!319823))) (bvsub lt!319844 lt!319831)))))

(assert (=> b!204850 (or (= (bvand lt!319844 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!319831 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!319844 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!319844 lt!319831) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!204850 (= lt!319831 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!319849 () (_ BitVec 64))

(declare-fun lt!319842 () (_ BitVec 64))

(assert (=> b!204850 (= lt!319844 (bvadd lt!319849 lt!319842))))

(assert (=> b!204850 (or (not (= (bvand lt!319849 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!319842 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!319849 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!319849 lt!319842) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!204850 (= lt!319842 ((_ sign_extend 32) nBits!348))))

(assert (=> b!204850 (= lt!319849 (bitIndex!0 (size!4550 (buf!5055 (_2!9407 lt!319568))) (currentByte!9540 (_2!9407 lt!319568)) (currentBit!9535 (_2!9407 lt!319568))))))

(declare-fun b!204851 () Bool)

(declare-fun e!140224 () Bool)

(assert (=> b!204851 (= e!140227 e!140224)))

(declare-fun res!171693 () Bool)

(assert (=> b!204851 (=> (not res!171693) (not e!140224))))

(declare-fun lt!319858 () tuple2!17516)

(assert (=> b!204851 (= res!171693 (= (_2!9410 lt!319858) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!319870 () tuple2!17518)

(assert (=> b!204851 (= lt!319858 (readNBitsLSBFirstsLoopPure!0 (_1!9411 lt!319870) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!319861 () Unit!14591)

(declare-fun lt!319868 () Unit!14591)

(assert (=> b!204851 (= lt!319861 lt!319868)))

(declare-fun lt!319833 () (_ BitVec 64))

(assert (=> b!204851 (validate_offset_bits!1 ((_ sign_extend 32) (size!4550 (buf!5055 (_2!9407 lt!319823)))) ((_ sign_extend 32) (currentByte!9540 (_2!9407 lt!319568))) ((_ sign_extend 32) (currentBit!9535 (_2!9407 lt!319568))) lt!319833)))

(assert (=> b!204851 (= lt!319868 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9407 lt!319568) (buf!5055 (_2!9407 lt!319823)) lt!319833))))

(declare-fun e!140219 () Bool)

(assert (=> b!204851 e!140219))

(declare-fun res!171689 () Bool)

(assert (=> b!204851 (=> (not res!171689) (not e!140219))))

(assert (=> b!204851 (= res!171689 (and (= (size!4550 (buf!5055 (_2!9407 lt!319568))) (size!4550 (buf!5055 (_2!9407 lt!319823)))) (bvsge lt!319833 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!204851 (= lt!319833 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!204851 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!204851 (= lt!319870 (reader!0 (_2!9407 lt!319568) (_2!9407 lt!319823)))))

(declare-fun b!204852 () Bool)

(assert (=> b!204852 (= e!140219 (validate_offset_bits!1 ((_ sign_extend 32) (size!4550 (buf!5055 (_2!9407 lt!319568)))) ((_ sign_extend 32) (currentByte!9540 (_2!9407 lt!319568))) ((_ sign_extend 32) (currentBit!9535 (_2!9407 lt!319568))) lt!319833))))

(declare-fun b!204853 () Bool)

(assert (=> b!204853 (= e!140222 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!204854 () Bool)

(declare-fun Unit!14605 () Unit!14591)

(assert (=> b!204854 (= e!140226 (tuple2!17511 Unit!14605 (_2!9407 lt!319568)))))

(declare-fun lt!319853 () Unit!14591)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8208) Unit!14591)

(assert (=> b!204854 (= lt!319853 (lemmaIsPrefixRefl!0 (_2!9407 lt!319568)))))

(assert (=> b!204854 call!3237))

(declare-fun lt!319837 () Unit!14591)

(assert (=> b!204854 (= lt!319837 lt!319853)))

(declare-fun b!204849 () Bool)

(assert (=> b!204849 (= e!140224 (= (_1!9410 lt!319858) (_2!9411 lt!319870)))))

(declare-fun d!69757 () Bool)

(assert (=> d!69757 e!140227))

(declare-fun res!171687 () Bool)

(assert (=> d!69757 (=> (not res!171687) (not e!140227))))

(assert (=> d!69757 (= res!171687 (invariant!0 (currentBit!9535 (_2!9407 lt!319823)) (currentByte!9540 (_2!9407 lt!319823)) (size!4550 (buf!5055 (_2!9407 lt!319823)))))))

(assert (=> d!69757 (= lt!319823 e!140226)))

(assert (=> d!69757 (= c!10138 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!69757 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!69757 (= (appendBitsLSBFirstLoopTR!0 (_2!9407 lt!319568) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!319823)))

(assert (= (and d!69757 c!10138) b!204854))

(assert (= (and d!69757 (not c!10138)) b!204848))

(assert (= (and b!204848 res!171691) b!204845))

(assert (= (and b!204845 res!171686) b!204840))

(assert (= (and b!204840 res!171688) b!204844))

(assert (= (and b!204844 res!171684) b!204843))

(assert (= (and b!204848 res!171685) b!204847))

(assert (= (and b!204848 c!10139) b!204853))

(assert (= (and b!204848 (not c!10139)) b!204842))

(assert (= (and b!204848 res!171694) b!204839))

(assert (= (or b!204854 b!204840) bm!3234))

(assert (= (and d!69757 res!171687) b!204846))

(assert (= (and b!204846 res!171690) b!204850))

(assert (= (and b!204850 res!171683) b!204841))

(assert (= (and b!204841 res!171692) b!204851))

(assert (= (and b!204851 res!171689) b!204852))

(assert (= (and b!204851 res!171693) b!204849))

(declare-fun m!315879 () Bool)

(assert (=> b!204841 m!315879))

(declare-fun m!315881 () Bool)

(assert (=> b!204843 m!315881))

(declare-fun m!315883 () Bool)

(assert (=> b!204843 m!315883))

(declare-fun m!315885 () Bool)

(assert (=> bm!3234 m!315885))

(declare-fun m!315887 () Bool)

(assert (=> b!204854 m!315887))

(assert (=> b!204845 m!315883))

(assert (=> b!204845 m!315745))

(declare-fun m!315889 () Bool)

(assert (=> b!204852 m!315889))

(declare-fun m!315891 () Bool)

(assert (=> b!204844 m!315891))

(assert (=> b!204844 m!315891))

(declare-fun m!315893 () Bool)

(assert (=> b!204844 m!315893))

(declare-fun m!315895 () Bool)

(assert (=> b!204851 m!315895))

(declare-fun m!315897 () Bool)

(assert (=> b!204851 m!315897))

(declare-fun m!315899 () Bool)

(assert (=> b!204851 m!315899))

(declare-fun m!315901 () Bool)

(assert (=> b!204851 m!315901))

(declare-fun m!315903 () Bool)

(assert (=> b!204851 m!315903))

(declare-fun m!315905 () Bool)

(assert (=> b!204851 m!315905))

(declare-fun m!315907 () Bool)

(assert (=> d!69757 m!315907))

(declare-fun m!315909 () Bool)

(assert (=> b!204850 m!315909))

(assert (=> b!204850 m!315745))

(declare-fun m!315911 () Bool)

(assert (=> b!204848 m!315911))

(declare-fun m!315913 () Bool)

(assert (=> b!204848 m!315913))

(declare-fun m!315915 () Bool)

(assert (=> b!204848 m!315915))

(assert (=> b!204848 m!315895))

(declare-fun m!315917 () Bool)

(assert (=> b!204848 m!315917))

(declare-fun m!315919 () Bool)

(assert (=> b!204848 m!315919))

(declare-fun m!315921 () Bool)

(assert (=> b!204848 m!315921))

(declare-fun m!315923 () Bool)

(assert (=> b!204848 m!315923))

(declare-fun m!315925 () Bool)

(assert (=> b!204848 m!315925))

(declare-fun m!315927 () Bool)

(assert (=> b!204848 m!315927))

(declare-fun m!315929 () Bool)

(assert (=> b!204848 m!315929))

(declare-fun m!315931 () Bool)

(assert (=> b!204848 m!315931))

(declare-fun m!315933 () Bool)

(assert (=> b!204848 m!315933))

(declare-fun m!315935 () Bool)

(assert (=> b!204848 m!315935))

(assert (=> b!204848 m!315903))

(declare-fun m!315937 () Bool)

(assert (=> b!204848 m!315937))

(declare-fun m!315939 () Bool)

(assert (=> b!204848 m!315939))

(declare-fun m!315941 () Bool)

(assert (=> b!204848 m!315941))

(declare-fun m!315943 () Bool)

(assert (=> b!204848 m!315943))

(declare-fun m!315945 () Bool)

(assert (=> b!204848 m!315945))

(declare-fun m!315947 () Bool)

(assert (=> b!204848 m!315947))

(declare-fun m!315949 () Bool)

(assert (=> b!204848 m!315949))

(declare-fun m!315951 () Bool)

(assert (=> b!204848 m!315951))

(declare-fun m!315953 () Bool)

(assert (=> b!204848 m!315953))

(declare-fun m!315955 () Bool)

(assert (=> b!204848 m!315955))

(declare-fun m!315957 () Bool)

(assert (=> b!204848 m!315957))

(declare-fun m!315959 () Bool)

(assert (=> b!204848 m!315959))

(declare-fun m!315961 () Bool)

(assert (=> b!204848 m!315961))

(assert (=> b!204848 m!315933))

(declare-fun m!315963 () Bool)

(assert (=> b!204848 m!315963))

(declare-fun m!315965 () Bool)

(assert (=> b!204848 m!315965))

(declare-fun m!315967 () Bool)

(assert (=> b!204848 m!315967))

(declare-fun m!315969 () Bool)

(assert (=> b!204848 m!315969))

(declare-fun m!315971 () Bool)

(assert (=> b!204848 m!315971))

(assert (=> b!204848 m!315745))

(assert (=> b!204672 d!69757))

(declare-fun d!69817 () Bool)

(assert (=> d!69817 (= (invariant!0 (currentBit!9535 thiss!1204) (currentByte!9540 thiss!1204) (size!4550 (buf!5055 thiss!1204))) (and (bvsge (currentBit!9535 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9535 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9540 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9540 thiss!1204) (size!4550 (buf!5055 thiss!1204))) (and (= (currentBit!9535 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9540 thiss!1204) (size!4550 (buf!5055 thiss!1204)))))))))

(assert (=> b!204671 d!69817))

(declare-fun d!69819 () Bool)

(assert (=> d!69819 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4550 (buf!5055 thiss!1204))) ((_ sign_extend 32) (currentByte!9540 thiss!1204)) ((_ sign_extend 32) (currentBit!9535 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4550 (buf!5055 thiss!1204))) ((_ sign_extend 32) (currentByte!9540 thiss!1204)) ((_ sign_extend 32) (currentBit!9535 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!17183 () Bool)

(assert (= bs!17183 d!69819))

(assert (=> bs!17183 m!315823))

(assert (=> b!204673 d!69819))

(declare-fun d!69821 () Bool)

(declare-fun e!140228 () Bool)

(assert (=> d!69821 e!140228))

(declare-fun res!171696 () Bool)

(assert (=> d!69821 (=> (not res!171696) (not e!140228))))

(declare-fun lt!319878 () (_ BitVec 64))

(declare-fun lt!319880 () (_ BitVec 64))

(declare-fun lt!319877 () (_ BitVec 64))

(assert (=> d!69821 (= res!171696 (= lt!319877 (bvsub lt!319880 lt!319878)))))

(assert (=> d!69821 (or (= (bvand lt!319880 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!319878 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!319880 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!319880 lt!319878) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69821 (= lt!319878 (remainingBits!0 ((_ sign_extend 32) (size!4550 (buf!5055 (_1!9406 lt!319566)))) ((_ sign_extend 32) (currentByte!9540 (_1!9406 lt!319566))) ((_ sign_extend 32) (currentBit!9535 (_1!9406 lt!319566)))))))

(declare-fun lt!319876 () (_ BitVec 64))

(declare-fun lt!319879 () (_ BitVec 64))

(assert (=> d!69821 (= lt!319880 (bvmul lt!319876 lt!319879))))

(assert (=> d!69821 (or (= lt!319876 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!319879 (bvsdiv (bvmul lt!319876 lt!319879) lt!319876)))))

(assert (=> d!69821 (= lt!319879 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69821 (= lt!319876 ((_ sign_extend 32) (size!4550 (buf!5055 (_1!9406 lt!319566)))))))

(assert (=> d!69821 (= lt!319877 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9540 (_1!9406 lt!319566))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9535 (_1!9406 lt!319566)))))))

(assert (=> d!69821 (invariant!0 (currentBit!9535 (_1!9406 lt!319566)) (currentByte!9540 (_1!9406 lt!319566)) (size!4550 (buf!5055 (_1!9406 lt!319566))))))

(assert (=> d!69821 (= (bitIndex!0 (size!4550 (buf!5055 (_1!9406 lt!319566))) (currentByte!9540 (_1!9406 lt!319566)) (currentBit!9535 (_1!9406 lt!319566))) lt!319877)))

(declare-fun b!204855 () Bool)

(declare-fun res!171695 () Bool)

(assert (=> b!204855 (=> (not res!171695) (not e!140228))))

(assert (=> b!204855 (= res!171695 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!319877))))

(declare-fun b!204856 () Bool)

(declare-fun lt!319875 () (_ BitVec 64))

(assert (=> b!204856 (= e!140228 (bvsle lt!319877 (bvmul lt!319875 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!204856 (or (= lt!319875 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!319875 #b0000000000000000000000000000000000000000000000000000000000001000) lt!319875)))))

(assert (=> b!204856 (= lt!319875 ((_ sign_extend 32) (size!4550 (buf!5055 (_1!9406 lt!319566)))))))

(assert (= (and d!69821 res!171696) b!204855))

(assert (= (and b!204855 res!171695) b!204856))

(declare-fun m!315973 () Bool)

(assert (=> d!69821 m!315973))

(declare-fun m!315975 () Bool)

(assert (=> d!69821 m!315975))

(assert (=> b!204669 d!69821))

(declare-fun d!69823 () Bool)

(declare-datatypes ((tuple2!17520 0))(
  ( (tuple2!17521 (_1!9412 Bool) (_2!9412 BitStream!8208)) )
))
(declare-fun lt!319883 () tuple2!17520)

(declare-fun readBit!0 (BitStream!8208) tuple2!17520)

(assert (=> d!69823 (= lt!319883 (readBit!0 (readerFrom!0 (_2!9407 lt!319568) (currentBit!9535 thiss!1204) (currentByte!9540 thiss!1204))))))

(assert (=> d!69823 (= (readBitPure!0 (readerFrom!0 (_2!9407 lt!319568) (currentBit!9535 thiss!1204) (currentByte!9540 thiss!1204))) (tuple2!17509 (_2!9412 lt!319883) (_1!9412 lt!319883)))))

(declare-fun bs!17184 () Bool)

(assert (= bs!17184 d!69823))

(assert (=> bs!17184 m!315753))

(declare-fun m!315977 () Bool)

(assert (=> bs!17184 m!315977))

(assert (=> b!204660 d!69823))

(declare-fun d!69825 () Bool)

(declare-fun e!140233 () Bool)

(assert (=> d!69825 e!140233))

(declare-fun res!171700 () Bool)

(assert (=> d!69825 (=> (not res!171700) (not e!140233))))

(assert (=> d!69825 (= res!171700 (invariant!0 (currentBit!9535 (_2!9407 lt!319568)) (currentByte!9540 (_2!9407 lt!319568)) (size!4550 (buf!5055 (_2!9407 lt!319568)))))))

(assert (=> d!69825 (= (readerFrom!0 (_2!9407 lt!319568) (currentBit!9535 thiss!1204) (currentByte!9540 thiss!1204)) (BitStream!8209 (buf!5055 (_2!9407 lt!319568)) (currentByte!9540 thiss!1204) (currentBit!9535 thiss!1204)))))

(declare-fun b!204863 () Bool)

(assert (=> b!204863 (= e!140233 (invariant!0 (currentBit!9535 thiss!1204) (currentByte!9540 thiss!1204) (size!4550 (buf!5055 (_2!9407 lt!319568)))))))

(assert (= (and d!69825 res!171700) b!204863))

(assert (=> d!69825 m!315821))

(assert (=> b!204863 m!315771))

(assert (=> b!204660 d!69825))

(declare-fun d!69827 () Bool)

(declare-fun res!171701 () Bool)

(declare-fun e!140235 () Bool)

(assert (=> d!69827 (=> (not res!171701) (not e!140235))))

(assert (=> d!69827 (= res!171701 (= (size!4550 (buf!5055 (_2!9407 lt!319568))) (size!4550 (buf!5055 (_2!9407 lt!319567)))))))

(assert (=> d!69827 (= (isPrefixOf!0 (_2!9407 lt!319568) (_2!9407 lt!319567)) e!140235)))

(declare-fun b!204864 () Bool)

(declare-fun res!171703 () Bool)

(assert (=> b!204864 (=> (not res!171703) (not e!140235))))

(assert (=> b!204864 (= res!171703 (bvsle (bitIndex!0 (size!4550 (buf!5055 (_2!9407 lt!319568))) (currentByte!9540 (_2!9407 lt!319568)) (currentBit!9535 (_2!9407 lt!319568))) (bitIndex!0 (size!4550 (buf!5055 (_2!9407 lt!319567))) (currentByte!9540 (_2!9407 lt!319567)) (currentBit!9535 (_2!9407 lt!319567)))))))

(declare-fun b!204865 () Bool)

(declare-fun e!140234 () Bool)

(assert (=> b!204865 (= e!140235 e!140234)))

(declare-fun res!171702 () Bool)

(assert (=> b!204865 (=> res!171702 e!140234)))

(assert (=> b!204865 (= res!171702 (= (size!4550 (buf!5055 (_2!9407 lt!319568))) #b00000000000000000000000000000000))))

(declare-fun b!204866 () Bool)

(assert (=> b!204866 (= e!140234 (arrayBitRangesEq!0 (buf!5055 (_2!9407 lt!319568)) (buf!5055 (_2!9407 lt!319567)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4550 (buf!5055 (_2!9407 lt!319568))) (currentByte!9540 (_2!9407 lt!319568)) (currentBit!9535 (_2!9407 lt!319568)))))))

(assert (= (and d!69827 res!171701) b!204864))

(assert (= (and b!204864 res!171703) b!204865))

(assert (= (and b!204865 (not res!171702)) b!204866))

(assert (=> b!204864 m!315745))

(assert (=> b!204864 m!315761))

(assert (=> b!204866 m!315745))

(assert (=> b!204866 m!315745))

(declare-fun m!315979 () Bool)

(assert (=> b!204866 m!315979))

(assert (=> b!204666 d!69827))

(declare-fun d!69829 () Bool)

(assert (=> d!69829 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!4550 (buf!5055 (_2!9407 lt!319568)))) ((_ sign_extend 32) (currentByte!9540 thiss!1204)) ((_ sign_extend 32) (currentBit!9535 thiss!1204))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4550 (buf!5055 (_2!9407 lt!319568)))) ((_ sign_extend 32) (currentByte!9540 thiss!1204)) ((_ sign_extend 32) (currentBit!9535 thiss!1204))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!17185 () Bool)

(assert (= bs!17185 d!69829))

(declare-fun m!315981 () Bool)

(assert (=> bs!17185 m!315981))

(assert (=> b!204668 d!69829))

(declare-fun d!69831 () Bool)

(assert (=> d!69831 (= (invariant!0 (currentBit!9535 thiss!1204) (currentByte!9540 thiss!1204) (size!4550 (buf!5055 (_2!9407 lt!319568)))) (and (bvsge (currentBit!9535 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9535 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9540 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9540 thiss!1204) (size!4550 (buf!5055 (_2!9407 lt!319568)))) (and (= (currentBit!9535 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9540 thiss!1204) (size!4550 (buf!5055 (_2!9407 lt!319568))))))))))

(assert (=> b!204667 d!69831))

(declare-fun d!69833 () Bool)

(assert (=> d!69833 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9535 thiss!1204) (currentByte!9540 thiss!1204) (size!4550 (buf!5055 thiss!1204))))))

(declare-fun bs!17186 () Bool)

(assert (= bs!17186 d!69833))

(assert (=> bs!17186 m!315759))

(assert (=> start!43346 d!69833))

(assert (=> b!204664 d!69747))

(assert (=> b!204664 d!69749))

(declare-fun b!204907 () Bool)

(declare-fun e!140256 () Bool)

(declare-fun lt!320005 () tuple2!17508)

(declare-fun lt!320007 () tuple2!17510)

(assert (=> b!204907 (= e!140256 (= (bitIndex!0 (size!4550 (buf!5055 (_1!9406 lt!320005))) (currentByte!9540 (_1!9406 lt!320005)) (currentBit!9535 (_1!9406 lt!320005))) (bitIndex!0 (size!4550 (buf!5055 (_2!9407 lt!320007))) (currentByte!9540 (_2!9407 lt!320007)) (currentBit!9535 (_2!9407 lt!320007)))))))

(declare-fun d!69835 () Bool)

(declare-fun e!140257 () Bool)

(assert (=> d!69835 e!140257))

(declare-fun res!171737 () Bool)

(assert (=> d!69835 (=> (not res!171737) (not e!140257))))

(assert (=> d!69835 (= res!171737 (= (size!4550 (buf!5055 thiss!1204)) (size!4550 (buf!5055 (_2!9407 lt!320007)))))))

(declare-fun choose!16 (BitStream!8208 Bool) tuple2!17510)

(assert (=> d!69835 (= lt!320007 (choose!16 thiss!1204 lt!319565))))

(assert (=> d!69835 (validate_offset_bit!0 ((_ sign_extend 32) (size!4550 (buf!5055 thiss!1204))) ((_ sign_extend 32) (currentByte!9540 thiss!1204)) ((_ sign_extend 32) (currentBit!9535 thiss!1204)))))

(assert (=> d!69835 (= (appendBit!0 thiss!1204 lt!319565) lt!320007)))

(declare-fun b!204906 () Bool)

(assert (=> b!204906 (= e!140257 e!140256)))

(declare-fun res!171736 () Bool)

(assert (=> b!204906 (=> (not res!171736) (not e!140256))))

(assert (=> b!204906 (= res!171736 (and (= (_2!9406 lt!320005) lt!319565) (= (_1!9406 lt!320005) (_2!9407 lt!320007))))))

(assert (=> b!204906 (= lt!320005 (readBitPure!0 (readerFrom!0 (_2!9407 lt!320007) (currentBit!9535 thiss!1204) (currentByte!9540 thiss!1204))))))

(declare-fun b!204904 () Bool)

(declare-fun res!171739 () Bool)

(assert (=> b!204904 (=> (not res!171739) (not e!140257))))

(declare-fun lt!320004 () (_ BitVec 64))

(declare-fun lt!320006 () (_ BitVec 64))

(assert (=> b!204904 (= res!171739 (= (bitIndex!0 (size!4550 (buf!5055 (_2!9407 lt!320007))) (currentByte!9540 (_2!9407 lt!320007)) (currentBit!9535 (_2!9407 lt!320007))) (bvadd lt!320006 lt!320004)))))

(assert (=> b!204904 (or (not (= (bvand lt!320006 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!320004 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!320006 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!320006 lt!320004) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!204904 (= lt!320004 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!204904 (= lt!320006 (bitIndex!0 (size!4550 (buf!5055 thiss!1204)) (currentByte!9540 thiss!1204) (currentBit!9535 thiss!1204)))))

(declare-fun b!204905 () Bool)

(declare-fun res!171738 () Bool)

(assert (=> b!204905 (=> (not res!171738) (not e!140257))))

(assert (=> b!204905 (= res!171738 (isPrefixOf!0 thiss!1204 (_2!9407 lt!320007)))))

(assert (= (and d!69835 res!171737) b!204904))

(assert (= (and b!204904 res!171739) b!204905))

(assert (= (and b!204905 res!171738) b!204906))

(assert (= (and b!204906 res!171736) b!204907))

(declare-fun m!315983 () Bool)

(assert (=> b!204905 m!315983))

(declare-fun m!315985 () Bool)

(assert (=> d!69835 m!315985))

(declare-fun m!315987 () Bool)

(assert (=> d!69835 m!315987))

(declare-fun m!315989 () Bool)

(assert (=> b!204904 m!315989))

(assert (=> b!204904 m!315747))

(declare-fun m!315991 () Bool)

(assert (=> b!204907 m!315991))

(assert (=> b!204907 m!315989))

(declare-fun m!315993 () Bool)

(assert (=> b!204906 m!315993))

(assert (=> b!204906 m!315993))

(declare-fun m!315995 () Bool)

(assert (=> b!204906 m!315995))

(assert (=> b!204664 d!69835))

(declare-fun d!69837 () Bool)

(assert (=> d!69837 (= (array_inv!4291 (buf!5055 thiss!1204)) (bvsge (size!4550 (buf!5055 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!204663 d!69837))

(declare-fun d!69839 () Bool)

(declare-fun res!171740 () Bool)

(declare-fun e!140259 () Bool)

(assert (=> d!69839 (=> (not res!171740) (not e!140259))))

(assert (=> d!69839 (= res!171740 (= (size!4550 (buf!5055 thiss!1204)) (size!4550 (buf!5055 (_2!9407 lt!319568)))))))

(assert (=> d!69839 (= (isPrefixOf!0 thiss!1204 (_2!9407 lt!319568)) e!140259)))

(declare-fun b!204908 () Bool)

(declare-fun res!171742 () Bool)

(assert (=> b!204908 (=> (not res!171742) (not e!140259))))

(assert (=> b!204908 (= res!171742 (bvsle (bitIndex!0 (size!4550 (buf!5055 thiss!1204)) (currentByte!9540 thiss!1204) (currentBit!9535 thiss!1204)) (bitIndex!0 (size!4550 (buf!5055 (_2!9407 lt!319568))) (currentByte!9540 (_2!9407 lt!319568)) (currentBit!9535 (_2!9407 lt!319568)))))))

(declare-fun b!204909 () Bool)

(declare-fun e!140258 () Bool)

(assert (=> b!204909 (= e!140259 e!140258)))

(declare-fun res!171741 () Bool)

(assert (=> b!204909 (=> res!171741 e!140258)))

(assert (=> b!204909 (= res!171741 (= (size!4550 (buf!5055 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!204910 () Bool)

(assert (=> b!204910 (= e!140258 (arrayBitRangesEq!0 (buf!5055 thiss!1204) (buf!5055 (_2!9407 lt!319568)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4550 (buf!5055 thiss!1204)) (currentByte!9540 thiss!1204) (currentBit!9535 thiss!1204))))))

(assert (= (and d!69839 res!171740) b!204908))

(assert (= (and b!204908 res!171742) b!204909))

(assert (= (and b!204909 (not res!171741)) b!204910))

(assert (=> b!204908 m!315747))

(assert (=> b!204908 m!315745))

(assert (=> b!204910 m!315747))

(assert (=> b!204910 m!315747))

(declare-fun m!315997 () Bool)

(assert (=> b!204910 m!315997))

(assert (=> b!204674 d!69839))

(declare-fun d!69841 () Bool)

(assert (=> d!69841 (= (invariant!0 (currentBit!9535 (_2!9407 lt!319567)) (currentByte!9540 (_2!9407 lt!319567)) (size!4550 (buf!5055 (_2!9407 lt!319567)))) (and (bvsge (currentBit!9535 (_2!9407 lt!319567)) #b00000000000000000000000000000000) (bvslt (currentBit!9535 (_2!9407 lt!319567)) #b00000000000000000000000000001000) (bvsge (currentByte!9540 (_2!9407 lt!319567)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9540 (_2!9407 lt!319567)) (size!4550 (buf!5055 (_2!9407 lt!319567)))) (and (= (currentBit!9535 (_2!9407 lt!319567)) #b00000000000000000000000000000000) (= (currentByte!9540 (_2!9407 lt!319567)) (size!4550 (buf!5055 (_2!9407 lt!319567))))))))))

(assert (=> b!204665 d!69841))

(assert (=> b!204675 d!69839))

(check-sat (not d!69829) (not b!204740) (not b!204843) (not d!69747) (not d!69823) (not b!204851) (not b!204908) (not d!69749) (not bm!3234) (not b!204905) (not b!204850) (not b!204845) (not d!69819) (not d!69755) (not b!204854) (not d!69821) (not d!69757) (not d!69825) (not b!204844) (not b!204742) (not b!204852) (not d!69835) (not d!69833) (not b!204866) (not b!204910) (not b!204906) (not b!204841) (not b!204907) (not d!69751) (not b!204863) (not b!204848) (not b!204864) (not b!204904))
(check-sat)
