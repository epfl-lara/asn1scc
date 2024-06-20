; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11818 () Bool)

(assert start!11818)

(declare-fun res!48863 () Bool)

(declare-fun e!39035 () Bool)

(assert (=> start!11818 (=> (not res!48863) (not e!39035))))

(declare-datatypes ((array!2675 0))(
  ( (array!2676 (arr!1777 (Array (_ BitVec 32) (_ BitVec 8))) (size!1213 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2675)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!11818 (= res!48863 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1213 srcBuffer!2))))))))

(assert (=> start!11818 e!39035))

(assert (=> start!11818 true))

(declare-fun array_inv!1116 (array!2675) Bool)

(assert (=> start!11818 (array_inv!1116 srcBuffer!2)))

(declare-datatypes ((BitStream!2114 0))(
  ( (BitStream!2115 (buf!1594 array!2675) (currentByte!3212 (_ BitVec 32)) (currentBit!3207 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2114)

(declare-fun e!39029 () Bool)

(declare-fun inv!12 (BitStream!2114) Bool)

(assert (=> start!11818 (and (inv!12 thiss!1379) e!39029)))

(declare-fun b!58782 () Bool)

(declare-fun res!48861 () Bool)

(declare-fun e!39038 () Bool)

(assert (=> b!58782 (=> res!48861 e!39038)))

(declare-datatypes ((Unit!4049 0))(
  ( (Unit!4050) )
))
(declare-datatypes ((tuple2!5350 0))(
  ( (tuple2!5351 (_1!2786 Unit!4049) (_2!2786 BitStream!2114)) )
))
(declare-fun lt!92633 () tuple2!5350)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!58782 (= res!48861 (not (invariant!0 (currentBit!3207 (_2!2786 lt!92633)) (currentByte!3212 (_2!2786 lt!92633)) (size!1213 (buf!1594 (_2!2786 lt!92633))))))))

(declare-fun e!39028 () Bool)

(declare-fun lt!92632 () (_ BitVec 64))

(declare-fun b!58783 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!58783 (= e!39028 (= lt!92632 (bvsub (bvsub (bvadd (bitIndex!0 (size!1213 (buf!1594 (_2!2786 lt!92633))) (currentByte!3212 (_2!2786 lt!92633)) (currentBit!3207 (_2!2786 lt!92633))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!58784 () Bool)

(declare-fun res!48864 () Bool)

(assert (=> b!58784 (=> (not res!48864) (not e!39035))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!58784 (= res!48864 (validate_offset_bits!1 ((_ sign_extend 32) (size!1213 (buf!1594 thiss!1379))) ((_ sign_extend 32) (currentByte!3212 thiss!1379)) ((_ sign_extend 32) (currentBit!3207 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!58785 () Bool)

(declare-fun e!39033 () Bool)

(assert (=> b!58785 (= e!39035 (not e!39033))))

(declare-fun res!48855 () Bool)

(assert (=> b!58785 (=> res!48855 e!39033)))

(assert (=> b!58785 (= res!48855 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2114 BitStream!2114) Bool)

(assert (=> b!58785 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!92639 () Unit!4049)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2114) Unit!4049)

(assert (=> b!58785 (= lt!92639 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!92637 () (_ BitVec 64))

(assert (=> b!58785 (= lt!92637 (bitIndex!0 (size!1213 (buf!1594 thiss!1379)) (currentByte!3212 thiss!1379) (currentBit!3207 thiss!1379)))))

(declare-datatypes ((tuple2!5352 0))(
  ( (tuple2!5353 (_1!2787 BitStream!2114) (_2!2787 BitStream!2114)) )
))
(declare-fun lt!92636 () tuple2!5352)

(declare-fun e!39036 () Bool)

(declare-fun b!58786 () Bool)

(declare-datatypes ((List!632 0))(
  ( (Nil!629) (Cons!628 (h!747 Bool) (t!1382 List!632)) )
))
(declare-fun head!451 (List!632) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2114 array!2675 (_ BitVec 64) (_ BitVec 64)) List!632)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2114 BitStream!2114 (_ BitVec 64)) List!632)

(assert (=> b!58786 (= e!39036 (= (head!451 (byteArrayBitContentToList!0 (_2!2786 lt!92633) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!451 (bitStreamReadBitsIntoList!0 (_2!2786 lt!92633) (_1!2787 lt!92636) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!58787 () Bool)

(assert (=> b!58787 (= e!39029 (array_inv!1116 (buf!1594 thiss!1379)))))

(declare-fun b!58788 () Bool)

(declare-fun res!48865 () Bool)

(declare-fun e!39032 () Bool)

(assert (=> b!58788 (=> res!48865 e!39032)))

(declare-fun lt!92634 () tuple2!5350)

(assert (=> b!58788 (= res!48865 (not (= (size!1213 (buf!1594 thiss!1379)) (size!1213 (buf!1594 (_2!2786 lt!92634))))))))

(declare-fun b!58789 () Bool)

(declare-fun lt!92641 () (_ BitVec 64))

(declare-fun lt!92640 () (_ BitVec 64))

(assert (=> b!58789 (= e!39038 (or (= lt!92641 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!92641 (bvand lt!92640 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!58789 (= lt!92641 (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!92631 () tuple2!5352)

(declare-fun reader!0 (BitStream!2114 BitStream!2114) tuple2!5352)

(assert (=> b!58789 (= lt!92631 (reader!0 (_2!2786 lt!92633) (_2!2786 lt!92634)))))

(assert (=> b!58789 (validate_offset_bits!1 ((_ sign_extend 32) (size!1213 (buf!1594 (_2!2786 lt!92634)))) ((_ sign_extend 32) (currentByte!3212 thiss!1379)) ((_ sign_extend 32) (currentBit!3207 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!92644 () Unit!4049)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2114 array!2675 (_ BitVec 64)) Unit!4049)

(assert (=> b!58789 (= lt!92644 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1594 (_2!2786 lt!92634)) (bvsub to!314 i!635)))))

(declare-fun lt!92643 () tuple2!5352)

(assert (=> b!58789 (= lt!92643 (reader!0 thiss!1379 (_2!2786 lt!92634)))))

(declare-fun b!58790 () Bool)

(declare-fun e!39030 () Bool)

(declare-fun e!39031 () Bool)

(assert (=> b!58790 (= e!39030 e!39031)))

(declare-fun res!48856 () Bool)

(assert (=> b!58790 (=> res!48856 e!39031)))

(assert (=> b!58790 (= res!48856 (not (isPrefixOf!0 (_2!2786 lt!92633) (_2!2786 lt!92634))))))

(assert (=> b!58790 (isPrefixOf!0 thiss!1379 (_2!2786 lt!92634))))

(declare-fun lt!92638 () Unit!4049)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2114 BitStream!2114 BitStream!2114) Unit!4049)

(assert (=> b!58790 (= lt!92638 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2786 lt!92633) (_2!2786 lt!92634)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2114 array!2675 (_ BitVec 64) (_ BitVec 64)) tuple2!5350)

(assert (=> b!58790 (= lt!92634 (appendBitsMSBFirstLoop!0 (_2!2786 lt!92633) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!58790 e!39036))

(declare-fun res!48858 () Bool)

(assert (=> b!58790 (=> (not res!48858) (not e!39036))))

(assert (=> b!58790 (= res!48858 (validate_offset_bits!1 ((_ sign_extend 32) (size!1213 (buf!1594 (_2!2786 lt!92633)))) ((_ sign_extend 32) (currentByte!3212 thiss!1379)) ((_ sign_extend 32) (currentBit!3207 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92635 () Unit!4049)

(assert (=> b!58790 (= lt!92635 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1594 (_2!2786 lt!92633)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!58790 (= lt!92636 (reader!0 thiss!1379 (_2!2786 lt!92633)))))

(declare-fun b!58791 () Bool)

(assert (=> b!58791 (= e!39032 e!39038)))

(declare-fun res!48862 () Bool)

(assert (=> b!58791 (=> res!48862 e!39038)))

(assert (=> b!58791 (= res!48862 (not (= (size!1213 (buf!1594 (_2!2786 lt!92633))) (size!1213 (buf!1594 (_2!2786 lt!92634))))))))

(assert (=> b!58791 e!39028))

(declare-fun res!48860 () Bool)

(assert (=> b!58791 (=> (not res!48860) (not e!39028))))

(assert (=> b!58791 (= res!48860 (= (size!1213 (buf!1594 (_2!2786 lt!92634))) (size!1213 (buf!1594 thiss!1379))))))

(declare-fun b!58792 () Bool)

(declare-fun res!48867 () Bool)

(assert (=> b!58792 (=> res!48867 e!39032)))

(assert (=> b!58792 (= res!48867 (not (invariant!0 (currentBit!3207 (_2!2786 lt!92634)) (currentByte!3212 (_2!2786 lt!92634)) (size!1213 (buf!1594 (_2!2786 lt!92634))))))))

(declare-fun b!58793 () Bool)

(assert (=> b!58793 (= e!39031 e!39032)))

(declare-fun res!48859 () Bool)

(assert (=> b!58793 (=> res!48859 e!39032)))

(assert (=> b!58793 (= res!48859 (not (= lt!92632 (bvsub (bvadd lt!92637 to!314) i!635))))))

(assert (=> b!58793 (= lt!92632 (bitIndex!0 (size!1213 (buf!1594 (_2!2786 lt!92634))) (currentByte!3212 (_2!2786 lt!92634)) (currentBit!3207 (_2!2786 lt!92634))))))

(declare-fun b!58794 () Bool)

(assert (=> b!58794 (= e!39033 e!39030)))

(declare-fun res!48866 () Bool)

(assert (=> b!58794 (=> res!48866 e!39030)))

(assert (=> b!58794 (= res!48866 (not (isPrefixOf!0 thiss!1379 (_2!2786 lt!92633))))))

(assert (=> b!58794 (validate_offset_bits!1 ((_ sign_extend 32) (size!1213 (buf!1594 (_2!2786 lt!92633)))) ((_ sign_extend 32) (currentByte!3212 (_2!2786 lt!92633))) ((_ sign_extend 32) (currentBit!3207 (_2!2786 lt!92633))) lt!92640)))

(assert (=> b!58794 (= lt!92640 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92642 () Unit!4049)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2114 BitStream!2114 (_ BitVec 64) (_ BitVec 64)) Unit!4049)

(assert (=> b!58794 (= lt!92642 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2786 lt!92633) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2114 (_ BitVec 8) (_ BitVec 32)) tuple2!5350)

(assert (=> b!58794 (= lt!92633 (appendBitFromByte!0 thiss!1379 (select (arr!1777 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!58795 () Bool)

(declare-fun res!48857 () Bool)

(assert (=> b!58795 (=> res!48857 e!39038)))

(assert (=> b!58795 (= res!48857 (not (invariant!0 (currentBit!3207 (_2!2786 lt!92633)) (currentByte!3212 (_2!2786 lt!92633)) (size!1213 (buf!1594 (_2!2786 lt!92634))))))))

(assert (= (and start!11818 res!48863) b!58784))

(assert (= (and b!58784 res!48864) b!58785))

(assert (= (and b!58785 (not res!48855)) b!58794))

(assert (= (and b!58794 (not res!48866)) b!58790))

(assert (= (and b!58790 res!48858) b!58786))

(assert (= (and b!58790 (not res!48856)) b!58793))

(assert (= (and b!58793 (not res!48859)) b!58792))

(assert (= (and b!58792 (not res!48867)) b!58788))

(assert (= (and b!58788 (not res!48865)) b!58791))

(assert (= (and b!58791 res!48860) b!58783))

(assert (= (and b!58791 (not res!48862)) b!58782))

(assert (= (and b!58782 (not res!48861)) b!58795))

(assert (= (and b!58795 (not res!48857)) b!58789))

(assert (= start!11818 b!58787))

(declare-fun m!92577 () Bool)

(assert (=> b!58794 m!92577))

(declare-fun m!92579 () Bool)

(assert (=> b!58794 m!92579))

(declare-fun m!92581 () Bool)

(assert (=> b!58794 m!92581))

(declare-fun m!92583 () Bool)

(assert (=> b!58794 m!92583))

(declare-fun m!92585 () Bool)

(assert (=> b!58794 m!92585))

(assert (=> b!58794 m!92581))

(declare-fun m!92587 () Bool)

(assert (=> b!58783 m!92587))

(declare-fun m!92589 () Bool)

(assert (=> b!58786 m!92589))

(assert (=> b!58786 m!92589))

(declare-fun m!92591 () Bool)

(assert (=> b!58786 m!92591))

(declare-fun m!92593 () Bool)

(assert (=> b!58786 m!92593))

(assert (=> b!58786 m!92593))

(declare-fun m!92595 () Bool)

(assert (=> b!58786 m!92595))

(declare-fun m!92597 () Bool)

(assert (=> b!58795 m!92597))

(declare-fun m!92599 () Bool)

(assert (=> b!58792 m!92599))

(declare-fun m!92601 () Bool)

(assert (=> b!58790 m!92601))

(declare-fun m!92603 () Bool)

(assert (=> b!58790 m!92603))

(declare-fun m!92605 () Bool)

(assert (=> b!58790 m!92605))

(declare-fun m!92607 () Bool)

(assert (=> b!58790 m!92607))

(declare-fun m!92609 () Bool)

(assert (=> b!58790 m!92609))

(declare-fun m!92611 () Bool)

(assert (=> b!58790 m!92611))

(declare-fun m!92613 () Bool)

(assert (=> b!58790 m!92613))

(declare-fun m!92615 () Bool)

(assert (=> start!11818 m!92615))

(declare-fun m!92617 () Bool)

(assert (=> start!11818 m!92617))

(declare-fun m!92619 () Bool)

(assert (=> b!58782 m!92619))

(declare-fun m!92621 () Bool)

(assert (=> b!58789 m!92621))

(declare-fun m!92623 () Bool)

(assert (=> b!58789 m!92623))

(declare-fun m!92625 () Bool)

(assert (=> b!58789 m!92625))

(declare-fun m!92627 () Bool)

(assert (=> b!58789 m!92627))

(declare-fun m!92629 () Bool)

(assert (=> b!58785 m!92629))

(declare-fun m!92631 () Bool)

(assert (=> b!58785 m!92631))

(declare-fun m!92633 () Bool)

(assert (=> b!58785 m!92633))

(declare-fun m!92635 () Bool)

(assert (=> b!58793 m!92635))

(declare-fun m!92637 () Bool)

(assert (=> b!58784 m!92637))

(declare-fun m!92639 () Bool)

(assert (=> b!58787 m!92639))

(push 1)

(assert (not b!58790))

(assert (not b!58784))

(assert (not b!58789))

(assert (not b!58782))

(assert (not start!11818))

(assert (not b!58785))

(assert (not b!58787))

(assert (not b!58793))

(assert (not b!58792))

(assert (not b!58783))

(assert (not b!58795))

(assert (not b!58786))

(assert (not b!58794))

(check-sat)

(pop 1)

(push 1)

(check-sat)

