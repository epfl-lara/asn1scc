; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38962 () Bool)

(assert start!38962)

(declare-fun b!175543 () Bool)

(declare-fun e!122411 () Bool)

(declare-fun e!122413 () Bool)

(assert (=> b!175543 (= e!122411 e!122413)))

(declare-fun res!145367 () Bool)

(assert (=> b!175543 (=> (not res!145367) (not e!122413))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!270564 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!175543 (= res!145367 (= lt!270564 (bvsub (bvadd lt!270564 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-datatypes ((array!9472 0))(
  ( (array!9473 (arr!5111 (Array (_ BitVec 32) (_ BitVec 8))) (size!4181 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7470 0))(
  ( (BitStream!7471 (buf!4618 array!9472) (currentByte!8741 (_ BitVec 32)) (currentBit!8736 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7470)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175543 (= lt!270564 (bitIndex!0 (size!4181 (buf!4618 thiss!1204)) (currentByte!8741 thiss!1204) (currentBit!8736 thiss!1204)))))

(declare-fun res!145364 () Bool)

(declare-fun e!122409 () Bool)

(assert (=> start!38962 (=> (not res!145364) (not e!122409))))

(assert (=> start!38962 (= res!145364 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!38962 e!122409))

(assert (=> start!38962 true))

(declare-fun e!122412 () Bool)

(declare-fun inv!12 (BitStream!7470) Bool)

(assert (=> start!38962 (and (inv!12 thiss!1204) e!122412)))

(declare-fun b!175544 () Bool)

(declare-fun array_inv!3922 (array!9472) Bool)

(assert (=> b!175544 (= e!122412 (array_inv!3922 (buf!4618 thiss!1204)))))

(declare-fun b!175545 () Bool)

(declare-fun res!145365 () Bool)

(assert (=> b!175545 (=> (not res!145365) (not e!122411))))

(assert (=> b!175545 (= res!145365 (= i!590 nBits!348))))

(declare-fun b!175546 () Bool)

(declare-fun res!145368 () Bool)

(assert (=> b!175546 (=> (not res!145368) (not e!122411))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!175546 (= res!145368 (invariant!0 (currentBit!8736 thiss!1204) (currentByte!8741 thiss!1204) (size!4181 (buf!4618 thiss!1204))))))

(declare-fun b!175547 () Bool)

(declare-datatypes ((tuple2!15108 0))(
  ( (tuple2!15109 (_1!8199 BitStream!7470) (_2!8199 BitStream!7470)) )
))
(declare-fun lt!270562 () tuple2!15108)

(declare-fun lt!270563 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!175547 (= e!122413 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4181 (buf!4618 (_1!8199 lt!270562)))) ((_ sign_extend 32) (currentByte!8741 (_1!8199 lt!270562))) ((_ sign_extend 32) (currentBit!8736 (_1!8199 lt!270562))) lt!270563)))))

(declare-datatypes ((Unit!12670 0))(
  ( (Unit!12671) )
))
(declare-fun lt!270566 () Unit!12670)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7470 array!9472 (_ BitVec 64)) Unit!12670)

(assert (=> b!175547 (= lt!270566 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4618 thiss!1204) lt!270563))))

(declare-fun reader!0 (BitStream!7470 BitStream!7470) tuple2!15108)

(assert (=> b!175547 (= lt!270562 (reader!0 thiss!1204 thiss!1204))))

(declare-fun isPrefixOf!0 (BitStream!7470 BitStream!7470) Bool)

(assert (=> b!175547 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-fun lt!270565 () Unit!12670)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7470) Unit!12670)

(assert (=> b!175547 (= lt!270565 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!175548 () Bool)

(assert (=> b!175548 (= e!122409 e!122411)))

(declare-fun res!145366 () Bool)

(assert (=> b!175548 (=> (not res!145366) (not e!122411))))

(assert (=> b!175548 (= res!145366 (validate_offset_bits!1 ((_ sign_extend 32) (size!4181 (buf!4618 thiss!1204))) ((_ sign_extend 32) (currentByte!8741 thiss!1204)) ((_ sign_extend 32) (currentBit!8736 thiss!1204)) lt!270563))))

(assert (=> b!175548 (= lt!270563 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(assert (= (and start!38962 res!145364) b!175548))

(assert (= (and b!175548 res!145366) b!175546))

(assert (= (and b!175546 res!145368) b!175545))

(assert (= (and b!175545 res!145365) b!175543))

(assert (= (and b!175543 res!145367) b!175547))

(assert (= start!38962 b!175544))

(declare-fun m!275721 () Bool)

(assert (=> b!175547 m!275721))

(declare-fun m!275723 () Bool)

(assert (=> b!175547 m!275723))

(declare-fun m!275725 () Bool)

(assert (=> b!175547 m!275725))

(declare-fun m!275727 () Bool)

(assert (=> b!175547 m!275727))

(declare-fun m!275729 () Bool)

(assert (=> b!175547 m!275729))

(declare-fun m!275731 () Bool)

(assert (=> start!38962 m!275731))

(declare-fun m!275733 () Bool)

(assert (=> b!175544 m!275733))

(declare-fun m!275735 () Bool)

(assert (=> b!175543 m!275735))

(declare-fun m!275737 () Bool)

(assert (=> b!175546 m!275737))

(declare-fun m!275739 () Bool)

(assert (=> b!175548 m!275739))

(check-sat (not b!175546) (not b!175548) (not b!175544) (not b!175547) (not b!175543) (not start!38962))
(check-sat)
(get-model)

(declare-fun d!61923 () Bool)

(declare-fun e!122431 () Bool)

(assert (=> d!61923 e!122431))

(declare-fun res!145388 () Bool)

(assert (=> d!61923 (=> (not res!145388) (not e!122431))))

(declare-fun lt!270597 () (_ BitVec 64))

(declare-fun lt!270598 () (_ BitVec 64))

(declare-fun lt!270595 () (_ BitVec 64))

(assert (=> d!61923 (= res!145388 (= lt!270598 (bvsub lt!270597 lt!270595)))))

(assert (=> d!61923 (or (= (bvand lt!270597 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!270595 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!270597 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!270597 lt!270595) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!61923 (= lt!270595 (remainingBits!0 ((_ sign_extend 32) (size!4181 (buf!4618 thiss!1204))) ((_ sign_extend 32) (currentByte!8741 thiss!1204)) ((_ sign_extend 32) (currentBit!8736 thiss!1204))))))

(declare-fun lt!270596 () (_ BitVec 64))

(declare-fun lt!270599 () (_ BitVec 64))

(assert (=> d!61923 (= lt!270597 (bvmul lt!270596 lt!270599))))

(assert (=> d!61923 (or (= lt!270596 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!270599 (bvsdiv (bvmul lt!270596 lt!270599) lt!270596)))))

(assert (=> d!61923 (= lt!270599 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61923 (= lt!270596 ((_ sign_extend 32) (size!4181 (buf!4618 thiss!1204))))))

(assert (=> d!61923 (= lt!270598 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8741 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8736 thiss!1204))))))

(assert (=> d!61923 (invariant!0 (currentBit!8736 thiss!1204) (currentByte!8741 thiss!1204) (size!4181 (buf!4618 thiss!1204)))))

(assert (=> d!61923 (= (bitIndex!0 (size!4181 (buf!4618 thiss!1204)) (currentByte!8741 thiss!1204) (currentBit!8736 thiss!1204)) lt!270598)))

(declare-fun b!175571 () Bool)

(declare-fun res!145389 () Bool)

(assert (=> b!175571 (=> (not res!145389) (not e!122431))))

(assert (=> b!175571 (= res!145389 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!270598))))

(declare-fun b!175572 () Bool)

(declare-fun lt!270594 () (_ BitVec 64))

(assert (=> b!175572 (= e!122431 (bvsle lt!270598 (bvmul lt!270594 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!175572 (or (= lt!270594 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!270594 #b0000000000000000000000000000000000000000000000000000000000001000) lt!270594)))))

(assert (=> b!175572 (= lt!270594 ((_ sign_extend 32) (size!4181 (buf!4618 thiss!1204))))))

(assert (= (and d!61923 res!145388) b!175571))

(assert (= (and b!175571 res!145389) b!175572))

(declare-fun m!275763 () Bool)

(assert (=> d!61923 m!275763))

(assert (=> d!61923 m!275737))

(assert (=> b!175543 d!61923))

(declare-fun d!61929 () Bool)

(assert (=> d!61929 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4181 (buf!4618 thiss!1204))) ((_ sign_extend 32) (currentByte!8741 thiss!1204)) ((_ sign_extend 32) (currentBit!8736 thiss!1204)) lt!270563) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4181 (buf!4618 thiss!1204))) ((_ sign_extend 32) (currentByte!8741 thiss!1204)) ((_ sign_extend 32) (currentBit!8736 thiss!1204))) lt!270563))))

(declare-fun bs!15450 () Bool)

(assert (= bs!15450 d!61929))

(assert (=> bs!15450 m!275763))

(assert (=> b!175548 d!61929))

(declare-fun b!175593 () Bool)

(declare-fun res!145403 () Bool)

(declare-fun e!122440 () Bool)

(assert (=> b!175593 (=> (not res!145403) (not e!122440))))

(declare-fun lt!270704 () tuple2!15108)

(assert (=> b!175593 (= res!145403 (isPrefixOf!0 (_1!8199 lt!270704) thiss!1204))))

(declare-fun lt!270705 () (_ BitVec 64))

(declare-fun b!175594 () Bool)

(declare-fun lt!270708 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!7470 (_ BitVec 64)) BitStream!7470)

(assert (=> b!175594 (= e!122440 (= (_1!8199 lt!270704) (withMovedBitIndex!0 (_2!8199 lt!270704) (bvsub lt!270708 lt!270705))))))

(assert (=> b!175594 (or (= (bvand lt!270708 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!270705 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!270708 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!270708 lt!270705) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!175594 (= lt!270705 (bitIndex!0 (size!4181 (buf!4618 thiss!1204)) (currentByte!8741 thiss!1204) (currentBit!8736 thiss!1204)))))

(assert (=> b!175594 (= lt!270708 (bitIndex!0 (size!4181 (buf!4618 thiss!1204)) (currentByte!8741 thiss!1204) (currentBit!8736 thiss!1204)))))

(declare-fun b!175596 () Bool)

(declare-fun res!145402 () Bool)

(assert (=> b!175596 (=> (not res!145402) (not e!122440))))

(assert (=> b!175596 (= res!145402 (isPrefixOf!0 (_2!8199 lt!270704) thiss!1204))))

(declare-fun b!175597 () Bool)

(declare-fun e!122441 () Unit!12670)

(declare-fun Unit!12674 () Unit!12670)

(assert (=> b!175597 (= e!122441 Unit!12674)))

(declare-fun b!175595 () Bool)

(declare-fun lt!270692 () Unit!12670)

(assert (=> b!175595 (= e!122441 lt!270692)))

(declare-fun lt!270693 () (_ BitVec 64))

(assert (=> b!175595 (= lt!270693 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!270707 () (_ BitVec 64))

(assert (=> b!175595 (= lt!270707 (bitIndex!0 (size!4181 (buf!4618 thiss!1204)) (currentByte!8741 thiss!1204) (currentBit!8736 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9472 array!9472 (_ BitVec 64) (_ BitVec 64)) Unit!12670)

(assert (=> b!175595 (= lt!270692 (arrayBitRangesEqSymmetric!0 (buf!4618 thiss!1204) (buf!4618 thiss!1204) lt!270693 lt!270707))))

(declare-fun arrayBitRangesEq!0 (array!9472 array!9472 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!175595 (arrayBitRangesEq!0 (buf!4618 thiss!1204) (buf!4618 thiss!1204) lt!270693 lt!270707)))

(declare-fun d!61931 () Bool)

(assert (=> d!61931 e!122440))

(declare-fun res!145404 () Bool)

(assert (=> d!61931 (=> (not res!145404) (not e!122440))))

(assert (=> d!61931 (= res!145404 (isPrefixOf!0 (_1!8199 lt!270704) (_2!8199 lt!270704)))))

(declare-fun lt!270711 () BitStream!7470)

(assert (=> d!61931 (= lt!270704 (tuple2!15109 lt!270711 thiss!1204))))

(declare-fun lt!270702 () Unit!12670)

(declare-fun lt!270694 () Unit!12670)

(assert (=> d!61931 (= lt!270702 lt!270694)))

(assert (=> d!61931 (isPrefixOf!0 lt!270711 thiss!1204)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7470 BitStream!7470 BitStream!7470) Unit!12670)

(assert (=> d!61931 (= lt!270694 (lemmaIsPrefixTransitive!0 lt!270711 thiss!1204 thiss!1204))))

(declare-fun lt!270695 () Unit!12670)

(declare-fun lt!270699 () Unit!12670)

(assert (=> d!61931 (= lt!270695 lt!270699)))

(assert (=> d!61931 (isPrefixOf!0 lt!270711 thiss!1204)))

(assert (=> d!61931 (= lt!270699 (lemmaIsPrefixTransitive!0 lt!270711 thiss!1204 thiss!1204))))

(declare-fun lt!270698 () Unit!12670)

(assert (=> d!61931 (= lt!270698 e!122441)))

(declare-fun c!9227 () Bool)

(assert (=> d!61931 (= c!9227 (not (= (size!4181 (buf!4618 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!270700 () Unit!12670)

(declare-fun lt!270710 () Unit!12670)

(assert (=> d!61931 (= lt!270700 lt!270710)))

(assert (=> d!61931 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!61931 (= lt!270710 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun lt!270703 () Unit!12670)

(declare-fun lt!270709 () Unit!12670)

(assert (=> d!61931 (= lt!270703 lt!270709)))

(assert (=> d!61931 (= lt!270709 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun lt!270701 () Unit!12670)

(declare-fun lt!270696 () Unit!12670)

(assert (=> d!61931 (= lt!270701 lt!270696)))

(assert (=> d!61931 (isPrefixOf!0 lt!270711 lt!270711)))

(assert (=> d!61931 (= lt!270696 (lemmaIsPrefixRefl!0 lt!270711))))

(declare-fun lt!270706 () Unit!12670)

(declare-fun lt!270697 () Unit!12670)

(assert (=> d!61931 (= lt!270706 lt!270697)))

(assert (=> d!61931 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!61931 (= lt!270697 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!61931 (= lt!270711 (BitStream!7471 (buf!4618 thiss!1204) (currentByte!8741 thiss!1204) (currentBit!8736 thiss!1204)))))

(assert (=> d!61931 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!61931 (= (reader!0 thiss!1204 thiss!1204) lt!270704)))

(assert (= (and d!61931 c!9227) b!175595))

(assert (= (and d!61931 (not c!9227)) b!175597))

(assert (= (and d!61931 res!145404) b!175593))

(assert (= (and b!175593 res!145403) b!175596))

(assert (= (and b!175596 res!145402) b!175594))

(assert (=> b!175595 m!275735))

(declare-fun m!275775 () Bool)

(assert (=> b!175595 m!275775))

(declare-fun m!275777 () Bool)

(assert (=> b!175595 m!275777))

(declare-fun m!275779 () Bool)

(assert (=> b!175594 m!275779))

(assert (=> b!175594 m!275735))

(assert (=> b!175594 m!275735))

(assert (=> d!61931 m!275725))

(assert (=> d!61931 m!275725))

(assert (=> d!61931 m!275721))

(assert (=> d!61931 m!275721))

(declare-fun m!275781 () Bool)

(assert (=> d!61931 m!275781))

(declare-fun m!275783 () Bool)

(assert (=> d!61931 m!275783))

(assert (=> d!61931 m!275783))

(declare-fun m!275785 () Bool)

(assert (=> d!61931 m!275785))

(declare-fun m!275787 () Bool)

(assert (=> d!61931 m!275787))

(assert (=> d!61931 m!275725))

(declare-fun m!275789 () Bool)

(assert (=> d!61931 m!275789))

(declare-fun m!275791 () Bool)

(assert (=> b!175596 m!275791))

(declare-fun m!275793 () Bool)

(assert (=> b!175593 m!275793))

(assert (=> b!175547 d!61931))

(declare-fun d!61945 () Bool)

(declare-fun res!145414 () Bool)

(declare-fun e!122449 () Bool)

(assert (=> d!61945 (=> (not res!145414) (not e!122449))))

(assert (=> d!61945 (= res!145414 (= (size!4181 (buf!4618 thiss!1204)) (size!4181 (buf!4618 thiss!1204))))))

(assert (=> d!61945 (= (isPrefixOf!0 thiss!1204 thiss!1204) e!122449)))

(declare-fun b!175609 () Bool)

(declare-fun res!145416 () Bool)

(assert (=> b!175609 (=> (not res!145416) (not e!122449))))

(assert (=> b!175609 (= res!145416 (bvsle (bitIndex!0 (size!4181 (buf!4618 thiss!1204)) (currentByte!8741 thiss!1204) (currentBit!8736 thiss!1204)) (bitIndex!0 (size!4181 (buf!4618 thiss!1204)) (currentByte!8741 thiss!1204) (currentBit!8736 thiss!1204))))))

(declare-fun b!175610 () Bool)

(declare-fun e!122448 () Bool)

(assert (=> b!175610 (= e!122449 e!122448)))

(declare-fun res!145415 () Bool)

(assert (=> b!175610 (=> res!145415 e!122448)))

(assert (=> b!175610 (= res!145415 (= (size!4181 (buf!4618 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!175611 () Bool)

(assert (=> b!175611 (= e!122448 (arrayBitRangesEq!0 (buf!4618 thiss!1204) (buf!4618 thiss!1204) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4181 (buf!4618 thiss!1204)) (currentByte!8741 thiss!1204) (currentBit!8736 thiss!1204))))))

(assert (= (and d!61945 res!145414) b!175609))

(assert (= (and b!175609 res!145416) b!175610))

(assert (= (and b!175610 (not res!145415)) b!175611))

(assert (=> b!175609 m!275735))

(assert (=> b!175609 m!275735))

(assert (=> b!175611 m!275735))

(assert (=> b!175611 m!275735))

(declare-fun m!275815 () Bool)

(assert (=> b!175611 m!275815))

(assert (=> b!175547 d!61945))

(declare-fun d!61949 () Bool)

(assert (=> d!61949 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4181 (buf!4618 (_1!8199 lt!270562)))) ((_ sign_extend 32) (currentByte!8741 (_1!8199 lt!270562))) ((_ sign_extend 32) (currentBit!8736 (_1!8199 lt!270562))) lt!270563) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4181 (buf!4618 (_1!8199 lt!270562)))) ((_ sign_extend 32) (currentByte!8741 (_1!8199 lt!270562))) ((_ sign_extend 32) (currentBit!8736 (_1!8199 lt!270562)))) lt!270563))))

(declare-fun bs!15457 () Bool)

(assert (= bs!15457 d!61949))

(declare-fun m!275817 () Bool)

(assert (=> bs!15457 m!275817))

(assert (=> b!175547 d!61949))

(declare-fun d!61951 () Bool)

(assert (=> d!61951 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-fun lt!270734 () Unit!12670)

(declare-fun choose!11 (BitStream!7470) Unit!12670)

(assert (=> d!61951 (= lt!270734 (choose!11 thiss!1204))))

(assert (=> d!61951 (= (lemmaIsPrefixRefl!0 thiss!1204) lt!270734)))

(declare-fun bs!15459 () Bool)

(assert (= bs!15459 d!61951))

(assert (=> bs!15459 m!275725))

(declare-fun m!275819 () Bool)

(assert (=> bs!15459 m!275819))

(assert (=> b!175547 d!61951))

(declare-fun d!61953 () Bool)

(assert (=> d!61953 (validate_offset_bits!1 ((_ sign_extend 32) (size!4181 (buf!4618 thiss!1204))) ((_ sign_extend 32) (currentByte!8741 thiss!1204)) ((_ sign_extend 32) (currentBit!8736 thiss!1204)) lt!270563)))

(declare-fun lt!270737 () Unit!12670)

(declare-fun choose!9 (BitStream!7470 array!9472 (_ BitVec 64) BitStream!7470) Unit!12670)

(assert (=> d!61953 (= lt!270737 (choose!9 thiss!1204 (buf!4618 thiss!1204) lt!270563 (BitStream!7471 (buf!4618 thiss!1204) (currentByte!8741 thiss!1204) (currentBit!8736 thiss!1204))))))

(assert (=> d!61953 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4618 thiss!1204) lt!270563) lt!270737)))

(declare-fun bs!15461 () Bool)

(assert (= bs!15461 d!61953))

(assert (=> bs!15461 m!275739))

(declare-fun m!275825 () Bool)

(assert (=> bs!15461 m!275825))

(assert (=> b!175547 d!61953))

(declare-fun d!61959 () Bool)

(assert (=> d!61959 (= (invariant!0 (currentBit!8736 thiss!1204) (currentByte!8741 thiss!1204) (size!4181 (buf!4618 thiss!1204))) (and (bvsge (currentBit!8736 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8736 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8741 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8741 thiss!1204) (size!4181 (buf!4618 thiss!1204))) (and (= (currentBit!8736 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8741 thiss!1204) (size!4181 (buf!4618 thiss!1204)))))))))

(assert (=> b!175546 d!61959))

(declare-fun d!61961 () Bool)

(assert (=> d!61961 (= (array_inv!3922 (buf!4618 thiss!1204)) (bvsge (size!4181 (buf!4618 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!175544 d!61961))

(declare-fun d!61963 () Bool)

(assert (=> d!61963 (= (inv!12 thiss!1204) (invariant!0 (currentBit!8736 thiss!1204) (currentByte!8741 thiss!1204) (size!4181 (buf!4618 thiss!1204))))))

(declare-fun bs!15462 () Bool)

(assert (= bs!15462 d!61963))

(assert (=> bs!15462 m!275737))

(assert (=> start!38962 d!61963))

(check-sat (not d!61963) (not b!175594) (not b!175611) (not b!175609) (not d!61951) (not d!61949) (not d!61931) (not d!61923) (not b!175595) (not d!61953) (not b!175593) (not d!61929) (not b!175596))
(check-sat)
