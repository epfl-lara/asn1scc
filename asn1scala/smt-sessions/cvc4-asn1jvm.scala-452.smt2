; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11908 () Bool)

(assert start!11908)

(declare-fun b!60724 () Bool)

(declare-fun e!40554 () Bool)

(declare-fun e!40553 () Bool)

(assert (=> b!60724 (= e!40554 e!40553)))

(declare-fun res!50665 () Bool)

(assert (=> b!60724 (=> res!50665 e!40553)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!60724 (= res!50665 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!2765 0))(
  ( (array!2766 (arr!1822 (Array (_ BitVec 32) (_ BitVec 8))) (size!1258 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2204 0))(
  ( (BitStream!2205 (buf!1639 array!2765) (currentByte!3257 (_ BitVec 32)) (currentBit!3252 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4139 0))(
  ( (Unit!4140) )
))
(declare-datatypes ((tuple2!5530 0))(
  ( (tuple2!5531 (_1!2876 Unit!4139) (_2!2876 BitStream!2204)) )
))
(declare-fun lt!94615 () tuple2!5530)

(declare-datatypes ((tuple2!5532 0))(
  ( (tuple2!5533 (_1!2877 BitStream!2204) (_2!2877 BitStream!2204)) )
))
(declare-fun lt!94617 () tuple2!5532)

(declare-datatypes ((List!677 0))(
  ( (Nil!674) (Cons!673 (h!792 Bool) (t!1427 List!677)) )
))
(declare-fun lt!94616 () List!677)

(declare-fun lt!94619 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2204 BitStream!2204 (_ BitVec 64)) List!677)

(assert (=> b!60724 (= lt!94616 (bitStreamReadBitsIntoList!0 (_2!2876 lt!94615) (_1!2877 lt!94617) lt!94619))))

(declare-fun lt!94613 () List!677)

(declare-fun lt!94624 () tuple2!5532)

(assert (=> b!60724 (= lt!94613 (bitStreamReadBitsIntoList!0 (_2!2876 lt!94615) (_1!2877 lt!94624) (bvsub to!314 i!635)))))

(declare-fun lt!94611 () tuple2!5530)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!60724 (validate_offset_bits!1 ((_ sign_extend 32) (size!1258 (buf!1639 (_2!2876 lt!94615)))) ((_ sign_extend 32) (currentByte!3257 (_2!2876 lt!94611))) ((_ sign_extend 32) (currentBit!3252 (_2!2876 lt!94611))) lt!94619)))

(declare-fun lt!94614 () Unit!4139)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2204 array!2765 (_ BitVec 64)) Unit!4139)

(assert (=> b!60724 (= lt!94614 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2876 lt!94611) (buf!1639 (_2!2876 lt!94615)) lt!94619))))

(declare-fun reader!0 (BitStream!2204 BitStream!2204) tuple2!5532)

(assert (=> b!60724 (= lt!94617 (reader!0 (_2!2876 lt!94611) (_2!2876 lt!94615)))))

(declare-fun thiss!1379 () BitStream!2204)

(assert (=> b!60724 (validate_offset_bits!1 ((_ sign_extend 32) (size!1258 (buf!1639 (_2!2876 lt!94615)))) ((_ sign_extend 32) (currentByte!3257 thiss!1379)) ((_ sign_extend 32) (currentBit!3252 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!94621 () Unit!4139)

(assert (=> b!60724 (= lt!94621 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1639 (_2!2876 lt!94615)) (bvsub to!314 i!635)))))

(assert (=> b!60724 (= lt!94624 (reader!0 thiss!1379 (_2!2876 lt!94615)))))

(declare-fun b!60725 () Bool)

(declare-fun isPrefixOf!0 (BitStream!2204 BitStream!2204) Bool)

(assert (=> b!60725 (= e!40553 (isPrefixOf!0 (_1!2877 lt!94624) (_2!2876 lt!94615)))))

(declare-fun b!60726 () Bool)

(declare-fun e!40559 () Bool)

(declare-fun e!40551 () Bool)

(assert (=> b!60726 (= e!40559 e!40551)))

(declare-fun res!50667 () Bool)

(assert (=> b!60726 (=> res!50667 e!40551)))

(assert (=> b!60726 (= res!50667 (not (isPrefixOf!0 thiss!1379 (_2!2876 lt!94611))))))

(assert (=> b!60726 (validate_offset_bits!1 ((_ sign_extend 32) (size!1258 (buf!1639 (_2!2876 lt!94611)))) ((_ sign_extend 32) (currentByte!3257 (_2!2876 lt!94611))) ((_ sign_extend 32) (currentBit!3252 (_2!2876 lt!94611))) lt!94619)))

(assert (=> b!60726 (= lt!94619 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!94622 () Unit!4139)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2204 BitStream!2204 (_ BitVec 64) (_ BitVec 64)) Unit!4139)

(assert (=> b!60726 (= lt!94622 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2876 lt!94611) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2765)

(declare-fun appendBitFromByte!0 (BitStream!2204 (_ BitVec 8) (_ BitVec 32)) tuple2!5530)

(assert (=> b!60726 (= lt!94611 (appendBitFromByte!0 thiss!1379 (select (arr!1822 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!60727 () Bool)

(declare-fun res!50666 () Bool)

(declare-fun e!40548 () Bool)

(assert (=> b!60727 (=> res!50666 e!40548)))

(assert (=> b!60727 (= res!50666 (not (= (size!1258 (buf!1639 thiss!1379)) (size!1258 (buf!1639 (_2!2876 lt!94615))))))))

(declare-fun b!60729 () Bool)

(declare-fun e!40556 () Bool)

(assert (=> b!60729 (= e!40551 e!40556)))

(declare-fun res!50662 () Bool)

(assert (=> b!60729 (=> res!50662 e!40556)))

(assert (=> b!60729 (= res!50662 (not (isPrefixOf!0 (_2!2876 lt!94611) (_2!2876 lt!94615))))))

(assert (=> b!60729 (isPrefixOf!0 thiss!1379 (_2!2876 lt!94615))))

(declare-fun lt!94623 () Unit!4139)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2204 BitStream!2204 BitStream!2204) Unit!4139)

(assert (=> b!60729 (= lt!94623 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2876 lt!94611) (_2!2876 lt!94615)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2204 array!2765 (_ BitVec 64) (_ BitVec 64)) tuple2!5530)

(assert (=> b!60729 (= lt!94615 (appendBitsMSBFirstLoop!0 (_2!2876 lt!94611) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!40550 () Bool)

(assert (=> b!60729 e!40550))

(declare-fun res!50674 () Bool)

(assert (=> b!60729 (=> (not res!50674) (not e!40550))))

(assert (=> b!60729 (= res!50674 (validate_offset_bits!1 ((_ sign_extend 32) (size!1258 (buf!1639 (_2!2876 lt!94611)))) ((_ sign_extend 32) (currentByte!3257 thiss!1379)) ((_ sign_extend 32) (currentBit!3252 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!94612 () Unit!4139)

(assert (=> b!60729 (= lt!94612 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1639 (_2!2876 lt!94611)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!94610 () tuple2!5532)

(assert (=> b!60729 (= lt!94610 (reader!0 thiss!1379 (_2!2876 lt!94611)))))

(declare-fun b!60730 () Bool)

(declare-fun res!50669 () Bool)

(assert (=> b!60730 (=> res!50669 e!40554)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!60730 (= res!50669 (not (invariant!0 (currentBit!3252 (_2!2876 lt!94611)) (currentByte!3257 (_2!2876 lt!94611)) (size!1258 (buf!1639 (_2!2876 lt!94611))))))))

(declare-fun b!60731 () Bool)

(declare-fun e!40558 () Bool)

(declare-fun array_inv!1161 (array!2765) Bool)

(assert (=> b!60731 (= e!40558 (array_inv!1161 (buf!1639 thiss!1379)))))

(declare-fun b!60732 () Bool)

(declare-fun res!50671 () Bool)

(declare-fun e!40555 () Bool)

(assert (=> b!60732 (=> (not res!50671) (not e!40555))))

(assert (=> b!60732 (= res!50671 (validate_offset_bits!1 ((_ sign_extend 32) (size!1258 (buf!1639 thiss!1379))) ((_ sign_extend 32) (currentByte!3257 thiss!1379)) ((_ sign_extend 32) (currentBit!3252 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!60733 () Bool)

(declare-fun res!50673 () Bool)

(assert (=> b!60733 (=> res!50673 e!40548)))

(assert (=> b!60733 (= res!50673 (not (invariant!0 (currentBit!3252 (_2!2876 lt!94615)) (currentByte!3257 (_2!2876 lt!94615)) (size!1258 (buf!1639 (_2!2876 lt!94615))))))))

(declare-fun b!60734 () Bool)

(declare-fun res!50664 () Bool)

(assert (=> b!60734 (=> res!50664 e!40554)))

(assert (=> b!60734 (= res!50664 (not (invariant!0 (currentBit!3252 (_2!2876 lt!94611)) (currentByte!3257 (_2!2876 lt!94611)) (size!1258 (buf!1639 (_2!2876 lt!94615))))))))

(declare-fun lt!94609 () (_ BitVec 64))

(declare-fun b!60735 () Bool)

(declare-fun e!40552 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!60735 (= e!40552 (= lt!94609 (bvsub (bvsub (bvadd (bitIndex!0 (size!1258 (buf!1639 (_2!2876 lt!94611))) (currentByte!3257 (_2!2876 lt!94611)) (currentBit!3252 (_2!2876 lt!94611))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!60736 () Bool)

(assert (=> b!60736 (= e!40548 e!40554)))

(declare-fun res!50670 () Bool)

(assert (=> b!60736 (=> res!50670 e!40554)))

(assert (=> b!60736 (= res!50670 (not (= (size!1258 (buf!1639 (_2!2876 lt!94611))) (size!1258 (buf!1639 (_2!2876 lt!94615))))))))

(assert (=> b!60736 e!40552))

(declare-fun res!50672 () Bool)

(assert (=> b!60736 (=> (not res!50672) (not e!40552))))

(assert (=> b!60736 (= res!50672 (= (size!1258 (buf!1639 (_2!2876 lt!94615))) (size!1258 (buf!1639 thiss!1379))))))

(declare-fun res!50663 () Bool)

(assert (=> start!11908 (=> (not res!50663) (not e!40555))))

(assert (=> start!11908 (= res!50663 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1258 srcBuffer!2))))))))

(assert (=> start!11908 e!40555))

(assert (=> start!11908 true))

(assert (=> start!11908 (array_inv!1161 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2204) Bool)

(assert (=> start!11908 (and (inv!12 thiss!1379) e!40558)))

(declare-fun b!60728 () Bool)

(declare-fun res!50675 () Bool)

(assert (=> b!60728 (=> res!50675 e!40553)))

(declare-fun length!305 (List!677) Int)

(assert (=> b!60728 (= res!50675 (<= (length!305 lt!94613) 0))))

(declare-fun b!60737 () Bool)

(assert (=> b!60737 (= e!40555 (not e!40559))))

(declare-fun res!50676 () Bool)

(assert (=> b!60737 (=> res!50676 e!40559)))

(assert (=> b!60737 (= res!50676 (bvsge i!635 to!314))))

(assert (=> b!60737 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!94618 () Unit!4139)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2204) Unit!4139)

(assert (=> b!60737 (= lt!94618 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!94620 () (_ BitVec 64))

(assert (=> b!60737 (= lt!94620 (bitIndex!0 (size!1258 (buf!1639 thiss!1379)) (currentByte!3257 thiss!1379) (currentBit!3252 thiss!1379)))))

(declare-fun b!60738 () Bool)

(declare-fun head!496 (List!677) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2204 array!2765 (_ BitVec 64) (_ BitVec 64)) List!677)

(assert (=> b!60738 (= e!40550 (= (head!496 (byteArrayBitContentToList!0 (_2!2876 lt!94611) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!496 (bitStreamReadBitsIntoList!0 (_2!2876 lt!94611) (_1!2877 lt!94610) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!60739 () Bool)

(assert (=> b!60739 (= e!40556 e!40548)))

(declare-fun res!50668 () Bool)

(assert (=> b!60739 (=> res!50668 e!40548)))

(assert (=> b!60739 (= res!50668 (not (= lt!94609 (bvsub (bvadd lt!94620 to!314) i!635))))))

(assert (=> b!60739 (= lt!94609 (bitIndex!0 (size!1258 (buf!1639 (_2!2876 lt!94615))) (currentByte!3257 (_2!2876 lt!94615)) (currentBit!3252 (_2!2876 lt!94615))))))

(assert (= (and start!11908 res!50663) b!60732))

(assert (= (and b!60732 res!50671) b!60737))

(assert (= (and b!60737 (not res!50676)) b!60726))

(assert (= (and b!60726 (not res!50667)) b!60729))

(assert (= (and b!60729 res!50674) b!60738))

(assert (= (and b!60729 (not res!50662)) b!60739))

(assert (= (and b!60739 (not res!50668)) b!60733))

(assert (= (and b!60733 (not res!50673)) b!60727))

(assert (= (and b!60727 (not res!50666)) b!60736))

(assert (= (and b!60736 res!50672) b!60735))

(assert (= (and b!60736 (not res!50670)) b!60730))

(assert (= (and b!60730 (not res!50669)) b!60734))

(assert (= (and b!60734 (not res!50664)) b!60724))

(assert (= (and b!60724 (not res!50665)) b!60728))

(assert (= (and b!60728 (not res!50675)) b!60725))

(assert (= start!11908 b!60731))

(declare-fun m!95691 () Bool)

(assert (=> b!60729 m!95691))

(declare-fun m!95693 () Bool)

(assert (=> b!60729 m!95693))

(declare-fun m!95695 () Bool)

(assert (=> b!60729 m!95695))

(declare-fun m!95697 () Bool)

(assert (=> b!60729 m!95697))

(declare-fun m!95699 () Bool)

(assert (=> b!60729 m!95699))

(declare-fun m!95701 () Bool)

(assert (=> b!60729 m!95701))

(declare-fun m!95703 () Bool)

(assert (=> b!60729 m!95703))

(declare-fun m!95705 () Bool)

(assert (=> b!60730 m!95705))

(declare-fun m!95707 () Bool)

(assert (=> b!60735 m!95707))

(declare-fun m!95709 () Bool)

(assert (=> b!60726 m!95709))

(declare-fun m!95711 () Bool)

(assert (=> b!60726 m!95711))

(declare-fun m!95713 () Bool)

(assert (=> b!60726 m!95713))

(assert (=> b!60726 m!95709))

(declare-fun m!95715 () Bool)

(assert (=> b!60726 m!95715))

(declare-fun m!95717 () Bool)

(assert (=> b!60726 m!95717))

(declare-fun m!95719 () Bool)

(assert (=> b!60732 m!95719))

(declare-fun m!95721 () Bool)

(assert (=> b!60739 m!95721))

(declare-fun m!95723 () Bool)

(assert (=> b!60724 m!95723))

(declare-fun m!95725 () Bool)

(assert (=> b!60724 m!95725))

(declare-fun m!95727 () Bool)

(assert (=> b!60724 m!95727))

(declare-fun m!95729 () Bool)

(assert (=> b!60724 m!95729))

(declare-fun m!95731 () Bool)

(assert (=> b!60724 m!95731))

(declare-fun m!95733 () Bool)

(assert (=> b!60724 m!95733))

(declare-fun m!95735 () Bool)

(assert (=> b!60724 m!95735))

(declare-fun m!95737 () Bool)

(assert (=> b!60724 m!95737))

(declare-fun m!95739 () Bool)

(assert (=> b!60734 m!95739))

(declare-fun m!95741 () Bool)

(assert (=> b!60733 m!95741))

(declare-fun m!95743 () Bool)

(assert (=> b!60728 m!95743))

(declare-fun m!95745 () Bool)

(assert (=> start!11908 m!95745))

(declare-fun m!95747 () Bool)

(assert (=> start!11908 m!95747))

(declare-fun m!95749 () Bool)

(assert (=> b!60737 m!95749))

(declare-fun m!95751 () Bool)

(assert (=> b!60737 m!95751))

(declare-fun m!95753 () Bool)

(assert (=> b!60737 m!95753))

(declare-fun m!95755 () Bool)

(assert (=> b!60731 m!95755))

(declare-fun m!95757 () Bool)

(assert (=> b!60738 m!95757))

(assert (=> b!60738 m!95757))

(declare-fun m!95759 () Bool)

(assert (=> b!60738 m!95759))

(declare-fun m!95761 () Bool)

(assert (=> b!60738 m!95761))

(assert (=> b!60738 m!95761))

(declare-fun m!95763 () Bool)

(assert (=> b!60738 m!95763))

(declare-fun m!95765 () Bool)

(assert (=> b!60725 m!95765))

(push 1)

(assert (not b!60730))

(assert (not b!60731))

(assert (not b!60737))

(assert (not b!60735))

(assert (not b!60728))

(assert (not b!60724))

(assert (not b!60739))

(assert (not start!11908))

(assert (not b!60734))

(assert (not b!60725))

(assert (not b!60732))

(assert (not b!60729))

(assert (not b!60738))

(assert (not b!60726))

(assert (not b!60733))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!18626 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!18626 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1258 (buf!1639 thiss!1379))) ((_ sign_extend 32) (currentByte!3257 thiss!1379)) ((_ sign_extend 32) (currentBit!3252 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1258 (buf!1639 thiss!1379))) ((_ sign_extend 32) (currentByte!3257 thiss!1379)) ((_ sign_extend 32) (currentBit!3252 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4671 () Bool)

(assert (= bs!4671 d!18626))

(declare-fun m!95825 () Bool)

(assert (=> bs!4671 m!95825))

(assert (=> b!60732 d!18626))

(declare-fun d!18628 () Bool)

(assert (=> d!18628 (= (array_inv!1161 (buf!1639 thiss!1379)) (bvsge (size!1258 (buf!1639 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!60731 d!18628))

(declare-fun d!18630 () Bool)

(assert (=> d!18630 (= (invariant!0 (currentBit!3252 (_2!2876 lt!94611)) (currentByte!3257 (_2!2876 lt!94611)) (size!1258 (buf!1639 (_2!2876 lt!94611)))) (and (bvsge (currentBit!3252 (_2!2876 lt!94611)) #b00000000000000000000000000000000) (bvslt (currentBit!3252 (_2!2876 lt!94611)) #b00000000000000000000000000001000) (bvsge (currentByte!3257 (_2!2876 lt!94611)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3257 (_2!2876 lt!94611)) (size!1258 (buf!1639 (_2!2876 lt!94611)))) (and (= (currentBit!3252 (_2!2876 lt!94611)) #b00000000000000000000000000000000) (= (currentByte!3257 (_2!2876 lt!94611)) (size!1258 (buf!1639 (_2!2876 lt!94611))))))))))

(assert (=> b!60730 d!18630))

(declare-fun d!18632 () Bool)

(declare-fun e!40588 () Bool)

(assert (=> d!18632 e!40588))

(declare-fun res!50708 () Bool)

(assert (=> d!18632 (=> (not res!50708) (not e!40588))))

(declare-fun lt!94738 () (_ BitVec 64))

(declare-fun lt!94733 () (_ BitVec 64))

(declare-fun lt!94735 () (_ BitVec 64))

(assert (=> d!18632 (= res!50708 (= lt!94733 (bvsub lt!94738 lt!94735)))))

(assert (=> d!18632 (or (= (bvand lt!94738 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!94735 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!94738 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!94738 lt!94735) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18632 (= lt!94735 (remainingBits!0 ((_ sign_extend 32) (size!1258 (buf!1639 (_2!2876 lt!94611)))) ((_ sign_extend 32) (currentByte!3257 (_2!2876 lt!94611))) ((_ sign_extend 32) (currentBit!3252 (_2!2876 lt!94611)))))))

(declare-fun lt!94737 () (_ BitVec 64))

(declare-fun lt!94736 () (_ BitVec 64))

(assert (=> d!18632 (= lt!94738 (bvmul lt!94737 lt!94736))))

(assert (=> d!18632 (or (= lt!94737 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!94736 (bvsdiv (bvmul lt!94737 lt!94736) lt!94737)))))

(assert (=> d!18632 (= lt!94736 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18632 (= lt!94737 ((_ sign_extend 32) (size!1258 (buf!1639 (_2!2876 lt!94611)))))))

(assert (=> d!18632 (= lt!94733 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3257 (_2!2876 lt!94611))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3252 (_2!2876 lt!94611)))))))

(assert (=> d!18632 (invariant!0 (currentBit!3252 (_2!2876 lt!94611)) (currentByte!3257 (_2!2876 lt!94611)) (size!1258 (buf!1639 (_2!2876 lt!94611))))))

(assert (=> d!18632 (= (bitIndex!0 (size!1258 (buf!1639 (_2!2876 lt!94611))) (currentByte!3257 (_2!2876 lt!94611)) (currentBit!3252 (_2!2876 lt!94611))) lt!94733)))

(declare-fun b!60795 () Bool)

(declare-fun res!50709 () Bool)

(assert (=> b!60795 (=> (not res!50709) (not e!40588))))

(assert (=> b!60795 (= res!50709 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!94733))))

(declare-fun b!60796 () Bool)

(declare-fun lt!94734 () (_ BitVec 64))

(assert (=> b!60796 (= e!40588 (bvsle lt!94733 (bvmul lt!94734 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!60796 (or (= lt!94734 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!94734 #b0000000000000000000000000000000000000000000000000000000000001000) lt!94734)))))

(assert (=> b!60796 (= lt!94734 ((_ sign_extend 32) (size!1258 (buf!1639 (_2!2876 lt!94611)))))))

(assert (= (and d!18632 res!50708) b!60795))

(assert (= (and b!60795 res!50709) b!60796))

(declare-fun m!95827 () Bool)

(assert (=> d!18632 m!95827))

(assert (=> d!18632 m!95705))

(assert (=> b!60735 d!18632))

(declare-fun d!18634 () Bool)

(assert (=> d!18634 (validate_offset_bits!1 ((_ sign_extend 32) (size!1258 (buf!1639 (_2!2876 lt!94615)))) ((_ sign_extend 32) (currentByte!3257 thiss!1379)) ((_ sign_extend 32) (currentBit!3252 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!94741 () Unit!4139)

(declare-fun choose!9 (BitStream!2204 array!2765 (_ BitVec 64) BitStream!2204) Unit!4139)

(assert (=> d!18634 (= lt!94741 (choose!9 thiss!1379 (buf!1639 (_2!2876 lt!94615)) (bvsub to!314 i!635) (BitStream!2205 (buf!1639 (_2!2876 lt!94615)) (currentByte!3257 thiss!1379) (currentBit!3252 thiss!1379))))))

(assert (=> d!18634 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1639 (_2!2876 lt!94615)) (bvsub to!314 i!635)) lt!94741)))

(declare-fun bs!4672 () Bool)

(assert (= bs!4672 d!18634))

(assert (=> bs!4672 m!95725))

(declare-fun m!95829 () Bool)

(assert (=> bs!4672 m!95829))

(assert (=> b!60724 d!18634))

(declare-fun lt!94854 () (_ BitVec 64))

(declare-fun b!60822 () Bool)

(declare-fun lt!94856 () tuple2!5532)

(declare-fun lt!94844 () (_ BitVec 64))

(declare-fun e!40600 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!2204 (_ BitVec 64)) BitStream!2204)

(assert (=> b!60822 (= e!40600 (= (_1!2877 lt!94856) (withMovedBitIndex!0 (_2!2877 lt!94856) (bvsub lt!94854 lt!94844))))))

(assert (=> b!60822 (or (= (bvand lt!94854 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!94844 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!94854 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!94854 lt!94844) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!60822 (= lt!94844 (bitIndex!0 (size!1258 (buf!1639 (_2!2876 lt!94615))) (currentByte!3257 (_2!2876 lt!94615)) (currentBit!3252 (_2!2876 lt!94615))))))

(assert (=> b!60822 (= lt!94854 (bitIndex!0 (size!1258 (buf!1639 thiss!1379)) (currentByte!3257 thiss!1379) (currentBit!3252 thiss!1379)))))

(declare-fun b!60823 () Bool)

(declare-fun res!50726 () Bool)

(assert (=> b!60823 (=> (not res!50726) (not e!40600))))

(assert (=> b!60823 (= res!50726 (isPrefixOf!0 (_2!2877 lt!94856) (_2!2876 lt!94615)))))

(declare-fun d!18638 () Bool)

(assert (=> d!18638 e!40600))

(declare-fun res!50725 () Bool)

(assert (=> d!18638 (=> (not res!50725) (not e!40600))))

(assert (=> d!18638 (= res!50725 (isPrefixOf!0 (_1!2877 lt!94856) (_2!2877 lt!94856)))))

(declare-fun lt!94850 () BitStream!2204)

(assert (=> d!18638 (= lt!94856 (tuple2!5533 lt!94850 (_2!2876 lt!94615)))))

(declare-fun lt!94853 () Unit!4139)

(declare-fun lt!94851 () Unit!4139)

(assert (=> d!18638 (= lt!94853 lt!94851)))

(assert (=> d!18638 (isPrefixOf!0 lt!94850 (_2!2876 lt!94615))))

(assert (=> d!18638 (= lt!94851 (lemmaIsPrefixTransitive!0 lt!94850 (_2!2876 lt!94615) (_2!2876 lt!94615)))))

(declare-fun lt!94859 () Unit!4139)

(declare-fun lt!94852 () Unit!4139)

(assert (=> d!18638 (= lt!94859 lt!94852)))

(assert (=> d!18638 (isPrefixOf!0 lt!94850 (_2!2876 lt!94615))))

(assert (=> d!18638 (= lt!94852 (lemmaIsPrefixTransitive!0 lt!94850 thiss!1379 (_2!2876 lt!94615)))))

(declare-fun lt!94860 () Unit!4139)

(declare-fun e!40599 () Unit!4139)

(assert (=> d!18638 (= lt!94860 e!40599)))

(declare-fun c!4245 () Bool)

(assert (=> d!18638 (= c!4245 (not (= (size!1258 (buf!1639 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!94849 () Unit!4139)

(declare-fun lt!94858 () Unit!4139)

(assert (=> d!18638 (= lt!94849 lt!94858)))

(assert (=> d!18638 (isPrefixOf!0 (_2!2876 lt!94615) (_2!2876 lt!94615))))

(assert (=> d!18638 (= lt!94858 (lemmaIsPrefixRefl!0 (_2!2876 lt!94615)))))

(declare-fun lt!94845 () Unit!4139)

(declare-fun lt!94855 () Unit!4139)

(assert (=> d!18638 (= lt!94845 lt!94855)))

(assert (=> d!18638 (= lt!94855 (lemmaIsPrefixRefl!0 (_2!2876 lt!94615)))))

(declare-fun lt!94843 () Unit!4139)

(declare-fun lt!94846 () Unit!4139)

(assert (=> d!18638 (= lt!94843 lt!94846)))

(assert (=> d!18638 (isPrefixOf!0 lt!94850 lt!94850)))

(assert (=> d!18638 (= lt!94846 (lemmaIsPrefixRefl!0 lt!94850))))

(declare-fun lt!94857 () Unit!4139)

(declare-fun lt!94847 () Unit!4139)

(assert (=> d!18638 (= lt!94857 lt!94847)))

(assert (=> d!18638 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!18638 (= lt!94847 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!18638 (= lt!94850 (BitStream!2205 (buf!1639 (_2!2876 lt!94615)) (currentByte!3257 thiss!1379) (currentBit!3252 thiss!1379)))))

(assert (=> d!18638 (isPrefixOf!0 thiss!1379 (_2!2876 lt!94615))))

(assert (=> d!18638 (= (reader!0 thiss!1379 (_2!2876 lt!94615)) lt!94856)))

(declare-fun b!60824 () Bool)

(declare-fun Unit!4152 () Unit!4139)

(assert (=> b!60824 (= e!40599 Unit!4152)))

(declare-fun b!60825 () Bool)

(declare-fun lt!94842 () Unit!4139)

(assert (=> b!60825 (= e!40599 lt!94842)))

(declare-fun lt!94848 () (_ BitVec 64))

(assert (=> b!60825 (= lt!94848 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94861 () (_ BitVec 64))

(assert (=> b!60825 (= lt!94861 (bitIndex!0 (size!1258 (buf!1639 thiss!1379)) (currentByte!3257 thiss!1379) (currentBit!3252 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2765 array!2765 (_ BitVec 64) (_ BitVec 64)) Unit!4139)

(assert (=> b!60825 (= lt!94842 (arrayBitRangesEqSymmetric!0 (buf!1639 thiss!1379) (buf!1639 (_2!2876 lt!94615)) lt!94848 lt!94861))))

(declare-fun arrayBitRangesEq!0 (array!2765 array!2765 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!60825 (arrayBitRangesEq!0 (buf!1639 (_2!2876 lt!94615)) (buf!1639 thiss!1379) lt!94848 lt!94861)))

(declare-fun b!60826 () Bool)

(declare-fun res!50727 () Bool)

(assert (=> b!60826 (=> (not res!50727) (not e!40600))))

(assert (=> b!60826 (= res!50727 (isPrefixOf!0 (_1!2877 lt!94856) thiss!1379))))

(assert (= (and d!18638 c!4245) b!60825))

(assert (= (and d!18638 (not c!4245)) b!60824))

(assert (= (and d!18638 res!50725) b!60826))

(assert (= (and b!60826 res!50727) b!60823))

(assert (= (and b!60823 res!50726) b!60822))

(declare-fun m!95857 () Bool)

(assert (=> b!60823 m!95857))

(declare-fun m!95859 () Bool)

(assert (=> b!60826 m!95859))

(declare-fun m!95861 () Bool)

(assert (=> d!18638 m!95861))

(declare-fun m!95863 () Bool)

(assert (=> d!18638 m!95863))

(assert (=> d!18638 m!95699))

(declare-fun m!95865 () Bool)

(assert (=> d!18638 m!95865))

(declare-fun m!95867 () Bool)

(assert (=> d!18638 m!95867))

(declare-fun m!95869 () Bool)

(assert (=> d!18638 m!95869))

(declare-fun m!95871 () Bool)

(assert (=> d!18638 m!95871))

(assert (=> d!18638 m!95751))

(declare-fun m!95873 () Bool)

(assert (=> d!18638 m!95873))

(declare-fun m!95875 () Bool)

(assert (=> d!18638 m!95875))

(assert (=> d!18638 m!95749))

(declare-fun m!95877 () Bool)

(assert (=> b!60822 m!95877))

(assert (=> b!60822 m!95721))

(assert (=> b!60822 m!95753))

(assert (=> b!60825 m!95753))

(declare-fun m!95879 () Bool)

(assert (=> b!60825 m!95879))

(declare-fun m!95881 () Bool)

(assert (=> b!60825 m!95881))

(assert (=> b!60724 d!18638))

(declare-fun d!18642 () Bool)

(assert (=> d!18642 (validate_offset_bits!1 ((_ sign_extend 32) (size!1258 (buf!1639 (_2!2876 lt!94615)))) ((_ sign_extend 32) (currentByte!3257 (_2!2876 lt!94611))) ((_ sign_extend 32) (currentBit!3252 (_2!2876 lt!94611))) lt!94619)))

(declare-fun lt!94862 () Unit!4139)

(assert (=> d!18642 (= lt!94862 (choose!9 (_2!2876 lt!94611) (buf!1639 (_2!2876 lt!94615)) lt!94619 (BitStream!2205 (buf!1639 (_2!2876 lt!94615)) (currentByte!3257 (_2!2876 lt!94611)) (currentBit!3252 (_2!2876 lt!94611)))))))

(assert (=> d!18642 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2876 lt!94611) (buf!1639 (_2!2876 lt!94615)) lt!94619) lt!94862)))

(declare-fun bs!4673 () Bool)

(assert (= bs!4673 d!18642))

(assert (=> bs!4673 m!95733))

(declare-fun m!95883 () Bool)

(assert (=> bs!4673 m!95883))

(assert (=> b!60724 d!18642))

(declare-fun b!60827 () Bool)

(declare-fun e!40602 () Bool)

(declare-fun lt!94865 () (_ BitVec 64))

(declare-fun lt!94875 () (_ BitVec 64))

(declare-fun lt!94877 () tuple2!5532)

(assert (=> b!60827 (= e!40602 (= (_1!2877 lt!94877) (withMovedBitIndex!0 (_2!2877 lt!94877) (bvsub lt!94875 lt!94865))))))

(assert (=> b!60827 (or (= (bvand lt!94875 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!94865 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!94875 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!94875 lt!94865) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!60827 (= lt!94865 (bitIndex!0 (size!1258 (buf!1639 (_2!2876 lt!94615))) (currentByte!3257 (_2!2876 lt!94615)) (currentBit!3252 (_2!2876 lt!94615))))))

(assert (=> b!60827 (= lt!94875 (bitIndex!0 (size!1258 (buf!1639 (_2!2876 lt!94611))) (currentByte!3257 (_2!2876 lt!94611)) (currentBit!3252 (_2!2876 lt!94611))))))

(declare-fun b!60828 () Bool)

(declare-fun res!50729 () Bool)

(assert (=> b!60828 (=> (not res!50729) (not e!40602))))

(assert (=> b!60828 (= res!50729 (isPrefixOf!0 (_2!2877 lt!94877) (_2!2876 lt!94615)))))

(declare-fun d!18644 () Bool)

(assert (=> d!18644 e!40602))

(declare-fun res!50728 () Bool)

(assert (=> d!18644 (=> (not res!50728) (not e!40602))))

(assert (=> d!18644 (= res!50728 (isPrefixOf!0 (_1!2877 lt!94877) (_2!2877 lt!94877)))))

(declare-fun lt!94871 () BitStream!2204)

(assert (=> d!18644 (= lt!94877 (tuple2!5533 lt!94871 (_2!2876 lt!94615)))))

(declare-fun lt!94874 () Unit!4139)

(declare-fun lt!94872 () Unit!4139)

(assert (=> d!18644 (= lt!94874 lt!94872)))

(assert (=> d!18644 (isPrefixOf!0 lt!94871 (_2!2876 lt!94615))))

(assert (=> d!18644 (= lt!94872 (lemmaIsPrefixTransitive!0 lt!94871 (_2!2876 lt!94615) (_2!2876 lt!94615)))))

(declare-fun lt!94880 () Unit!4139)

(declare-fun lt!94873 () Unit!4139)

(assert (=> d!18644 (= lt!94880 lt!94873)))

(assert (=> d!18644 (isPrefixOf!0 lt!94871 (_2!2876 lt!94615))))

(assert (=> d!18644 (= lt!94873 (lemmaIsPrefixTransitive!0 lt!94871 (_2!2876 lt!94611) (_2!2876 lt!94615)))))

(declare-fun lt!94881 () Unit!4139)

(declare-fun e!40601 () Unit!4139)

(assert (=> d!18644 (= lt!94881 e!40601)))

(declare-fun c!4246 () Bool)

(assert (=> d!18644 (= c!4246 (not (= (size!1258 (buf!1639 (_2!2876 lt!94611))) #b00000000000000000000000000000000)))))

(declare-fun lt!94870 () Unit!4139)

(declare-fun lt!94879 () Unit!4139)

(assert (=> d!18644 (= lt!94870 lt!94879)))

(assert (=> d!18644 (isPrefixOf!0 (_2!2876 lt!94615) (_2!2876 lt!94615))))

(assert (=> d!18644 (= lt!94879 (lemmaIsPrefixRefl!0 (_2!2876 lt!94615)))))

(declare-fun lt!94866 () Unit!4139)

(declare-fun lt!94876 () Unit!4139)

(assert (=> d!18644 (= lt!94866 lt!94876)))

(assert (=> d!18644 (= lt!94876 (lemmaIsPrefixRefl!0 (_2!2876 lt!94615)))))

(declare-fun lt!94864 () Unit!4139)

(declare-fun lt!94867 () Unit!4139)

(assert (=> d!18644 (= lt!94864 lt!94867)))

(assert (=> d!18644 (isPrefixOf!0 lt!94871 lt!94871)))

(assert (=> d!18644 (= lt!94867 (lemmaIsPrefixRefl!0 lt!94871))))

(declare-fun lt!94878 () Unit!4139)

(declare-fun lt!94868 () Unit!4139)

(assert (=> d!18644 (= lt!94878 lt!94868)))

(assert (=> d!18644 (isPrefixOf!0 (_2!2876 lt!94611) (_2!2876 lt!94611))))

(assert (=> d!18644 (= lt!94868 (lemmaIsPrefixRefl!0 (_2!2876 lt!94611)))))

(assert (=> d!18644 (= lt!94871 (BitStream!2205 (buf!1639 (_2!2876 lt!94615)) (currentByte!3257 (_2!2876 lt!94611)) (currentBit!3252 (_2!2876 lt!94611))))))

(assert (=> d!18644 (isPrefixOf!0 (_2!2876 lt!94611) (_2!2876 lt!94615))))

(assert (=> d!18644 (= (reader!0 (_2!2876 lt!94611) (_2!2876 lt!94615)) lt!94877)))

(declare-fun b!60829 () Bool)

(declare-fun Unit!4155 () Unit!4139)

(assert (=> b!60829 (= e!40601 Unit!4155)))

(declare-fun b!60830 () Bool)

(declare-fun lt!94863 () Unit!4139)

(assert (=> b!60830 (= e!40601 lt!94863)))

(declare-fun lt!94869 () (_ BitVec 64))

(assert (=> b!60830 (= lt!94869 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!94882 () (_ BitVec 64))

(assert (=> b!60830 (= lt!94882 (bitIndex!0 (size!1258 (buf!1639 (_2!2876 lt!94611))) (currentByte!3257 (_2!2876 lt!94611)) (currentBit!3252 (_2!2876 lt!94611))))))

(assert (=> b!60830 (= lt!94863 (arrayBitRangesEqSymmetric!0 (buf!1639 (_2!2876 lt!94611)) (buf!1639 (_2!2876 lt!94615)) lt!94869 lt!94882))))

(assert (=> b!60830 (arrayBitRangesEq!0 (buf!1639 (_2!2876 lt!94615)) (buf!1639 (_2!2876 lt!94611)) lt!94869 lt!94882)))

(declare-fun b!60831 () Bool)

(declare-fun res!50730 () Bool)

(assert (=> b!60831 (=> (not res!50730) (not e!40602))))

(assert (=> b!60831 (= res!50730 (isPrefixOf!0 (_1!2877 lt!94877) (_2!2876 lt!94611)))))

(assert (= (and d!18644 c!4246) b!60830))

(assert (= (and d!18644 (not c!4246)) b!60829))

(assert (= (and d!18644 res!50728) b!60831))

(assert (= (and b!60831 res!50730) b!60828))

(assert (= (and b!60828 res!50729) b!60827))

(declare-fun m!95885 () Bool)

(assert (=> b!60828 m!95885))

(declare-fun m!95887 () Bool)

(assert (=> b!60831 m!95887))

(declare-fun m!95889 () Bool)

(assert (=> d!18644 m!95889))

(declare-fun m!95891 () Bool)

(assert (=> d!18644 m!95891))

(assert (=> d!18644 m!95697))

(assert (=> d!18644 m!95865))

(declare-fun m!95893 () Bool)

(assert (=> d!18644 m!95893))

(declare-fun m!95895 () Bool)

(assert (=> d!18644 m!95895))

(assert (=> d!18644 m!95871))

(declare-fun m!95897 () Bool)

(assert (=> d!18644 m!95897))

(declare-fun m!95899 () Bool)

(assert (=> d!18644 m!95899))

(declare-fun m!95901 () Bool)

(assert (=> d!18644 m!95901))

(declare-fun m!95903 () Bool)

(assert (=> d!18644 m!95903))

(declare-fun m!95905 () Bool)

(assert (=> b!60827 m!95905))

(assert (=> b!60827 m!95721))

(assert (=> b!60827 m!95707))

(assert (=> b!60830 m!95707))

(declare-fun m!95907 () Bool)

(assert (=> b!60830 m!95907))

(declare-fun m!95909 () Bool)

(assert (=> b!60830 m!95909))

(assert (=> b!60724 d!18644))

(declare-fun b!60851 () Bool)

(declare-fun e!40614 () Bool)

(declare-fun lt!94895 () List!677)

(declare-fun isEmpty!181 (List!677) Bool)

(assert (=> b!60851 (= e!40614 (isEmpty!181 lt!94895))))

(declare-fun d!18646 () Bool)

(assert (=> d!18646 e!40614))

(declare-fun c!4252 () Bool)

(assert (=> d!18646 (= c!4252 (= lt!94619 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!5544 0))(
  ( (tuple2!5545 (_1!2883 List!677) (_2!2883 BitStream!2204)) )
))
(declare-fun e!40613 () tuple2!5544)

(assert (=> d!18646 (= lt!94895 (_1!2883 e!40613))))

(declare-fun c!4251 () Bool)

(assert (=> d!18646 (= c!4251 (= lt!94619 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18646 (bvsge lt!94619 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!18646 (= (bitStreamReadBitsIntoList!0 (_2!2876 lt!94615) (_1!2877 lt!94617) lt!94619) lt!94895)))

(declare-fun b!60849 () Bool)

(assert (=> b!60849 (= e!40613 (tuple2!5545 Nil!674 (_1!2877 lt!94617)))))

(declare-fun b!60850 () Bool)

(declare-datatypes ((tuple2!5546 0))(
  ( (tuple2!5547 (_1!2884 Bool) (_2!2884 BitStream!2204)) )
))
(declare-fun lt!94897 () tuple2!5546)

(declare-fun lt!94896 () (_ BitVec 64))

(assert (=> b!60850 (= e!40613 (tuple2!5545 (Cons!673 (_1!2884 lt!94897) (bitStreamReadBitsIntoList!0 (_2!2876 lt!94615) (_2!2884 lt!94897) (bvsub lt!94619 lt!94896))) (_2!2884 lt!94897)))))

(declare-fun readBit!0 (BitStream!2204) tuple2!5546)

(assert (=> b!60850 (= lt!94897 (readBit!0 (_1!2877 lt!94617)))))

(assert (=> b!60850 (= lt!94896 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!60852 () Bool)

(assert (=> b!60852 (= e!40614 (> (length!305 lt!94895) 0))))

(assert (= (and d!18646 c!4251) b!60849))

(assert (= (and d!18646 (not c!4251)) b!60850))

(assert (= (and d!18646 c!4252) b!60851))

(assert (= (and d!18646 (not c!4252)) b!60852))

(declare-fun m!95919 () Bool)

(assert (=> b!60851 m!95919))

(declare-fun m!95921 () Bool)

(assert (=> b!60850 m!95921))

(declare-fun m!95923 () Bool)

(assert (=> b!60850 m!95923))

(declare-fun m!95925 () Bool)

(assert (=> b!60852 m!95925))

(assert (=> b!60724 d!18646))

(declare-fun d!18656 () Bool)

(assert (=> d!18656 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1258 (buf!1639 (_2!2876 lt!94615)))) ((_ sign_extend 32) (currentByte!3257 (_2!2876 lt!94611))) ((_ sign_extend 32) (currentBit!3252 (_2!2876 lt!94611))) lt!94619) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1258 (buf!1639 (_2!2876 lt!94615)))) ((_ sign_extend 32) (currentByte!3257 (_2!2876 lt!94611))) ((_ sign_extend 32) (currentBit!3252 (_2!2876 lt!94611)))) lt!94619))))

(declare-fun bs!4677 () Bool)

(assert (= bs!4677 d!18656))

(declare-fun m!95927 () Bool)

(assert (=> bs!4677 m!95927))

(assert (=> b!60724 d!18656))

(declare-fun d!18658 () Bool)

(assert (=> d!18658 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1258 (buf!1639 (_2!2876 lt!94615)))) ((_ sign_extend 32) (currentByte!3257 thiss!1379)) ((_ sign_extend 32) (currentBit!3252 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1258 (buf!1639 (_2!2876 lt!94615)))) ((_ sign_extend 32) (currentByte!3257 thiss!1379)) ((_ sign_extend 32) (currentBit!3252 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4678 () Bool)

(assert (= bs!4678 d!18658))

(declare-fun m!95929 () Bool)

(assert (=> bs!4678 m!95929))

(assert (=> b!60724 d!18658))

(declare-fun b!60855 () Bool)

(declare-fun e!40616 () Bool)

(declare-fun lt!94898 () List!677)

(assert (=> b!60855 (= e!40616 (isEmpty!181 lt!94898))))

(declare-fun d!18660 () Bool)

(assert (=> d!18660 e!40616))

(declare-fun c!4254 () Bool)

(assert (=> d!18660 (= c!4254 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!40615 () tuple2!5544)

(assert (=> d!18660 (= lt!94898 (_1!2883 e!40615))))

(declare-fun c!4253 () Bool)

(assert (=> d!18660 (= c!4253 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18660 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!18660 (= (bitStreamReadBitsIntoList!0 (_2!2876 lt!94615) (_1!2877 lt!94624) (bvsub to!314 i!635)) lt!94898)))

(declare-fun b!60853 () Bool)

(assert (=> b!60853 (= e!40615 (tuple2!5545 Nil!674 (_1!2877 lt!94624)))))

(declare-fun lt!94899 () (_ BitVec 64))

(declare-fun b!60854 () Bool)

(declare-fun lt!94900 () tuple2!5546)

(assert (=> b!60854 (= e!40615 (tuple2!5545 (Cons!673 (_1!2884 lt!94900) (bitStreamReadBitsIntoList!0 (_2!2876 lt!94615) (_2!2884 lt!94900) (bvsub (bvsub to!314 i!635) lt!94899))) (_2!2884 lt!94900)))))

(assert (=> b!60854 (= lt!94900 (readBit!0 (_1!2877 lt!94624)))))

(assert (=> b!60854 (= lt!94899 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!60856 () Bool)

(assert (=> b!60856 (= e!40616 (> (length!305 lt!94898) 0))))

(assert (= (and d!18660 c!4253) b!60853))

(assert (= (and d!18660 (not c!4253)) b!60854))

(assert (= (and d!18660 c!4254) b!60855))

(assert (= (and d!18660 (not c!4254)) b!60856))

(declare-fun m!95931 () Bool)

(assert (=> b!60855 m!95931))

(declare-fun m!95933 () Bool)

(assert (=> b!60854 m!95933))

(declare-fun m!95935 () Bool)

(assert (=> b!60854 m!95935))

(declare-fun m!95937 () Bool)

(assert (=> b!60856 m!95937))

(assert (=> b!60724 d!18660))

(declare-fun d!18662 () Bool)

(assert (=> d!18662 (= (invariant!0 (currentBit!3252 (_2!2876 lt!94611)) (currentByte!3257 (_2!2876 lt!94611)) (size!1258 (buf!1639 (_2!2876 lt!94615)))) (and (bvsge (currentBit!3252 (_2!2876 lt!94611)) #b00000000000000000000000000000000) (bvslt (currentBit!3252 (_2!2876 lt!94611)) #b00000000000000000000000000001000) (bvsge (currentByte!3257 (_2!2876 lt!94611)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3257 (_2!2876 lt!94611)) (size!1258 (buf!1639 (_2!2876 lt!94615)))) (and (= (currentBit!3252 (_2!2876 lt!94611)) #b00000000000000000000000000000000) (= (currentByte!3257 (_2!2876 lt!94611)) (size!1258 (buf!1639 (_2!2876 lt!94615))))))))))

(assert (=> b!60734 d!18662))

(declare-fun d!18664 () Bool)

(assert (=> d!18664 (= (invariant!0 (currentBit!3252 (_2!2876 lt!94615)) (currentByte!3257 (_2!2876 lt!94615)) (size!1258 (buf!1639 (_2!2876 lt!94615)))) (and (bvsge (currentBit!3252 (_2!2876 lt!94615)) #b00000000000000000000000000000000) (bvslt (currentBit!3252 (_2!2876 lt!94615)) #b00000000000000000000000000001000) (bvsge (currentByte!3257 (_2!2876 lt!94615)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3257 (_2!2876 lt!94615)) (size!1258 (buf!1639 (_2!2876 lt!94615)))) (and (= (currentBit!3252 (_2!2876 lt!94615)) #b00000000000000000000000000000000) (= (currentByte!3257 (_2!2876 lt!94615)) (size!1258 (buf!1639 (_2!2876 lt!94615))))))))))

(assert (=> b!60733 d!18664))

(declare-fun d!18666 () Bool)

(assert (=> d!18666 (= (array_inv!1161 srcBuffer!2) (bvsge (size!1258 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!11908 d!18666))

(declare-fun d!18668 () Bool)

(assert (=> d!18668 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3252 thiss!1379) (currentByte!3257 thiss!1379) (size!1258 (buf!1639 thiss!1379))))))

(declare-fun bs!4679 () Bool)

(assert (= bs!4679 d!18668))

(declare-fun m!95939 () Bool)

(assert (=> bs!4679 m!95939))

(assert (=> start!11908 d!18668))

(declare-fun d!18670 () Bool)

(declare-fun res!50748 () Bool)

(declare-fun e!40621 () Bool)

(assert (=> d!18670 (=> (not res!50748) (not e!40621))))

(assert (=> d!18670 (= res!50748 (= (size!1258 (buf!1639 thiss!1379)) (size!1258 (buf!1639 thiss!1379))))))

(assert (=> d!18670 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!40621)))

(declare-fun b!60863 () Bool)

(declare-fun res!50746 () Bool)

(assert (=> b!60863 (=> (not res!50746) (not e!40621))))

(assert (=> b!60863 (= res!50746 (bvsle (bitIndex!0 (size!1258 (buf!1639 thiss!1379)) (currentByte!3257 thiss!1379) (currentBit!3252 thiss!1379)) (bitIndex!0 (size!1258 (buf!1639 thiss!1379)) (currentByte!3257 thiss!1379) (currentBit!3252 thiss!1379))))))

(declare-fun b!60864 () Bool)

(declare-fun e!40622 () Bool)

(assert (=> b!60864 (= e!40621 e!40622)))

(declare-fun res!50747 () Bool)

(assert (=> b!60864 (=> res!50747 e!40622)))

(assert (=> b!60864 (= res!50747 (= (size!1258 (buf!1639 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!60865 () Bool)

(assert (=> b!60865 (= e!40622 (arrayBitRangesEq!0 (buf!1639 thiss!1379) (buf!1639 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1258 (buf!1639 thiss!1379)) (currentByte!3257 thiss!1379) (currentBit!3252 thiss!1379))))))

(assert (= (and d!18670 res!50748) b!60863))

(assert (= (and b!60863 res!50746) b!60864))

(assert (= (and b!60864 (not res!50747)) b!60865))

(assert (=> b!60863 m!95753))

(assert (=> b!60863 m!95753))

(assert (=> b!60865 m!95753))

(assert (=> b!60865 m!95753))

(declare-fun m!95941 () Bool)

(assert (=> b!60865 m!95941))

(assert (=> b!60737 d!18670))

(declare-fun d!18672 () Bool)

(assert (=> d!18672 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!94903 () Unit!4139)

(declare-fun choose!11 (BitStream!2204) Unit!4139)

(assert (=> d!18672 (= lt!94903 (choose!11 thiss!1379))))

(assert (=> d!18672 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!94903)))

(declare-fun bs!4681 () Bool)

(assert (= bs!4681 d!18672))

(assert (=> bs!4681 m!95749))

(declare-fun m!95943 () Bool)

(assert (=> bs!4681 m!95943))

(assert (=> b!60737 d!18672))

(declare-fun d!18674 () Bool)

(declare-fun e!40623 () Bool)

(assert (=> d!18674 e!40623))

(declare-fun res!50749 () Bool)

(assert (=> d!18674 (=> (not res!50749) (not e!40623))))

(declare-fun lt!94909 () (_ BitVec 64))

(declare-fun lt!94906 () (_ BitVec 64))

(declare-fun lt!94904 () (_ BitVec 64))

(assert (=> d!18674 (= res!50749 (= lt!94904 (bvsub lt!94909 lt!94906)))))

(assert (=> d!18674 (or (= (bvand lt!94909 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!94906 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!94909 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!94909 lt!94906) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18674 (= lt!94906 (remainingBits!0 ((_ sign_extend 32) (size!1258 (buf!1639 thiss!1379))) ((_ sign_extend 32) (currentByte!3257 thiss!1379)) ((_ sign_extend 32) (currentBit!3252 thiss!1379))))))

(declare-fun lt!94908 () (_ BitVec 64))

(declare-fun lt!94907 () (_ BitVec 64))

(assert (=> d!18674 (= lt!94909 (bvmul lt!94908 lt!94907))))

(assert (=> d!18674 (or (= lt!94908 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!94907 (bvsdiv (bvmul lt!94908 lt!94907) lt!94908)))))

(assert (=> d!18674 (= lt!94907 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18674 (= lt!94908 ((_ sign_extend 32) (size!1258 (buf!1639 thiss!1379))))))

(assert (=> d!18674 (= lt!94904 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3257 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3252 thiss!1379))))))

(assert (=> d!18674 (invariant!0 (currentBit!3252 thiss!1379) (currentByte!3257 thiss!1379) (size!1258 (buf!1639 thiss!1379)))))

(assert (=> d!18674 (= (bitIndex!0 (size!1258 (buf!1639 thiss!1379)) (currentByte!3257 thiss!1379) (currentBit!3252 thiss!1379)) lt!94904)))

(declare-fun b!60866 () Bool)

(declare-fun res!50750 () Bool)

(assert (=> b!60866 (=> (not res!50750) (not e!40623))))

(assert (=> b!60866 (= res!50750 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!94904))))

(declare-fun b!60867 () Bool)

(declare-fun lt!94905 () (_ BitVec 64))

(assert (=> b!60867 (= e!40623 (bvsle lt!94904 (bvmul lt!94905 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!60867 (or (= lt!94905 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!94905 #b0000000000000000000000000000000000000000000000000000000000001000) lt!94905)))))

(assert (=> b!60867 (= lt!94905 ((_ sign_extend 32) (size!1258 (buf!1639 thiss!1379))))))

(assert (= (and d!18674 res!50749) b!60866))

(assert (= (and b!60866 res!50750) b!60867))

(assert (=> d!18674 m!95825))

(assert (=> d!18674 m!95939))

(assert (=> b!60737 d!18674))

(declare-fun d!18676 () Bool)

(declare-fun res!50753 () Bool)

(declare-fun e!40624 () Bool)

(assert (=> d!18676 (=> (not res!50753) (not e!40624))))

(assert (=> d!18676 (= res!50753 (= (size!1258 (buf!1639 thiss!1379)) (size!1258 (buf!1639 (_2!2876 lt!94611)))))))

(assert (=> d!18676 (= (isPrefixOf!0 thiss!1379 (_2!2876 lt!94611)) e!40624)))

(declare-fun b!60868 () Bool)

(declare-fun res!50751 () Bool)

(assert (=> b!60868 (=> (not res!50751) (not e!40624))))

(assert (=> b!60868 (= res!50751 (bvsle (bitIndex!0 (size!1258 (buf!1639 thiss!1379)) (currentByte!3257 thiss!1379) (currentBit!3252 thiss!1379)) (bitIndex!0 (size!1258 (buf!1639 (_2!2876 lt!94611))) (currentByte!3257 (_2!2876 lt!94611)) (currentBit!3252 (_2!2876 lt!94611)))))))

(declare-fun b!60869 () Bool)

(declare-fun e!40625 () Bool)

(assert (=> b!60869 (= e!40624 e!40625)))

(declare-fun res!50752 () Bool)

(assert (=> b!60869 (=> res!50752 e!40625)))

(assert (=> b!60869 (= res!50752 (= (size!1258 (buf!1639 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!60870 () Bool)

(assert (=> b!60870 (= e!40625 (arrayBitRangesEq!0 (buf!1639 thiss!1379) (buf!1639 (_2!2876 lt!94611)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1258 (buf!1639 thiss!1379)) (currentByte!3257 thiss!1379) (currentBit!3252 thiss!1379))))))

(assert (= (and d!18676 res!50753) b!60868))

(assert (= (and b!60868 res!50751) b!60869))

(assert (= (and b!60869 (not res!50752)) b!60870))

(assert (=> b!60868 m!95753))

(assert (=> b!60868 m!95707))

(assert (=> b!60870 m!95753))

(assert (=> b!60870 m!95753))

(declare-fun m!95945 () Bool)

(assert (=> b!60870 m!95945))

(assert (=> b!60726 d!18676))

(declare-fun d!18678 () Bool)

(assert (=> d!18678 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1258 (buf!1639 (_2!2876 lt!94611)))) ((_ sign_extend 32) (currentByte!3257 (_2!2876 lt!94611))) ((_ sign_extend 32) (currentBit!3252 (_2!2876 lt!94611))) lt!94619) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1258 (buf!1639 (_2!2876 lt!94611)))) ((_ sign_extend 32) (currentByte!3257 (_2!2876 lt!94611))) ((_ sign_extend 32) (currentBit!3252 (_2!2876 lt!94611)))) lt!94619))))

(declare-fun bs!4682 () Bool)

(assert (= bs!4682 d!18678))

(assert (=> bs!4682 m!95827))

(assert (=> b!60726 d!18678))

(declare-fun d!18680 () Bool)

(declare-fun e!40628 () Bool)

(assert (=> d!18680 e!40628))

(declare-fun res!50756 () Bool)

(assert (=> d!18680 (=> (not res!50756) (not e!40628))))

(assert (=> d!18680 (= res!50756 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!94912 () Unit!4139)

(declare-fun choose!27 (BitStream!2204 BitStream!2204 (_ BitVec 64) (_ BitVec 64)) Unit!4139)

(assert (=> d!18680 (= lt!94912 (choose!27 thiss!1379 (_2!2876 lt!94611) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!18680 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!18680 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2876 lt!94611) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!94912)))

(declare-fun b!60873 () Bool)

(assert (=> b!60873 (= e!40628 (validate_offset_bits!1 ((_ sign_extend 32) (size!1258 (buf!1639 (_2!2876 lt!94611)))) ((_ sign_extend 32) (currentByte!3257 (_2!2876 lt!94611))) ((_ sign_extend 32) (currentBit!3252 (_2!2876 lt!94611))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!18680 res!50756) b!60873))

(declare-fun m!95947 () Bool)

(assert (=> d!18680 m!95947))

(declare-fun m!95949 () Bool)

(assert (=> b!60873 m!95949))

(assert (=> b!60726 d!18680))

(declare-fun b!60891 () Bool)

(declare-fun res!50777 () Bool)

(declare-fun e!40640 () Bool)

(assert (=> b!60891 (=> (not res!50777) (not e!40640))))

(declare-fun lt!94939 () tuple2!5530)

(assert (=> b!60891 (= res!50777 (= (bitIndex!0 (size!1258 (buf!1639 (_2!2876 lt!94939))) (currentByte!3257 (_2!2876 lt!94939)) (currentBit!3252 (_2!2876 lt!94939))) (bvadd (bitIndex!0 (size!1258 (buf!1639 thiss!1379)) (currentByte!3257 thiss!1379) (currentBit!3252 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!60892 () Bool)

(declare-fun res!50773 () Bool)

(assert (=> b!60892 (=> (not res!50773) (not e!40640))))

(assert (=> b!60892 (= res!50773 (isPrefixOf!0 thiss!1379 (_2!2876 lt!94939)))))

(declare-fun b!60893 () Bool)

(declare-fun e!40639 () Bool)

(declare-datatypes ((tuple2!5552 0))(
  ( (tuple2!5553 (_1!2887 BitStream!2204) (_2!2887 Bool)) )
))
(declare-fun lt!94942 () tuple2!5552)

(assert (=> b!60893 (= e!40639 (= (bitIndex!0 (size!1258 (buf!1639 (_1!2887 lt!94942))) (currentByte!3257 (_1!2887 lt!94942)) (currentBit!3252 (_1!2887 lt!94942))) (bitIndex!0 (size!1258 (buf!1639 (_2!2876 lt!94939))) (currentByte!3257 (_2!2876 lt!94939)) (currentBit!3252 (_2!2876 lt!94939)))))))

(declare-fun b!60895 () Bool)

(declare-fun res!50775 () Bool)

(declare-fun e!40637 () Bool)

(assert (=> b!60895 (=> (not res!50775) (not e!40637))))

(declare-fun lt!94945 () tuple2!5530)

(assert (=> b!60895 (= res!50775 (isPrefixOf!0 thiss!1379 (_2!2876 lt!94945)))))

(declare-fun b!60896 () Bool)

(declare-fun res!50776 () Bool)

(assert (=> b!60896 (=> (not res!50776) (not e!40637))))

(declare-fun lt!94937 () (_ BitVec 64))

(declare-fun lt!94948 () (_ BitVec 64))

(assert (=> b!60896 (= res!50776 (= (bitIndex!0 (size!1258 (buf!1639 (_2!2876 lt!94945))) (currentByte!3257 (_2!2876 lt!94945)) (currentBit!3252 (_2!2876 lt!94945))) (bvadd lt!94948 lt!94937)))))

(assert (=> b!60896 (or (not (= (bvand lt!94948 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!94937 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!94948 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!94948 lt!94937) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!60896 (= lt!94937 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!60896 (= lt!94948 (bitIndex!0 (size!1258 (buf!1639 thiss!1379)) (currentByte!3257 thiss!1379) (currentBit!3252 thiss!1379)))))

(declare-fun d!18682 () Bool)

(assert (=> d!18682 e!40637))

(declare-fun res!50774 () Bool)

(assert (=> d!18682 (=> (not res!50774) (not e!40637))))

(assert (=> d!18682 (= res!50774 (= (size!1258 (buf!1639 (_2!2876 lt!94945))) (size!1258 (buf!1639 thiss!1379))))))

(declare-fun lt!94947 () (_ BitVec 8))

(declare-fun lt!94938 () array!2765)

(assert (=> d!18682 (= lt!94947 (select (arr!1822 lt!94938) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!18682 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1258 lt!94938)))))

(assert (=> d!18682 (= lt!94938 (array!2766 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!94943 () tuple2!5530)

(assert (=> d!18682 (= lt!94945 (tuple2!5531 (_1!2876 lt!94943) (_2!2876 lt!94943)))))

(assert (=> d!18682 (= lt!94943 lt!94939)))

(assert (=> d!18682 e!40640))

(declare-fun res!50778 () Bool)

(assert (=> d!18682 (=> (not res!50778) (not e!40640))))

(assert (=> d!18682 (= res!50778 (= (size!1258 (buf!1639 thiss!1379)) (size!1258 (buf!1639 (_2!2876 lt!94939)))))))

(declare-fun lt!94944 () Bool)

(declare-fun appendBit!0 (BitStream!2204 Bool) tuple2!5530)

(assert (=> d!18682 (= lt!94939 (appendBit!0 thiss!1379 lt!94944))))

(assert (=> d!18682 (= lt!94944 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1822 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!18682 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!18682 (= (appendBitFromByte!0 thiss!1379 (select (arr!1822 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!94945)))

(declare-fun b!60894 () Bool)

(declare-fun e!40638 () Bool)

(declare-fun lt!94940 () tuple2!5552)

(assert (=> b!60894 (= e!40638 (= (bitIndex!0 (size!1258 (buf!1639 (_1!2887 lt!94940))) (currentByte!3257 (_1!2887 lt!94940)) (currentBit!3252 (_1!2887 lt!94940))) (bitIndex!0 (size!1258 (buf!1639 (_2!2876 lt!94945))) (currentByte!3257 (_2!2876 lt!94945)) (currentBit!3252 (_2!2876 lt!94945)))))))

(declare-fun b!60897 () Bool)

(assert (=> b!60897 (= e!40640 e!40639)))

(declare-fun res!50780 () Bool)

(assert (=> b!60897 (=> (not res!50780) (not e!40639))))

(assert (=> b!60897 (= res!50780 (and (= (_2!2887 lt!94942) lt!94944) (= (_1!2887 lt!94942) (_2!2876 lt!94939))))))

(declare-fun readBitPure!0 (BitStream!2204) tuple2!5552)

(declare-fun readerFrom!0 (BitStream!2204 (_ BitVec 32) (_ BitVec 32)) BitStream!2204)

(assert (=> b!60897 (= lt!94942 (readBitPure!0 (readerFrom!0 (_2!2876 lt!94939) (currentBit!3252 thiss!1379) (currentByte!3257 thiss!1379))))))

(declare-fun b!60898 () Bool)

(assert (=> b!60898 (= e!40637 e!40638)))

(declare-fun res!50779 () Bool)

(assert (=> b!60898 (=> (not res!50779) (not e!40638))))

(assert (=> b!60898 (= res!50779 (and (= (_2!2887 lt!94940) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1822 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!94947)) #b00000000000000000000000000000000))) (= (_1!2887 lt!94940) (_2!2876 lt!94945))))))

(declare-datatypes ((tuple2!5554 0))(
  ( (tuple2!5555 (_1!2888 array!2765) (_2!2888 BitStream!2204)) )
))
(declare-fun lt!94941 () tuple2!5554)

(declare-fun lt!94946 () BitStream!2204)

(declare-fun readBits!0 (BitStream!2204 (_ BitVec 64)) tuple2!5554)

(assert (=> b!60898 (= lt!94941 (readBits!0 lt!94946 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!60898 (= lt!94940 (readBitPure!0 lt!94946))))

(assert (=> b!60898 (= lt!94946 (readerFrom!0 (_2!2876 lt!94945) (currentBit!3252 thiss!1379) (currentByte!3257 thiss!1379)))))

(assert (= (and d!18682 res!50778) b!60891))

(assert (= (and b!60891 res!50777) b!60892))

(assert (= (and b!60892 res!50773) b!60897))

(assert (= (and b!60897 res!50780) b!60893))

(assert (= (and d!18682 res!50774) b!60896))

(assert (= (and b!60896 res!50776) b!60895))

(assert (= (and b!60895 res!50775) b!60898))

(assert (= (and b!60898 res!50779) b!60894))

(declare-fun m!95951 () Bool)

(assert (=> b!60897 m!95951))

(assert (=> b!60897 m!95951))

(declare-fun m!95953 () Bool)

(assert (=> b!60897 m!95953))

(declare-fun m!95955 () Bool)

(assert (=> b!60893 m!95955))

(declare-fun m!95957 () Bool)

(assert (=> b!60893 m!95957))

(declare-fun m!95959 () Bool)

(assert (=> b!60894 m!95959))

(declare-fun m!95961 () Bool)

(assert (=> b!60894 m!95961))

(declare-fun m!95963 () Bool)

(assert (=> b!60898 m!95963))

(declare-fun m!95965 () Bool)

(assert (=> b!60898 m!95965))

(declare-fun m!95967 () Bool)

(assert (=> b!60898 m!95967))

(assert (=> b!60896 m!95961))

(assert (=> b!60896 m!95753))

(declare-fun m!95969 () Bool)

(assert (=> d!18682 m!95969))

(declare-fun m!95971 () Bool)

(assert (=> d!18682 m!95971))

(declare-fun m!95973 () Bool)

(assert (=> d!18682 m!95973))

(assert (=> b!60891 m!95957))

(assert (=> b!60891 m!95753))

(declare-fun m!95975 () Bool)

(assert (=> b!60895 m!95975))

(declare-fun m!95977 () Bool)

(assert (=> b!60892 m!95977))

(assert (=> b!60726 d!18682))

(declare-fun d!18684 () Bool)

(declare-fun res!50783 () Bool)

(declare-fun e!40641 () Bool)

(assert (=> d!18684 (=> (not res!50783) (not e!40641))))

(assert (=> d!18684 (= res!50783 (= (size!1258 (buf!1639 (_1!2877 lt!94624))) (size!1258 (buf!1639 (_2!2876 lt!94615)))))))

(assert (=> d!18684 (= (isPrefixOf!0 (_1!2877 lt!94624) (_2!2876 lt!94615)) e!40641)))

(declare-fun b!60899 () Bool)

(declare-fun res!50781 () Bool)

(assert (=> b!60899 (=> (not res!50781) (not e!40641))))

(assert (=> b!60899 (= res!50781 (bvsle (bitIndex!0 (size!1258 (buf!1639 (_1!2877 lt!94624))) (currentByte!3257 (_1!2877 lt!94624)) (currentBit!3252 (_1!2877 lt!94624))) (bitIndex!0 (size!1258 (buf!1639 (_2!2876 lt!94615))) (currentByte!3257 (_2!2876 lt!94615)) (currentBit!3252 (_2!2876 lt!94615)))))))

(declare-fun b!60900 () Bool)

(declare-fun e!40642 () Bool)

(assert (=> b!60900 (= e!40641 e!40642)))

(declare-fun res!50782 () Bool)

(assert (=> b!60900 (=> res!50782 e!40642)))

(assert (=> b!60900 (= res!50782 (= (size!1258 (buf!1639 (_1!2877 lt!94624))) #b00000000000000000000000000000000))))

(declare-fun b!60901 () Bool)

(assert (=> b!60901 (= e!40642 (arrayBitRangesEq!0 (buf!1639 (_1!2877 lt!94624)) (buf!1639 (_2!2876 lt!94615)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1258 (buf!1639 (_1!2877 lt!94624))) (currentByte!3257 (_1!2877 lt!94624)) (currentBit!3252 (_1!2877 lt!94624)))))))

(assert (= (and d!18684 res!50783) b!60899))

(assert (= (and b!60899 res!50781) b!60900))

(assert (= (and b!60900 (not res!50782)) b!60901))

(declare-fun m!95979 () Bool)

(assert (=> b!60899 m!95979))

(assert (=> b!60899 m!95721))

(assert (=> b!60901 m!95979))

(assert (=> b!60901 m!95979))

(declare-fun m!95981 () Bool)

(assert (=> b!60901 m!95981))

(assert (=> b!60725 d!18684))

(declare-fun d!18686 () Bool)

(assert (=> d!18686 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1258 (buf!1639 (_2!2876 lt!94611)))) ((_ sign_extend 32) (currentByte!3257 thiss!1379)) ((_ sign_extend 32) (currentBit!3252 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1258 (buf!1639 (_2!2876 lt!94611)))) ((_ sign_extend 32) (currentByte!3257 thiss!1379)) ((_ sign_extend 32) (currentBit!3252 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4683 () Bool)

(assert (= bs!4683 d!18686))

(declare-fun m!95983 () Bool)

(assert (=> bs!4683 m!95983))

(assert (=> b!60729 d!18686))

(declare-fun d!18688 () Bool)

(declare-fun res!50786 () Bool)

(declare-fun e!40643 () Bool)

(assert (=> d!18688 (=> (not res!50786) (not e!40643))))

(assert (=> d!18688 (= res!50786 (= (size!1258 (buf!1639 (_2!2876 lt!94611))) (size!1258 (buf!1639 (_2!2876 lt!94615)))))))

(assert (=> d!18688 (= (isPrefixOf!0 (_2!2876 lt!94611) (_2!2876 lt!94615)) e!40643)))

(declare-fun b!60902 () Bool)

(declare-fun res!50784 () Bool)

(assert (=> b!60902 (=> (not res!50784) (not e!40643))))

(assert (=> b!60902 (= res!50784 (bvsle (bitIndex!0 (size!1258 (buf!1639 (_2!2876 lt!94611))) (currentByte!3257 (_2!2876 lt!94611)) (currentBit!3252 (_2!2876 lt!94611))) (bitIndex!0 (size!1258 (buf!1639 (_2!2876 lt!94615))) (currentByte!3257 (_2!2876 lt!94615)) (currentBit!3252 (_2!2876 lt!94615)))))))

(declare-fun b!60903 () Bool)

(declare-fun e!40644 () Bool)

(assert (=> b!60903 (= e!40643 e!40644)))

(declare-fun res!50785 () Bool)

(assert (=> b!60903 (=> res!50785 e!40644)))

(assert (=> b!60903 (= res!50785 (= (size!1258 (buf!1639 (_2!2876 lt!94611))) #b00000000000000000000000000000000))))

(declare-fun b!60904 () Bool)

(assert (=> b!60904 (= e!40644 (arrayBitRangesEq!0 (buf!1639 (_2!2876 lt!94611)) (buf!1639 (_2!2876 lt!94615)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1258 (buf!1639 (_2!2876 lt!94611))) (currentByte!3257 (_2!2876 lt!94611)) (currentBit!3252 (_2!2876 lt!94611)))))))

(assert (= (and d!18688 res!50786) b!60902))

(assert (= (and b!60902 res!50784) b!60903))

(assert (= (and b!60903 (not res!50785)) b!60904))

(assert (=> b!60902 m!95707))

(assert (=> b!60902 m!95721))

(assert (=> b!60904 m!95707))

(assert (=> b!60904 m!95707))

(declare-fun m!95985 () Bool)

(assert (=> b!60904 m!95985))

(assert (=> b!60729 d!18688))

(declare-fun d!18690 () Bool)

(declare-fun res!50789 () Bool)

(declare-fun e!40645 () Bool)

(assert (=> d!18690 (=> (not res!50789) (not e!40645))))

(assert (=> d!18690 (= res!50789 (= (size!1258 (buf!1639 thiss!1379)) (size!1258 (buf!1639 (_2!2876 lt!94615)))))))

(assert (=> d!18690 (= (isPrefixOf!0 thiss!1379 (_2!2876 lt!94615)) e!40645)))

(declare-fun b!60905 () Bool)

(declare-fun res!50787 () Bool)

(assert (=> b!60905 (=> (not res!50787) (not e!40645))))

(assert (=> b!60905 (= res!50787 (bvsle (bitIndex!0 (size!1258 (buf!1639 thiss!1379)) (currentByte!3257 thiss!1379) (currentBit!3252 thiss!1379)) (bitIndex!0 (size!1258 (buf!1639 (_2!2876 lt!94615))) (currentByte!3257 (_2!2876 lt!94615)) (currentBit!3252 (_2!2876 lt!94615)))))))

(declare-fun b!60906 () Bool)

(declare-fun e!40646 () Bool)

(assert (=> b!60906 (= e!40645 e!40646)))

(declare-fun res!50788 () Bool)

(assert (=> b!60906 (=> res!50788 e!40646)))

(assert (=> b!60906 (= res!50788 (= (size!1258 (buf!1639 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!60907 () Bool)

(assert (=> b!60907 (= e!40646 (arrayBitRangesEq!0 (buf!1639 thiss!1379) (buf!1639 (_2!2876 lt!94615)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1258 (buf!1639 thiss!1379)) (currentByte!3257 thiss!1379) (currentBit!3252 thiss!1379))))))

(assert (= (and d!18690 res!50789) b!60905))

(assert (= (and b!60905 res!50787) b!60906))

(assert (= (and b!60906 (not res!50788)) b!60907))

(assert (=> b!60905 m!95753))

(assert (=> b!60905 m!95721))

(assert (=> b!60907 m!95753))

(assert (=> b!60907 m!95753))

(declare-fun m!95987 () Bool)

(assert (=> b!60907 m!95987))

(assert (=> b!60729 d!18690))

(declare-fun d!18692 () Bool)

(assert (=> d!18692 (validate_offset_bits!1 ((_ sign_extend 32) (size!1258 (buf!1639 (_2!2876 lt!94611)))) ((_ sign_extend 32) (currentByte!3257 thiss!1379)) ((_ sign_extend 32) (currentBit!3252 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!94949 () Unit!4139)

(assert (=> d!18692 (= lt!94949 (choose!9 thiss!1379 (buf!1639 (_2!2876 lt!94611)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2205 (buf!1639 (_2!2876 lt!94611)) (currentByte!3257 thiss!1379) (currentBit!3252 thiss!1379))))))

(assert (=> d!18692 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1639 (_2!2876 lt!94611)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!94949)))

(declare-fun bs!4684 () Bool)

(assert (= bs!4684 d!18692))

(assert (=> bs!4684 m!95703))

(declare-fun m!95989 () Bool)

(assert (=> bs!4684 m!95989))

(assert (=> b!60729 d!18692))

(declare-fun bm!769 () Bool)

(declare-fun c!4284 () Bool)

(declare-fun call!772 () tuple2!5532)

(declare-fun lt!95515 () tuple2!5530)

(assert (=> bm!769 (= call!772 (reader!0 (_2!2876 lt!94611) (ite c!4284 (_2!2876 lt!95515) (_2!2876 lt!94611))))))

(declare-fun b!61090 () Bool)

(declare-fun e!40734 () tuple2!5530)

(declare-fun lt!95510 () tuple2!5530)

(declare-fun Unit!4163 () Unit!4139)

(assert (=> b!61090 (= e!40734 (tuple2!5531 Unit!4163 (_2!2876 lt!95510)))))

(assert (=> b!61090 (= lt!95515 (appendBitFromByte!0 (_2!2876 lt!94611) (select (arr!1822 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!95537 () (_ BitVec 64))

(assert (=> b!61090 (= lt!95537 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!95518 () (_ BitVec 64))

(assert (=> b!61090 (= lt!95518 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!95530 () Unit!4139)

(assert (=> b!61090 (= lt!95530 (validateOffsetBitsIneqLemma!0 (_2!2876 lt!94611) (_2!2876 lt!95515) lt!95537 lt!95518))))

(assert (=> b!61090 (validate_offset_bits!1 ((_ sign_extend 32) (size!1258 (buf!1639 (_2!2876 lt!95515)))) ((_ sign_extend 32) (currentByte!3257 (_2!2876 lt!95515))) ((_ sign_extend 32) (currentBit!3252 (_2!2876 lt!95515))) (bvsub lt!95537 lt!95518))))

(declare-fun lt!95506 () Unit!4139)

(assert (=> b!61090 (= lt!95506 lt!95530)))

(declare-fun lt!95531 () tuple2!5532)

(assert (=> b!61090 (= lt!95531 call!772)))

(declare-fun lt!95519 () (_ BitVec 64))

(assert (=> b!61090 (= lt!95519 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!95536 () Unit!4139)

(assert (=> b!61090 (= lt!95536 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2876 lt!94611) (buf!1639 (_2!2876 lt!95515)) lt!95519))))

(assert (=> b!61090 (validate_offset_bits!1 ((_ sign_extend 32) (size!1258 (buf!1639 (_2!2876 lt!95515)))) ((_ sign_extend 32) (currentByte!3257 (_2!2876 lt!94611))) ((_ sign_extend 32) (currentBit!3252 (_2!2876 lt!94611))) lt!95519)))

(declare-fun lt!95529 () Unit!4139)

(assert (=> b!61090 (= lt!95529 lt!95536)))

(assert (=> b!61090 (= (head!496 (byteArrayBitContentToList!0 (_2!2876 lt!95515) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!496 (bitStreamReadBitsIntoList!0 (_2!2876 lt!95515) (_1!2877 lt!95531) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!95496 () Unit!4139)

(declare-fun Unit!4164 () Unit!4139)

(assert (=> b!61090 (= lt!95496 Unit!4164)))

(assert (=> b!61090 (= lt!95510 (appendBitsMSBFirstLoop!0 (_2!2876 lt!95515) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!95502 () Unit!4139)

(assert (=> b!61090 (= lt!95502 (lemmaIsPrefixTransitive!0 (_2!2876 lt!94611) (_2!2876 lt!95515) (_2!2876 lt!95510)))))

(assert (=> b!61090 (isPrefixOf!0 (_2!2876 lt!94611) (_2!2876 lt!95510))))

(declare-fun lt!95533 () Unit!4139)

(assert (=> b!61090 (= lt!95533 lt!95502)))

(assert (=> b!61090 (= (size!1258 (buf!1639 (_2!2876 lt!95510))) (size!1258 (buf!1639 (_2!2876 lt!94611))))))

(declare-fun lt!95505 () Unit!4139)

(declare-fun Unit!4165 () Unit!4139)

(assert (=> b!61090 (= lt!95505 Unit!4165)))

(assert (=> b!61090 (= (bitIndex!0 (size!1258 (buf!1639 (_2!2876 lt!95510))) (currentByte!3257 (_2!2876 lt!95510)) (currentBit!3252 (_2!2876 lt!95510))) (bvsub (bvadd (bitIndex!0 (size!1258 (buf!1639 (_2!2876 lt!94611))) (currentByte!3257 (_2!2876 lt!94611)) (currentBit!3252 (_2!2876 lt!94611))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!95523 () Unit!4139)

(declare-fun Unit!4166 () Unit!4139)

(assert (=> b!61090 (= lt!95523 Unit!4166)))

(assert (=> b!61090 (= (bitIndex!0 (size!1258 (buf!1639 (_2!2876 lt!95510))) (currentByte!3257 (_2!2876 lt!95510)) (currentBit!3252 (_2!2876 lt!95510))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1258 (buf!1639 (_2!2876 lt!95515))) (currentByte!3257 (_2!2876 lt!95515)) (currentBit!3252 (_2!2876 lt!95515))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!95516 () Unit!4139)

(declare-fun Unit!4167 () Unit!4139)

(assert (=> b!61090 (= lt!95516 Unit!4167)))

(declare-fun lt!95535 () tuple2!5532)

(assert (=> b!61090 (= lt!95535 (reader!0 (_2!2876 lt!94611) (_2!2876 lt!95510)))))

(declare-fun lt!95534 () (_ BitVec 64))

(assert (=> b!61090 (= lt!95534 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!95526 () Unit!4139)

(assert (=> b!61090 (= lt!95526 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2876 lt!94611) (buf!1639 (_2!2876 lt!95510)) lt!95534))))

(assert (=> b!61090 (validate_offset_bits!1 ((_ sign_extend 32) (size!1258 (buf!1639 (_2!2876 lt!95510)))) ((_ sign_extend 32) (currentByte!3257 (_2!2876 lt!94611))) ((_ sign_extend 32) (currentBit!3252 (_2!2876 lt!94611))) lt!95534)))

(declare-fun lt!95497 () Unit!4139)

(assert (=> b!61090 (= lt!95497 lt!95526)))

(declare-fun lt!95522 () tuple2!5532)

(assert (=> b!61090 (= lt!95522 (reader!0 (_2!2876 lt!95515) (_2!2876 lt!95510)))))

(declare-fun lt!95525 () (_ BitVec 64))

(assert (=> b!61090 (= lt!95525 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!95504 () Unit!4139)

(assert (=> b!61090 (= lt!95504 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2876 lt!95515) (buf!1639 (_2!2876 lt!95510)) lt!95525))))

(assert (=> b!61090 (validate_offset_bits!1 ((_ sign_extend 32) (size!1258 (buf!1639 (_2!2876 lt!95510)))) ((_ sign_extend 32) (currentByte!3257 (_2!2876 lt!95515))) ((_ sign_extend 32) (currentBit!3252 (_2!2876 lt!95515))) lt!95525)))

(declare-fun lt!95514 () Unit!4139)

(assert (=> b!61090 (= lt!95514 lt!95504)))

(declare-fun lt!95524 () List!677)

(assert (=> b!61090 (= lt!95524 (byteArrayBitContentToList!0 (_2!2876 lt!95510) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!95495 () List!677)

(assert (=> b!61090 (= lt!95495 (byteArrayBitContentToList!0 (_2!2876 lt!95510) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!95499 () List!677)

(assert (=> b!61090 (= lt!95499 (bitStreamReadBitsIntoList!0 (_2!2876 lt!95510) (_1!2877 lt!95535) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!95521 () List!677)

(assert (=> b!61090 (= lt!95521 (bitStreamReadBitsIntoList!0 (_2!2876 lt!95510) (_1!2877 lt!95522) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!95532 () (_ BitVec 64))

(assert (=> b!61090 (= lt!95532 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!95507 () Unit!4139)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2204 BitStream!2204 BitStream!2204 BitStream!2204 (_ BitVec 64) List!677) Unit!4139)

(assert (=> b!61090 (= lt!95507 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2876 lt!95510) (_2!2876 lt!95510) (_1!2877 lt!95535) (_1!2877 lt!95522) lt!95532 lt!95499))))

(declare-fun tail!284 (List!677) List!677)

(assert (=> b!61090 (= (bitStreamReadBitsIntoList!0 (_2!2876 lt!95510) (_1!2877 lt!95522) (bvsub lt!95532 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!284 lt!95499))))

(declare-fun lt!95513 () Unit!4139)

(assert (=> b!61090 (= lt!95513 lt!95507)))

(declare-fun lt!95500 () (_ BitVec 64))

(declare-fun lt!95511 () Unit!4139)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2765 array!2765 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4139)

(assert (=> b!61090 (= lt!95511 (arrayBitRangesEqImpliesEq!0 (buf!1639 (_2!2876 lt!95515)) (buf!1639 (_2!2876 lt!95510)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!95500 (bitIndex!0 (size!1258 (buf!1639 (_2!2876 lt!95515))) (currentByte!3257 (_2!2876 lt!95515)) (currentBit!3252 (_2!2876 lt!95515)))))))

(declare-fun bitAt!0 (array!2765 (_ BitVec 64)) Bool)

(assert (=> b!61090 (= (bitAt!0 (buf!1639 (_2!2876 lt!95515)) lt!95500) (bitAt!0 (buf!1639 (_2!2876 lt!95510)) lt!95500))))

(declare-fun lt!95494 () Unit!4139)

(assert (=> b!61090 (= lt!95494 lt!95511)))

(declare-fun b!61091 () Bool)

(declare-fun e!40735 () Bool)

(declare-fun lt!95508 () (_ BitVec 64))

(assert (=> b!61091 (= e!40735 (validate_offset_bits!1 ((_ sign_extend 32) (size!1258 (buf!1639 (_2!2876 lt!94611)))) ((_ sign_extend 32) (currentByte!3257 (_2!2876 lt!94611))) ((_ sign_extend 32) (currentBit!3252 (_2!2876 lt!94611))) lt!95508))))

(declare-fun b!61092 () Bool)

(declare-fun res!50913 () Bool)

(declare-fun e!40733 () Bool)

(assert (=> b!61092 (=> (not res!50913) (not e!40733))))

(declare-fun lt!95509 () tuple2!5530)

(assert (=> b!61092 (= res!50913 (= (size!1258 (buf!1639 (_2!2876 lt!94611))) (size!1258 (buf!1639 (_2!2876 lt!95509)))))))

(declare-fun b!61093 () Bool)

(declare-fun res!50912 () Bool)

(assert (=> b!61093 (=> (not res!50912) (not e!40733))))

(assert (=> b!61093 (= res!50912 (isPrefixOf!0 (_2!2876 lt!94611) (_2!2876 lt!95509)))))

(declare-fun b!61094 () Bool)

(declare-fun Unit!4168 () Unit!4139)

(assert (=> b!61094 (= e!40734 (tuple2!5531 Unit!4168 (_2!2876 lt!94611)))))

(assert (=> b!61094 (= (size!1258 (buf!1639 (_2!2876 lt!94611))) (size!1258 (buf!1639 (_2!2876 lt!94611))))))

(declare-fun lt!95528 () Unit!4139)

(declare-fun Unit!4169 () Unit!4139)

(assert (=> b!61094 (= lt!95528 Unit!4169)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2204 array!2765 array!2765 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!61094 (checkByteArrayBitContent!0 (_2!2876 lt!94611) srcBuffer!2 (_1!2888 (readBits!0 (_1!2877 call!772) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun d!18694 () Bool)

(assert (=> d!18694 e!40733))

(declare-fun res!50917 () Bool)

(assert (=> d!18694 (=> (not res!50917) (not e!40733))))

(declare-fun lt!95503 () (_ BitVec 64))

(assert (=> d!18694 (= res!50917 (= (bitIndex!0 (size!1258 (buf!1639 (_2!2876 lt!95509))) (currentByte!3257 (_2!2876 lt!95509)) (currentBit!3252 (_2!2876 lt!95509))) (bvsub lt!95503 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!18694 (or (= (bvand lt!95503 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!95503 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!95503 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!95527 () (_ BitVec 64))

(assert (=> d!18694 (= lt!95503 (bvadd lt!95527 to!314))))

(assert (=> d!18694 (or (not (= (bvand lt!95527 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!95527 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!95527 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18694 (= lt!95527 (bitIndex!0 (size!1258 (buf!1639 (_2!2876 lt!94611))) (currentByte!3257 (_2!2876 lt!94611)) (currentBit!3252 (_2!2876 lt!94611))))))

(assert (=> d!18694 (= lt!95509 e!40734)))

(assert (=> d!18694 (= c!4284 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!95517 () Unit!4139)

(declare-fun lt!95498 () Unit!4139)

(assert (=> d!18694 (= lt!95517 lt!95498)))

(assert (=> d!18694 (isPrefixOf!0 (_2!2876 lt!94611) (_2!2876 lt!94611))))

(assert (=> d!18694 (= lt!95498 (lemmaIsPrefixRefl!0 (_2!2876 lt!94611)))))

(assert (=> d!18694 (= lt!95500 (bitIndex!0 (size!1258 (buf!1639 (_2!2876 lt!94611))) (currentByte!3257 (_2!2876 lt!94611)) (currentBit!3252 (_2!2876 lt!94611))))))

(assert (=> d!18694 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!18694 (= (appendBitsMSBFirstLoop!0 (_2!2876 lt!94611) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!95509)))

(declare-fun lt!95512 () tuple2!5532)

(declare-fun b!61089 () Bool)

(assert (=> b!61089 (= e!40733 (= (bitStreamReadBitsIntoList!0 (_2!2876 lt!95509) (_1!2877 lt!95512) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2876 lt!95509) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!61089 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!61089 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!95501 () Unit!4139)

(declare-fun lt!95520 () Unit!4139)

(assert (=> b!61089 (= lt!95501 lt!95520)))

(assert (=> b!61089 (validate_offset_bits!1 ((_ sign_extend 32) (size!1258 (buf!1639 (_2!2876 lt!95509)))) ((_ sign_extend 32) (currentByte!3257 (_2!2876 lt!94611))) ((_ sign_extend 32) (currentBit!3252 (_2!2876 lt!94611))) lt!95508)))

(assert (=> b!61089 (= lt!95520 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2876 lt!94611) (buf!1639 (_2!2876 lt!95509)) lt!95508))))

(assert (=> b!61089 e!40735))

(declare-fun res!50916 () Bool)

(assert (=> b!61089 (=> (not res!50916) (not e!40735))))

(assert (=> b!61089 (= res!50916 (and (= (size!1258 (buf!1639 (_2!2876 lt!94611))) (size!1258 (buf!1639 (_2!2876 lt!95509)))) (bvsge lt!95508 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!61089 (= lt!95508 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!61089 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!61089 (= lt!95512 (reader!0 (_2!2876 lt!94611) (_2!2876 lt!95509)))))

(declare-fun b!61095 () Bool)

(declare-fun res!50915 () Bool)

(assert (=> b!61095 (=> (not res!50915) (not e!40733))))

(assert (=> b!61095 (= res!50915 (invariant!0 (currentBit!3252 (_2!2876 lt!95509)) (currentByte!3257 (_2!2876 lt!95509)) (size!1258 (buf!1639 (_2!2876 lt!95509)))))))

(declare-fun b!61096 () Bool)

(declare-fun res!50914 () Bool)

(assert (=> b!61096 (=> (not res!50914) (not e!40733))))

(assert (=> b!61096 (= res!50914 (= (size!1258 (buf!1639 (_2!2876 lt!95509))) (size!1258 (buf!1639 (_2!2876 lt!94611)))))))

(assert (= (and d!18694 c!4284) b!61090))

(assert (= (and d!18694 (not c!4284)) b!61094))

(assert (= (or b!61090 b!61094) bm!769))

(assert (= (and d!18694 res!50917) b!61095))

(assert (= (and b!61095 res!50915) b!61092))

(assert (= (and b!61092 res!50913) b!61093))

(assert (= (and b!61093 res!50912) b!61096))

(assert (= (and b!61096 res!50914) b!61089))

(assert (= (and b!61089 res!50916) b!61091))

(declare-fun m!96381 () Bool)

(assert (=> b!61094 m!96381))

(declare-fun m!96383 () Bool)

(assert (=> b!61094 m!96383))

(declare-fun m!96385 () Bool)

(assert (=> d!18694 m!96385))

(assert (=> d!18694 m!95707))

(assert (=> d!18694 m!95903))

(assert (=> d!18694 m!95897))

(declare-fun m!96387 () Bool)

(assert (=> b!61090 m!96387))

(declare-fun m!96389 () Bool)

(assert (=> b!61090 m!96389))

(declare-fun m!96391 () Bool)

(assert (=> b!61090 m!96391))

(assert (=> b!61090 m!96389))

(declare-fun m!96393 () Bool)

(assert (=> b!61090 m!96393))

(declare-fun m!96395 () Bool)

(assert (=> b!61090 m!96395))

(declare-fun m!96397 () Bool)

(assert (=> b!61090 m!96397))

(declare-fun m!96399 () Bool)

(assert (=> b!61090 m!96399))

(declare-fun m!96401 () Bool)

(assert (=> b!61090 m!96401))

(declare-fun m!96403 () Bool)

(assert (=> b!61090 m!96403))

(assert (=> b!61090 m!96393))

(declare-fun m!96405 () Bool)

(assert (=> b!61090 m!96405))

(declare-fun m!96407 () Bool)

(assert (=> b!61090 m!96407))

(declare-fun m!96409 () Bool)

(assert (=> b!61090 m!96409))

(declare-fun m!96411 () Bool)

(assert (=> b!61090 m!96411))

(declare-fun m!96413 () Bool)

(assert (=> b!61090 m!96413))

(declare-fun m!96415 () Bool)

(assert (=> b!61090 m!96415))

(declare-fun m!96417 () Bool)

(assert (=> b!61090 m!96417))

(declare-fun m!96419 () Bool)

(assert (=> b!61090 m!96419))

(declare-fun m!96421 () Bool)

(assert (=> b!61090 m!96421))

(declare-fun m!96423 () Bool)

(assert (=> b!61090 m!96423))

(declare-fun m!96425 () Bool)

(assert (=> b!61090 m!96425))

(assert (=> b!61090 m!95707))

(assert (=> b!61090 m!96409))

(declare-fun m!96427 () Bool)

(assert (=> b!61090 m!96427))

(declare-fun m!96429 () Bool)

(assert (=> b!61090 m!96429))

(declare-fun m!96431 () Bool)

(assert (=> b!61090 m!96431))

(declare-fun m!96433 () Bool)

(assert (=> b!61090 m!96433))

(declare-fun m!96435 () Bool)

(assert (=> b!61090 m!96435))

(assert (=> b!61090 m!96423))

(declare-fun m!96437 () Bool)

(assert (=> b!61090 m!96437))

(declare-fun m!96439 () Bool)

(assert (=> b!61090 m!96439))

(declare-fun m!96441 () Bool)

(assert (=> b!61090 m!96441))

(declare-fun m!96443 () Bool)

(assert (=> b!61090 m!96443))

(declare-fun m!96445 () Bool)

(assert (=> b!61090 m!96445))

(declare-fun m!96447 () Bool)

(assert (=> b!61090 m!96447))

(declare-fun m!96449 () Bool)

(assert (=> bm!769 m!96449))

(declare-fun m!96451 () Bool)

(assert (=> b!61093 m!96451))

(declare-fun m!96453 () Bool)

(assert (=> b!61095 m!96453))

(declare-fun m!96455 () Bool)

(assert (=> b!61091 m!96455))

(declare-fun m!96457 () Bool)

(assert (=> b!61089 m!96457))

(declare-fun m!96459 () Bool)

(assert (=> b!61089 m!96459))

(declare-fun m!96461 () Bool)

(assert (=> b!61089 m!96461))

(declare-fun m!96463 () Bool)

(assert (=> b!61089 m!96463))

(declare-fun m!96465 () Bool)

(assert (=> b!61089 m!96465))

(assert (=> b!60729 d!18694))

(declare-fun d!18792 () Bool)

(assert (=> d!18792 (isPrefixOf!0 thiss!1379 (_2!2876 lt!94615))))

(declare-fun lt!95540 () Unit!4139)

(declare-fun choose!30 (BitStream!2204 BitStream!2204 BitStream!2204) Unit!4139)

(assert (=> d!18792 (= lt!95540 (choose!30 thiss!1379 (_2!2876 lt!94611) (_2!2876 lt!94615)))))

(assert (=> d!18792 (isPrefixOf!0 thiss!1379 (_2!2876 lt!94611))))

(assert (=> d!18792 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2876 lt!94611) (_2!2876 lt!94615)) lt!95540)))

(declare-fun bs!4702 () Bool)

(assert (= bs!4702 d!18792))

(assert (=> bs!4702 m!95699))

(declare-fun m!96467 () Bool)

(assert (=> bs!4702 m!96467))

(assert (=> bs!4702 m!95711))

(assert (=> b!60729 d!18792))

(declare-fun lt!95555 () tuple2!5532)

(declare-fun b!61097 () Bool)

(declare-fun lt!95543 () (_ BitVec 64))

(declare-fun lt!95553 () (_ BitVec 64))

(declare-fun e!40737 () Bool)

(assert (=> b!61097 (= e!40737 (= (_1!2877 lt!95555) (withMovedBitIndex!0 (_2!2877 lt!95555) (bvsub lt!95553 lt!95543))))))

(assert (=> b!61097 (or (= (bvand lt!95553 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!95543 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!95553 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!95553 lt!95543) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!61097 (= lt!95543 (bitIndex!0 (size!1258 (buf!1639 (_2!2876 lt!94611))) (currentByte!3257 (_2!2876 lt!94611)) (currentBit!3252 (_2!2876 lt!94611))))))

(assert (=> b!61097 (= lt!95553 (bitIndex!0 (size!1258 (buf!1639 thiss!1379)) (currentByte!3257 thiss!1379) (currentBit!3252 thiss!1379)))))

(declare-fun b!61098 () Bool)

(declare-fun res!50919 () Bool)

(assert (=> b!61098 (=> (not res!50919) (not e!40737))))

(assert (=> b!61098 (= res!50919 (isPrefixOf!0 (_2!2877 lt!95555) (_2!2876 lt!94611)))))

(declare-fun d!18794 () Bool)

(assert (=> d!18794 e!40737))

(declare-fun res!50918 () Bool)

(assert (=> d!18794 (=> (not res!50918) (not e!40737))))

(assert (=> d!18794 (= res!50918 (isPrefixOf!0 (_1!2877 lt!95555) (_2!2877 lt!95555)))))

(declare-fun lt!95549 () BitStream!2204)

(assert (=> d!18794 (= lt!95555 (tuple2!5533 lt!95549 (_2!2876 lt!94611)))))

(declare-fun lt!95552 () Unit!4139)

(declare-fun lt!95550 () Unit!4139)

(assert (=> d!18794 (= lt!95552 lt!95550)))

(assert (=> d!18794 (isPrefixOf!0 lt!95549 (_2!2876 lt!94611))))

(assert (=> d!18794 (= lt!95550 (lemmaIsPrefixTransitive!0 lt!95549 (_2!2876 lt!94611) (_2!2876 lt!94611)))))

(declare-fun lt!95558 () Unit!4139)

(declare-fun lt!95551 () Unit!4139)

(assert (=> d!18794 (= lt!95558 lt!95551)))

(assert (=> d!18794 (isPrefixOf!0 lt!95549 (_2!2876 lt!94611))))

(assert (=> d!18794 (= lt!95551 (lemmaIsPrefixTransitive!0 lt!95549 thiss!1379 (_2!2876 lt!94611)))))

(declare-fun lt!95559 () Unit!4139)

(declare-fun e!40736 () Unit!4139)

(assert (=> d!18794 (= lt!95559 e!40736)))

(declare-fun c!4285 () Bool)

(assert (=> d!18794 (= c!4285 (not (= (size!1258 (buf!1639 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!95548 () Unit!4139)

(declare-fun lt!95557 () Unit!4139)

(assert (=> d!18794 (= lt!95548 lt!95557)))

(assert (=> d!18794 (isPrefixOf!0 (_2!2876 lt!94611) (_2!2876 lt!94611))))

(assert (=> d!18794 (= lt!95557 (lemmaIsPrefixRefl!0 (_2!2876 lt!94611)))))

(declare-fun lt!95544 () Unit!4139)

(declare-fun lt!95554 () Unit!4139)

(assert (=> d!18794 (= lt!95544 lt!95554)))

(assert (=> d!18794 (= lt!95554 (lemmaIsPrefixRefl!0 (_2!2876 lt!94611)))))

(declare-fun lt!95542 () Unit!4139)

(declare-fun lt!95545 () Unit!4139)

(assert (=> d!18794 (= lt!95542 lt!95545)))

(assert (=> d!18794 (isPrefixOf!0 lt!95549 lt!95549)))

(assert (=> d!18794 (= lt!95545 (lemmaIsPrefixRefl!0 lt!95549))))

(declare-fun lt!95556 () Unit!4139)

(declare-fun lt!95546 () Unit!4139)

(assert (=> d!18794 (= lt!95556 lt!95546)))

(assert (=> d!18794 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!18794 (= lt!95546 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!18794 (= lt!95549 (BitStream!2205 (buf!1639 (_2!2876 lt!94611)) (currentByte!3257 thiss!1379) (currentBit!3252 thiss!1379)))))

(assert (=> d!18794 (isPrefixOf!0 thiss!1379 (_2!2876 lt!94611))))

(assert (=> d!18794 (= (reader!0 thiss!1379 (_2!2876 lt!94611)) lt!95555)))

(declare-fun b!61099 () Bool)

(declare-fun Unit!4170 () Unit!4139)

(assert (=> b!61099 (= e!40736 Unit!4170)))

(declare-fun b!61100 () Bool)

(declare-fun lt!95541 () Unit!4139)

(assert (=> b!61100 (= e!40736 lt!95541)))

(declare-fun lt!95547 () (_ BitVec 64))

(assert (=> b!61100 (= lt!95547 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95560 () (_ BitVec 64))

(assert (=> b!61100 (= lt!95560 (bitIndex!0 (size!1258 (buf!1639 thiss!1379)) (currentByte!3257 thiss!1379) (currentBit!3252 thiss!1379)))))

(assert (=> b!61100 (= lt!95541 (arrayBitRangesEqSymmetric!0 (buf!1639 thiss!1379) (buf!1639 (_2!2876 lt!94611)) lt!95547 lt!95560))))

(assert (=> b!61100 (arrayBitRangesEq!0 (buf!1639 (_2!2876 lt!94611)) (buf!1639 thiss!1379) lt!95547 lt!95560)))

(declare-fun b!61101 () Bool)

(declare-fun res!50920 () Bool)

(assert (=> b!61101 (=> (not res!50920) (not e!40737))))

(assert (=> b!61101 (= res!50920 (isPrefixOf!0 (_1!2877 lt!95555) thiss!1379))))

(assert (= (and d!18794 c!4285) b!61100))

(assert (= (and d!18794 (not c!4285)) b!61099))

(assert (= (and d!18794 res!50918) b!61101))

(assert (= (and b!61101 res!50920) b!61098))

(assert (= (and b!61098 res!50919) b!61097))

(declare-fun m!96469 () Bool)

(assert (=> b!61098 m!96469))

(declare-fun m!96471 () Bool)

(assert (=> b!61101 m!96471))

(declare-fun m!96473 () Bool)

(assert (=> d!18794 m!96473))

(declare-fun m!96475 () Bool)

(assert (=> d!18794 m!96475))

(assert (=> d!18794 m!95711))

(assert (=> d!18794 m!95897))

(declare-fun m!96477 () Bool)

(assert (=> d!18794 m!96477))

(declare-fun m!96479 () Bool)

(assert (=> d!18794 m!96479))

(assert (=> d!18794 m!95903))

(assert (=> d!18794 m!95751))

(declare-fun m!96481 () Bool)

(assert (=> d!18794 m!96481))

(declare-fun m!96483 () Bool)

(assert (=> d!18794 m!96483))

(assert (=> d!18794 m!95749))

(declare-fun m!96485 () Bool)

(assert (=> b!61097 m!96485))

(assert (=> b!61097 m!95707))

(assert (=> b!61097 m!95753))

(assert (=> b!61100 m!95753))

(declare-fun m!96487 () Bool)

(assert (=> b!61100 m!96487))

(declare-fun m!96489 () Bool)

(assert (=> b!61100 m!96489))

(assert (=> b!60729 d!18794))

(declare-fun d!18796 () Bool)

(declare-fun e!40738 () Bool)

(assert (=> d!18796 e!40738))

(declare-fun res!50921 () Bool)

(assert (=> d!18796 (=> (not res!50921) (not e!40738))))

(declare-fun lt!95561 () (_ BitVec 64))

(declare-fun lt!95563 () (_ BitVec 64))

(declare-fun lt!95566 () (_ BitVec 64))

(assert (=> d!18796 (= res!50921 (= lt!95561 (bvsub lt!95566 lt!95563)))))

(assert (=> d!18796 (or (= (bvand lt!95566 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!95563 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!95566 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!95566 lt!95563) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18796 (= lt!95563 (remainingBits!0 ((_ sign_extend 32) (size!1258 (buf!1639 (_2!2876 lt!94615)))) ((_ sign_extend 32) (currentByte!3257 (_2!2876 lt!94615))) ((_ sign_extend 32) (currentBit!3252 (_2!2876 lt!94615)))))))

(declare-fun lt!95565 () (_ BitVec 64))

(declare-fun lt!95564 () (_ BitVec 64))

(assert (=> d!18796 (= lt!95566 (bvmul lt!95565 lt!95564))))

(assert (=> d!18796 (or (= lt!95565 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!95564 (bvsdiv (bvmul lt!95565 lt!95564) lt!95565)))))

(assert (=> d!18796 (= lt!95564 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18796 (= lt!95565 ((_ sign_extend 32) (size!1258 (buf!1639 (_2!2876 lt!94615)))))))

(assert (=> d!18796 (= lt!95561 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3257 (_2!2876 lt!94615))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3252 (_2!2876 lt!94615)))))))

(assert (=> d!18796 (invariant!0 (currentBit!3252 (_2!2876 lt!94615)) (currentByte!3257 (_2!2876 lt!94615)) (size!1258 (buf!1639 (_2!2876 lt!94615))))))

(assert (=> d!18796 (= (bitIndex!0 (size!1258 (buf!1639 (_2!2876 lt!94615))) (currentByte!3257 (_2!2876 lt!94615)) (currentBit!3252 (_2!2876 lt!94615))) lt!95561)))

(declare-fun b!61102 () Bool)

(declare-fun res!50922 () Bool)

(assert (=> b!61102 (=> (not res!50922) (not e!40738))))

(assert (=> b!61102 (= res!50922 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!95561))))

(declare-fun b!61103 () Bool)

(declare-fun lt!95562 () (_ BitVec 64))

(assert (=> b!61103 (= e!40738 (bvsle lt!95561 (bvmul lt!95562 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!61103 (or (= lt!95562 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!95562 #b0000000000000000000000000000000000000000000000000000000000001000) lt!95562)))))

(assert (=> b!61103 (= lt!95562 ((_ sign_extend 32) (size!1258 (buf!1639 (_2!2876 lt!94615)))))))

(assert (= (and d!18796 res!50921) b!61102))

(assert (= (and b!61102 res!50922) b!61103))

(declare-fun m!96491 () Bool)

(assert (=> d!18796 m!96491))

(assert (=> d!18796 m!95741))

(assert (=> b!60739 d!18796))

(declare-fun d!18798 () Bool)

(declare-fun size!1261 (List!677) Int)

(assert (=> d!18798 (= (length!305 lt!94613) (size!1261 lt!94613))))

(declare-fun bs!4703 () Bool)

(assert (= bs!4703 d!18798))

(declare-fun m!96493 () Bool)

(assert (=> bs!4703 m!96493))

(assert (=> b!60728 d!18798))

(declare-fun d!18800 () Bool)

(assert (=> d!18800 (= (head!496 (byteArrayBitContentToList!0 (_2!2876 lt!94611) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!792 (byteArrayBitContentToList!0 (_2!2876 lt!94611) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!60738 d!18800))

(declare-fun d!18802 () Bool)

(declare-fun c!4288 () Bool)

(assert (=> d!18802 (= c!4288 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!40741 () List!677)

(assert (=> d!18802 (= (byteArrayBitContentToList!0 (_2!2876 lt!94611) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!40741)))

(declare-fun b!61108 () Bool)

(assert (=> b!61108 (= e!40741 Nil!674)))

(declare-fun b!61109 () Bool)

(assert (=> b!61109 (= e!40741 (Cons!673 (not (= (bvand ((_ sign_extend 24) (select (arr!1822 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2876 lt!94611) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!18802 c!4288) b!61108))

(assert (= (and d!18802 (not c!4288)) b!61109))

(assert (=> b!61109 m!95709))

(assert (=> b!61109 m!95973))

(declare-fun m!96495 () Bool)

(assert (=> b!61109 m!96495))

(assert (=> b!60738 d!18802))

(declare-fun d!18804 () Bool)

(assert (=> d!18804 (= (head!496 (bitStreamReadBitsIntoList!0 (_2!2876 lt!94611) (_1!2877 lt!94610) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!792 (bitStreamReadBitsIntoList!0 (_2!2876 lt!94611) (_1!2877 lt!94610) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!60738 d!18804))

(declare-fun b!61112 () Bool)

(declare-fun e!40743 () Bool)

(declare-fun lt!95567 () List!677)

(assert (=> b!61112 (= e!40743 (isEmpty!181 lt!95567))))

(declare-fun d!18806 () Bool)

(assert (=> d!18806 e!40743))

(declare-fun c!4290 () Bool)

(assert (=> d!18806 (= c!4290 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!40742 () tuple2!5544)

(assert (=> d!18806 (= lt!95567 (_1!2883 e!40742))))

(declare-fun c!4289 () Bool)

(assert (=> d!18806 (= c!4289 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18806 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!18806 (= (bitStreamReadBitsIntoList!0 (_2!2876 lt!94611) (_1!2877 lt!94610) #b0000000000000000000000000000000000000000000000000000000000000001) lt!95567)))

(declare-fun b!61110 () Bool)

(assert (=> b!61110 (= e!40742 (tuple2!5545 Nil!674 (_1!2877 lt!94610)))))

(declare-fun lt!95568 () (_ BitVec 64))

(declare-fun lt!95569 () tuple2!5546)

(declare-fun b!61111 () Bool)

(assert (=> b!61111 (= e!40742 (tuple2!5545 (Cons!673 (_1!2884 lt!95569) (bitStreamReadBitsIntoList!0 (_2!2876 lt!94611) (_2!2884 lt!95569) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!95568))) (_2!2884 lt!95569)))))

(assert (=> b!61111 (= lt!95569 (readBit!0 (_1!2877 lt!94610)))))

(assert (=> b!61111 (= lt!95568 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!61113 () Bool)

(assert (=> b!61113 (= e!40743 (> (length!305 lt!95567) 0))))

(assert (= (and d!18806 c!4289) b!61110))

(assert (= (and d!18806 (not c!4289)) b!61111))

(assert (= (and d!18806 c!4290) b!61112))

(assert (= (and d!18806 (not c!4290)) b!61113))

(declare-fun m!96497 () Bool)

(assert (=> b!61112 m!96497))

(declare-fun m!96499 () Bool)

(assert (=> b!61111 m!96499))

(declare-fun m!96501 () Bool)

(assert (=> b!61111 m!96501))

(declare-fun m!96503 () Bool)

(assert (=> b!61113 m!96503))

(assert (=> b!60738 d!18806))

(push 1)

(assert (not d!18644))

(assert (not b!61111))

(assert (not b!60873))

(assert (not b!60891))

(assert (not b!60855))

(assert (not b!61112))

(assert (not b!60870))

(assert (not b!61094))

(assert (not d!18626))

(assert (not b!61097))

(assert (not b!60897))

(assert (not b!60826))

(assert (not b!61091))

(assert (not b!61089))

(assert (not d!18694))

(assert (not b!61098))

(assert (not b!60851))

(assert (not b!60863))

(assert (not d!18798))

(assert (not b!60825))

(assert (not d!18682))

(assert (not b!61093))

(assert (not d!18680))

(assert (not b!60905))

(assert (not b!60850))

(assert (not b!60899))

(assert (not b!60901))

(assert (not b!60896))

(assert (not b!60898))

(assert (not b!60854))

(assert (not b!61090))

(assert (not b!60865))

(assert (not b!61101))

(assert (not d!18794))

(assert (not b!60823))

(assert (not d!18674))

(assert (not bm!769))

(assert (not b!60828))

(assert (not b!60831))

(assert (not b!60902))

(assert (not b!60893))

(assert (not b!60894))

(assert (not b!60892))

(assert (not b!60827))

(assert (not d!18656))

(assert (not b!60895))

(assert (not d!18672))

(assert (not b!60830))

(assert (not d!18796))

(assert (not d!18686))

(assert (not b!60856))

(assert (not d!18638))

(assert (not d!18692))

(assert (not d!18678))

(assert (not b!61113))

(assert (not d!18658))

(assert (not b!60868))

(assert (not d!18632))

(assert (not b!60822))

(assert (not d!18634))

(assert (not d!18668))

(assert (not b!61095))

(assert (not b!60852))

(assert (not b!61109))

(assert (not d!18792))

(assert (not b!60907))

(assert (not b!60904))

(assert (not d!18642))

(assert (not b!61100))

(check-sat)

(pop 1)

(push 1)

(check-sat)

