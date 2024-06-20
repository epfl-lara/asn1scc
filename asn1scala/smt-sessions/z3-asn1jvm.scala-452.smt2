; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11906 () Bool)

(assert start!11906)

(declare-datatypes ((array!2763 0))(
  ( (array!2764 (arr!1821 (Array (_ BitVec 32) (_ BitVec 8))) (size!1257 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2202 0))(
  ( (BitStream!2203 (buf!1638 array!2763) (currentByte!3256 (_ BitVec 32)) (currentBit!3251 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4137 0))(
  ( (Unit!4138) )
))
(declare-datatypes ((tuple2!5526 0))(
  ( (tuple2!5527 (_1!2874 Unit!4137) (_2!2874 BitStream!2202)) )
))
(declare-fun lt!94565 () tuple2!5526)

(declare-fun b!60676 () Bool)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((tuple2!5528 0))(
  ( (tuple2!5529 (_1!2875 BitStream!2202) (_2!2875 BitStream!2202)) )
))
(declare-fun lt!94561 () tuple2!5528)

(declare-fun srcBuffer!2 () array!2763)

(declare-fun e!40518 () Bool)

(declare-datatypes ((List!676 0))(
  ( (Nil!673) (Cons!672 (h!791 Bool) (t!1426 List!676)) )
))
(declare-fun head!495 (List!676) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2202 array!2763 (_ BitVec 64) (_ BitVec 64)) List!676)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2202 BitStream!2202 (_ BitVec 64)) List!676)

(assert (=> b!60676 (= e!40518 (= (head!495 (byteArrayBitContentToList!0 (_2!2874 lt!94565) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!495 (bitStreamReadBitsIntoList!0 (_2!2874 lt!94565) (_1!2875 lt!94561) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!60677 () Bool)

(declare-fun e!40520 () Bool)

(declare-fun e!40522 () Bool)

(assert (=> b!60677 (= e!40520 e!40522)))

(declare-fun res!50620 () Bool)

(assert (=> b!60677 (=> res!50620 e!40522)))

(declare-fun lt!94575 () tuple2!5526)

(assert (=> b!60677 (= res!50620 (not (= (size!1257 (buf!1638 (_2!2874 lt!94565))) (size!1257 (buf!1638 (_2!2874 lt!94575))))))))

(declare-fun e!40515 () Bool)

(assert (=> b!60677 e!40515))

(declare-fun res!50619 () Bool)

(assert (=> b!60677 (=> (not res!50619) (not e!40515))))

(declare-fun thiss!1379 () BitStream!2202)

(assert (=> b!60677 (= res!50619 (= (size!1257 (buf!1638 (_2!2874 lt!94575))) (size!1257 (buf!1638 thiss!1379))))))

(declare-fun b!60678 () Bool)

(declare-fun res!50625 () Bool)

(declare-fun e!40519 () Bool)

(assert (=> b!60678 (=> res!50625 e!40519)))

(declare-fun lt!94572 () List!676)

(declare-fun length!304 (List!676) Int)

(assert (=> b!60678 (= res!50625 (<= (length!304 lt!94572) 0))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun b!60679 () Bool)

(declare-fun lt!94564 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!60679 (= e!40515 (= lt!94564 (bvsub (bvsub (bvadd (bitIndex!0 (size!1257 (buf!1638 (_2!2874 lt!94565))) (currentByte!3256 (_2!2874 lt!94565)) (currentBit!3251 (_2!2874 lt!94565))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!60680 () Bool)

(declare-fun e!40512 () Bool)

(declare-fun array_inv!1160 (array!2763) Bool)

(assert (=> b!60680 (= e!40512 (array_inv!1160 (buf!1638 thiss!1379)))))

(declare-fun b!60681 () Bool)

(declare-fun res!50628 () Bool)

(assert (=> b!60681 (=> res!50628 e!40522)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!60681 (= res!50628 (not (invariant!0 (currentBit!3251 (_2!2874 lt!94565)) (currentByte!3256 (_2!2874 lt!94565)) (size!1257 (buf!1638 (_2!2874 lt!94575))))))))

(declare-fun b!60682 () Bool)

(declare-fun e!40513 () Bool)

(declare-fun e!40521 () Bool)

(assert (=> b!60682 (= e!40513 e!40521)))

(declare-fun res!50622 () Bool)

(assert (=> b!60682 (=> res!50622 e!40521)))

(declare-fun isPrefixOf!0 (BitStream!2202 BitStream!2202) Bool)

(assert (=> b!60682 (= res!50622 (not (isPrefixOf!0 thiss!1379 (_2!2874 lt!94565))))))

(declare-fun lt!94573 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!60682 (validate_offset_bits!1 ((_ sign_extend 32) (size!1257 (buf!1638 (_2!2874 lt!94565)))) ((_ sign_extend 32) (currentByte!3256 (_2!2874 lt!94565))) ((_ sign_extend 32) (currentBit!3251 (_2!2874 lt!94565))) lt!94573)))

(assert (=> b!60682 (= lt!94573 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!94562 () Unit!4137)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2202 BitStream!2202 (_ BitVec 64) (_ BitVec 64)) Unit!4137)

(assert (=> b!60682 (= lt!94562 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2874 lt!94565) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2202 (_ BitVec 8) (_ BitVec 32)) tuple2!5526)

(assert (=> b!60682 (= lt!94565 (appendBitFromByte!0 thiss!1379 (select (arr!1821 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!60683 () Bool)

(declare-fun e!40516 () Bool)

(assert (=> b!60683 (= e!40516 e!40520)))

(declare-fun res!50623 () Bool)

(assert (=> b!60683 (=> res!50623 e!40520)))

(declare-fun lt!94569 () (_ BitVec 64))

(assert (=> b!60683 (= res!50623 (not (= lt!94564 (bvsub (bvadd lt!94569 to!314) i!635))))))

(assert (=> b!60683 (= lt!94564 (bitIndex!0 (size!1257 (buf!1638 (_2!2874 lt!94575))) (currentByte!3256 (_2!2874 lt!94575)) (currentBit!3251 (_2!2874 lt!94575))))))

(declare-fun b!60684 () Bool)

(declare-fun res!50629 () Bool)

(declare-fun e!40514 () Bool)

(assert (=> b!60684 (=> (not res!50629) (not e!40514))))

(assert (=> b!60684 (= res!50629 (validate_offset_bits!1 ((_ sign_extend 32) (size!1257 (buf!1638 thiss!1379))) ((_ sign_extend 32) (currentByte!3256 thiss!1379)) ((_ sign_extend 32) (currentBit!3251 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!60685 () Bool)

(declare-fun res!50617 () Bool)

(assert (=> b!60685 (=> res!50617 e!40520)))

(assert (=> b!60685 (= res!50617 (not (invariant!0 (currentBit!3251 (_2!2874 lt!94575)) (currentByte!3256 (_2!2874 lt!94575)) (size!1257 (buf!1638 (_2!2874 lt!94575))))))))

(declare-fun b!60686 () Bool)

(assert (=> b!60686 (= e!40522 e!40519)))

(declare-fun res!50630 () Bool)

(assert (=> b!60686 (=> res!50630 e!40519)))

(assert (=> b!60686 (= res!50630 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!94576 () List!676)

(declare-fun lt!94570 () tuple2!5528)

(assert (=> b!60686 (= lt!94576 (bitStreamReadBitsIntoList!0 (_2!2874 lt!94575) (_1!2875 lt!94570) lt!94573))))

(declare-fun lt!94568 () tuple2!5528)

(assert (=> b!60686 (= lt!94572 (bitStreamReadBitsIntoList!0 (_2!2874 lt!94575) (_1!2875 lt!94568) (bvsub to!314 i!635)))))

(assert (=> b!60686 (validate_offset_bits!1 ((_ sign_extend 32) (size!1257 (buf!1638 (_2!2874 lt!94575)))) ((_ sign_extend 32) (currentByte!3256 (_2!2874 lt!94565))) ((_ sign_extend 32) (currentBit!3251 (_2!2874 lt!94565))) lt!94573)))

(declare-fun lt!94571 () Unit!4137)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2202 array!2763 (_ BitVec 64)) Unit!4137)

(assert (=> b!60686 (= lt!94571 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2874 lt!94565) (buf!1638 (_2!2874 lt!94575)) lt!94573))))

(declare-fun reader!0 (BitStream!2202 BitStream!2202) tuple2!5528)

(assert (=> b!60686 (= lt!94570 (reader!0 (_2!2874 lt!94565) (_2!2874 lt!94575)))))

(assert (=> b!60686 (validate_offset_bits!1 ((_ sign_extend 32) (size!1257 (buf!1638 (_2!2874 lt!94575)))) ((_ sign_extend 32) (currentByte!3256 thiss!1379)) ((_ sign_extend 32) (currentBit!3251 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!94563 () Unit!4137)

(assert (=> b!60686 (= lt!94563 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1638 (_2!2874 lt!94575)) (bvsub to!314 i!635)))))

(assert (=> b!60686 (= lt!94568 (reader!0 thiss!1379 (_2!2874 lt!94575)))))

(declare-fun b!60687 () Bool)

(declare-fun res!50618 () Bool)

(assert (=> b!60687 (=> res!50618 e!40522)))

(assert (=> b!60687 (= res!50618 (not (invariant!0 (currentBit!3251 (_2!2874 lt!94565)) (currentByte!3256 (_2!2874 lt!94565)) (size!1257 (buf!1638 (_2!2874 lt!94565))))))))

(declare-fun b!60689 () Bool)

(assert (=> b!60689 (= e!40519 (isPrefixOf!0 (_1!2875 lt!94568) (_2!2874 lt!94575)))))

(declare-fun b!60690 () Bool)

(assert (=> b!60690 (= e!40521 e!40516)))

(declare-fun res!50624 () Bool)

(assert (=> b!60690 (=> res!50624 e!40516)))

(assert (=> b!60690 (= res!50624 (not (isPrefixOf!0 (_2!2874 lt!94565) (_2!2874 lt!94575))))))

(assert (=> b!60690 (isPrefixOf!0 thiss!1379 (_2!2874 lt!94575))))

(declare-fun lt!94574 () Unit!4137)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2202 BitStream!2202 BitStream!2202) Unit!4137)

(assert (=> b!60690 (= lt!94574 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2874 lt!94565) (_2!2874 lt!94575)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2202 array!2763 (_ BitVec 64) (_ BitVec 64)) tuple2!5526)

(assert (=> b!60690 (= lt!94575 (appendBitsMSBFirstLoop!0 (_2!2874 lt!94565) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!60690 e!40518))

(declare-fun res!50626 () Bool)

(assert (=> b!60690 (=> (not res!50626) (not e!40518))))

(assert (=> b!60690 (= res!50626 (validate_offset_bits!1 ((_ sign_extend 32) (size!1257 (buf!1638 (_2!2874 lt!94565)))) ((_ sign_extend 32) (currentByte!3256 thiss!1379)) ((_ sign_extend 32) (currentBit!3251 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!94567 () Unit!4137)

(assert (=> b!60690 (= lt!94567 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1638 (_2!2874 lt!94565)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!60690 (= lt!94561 (reader!0 thiss!1379 (_2!2874 lt!94565)))))

(declare-fun b!60691 () Bool)

(declare-fun res!50631 () Bool)

(assert (=> b!60691 (=> res!50631 e!40520)))

(assert (=> b!60691 (= res!50631 (not (= (size!1257 (buf!1638 thiss!1379)) (size!1257 (buf!1638 (_2!2874 lt!94575))))))))

(declare-fun b!60688 () Bool)

(assert (=> b!60688 (= e!40514 (not e!40513))))

(declare-fun res!50627 () Bool)

(assert (=> b!60688 (=> res!50627 e!40513)))

(assert (=> b!60688 (= res!50627 (bvsge i!635 to!314))))

(assert (=> b!60688 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!94566 () Unit!4137)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2202) Unit!4137)

(assert (=> b!60688 (= lt!94566 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!60688 (= lt!94569 (bitIndex!0 (size!1257 (buf!1638 thiss!1379)) (currentByte!3256 thiss!1379) (currentBit!3251 thiss!1379)))))

(declare-fun res!50621 () Bool)

(assert (=> start!11906 (=> (not res!50621) (not e!40514))))

(assert (=> start!11906 (= res!50621 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1257 srcBuffer!2))))))))

(assert (=> start!11906 e!40514))

(assert (=> start!11906 true))

(assert (=> start!11906 (array_inv!1160 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2202) Bool)

(assert (=> start!11906 (and (inv!12 thiss!1379) e!40512)))

(assert (= (and start!11906 res!50621) b!60684))

(assert (= (and b!60684 res!50629) b!60688))

(assert (= (and b!60688 (not res!50627)) b!60682))

(assert (= (and b!60682 (not res!50622)) b!60690))

(assert (= (and b!60690 res!50626) b!60676))

(assert (= (and b!60690 (not res!50624)) b!60683))

(assert (= (and b!60683 (not res!50623)) b!60685))

(assert (= (and b!60685 (not res!50617)) b!60691))

(assert (= (and b!60691 (not res!50631)) b!60677))

(assert (= (and b!60677 res!50619) b!60679))

(assert (= (and b!60677 (not res!50620)) b!60687))

(assert (= (and b!60687 (not res!50618)) b!60681))

(assert (= (and b!60681 (not res!50628)) b!60686))

(assert (= (and b!60686 (not res!50630)) b!60678))

(assert (= (and b!60678 (not res!50625)) b!60689))

(assert (= start!11906 b!60680))

(declare-fun m!95615 () Bool)

(assert (=> b!60686 m!95615))

(declare-fun m!95617 () Bool)

(assert (=> b!60686 m!95617))

(declare-fun m!95619 () Bool)

(assert (=> b!60686 m!95619))

(declare-fun m!95621 () Bool)

(assert (=> b!60686 m!95621))

(declare-fun m!95623 () Bool)

(assert (=> b!60686 m!95623))

(declare-fun m!95625 () Bool)

(assert (=> b!60686 m!95625))

(declare-fun m!95627 () Bool)

(assert (=> b!60686 m!95627))

(declare-fun m!95629 () Bool)

(assert (=> b!60686 m!95629))

(declare-fun m!95631 () Bool)

(assert (=> b!60681 m!95631))

(declare-fun m!95633 () Bool)

(assert (=> b!60684 m!95633))

(declare-fun m!95635 () Bool)

(assert (=> b!60690 m!95635))

(declare-fun m!95637 () Bool)

(assert (=> b!60690 m!95637))

(declare-fun m!95639 () Bool)

(assert (=> b!60690 m!95639))

(declare-fun m!95641 () Bool)

(assert (=> b!60690 m!95641))

(declare-fun m!95643 () Bool)

(assert (=> b!60690 m!95643))

(declare-fun m!95645 () Bool)

(assert (=> b!60690 m!95645))

(declare-fun m!95647 () Bool)

(assert (=> b!60690 m!95647))

(declare-fun m!95649 () Bool)

(assert (=> b!60679 m!95649))

(declare-fun m!95651 () Bool)

(assert (=> b!60678 m!95651))

(declare-fun m!95653 () Bool)

(assert (=> b!60689 m!95653))

(declare-fun m!95655 () Bool)

(assert (=> b!60687 m!95655))

(declare-fun m!95657 () Bool)

(assert (=> b!60683 m!95657))

(declare-fun m!95659 () Bool)

(assert (=> b!60676 m!95659))

(assert (=> b!60676 m!95659))

(declare-fun m!95661 () Bool)

(assert (=> b!60676 m!95661))

(declare-fun m!95663 () Bool)

(assert (=> b!60676 m!95663))

(assert (=> b!60676 m!95663))

(declare-fun m!95665 () Bool)

(assert (=> b!60676 m!95665))

(declare-fun m!95667 () Bool)

(assert (=> b!60688 m!95667))

(declare-fun m!95669 () Bool)

(assert (=> b!60688 m!95669))

(declare-fun m!95671 () Bool)

(assert (=> b!60688 m!95671))

(declare-fun m!95673 () Bool)

(assert (=> start!11906 m!95673))

(declare-fun m!95675 () Bool)

(assert (=> start!11906 m!95675))

(declare-fun m!95677 () Bool)

(assert (=> b!60682 m!95677))

(declare-fun m!95679 () Bool)

(assert (=> b!60682 m!95679))

(declare-fun m!95681 () Bool)

(assert (=> b!60682 m!95681))

(declare-fun m!95683 () Bool)

(assert (=> b!60682 m!95683))

(assert (=> b!60682 m!95681))

(declare-fun m!95685 () Bool)

(assert (=> b!60682 m!95685))

(declare-fun m!95687 () Bool)

(assert (=> b!60685 m!95687))

(declare-fun m!95689 () Bool)

(assert (=> b!60680 m!95689))

(check-sat (not b!60684) (not b!60680) (not b!60682) (not b!60686) (not b!60676) (not b!60689) (not b!60690) (not b!60685) (not b!60683) (not start!11906) (not b!60687) (not b!60678) (not b!60681) (not b!60688) (not b!60679))
(check-sat)
(get-model)

(declare-fun d!18592 () Bool)

(declare-fun res!50683 () Bool)

(declare-fun e!40565 () Bool)

(assert (=> d!18592 (=> (not res!50683) (not e!40565))))

(assert (=> d!18592 (= res!50683 (= (size!1257 (buf!1638 (_1!2875 lt!94568))) (size!1257 (buf!1638 (_2!2874 lt!94575)))))))

(assert (=> d!18592 (= (isPrefixOf!0 (_1!2875 lt!94568) (_2!2874 lt!94575)) e!40565)))

(declare-fun b!60746 () Bool)

(declare-fun res!50684 () Bool)

(assert (=> b!60746 (=> (not res!50684) (not e!40565))))

(assert (=> b!60746 (= res!50684 (bvsle (bitIndex!0 (size!1257 (buf!1638 (_1!2875 lt!94568))) (currentByte!3256 (_1!2875 lt!94568)) (currentBit!3251 (_1!2875 lt!94568))) (bitIndex!0 (size!1257 (buf!1638 (_2!2874 lt!94575))) (currentByte!3256 (_2!2874 lt!94575)) (currentBit!3251 (_2!2874 lt!94575)))))))

(declare-fun b!60747 () Bool)

(declare-fun e!40564 () Bool)

(assert (=> b!60747 (= e!40565 e!40564)))

(declare-fun res!50685 () Bool)

(assert (=> b!60747 (=> res!50685 e!40564)))

(assert (=> b!60747 (= res!50685 (= (size!1257 (buf!1638 (_1!2875 lt!94568))) #b00000000000000000000000000000000))))

(declare-fun b!60748 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2763 array!2763 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!60748 (= e!40564 (arrayBitRangesEq!0 (buf!1638 (_1!2875 lt!94568)) (buf!1638 (_2!2874 lt!94575)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1257 (buf!1638 (_1!2875 lt!94568))) (currentByte!3256 (_1!2875 lt!94568)) (currentBit!3251 (_1!2875 lt!94568)))))))

(assert (= (and d!18592 res!50683) b!60746))

(assert (= (and b!60746 res!50684) b!60747))

(assert (= (and b!60747 (not res!50685)) b!60748))

(declare-fun m!95767 () Bool)

(assert (=> b!60746 m!95767))

(assert (=> b!60746 m!95657))

(assert (=> b!60748 m!95767))

(assert (=> b!60748 m!95767))

(declare-fun m!95769 () Bool)

(assert (=> b!60748 m!95769))

(assert (=> b!60689 d!18592))

(declare-fun d!18594 () Bool)

(declare-fun size!1259 (List!676) Int)

(assert (=> d!18594 (= (length!304 lt!94572) (size!1259 lt!94572))))

(declare-fun bs!4665 () Bool)

(assert (= bs!4665 d!18594))

(declare-fun m!95771 () Bool)

(assert (=> bs!4665 m!95771))

(assert (=> b!60678 d!18594))

(declare-fun d!18596 () Bool)

(declare-fun res!50686 () Bool)

(declare-fun e!40567 () Bool)

(assert (=> d!18596 (=> (not res!50686) (not e!40567))))

(assert (=> d!18596 (= res!50686 (= (size!1257 (buf!1638 thiss!1379)) (size!1257 (buf!1638 thiss!1379))))))

(assert (=> d!18596 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!40567)))

(declare-fun b!60749 () Bool)

(declare-fun res!50687 () Bool)

(assert (=> b!60749 (=> (not res!50687) (not e!40567))))

(assert (=> b!60749 (= res!50687 (bvsle (bitIndex!0 (size!1257 (buf!1638 thiss!1379)) (currentByte!3256 thiss!1379) (currentBit!3251 thiss!1379)) (bitIndex!0 (size!1257 (buf!1638 thiss!1379)) (currentByte!3256 thiss!1379) (currentBit!3251 thiss!1379))))))

(declare-fun b!60750 () Bool)

(declare-fun e!40566 () Bool)

(assert (=> b!60750 (= e!40567 e!40566)))

(declare-fun res!50688 () Bool)

(assert (=> b!60750 (=> res!50688 e!40566)))

(assert (=> b!60750 (= res!50688 (= (size!1257 (buf!1638 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!60751 () Bool)

(assert (=> b!60751 (= e!40566 (arrayBitRangesEq!0 (buf!1638 thiss!1379) (buf!1638 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1257 (buf!1638 thiss!1379)) (currentByte!3256 thiss!1379) (currentBit!3251 thiss!1379))))))

(assert (= (and d!18596 res!50686) b!60749))

(assert (= (and b!60749 res!50687) b!60750))

(assert (= (and b!60750 (not res!50688)) b!60751))

(assert (=> b!60749 m!95671))

(assert (=> b!60749 m!95671))

(assert (=> b!60751 m!95671))

(assert (=> b!60751 m!95671))

(declare-fun m!95773 () Bool)

(assert (=> b!60751 m!95773))

(assert (=> b!60688 d!18596))

(declare-fun d!18598 () Bool)

(assert (=> d!18598 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!94627 () Unit!4137)

(declare-fun choose!11 (BitStream!2202) Unit!4137)

(assert (=> d!18598 (= lt!94627 (choose!11 thiss!1379))))

(assert (=> d!18598 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!94627)))

(declare-fun bs!4667 () Bool)

(assert (= bs!4667 d!18598))

(assert (=> bs!4667 m!95667))

(declare-fun m!95775 () Bool)

(assert (=> bs!4667 m!95775))

(assert (=> b!60688 d!18598))

(declare-fun d!18600 () Bool)

(declare-fun e!40570 () Bool)

(assert (=> d!18600 e!40570))

(declare-fun res!50694 () Bool)

(assert (=> d!18600 (=> (not res!50694) (not e!40570))))

(declare-fun lt!94643 () (_ BitVec 64))

(declare-fun lt!94642 () (_ BitVec 64))

(declare-fun lt!94641 () (_ BitVec 64))

(assert (=> d!18600 (= res!50694 (= lt!94641 (bvsub lt!94643 lt!94642)))))

(assert (=> d!18600 (or (= (bvand lt!94643 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!94642 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!94643 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!94643 lt!94642) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!18600 (= lt!94642 (remainingBits!0 ((_ sign_extend 32) (size!1257 (buf!1638 thiss!1379))) ((_ sign_extend 32) (currentByte!3256 thiss!1379)) ((_ sign_extend 32) (currentBit!3251 thiss!1379))))))

(declare-fun lt!94640 () (_ BitVec 64))

(declare-fun lt!94645 () (_ BitVec 64))

(assert (=> d!18600 (= lt!94643 (bvmul lt!94640 lt!94645))))

(assert (=> d!18600 (or (= lt!94640 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!94645 (bvsdiv (bvmul lt!94640 lt!94645) lt!94640)))))

(assert (=> d!18600 (= lt!94645 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18600 (= lt!94640 ((_ sign_extend 32) (size!1257 (buf!1638 thiss!1379))))))

(assert (=> d!18600 (= lt!94641 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3256 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3251 thiss!1379))))))

(assert (=> d!18600 (invariant!0 (currentBit!3251 thiss!1379) (currentByte!3256 thiss!1379) (size!1257 (buf!1638 thiss!1379)))))

(assert (=> d!18600 (= (bitIndex!0 (size!1257 (buf!1638 thiss!1379)) (currentByte!3256 thiss!1379) (currentBit!3251 thiss!1379)) lt!94641)))

(declare-fun b!60756 () Bool)

(declare-fun res!50693 () Bool)

(assert (=> b!60756 (=> (not res!50693) (not e!40570))))

(assert (=> b!60756 (= res!50693 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!94641))))

(declare-fun b!60757 () Bool)

(declare-fun lt!94644 () (_ BitVec 64))

(assert (=> b!60757 (= e!40570 (bvsle lt!94641 (bvmul lt!94644 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!60757 (or (= lt!94644 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!94644 #b0000000000000000000000000000000000000000000000000000000000001000) lt!94644)))))

(assert (=> b!60757 (= lt!94644 ((_ sign_extend 32) (size!1257 (buf!1638 thiss!1379))))))

(assert (= (and d!18600 res!50694) b!60756))

(assert (= (and b!60756 res!50693) b!60757))

(declare-fun m!95777 () Bool)

(assert (=> d!18600 m!95777))

(declare-fun m!95779 () Bool)

(assert (=> d!18600 m!95779))

(assert (=> b!60688 d!18600))

(declare-fun d!18602 () Bool)

(assert (=> d!18602 (= (invariant!0 (currentBit!3251 (_2!2874 lt!94565)) (currentByte!3256 (_2!2874 lt!94565)) (size!1257 (buf!1638 (_2!2874 lt!94565)))) (and (bvsge (currentBit!3251 (_2!2874 lt!94565)) #b00000000000000000000000000000000) (bvslt (currentBit!3251 (_2!2874 lt!94565)) #b00000000000000000000000000001000) (bvsge (currentByte!3256 (_2!2874 lt!94565)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3256 (_2!2874 lt!94565)) (size!1257 (buf!1638 (_2!2874 lt!94565)))) (and (= (currentBit!3251 (_2!2874 lt!94565)) #b00000000000000000000000000000000) (= (currentByte!3256 (_2!2874 lt!94565)) (size!1257 (buf!1638 (_2!2874 lt!94565))))))))))

(assert (=> b!60687 d!18602))

(declare-fun d!18604 () Bool)

(assert (=> d!18604 (= (head!495 (byteArrayBitContentToList!0 (_2!2874 lt!94565) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!791 (byteArrayBitContentToList!0 (_2!2874 lt!94565) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!60676 d!18604))

(declare-fun d!18606 () Bool)

(declare-fun c!4230 () Bool)

(assert (=> d!18606 (= c!4230 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!40573 () List!676)

(assert (=> d!18606 (= (byteArrayBitContentToList!0 (_2!2874 lt!94565) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!40573)))

(declare-fun b!60762 () Bool)

(assert (=> b!60762 (= e!40573 Nil!673)))

(declare-fun b!60763 () Bool)

(assert (=> b!60763 (= e!40573 (Cons!672 (not (= (bvand ((_ sign_extend 24) (select (arr!1821 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2874 lt!94565) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!18606 c!4230) b!60762))

(assert (= (and d!18606 (not c!4230)) b!60763))

(assert (=> b!60763 m!95681))

(declare-fun m!95781 () Bool)

(assert (=> b!60763 m!95781))

(declare-fun m!95783 () Bool)

(assert (=> b!60763 m!95783))

(assert (=> b!60676 d!18606))

(declare-fun d!18608 () Bool)

(assert (=> d!18608 (= (head!495 (bitStreamReadBitsIntoList!0 (_2!2874 lt!94565) (_1!2875 lt!94561) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!791 (bitStreamReadBitsIntoList!0 (_2!2874 lt!94565) (_1!2875 lt!94561) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!60676 d!18608))

(declare-fun b!60774 () Bool)

(declare-fun e!40579 () Bool)

(declare-fun lt!94652 () List!676)

(declare-fun isEmpty!180 (List!676) Bool)

(assert (=> b!60774 (= e!40579 (isEmpty!180 lt!94652))))

(declare-fun d!18610 () Bool)

(assert (=> d!18610 e!40579))

(declare-fun c!4236 () Bool)

(assert (=> d!18610 (= c!4236 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!5534 0))(
  ( (tuple2!5535 (_1!2878 List!676) (_2!2878 BitStream!2202)) )
))
(declare-fun e!40578 () tuple2!5534)

(assert (=> d!18610 (= lt!94652 (_1!2878 e!40578))))

(declare-fun c!4235 () Bool)

(assert (=> d!18610 (= c!4235 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18610 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!18610 (= (bitStreamReadBitsIntoList!0 (_2!2874 lt!94565) (_1!2875 lt!94561) #b0000000000000000000000000000000000000000000000000000000000000001) lt!94652)))

(declare-fun b!60773 () Bool)

(declare-datatypes ((tuple2!5536 0))(
  ( (tuple2!5537 (_1!2879 Bool) (_2!2879 BitStream!2202)) )
))
(declare-fun lt!94653 () tuple2!5536)

(declare-fun lt!94654 () (_ BitVec 64))

(assert (=> b!60773 (= e!40578 (tuple2!5535 (Cons!672 (_1!2879 lt!94653) (bitStreamReadBitsIntoList!0 (_2!2874 lt!94565) (_2!2879 lt!94653) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!94654))) (_2!2879 lt!94653)))))

(declare-fun readBit!0 (BitStream!2202) tuple2!5536)

(assert (=> b!60773 (= lt!94653 (readBit!0 (_1!2875 lt!94561)))))

(assert (=> b!60773 (= lt!94654 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!60772 () Bool)

(assert (=> b!60772 (= e!40578 (tuple2!5535 Nil!673 (_1!2875 lt!94561)))))

(declare-fun b!60775 () Bool)

(assert (=> b!60775 (= e!40579 (> (length!304 lt!94652) 0))))

(assert (= (and d!18610 c!4235) b!60772))

(assert (= (and d!18610 (not c!4235)) b!60773))

(assert (= (and d!18610 c!4236) b!60774))

(assert (= (and d!18610 (not c!4236)) b!60775))

(declare-fun m!95785 () Bool)

(assert (=> b!60774 m!95785))

(declare-fun m!95787 () Bool)

(assert (=> b!60773 m!95787))

(declare-fun m!95789 () Bool)

(assert (=> b!60773 m!95789))

(declare-fun m!95791 () Bool)

(assert (=> b!60775 m!95791))

(assert (=> b!60676 d!18610))

(declare-fun d!18612 () Bool)

(assert (=> d!18612 (= (invariant!0 (currentBit!3251 (_2!2874 lt!94565)) (currentByte!3256 (_2!2874 lt!94565)) (size!1257 (buf!1638 (_2!2874 lt!94575)))) (and (bvsge (currentBit!3251 (_2!2874 lt!94565)) #b00000000000000000000000000000000) (bvslt (currentBit!3251 (_2!2874 lt!94565)) #b00000000000000000000000000001000) (bvsge (currentByte!3256 (_2!2874 lt!94565)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3256 (_2!2874 lt!94565)) (size!1257 (buf!1638 (_2!2874 lt!94575)))) (and (= (currentBit!3251 (_2!2874 lt!94565)) #b00000000000000000000000000000000) (= (currentByte!3256 (_2!2874 lt!94565)) (size!1257 (buf!1638 (_2!2874 lt!94575))))))))))

(assert (=> b!60681 d!18612))

(declare-fun d!18614 () Bool)

(assert (=> d!18614 (= (array_inv!1160 (buf!1638 thiss!1379)) (bvsge (size!1257 (buf!1638 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!60680 d!18614))

(declare-fun b!60786 () Bool)

(declare-fun res!50701 () Bool)

(declare-fun e!40584 () Bool)

(assert (=> b!60786 (=> (not res!50701) (not e!40584))))

(declare-fun lt!94697 () tuple2!5528)

(assert (=> b!60786 (= res!50701 (isPrefixOf!0 (_1!2875 lt!94697) thiss!1379))))

(declare-fun b!60787 () Bool)

(declare-fun res!50703 () Bool)

(assert (=> b!60787 (=> (not res!50703) (not e!40584))))

(assert (=> b!60787 (= res!50703 (isPrefixOf!0 (_2!2875 lt!94697) (_2!2874 lt!94565)))))

(declare-fun b!60788 () Bool)

(declare-fun e!40585 () Unit!4137)

(declare-fun lt!94714 () Unit!4137)

(assert (=> b!60788 (= e!40585 lt!94714)))

(declare-fun lt!94712 () (_ BitVec 64))

(assert (=> b!60788 (= lt!94712 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94704 () (_ BitVec 64))

(assert (=> b!60788 (= lt!94704 (bitIndex!0 (size!1257 (buf!1638 thiss!1379)) (currentByte!3256 thiss!1379) (currentBit!3251 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2763 array!2763 (_ BitVec 64) (_ BitVec 64)) Unit!4137)

(assert (=> b!60788 (= lt!94714 (arrayBitRangesEqSymmetric!0 (buf!1638 thiss!1379) (buf!1638 (_2!2874 lt!94565)) lt!94712 lt!94704))))

(assert (=> b!60788 (arrayBitRangesEq!0 (buf!1638 (_2!2874 lt!94565)) (buf!1638 thiss!1379) lt!94712 lt!94704)))

(declare-fun b!60789 () Bool)

(declare-fun Unit!4141 () Unit!4137)

(assert (=> b!60789 (= e!40585 Unit!4141)))

(declare-fun b!60790 () Bool)

(declare-fun lt!94695 () (_ BitVec 64))

(declare-fun lt!94708 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2202 (_ BitVec 64)) BitStream!2202)

(assert (=> b!60790 (= e!40584 (= (_1!2875 lt!94697) (withMovedBitIndex!0 (_2!2875 lt!94697) (bvsub lt!94695 lt!94708))))))

(assert (=> b!60790 (or (= (bvand lt!94695 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!94708 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!94695 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!94695 lt!94708) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!60790 (= lt!94708 (bitIndex!0 (size!1257 (buf!1638 (_2!2874 lt!94565))) (currentByte!3256 (_2!2874 lt!94565)) (currentBit!3251 (_2!2874 lt!94565))))))

(assert (=> b!60790 (= lt!94695 (bitIndex!0 (size!1257 (buf!1638 thiss!1379)) (currentByte!3256 thiss!1379) (currentBit!3251 thiss!1379)))))

(declare-fun d!18616 () Bool)

(assert (=> d!18616 e!40584))

(declare-fun res!50702 () Bool)

(assert (=> d!18616 (=> (not res!50702) (not e!40584))))

(assert (=> d!18616 (= res!50702 (isPrefixOf!0 (_1!2875 lt!94697) (_2!2875 lt!94697)))))

(declare-fun lt!94709 () BitStream!2202)

(assert (=> d!18616 (= lt!94697 (tuple2!5529 lt!94709 (_2!2874 lt!94565)))))

(declare-fun lt!94698 () Unit!4137)

(declare-fun lt!94706 () Unit!4137)

(assert (=> d!18616 (= lt!94698 lt!94706)))

(assert (=> d!18616 (isPrefixOf!0 lt!94709 (_2!2874 lt!94565))))

(assert (=> d!18616 (= lt!94706 (lemmaIsPrefixTransitive!0 lt!94709 (_2!2874 lt!94565) (_2!2874 lt!94565)))))

(declare-fun lt!94711 () Unit!4137)

(declare-fun lt!94702 () Unit!4137)

(assert (=> d!18616 (= lt!94711 lt!94702)))

(assert (=> d!18616 (isPrefixOf!0 lt!94709 (_2!2874 lt!94565))))

(assert (=> d!18616 (= lt!94702 (lemmaIsPrefixTransitive!0 lt!94709 thiss!1379 (_2!2874 lt!94565)))))

(declare-fun lt!94696 () Unit!4137)

(assert (=> d!18616 (= lt!94696 e!40585)))

(declare-fun c!4239 () Bool)

(assert (=> d!18616 (= c!4239 (not (= (size!1257 (buf!1638 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!94707 () Unit!4137)

(declare-fun lt!94699 () Unit!4137)

(assert (=> d!18616 (= lt!94707 lt!94699)))

(assert (=> d!18616 (isPrefixOf!0 (_2!2874 lt!94565) (_2!2874 lt!94565))))

(assert (=> d!18616 (= lt!94699 (lemmaIsPrefixRefl!0 (_2!2874 lt!94565)))))

(declare-fun lt!94705 () Unit!4137)

(declare-fun lt!94713 () Unit!4137)

(assert (=> d!18616 (= lt!94705 lt!94713)))

(assert (=> d!18616 (= lt!94713 (lemmaIsPrefixRefl!0 (_2!2874 lt!94565)))))

(declare-fun lt!94710 () Unit!4137)

(declare-fun lt!94701 () Unit!4137)

(assert (=> d!18616 (= lt!94710 lt!94701)))

(assert (=> d!18616 (isPrefixOf!0 lt!94709 lt!94709)))

(assert (=> d!18616 (= lt!94701 (lemmaIsPrefixRefl!0 lt!94709))))

(declare-fun lt!94703 () Unit!4137)

(declare-fun lt!94700 () Unit!4137)

(assert (=> d!18616 (= lt!94703 lt!94700)))

(assert (=> d!18616 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!18616 (= lt!94700 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!18616 (= lt!94709 (BitStream!2203 (buf!1638 (_2!2874 lt!94565)) (currentByte!3256 thiss!1379) (currentBit!3251 thiss!1379)))))

(assert (=> d!18616 (isPrefixOf!0 thiss!1379 (_2!2874 lt!94565))))

(assert (=> d!18616 (= (reader!0 thiss!1379 (_2!2874 lt!94565)) lt!94697)))

(assert (= (and d!18616 c!4239) b!60788))

(assert (= (and d!18616 (not c!4239)) b!60789))

(assert (= (and d!18616 res!50702) b!60786))

(assert (= (and b!60786 res!50701) b!60787))

(assert (= (and b!60787 res!50703) b!60790))

(declare-fun m!95793 () Bool)

(assert (=> b!60786 m!95793))

(declare-fun m!95795 () Bool)

(assert (=> d!18616 m!95795))

(declare-fun m!95797 () Bool)

(assert (=> d!18616 m!95797))

(declare-fun m!95799 () Bool)

(assert (=> d!18616 m!95799))

(declare-fun m!95801 () Bool)

(assert (=> d!18616 m!95801))

(declare-fun m!95803 () Bool)

(assert (=> d!18616 m!95803))

(assert (=> d!18616 m!95667))

(assert (=> d!18616 m!95669))

(assert (=> d!18616 m!95679))

(declare-fun m!95805 () Bool)

(assert (=> d!18616 m!95805))

(declare-fun m!95807 () Bool)

(assert (=> d!18616 m!95807))

(declare-fun m!95809 () Bool)

(assert (=> d!18616 m!95809))

(assert (=> b!60788 m!95671))

(declare-fun m!95811 () Bool)

(assert (=> b!60788 m!95811))

(declare-fun m!95813 () Bool)

(assert (=> b!60788 m!95813))

(declare-fun m!95815 () Bool)

(assert (=> b!60787 m!95815))

(declare-fun m!95817 () Bool)

(assert (=> b!60790 m!95817))

(assert (=> b!60790 m!95649))

(assert (=> b!60790 m!95671))

(assert (=> b!60690 d!18616))

(declare-fun d!18618 () Bool)

(assert (=> d!18618 (validate_offset_bits!1 ((_ sign_extend 32) (size!1257 (buf!1638 (_2!2874 lt!94565)))) ((_ sign_extend 32) (currentByte!3256 thiss!1379)) ((_ sign_extend 32) (currentBit!3251 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!94717 () Unit!4137)

(declare-fun choose!9 (BitStream!2202 array!2763 (_ BitVec 64) BitStream!2202) Unit!4137)

(assert (=> d!18618 (= lt!94717 (choose!9 thiss!1379 (buf!1638 (_2!2874 lt!94565)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2203 (buf!1638 (_2!2874 lt!94565)) (currentByte!3256 thiss!1379) (currentBit!3251 thiss!1379))))))

(assert (=> d!18618 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1638 (_2!2874 lt!94565)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!94717)))

(declare-fun bs!4668 () Bool)

(assert (= bs!4668 d!18618))

(assert (=> bs!4668 m!95643))

(declare-fun m!95819 () Bool)

(assert (=> bs!4668 m!95819))

(assert (=> b!60690 d!18618))

(declare-fun d!18620 () Bool)

(assert (=> d!18620 (isPrefixOf!0 thiss!1379 (_2!2874 lt!94575))))

(declare-fun lt!94720 () Unit!4137)

(declare-fun choose!30 (BitStream!2202 BitStream!2202 BitStream!2202) Unit!4137)

(assert (=> d!18620 (= lt!94720 (choose!30 thiss!1379 (_2!2874 lt!94565) (_2!2874 lt!94575)))))

(assert (=> d!18620 (isPrefixOf!0 thiss!1379 (_2!2874 lt!94565))))

(assert (=> d!18620 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2874 lt!94565) (_2!2874 lt!94575)) lt!94720)))

(declare-fun bs!4669 () Bool)

(assert (= bs!4669 d!18620))

(assert (=> bs!4669 m!95645))

(declare-fun m!95821 () Bool)

(assert (=> bs!4669 m!95821))

(assert (=> bs!4669 m!95679))

(assert (=> b!60690 d!18620))

(declare-fun d!18622 () Bool)

(assert (=> d!18622 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1257 (buf!1638 (_2!2874 lt!94565)))) ((_ sign_extend 32) (currentByte!3256 thiss!1379)) ((_ sign_extend 32) (currentBit!3251 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1257 (buf!1638 (_2!2874 lt!94565)))) ((_ sign_extend 32) (currentByte!3256 thiss!1379)) ((_ sign_extend 32) (currentBit!3251 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4670 () Bool)

(assert (= bs!4670 d!18622))

(declare-fun m!95823 () Bool)

(assert (=> bs!4670 m!95823))

(assert (=> b!60690 d!18622))

(declare-fun e!40653 () Bool)

(declare-fun b!60924 () Bool)

(declare-fun lt!95058 () tuple2!5526)

(declare-fun lt!95059 () tuple2!5528)

(assert (=> b!60924 (= e!40653 (= (bitStreamReadBitsIntoList!0 (_2!2874 lt!95058) (_1!2875 lt!95059) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2874 lt!95058) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!60924 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!60924 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!95046 () Unit!4137)

(declare-fun lt!95038 () Unit!4137)

(assert (=> b!60924 (= lt!95046 lt!95038)))

(declare-fun lt!95043 () (_ BitVec 64))

(assert (=> b!60924 (validate_offset_bits!1 ((_ sign_extend 32) (size!1257 (buf!1638 (_2!2874 lt!95058)))) ((_ sign_extend 32) (currentByte!3256 (_2!2874 lt!94565))) ((_ sign_extend 32) (currentBit!3251 (_2!2874 lt!94565))) lt!95043)))

(assert (=> b!60924 (= lt!95038 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2874 lt!94565) (buf!1638 (_2!2874 lt!95058)) lt!95043))))

(declare-fun e!40655 () Bool)

(assert (=> b!60924 e!40655))

(declare-fun res!50805 () Bool)

(assert (=> b!60924 (=> (not res!50805) (not e!40655))))

(assert (=> b!60924 (= res!50805 (and (= (size!1257 (buf!1638 (_2!2874 lt!94565))) (size!1257 (buf!1638 (_2!2874 lt!95058)))) (bvsge lt!95043 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!60924 (= lt!95043 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!60924 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!60924 (= lt!95059 (reader!0 (_2!2874 lt!94565) (_2!2874 lt!95058)))))

(declare-fun d!18624 () Bool)

(assert (=> d!18624 e!40653))

(declare-fun res!50802 () Bool)

(assert (=> d!18624 (=> (not res!50802) (not e!40653))))

(declare-fun lt!95054 () (_ BitVec 64))

(assert (=> d!18624 (= res!50802 (= (bitIndex!0 (size!1257 (buf!1638 (_2!2874 lt!95058))) (currentByte!3256 (_2!2874 lt!95058)) (currentBit!3251 (_2!2874 lt!95058))) (bvsub lt!95054 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!18624 (or (= (bvand lt!95054 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!95054 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!95054 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!95068 () (_ BitVec 64))

(assert (=> d!18624 (= lt!95054 (bvadd lt!95068 to!314))))

(assert (=> d!18624 (or (not (= (bvand lt!95068 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!95068 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!95068 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18624 (= lt!95068 (bitIndex!0 (size!1257 (buf!1638 (_2!2874 lt!94565))) (currentByte!3256 (_2!2874 lt!94565)) (currentBit!3251 (_2!2874 lt!94565))))))

(declare-fun e!40654 () tuple2!5526)

(assert (=> d!18624 (= lt!95058 e!40654)))

(declare-fun c!4257 () Bool)

(assert (=> d!18624 (= c!4257 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!95045 () Unit!4137)

(declare-fun lt!95065 () Unit!4137)

(assert (=> d!18624 (= lt!95045 lt!95065)))

(assert (=> d!18624 (isPrefixOf!0 (_2!2874 lt!94565) (_2!2874 lt!94565))))

(assert (=> d!18624 (= lt!95065 (lemmaIsPrefixRefl!0 (_2!2874 lt!94565)))))

(declare-fun lt!95047 () (_ BitVec 64))

(assert (=> d!18624 (= lt!95047 (bitIndex!0 (size!1257 (buf!1638 (_2!2874 lt!94565))) (currentByte!3256 (_2!2874 lt!94565)) (currentBit!3251 (_2!2874 lt!94565))))))

(assert (=> d!18624 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!18624 (= (appendBitsMSBFirstLoop!0 (_2!2874 lt!94565) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!95058)))

(declare-fun b!60925 () Bool)

(declare-fun res!50803 () Bool)

(assert (=> b!60925 (=> (not res!50803) (not e!40653))))

(assert (=> b!60925 (= res!50803 (isPrefixOf!0 (_2!2874 lt!94565) (_2!2874 lt!95058)))))

(declare-fun b!60926 () Bool)

(assert (=> b!60926 (= e!40655 (validate_offset_bits!1 ((_ sign_extend 32) (size!1257 (buf!1638 (_2!2874 lt!94565)))) ((_ sign_extend 32) (currentByte!3256 (_2!2874 lt!94565))) ((_ sign_extend 32) (currentBit!3251 (_2!2874 lt!94565))) lt!95043))))

(declare-fun b!60927 () Bool)

(declare-fun res!50804 () Bool)

(assert (=> b!60927 (=> (not res!50804) (not e!40653))))

(assert (=> b!60927 (= res!50804 (= (size!1257 (buf!1638 (_2!2874 lt!95058))) (size!1257 (buf!1638 (_2!2874 lt!94565)))))))

(declare-fun b!60928 () Bool)

(declare-fun res!50806 () Bool)

(assert (=> b!60928 (=> (not res!50806) (not e!40653))))

(assert (=> b!60928 (= res!50806 (invariant!0 (currentBit!3251 (_2!2874 lt!95058)) (currentByte!3256 (_2!2874 lt!95058)) (size!1257 (buf!1638 (_2!2874 lt!95058)))))))

(declare-fun b!60929 () Bool)

(declare-fun Unit!4142 () Unit!4137)

(assert (=> b!60929 (= e!40654 (tuple2!5527 Unit!4142 (_2!2874 lt!94565)))))

(assert (=> b!60929 (= (size!1257 (buf!1638 (_2!2874 lt!94565))) (size!1257 (buf!1638 (_2!2874 lt!94565))))))

(declare-fun lt!95073 () Unit!4137)

(declare-fun Unit!4143 () Unit!4137)

(assert (=> b!60929 (= lt!95073 Unit!4143)))

(declare-fun call!766 () tuple2!5528)

(declare-fun checkByteArrayBitContent!0 (BitStream!2202 array!2763 array!2763 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!5538 0))(
  ( (tuple2!5539 (_1!2880 array!2763) (_2!2880 BitStream!2202)) )
))
(declare-fun readBits!0 (BitStream!2202 (_ BitVec 64)) tuple2!5538)

(assert (=> b!60929 (checkByteArrayBitContent!0 (_2!2874 lt!94565) srcBuffer!2 (_1!2880 (readBits!0 (_1!2875 call!766) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!95048 () tuple2!5526)

(declare-fun bm!763 () Bool)

(assert (=> bm!763 (= call!766 (reader!0 (_2!2874 lt!94565) (ite c!4257 (_2!2874 lt!95048) (_2!2874 lt!94565))))))

(declare-fun b!60930 () Bool)

(declare-fun Unit!4144 () Unit!4137)

(assert (=> b!60930 (= e!40654 (tuple2!5527 Unit!4144 (_2!2874 lt!95048)))))

(declare-fun lt!95070 () tuple2!5526)

(assert (=> b!60930 (= lt!95070 (appendBitFromByte!0 (_2!2874 lt!94565) (select (arr!1821 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!95040 () (_ BitVec 64))

(assert (=> b!60930 (= lt!95040 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!95067 () (_ BitVec 64))

(assert (=> b!60930 (= lt!95067 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!95062 () Unit!4137)

(assert (=> b!60930 (= lt!95062 (validateOffsetBitsIneqLemma!0 (_2!2874 lt!94565) (_2!2874 lt!95070) lt!95040 lt!95067))))

(assert (=> b!60930 (validate_offset_bits!1 ((_ sign_extend 32) (size!1257 (buf!1638 (_2!2874 lt!95070)))) ((_ sign_extend 32) (currentByte!3256 (_2!2874 lt!95070))) ((_ sign_extend 32) (currentBit!3251 (_2!2874 lt!95070))) (bvsub lt!95040 lt!95067))))

(declare-fun lt!95050 () Unit!4137)

(assert (=> b!60930 (= lt!95050 lt!95062)))

(declare-fun lt!95060 () tuple2!5528)

(assert (=> b!60930 (= lt!95060 (reader!0 (_2!2874 lt!94565) (_2!2874 lt!95070)))))

(declare-fun lt!95052 () (_ BitVec 64))

(assert (=> b!60930 (= lt!95052 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!95072 () Unit!4137)

(assert (=> b!60930 (= lt!95072 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2874 lt!94565) (buf!1638 (_2!2874 lt!95070)) lt!95052))))

(assert (=> b!60930 (validate_offset_bits!1 ((_ sign_extend 32) (size!1257 (buf!1638 (_2!2874 lt!95070)))) ((_ sign_extend 32) (currentByte!3256 (_2!2874 lt!94565))) ((_ sign_extend 32) (currentBit!3251 (_2!2874 lt!94565))) lt!95052)))

(declare-fun lt!95081 () Unit!4137)

(assert (=> b!60930 (= lt!95081 lt!95072)))

(assert (=> b!60930 (= (head!495 (byteArrayBitContentToList!0 (_2!2874 lt!95070) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!495 (bitStreamReadBitsIntoList!0 (_2!2874 lt!95070) (_1!2875 lt!95060) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!95042 () Unit!4137)

(declare-fun Unit!4145 () Unit!4137)

(assert (=> b!60930 (= lt!95042 Unit!4145)))

(assert (=> b!60930 (= lt!95048 (appendBitsMSBFirstLoop!0 (_2!2874 lt!95070) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!95066 () Unit!4137)

(assert (=> b!60930 (= lt!95066 (lemmaIsPrefixTransitive!0 (_2!2874 lt!94565) (_2!2874 lt!95070) (_2!2874 lt!95048)))))

(assert (=> b!60930 (isPrefixOf!0 (_2!2874 lt!94565) (_2!2874 lt!95048))))

(declare-fun lt!95076 () Unit!4137)

(assert (=> b!60930 (= lt!95076 lt!95066)))

(assert (=> b!60930 (= (size!1257 (buf!1638 (_2!2874 lt!95048))) (size!1257 (buf!1638 (_2!2874 lt!94565))))))

(declare-fun lt!95069 () Unit!4137)

(declare-fun Unit!4146 () Unit!4137)

(assert (=> b!60930 (= lt!95069 Unit!4146)))

(assert (=> b!60930 (= (bitIndex!0 (size!1257 (buf!1638 (_2!2874 lt!95048))) (currentByte!3256 (_2!2874 lt!95048)) (currentBit!3251 (_2!2874 lt!95048))) (bvsub (bvadd (bitIndex!0 (size!1257 (buf!1638 (_2!2874 lt!94565))) (currentByte!3256 (_2!2874 lt!94565)) (currentBit!3251 (_2!2874 lt!94565))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!95079 () Unit!4137)

(declare-fun Unit!4147 () Unit!4137)

(assert (=> b!60930 (= lt!95079 Unit!4147)))

(assert (=> b!60930 (= (bitIndex!0 (size!1257 (buf!1638 (_2!2874 lt!95048))) (currentByte!3256 (_2!2874 lt!95048)) (currentBit!3251 (_2!2874 lt!95048))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1257 (buf!1638 (_2!2874 lt!95070))) (currentByte!3256 (_2!2874 lt!95070)) (currentBit!3251 (_2!2874 lt!95070))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!95077 () Unit!4137)

(declare-fun Unit!4148 () Unit!4137)

(assert (=> b!60930 (= lt!95077 Unit!4148)))

(declare-fun lt!95061 () tuple2!5528)

(assert (=> b!60930 (= lt!95061 call!766)))

(declare-fun lt!95063 () (_ BitVec 64))

(assert (=> b!60930 (= lt!95063 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!95080 () Unit!4137)

(assert (=> b!60930 (= lt!95080 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2874 lt!94565) (buf!1638 (_2!2874 lt!95048)) lt!95063))))

(assert (=> b!60930 (validate_offset_bits!1 ((_ sign_extend 32) (size!1257 (buf!1638 (_2!2874 lt!95048)))) ((_ sign_extend 32) (currentByte!3256 (_2!2874 lt!94565))) ((_ sign_extend 32) (currentBit!3251 (_2!2874 lt!94565))) lt!95063)))

(declare-fun lt!95078 () Unit!4137)

(assert (=> b!60930 (= lt!95078 lt!95080)))

(declare-fun lt!95049 () tuple2!5528)

(assert (=> b!60930 (= lt!95049 (reader!0 (_2!2874 lt!95070) (_2!2874 lt!95048)))))

(declare-fun lt!95074 () (_ BitVec 64))

(assert (=> b!60930 (= lt!95074 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!95051 () Unit!4137)

(assert (=> b!60930 (= lt!95051 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2874 lt!95070) (buf!1638 (_2!2874 lt!95048)) lt!95074))))

(assert (=> b!60930 (validate_offset_bits!1 ((_ sign_extend 32) (size!1257 (buf!1638 (_2!2874 lt!95048)))) ((_ sign_extend 32) (currentByte!3256 (_2!2874 lt!95070))) ((_ sign_extend 32) (currentBit!3251 (_2!2874 lt!95070))) lt!95074)))

(declare-fun lt!95071 () Unit!4137)

(assert (=> b!60930 (= lt!95071 lt!95051)))

(declare-fun lt!95056 () List!676)

(assert (=> b!60930 (= lt!95056 (byteArrayBitContentToList!0 (_2!2874 lt!95048) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!95055 () List!676)

(assert (=> b!60930 (= lt!95055 (byteArrayBitContentToList!0 (_2!2874 lt!95048) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!95075 () List!676)

(assert (=> b!60930 (= lt!95075 (bitStreamReadBitsIntoList!0 (_2!2874 lt!95048) (_1!2875 lt!95061) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!95057 () List!676)

(assert (=> b!60930 (= lt!95057 (bitStreamReadBitsIntoList!0 (_2!2874 lt!95048) (_1!2875 lt!95049) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!95041 () (_ BitVec 64))

(assert (=> b!60930 (= lt!95041 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!95053 () Unit!4137)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2202 BitStream!2202 BitStream!2202 BitStream!2202 (_ BitVec 64) List!676) Unit!4137)

(assert (=> b!60930 (= lt!95053 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2874 lt!95048) (_2!2874 lt!95048) (_1!2875 lt!95061) (_1!2875 lt!95049) lt!95041 lt!95075))))

(declare-fun tail!282 (List!676) List!676)

(assert (=> b!60930 (= (bitStreamReadBitsIntoList!0 (_2!2874 lt!95048) (_1!2875 lt!95049) (bvsub lt!95041 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!282 lt!95075))))

(declare-fun lt!95064 () Unit!4137)

(assert (=> b!60930 (= lt!95064 lt!95053)))

(declare-fun lt!95044 () Unit!4137)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2763 array!2763 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4137)

(assert (=> b!60930 (= lt!95044 (arrayBitRangesEqImpliesEq!0 (buf!1638 (_2!2874 lt!95070)) (buf!1638 (_2!2874 lt!95048)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!95047 (bitIndex!0 (size!1257 (buf!1638 (_2!2874 lt!95070))) (currentByte!3256 (_2!2874 lt!95070)) (currentBit!3251 (_2!2874 lt!95070)))))))

(declare-fun bitAt!0 (array!2763 (_ BitVec 64)) Bool)

(assert (=> b!60930 (= (bitAt!0 (buf!1638 (_2!2874 lt!95070)) lt!95047) (bitAt!0 (buf!1638 (_2!2874 lt!95048)) lt!95047))))

(declare-fun lt!95039 () Unit!4137)

(assert (=> b!60930 (= lt!95039 lt!95044)))

(declare-fun b!60931 () Bool)

(declare-fun res!50807 () Bool)

(assert (=> b!60931 (=> (not res!50807) (not e!40653))))

(assert (=> b!60931 (= res!50807 (= (size!1257 (buf!1638 (_2!2874 lt!94565))) (size!1257 (buf!1638 (_2!2874 lt!95058)))))))

(assert (= (and d!18624 c!4257) b!60930))

(assert (= (and d!18624 (not c!4257)) b!60929))

(assert (= (or b!60930 b!60929) bm!763))

(assert (= (and d!18624 res!50802) b!60928))

(assert (= (and b!60928 res!50806) b!60931))

(assert (= (and b!60931 res!50807) b!60925))

(assert (= (and b!60925 res!50803) b!60927))

(assert (= (and b!60927 res!50804) b!60924))

(assert (= (and b!60924 res!50805) b!60926))

(declare-fun m!95991 () Bool)

(assert (=> b!60928 m!95991))

(declare-fun m!95993 () Bool)

(assert (=> b!60930 m!95993))

(declare-fun m!95995 () Bool)

(assert (=> b!60930 m!95995))

(declare-fun m!95997 () Bool)

(assert (=> b!60930 m!95997))

(declare-fun m!95999 () Bool)

(assert (=> b!60930 m!95999))

(declare-fun m!96001 () Bool)

(assert (=> b!60930 m!96001))

(declare-fun m!96003 () Bool)

(assert (=> b!60930 m!96003))

(declare-fun m!96005 () Bool)

(assert (=> b!60930 m!96005))

(declare-fun m!96007 () Bool)

(assert (=> b!60930 m!96007))

(declare-fun m!96009 () Bool)

(assert (=> b!60930 m!96009))

(declare-fun m!96011 () Bool)

(assert (=> b!60930 m!96011))

(declare-fun m!96013 () Bool)

(assert (=> b!60930 m!96013))

(declare-fun m!96015 () Bool)

(assert (=> b!60930 m!96015))

(declare-fun m!96017 () Bool)

(assert (=> b!60930 m!96017))

(assert (=> b!60930 m!96005))

(declare-fun m!96019 () Bool)

(assert (=> b!60930 m!96019))

(declare-fun m!96021 () Bool)

(assert (=> b!60930 m!96021))

(declare-fun m!96023 () Bool)

(assert (=> b!60930 m!96023))

(assert (=> b!60930 m!96011))

(declare-fun m!96025 () Bool)

(assert (=> b!60930 m!96025))

(declare-fun m!96027 () Bool)

(assert (=> b!60930 m!96027))

(declare-fun m!96029 () Bool)

(assert (=> b!60930 m!96029))

(declare-fun m!96031 () Bool)

(assert (=> b!60930 m!96031))

(assert (=> b!60930 m!95649))

(declare-fun m!96033 () Bool)

(assert (=> b!60930 m!96033))

(declare-fun m!96035 () Bool)

(assert (=> b!60930 m!96035))

(declare-fun m!96037 () Bool)

(assert (=> b!60930 m!96037))

(declare-fun m!96039 () Bool)

(assert (=> b!60930 m!96039))

(assert (=> b!60930 m!96021))

(declare-fun m!96041 () Bool)

(assert (=> b!60930 m!96041))

(assert (=> b!60930 m!96001))

(declare-fun m!96043 () Bool)

(assert (=> b!60930 m!96043))

(declare-fun m!96045 () Bool)

(assert (=> b!60930 m!96045))

(declare-fun m!96047 () Bool)

(assert (=> b!60930 m!96047))

(declare-fun m!96049 () Bool)

(assert (=> b!60930 m!96049))

(declare-fun m!96051 () Bool)

(assert (=> b!60930 m!96051))

(declare-fun m!96053 () Bool)

(assert (=> b!60930 m!96053))

(declare-fun m!96055 () Bool)

(assert (=> d!18624 m!96055))

(assert (=> d!18624 m!95649))

(assert (=> d!18624 m!95797))

(assert (=> d!18624 m!95809))

(declare-fun m!96057 () Bool)

(assert (=> b!60926 m!96057))

(declare-fun m!96059 () Bool)

(assert (=> b!60924 m!96059))

(declare-fun m!96061 () Bool)

(assert (=> b!60924 m!96061))

(declare-fun m!96063 () Bool)

(assert (=> b!60924 m!96063))

(declare-fun m!96065 () Bool)

(assert (=> b!60924 m!96065))

(declare-fun m!96067 () Bool)

(assert (=> b!60924 m!96067))

(declare-fun m!96069 () Bool)

(assert (=> b!60925 m!96069))

(declare-fun m!96071 () Bool)

(assert (=> bm!763 m!96071))

(declare-fun m!96073 () Bool)

(assert (=> b!60929 m!96073))

(declare-fun m!96075 () Bool)

(assert (=> b!60929 m!96075))

(assert (=> b!60690 d!18624))

(declare-fun d!18696 () Bool)

(declare-fun res!50808 () Bool)

(declare-fun e!40657 () Bool)

(assert (=> d!18696 (=> (not res!50808) (not e!40657))))

(assert (=> d!18696 (= res!50808 (= (size!1257 (buf!1638 thiss!1379)) (size!1257 (buf!1638 (_2!2874 lt!94575)))))))

(assert (=> d!18696 (= (isPrefixOf!0 thiss!1379 (_2!2874 lt!94575)) e!40657)))

(declare-fun b!60932 () Bool)

(declare-fun res!50809 () Bool)

(assert (=> b!60932 (=> (not res!50809) (not e!40657))))

(assert (=> b!60932 (= res!50809 (bvsle (bitIndex!0 (size!1257 (buf!1638 thiss!1379)) (currentByte!3256 thiss!1379) (currentBit!3251 thiss!1379)) (bitIndex!0 (size!1257 (buf!1638 (_2!2874 lt!94575))) (currentByte!3256 (_2!2874 lt!94575)) (currentBit!3251 (_2!2874 lt!94575)))))))

(declare-fun b!60933 () Bool)

(declare-fun e!40656 () Bool)

(assert (=> b!60933 (= e!40657 e!40656)))

(declare-fun res!50810 () Bool)

(assert (=> b!60933 (=> res!50810 e!40656)))

(assert (=> b!60933 (= res!50810 (= (size!1257 (buf!1638 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!60934 () Bool)

(assert (=> b!60934 (= e!40656 (arrayBitRangesEq!0 (buf!1638 thiss!1379) (buf!1638 (_2!2874 lt!94575)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1257 (buf!1638 thiss!1379)) (currentByte!3256 thiss!1379) (currentBit!3251 thiss!1379))))))

(assert (= (and d!18696 res!50808) b!60932))

(assert (= (and b!60932 res!50809) b!60933))

(assert (= (and b!60933 (not res!50810)) b!60934))

(assert (=> b!60932 m!95671))

(assert (=> b!60932 m!95657))

(assert (=> b!60934 m!95671))

(assert (=> b!60934 m!95671))

(declare-fun m!96077 () Bool)

(assert (=> b!60934 m!96077))

(assert (=> b!60690 d!18696))

(declare-fun d!18698 () Bool)

(declare-fun res!50811 () Bool)

(declare-fun e!40659 () Bool)

(assert (=> d!18698 (=> (not res!50811) (not e!40659))))

(assert (=> d!18698 (= res!50811 (= (size!1257 (buf!1638 (_2!2874 lt!94565))) (size!1257 (buf!1638 (_2!2874 lt!94575)))))))

(assert (=> d!18698 (= (isPrefixOf!0 (_2!2874 lt!94565) (_2!2874 lt!94575)) e!40659)))

(declare-fun b!60935 () Bool)

(declare-fun res!50812 () Bool)

(assert (=> b!60935 (=> (not res!50812) (not e!40659))))

(assert (=> b!60935 (= res!50812 (bvsle (bitIndex!0 (size!1257 (buf!1638 (_2!2874 lt!94565))) (currentByte!3256 (_2!2874 lt!94565)) (currentBit!3251 (_2!2874 lt!94565))) (bitIndex!0 (size!1257 (buf!1638 (_2!2874 lt!94575))) (currentByte!3256 (_2!2874 lt!94575)) (currentBit!3251 (_2!2874 lt!94575)))))))

(declare-fun b!60936 () Bool)

(declare-fun e!40658 () Bool)

(assert (=> b!60936 (= e!40659 e!40658)))

(declare-fun res!50813 () Bool)

(assert (=> b!60936 (=> res!50813 e!40658)))

(assert (=> b!60936 (= res!50813 (= (size!1257 (buf!1638 (_2!2874 lt!94565))) #b00000000000000000000000000000000))))

(declare-fun b!60937 () Bool)

(assert (=> b!60937 (= e!40658 (arrayBitRangesEq!0 (buf!1638 (_2!2874 lt!94565)) (buf!1638 (_2!2874 lt!94575)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1257 (buf!1638 (_2!2874 lt!94565))) (currentByte!3256 (_2!2874 lt!94565)) (currentBit!3251 (_2!2874 lt!94565)))))))

(assert (= (and d!18698 res!50811) b!60935))

(assert (= (and b!60935 res!50812) b!60936))

(assert (= (and b!60936 (not res!50813)) b!60937))

(assert (=> b!60935 m!95649))

(assert (=> b!60935 m!95657))

(assert (=> b!60937 m!95649))

(assert (=> b!60937 m!95649))

(declare-fun m!96079 () Bool)

(assert (=> b!60937 m!96079))

(assert (=> b!60690 d!18698))

(declare-fun d!18700 () Bool)

(declare-fun e!40660 () Bool)

(assert (=> d!18700 e!40660))

(declare-fun res!50815 () Bool)

(assert (=> d!18700 (=> (not res!50815) (not e!40660))))

(declare-fun lt!95084 () (_ BitVec 64))

(declare-fun lt!95085 () (_ BitVec 64))

(declare-fun lt!95083 () (_ BitVec 64))

(assert (=> d!18700 (= res!50815 (= lt!95083 (bvsub lt!95085 lt!95084)))))

(assert (=> d!18700 (or (= (bvand lt!95085 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!95084 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!95085 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!95085 lt!95084) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18700 (= lt!95084 (remainingBits!0 ((_ sign_extend 32) (size!1257 (buf!1638 (_2!2874 lt!94565)))) ((_ sign_extend 32) (currentByte!3256 (_2!2874 lt!94565))) ((_ sign_extend 32) (currentBit!3251 (_2!2874 lt!94565)))))))

(declare-fun lt!95082 () (_ BitVec 64))

(declare-fun lt!95087 () (_ BitVec 64))

(assert (=> d!18700 (= lt!95085 (bvmul lt!95082 lt!95087))))

(assert (=> d!18700 (or (= lt!95082 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!95087 (bvsdiv (bvmul lt!95082 lt!95087) lt!95082)))))

(assert (=> d!18700 (= lt!95087 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18700 (= lt!95082 ((_ sign_extend 32) (size!1257 (buf!1638 (_2!2874 lt!94565)))))))

(assert (=> d!18700 (= lt!95083 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3256 (_2!2874 lt!94565))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3251 (_2!2874 lt!94565)))))))

(assert (=> d!18700 (invariant!0 (currentBit!3251 (_2!2874 lt!94565)) (currentByte!3256 (_2!2874 lt!94565)) (size!1257 (buf!1638 (_2!2874 lt!94565))))))

(assert (=> d!18700 (= (bitIndex!0 (size!1257 (buf!1638 (_2!2874 lt!94565))) (currentByte!3256 (_2!2874 lt!94565)) (currentBit!3251 (_2!2874 lt!94565))) lt!95083)))

(declare-fun b!60938 () Bool)

(declare-fun res!50814 () Bool)

(assert (=> b!60938 (=> (not res!50814) (not e!40660))))

(assert (=> b!60938 (= res!50814 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!95083))))

(declare-fun b!60939 () Bool)

(declare-fun lt!95086 () (_ BitVec 64))

(assert (=> b!60939 (= e!40660 (bvsle lt!95083 (bvmul lt!95086 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!60939 (or (= lt!95086 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!95086 #b0000000000000000000000000000000000000000000000000000000000001000) lt!95086)))))

(assert (=> b!60939 (= lt!95086 ((_ sign_extend 32) (size!1257 (buf!1638 (_2!2874 lt!94565)))))))

(assert (= (and d!18700 res!50815) b!60938))

(assert (= (and b!60938 res!50814) b!60939))

(declare-fun m!96081 () Bool)

(assert (=> d!18700 m!96081))

(assert (=> d!18700 m!95655))

(assert (=> b!60679 d!18700))

(declare-fun d!18702 () Bool)

(declare-fun e!40661 () Bool)

(assert (=> d!18702 e!40661))

(declare-fun res!50817 () Bool)

(assert (=> d!18702 (=> (not res!50817) (not e!40661))))

(declare-fun lt!95091 () (_ BitVec 64))

(declare-fun lt!95090 () (_ BitVec 64))

(declare-fun lt!95089 () (_ BitVec 64))

(assert (=> d!18702 (= res!50817 (= lt!95089 (bvsub lt!95091 lt!95090)))))

(assert (=> d!18702 (or (= (bvand lt!95091 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!95090 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!95091 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!95091 lt!95090) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18702 (= lt!95090 (remainingBits!0 ((_ sign_extend 32) (size!1257 (buf!1638 (_2!2874 lt!94575)))) ((_ sign_extend 32) (currentByte!3256 (_2!2874 lt!94575))) ((_ sign_extend 32) (currentBit!3251 (_2!2874 lt!94575)))))))

(declare-fun lt!95088 () (_ BitVec 64))

(declare-fun lt!95093 () (_ BitVec 64))

(assert (=> d!18702 (= lt!95091 (bvmul lt!95088 lt!95093))))

(assert (=> d!18702 (or (= lt!95088 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!95093 (bvsdiv (bvmul lt!95088 lt!95093) lt!95088)))))

(assert (=> d!18702 (= lt!95093 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18702 (= lt!95088 ((_ sign_extend 32) (size!1257 (buf!1638 (_2!2874 lt!94575)))))))

(assert (=> d!18702 (= lt!95089 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3256 (_2!2874 lt!94575))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3251 (_2!2874 lt!94575)))))))

(assert (=> d!18702 (invariant!0 (currentBit!3251 (_2!2874 lt!94575)) (currentByte!3256 (_2!2874 lt!94575)) (size!1257 (buf!1638 (_2!2874 lt!94575))))))

(assert (=> d!18702 (= (bitIndex!0 (size!1257 (buf!1638 (_2!2874 lt!94575))) (currentByte!3256 (_2!2874 lt!94575)) (currentBit!3251 (_2!2874 lt!94575))) lt!95089)))

(declare-fun b!60940 () Bool)

(declare-fun res!50816 () Bool)

(assert (=> b!60940 (=> (not res!50816) (not e!40661))))

(assert (=> b!60940 (= res!50816 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!95089))))

(declare-fun b!60941 () Bool)

(declare-fun lt!95092 () (_ BitVec 64))

(assert (=> b!60941 (= e!40661 (bvsle lt!95089 (bvmul lt!95092 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!60941 (or (= lt!95092 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!95092 #b0000000000000000000000000000000000000000000000000000000000001000) lt!95092)))))

(assert (=> b!60941 (= lt!95092 ((_ sign_extend 32) (size!1257 (buf!1638 (_2!2874 lt!94575)))))))

(assert (= (and d!18702 res!50817) b!60940))

(assert (= (and b!60940 res!50816) b!60941))

(declare-fun m!96083 () Bool)

(assert (=> d!18702 m!96083))

(assert (=> d!18702 m!95687))

(assert (=> b!60683 d!18702))

(declare-fun d!18704 () Bool)

(declare-fun res!50818 () Bool)

(declare-fun e!40663 () Bool)

(assert (=> d!18704 (=> (not res!50818) (not e!40663))))

(assert (=> d!18704 (= res!50818 (= (size!1257 (buf!1638 thiss!1379)) (size!1257 (buf!1638 (_2!2874 lt!94565)))))))

(assert (=> d!18704 (= (isPrefixOf!0 thiss!1379 (_2!2874 lt!94565)) e!40663)))

(declare-fun b!60942 () Bool)

(declare-fun res!50819 () Bool)

(assert (=> b!60942 (=> (not res!50819) (not e!40663))))

(assert (=> b!60942 (= res!50819 (bvsle (bitIndex!0 (size!1257 (buf!1638 thiss!1379)) (currentByte!3256 thiss!1379) (currentBit!3251 thiss!1379)) (bitIndex!0 (size!1257 (buf!1638 (_2!2874 lt!94565))) (currentByte!3256 (_2!2874 lt!94565)) (currentBit!3251 (_2!2874 lt!94565)))))))

(declare-fun b!60943 () Bool)

(declare-fun e!40662 () Bool)

(assert (=> b!60943 (= e!40663 e!40662)))

(declare-fun res!50820 () Bool)

(assert (=> b!60943 (=> res!50820 e!40662)))

(assert (=> b!60943 (= res!50820 (= (size!1257 (buf!1638 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!60944 () Bool)

(assert (=> b!60944 (= e!40662 (arrayBitRangesEq!0 (buf!1638 thiss!1379) (buf!1638 (_2!2874 lt!94565)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1257 (buf!1638 thiss!1379)) (currentByte!3256 thiss!1379) (currentBit!3251 thiss!1379))))))

(assert (= (and d!18704 res!50818) b!60942))

(assert (= (and b!60942 res!50819) b!60943))

(assert (= (and b!60943 (not res!50820)) b!60944))

(assert (=> b!60942 m!95671))

(assert (=> b!60942 m!95649))

(assert (=> b!60944 m!95671))

(assert (=> b!60944 m!95671))

(declare-fun m!96085 () Bool)

(assert (=> b!60944 m!96085))

(assert (=> b!60682 d!18704))

(declare-fun d!18706 () Bool)

(assert (=> d!18706 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1257 (buf!1638 (_2!2874 lt!94565)))) ((_ sign_extend 32) (currentByte!3256 (_2!2874 lt!94565))) ((_ sign_extend 32) (currentBit!3251 (_2!2874 lt!94565))) lt!94573) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1257 (buf!1638 (_2!2874 lt!94565)))) ((_ sign_extend 32) (currentByte!3256 (_2!2874 lt!94565))) ((_ sign_extend 32) (currentBit!3251 (_2!2874 lt!94565)))) lt!94573))))

(declare-fun bs!4685 () Bool)

(assert (= bs!4685 d!18706))

(assert (=> bs!4685 m!96081))

(assert (=> b!60682 d!18706))

(declare-fun d!18708 () Bool)

(declare-fun e!40666 () Bool)

(assert (=> d!18708 e!40666))

(declare-fun res!50823 () Bool)

(assert (=> d!18708 (=> (not res!50823) (not e!40666))))

(assert (=> d!18708 (= res!50823 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!95096 () Unit!4137)

(declare-fun choose!27 (BitStream!2202 BitStream!2202 (_ BitVec 64) (_ BitVec 64)) Unit!4137)

(assert (=> d!18708 (= lt!95096 (choose!27 thiss!1379 (_2!2874 lt!94565) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!18708 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!18708 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2874 lt!94565) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!95096)))

(declare-fun b!60947 () Bool)

(assert (=> b!60947 (= e!40666 (validate_offset_bits!1 ((_ sign_extend 32) (size!1257 (buf!1638 (_2!2874 lt!94565)))) ((_ sign_extend 32) (currentByte!3256 (_2!2874 lt!94565))) ((_ sign_extend 32) (currentBit!3251 (_2!2874 lt!94565))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!18708 res!50823) b!60947))

(declare-fun m!96087 () Bool)

(assert (=> d!18708 m!96087))

(declare-fun m!96089 () Bool)

(assert (=> b!60947 m!96089))

(assert (=> b!60682 d!18708))

(declare-fun b!60969 () Bool)

(declare-fun e!40679 () Bool)

(declare-datatypes ((tuple2!5540 0))(
  ( (tuple2!5541 (_1!2881 BitStream!2202) (_2!2881 Bool)) )
))
(declare-fun lt!95162 () tuple2!5540)

(declare-fun lt!95154 () tuple2!5526)

(assert (=> b!60969 (= e!40679 (= (bitIndex!0 (size!1257 (buf!1638 (_1!2881 lt!95162))) (currentByte!3256 (_1!2881 lt!95162)) (currentBit!3251 (_1!2881 lt!95162))) (bitIndex!0 (size!1257 (buf!1638 (_2!2874 lt!95154))) (currentByte!3256 (_2!2874 lt!95154)) (currentBit!3251 (_2!2874 lt!95154)))))))

(declare-fun b!60970 () Bool)

(declare-fun e!40677 () Bool)

(declare-fun e!40678 () Bool)

(assert (=> b!60970 (= e!40677 e!40678)))

(declare-fun res!50843 () Bool)

(assert (=> b!60970 (=> (not res!50843) (not e!40678))))

(declare-fun lt!95158 () (_ BitVec 8))

(declare-fun lt!95159 () tuple2!5540)

(declare-fun lt!95152 () tuple2!5526)

(assert (=> b!60970 (= res!50843 (and (= (_2!2881 lt!95159) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1821 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!95158)) #b00000000000000000000000000000000))) (= (_1!2881 lt!95159) (_2!2874 lt!95152))))))

(declare-fun lt!95156 () tuple2!5538)

(declare-fun lt!95160 () BitStream!2202)

(assert (=> b!60970 (= lt!95156 (readBits!0 lt!95160 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!2202) tuple2!5540)

(assert (=> b!60970 (= lt!95159 (readBitPure!0 lt!95160))))

(declare-fun readerFrom!0 (BitStream!2202 (_ BitVec 32) (_ BitVec 32)) BitStream!2202)

(assert (=> b!60970 (= lt!95160 (readerFrom!0 (_2!2874 lt!95152) (currentBit!3251 thiss!1379) (currentByte!3256 thiss!1379)))))

(declare-fun b!60971 () Bool)

(declare-fun e!40680 () Bool)

(assert (=> b!60971 (= e!40680 e!40679)))

(declare-fun res!50845 () Bool)

(assert (=> b!60971 (=> (not res!50845) (not e!40679))))

(declare-fun lt!95157 () Bool)

(assert (=> b!60971 (= res!50845 (and (= (_2!2881 lt!95162) lt!95157) (= (_1!2881 lt!95162) (_2!2874 lt!95154))))))

(assert (=> b!60971 (= lt!95162 (readBitPure!0 (readerFrom!0 (_2!2874 lt!95154) (currentBit!3251 thiss!1379) (currentByte!3256 thiss!1379))))))

(declare-fun d!18710 () Bool)

(assert (=> d!18710 e!40677))

(declare-fun res!50844 () Bool)

(assert (=> d!18710 (=> (not res!50844) (not e!40677))))

(assert (=> d!18710 (= res!50844 (= (size!1257 (buf!1638 (_2!2874 lt!95152))) (size!1257 (buf!1638 thiss!1379))))))

(declare-fun lt!95155 () array!2763)

(assert (=> d!18710 (= lt!95158 (select (arr!1821 lt!95155) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!18710 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1257 lt!95155)))))

(assert (=> d!18710 (= lt!95155 (array!2764 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!95151 () tuple2!5526)

(assert (=> d!18710 (= lt!95152 (tuple2!5527 (_1!2874 lt!95151) (_2!2874 lt!95151)))))

(assert (=> d!18710 (= lt!95151 lt!95154)))

(assert (=> d!18710 e!40680))

(declare-fun res!50840 () Bool)

(assert (=> d!18710 (=> (not res!50840) (not e!40680))))

(assert (=> d!18710 (= res!50840 (= (size!1257 (buf!1638 thiss!1379)) (size!1257 (buf!1638 (_2!2874 lt!95154)))))))

(declare-fun appendBit!0 (BitStream!2202 Bool) tuple2!5526)

(assert (=> d!18710 (= lt!95154 (appendBit!0 thiss!1379 lt!95157))))

(assert (=> d!18710 (= lt!95157 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1821 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!18710 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!18710 (= (appendBitFromByte!0 thiss!1379 (select (arr!1821 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!95152)))

(declare-fun b!60972 () Bool)

(declare-fun res!50847 () Bool)

(assert (=> b!60972 (=> (not res!50847) (not e!40680))))

(assert (=> b!60972 (= res!50847 (= (bitIndex!0 (size!1257 (buf!1638 (_2!2874 lt!95154))) (currentByte!3256 (_2!2874 lt!95154)) (currentBit!3251 (_2!2874 lt!95154))) (bvadd (bitIndex!0 (size!1257 (buf!1638 thiss!1379)) (currentByte!3256 thiss!1379) (currentBit!3251 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!60973 () Bool)

(declare-fun res!50846 () Bool)

(assert (=> b!60973 (=> (not res!50846) (not e!40680))))

(assert (=> b!60973 (= res!50846 (isPrefixOf!0 thiss!1379 (_2!2874 lt!95154)))))

(declare-fun b!60974 () Bool)

(assert (=> b!60974 (= e!40678 (= (bitIndex!0 (size!1257 (buf!1638 (_1!2881 lt!95159))) (currentByte!3256 (_1!2881 lt!95159)) (currentBit!3251 (_1!2881 lt!95159))) (bitIndex!0 (size!1257 (buf!1638 (_2!2874 lt!95152))) (currentByte!3256 (_2!2874 lt!95152)) (currentBit!3251 (_2!2874 lt!95152)))))))

(declare-fun b!60975 () Bool)

(declare-fun res!50841 () Bool)

(assert (=> b!60975 (=> (not res!50841) (not e!40677))))

(declare-fun lt!95161 () (_ BitVec 64))

(declare-fun lt!95153 () (_ BitVec 64))

(assert (=> b!60975 (= res!50841 (= (bitIndex!0 (size!1257 (buf!1638 (_2!2874 lt!95152))) (currentByte!3256 (_2!2874 lt!95152)) (currentBit!3251 (_2!2874 lt!95152))) (bvadd lt!95161 lt!95153)))))

(assert (=> b!60975 (or (not (= (bvand lt!95161 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!95153 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!95161 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!95161 lt!95153) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!60975 (= lt!95153 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!60975 (= lt!95161 (bitIndex!0 (size!1257 (buf!1638 thiss!1379)) (currentByte!3256 thiss!1379) (currentBit!3251 thiss!1379)))))

(declare-fun b!60976 () Bool)

(declare-fun res!50842 () Bool)

(assert (=> b!60976 (=> (not res!50842) (not e!40677))))

(assert (=> b!60976 (= res!50842 (isPrefixOf!0 thiss!1379 (_2!2874 lt!95152)))))

(assert (= (and d!18710 res!50840) b!60972))

(assert (= (and b!60972 res!50847) b!60973))

(assert (= (and b!60973 res!50846) b!60971))

(assert (= (and b!60971 res!50845) b!60969))

(assert (= (and d!18710 res!50844) b!60975))

(assert (= (and b!60975 res!50841) b!60976))

(assert (= (and b!60976 res!50842) b!60970))

(assert (= (and b!60970 res!50843) b!60974))

(declare-fun m!96091 () Bool)

(assert (=> b!60971 m!96091))

(assert (=> b!60971 m!96091))

(declare-fun m!96093 () Bool)

(assert (=> b!60971 m!96093))

(declare-fun m!96095 () Bool)

(assert (=> b!60969 m!96095))

(declare-fun m!96097 () Bool)

(assert (=> b!60969 m!96097))

(declare-fun m!96099 () Bool)

(assert (=> b!60975 m!96099))

(assert (=> b!60975 m!95671))

(declare-fun m!96101 () Bool)

(assert (=> b!60973 m!96101))

(assert (=> b!60972 m!96097))

(assert (=> b!60972 m!95671))

(declare-fun m!96103 () Bool)

(assert (=> b!60970 m!96103))

(declare-fun m!96105 () Bool)

(assert (=> b!60970 m!96105))

(declare-fun m!96107 () Bool)

(assert (=> b!60970 m!96107))

(declare-fun m!96109 () Bool)

(assert (=> b!60974 m!96109))

(assert (=> b!60974 m!96099))

(declare-fun m!96111 () Bool)

(assert (=> b!60976 m!96111))

(declare-fun m!96113 () Bool)

(assert (=> d!18710 m!96113))

(declare-fun m!96115 () Bool)

(assert (=> d!18710 m!96115))

(assert (=> d!18710 m!95781))

(assert (=> b!60682 d!18710))

(declare-fun b!60977 () Bool)

(declare-fun res!50848 () Bool)

(declare-fun e!40681 () Bool)

(assert (=> b!60977 (=> (not res!50848) (not e!40681))))

(declare-fun lt!95195 () tuple2!5528)

(assert (=> b!60977 (= res!50848 (isPrefixOf!0 (_1!2875 lt!95195) (_2!2874 lt!94565)))))

(declare-fun b!60978 () Bool)

(declare-fun res!50850 () Bool)

(assert (=> b!60978 (=> (not res!50850) (not e!40681))))

(assert (=> b!60978 (= res!50850 (isPrefixOf!0 (_2!2875 lt!95195) (_2!2874 lt!94575)))))

(declare-fun b!60979 () Bool)

(declare-fun e!40682 () Unit!4137)

(declare-fun lt!95212 () Unit!4137)

(assert (=> b!60979 (= e!40682 lt!95212)))

(declare-fun lt!95210 () (_ BitVec 64))

(assert (=> b!60979 (= lt!95210 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95202 () (_ BitVec 64))

(assert (=> b!60979 (= lt!95202 (bitIndex!0 (size!1257 (buf!1638 (_2!2874 lt!94565))) (currentByte!3256 (_2!2874 lt!94565)) (currentBit!3251 (_2!2874 lt!94565))))))

(assert (=> b!60979 (= lt!95212 (arrayBitRangesEqSymmetric!0 (buf!1638 (_2!2874 lt!94565)) (buf!1638 (_2!2874 lt!94575)) lt!95210 lt!95202))))

(assert (=> b!60979 (arrayBitRangesEq!0 (buf!1638 (_2!2874 lt!94575)) (buf!1638 (_2!2874 lt!94565)) lt!95210 lt!95202)))

(declare-fun b!60980 () Bool)

(declare-fun Unit!4149 () Unit!4137)

(assert (=> b!60980 (= e!40682 Unit!4149)))

(declare-fun lt!95206 () (_ BitVec 64))

(declare-fun lt!95193 () (_ BitVec 64))

(declare-fun b!60981 () Bool)

(assert (=> b!60981 (= e!40681 (= (_1!2875 lt!95195) (withMovedBitIndex!0 (_2!2875 lt!95195) (bvsub lt!95193 lt!95206))))))

(assert (=> b!60981 (or (= (bvand lt!95193 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!95206 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!95193 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!95193 lt!95206) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!60981 (= lt!95206 (bitIndex!0 (size!1257 (buf!1638 (_2!2874 lt!94575))) (currentByte!3256 (_2!2874 lt!94575)) (currentBit!3251 (_2!2874 lt!94575))))))

(assert (=> b!60981 (= lt!95193 (bitIndex!0 (size!1257 (buf!1638 (_2!2874 lt!94565))) (currentByte!3256 (_2!2874 lt!94565)) (currentBit!3251 (_2!2874 lt!94565))))))

(declare-fun d!18712 () Bool)

(assert (=> d!18712 e!40681))

(declare-fun res!50849 () Bool)

(assert (=> d!18712 (=> (not res!50849) (not e!40681))))

(assert (=> d!18712 (= res!50849 (isPrefixOf!0 (_1!2875 lt!95195) (_2!2875 lt!95195)))))

(declare-fun lt!95207 () BitStream!2202)

(assert (=> d!18712 (= lt!95195 (tuple2!5529 lt!95207 (_2!2874 lt!94575)))))

(declare-fun lt!95196 () Unit!4137)

(declare-fun lt!95204 () Unit!4137)

(assert (=> d!18712 (= lt!95196 lt!95204)))

(assert (=> d!18712 (isPrefixOf!0 lt!95207 (_2!2874 lt!94575))))

(assert (=> d!18712 (= lt!95204 (lemmaIsPrefixTransitive!0 lt!95207 (_2!2874 lt!94575) (_2!2874 lt!94575)))))

(declare-fun lt!95209 () Unit!4137)

(declare-fun lt!95200 () Unit!4137)

(assert (=> d!18712 (= lt!95209 lt!95200)))

(assert (=> d!18712 (isPrefixOf!0 lt!95207 (_2!2874 lt!94575))))

(assert (=> d!18712 (= lt!95200 (lemmaIsPrefixTransitive!0 lt!95207 (_2!2874 lt!94565) (_2!2874 lt!94575)))))

(declare-fun lt!95194 () Unit!4137)

(assert (=> d!18712 (= lt!95194 e!40682)))

(declare-fun c!4260 () Bool)

(assert (=> d!18712 (= c!4260 (not (= (size!1257 (buf!1638 (_2!2874 lt!94565))) #b00000000000000000000000000000000)))))

(declare-fun lt!95205 () Unit!4137)

(declare-fun lt!95197 () Unit!4137)

(assert (=> d!18712 (= lt!95205 lt!95197)))

(assert (=> d!18712 (isPrefixOf!0 (_2!2874 lt!94575) (_2!2874 lt!94575))))

(assert (=> d!18712 (= lt!95197 (lemmaIsPrefixRefl!0 (_2!2874 lt!94575)))))

(declare-fun lt!95203 () Unit!4137)

(declare-fun lt!95211 () Unit!4137)

(assert (=> d!18712 (= lt!95203 lt!95211)))

(assert (=> d!18712 (= lt!95211 (lemmaIsPrefixRefl!0 (_2!2874 lt!94575)))))

(declare-fun lt!95208 () Unit!4137)

(declare-fun lt!95199 () Unit!4137)

(assert (=> d!18712 (= lt!95208 lt!95199)))

(assert (=> d!18712 (isPrefixOf!0 lt!95207 lt!95207)))

(assert (=> d!18712 (= lt!95199 (lemmaIsPrefixRefl!0 lt!95207))))

(declare-fun lt!95201 () Unit!4137)

(declare-fun lt!95198 () Unit!4137)

(assert (=> d!18712 (= lt!95201 lt!95198)))

(assert (=> d!18712 (isPrefixOf!0 (_2!2874 lt!94565) (_2!2874 lt!94565))))

(assert (=> d!18712 (= lt!95198 (lemmaIsPrefixRefl!0 (_2!2874 lt!94565)))))

(assert (=> d!18712 (= lt!95207 (BitStream!2203 (buf!1638 (_2!2874 lt!94575)) (currentByte!3256 (_2!2874 lt!94565)) (currentBit!3251 (_2!2874 lt!94565))))))

(assert (=> d!18712 (isPrefixOf!0 (_2!2874 lt!94565) (_2!2874 lt!94575))))

(assert (=> d!18712 (= (reader!0 (_2!2874 lt!94565) (_2!2874 lt!94575)) lt!95195)))

(assert (= (and d!18712 c!4260) b!60979))

(assert (= (and d!18712 (not c!4260)) b!60980))

(assert (= (and d!18712 res!50849) b!60977))

(assert (= (and b!60977 res!50848) b!60978))

(assert (= (and b!60978 res!50850) b!60981))

(declare-fun m!96117 () Bool)

(assert (=> b!60977 m!96117))

(declare-fun m!96119 () Bool)

(assert (=> d!18712 m!96119))

(declare-fun m!96121 () Bool)

(assert (=> d!18712 m!96121))

(declare-fun m!96123 () Bool)

(assert (=> d!18712 m!96123))

(declare-fun m!96125 () Bool)

(assert (=> d!18712 m!96125))

(declare-fun m!96127 () Bool)

(assert (=> d!18712 m!96127))

(assert (=> d!18712 m!95797))

(assert (=> d!18712 m!95809))

(assert (=> d!18712 m!95635))

(declare-fun m!96129 () Bool)

(assert (=> d!18712 m!96129))

(declare-fun m!96131 () Bool)

(assert (=> d!18712 m!96131))

(declare-fun m!96133 () Bool)

(assert (=> d!18712 m!96133))

(assert (=> b!60979 m!95649))

(declare-fun m!96135 () Bool)

(assert (=> b!60979 m!96135))

(declare-fun m!96137 () Bool)

(assert (=> b!60979 m!96137))

(declare-fun m!96139 () Bool)

(assert (=> b!60978 m!96139))

(declare-fun m!96141 () Bool)

(assert (=> b!60981 m!96141))

(assert (=> b!60981 m!95657))

(assert (=> b!60981 m!95649))

(assert (=> b!60686 d!18712))

(declare-fun d!18714 () Bool)

(assert (=> d!18714 (validate_offset_bits!1 ((_ sign_extend 32) (size!1257 (buf!1638 (_2!2874 lt!94575)))) ((_ sign_extend 32) (currentByte!3256 thiss!1379)) ((_ sign_extend 32) (currentBit!3251 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!95229 () Unit!4137)

(assert (=> d!18714 (= lt!95229 (choose!9 thiss!1379 (buf!1638 (_2!2874 lt!94575)) (bvsub to!314 i!635) (BitStream!2203 (buf!1638 (_2!2874 lt!94575)) (currentByte!3256 thiss!1379) (currentBit!3251 thiss!1379))))))

(assert (=> d!18714 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1638 (_2!2874 lt!94575)) (bvsub to!314 i!635)) lt!95229)))

(declare-fun bs!4686 () Bool)

(assert (= bs!4686 d!18714))

(assert (=> bs!4686 m!95619))

(declare-fun m!96143 () Bool)

(assert (=> bs!4686 m!96143))

(assert (=> b!60686 d!18714))

(declare-fun b!60984 () Bool)

(declare-fun e!40684 () Bool)

(declare-fun lt!95230 () List!676)

(assert (=> b!60984 (= e!40684 (isEmpty!180 lt!95230))))

(declare-fun d!18716 () Bool)

(assert (=> d!18716 e!40684))

(declare-fun c!4262 () Bool)

(assert (=> d!18716 (= c!4262 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!40683 () tuple2!5534)

(assert (=> d!18716 (= lt!95230 (_1!2878 e!40683))))

(declare-fun c!4261 () Bool)

(assert (=> d!18716 (= c!4261 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18716 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!18716 (= (bitStreamReadBitsIntoList!0 (_2!2874 lt!94575) (_1!2875 lt!94568) (bvsub to!314 i!635)) lt!95230)))

(declare-fun lt!95232 () (_ BitVec 64))

(declare-fun lt!95231 () tuple2!5536)

(declare-fun b!60983 () Bool)

(assert (=> b!60983 (= e!40683 (tuple2!5535 (Cons!672 (_1!2879 lt!95231) (bitStreamReadBitsIntoList!0 (_2!2874 lt!94575) (_2!2879 lt!95231) (bvsub (bvsub to!314 i!635) lt!95232))) (_2!2879 lt!95231)))))

(assert (=> b!60983 (= lt!95231 (readBit!0 (_1!2875 lt!94568)))))

(assert (=> b!60983 (= lt!95232 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!60982 () Bool)

(assert (=> b!60982 (= e!40683 (tuple2!5535 Nil!673 (_1!2875 lt!94568)))))

(declare-fun b!60985 () Bool)

(assert (=> b!60985 (= e!40684 (> (length!304 lt!95230) 0))))

(assert (= (and d!18716 c!4261) b!60982))

(assert (= (and d!18716 (not c!4261)) b!60983))

(assert (= (and d!18716 c!4262) b!60984))

(assert (= (and d!18716 (not c!4262)) b!60985))

(declare-fun m!96145 () Bool)

(assert (=> b!60984 m!96145))

(declare-fun m!96147 () Bool)

(assert (=> b!60983 m!96147))

(declare-fun m!96149 () Bool)

(assert (=> b!60983 m!96149))

(declare-fun m!96151 () Bool)

(assert (=> b!60985 m!96151))

(assert (=> b!60686 d!18716))

(declare-fun b!60988 () Bool)

(declare-fun e!40686 () Bool)

(declare-fun lt!95233 () List!676)

(assert (=> b!60988 (= e!40686 (isEmpty!180 lt!95233))))

(declare-fun d!18718 () Bool)

(assert (=> d!18718 e!40686))

(declare-fun c!4264 () Bool)

(assert (=> d!18718 (= c!4264 (= lt!94573 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!40685 () tuple2!5534)

(assert (=> d!18718 (= lt!95233 (_1!2878 e!40685))))

(declare-fun c!4263 () Bool)

(assert (=> d!18718 (= c!4263 (= lt!94573 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18718 (bvsge lt!94573 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!18718 (= (bitStreamReadBitsIntoList!0 (_2!2874 lt!94575) (_1!2875 lt!94570) lt!94573) lt!95233)))

(declare-fun b!60987 () Bool)

(declare-fun lt!95234 () tuple2!5536)

(declare-fun lt!95235 () (_ BitVec 64))

(assert (=> b!60987 (= e!40685 (tuple2!5535 (Cons!672 (_1!2879 lt!95234) (bitStreamReadBitsIntoList!0 (_2!2874 lt!94575) (_2!2879 lt!95234) (bvsub lt!94573 lt!95235))) (_2!2879 lt!95234)))))

(assert (=> b!60987 (= lt!95234 (readBit!0 (_1!2875 lt!94570)))))

(assert (=> b!60987 (= lt!95235 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!60986 () Bool)

(assert (=> b!60986 (= e!40685 (tuple2!5535 Nil!673 (_1!2875 lt!94570)))))

(declare-fun b!60989 () Bool)

(assert (=> b!60989 (= e!40686 (> (length!304 lt!95233) 0))))

(assert (= (and d!18718 c!4263) b!60986))

(assert (= (and d!18718 (not c!4263)) b!60987))

(assert (= (and d!18718 c!4264) b!60988))

(assert (= (and d!18718 (not c!4264)) b!60989))

(declare-fun m!96153 () Bool)

(assert (=> b!60988 m!96153))

(declare-fun m!96155 () Bool)

(assert (=> b!60987 m!96155))

(declare-fun m!96157 () Bool)

(assert (=> b!60987 m!96157))

(declare-fun m!96159 () Bool)

(assert (=> b!60989 m!96159))

(assert (=> b!60686 d!18718))

(declare-fun d!18720 () Bool)

(assert (=> d!18720 (validate_offset_bits!1 ((_ sign_extend 32) (size!1257 (buf!1638 (_2!2874 lt!94575)))) ((_ sign_extend 32) (currentByte!3256 (_2!2874 lt!94565))) ((_ sign_extend 32) (currentBit!3251 (_2!2874 lt!94565))) lt!94573)))

(declare-fun lt!95236 () Unit!4137)

(assert (=> d!18720 (= lt!95236 (choose!9 (_2!2874 lt!94565) (buf!1638 (_2!2874 lt!94575)) lt!94573 (BitStream!2203 (buf!1638 (_2!2874 lt!94575)) (currentByte!3256 (_2!2874 lt!94565)) (currentBit!3251 (_2!2874 lt!94565)))))))

(assert (=> d!18720 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2874 lt!94565) (buf!1638 (_2!2874 lt!94575)) lt!94573) lt!95236)))

(declare-fun bs!4687 () Bool)

(assert (= bs!4687 d!18720))

(assert (=> bs!4687 m!95615))

(declare-fun m!96161 () Bool)

(assert (=> bs!4687 m!96161))

(assert (=> b!60686 d!18720))

(declare-fun d!18722 () Bool)

(assert (=> d!18722 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1257 (buf!1638 (_2!2874 lt!94575)))) ((_ sign_extend 32) (currentByte!3256 (_2!2874 lt!94565))) ((_ sign_extend 32) (currentBit!3251 (_2!2874 lt!94565))) lt!94573) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1257 (buf!1638 (_2!2874 lt!94575)))) ((_ sign_extend 32) (currentByte!3256 (_2!2874 lt!94565))) ((_ sign_extend 32) (currentBit!3251 (_2!2874 lt!94565)))) lt!94573))))

(declare-fun bs!4688 () Bool)

(assert (= bs!4688 d!18722))

(declare-fun m!96163 () Bool)

(assert (=> bs!4688 m!96163))

(assert (=> b!60686 d!18722))

(declare-fun b!61000 () Bool)

(declare-fun res!50861 () Bool)

(declare-fun e!40689 () Bool)

(assert (=> b!61000 (=> (not res!50861) (not e!40689))))

(declare-fun lt!95245 () tuple2!5528)

(assert (=> b!61000 (= res!50861 (isPrefixOf!0 (_1!2875 lt!95245) thiss!1379))))

(declare-fun b!61001 () Bool)

(declare-fun res!50863 () Bool)

(assert (=> b!61001 (=> (not res!50863) (not e!40689))))

(assert (=> b!61001 (= res!50863 (isPrefixOf!0 (_2!2875 lt!95245) (_2!2874 lt!94575)))))

(declare-fun b!61002 () Bool)

(declare-fun e!40690 () Unit!4137)

(declare-fun lt!95262 () Unit!4137)

(assert (=> b!61002 (= e!40690 lt!95262)))

(declare-fun lt!95260 () (_ BitVec 64))

(assert (=> b!61002 (= lt!95260 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95252 () (_ BitVec 64))

(assert (=> b!61002 (= lt!95252 (bitIndex!0 (size!1257 (buf!1638 thiss!1379)) (currentByte!3256 thiss!1379) (currentBit!3251 thiss!1379)))))

(assert (=> b!61002 (= lt!95262 (arrayBitRangesEqSymmetric!0 (buf!1638 thiss!1379) (buf!1638 (_2!2874 lt!94575)) lt!95260 lt!95252))))

(assert (=> b!61002 (arrayBitRangesEq!0 (buf!1638 (_2!2874 lt!94575)) (buf!1638 thiss!1379) lt!95260 lt!95252)))

(declare-fun b!61003 () Bool)

(declare-fun Unit!4150 () Unit!4137)

(assert (=> b!61003 (= e!40690 Unit!4150)))

(declare-fun lt!95243 () (_ BitVec 64))

(declare-fun b!61004 () Bool)

(declare-fun lt!95256 () (_ BitVec 64))

(assert (=> b!61004 (= e!40689 (= (_1!2875 lt!95245) (withMovedBitIndex!0 (_2!2875 lt!95245) (bvsub lt!95243 lt!95256))))))

(assert (=> b!61004 (or (= (bvand lt!95243 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!95256 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!95243 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!95243 lt!95256) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!61004 (= lt!95256 (bitIndex!0 (size!1257 (buf!1638 (_2!2874 lt!94575))) (currentByte!3256 (_2!2874 lt!94575)) (currentBit!3251 (_2!2874 lt!94575))))))

(assert (=> b!61004 (= lt!95243 (bitIndex!0 (size!1257 (buf!1638 thiss!1379)) (currentByte!3256 thiss!1379) (currentBit!3251 thiss!1379)))))

(declare-fun d!18724 () Bool)

(assert (=> d!18724 e!40689))

(declare-fun res!50862 () Bool)

(assert (=> d!18724 (=> (not res!50862) (not e!40689))))

(assert (=> d!18724 (= res!50862 (isPrefixOf!0 (_1!2875 lt!95245) (_2!2875 lt!95245)))))

(declare-fun lt!95257 () BitStream!2202)

(assert (=> d!18724 (= lt!95245 (tuple2!5529 lt!95257 (_2!2874 lt!94575)))))

(declare-fun lt!95246 () Unit!4137)

(declare-fun lt!95254 () Unit!4137)

(assert (=> d!18724 (= lt!95246 lt!95254)))

(assert (=> d!18724 (isPrefixOf!0 lt!95257 (_2!2874 lt!94575))))

(assert (=> d!18724 (= lt!95254 (lemmaIsPrefixTransitive!0 lt!95257 (_2!2874 lt!94575) (_2!2874 lt!94575)))))

(declare-fun lt!95259 () Unit!4137)

(declare-fun lt!95250 () Unit!4137)

(assert (=> d!18724 (= lt!95259 lt!95250)))

(assert (=> d!18724 (isPrefixOf!0 lt!95257 (_2!2874 lt!94575))))

(assert (=> d!18724 (= lt!95250 (lemmaIsPrefixTransitive!0 lt!95257 thiss!1379 (_2!2874 lt!94575)))))

(declare-fun lt!95244 () Unit!4137)

(assert (=> d!18724 (= lt!95244 e!40690)))

(declare-fun c!4265 () Bool)

(assert (=> d!18724 (= c!4265 (not (= (size!1257 (buf!1638 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!95255 () Unit!4137)

(declare-fun lt!95247 () Unit!4137)

(assert (=> d!18724 (= lt!95255 lt!95247)))

(assert (=> d!18724 (isPrefixOf!0 (_2!2874 lt!94575) (_2!2874 lt!94575))))

(assert (=> d!18724 (= lt!95247 (lemmaIsPrefixRefl!0 (_2!2874 lt!94575)))))

(declare-fun lt!95253 () Unit!4137)

(declare-fun lt!95261 () Unit!4137)

(assert (=> d!18724 (= lt!95253 lt!95261)))

(assert (=> d!18724 (= lt!95261 (lemmaIsPrefixRefl!0 (_2!2874 lt!94575)))))

(declare-fun lt!95258 () Unit!4137)

(declare-fun lt!95249 () Unit!4137)

(assert (=> d!18724 (= lt!95258 lt!95249)))

(assert (=> d!18724 (isPrefixOf!0 lt!95257 lt!95257)))

(assert (=> d!18724 (= lt!95249 (lemmaIsPrefixRefl!0 lt!95257))))

(declare-fun lt!95251 () Unit!4137)

(declare-fun lt!95248 () Unit!4137)

(assert (=> d!18724 (= lt!95251 lt!95248)))

(assert (=> d!18724 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!18724 (= lt!95248 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!18724 (= lt!95257 (BitStream!2203 (buf!1638 (_2!2874 lt!94575)) (currentByte!3256 thiss!1379) (currentBit!3251 thiss!1379)))))

(assert (=> d!18724 (isPrefixOf!0 thiss!1379 (_2!2874 lt!94575))))

(assert (=> d!18724 (= (reader!0 thiss!1379 (_2!2874 lt!94575)) lt!95245)))

(assert (= (and d!18724 c!4265) b!61002))

(assert (= (and d!18724 (not c!4265)) b!61003))

(assert (= (and d!18724 res!50862) b!61000))

(assert (= (and b!61000 res!50861) b!61001))

(assert (= (and b!61001 res!50863) b!61004))

(declare-fun m!96165 () Bool)

(assert (=> b!61000 m!96165))

(declare-fun m!96167 () Bool)

(assert (=> d!18724 m!96167))

(assert (=> d!18724 m!96121))

(declare-fun m!96169 () Bool)

(assert (=> d!18724 m!96169))

(declare-fun m!96171 () Bool)

(assert (=> d!18724 m!96171))

(declare-fun m!96173 () Bool)

(assert (=> d!18724 m!96173))

(assert (=> d!18724 m!95667))

(assert (=> d!18724 m!95669))

(assert (=> d!18724 m!95645))

(declare-fun m!96175 () Bool)

(assert (=> d!18724 m!96175))

(declare-fun m!96177 () Bool)

(assert (=> d!18724 m!96177))

(assert (=> d!18724 m!96133))

(assert (=> b!61002 m!95671))

(declare-fun m!96179 () Bool)

(assert (=> b!61002 m!96179))

(declare-fun m!96181 () Bool)

(assert (=> b!61002 m!96181))

(declare-fun m!96183 () Bool)

(assert (=> b!61001 m!96183))

(declare-fun m!96185 () Bool)

(assert (=> b!61004 m!96185))

(assert (=> b!61004 m!95657))

(assert (=> b!61004 m!95671))

(assert (=> b!60686 d!18724))

(declare-fun d!18726 () Bool)

(assert (=> d!18726 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1257 (buf!1638 (_2!2874 lt!94575)))) ((_ sign_extend 32) (currentByte!3256 thiss!1379)) ((_ sign_extend 32) (currentBit!3251 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1257 (buf!1638 (_2!2874 lt!94575)))) ((_ sign_extend 32) (currentByte!3256 thiss!1379)) ((_ sign_extend 32) (currentBit!3251 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4689 () Bool)

(assert (= bs!4689 d!18726))

(declare-fun m!96187 () Bool)

(assert (=> bs!4689 m!96187))

(assert (=> b!60686 d!18726))

(declare-fun d!18728 () Bool)

(assert (=> d!18728 (= (invariant!0 (currentBit!3251 (_2!2874 lt!94575)) (currentByte!3256 (_2!2874 lt!94575)) (size!1257 (buf!1638 (_2!2874 lt!94575)))) (and (bvsge (currentBit!3251 (_2!2874 lt!94575)) #b00000000000000000000000000000000) (bvslt (currentBit!3251 (_2!2874 lt!94575)) #b00000000000000000000000000001000) (bvsge (currentByte!3256 (_2!2874 lt!94575)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3256 (_2!2874 lt!94575)) (size!1257 (buf!1638 (_2!2874 lt!94575)))) (and (= (currentBit!3251 (_2!2874 lt!94575)) #b00000000000000000000000000000000) (= (currentByte!3256 (_2!2874 lt!94575)) (size!1257 (buf!1638 (_2!2874 lt!94575))))))))))

(assert (=> b!60685 d!18728))

(declare-fun d!18730 () Bool)

(assert (=> d!18730 (= (array_inv!1160 srcBuffer!2) (bvsge (size!1257 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!11906 d!18730))

(declare-fun d!18732 () Bool)

(assert (=> d!18732 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3251 thiss!1379) (currentByte!3256 thiss!1379) (size!1257 (buf!1638 thiss!1379))))))

(declare-fun bs!4690 () Bool)

(assert (= bs!4690 d!18732))

(assert (=> bs!4690 m!95779))

(assert (=> start!11906 d!18732))

(declare-fun d!18734 () Bool)

(assert (=> d!18734 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1257 (buf!1638 thiss!1379))) ((_ sign_extend 32) (currentByte!3256 thiss!1379)) ((_ sign_extend 32) (currentBit!3251 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1257 (buf!1638 thiss!1379))) ((_ sign_extend 32) (currentByte!3256 thiss!1379)) ((_ sign_extend 32) (currentBit!3251 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4691 () Bool)

(assert (= bs!4691 d!18734))

(assert (=> bs!4691 m!95777))

(assert (=> b!60684 d!18734))

(check-sat (not b!60926) (not d!18712) (not b!60970) (not d!18726) (not d!18600) (not d!18598) (not b!60929) (not b!60751) (not b!60981) (not b!60773) (not b!60973) (not b!60763) (not b!60972) (not b!61004) (not b!61002) (not d!18622) (not d!18700) (not d!18702) (not b!60977) (not b!60788) (not b!60746) (not d!18624) (not b!60978) (not b!60749) (not b!60971) (not b!61001) (not d!18594) (not b!60988) (not b!60786) (not d!18616) (not d!18720) (not b!60774) (not b!60934) (not d!18708) (not b!60989) (not b!60976) (not b!60937) (not b!61000) (not b!60790) (not bm!763) (not b!60942) (not d!18618) (not b!60983) (not b!60975) (not b!60924) (not b!60987) (not d!18732) (not b!60969) (not d!18714) (not b!60985) (not b!60947) (not b!60925) (not b!60930) (not d!18710) (not b!60928) (not b!60775) (not d!18734) (not d!18706) (not b!60748) (not b!60932) (not d!18722) (not b!60935) (not b!60787) (not b!60944) (not d!18620) (not b!60974) (not b!60984) (not b!60979) (not d!18724))
