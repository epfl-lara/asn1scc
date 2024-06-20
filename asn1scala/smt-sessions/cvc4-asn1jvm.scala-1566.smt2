; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44206 () Bool)

(assert start!44206)

(declare-fun res!176887 () Bool)

(declare-fun e!143706 () Bool)

(assert (=> start!44206 (=> (not res!176887) (not e!143706))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!44206 (= res!176887 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!44206 e!143706))

(assert (=> start!44206 true))

(declare-datatypes ((array!10494 0))(
  ( (array!10495 (arr!5541 (Array (_ BitVec 32) (_ BitVec 8))) (size!4611 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8330 0))(
  ( (BitStream!8331 (buf!5131 array!10494) (currentByte!9679 (_ BitVec 32)) (currentBit!9674 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8330)

(declare-fun e!143713 () Bool)

(declare-fun inv!12 (BitStream!8330) Bool)

(assert (=> start!44206 (and (inv!12 thiss!1204) e!143713)))

(declare-fun b!210660 () Bool)

(declare-fun e!143718 () Bool)

(declare-fun e!143708 () Bool)

(assert (=> b!210660 (= e!143718 (not e!143708))))

(declare-fun res!176884 () Bool)

(assert (=> b!210660 (=> res!176884 e!143708)))

(declare-fun lt!330825 () (_ BitVec 64))

(declare-fun lt!330818 () (_ BitVec 64))

(assert (=> b!210660 (= res!176884 (not (= lt!330825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!330818))))))

(declare-datatypes ((Unit!15011 0))(
  ( (Unit!15012) )
))
(declare-datatypes ((tuple2!18054 0))(
  ( (tuple2!18055 (_1!9682 Unit!15011) (_2!9682 BitStream!8330)) )
))
(declare-fun lt!330826 () tuple2!18054)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!210660 (= lt!330825 (bitIndex!0 (size!4611 (buf!5131 (_2!9682 lt!330826))) (currentByte!9679 (_2!9682 lt!330826)) (currentBit!9674 (_2!9682 lt!330826))))))

(assert (=> b!210660 (= lt!330818 (bitIndex!0 (size!4611 (buf!5131 thiss!1204)) (currentByte!9679 thiss!1204) (currentBit!9674 thiss!1204)))))

(declare-fun e!143715 () Bool)

(assert (=> b!210660 e!143715))

(declare-fun res!176890 () Bool)

(assert (=> b!210660 (=> (not res!176890) (not e!143715))))

(assert (=> b!210660 (= res!176890 (= (size!4611 (buf!5131 thiss!1204)) (size!4611 (buf!5131 (_2!9682 lt!330826)))))))

(declare-fun lt!330817 () Bool)

(declare-fun appendBit!0 (BitStream!8330 Bool) tuple2!18054)

(assert (=> b!210660 (= lt!330826 (appendBit!0 thiss!1204 lt!330817))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!330816 () (_ BitVec 64))

(assert (=> b!210660 (= lt!330817 (not (= (bvand v!189 lt!330816) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210660 (= lt!330816 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!210661 () Bool)

(declare-fun res!176900 () Bool)

(declare-fun e!143711 () Bool)

(assert (=> b!210661 (=> res!176900 e!143711)))

(declare-fun lt!330834 () tuple2!18054)

(declare-fun isPrefixOf!0 (BitStream!8330 BitStream!8330) Bool)

(assert (=> b!210661 (= res!176900 (not (isPrefixOf!0 (_2!9682 lt!330826) (_2!9682 lt!330834))))))

(declare-fun b!210662 () Bool)

(declare-fun e!143712 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!210662 (= e!143712 (invariant!0 (currentBit!9674 thiss!1204) (currentByte!9679 thiss!1204) (size!4611 (buf!5131 (_2!9682 lt!330834)))))))

(declare-fun b!210663 () Bool)

(declare-fun array_inv!4352 (array!10494) Bool)

(assert (=> b!210663 (= e!143713 (array_inv!4352 (buf!5131 thiss!1204)))))

(declare-fun b!210664 () Bool)

(declare-fun res!176897 () Bool)

(declare-fun e!143709 () Bool)

(assert (=> b!210664 (=> (not res!176897) (not e!143709))))

(assert (=> b!210664 (= res!176897 (isPrefixOf!0 thiss!1204 (_2!9682 lt!330826)))))

(declare-fun b!210665 () Bool)

(assert (=> b!210665 (= e!143715 e!143709)))

(declare-fun res!176899 () Bool)

(assert (=> b!210665 (=> (not res!176899) (not e!143709))))

(declare-fun lt!330820 () (_ BitVec 64))

(declare-fun lt!330833 () (_ BitVec 64))

(assert (=> b!210665 (= res!176899 (= lt!330820 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!330833)))))

(assert (=> b!210665 (= lt!330820 (bitIndex!0 (size!4611 (buf!5131 (_2!9682 lt!330826))) (currentByte!9679 (_2!9682 lt!330826)) (currentBit!9674 (_2!9682 lt!330826))))))

(assert (=> b!210665 (= lt!330833 (bitIndex!0 (size!4611 (buf!5131 thiss!1204)) (currentByte!9679 thiss!1204) (currentBit!9674 thiss!1204)))))

(declare-fun b!210666 () Bool)

(assert (=> b!210666 (= e!143706 e!143718)))

(declare-fun res!176891 () Bool)

(assert (=> b!210666 (=> (not res!176891) (not e!143718))))

(declare-fun lt!330829 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!210666 (= res!176891 (validate_offset_bits!1 ((_ sign_extend 32) (size!4611 (buf!5131 thiss!1204))) ((_ sign_extend 32) (currentByte!9679 thiss!1204)) ((_ sign_extend 32) (currentBit!9674 thiss!1204)) lt!330829))))

(assert (=> b!210666 (= lt!330829 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!210667 () Bool)

(declare-fun res!176883 () Bool)

(assert (=> b!210667 (=> res!176883 e!143711)))

(assert (=> b!210667 (= res!176883 (not (isPrefixOf!0 thiss!1204 (_2!9682 lt!330826))))))

(declare-fun b!210668 () Bool)

(declare-fun e!143717 () Bool)

(declare-datatypes ((tuple2!18056 0))(
  ( (tuple2!18057 (_1!9683 BitStream!8330) (_2!9683 Bool)) )
))
(declare-fun lt!330828 () tuple2!18056)

(assert (=> b!210668 (= e!143717 (= (bitIndex!0 (size!4611 (buf!5131 (_1!9683 lt!330828))) (currentByte!9679 (_1!9683 lt!330828)) (currentBit!9674 (_1!9683 lt!330828))) lt!330820))))

(declare-fun b!210669 () Bool)

(declare-fun res!176885 () Bool)

(assert (=> b!210669 (=> (not res!176885) (not e!143718))))

(assert (=> b!210669 (= res!176885 (not (= i!590 nBits!348)))))

(declare-fun b!210670 () Bool)

(declare-fun res!176886 () Bool)

(assert (=> b!210670 (=> res!176886 e!143711)))

(assert (=> b!210670 (= res!176886 (not (invariant!0 (currentBit!9674 (_2!9682 lt!330834)) (currentByte!9679 (_2!9682 lt!330834)) (size!4611 (buf!5131 (_2!9682 lt!330834))))))))

(declare-datatypes ((tuple2!18058 0))(
  ( (tuple2!18059 (_1!9684 BitStream!8330) (_2!9684 BitStream!8330)) )
))
(declare-fun lt!330812 () tuple2!18058)

(declare-fun lt!330813 () (_ BitVec 64))

(declare-fun e!143714 () Bool)

(declare-fun b!210671 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!8330 (_ BitVec 64)) BitStream!8330)

(assert (=> b!210671 (= e!143714 (= (_1!9684 lt!330812) (withMovedBitIndex!0 (_2!9684 lt!330812) (bvsub lt!330818 lt!330813))))))

(declare-fun b!210672 () Bool)

(assert (=> b!210672 (= e!143709 e!143717)))

(declare-fun res!176888 () Bool)

(assert (=> b!210672 (=> (not res!176888) (not e!143717))))

(assert (=> b!210672 (= res!176888 (and (= (_2!9683 lt!330828) lt!330817) (= (_1!9683 lt!330828) (_2!9682 lt!330826))))))

(declare-fun readBitPure!0 (BitStream!8330) tuple2!18056)

(declare-fun readerFrom!0 (BitStream!8330 (_ BitVec 32) (_ BitVec 32)) BitStream!8330)

(assert (=> b!210672 (= lt!330828 (readBitPure!0 (readerFrom!0 (_2!9682 lt!330826) (currentBit!9674 thiss!1204) (currentByte!9679 thiss!1204))))))

(declare-fun b!210673 () Bool)

(declare-fun e!143710 () Bool)

(assert (=> b!210673 (= e!143711 e!143710)))

(declare-fun res!176893 () Bool)

(assert (=> b!210673 (=> res!176893 e!143710)))

(declare-fun lt!330819 () (_ BitVec 64))

(declare-fun lt!330832 () tuple2!18058)

(declare-datatypes ((tuple2!18060 0))(
  ( (tuple2!18061 (_1!9685 BitStream!8330) (_2!9685 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8330 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18060)

(assert (=> b!210673 (= res!176893 (not (= (_1!9685 (readNBitsLSBFirstsLoopPure!0 (_1!9684 lt!330832) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!330819)) (_2!9684 lt!330832))))))

(declare-fun lt!330836 () (_ BitVec 64))

(assert (=> b!210673 (validate_offset_bits!1 ((_ sign_extend 32) (size!4611 (buf!5131 (_2!9682 lt!330834)))) ((_ sign_extend 32) (currentByte!9679 (_2!9682 lt!330826))) ((_ sign_extend 32) (currentBit!9674 (_2!9682 lt!330826))) lt!330836)))

(declare-fun lt!330823 () Unit!15011)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8330 array!10494 (_ BitVec 64)) Unit!15011)

(assert (=> b!210673 (= lt!330823 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9682 lt!330826) (buf!5131 (_2!9682 lt!330834)) lt!330836))))

(assert (=> b!210673 (= lt!330836 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!330830 () tuple2!18056)

(declare-fun lt!330839 () (_ BitVec 64))

(assert (=> b!210673 (= lt!330819 (bvor lt!330839 (ite (_2!9683 lt!330830) lt!330816 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!330831 () tuple2!18060)

(assert (=> b!210673 (= lt!330831 (readNBitsLSBFirstsLoopPure!0 (_1!9684 lt!330812) nBits!348 i!590 lt!330839))))

(assert (=> b!210673 (validate_offset_bits!1 ((_ sign_extend 32) (size!4611 (buf!5131 (_2!9682 lt!330834)))) ((_ sign_extend 32) (currentByte!9679 thiss!1204)) ((_ sign_extend 32) (currentBit!9674 thiss!1204)) lt!330829)))

(declare-fun lt!330822 () Unit!15011)

(assert (=> b!210673 (= lt!330822 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5131 (_2!9682 lt!330834)) lt!330829))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!210673 (= lt!330839 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!210673 (= (_2!9683 lt!330830) lt!330817)))

(assert (=> b!210673 (= lt!330830 (readBitPure!0 (_1!9684 lt!330812)))))

(declare-fun reader!0 (BitStream!8330 BitStream!8330) tuple2!18058)

(assert (=> b!210673 (= lt!330832 (reader!0 (_2!9682 lt!330826) (_2!9682 lt!330834)))))

(assert (=> b!210673 (= lt!330812 (reader!0 thiss!1204 (_2!9682 lt!330834)))))

(declare-fun e!143707 () Bool)

(assert (=> b!210673 e!143707))

(declare-fun res!176894 () Bool)

(assert (=> b!210673 (=> (not res!176894) (not e!143707))))

(declare-fun lt!330814 () tuple2!18056)

(declare-fun lt!330815 () tuple2!18056)

(assert (=> b!210673 (= res!176894 (= (bitIndex!0 (size!4611 (buf!5131 (_1!9683 lt!330814))) (currentByte!9679 (_1!9683 lt!330814)) (currentBit!9674 (_1!9683 lt!330814))) (bitIndex!0 (size!4611 (buf!5131 (_1!9683 lt!330815))) (currentByte!9679 (_1!9683 lt!330815)) (currentBit!9674 (_1!9683 lt!330815)))))))

(declare-fun lt!330838 () Unit!15011)

(declare-fun lt!330824 () BitStream!8330)

(declare-fun readBitPrefixLemma!0 (BitStream!8330 BitStream!8330) Unit!15011)

(assert (=> b!210673 (= lt!330838 (readBitPrefixLemma!0 lt!330824 (_2!9682 lt!330834)))))

(assert (=> b!210673 (= lt!330815 (readBitPure!0 (BitStream!8331 (buf!5131 (_2!9682 lt!330834)) (currentByte!9679 thiss!1204) (currentBit!9674 thiss!1204))))))

(assert (=> b!210673 (= lt!330814 (readBitPure!0 lt!330824))))

(assert (=> b!210673 e!143712))

(declare-fun res!176896 () Bool)

(assert (=> b!210673 (=> (not res!176896) (not e!143712))))

(assert (=> b!210673 (= res!176896 (invariant!0 (currentBit!9674 thiss!1204) (currentByte!9679 thiss!1204) (size!4611 (buf!5131 (_2!9682 lt!330826)))))))

(assert (=> b!210673 (= lt!330824 (BitStream!8331 (buf!5131 (_2!9682 lt!330826)) (currentByte!9679 thiss!1204) (currentBit!9674 thiss!1204)))))

(declare-fun b!210674 () Bool)

(assert (=> b!210674 (= e!143708 e!143711)))

(declare-fun res!176892 () Bool)

(assert (=> b!210674 (=> res!176892 e!143711)))

(assert (=> b!210674 (= res!176892 (not (= lt!330813 (bvsub (bvsub (bvadd lt!330825 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!210674 (= lt!330813 (bitIndex!0 (size!4611 (buf!5131 (_2!9682 lt!330834))) (currentByte!9679 (_2!9682 lt!330834)) (currentBit!9674 (_2!9682 lt!330834))))))

(assert (=> b!210674 (isPrefixOf!0 thiss!1204 (_2!9682 lt!330834))))

(declare-fun lt!330837 () Unit!15011)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8330 BitStream!8330 BitStream!8330) Unit!15011)

(assert (=> b!210674 (= lt!330837 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9682 lt!330826) (_2!9682 lt!330834)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8330 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18054)

(assert (=> b!210674 (= lt!330834 (appendBitsLSBFirstLoopTR!0 (_2!9682 lt!330826) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!210675 () Bool)

(assert (=> b!210675 (= e!143707 (= (_2!9683 lt!330814) (_2!9683 lt!330815)))))

(declare-fun b!210676 () Bool)

(declare-fun res!176898 () Bool)

(assert (=> b!210676 (=> res!176898 e!143711)))

(assert (=> b!210676 (= res!176898 (or (not (= (size!4611 (buf!5131 (_2!9682 lt!330834))) (size!4611 (buf!5131 thiss!1204)))) (not (= lt!330813 (bvsub (bvadd lt!330818 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun lt!330827 () (_ BitVec 64))

(declare-fun b!210677 () Bool)

(assert (=> b!210677 (= e!143710 (or (= lt!330827 (bvand lt!330813 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!330827 (bvand (bvsub lt!330825 lt!330813) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!210677 (= lt!330827 (bvand lt!330825 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!210677 e!143714))

(declare-fun res!176895 () Bool)

(assert (=> b!210677 (=> (not res!176895) (not e!143714))))

(declare-fun lt!330835 () tuple2!18060)

(assert (=> b!210677 (= res!176895 (and (= (_2!9685 lt!330831) (_2!9685 lt!330835)) (= (_1!9685 lt!330831) (_1!9685 lt!330835))))))

(declare-fun lt!330821 () Unit!15011)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8330 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15011)

(assert (=> b!210677 (= lt!330821 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9684 lt!330812) nBits!348 i!590 lt!330839))))

(assert (=> b!210677 (= lt!330835 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9684 lt!330812) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!330819))))

(declare-fun b!210678 () Bool)

(declare-fun res!176889 () Bool)

(assert (=> b!210678 (=> (not res!176889) (not e!143718))))

(assert (=> b!210678 (= res!176889 (invariant!0 (currentBit!9674 thiss!1204) (currentByte!9679 thiss!1204) (size!4611 (buf!5131 thiss!1204))))))

(assert (= (and start!44206 res!176887) b!210666))

(assert (= (and b!210666 res!176891) b!210678))

(assert (= (and b!210678 res!176889) b!210669))

(assert (= (and b!210669 res!176885) b!210660))

(assert (= (and b!210660 res!176890) b!210665))

(assert (= (and b!210665 res!176899) b!210664))

(assert (= (and b!210664 res!176897) b!210672))

(assert (= (and b!210672 res!176888) b!210668))

(assert (= (and b!210660 (not res!176884)) b!210674))

(assert (= (and b!210674 (not res!176892)) b!210670))

(assert (= (and b!210670 (not res!176886)) b!210676))

(assert (= (and b!210676 (not res!176898)) b!210661))

(assert (= (and b!210661 (not res!176900)) b!210667))

(assert (= (and b!210667 (not res!176883)) b!210673))

(assert (= (and b!210673 res!176896) b!210662))

(assert (= (and b!210673 res!176894) b!210675))

(assert (= (and b!210673 (not res!176893)) b!210677))

(assert (= (and b!210677 res!176895) b!210671))

(assert (= start!44206 b!210663))

(declare-fun m!324389 () Bool)

(assert (=> b!210666 m!324389))

(declare-fun m!324391 () Bool)

(assert (=> b!210664 m!324391))

(declare-fun m!324393 () Bool)

(assert (=> b!210673 m!324393))

(declare-fun m!324395 () Bool)

(assert (=> b!210673 m!324395))

(declare-fun m!324397 () Bool)

(assert (=> b!210673 m!324397))

(declare-fun m!324399 () Bool)

(assert (=> b!210673 m!324399))

(declare-fun m!324401 () Bool)

(assert (=> b!210673 m!324401))

(declare-fun m!324403 () Bool)

(assert (=> b!210673 m!324403))

(declare-fun m!324405 () Bool)

(assert (=> b!210673 m!324405))

(declare-fun m!324407 () Bool)

(assert (=> b!210673 m!324407))

(declare-fun m!324409 () Bool)

(assert (=> b!210673 m!324409))

(declare-fun m!324411 () Bool)

(assert (=> b!210673 m!324411))

(declare-fun m!324413 () Bool)

(assert (=> b!210673 m!324413))

(declare-fun m!324415 () Bool)

(assert (=> b!210673 m!324415))

(declare-fun m!324417 () Bool)

(assert (=> b!210673 m!324417))

(declare-fun m!324419 () Bool)

(assert (=> b!210673 m!324419))

(declare-fun m!324421 () Bool)

(assert (=> b!210673 m!324421))

(declare-fun m!324423 () Bool)

(assert (=> b!210673 m!324423))

(declare-fun m!324425 () Bool)

(assert (=> b!210665 m!324425))

(declare-fun m!324427 () Bool)

(assert (=> b!210665 m!324427))

(declare-fun m!324429 () Bool)

(assert (=> b!210671 m!324429))

(declare-fun m!324431 () Bool)

(assert (=> b!210674 m!324431))

(declare-fun m!324433 () Bool)

(assert (=> b!210674 m!324433))

(declare-fun m!324435 () Bool)

(assert (=> b!210674 m!324435))

(declare-fun m!324437 () Bool)

(assert (=> b!210674 m!324437))

(declare-fun m!324439 () Bool)

(assert (=> start!44206 m!324439))

(declare-fun m!324441 () Bool)

(assert (=> b!210661 m!324441))

(assert (=> b!210660 m!324425))

(assert (=> b!210660 m!324427))

(declare-fun m!324443 () Bool)

(assert (=> b!210660 m!324443))

(declare-fun m!324445 () Bool)

(assert (=> b!210668 m!324445))

(declare-fun m!324447 () Bool)

(assert (=> b!210672 m!324447))

(assert (=> b!210672 m!324447))

(declare-fun m!324449 () Bool)

(assert (=> b!210672 m!324449))

(assert (=> b!210667 m!324391))

(declare-fun m!324451 () Bool)

(assert (=> b!210662 m!324451))

(declare-fun m!324453 () Bool)

(assert (=> b!210678 m!324453))

(declare-fun m!324455 () Bool)

(assert (=> b!210663 m!324455))

(declare-fun m!324457 () Bool)

(assert (=> b!210670 m!324457))

(declare-fun m!324459 () Bool)

(assert (=> b!210677 m!324459))

(declare-fun m!324461 () Bool)

(assert (=> b!210677 m!324461))

(assert (=> b!210677 m!324461))

(declare-fun m!324463 () Bool)

(assert (=> b!210677 m!324463))

(push 1)

(assert (not b!210671))

(assert (not start!44206))

(assert (not b!210664))

(assert (not b!210673))

(assert (not b!210667))

(assert (not b!210662))

(assert (not b!210670))

(assert (not b!210668))

(assert (not b!210672))

(assert (not b!210674))

(assert (not b!210678))

(assert (not b!210665))

(assert (not b!210660))

(assert (not b!210661))

(assert (not b!210677))

(assert (not b!210663))

(assert (not b!210666))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!71269 () Bool)

(assert (=> d!71269 (= (invariant!0 (currentBit!9674 (_2!9682 lt!330834)) (currentByte!9679 (_2!9682 lt!330834)) (size!4611 (buf!5131 (_2!9682 lt!330834)))) (and (bvsge (currentBit!9674 (_2!9682 lt!330834)) #b00000000000000000000000000000000) (bvslt (currentBit!9674 (_2!9682 lt!330834)) #b00000000000000000000000000001000) (bvsge (currentByte!9679 (_2!9682 lt!330834)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9679 (_2!9682 lt!330834)) (size!4611 (buf!5131 (_2!9682 lt!330834)))) (and (= (currentBit!9674 (_2!9682 lt!330834)) #b00000000000000000000000000000000) (= (currentByte!9679 (_2!9682 lt!330834)) (size!4611 (buf!5131 (_2!9682 lt!330834))))))))))

(assert (=> b!210670 d!71269))

(declare-fun d!71271 () Bool)

(declare-fun e!143737 () Bool)

(assert (=> d!71271 e!143737))

(declare-fun res!176932 () Bool)

(assert (=> d!71271 (=> (not res!176932) (not e!143737))))

(declare-fun lt!330880 () BitStream!8330)

(declare-fun lt!330881 () (_ BitVec 64))

(assert (=> d!71271 (= res!176932 (= (bvadd lt!330881 (bvsub lt!330818 lt!330813)) (bitIndex!0 (size!4611 (buf!5131 lt!330880)) (currentByte!9679 lt!330880) (currentBit!9674 lt!330880))))))

(assert (=> d!71271 (or (not (= (bvand lt!330881 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!330818 lt!330813) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!330881 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!330881 (bvsub lt!330818 lt!330813)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71271 (= lt!330881 (bitIndex!0 (size!4611 (buf!5131 (_2!9684 lt!330812))) (currentByte!9679 (_2!9684 lt!330812)) (currentBit!9674 (_2!9684 lt!330812))))))

(declare-fun moveBitIndex!0 (BitStream!8330 (_ BitVec 64)) tuple2!18054)

(assert (=> d!71271 (= lt!330880 (_2!9682 (moveBitIndex!0 (_2!9684 lt!330812) (bvsub lt!330818 lt!330813))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8330 (_ BitVec 64)) Bool)

(assert (=> d!71271 (moveBitIndexPrecond!0 (_2!9684 lt!330812) (bvsub lt!330818 lt!330813))))

(assert (=> d!71271 (= (withMovedBitIndex!0 (_2!9684 lt!330812) (bvsub lt!330818 lt!330813)) lt!330880)))

(declare-fun b!210711 () Bool)

(assert (=> b!210711 (= e!143737 (= (size!4611 (buf!5131 (_2!9684 lt!330812))) (size!4611 (buf!5131 lt!330880))))))

(assert (= (and d!71271 res!176932) b!210711))

(declare-fun m!324487 () Bool)

(assert (=> d!71271 m!324487))

(declare-fun m!324489 () Bool)

(assert (=> d!71271 m!324489))

(declare-fun m!324491 () Bool)

(assert (=> d!71271 m!324491))

(declare-fun m!324493 () Bool)

(assert (=> d!71271 m!324493))

(assert (=> b!210671 d!71271))

(declare-fun d!71273 () Bool)

(declare-fun e!143744 () Bool)

(assert (=> d!71273 e!143744))

(declare-fun res!176943 () Bool)

(assert (=> d!71273 (=> (not res!176943) (not e!143744))))

(declare-fun lt!330935 () (_ BitVec 64))

(declare-fun lt!330938 () (_ BitVec 64))

(declare-fun lt!330934 () (_ BitVec 64))

(assert (=> d!71273 (= res!176943 (= lt!330934 (bvsub lt!330938 lt!330935)))))

(assert (=> d!71273 (or (= (bvand lt!330938 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!330935 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!330938 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!330938 lt!330935) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!71273 (= lt!330935 (remainingBits!0 ((_ sign_extend 32) (size!4611 (buf!5131 (_2!9682 lt!330826)))) ((_ sign_extend 32) (currentByte!9679 (_2!9682 lt!330826))) ((_ sign_extend 32) (currentBit!9674 (_2!9682 lt!330826)))))))

(declare-fun lt!330939 () (_ BitVec 64))

(declare-fun lt!330937 () (_ BitVec 64))

(assert (=> d!71273 (= lt!330938 (bvmul lt!330939 lt!330937))))

(assert (=> d!71273 (or (= lt!330939 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!330937 (bvsdiv (bvmul lt!330939 lt!330937) lt!330939)))))

(assert (=> d!71273 (= lt!330937 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71273 (= lt!330939 ((_ sign_extend 32) (size!4611 (buf!5131 (_2!9682 lt!330826)))))))

(assert (=> d!71273 (= lt!330934 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9679 (_2!9682 lt!330826))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9674 (_2!9682 lt!330826)))))))

(assert (=> d!71273 (invariant!0 (currentBit!9674 (_2!9682 lt!330826)) (currentByte!9679 (_2!9682 lt!330826)) (size!4611 (buf!5131 (_2!9682 lt!330826))))))

(assert (=> d!71273 (= (bitIndex!0 (size!4611 (buf!5131 (_2!9682 lt!330826))) (currentByte!9679 (_2!9682 lt!330826)) (currentBit!9674 (_2!9682 lt!330826))) lt!330934)))

(declare-fun b!210726 () Bool)

(declare-fun res!176944 () Bool)

(assert (=> b!210726 (=> (not res!176944) (not e!143744))))

(assert (=> b!210726 (= res!176944 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!330934))))

(declare-fun b!210727 () Bool)

(declare-fun lt!330936 () (_ BitVec 64))

(assert (=> b!210727 (= e!143744 (bvsle lt!330934 (bvmul lt!330936 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!210727 (or (= lt!330936 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!330936 #b0000000000000000000000000000000000000000000000000000000000001000) lt!330936)))))

(assert (=> b!210727 (= lt!330936 ((_ sign_extend 32) (size!4611 (buf!5131 (_2!9682 lt!330826)))))))

(assert (= (and d!71273 res!176943) b!210726))

(assert (= (and b!210726 res!176944) b!210727))

(declare-fun m!324495 () Bool)

(assert (=> d!71273 m!324495))

(declare-fun m!324497 () Bool)

(assert (=> d!71273 m!324497))

(assert (=> b!210660 d!71273))

(declare-fun d!71275 () Bool)

(declare-fun e!143745 () Bool)

(assert (=> d!71275 e!143745))

(declare-fun res!176945 () Bool)

(assert (=> d!71275 (=> (not res!176945) (not e!143745))))

(declare-fun lt!330941 () (_ BitVec 64))

(declare-fun lt!330944 () (_ BitVec 64))

(declare-fun lt!330940 () (_ BitVec 64))

(assert (=> d!71275 (= res!176945 (= lt!330940 (bvsub lt!330944 lt!330941)))))

(assert (=> d!71275 (or (= (bvand lt!330944 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!330941 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!330944 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!330944 lt!330941) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71275 (= lt!330941 (remainingBits!0 ((_ sign_extend 32) (size!4611 (buf!5131 thiss!1204))) ((_ sign_extend 32) (currentByte!9679 thiss!1204)) ((_ sign_extend 32) (currentBit!9674 thiss!1204))))))

(declare-fun lt!330945 () (_ BitVec 64))

(declare-fun lt!330943 () (_ BitVec 64))

(assert (=> d!71275 (= lt!330944 (bvmul lt!330945 lt!330943))))

(assert (=> d!71275 (or (= lt!330945 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!330943 (bvsdiv (bvmul lt!330945 lt!330943) lt!330945)))))

(assert (=> d!71275 (= lt!330943 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71275 (= lt!330945 ((_ sign_extend 32) (size!4611 (buf!5131 thiss!1204))))))

(assert (=> d!71275 (= lt!330940 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9679 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9674 thiss!1204))))))

(assert (=> d!71275 (invariant!0 (currentBit!9674 thiss!1204) (currentByte!9679 thiss!1204) (size!4611 (buf!5131 thiss!1204)))))

(assert (=> d!71275 (= (bitIndex!0 (size!4611 (buf!5131 thiss!1204)) (currentByte!9679 thiss!1204) (currentBit!9674 thiss!1204)) lt!330940)))

(declare-fun b!210728 () Bool)

(declare-fun res!176946 () Bool)

(assert (=> b!210728 (=> (not res!176946) (not e!143745))))

(assert (=> b!210728 (= res!176946 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!330940))))

(declare-fun b!210729 () Bool)

(declare-fun lt!330942 () (_ BitVec 64))

(assert (=> b!210729 (= e!143745 (bvsle lt!330940 (bvmul lt!330942 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!210729 (or (= lt!330942 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!330942 #b0000000000000000000000000000000000000000000000000000000000001000) lt!330942)))))

(assert (=> b!210729 (= lt!330942 ((_ sign_extend 32) (size!4611 (buf!5131 thiss!1204))))))

(assert (= (and d!71275 res!176945) b!210728))

(assert (= (and b!210728 res!176946) b!210729))

(declare-fun m!324499 () Bool)

(assert (=> d!71275 m!324499))

(assert (=> d!71275 m!324453))

(assert (=> b!210660 d!71275))

(declare-fun d!71277 () Bool)

(declare-fun e!143752 () Bool)

(assert (=> d!71277 e!143752))

(declare-fun res!176959 () Bool)

(assert (=> d!71277 (=> (not res!176959) (not e!143752))))

(declare-fun lt!330987 () tuple2!18054)

(assert (=> d!71277 (= res!176959 (= (size!4611 (buf!5131 thiss!1204)) (size!4611 (buf!5131 (_2!9682 lt!330987)))))))

(declare-fun choose!16 (BitStream!8330 Bool) tuple2!18054)

(assert (=> d!71277 (= lt!330987 (choose!16 thiss!1204 lt!330817))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!71277 (validate_offset_bit!0 ((_ sign_extend 32) (size!4611 (buf!5131 thiss!1204))) ((_ sign_extend 32) (currentByte!9679 thiss!1204)) ((_ sign_extend 32) (currentBit!9674 thiss!1204)))))

(assert (=> d!71277 (= (appendBit!0 thiss!1204 lt!330817) lt!330987)))

(declare-fun b!210746 () Bool)

(declare-fun e!143753 () Bool)

(assert (=> b!210746 (= e!143752 e!143753)))

(declare-fun res!176958 () Bool)

(assert (=> b!210746 (=> (not res!176958) (not e!143753))))

(declare-fun lt!330985 () tuple2!18056)

(assert (=> b!210746 (= res!176958 (and (= (_2!9683 lt!330985) lt!330817) (= (_1!9683 lt!330985) (_2!9682 lt!330987))))))

(assert (=> b!210746 (= lt!330985 (readBitPure!0 (readerFrom!0 (_2!9682 lt!330987) (currentBit!9674 thiss!1204) (currentByte!9679 thiss!1204))))))

(declare-fun b!210744 () Bool)

(declare-fun res!176960 () Bool)

(assert (=> b!210744 (=> (not res!176960) (not e!143752))))

(declare-fun lt!330984 () (_ BitVec 64))

(declare-fun lt!330986 () (_ BitVec 64))

(assert (=> b!210744 (= res!176960 (= (bitIndex!0 (size!4611 (buf!5131 (_2!9682 lt!330987))) (currentByte!9679 (_2!9682 lt!330987)) (currentBit!9674 (_2!9682 lt!330987))) (bvadd lt!330986 lt!330984)))))

(assert (=> b!210744 (or (not (= (bvand lt!330986 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!330984 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!330986 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!330986 lt!330984) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210744 (= lt!330984 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!210744 (= lt!330986 (bitIndex!0 (size!4611 (buf!5131 thiss!1204)) (currentByte!9679 thiss!1204) (currentBit!9674 thiss!1204)))))

(declare-fun b!210747 () Bool)

(assert (=> b!210747 (= e!143753 (= (bitIndex!0 (size!4611 (buf!5131 (_1!9683 lt!330985))) (currentByte!9679 (_1!9683 lt!330985)) (currentBit!9674 (_1!9683 lt!330985))) (bitIndex!0 (size!4611 (buf!5131 (_2!9682 lt!330987))) (currentByte!9679 (_2!9682 lt!330987)) (currentBit!9674 (_2!9682 lt!330987)))))))

(declare-fun b!210745 () Bool)

(declare-fun res!176961 () Bool)

(assert (=> b!210745 (=> (not res!176961) (not e!143752))))

(assert (=> b!210745 (= res!176961 (isPrefixOf!0 thiss!1204 (_2!9682 lt!330987)))))

(assert (= (and d!71277 res!176959) b!210744))

(assert (= (and b!210744 res!176960) b!210745))

(assert (= (and b!210745 res!176961) b!210746))

(assert (= (and b!210746 res!176958) b!210747))

(declare-fun m!324539 () Bool)

(assert (=> b!210746 m!324539))

(assert (=> b!210746 m!324539))

(declare-fun m!324541 () Bool)

(assert (=> b!210746 m!324541))

(declare-fun m!324543 () Bool)

(assert (=> b!210747 m!324543))

(declare-fun m!324545 () Bool)

(assert (=> b!210747 m!324545))

(declare-fun m!324547 () Bool)

(assert (=> d!71277 m!324547))

(declare-fun m!324549 () Bool)

(assert (=> d!71277 m!324549))

(declare-fun m!324551 () Bool)

(assert (=> b!210745 m!324551))

(assert (=> b!210744 m!324545))

(assert (=> b!210744 m!324427))

(assert (=> b!210660 d!71277))

(declare-fun d!71289 () Bool)

(declare-fun res!176971 () Bool)

(declare-fun e!143760 () Bool)

(assert (=> d!71289 (=> (not res!176971) (not e!143760))))

(assert (=> d!71289 (= res!176971 (= (size!4611 (buf!5131 (_2!9682 lt!330826))) (size!4611 (buf!5131 (_2!9682 lt!330834)))))))

(assert (=> d!71289 (= (isPrefixOf!0 (_2!9682 lt!330826) (_2!9682 lt!330834)) e!143760)))

(declare-fun b!210756 () Bool)

(declare-fun res!176970 () Bool)

(assert (=> b!210756 (=> (not res!176970) (not e!143760))))

(assert (=> b!210756 (= res!176970 (bvsle (bitIndex!0 (size!4611 (buf!5131 (_2!9682 lt!330826))) (currentByte!9679 (_2!9682 lt!330826)) (currentBit!9674 (_2!9682 lt!330826))) (bitIndex!0 (size!4611 (buf!5131 (_2!9682 lt!330834))) (currentByte!9679 (_2!9682 lt!330834)) (currentBit!9674 (_2!9682 lt!330834)))))))

(declare-fun b!210757 () Bool)

(declare-fun e!143761 () Bool)

(assert (=> b!210757 (= e!143760 e!143761)))

(declare-fun res!176972 () Bool)

(assert (=> b!210757 (=> res!176972 e!143761)))

(assert (=> b!210757 (= res!176972 (= (size!4611 (buf!5131 (_2!9682 lt!330826))) #b00000000000000000000000000000000))))

(declare-fun b!210758 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10494 array!10494 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!210758 (= e!143761 (arrayBitRangesEq!0 (buf!5131 (_2!9682 lt!330826)) (buf!5131 (_2!9682 lt!330834)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4611 (buf!5131 (_2!9682 lt!330826))) (currentByte!9679 (_2!9682 lt!330826)) (currentBit!9674 (_2!9682 lt!330826)))))))

(assert (= (and d!71289 res!176971) b!210756))

(assert (= (and b!210756 res!176970) b!210757))

(assert (= (and b!210757 (not res!176972)) b!210758))

(assert (=> b!210756 m!324425))

(assert (=> b!210756 m!324431))

(assert (=> b!210758 m!324425))

(assert (=> b!210758 m!324425))

(declare-fun m!324553 () Bool)

(assert (=> b!210758 m!324553))

(assert (=> b!210661 d!71289))

(declare-fun d!71291 () Bool)

(declare-datatypes ((tuple2!18066 0))(
  ( (tuple2!18067 (_1!9688 Bool) (_2!9688 BitStream!8330)) )
))
(declare-fun lt!331002 () tuple2!18066)

(declare-fun readBit!0 (BitStream!8330) tuple2!18066)

(assert (=> d!71291 (= lt!331002 (readBit!0 (readerFrom!0 (_2!9682 lt!330826) (currentBit!9674 thiss!1204) (currentByte!9679 thiss!1204))))))

(assert (=> d!71291 (= (readBitPure!0 (readerFrom!0 (_2!9682 lt!330826) (currentBit!9674 thiss!1204) (currentByte!9679 thiss!1204))) (tuple2!18057 (_2!9688 lt!331002) (_1!9688 lt!331002)))))

(declare-fun bs!17503 () Bool)

(assert (= bs!17503 d!71291))

(assert (=> bs!17503 m!324447))

(declare-fun m!324565 () Bool)

(assert (=> bs!17503 m!324565))

(assert (=> b!210672 d!71291))

(declare-fun d!71295 () Bool)

(declare-fun e!143768 () Bool)

(assert (=> d!71295 e!143768))

(declare-fun res!176982 () Bool)

(assert (=> d!71295 (=> (not res!176982) (not e!143768))))

(assert (=> d!71295 (= res!176982 (invariant!0 (currentBit!9674 (_2!9682 lt!330826)) (currentByte!9679 (_2!9682 lt!330826)) (size!4611 (buf!5131 (_2!9682 lt!330826)))))))

(assert (=> d!71295 (= (readerFrom!0 (_2!9682 lt!330826) (currentBit!9674 thiss!1204) (currentByte!9679 thiss!1204)) (BitStream!8331 (buf!5131 (_2!9682 lt!330826)) (currentByte!9679 thiss!1204) (currentBit!9674 thiss!1204)))))

(declare-fun b!210769 () Bool)

(assert (=> b!210769 (= e!143768 (invariant!0 (currentBit!9674 thiss!1204) (currentByte!9679 thiss!1204) (size!4611 (buf!5131 (_2!9682 lt!330826)))))))

(assert (= (and d!71295 res!176982) b!210769))

(assert (=> d!71295 m!324497))

(assert (=> b!210769 m!324395))

(assert (=> b!210672 d!71295))

(declare-fun d!71307 () Bool)

(assert (=> d!71307 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!210673 d!71307))

(declare-fun d!71313 () Bool)

(declare-datatypes ((tuple2!18068 0))(
  ( (tuple2!18069 (_1!9689 (_ BitVec 64)) (_2!9689 BitStream!8330)) )
))
(declare-fun lt!331040 () tuple2!18068)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8330 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18068)

(assert (=> d!71313 (= lt!331040 (readNBitsLSBFirstsLoop!0 (_1!9684 lt!330832) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!330819))))

(assert (=> d!71313 (= (readNBitsLSBFirstsLoopPure!0 (_1!9684 lt!330832) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!330819) (tuple2!18061 (_2!9689 lt!331040) (_1!9689 lt!331040)))))

(declare-fun bs!17510 () Bool)

(assert (= bs!17510 d!71313))

(declare-fun m!324611 () Bool)

(assert (=> bs!17510 m!324611))

(assert (=> b!210673 d!71313))

(declare-fun d!71325 () Bool)

(declare-fun e!143770 () Bool)

(assert (=> d!71325 e!143770))

(declare-fun res!176985 () Bool)

(assert (=> d!71325 (=> (not res!176985) (not e!143770))))

(declare-fun lt!331042 () (_ BitVec 64))

(declare-fun lt!331045 () (_ BitVec 64))

(declare-fun lt!331041 () (_ BitVec 64))

(assert (=> d!71325 (= res!176985 (= lt!331041 (bvsub lt!331045 lt!331042)))))

(assert (=> d!71325 (or (= (bvand lt!331045 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!331042 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!331045 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!331045 lt!331042) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71325 (= lt!331042 (remainingBits!0 ((_ sign_extend 32) (size!4611 (buf!5131 (_1!9683 lt!330815)))) ((_ sign_extend 32) (currentByte!9679 (_1!9683 lt!330815))) ((_ sign_extend 32) (currentBit!9674 (_1!9683 lt!330815)))))))

(declare-fun lt!331046 () (_ BitVec 64))

(declare-fun lt!331044 () (_ BitVec 64))

(assert (=> d!71325 (= lt!331045 (bvmul lt!331046 lt!331044))))

(assert (=> d!71325 (or (= lt!331046 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!331044 (bvsdiv (bvmul lt!331046 lt!331044) lt!331046)))))

(assert (=> d!71325 (= lt!331044 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71325 (= lt!331046 ((_ sign_extend 32) (size!4611 (buf!5131 (_1!9683 lt!330815)))))))

(assert (=> d!71325 (= lt!331041 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9679 (_1!9683 lt!330815))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9674 (_1!9683 lt!330815)))))))

(assert (=> d!71325 (invariant!0 (currentBit!9674 (_1!9683 lt!330815)) (currentByte!9679 (_1!9683 lt!330815)) (size!4611 (buf!5131 (_1!9683 lt!330815))))))

(assert (=> d!71325 (= (bitIndex!0 (size!4611 (buf!5131 (_1!9683 lt!330815))) (currentByte!9679 (_1!9683 lt!330815)) (currentBit!9674 (_1!9683 lt!330815))) lt!331041)))

(declare-fun b!210772 () Bool)

(declare-fun res!176986 () Bool)

(assert (=> b!210772 (=> (not res!176986) (not e!143770))))

(assert (=> b!210772 (= res!176986 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!331041))))

(declare-fun b!210773 () Bool)

(declare-fun lt!331043 () (_ BitVec 64))

(assert (=> b!210773 (= e!143770 (bvsle lt!331041 (bvmul lt!331043 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!210773 (or (= lt!331043 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!331043 #b0000000000000000000000000000000000000000000000000000000000001000) lt!331043)))))

(assert (=> b!210773 (= lt!331043 ((_ sign_extend 32) (size!4611 (buf!5131 (_1!9683 lt!330815)))))))

(assert (= (and d!71325 res!176985) b!210772))

(assert (= (and b!210772 res!176986) b!210773))

(declare-fun m!324613 () Bool)

(assert (=> d!71325 m!324613))

(declare-fun m!324615 () Bool)

(assert (=> d!71325 m!324615))

(assert (=> b!210673 d!71325))

(declare-fun b!210796 () Bool)

(declare-fun e!143784 () Unit!15011)

(declare-fun lt!331139 () Unit!15011)

(assert (=> b!210796 (= e!143784 lt!331139)))

(declare-fun lt!331133 () (_ BitVec 64))

(assert (=> b!210796 (= lt!331133 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!331141 () (_ BitVec 64))

(assert (=> b!210796 (= lt!331141 (bitIndex!0 (size!4611 (buf!5131 thiss!1204)) (currentByte!9679 thiss!1204) (currentBit!9674 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10494 array!10494 (_ BitVec 64) (_ BitVec 64)) Unit!15011)

(assert (=> b!210796 (= lt!331139 (arrayBitRangesEqSymmetric!0 (buf!5131 thiss!1204) (buf!5131 (_2!9682 lt!330834)) lt!331133 lt!331141))))

(assert (=> b!210796 (arrayBitRangesEq!0 (buf!5131 (_2!9682 lt!330834)) (buf!5131 thiss!1204) lt!331133 lt!331141)))

(declare-fun b!210797 () Bool)

(declare-fun lt!331128 () (_ BitVec 64))

(declare-fun lt!331130 () tuple2!18058)

(declare-fun lt!331123 () (_ BitVec 64))

(declare-fun e!143785 () Bool)

(assert (=> b!210797 (= e!143785 (= (_1!9684 lt!331130) (withMovedBitIndex!0 (_2!9684 lt!331130) (bvsub lt!331128 lt!331123))))))

(assert (=> b!210797 (or (= (bvand lt!331128 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!331123 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!331128 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!331128 lt!331123) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210797 (= lt!331123 (bitIndex!0 (size!4611 (buf!5131 (_2!9682 lt!330834))) (currentByte!9679 (_2!9682 lt!330834)) (currentBit!9674 (_2!9682 lt!330834))))))

(assert (=> b!210797 (= lt!331128 (bitIndex!0 (size!4611 (buf!5131 thiss!1204)) (currentByte!9679 thiss!1204) (currentBit!9674 thiss!1204)))))

(declare-fun b!210798 () Bool)

(declare-fun Unit!15026 () Unit!15011)

(assert (=> b!210798 (= e!143784 Unit!15026)))

(declare-fun b!210799 () Bool)

(declare-fun res!177005 () Bool)

(assert (=> b!210799 (=> (not res!177005) (not e!143785))))

(assert (=> b!210799 (= res!177005 (isPrefixOf!0 (_2!9684 lt!331130) (_2!9682 lt!330834)))))

(declare-fun d!71327 () Bool)

(assert (=> d!71327 e!143785))

(declare-fun res!177007 () Bool)

(assert (=> d!71327 (=> (not res!177007) (not e!143785))))

(assert (=> d!71327 (= res!177007 (isPrefixOf!0 (_1!9684 lt!331130) (_2!9684 lt!331130)))))

(declare-fun lt!331134 () BitStream!8330)

(assert (=> d!71327 (= lt!331130 (tuple2!18059 lt!331134 (_2!9682 lt!330834)))))

(declare-fun lt!331131 () Unit!15011)

(declare-fun lt!331138 () Unit!15011)

(assert (=> d!71327 (= lt!331131 lt!331138)))

(assert (=> d!71327 (isPrefixOf!0 lt!331134 (_2!9682 lt!330834))))

(assert (=> d!71327 (= lt!331138 (lemmaIsPrefixTransitive!0 lt!331134 (_2!9682 lt!330834) (_2!9682 lt!330834)))))

(declare-fun lt!331137 () Unit!15011)

(declare-fun lt!331140 () Unit!15011)

(assert (=> d!71327 (= lt!331137 lt!331140)))

(assert (=> d!71327 (isPrefixOf!0 lt!331134 (_2!9682 lt!330834))))

(assert (=> d!71327 (= lt!331140 (lemmaIsPrefixTransitive!0 lt!331134 thiss!1204 (_2!9682 lt!330834)))))

(declare-fun lt!331129 () Unit!15011)

(assert (=> d!71327 (= lt!331129 e!143784)))

(declare-fun c!10365 () Bool)

(assert (=> d!71327 (= c!10365 (not (= (size!4611 (buf!5131 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!331126 () Unit!15011)

(declare-fun lt!331132 () Unit!15011)

(assert (=> d!71327 (= lt!331126 lt!331132)))

(assert (=> d!71327 (isPrefixOf!0 (_2!9682 lt!330834) (_2!9682 lt!330834))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8330) Unit!15011)

(assert (=> d!71327 (= lt!331132 (lemmaIsPrefixRefl!0 (_2!9682 lt!330834)))))

(declare-fun lt!331135 () Unit!15011)

(declare-fun lt!331127 () Unit!15011)

(assert (=> d!71327 (= lt!331135 lt!331127)))

(assert (=> d!71327 (= lt!331127 (lemmaIsPrefixRefl!0 (_2!9682 lt!330834)))))

(declare-fun lt!331142 () Unit!15011)

(declare-fun lt!331136 () Unit!15011)

(assert (=> d!71327 (= lt!331142 lt!331136)))

(assert (=> d!71327 (isPrefixOf!0 lt!331134 lt!331134)))

(assert (=> d!71327 (= lt!331136 (lemmaIsPrefixRefl!0 lt!331134))))

(declare-fun lt!331124 () Unit!15011)

(declare-fun lt!331125 () Unit!15011)

(assert (=> d!71327 (= lt!331124 lt!331125)))

(assert (=> d!71327 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!71327 (= lt!331125 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!71327 (= lt!331134 (BitStream!8331 (buf!5131 (_2!9682 lt!330834)) (currentByte!9679 thiss!1204) (currentBit!9674 thiss!1204)))))

(assert (=> d!71327 (isPrefixOf!0 thiss!1204 (_2!9682 lt!330834))))

(assert (=> d!71327 (= (reader!0 thiss!1204 (_2!9682 lt!330834)) lt!331130)))

(declare-fun b!210800 () Bool)

(declare-fun res!177006 () Bool)

(assert (=> b!210800 (=> (not res!177006) (not e!143785))))

(assert (=> b!210800 (= res!177006 (isPrefixOf!0 (_1!9684 lt!331130) thiss!1204))))

(assert (= (and d!71327 c!10365) b!210796))

(assert (= (and d!71327 (not c!10365)) b!210798))

(assert (= (and d!71327 res!177007) b!210800))

(assert (= (and b!210800 res!177006) b!210799))

(assert (= (and b!210799 res!177005) b!210797))

(declare-fun m!324647 () Bool)

(assert (=> d!71327 m!324647))

(declare-fun m!324649 () Bool)

(assert (=> d!71327 m!324649))

(declare-fun m!324651 () Bool)

(assert (=> d!71327 m!324651))

(declare-fun m!324653 () Bool)

(assert (=> d!71327 m!324653))

(declare-fun m!324655 () Bool)

(assert (=> d!71327 m!324655))

(declare-fun m!324657 () Bool)

(assert (=> d!71327 m!324657))

(assert (=> d!71327 m!324433))

(declare-fun m!324659 () Bool)

(assert (=> d!71327 m!324659))

(declare-fun m!324661 () Bool)

(assert (=> d!71327 m!324661))

(declare-fun m!324663 () Bool)

(assert (=> d!71327 m!324663))

(declare-fun m!324665 () Bool)

(assert (=> d!71327 m!324665))

(assert (=> b!210796 m!324427))

(declare-fun m!324667 () Bool)

(assert (=> b!210796 m!324667))

(declare-fun m!324669 () Bool)

(assert (=> b!210796 m!324669))

(declare-fun m!324671 () Bool)

(assert (=> b!210800 m!324671))

(declare-fun m!324673 () Bool)

(assert (=> b!210799 m!324673))

(declare-fun m!324675 () Bool)

(assert (=> b!210797 m!324675))

(assert (=> b!210797 m!324431))

(assert (=> b!210797 m!324427))

(assert (=> b!210673 d!71327))

(declare-fun d!71345 () Bool)

(assert (=> d!71345 (validate_offset_bits!1 ((_ sign_extend 32) (size!4611 (buf!5131 (_2!9682 lt!330834)))) ((_ sign_extend 32) (currentByte!9679 thiss!1204)) ((_ sign_extend 32) (currentBit!9674 thiss!1204)) lt!330829)))

(declare-fun lt!331145 () Unit!15011)

(declare-fun choose!9 (BitStream!8330 array!10494 (_ BitVec 64) BitStream!8330) Unit!15011)

(assert (=> d!71345 (= lt!331145 (choose!9 thiss!1204 (buf!5131 (_2!9682 lt!330834)) lt!330829 (BitStream!8331 (buf!5131 (_2!9682 lt!330834)) (currentByte!9679 thiss!1204) (currentBit!9674 thiss!1204))))))

(assert (=> d!71345 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5131 (_2!9682 lt!330834)) lt!330829) lt!331145)))

(declare-fun bs!17515 () Bool)

(assert (= bs!17515 d!71345))

(assert (=> bs!17515 m!324417))

(declare-fun m!324677 () Bool)

(assert (=> bs!17515 m!324677))

(assert (=> b!210673 d!71345))

(declare-fun d!71347 () Bool)

(declare-fun e!143788 () Bool)

(assert (=> d!71347 e!143788))

(declare-fun res!177010 () Bool)

(assert (=> d!71347 (=> (not res!177010) (not e!143788))))

(declare-fun lt!331154 () tuple2!18056)

(declare-fun lt!331156 () tuple2!18056)

(assert (=> d!71347 (= res!177010 (= (bitIndex!0 (size!4611 (buf!5131 (_1!9683 lt!331154))) (currentByte!9679 (_1!9683 lt!331154)) (currentBit!9674 (_1!9683 lt!331154))) (bitIndex!0 (size!4611 (buf!5131 (_1!9683 lt!331156))) (currentByte!9679 (_1!9683 lt!331156)) (currentBit!9674 (_1!9683 lt!331156)))))))

(declare-fun lt!331157 () BitStream!8330)

(declare-fun lt!331155 () Unit!15011)

(declare-fun choose!50 (BitStream!8330 BitStream!8330 BitStream!8330 tuple2!18056 tuple2!18056 BitStream!8330 Bool tuple2!18056 tuple2!18056 BitStream!8330 Bool) Unit!15011)

(assert (=> d!71347 (= lt!331155 (choose!50 lt!330824 (_2!9682 lt!330834) lt!331157 lt!331154 (tuple2!18057 (_1!9683 lt!331154) (_2!9683 lt!331154)) (_1!9683 lt!331154) (_2!9683 lt!331154) lt!331156 (tuple2!18057 (_1!9683 lt!331156) (_2!9683 lt!331156)) (_1!9683 lt!331156) (_2!9683 lt!331156)))))

(assert (=> d!71347 (= lt!331156 (readBitPure!0 lt!331157))))

(assert (=> d!71347 (= lt!331154 (readBitPure!0 lt!330824))))

(assert (=> d!71347 (= lt!331157 (BitStream!8331 (buf!5131 (_2!9682 lt!330834)) (currentByte!9679 lt!330824) (currentBit!9674 lt!330824)))))

(assert (=> d!71347 (invariant!0 (currentBit!9674 lt!330824) (currentByte!9679 lt!330824) (size!4611 (buf!5131 (_2!9682 lt!330834))))))

(assert (=> d!71347 (= (readBitPrefixLemma!0 lt!330824 (_2!9682 lt!330834)) lt!331155)))

(declare-fun b!210803 () Bool)

(assert (=> b!210803 (= e!143788 (= (_2!9683 lt!331154) (_2!9683 lt!331156)))))

(assert (= (and d!71347 res!177010) b!210803))

(declare-fun m!324679 () Bool)

(assert (=> d!71347 m!324679))

(declare-fun m!324681 () Bool)

(assert (=> d!71347 m!324681))

(declare-fun m!324683 () Bool)

(assert (=> d!71347 m!324683))

(assert (=> d!71347 m!324393))

(declare-fun m!324685 () Bool)

(assert (=> d!71347 m!324685))

(declare-fun m!324687 () Bool)

(assert (=> d!71347 m!324687))

(assert (=> b!210673 d!71347))

(declare-fun d!71349 () Bool)

(declare-fun e!143789 () Bool)

(assert (=> d!71349 e!143789))

(declare-fun res!177011 () Bool)

(assert (=> d!71349 (=> (not res!177011) (not e!143789))))

(declare-fun lt!331162 () (_ BitVec 64))

(declare-fun lt!331159 () (_ BitVec 64))

(declare-fun lt!331158 () (_ BitVec 64))

(assert (=> d!71349 (= res!177011 (= lt!331158 (bvsub lt!331162 lt!331159)))))

(assert (=> d!71349 (or (= (bvand lt!331162 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!331159 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!331162 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!331162 lt!331159) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71349 (= lt!331159 (remainingBits!0 ((_ sign_extend 32) (size!4611 (buf!5131 (_1!9683 lt!330814)))) ((_ sign_extend 32) (currentByte!9679 (_1!9683 lt!330814))) ((_ sign_extend 32) (currentBit!9674 (_1!9683 lt!330814)))))))

(declare-fun lt!331163 () (_ BitVec 64))

(declare-fun lt!331161 () (_ BitVec 64))

(assert (=> d!71349 (= lt!331162 (bvmul lt!331163 lt!331161))))

(assert (=> d!71349 (or (= lt!331163 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!331161 (bvsdiv (bvmul lt!331163 lt!331161) lt!331163)))))

(assert (=> d!71349 (= lt!331161 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71349 (= lt!331163 ((_ sign_extend 32) (size!4611 (buf!5131 (_1!9683 lt!330814)))))))

(assert (=> d!71349 (= lt!331158 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9679 (_1!9683 lt!330814))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9674 (_1!9683 lt!330814)))))))

(assert (=> d!71349 (invariant!0 (currentBit!9674 (_1!9683 lt!330814)) (currentByte!9679 (_1!9683 lt!330814)) (size!4611 (buf!5131 (_1!9683 lt!330814))))))

(assert (=> d!71349 (= (bitIndex!0 (size!4611 (buf!5131 (_1!9683 lt!330814))) (currentByte!9679 (_1!9683 lt!330814)) (currentBit!9674 (_1!9683 lt!330814))) lt!331158)))

(declare-fun b!210804 () Bool)

(declare-fun res!177012 () Bool)

(assert (=> b!210804 (=> (not res!177012) (not e!143789))))

(assert (=> b!210804 (= res!177012 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!331158))))

(declare-fun b!210805 () Bool)

(declare-fun lt!331160 () (_ BitVec 64))

(assert (=> b!210805 (= e!143789 (bvsle lt!331158 (bvmul lt!331160 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!210805 (or (= lt!331160 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!331160 #b0000000000000000000000000000000000000000000000000000000000001000) lt!331160)))))

(assert (=> b!210805 (= lt!331160 ((_ sign_extend 32) (size!4611 (buf!5131 (_1!9683 lt!330814)))))))

(assert (= (and d!71349 res!177011) b!210804))

(assert (= (and b!210804 res!177012) b!210805))

(declare-fun m!324689 () Bool)

(assert (=> d!71349 m!324689))

(declare-fun m!324691 () Bool)

(assert (=> d!71349 m!324691))

(assert (=> b!210673 d!71349))

(declare-fun d!71351 () Bool)

(assert (=> d!71351 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4611 (buf!5131 (_2!9682 lt!330834)))) ((_ sign_extend 32) (currentByte!9679 (_2!9682 lt!330826))) ((_ sign_extend 32) (currentBit!9674 (_2!9682 lt!330826))) lt!330836) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4611 (buf!5131 (_2!9682 lt!330834)))) ((_ sign_extend 32) (currentByte!9679 (_2!9682 lt!330826))) ((_ sign_extend 32) (currentBit!9674 (_2!9682 lt!330826)))) lt!330836))))

(declare-fun bs!17516 () Bool)

(assert (= bs!17516 d!71351))

(declare-fun m!324693 () Bool)

(assert (=> bs!17516 m!324693))

(assert (=> b!210673 d!71351))

(declare-fun b!210806 () Bool)

(declare-fun e!143790 () Unit!15011)

(declare-fun lt!331180 () Unit!15011)

(assert (=> b!210806 (= e!143790 lt!331180)))

(declare-fun lt!331174 () (_ BitVec 64))

(assert (=> b!210806 (= lt!331174 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!331182 () (_ BitVec 64))

(assert (=> b!210806 (= lt!331182 (bitIndex!0 (size!4611 (buf!5131 (_2!9682 lt!330826))) (currentByte!9679 (_2!9682 lt!330826)) (currentBit!9674 (_2!9682 lt!330826))))))

(assert (=> b!210806 (= lt!331180 (arrayBitRangesEqSymmetric!0 (buf!5131 (_2!9682 lt!330826)) (buf!5131 (_2!9682 lt!330834)) lt!331174 lt!331182))))

(assert (=> b!210806 (arrayBitRangesEq!0 (buf!5131 (_2!9682 lt!330834)) (buf!5131 (_2!9682 lt!330826)) lt!331174 lt!331182)))

(declare-fun lt!331169 () (_ BitVec 64))

(declare-fun e!143791 () Bool)

(declare-fun lt!331164 () (_ BitVec 64))

(declare-fun lt!331171 () tuple2!18058)

(declare-fun b!210807 () Bool)

(assert (=> b!210807 (= e!143791 (= (_1!9684 lt!331171) (withMovedBitIndex!0 (_2!9684 lt!331171) (bvsub lt!331169 lt!331164))))))

(assert (=> b!210807 (or (= (bvand lt!331169 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!331164 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!331169 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!331169 lt!331164) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210807 (= lt!331164 (bitIndex!0 (size!4611 (buf!5131 (_2!9682 lt!330834))) (currentByte!9679 (_2!9682 lt!330834)) (currentBit!9674 (_2!9682 lt!330834))))))

(assert (=> b!210807 (= lt!331169 (bitIndex!0 (size!4611 (buf!5131 (_2!9682 lt!330826))) (currentByte!9679 (_2!9682 lt!330826)) (currentBit!9674 (_2!9682 lt!330826))))))

(declare-fun b!210808 () Bool)

(declare-fun Unit!15027 () Unit!15011)

(assert (=> b!210808 (= e!143790 Unit!15027)))

(declare-fun b!210809 () Bool)

(declare-fun res!177013 () Bool)

(assert (=> b!210809 (=> (not res!177013) (not e!143791))))

(assert (=> b!210809 (= res!177013 (isPrefixOf!0 (_2!9684 lt!331171) (_2!9682 lt!330834)))))

(declare-fun d!71353 () Bool)

(assert (=> d!71353 e!143791))

(declare-fun res!177015 () Bool)

(assert (=> d!71353 (=> (not res!177015) (not e!143791))))

(assert (=> d!71353 (= res!177015 (isPrefixOf!0 (_1!9684 lt!331171) (_2!9684 lt!331171)))))

(declare-fun lt!331175 () BitStream!8330)

(assert (=> d!71353 (= lt!331171 (tuple2!18059 lt!331175 (_2!9682 lt!330834)))))

(declare-fun lt!331172 () Unit!15011)

(declare-fun lt!331179 () Unit!15011)

(assert (=> d!71353 (= lt!331172 lt!331179)))

(assert (=> d!71353 (isPrefixOf!0 lt!331175 (_2!9682 lt!330834))))

(assert (=> d!71353 (= lt!331179 (lemmaIsPrefixTransitive!0 lt!331175 (_2!9682 lt!330834) (_2!9682 lt!330834)))))

(declare-fun lt!331178 () Unit!15011)

(declare-fun lt!331181 () Unit!15011)

(assert (=> d!71353 (= lt!331178 lt!331181)))

(assert (=> d!71353 (isPrefixOf!0 lt!331175 (_2!9682 lt!330834))))

(assert (=> d!71353 (= lt!331181 (lemmaIsPrefixTransitive!0 lt!331175 (_2!9682 lt!330826) (_2!9682 lt!330834)))))

(declare-fun lt!331170 () Unit!15011)

(assert (=> d!71353 (= lt!331170 e!143790)))

(declare-fun c!10366 () Bool)

(assert (=> d!71353 (= c!10366 (not (= (size!4611 (buf!5131 (_2!9682 lt!330826))) #b00000000000000000000000000000000)))))

(declare-fun lt!331167 () Unit!15011)

(declare-fun lt!331173 () Unit!15011)

(assert (=> d!71353 (= lt!331167 lt!331173)))

(assert (=> d!71353 (isPrefixOf!0 (_2!9682 lt!330834) (_2!9682 lt!330834))))

(assert (=> d!71353 (= lt!331173 (lemmaIsPrefixRefl!0 (_2!9682 lt!330834)))))

(declare-fun lt!331176 () Unit!15011)

(declare-fun lt!331168 () Unit!15011)

(assert (=> d!71353 (= lt!331176 lt!331168)))

(assert (=> d!71353 (= lt!331168 (lemmaIsPrefixRefl!0 (_2!9682 lt!330834)))))

(declare-fun lt!331183 () Unit!15011)

(declare-fun lt!331177 () Unit!15011)

(assert (=> d!71353 (= lt!331183 lt!331177)))

(assert (=> d!71353 (isPrefixOf!0 lt!331175 lt!331175)))

(assert (=> d!71353 (= lt!331177 (lemmaIsPrefixRefl!0 lt!331175))))

(declare-fun lt!331165 () Unit!15011)

(declare-fun lt!331166 () Unit!15011)

(assert (=> d!71353 (= lt!331165 lt!331166)))

(assert (=> d!71353 (isPrefixOf!0 (_2!9682 lt!330826) (_2!9682 lt!330826))))

(assert (=> d!71353 (= lt!331166 (lemmaIsPrefixRefl!0 (_2!9682 lt!330826)))))

(assert (=> d!71353 (= lt!331175 (BitStream!8331 (buf!5131 (_2!9682 lt!330834)) (currentByte!9679 (_2!9682 lt!330826)) (currentBit!9674 (_2!9682 lt!330826))))))

(assert (=> d!71353 (isPrefixOf!0 (_2!9682 lt!330826) (_2!9682 lt!330834))))

(assert (=> d!71353 (= (reader!0 (_2!9682 lt!330826) (_2!9682 lt!330834)) lt!331171)))

(declare-fun b!210810 () Bool)

(declare-fun res!177014 () Bool)

(assert (=> b!210810 (=> (not res!177014) (not e!143791))))

(assert (=> b!210810 (= res!177014 (isPrefixOf!0 (_1!9684 lt!331171) (_2!9682 lt!330826)))))

(assert (= (and d!71353 c!10366) b!210806))

(assert (= (and d!71353 (not c!10366)) b!210808))

(assert (= (and d!71353 res!177015) b!210810))

(assert (= (and b!210810 res!177014) b!210809))

(assert (= (and b!210809 res!177013) b!210807))

(declare-fun m!324695 () Bool)

(assert (=> d!71353 m!324695))

(assert (=> d!71353 m!324649))

(declare-fun m!324697 () Bool)

(assert (=> d!71353 m!324697))

(declare-fun m!324699 () Bool)

(assert (=> d!71353 m!324699))

(assert (=> d!71353 m!324655))

(declare-fun m!324701 () Bool)

(assert (=> d!71353 m!324701))

(assert (=> d!71353 m!324441))

(declare-fun m!324703 () Bool)

(assert (=> d!71353 m!324703))

(declare-fun m!324705 () Bool)

(assert (=> d!71353 m!324705))

(declare-fun m!324707 () Bool)

(assert (=> d!71353 m!324707))

(declare-fun m!324709 () Bool)

(assert (=> d!71353 m!324709))

(assert (=> b!210806 m!324425))

(declare-fun m!324711 () Bool)

(assert (=> b!210806 m!324711))

(declare-fun m!324713 () Bool)

(assert (=> b!210806 m!324713))

(declare-fun m!324715 () Bool)

(assert (=> b!210810 m!324715))

(declare-fun m!324717 () Bool)

(assert (=> b!210809 m!324717))

(declare-fun m!324719 () Bool)

(assert (=> b!210807 m!324719))

(assert (=> b!210807 m!324431))

(assert (=> b!210807 m!324425))

(assert (=> b!210673 d!71353))

(declare-fun d!71355 () Bool)

(declare-fun lt!331184 () tuple2!18066)

(assert (=> d!71355 (= lt!331184 (readBit!0 (BitStream!8331 (buf!5131 (_2!9682 lt!330834)) (currentByte!9679 thiss!1204) (currentBit!9674 thiss!1204))))))

(assert (=> d!71355 (= (readBitPure!0 (BitStream!8331 (buf!5131 (_2!9682 lt!330834)) (currentByte!9679 thiss!1204) (currentBit!9674 thiss!1204))) (tuple2!18057 (_2!9688 lt!331184) (_1!9688 lt!331184)))))

(declare-fun bs!17517 () Bool)

(assert (= bs!17517 d!71355))

(declare-fun m!324721 () Bool)

(assert (=> bs!17517 m!324721))

(assert (=> b!210673 d!71355))

(declare-fun lt!331185 () tuple2!18068)

(declare-fun d!71357 () Bool)

(assert (=> d!71357 (= lt!331185 (readNBitsLSBFirstsLoop!0 (_1!9684 lt!330812) nBits!348 i!590 lt!330839))))

(assert (=> d!71357 (= (readNBitsLSBFirstsLoopPure!0 (_1!9684 lt!330812) nBits!348 i!590 lt!330839) (tuple2!18061 (_2!9689 lt!331185) (_1!9689 lt!331185)))))

(declare-fun bs!17518 () Bool)

(assert (= bs!17518 d!71357))

(declare-fun m!324723 () Bool)

(assert (=> bs!17518 m!324723))

(assert (=> b!210673 d!71357))

(declare-fun d!71359 () Bool)

(assert (=> d!71359 (= (invariant!0 (currentBit!9674 thiss!1204) (currentByte!9679 thiss!1204) (size!4611 (buf!5131 (_2!9682 lt!330826)))) (and (bvsge (currentBit!9674 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9674 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9679 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9679 thiss!1204) (size!4611 (buf!5131 (_2!9682 lt!330826)))) (and (= (currentBit!9674 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9679 thiss!1204) (size!4611 (buf!5131 (_2!9682 lt!330826))))))))))

(assert (=> b!210673 d!71359))

(declare-fun d!71361 () Bool)

(assert (=> d!71361 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4611 (buf!5131 (_2!9682 lt!330834)))) ((_ sign_extend 32) (currentByte!9679 thiss!1204)) ((_ sign_extend 32) (currentBit!9674 thiss!1204)) lt!330829) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4611 (buf!5131 (_2!9682 lt!330834)))) ((_ sign_extend 32) (currentByte!9679 thiss!1204)) ((_ sign_extend 32) (currentBit!9674 thiss!1204))) lt!330829))))

(declare-fun bs!17519 () Bool)

(assert (= bs!17519 d!71361))

(declare-fun m!324725 () Bool)

(assert (=> bs!17519 m!324725))

(assert (=> b!210673 d!71361))

(declare-fun d!71363 () Bool)

(declare-fun lt!331186 () tuple2!18066)

(assert (=> d!71363 (= lt!331186 (readBit!0 lt!330824))))

(assert (=> d!71363 (= (readBitPure!0 lt!330824) (tuple2!18057 (_2!9688 lt!331186) (_1!9688 lt!331186)))))

(declare-fun bs!17520 () Bool)

(assert (= bs!17520 d!71363))

(declare-fun m!324727 () Bool)

(assert (=> bs!17520 m!324727))

(assert (=> b!210673 d!71363))

(declare-fun d!71365 () Bool)

(declare-fun lt!331187 () tuple2!18066)

(assert (=> d!71365 (= lt!331187 (readBit!0 (_1!9684 lt!330812)))))

(assert (=> d!71365 (= (readBitPure!0 (_1!9684 lt!330812)) (tuple2!18057 (_2!9688 lt!331187) (_1!9688 lt!331187)))))

(declare-fun bs!17521 () Bool)

(assert (= bs!17521 d!71365))

(declare-fun m!324729 () Bool)

(assert (=> bs!17521 m!324729))

(assert (=> b!210673 d!71365))

(declare-fun d!71367 () Bool)

(assert (=> d!71367 (validate_offset_bits!1 ((_ sign_extend 32) (size!4611 (buf!5131 (_2!9682 lt!330834)))) ((_ sign_extend 32) (currentByte!9679 (_2!9682 lt!330826))) ((_ sign_extend 32) (currentBit!9674 (_2!9682 lt!330826))) lt!330836)))

(declare-fun lt!331188 () Unit!15011)

(assert (=> d!71367 (= lt!331188 (choose!9 (_2!9682 lt!330826) (buf!5131 (_2!9682 lt!330834)) lt!330836 (BitStream!8331 (buf!5131 (_2!9682 lt!330834)) (currentByte!9679 (_2!9682 lt!330826)) (currentBit!9674 (_2!9682 lt!330826)))))))

(assert (=> d!71367 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9682 lt!330826) (buf!5131 (_2!9682 lt!330834)) lt!330836) lt!331188)))

(declare-fun bs!17522 () Bool)

(assert (= bs!17522 d!71367))

(assert (=> bs!17522 m!324411))

(declare-fun m!324731 () Bool)

(assert (=> bs!17522 m!324731))

(assert (=> b!210673 d!71367))

(declare-fun d!71369 () Bool)

(assert (=> d!71369 (= (invariant!0 (currentBit!9674 thiss!1204) (currentByte!9679 thiss!1204) (size!4611 (buf!5131 (_2!9682 lt!330834)))) (and (bvsge (currentBit!9674 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9674 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9679 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9679 thiss!1204) (size!4611 (buf!5131 (_2!9682 lt!330834)))) (and (= (currentBit!9674 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9679 thiss!1204) (size!4611 (buf!5131 (_2!9682 lt!330834))))))))))

(assert (=> b!210662 d!71369))

(declare-fun d!71371 () Bool)

(assert (=> d!71371 (= (array_inv!4352 (buf!5131 thiss!1204)) (bvsge (size!4611 (buf!5131 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!210663 d!71371))

(declare-fun d!71373 () Bool)

(declare-fun e!143792 () Bool)

(assert (=> d!71373 e!143792))

(declare-fun res!177016 () Bool)

(assert (=> d!71373 (=> (not res!177016) (not e!143792))))

(declare-fun lt!331190 () (_ BitVec 64))

(declare-fun lt!331193 () (_ BitVec 64))

(declare-fun lt!331189 () (_ BitVec 64))

(assert (=> d!71373 (= res!177016 (= lt!331189 (bvsub lt!331193 lt!331190)))))

(assert (=> d!71373 (or (= (bvand lt!331193 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!331190 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!331193 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!331193 lt!331190) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71373 (= lt!331190 (remainingBits!0 ((_ sign_extend 32) (size!4611 (buf!5131 (_2!9682 lt!330834)))) ((_ sign_extend 32) (currentByte!9679 (_2!9682 lt!330834))) ((_ sign_extend 32) (currentBit!9674 (_2!9682 lt!330834)))))))

(declare-fun lt!331194 () (_ BitVec 64))

(declare-fun lt!331192 () (_ BitVec 64))

(assert (=> d!71373 (= lt!331193 (bvmul lt!331194 lt!331192))))

(assert (=> d!71373 (or (= lt!331194 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!331192 (bvsdiv (bvmul lt!331194 lt!331192) lt!331194)))))

(assert (=> d!71373 (= lt!331192 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71373 (= lt!331194 ((_ sign_extend 32) (size!4611 (buf!5131 (_2!9682 lt!330834)))))))

(assert (=> d!71373 (= lt!331189 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9679 (_2!9682 lt!330834))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9674 (_2!9682 lt!330834)))))))

(assert (=> d!71373 (invariant!0 (currentBit!9674 (_2!9682 lt!330834)) (currentByte!9679 (_2!9682 lt!330834)) (size!4611 (buf!5131 (_2!9682 lt!330834))))))

(assert (=> d!71373 (= (bitIndex!0 (size!4611 (buf!5131 (_2!9682 lt!330834))) (currentByte!9679 (_2!9682 lt!330834)) (currentBit!9674 (_2!9682 lt!330834))) lt!331189)))

(declare-fun b!210811 () Bool)

(declare-fun res!177017 () Bool)

(assert (=> b!210811 (=> (not res!177017) (not e!143792))))

(assert (=> b!210811 (= res!177017 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!331189))))

(declare-fun b!210812 () Bool)

(declare-fun lt!331191 () (_ BitVec 64))

(assert (=> b!210812 (= e!143792 (bvsle lt!331189 (bvmul lt!331191 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!210812 (or (= lt!331191 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!331191 #b0000000000000000000000000000000000000000000000000000000000001000) lt!331191)))))

(assert (=> b!210812 (= lt!331191 ((_ sign_extend 32) (size!4611 (buf!5131 (_2!9682 lt!330834)))))))

(assert (= (and d!71373 res!177016) b!210811))

(assert (= (and b!210811 res!177017) b!210812))

(declare-fun m!324733 () Bool)

(assert (=> d!71373 m!324733))

(assert (=> d!71373 m!324457))

(assert (=> b!210674 d!71373))

(declare-fun d!71375 () Bool)

(declare-fun res!177019 () Bool)

(declare-fun e!143793 () Bool)

(assert (=> d!71375 (=> (not res!177019) (not e!143793))))

(assert (=> d!71375 (= res!177019 (= (size!4611 (buf!5131 thiss!1204)) (size!4611 (buf!5131 (_2!9682 lt!330834)))))))

(assert (=> d!71375 (= (isPrefixOf!0 thiss!1204 (_2!9682 lt!330834)) e!143793)))

(declare-fun b!210813 () Bool)

(declare-fun res!177018 () Bool)

(assert (=> b!210813 (=> (not res!177018) (not e!143793))))

(assert (=> b!210813 (= res!177018 (bvsle (bitIndex!0 (size!4611 (buf!5131 thiss!1204)) (currentByte!9679 thiss!1204) (currentBit!9674 thiss!1204)) (bitIndex!0 (size!4611 (buf!5131 (_2!9682 lt!330834))) (currentByte!9679 (_2!9682 lt!330834)) (currentBit!9674 (_2!9682 lt!330834)))))))

(declare-fun b!210814 () Bool)

(declare-fun e!143794 () Bool)

(assert (=> b!210814 (= e!143793 e!143794)))

(declare-fun res!177020 () Bool)

(assert (=> b!210814 (=> res!177020 e!143794)))

(assert (=> b!210814 (= res!177020 (= (size!4611 (buf!5131 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!210815 () Bool)

(assert (=> b!210815 (= e!143794 (arrayBitRangesEq!0 (buf!5131 thiss!1204) (buf!5131 (_2!9682 lt!330834)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4611 (buf!5131 thiss!1204)) (currentByte!9679 thiss!1204) (currentBit!9674 thiss!1204))))))

(assert (= (and d!71375 res!177019) b!210813))

(assert (= (and b!210813 res!177018) b!210814))

(assert (= (and b!210814 (not res!177020)) b!210815))

(assert (=> b!210813 m!324427))

(assert (=> b!210813 m!324431))

(assert (=> b!210815 m!324427))

(assert (=> b!210815 m!324427))

(declare-fun m!324735 () Bool)

(assert (=> b!210815 m!324735))

(assert (=> b!210674 d!71375))

(declare-fun d!71377 () Bool)

(assert (=> d!71377 (isPrefixOf!0 thiss!1204 (_2!9682 lt!330834))))

(declare-fun lt!331197 () Unit!15011)

(declare-fun choose!30 (BitStream!8330 BitStream!8330 BitStream!8330) Unit!15011)

(assert (=> d!71377 (= lt!331197 (choose!30 thiss!1204 (_2!9682 lt!330826) (_2!9682 lt!330834)))))

(assert (=> d!71377 (isPrefixOf!0 thiss!1204 (_2!9682 lt!330826))))

(assert (=> d!71377 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9682 lt!330826) (_2!9682 lt!330834)) lt!331197)))

(declare-fun bs!17523 () Bool)

(assert (= bs!17523 d!71377))

(assert (=> bs!17523 m!324433))

(declare-fun m!324737 () Bool)

(assert (=> bs!17523 m!324737))

(assert (=> bs!17523 m!324391))

(assert (=> b!210674 d!71377))

(declare-fun b!210916 () Bool)

(declare-fun res!177113 () Bool)

(declare-fun lt!331516 () tuple2!18054)

(assert (=> b!210916 (= res!177113 (= (bitIndex!0 (size!4611 (buf!5131 (_2!9682 lt!331516))) (currentByte!9679 (_2!9682 lt!331516)) (currentBit!9674 (_2!9682 lt!331516))) (bvadd (bitIndex!0 (size!4611 (buf!5131 (_2!9682 lt!330826))) (currentByte!9679 (_2!9682 lt!330826)) (currentBit!9674 (_2!9682 lt!330826))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!143858 () Bool)

(assert (=> b!210916 (=> (not res!177113) (not e!143858))))

(declare-fun b!210917 () Bool)

(declare-fun res!177106 () Bool)

(declare-fun e!143853 () Bool)

(assert (=> b!210917 (=> (not res!177106) (not e!143853))))

(declare-fun lt!331545 () tuple2!18054)

(assert (=> b!210917 (= res!177106 (= (size!4611 (buf!5131 (_2!9682 lt!330826))) (size!4611 (buf!5131 (_2!9682 lt!331545)))))))

(declare-fun b!210918 () Bool)

(declare-fun res!177107 () Bool)

(declare-fun call!3321 () Bool)

(assert (=> b!210918 (= res!177107 call!3321)))

(assert (=> b!210918 (=> (not res!177107) (not e!143858))))

(declare-fun b!210919 () Bool)

(declare-fun e!143855 () Bool)

(declare-fun lt!331539 () tuple2!18060)

(declare-fun lt!331525 () tuple2!18058)

(assert (=> b!210919 (= e!143855 (= (_1!9685 lt!331539) (_2!9684 lt!331525)))))

(declare-fun d!71379 () Bool)

(assert (=> d!71379 e!143853))

(declare-fun res!177111 () Bool)

(assert (=> d!71379 (=> (not res!177111) (not e!143853))))

(assert (=> d!71379 (= res!177111 (invariant!0 (currentBit!9674 (_2!9682 lt!331545)) (currentByte!9679 (_2!9682 lt!331545)) (size!4611 (buf!5131 (_2!9682 lt!331545)))))))

(declare-fun e!143857 () tuple2!18054)

(assert (=> d!71379 (= lt!331545 e!143857)))

(declare-fun c!10378 () Bool)

(assert (=> d!71379 (= c!10378 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!71379 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!71379 (= (appendBitsLSBFirstLoopTR!0 (_2!9682 lt!330826) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!331545)))

(declare-fun b!210920 () Bool)

(declare-fun e!143860 () (_ BitVec 64))

(assert (=> b!210920 (= e!143860 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!210921 () Bool)

(declare-fun Unit!15028 () Unit!15011)

(assert (=> b!210921 (= e!143857 (tuple2!18055 Unit!15028 (_2!9682 lt!330826)))))

(declare-fun lt!331552 () Unit!15011)

(assert (=> b!210921 (= lt!331552 (lemmaIsPrefixRefl!0 (_2!9682 lt!330826)))))

(assert (=> b!210921 call!3321))

(declare-fun lt!331540 () Unit!15011)

(assert (=> b!210921 (= lt!331540 lt!331552)))

(declare-fun bm!3318 () Bool)

(assert (=> bm!3318 (= call!3321 (isPrefixOf!0 (_2!9682 lt!330826) (ite c!10378 (_2!9682 lt!330826) (_2!9682 lt!331516))))))

(declare-fun b!210922 () Bool)

(declare-fun e!143859 () Bool)

(assert (=> b!210922 (= e!143853 e!143859)))

(declare-fun res!177103 () Bool)

(assert (=> b!210922 (=> (not res!177103) (not e!143859))))

(declare-fun lt!331551 () tuple2!18060)

(assert (=> b!210922 (= res!177103 (= (_2!9685 lt!331551) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!331531 () tuple2!18058)

(assert (=> b!210922 (= lt!331551 (readNBitsLSBFirstsLoopPure!0 (_1!9684 lt!331531) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!331518 () Unit!15011)

(declare-fun lt!331547 () Unit!15011)

(assert (=> b!210922 (= lt!331518 lt!331547)))

(declare-fun lt!331557 () (_ BitVec 64))

(assert (=> b!210922 (validate_offset_bits!1 ((_ sign_extend 32) (size!4611 (buf!5131 (_2!9682 lt!331545)))) ((_ sign_extend 32) (currentByte!9679 (_2!9682 lt!330826))) ((_ sign_extend 32) (currentBit!9674 (_2!9682 lt!330826))) lt!331557)))

(assert (=> b!210922 (= lt!331547 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9682 lt!330826) (buf!5131 (_2!9682 lt!331545)) lt!331557))))

(declare-fun e!143854 () Bool)

(assert (=> b!210922 e!143854))

(declare-fun res!177110 () Bool)

(assert (=> b!210922 (=> (not res!177110) (not e!143854))))

(assert (=> b!210922 (= res!177110 (and (= (size!4611 (buf!5131 (_2!9682 lt!330826))) (size!4611 (buf!5131 (_2!9682 lt!331545)))) (bvsge lt!331557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210922 (= lt!331557 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!210922 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!210922 (= lt!331531 (reader!0 (_2!9682 lt!330826) (_2!9682 lt!331545)))))

(declare-fun b!210923 () Bool)

(declare-fun e!143861 () Bool)

(declare-fun lt!331560 () tuple2!18056)

(declare-fun lt!331532 () tuple2!18056)

(assert (=> b!210923 (= e!143861 (= (_2!9683 lt!331560) (_2!9683 lt!331532)))))

(declare-fun b!210924 () Bool)

(declare-fun res!177102 () Bool)

(assert (=> b!210924 (=> (not res!177102) (not e!143853))))

(assert (=> b!210924 (= res!177102 (isPrefixOf!0 (_2!9682 lt!330826) (_2!9682 lt!331545)))))

(declare-fun b!210925 () Bool)

(assert (=> b!210925 (= e!143854 (validate_offset_bits!1 ((_ sign_extend 32) (size!4611 (buf!5131 (_2!9682 lt!330826)))) ((_ sign_extend 32) (currentByte!9679 (_2!9682 lt!330826))) ((_ sign_extend 32) (currentBit!9674 (_2!9682 lt!330826))) lt!331557))))

(declare-fun b!210926 () Bool)

(assert (=> b!210926 (= e!143860 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!210927 () Bool)

(assert (=> b!210927 (= e!143859 (= (_1!9685 lt!331551) (_2!9684 lt!331531)))))

(declare-fun b!210928 () Bool)

(declare-fun res!177112 () Bool)

(assert (=> b!210928 (=> (not res!177112) (not e!143853))))

(declare-fun lt!331521 () (_ BitVec 64))

(declare-fun lt!331546 () (_ BitVec 64))

(assert (=> b!210928 (= res!177112 (= (bitIndex!0 (size!4611 (buf!5131 (_2!9682 lt!331545))) (currentByte!9679 (_2!9682 lt!331545)) (currentBit!9674 (_2!9682 lt!331545))) (bvsub lt!331546 lt!331521)))))

(assert (=> b!210928 (or (= (bvand lt!331546 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!331521 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!331546 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!331546 lt!331521) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210928 (= lt!331521 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!331515 () (_ BitVec 64))

(declare-fun lt!331541 () (_ BitVec 64))

(assert (=> b!210928 (= lt!331546 (bvadd lt!331515 lt!331541))))

(assert (=> b!210928 (or (not (= (bvand lt!331515 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!331541 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!331515 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!331515 lt!331541) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210928 (= lt!331541 ((_ sign_extend 32) nBits!348))))

(assert (=> b!210928 (= lt!331515 (bitIndex!0 (size!4611 (buf!5131 (_2!9682 lt!330826))) (currentByte!9679 (_2!9682 lt!330826)) (currentBit!9674 (_2!9682 lt!330826))))))

(declare-fun b!210929 () Bool)

(declare-fun lt!331543 () tuple2!18054)

(assert (=> b!210929 (= e!143857 (tuple2!18055 (_1!9682 lt!331543) (_2!9682 lt!331543)))))

(declare-fun lt!331549 () Bool)

(assert (=> b!210929 (= lt!331549 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210929 (= lt!331516 (appendBit!0 (_2!9682 lt!330826) lt!331549))))

(declare-fun res!177105 () Bool)

(assert (=> b!210929 (= res!177105 (= (size!4611 (buf!5131 (_2!9682 lt!330826))) (size!4611 (buf!5131 (_2!9682 lt!331516)))))))

(assert (=> b!210929 (=> (not res!177105) (not e!143858))))

(assert (=> b!210929 e!143858))

(declare-fun lt!331514 () tuple2!18054)

(assert (=> b!210929 (= lt!331514 lt!331516)))

(assert (=> b!210929 (= lt!331543 (appendBitsLSBFirstLoopTR!0 (_2!9682 lt!331514) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!331555 () Unit!15011)

(assert (=> b!210929 (= lt!331555 (lemmaIsPrefixTransitive!0 (_2!9682 lt!330826) (_2!9682 lt!331514) (_2!9682 lt!331543)))))

(assert (=> b!210929 (isPrefixOf!0 (_2!9682 lt!330826) (_2!9682 lt!331543))))

(declare-fun lt!331523 () Unit!15011)

(assert (=> b!210929 (= lt!331523 lt!331555)))

(assert (=> b!210929 (invariant!0 (currentBit!9674 (_2!9682 lt!330826)) (currentByte!9679 (_2!9682 lt!330826)) (size!4611 (buf!5131 (_2!9682 lt!331514))))))

(declare-fun lt!331524 () BitStream!8330)

(assert (=> b!210929 (= lt!331524 (BitStream!8331 (buf!5131 (_2!9682 lt!331514)) (currentByte!9679 (_2!9682 lt!330826)) (currentBit!9674 (_2!9682 lt!330826))))))

(assert (=> b!210929 (invariant!0 (currentBit!9674 lt!331524) (currentByte!9679 lt!331524) (size!4611 (buf!5131 (_2!9682 lt!331543))))))

(declare-fun lt!331537 () BitStream!8330)

(assert (=> b!210929 (= lt!331537 (BitStream!8331 (buf!5131 (_2!9682 lt!331543)) (currentByte!9679 lt!331524) (currentBit!9674 lt!331524)))))

(assert (=> b!210929 (= lt!331560 (readBitPure!0 lt!331524))))

(assert (=> b!210929 (= lt!331532 (readBitPure!0 lt!331537))))

(declare-fun lt!331520 () Unit!15011)

(assert (=> b!210929 (= lt!331520 (readBitPrefixLemma!0 lt!331524 (_2!9682 lt!331543)))))

(declare-fun res!177108 () Bool)

(assert (=> b!210929 (= res!177108 (= (bitIndex!0 (size!4611 (buf!5131 (_1!9683 lt!331560))) (currentByte!9679 (_1!9683 lt!331560)) (currentBit!9674 (_1!9683 lt!331560))) (bitIndex!0 (size!4611 (buf!5131 (_1!9683 lt!331532))) (currentByte!9679 (_1!9683 lt!331532)) (currentBit!9674 (_1!9683 lt!331532)))))))

(assert (=> b!210929 (=> (not res!177108) (not e!143861))))

(assert (=> b!210929 e!143861))

(declare-fun lt!331556 () Unit!15011)

(assert (=> b!210929 (= lt!331556 lt!331520)))

(declare-fun lt!331522 () tuple2!18058)

(assert (=> b!210929 (= lt!331522 (reader!0 (_2!9682 lt!330826) (_2!9682 lt!331543)))))

(declare-fun lt!331538 () tuple2!18058)

(assert (=> b!210929 (= lt!331538 (reader!0 (_2!9682 lt!331514) (_2!9682 lt!331543)))))

(declare-fun lt!331519 () tuple2!18056)

(assert (=> b!210929 (= lt!331519 (readBitPure!0 (_1!9684 lt!331522)))))

(assert (=> b!210929 (= (_2!9683 lt!331519) lt!331549)))

(declare-fun lt!331561 () Unit!15011)

(declare-fun Unit!15029 () Unit!15011)

(assert (=> b!210929 (= lt!331561 Unit!15029)))

(declare-fun lt!331536 () (_ BitVec 64))

(assert (=> b!210929 (= lt!331536 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!331535 () (_ BitVec 64))

(assert (=> b!210929 (= lt!331535 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!331529 () Unit!15011)

(assert (=> b!210929 (= lt!331529 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9682 lt!330826) (buf!5131 (_2!9682 lt!331543)) lt!331535))))

(assert (=> b!210929 (validate_offset_bits!1 ((_ sign_extend 32) (size!4611 (buf!5131 (_2!9682 lt!331543)))) ((_ sign_extend 32) (currentByte!9679 (_2!9682 lt!330826))) ((_ sign_extend 32) (currentBit!9674 (_2!9682 lt!330826))) lt!331535)))

(declare-fun lt!331544 () Unit!15011)

(assert (=> b!210929 (= lt!331544 lt!331529)))

(declare-fun lt!331530 () tuple2!18060)

(assert (=> b!210929 (= lt!331530 (readNBitsLSBFirstsLoopPure!0 (_1!9684 lt!331522) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!331536))))

(declare-fun lt!331512 () (_ BitVec 64))

(assert (=> b!210929 (= lt!331512 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!331506 () Unit!15011)

(assert (=> b!210929 (= lt!331506 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9682 lt!331514) (buf!5131 (_2!9682 lt!331543)) lt!331512))))

(assert (=> b!210929 (validate_offset_bits!1 ((_ sign_extend 32) (size!4611 (buf!5131 (_2!9682 lt!331543)))) ((_ sign_extend 32) (currentByte!9679 (_2!9682 lt!331514))) ((_ sign_extend 32) (currentBit!9674 (_2!9682 lt!331514))) lt!331512)))

(declare-fun lt!331548 () Unit!15011)

(assert (=> b!210929 (= lt!331548 lt!331506)))

(declare-fun lt!331510 () tuple2!18060)

(assert (=> b!210929 (= lt!331510 (readNBitsLSBFirstsLoopPure!0 (_1!9684 lt!331538) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!331536 (ite (_2!9683 lt!331519) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!331534 () tuple2!18060)

(assert (=> b!210929 (= lt!331534 (readNBitsLSBFirstsLoopPure!0 (_1!9684 lt!331522) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!331536))))

(declare-fun c!10377 () Bool)

(assert (=> b!210929 (= c!10377 (_2!9683 (readBitPure!0 (_1!9684 lt!331522))))))

(declare-fun lt!331508 () tuple2!18060)

(assert (=> b!210929 (= lt!331508 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9684 lt!331522) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!331536 e!143860)))))

(declare-fun lt!331509 () Unit!15011)

(assert (=> b!210929 (= lt!331509 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9684 lt!331522) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!331536))))

(assert (=> b!210929 (and (= (_2!9685 lt!331534) (_2!9685 lt!331508)) (= (_1!9685 lt!331534) (_1!9685 lt!331508)))))

(declare-fun lt!331558 () Unit!15011)

(assert (=> b!210929 (= lt!331558 lt!331509)))

(assert (=> b!210929 (= (_1!9684 lt!331522) (withMovedBitIndex!0 (_2!9684 lt!331522) (bvsub (bitIndex!0 (size!4611 (buf!5131 (_2!9682 lt!330826))) (currentByte!9679 (_2!9682 lt!330826)) (currentBit!9674 (_2!9682 lt!330826))) (bitIndex!0 (size!4611 (buf!5131 (_2!9682 lt!331543))) (currentByte!9679 (_2!9682 lt!331543)) (currentBit!9674 (_2!9682 lt!331543))))))))

(declare-fun lt!331517 () Unit!15011)

(declare-fun Unit!15030 () Unit!15011)

(assert (=> b!210929 (= lt!331517 Unit!15030)))

(assert (=> b!210929 (= (_1!9684 lt!331538) (withMovedBitIndex!0 (_2!9684 lt!331538) (bvsub (bitIndex!0 (size!4611 (buf!5131 (_2!9682 lt!331514))) (currentByte!9679 (_2!9682 lt!331514)) (currentBit!9674 (_2!9682 lt!331514))) (bitIndex!0 (size!4611 (buf!5131 (_2!9682 lt!331543))) (currentByte!9679 (_2!9682 lt!331543)) (currentBit!9674 (_2!9682 lt!331543))))))))

(declare-fun lt!331550 () Unit!15011)

(declare-fun Unit!15031 () Unit!15011)

(assert (=> b!210929 (= lt!331550 Unit!15031)))

(assert (=> b!210929 (= (bitIndex!0 (size!4611 (buf!5131 (_2!9682 lt!330826))) (currentByte!9679 (_2!9682 lt!330826)) (currentBit!9674 (_2!9682 lt!330826))) (bvsub (bitIndex!0 (size!4611 (buf!5131 (_2!9682 lt!331514))) (currentByte!9679 (_2!9682 lt!331514)) (currentBit!9674 (_2!9682 lt!331514))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!331526 () Unit!15011)

(declare-fun Unit!15032 () Unit!15011)

(assert (=> b!210929 (= lt!331526 Unit!15032)))

(assert (=> b!210929 (= (_2!9685 lt!331530) (_2!9685 lt!331510))))

(declare-fun lt!331559 () Unit!15011)

(declare-fun Unit!15033 () Unit!15011)

(assert (=> b!210929 (= lt!331559 Unit!15033)))

(assert (=> b!210929 (invariant!0 (currentBit!9674 (_2!9682 lt!331543)) (currentByte!9679 (_2!9682 lt!331543)) (size!4611 (buf!5131 (_2!9682 lt!331543))))))

(declare-fun lt!331511 () Unit!15011)

(declare-fun Unit!15034 () Unit!15011)

(assert (=> b!210929 (= lt!331511 Unit!15034)))

(assert (=> b!210929 (= (size!4611 (buf!5131 (_2!9682 lt!330826))) (size!4611 (buf!5131 (_2!9682 lt!331543))))))

(declare-fun lt!331528 () Unit!15011)

(declare-fun Unit!15035 () Unit!15011)

(assert (=> b!210929 (= lt!331528 Unit!15035)))

(assert (=> b!210929 (= (bitIndex!0 (size!4611 (buf!5131 (_2!9682 lt!331543))) (currentByte!9679 (_2!9682 lt!331543)) (currentBit!9674 (_2!9682 lt!331543))) (bvsub (bvadd (bitIndex!0 (size!4611 (buf!5131 (_2!9682 lt!330826))) (currentByte!9679 (_2!9682 lt!330826)) (currentBit!9674 (_2!9682 lt!330826))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!331527 () Unit!15011)

(declare-fun Unit!15036 () Unit!15011)

(assert (=> b!210929 (= lt!331527 Unit!15036)))

(declare-fun lt!331542 () Unit!15011)

(declare-fun Unit!15037 () Unit!15011)

(assert (=> b!210929 (= lt!331542 Unit!15037)))

(assert (=> b!210929 (= lt!331525 (reader!0 (_2!9682 lt!330826) (_2!9682 lt!331543)))))

(declare-fun lt!331533 () (_ BitVec 64))

(assert (=> b!210929 (= lt!331533 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!331507 () Unit!15011)

(assert (=> b!210929 (= lt!331507 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9682 lt!330826) (buf!5131 (_2!9682 lt!331543)) lt!331533))))

(assert (=> b!210929 (validate_offset_bits!1 ((_ sign_extend 32) (size!4611 (buf!5131 (_2!9682 lt!331543)))) ((_ sign_extend 32) (currentByte!9679 (_2!9682 lt!330826))) ((_ sign_extend 32) (currentBit!9674 (_2!9682 lt!330826))) lt!331533)))

(declare-fun lt!331513 () Unit!15011)

(assert (=> b!210929 (= lt!331513 lt!331507)))

(assert (=> b!210929 (= lt!331539 (readNBitsLSBFirstsLoopPure!0 (_1!9684 lt!331525) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!177109 () Bool)

(assert (=> b!210929 (= res!177109 (= (_2!9685 lt!331539) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!210929 (=> (not res!177109) (not e!143855))))

(assert (=> b!210929 e!143855))

(declare-fun lt!331554 () Unit!15011)

(declare-fun Unit!15038 () Unit!15011)

(assert (=> b!210929 (= lt!331554 Unit!15038)))

(declare-fun b!210930 () Bool)

(declare-fun e!143856 () Bool)

(declare-fun lt!331553 () tuple2!18056)

(assert (=> b!210930 (= e!143856 (= (bitIndex!0 (size!4611 (buf!5131 (_1!9683 lt!331553))) (currentByte!9679 (_1!9683 lt!331553)) (currentBit!9674 (_1!9683 lt!331553))) (bitIndex!0 (size!4611 (buf!5131 (_2!9682 lt!331516))) (currentByte!9679 (_2!9682 lt!331516)) (currentBit!9674 (_2!9682 lt!331516)))))))

(declare-fun b!210931 () Bool)

(assert (=> b!210931 (= lt!331553 (readBitPure!0 (readerFrom!0 (_2!9682 lt!331516) (currentBit!9674 (_2!9682 lt!330826)) (currentByte!9679 (_2!9682 lt!330826)))))))

(declare-fun res!177104 () Bool)

(assert (=> b!210931 (= res!177104 (and (= (_2!9683 lt!331553) lt!331549) (= (_1!9683 lt!331553) (_2!9682 lt!331516))))))

(assert (=> b!210931 (=> (not res!177104) (not e!143856))))

(assert (=> b!210931 (= e!143858 e!143856)))

(assert (= (and d!71379 c!10378) b!210921))

(assert (= (and d!71379 (not c!10378)) b!210929))

(assert (= (and b!210929 res!177105) b!210916))

(assert (= (and b!210916 res!177113) b!210918))

(assert (= (and b!210918 res!177107) b!210931))

(assert (= (and b!210931 res!177104) b!210930))

(assert (= (and b!210929 res!177108) b!210923))

(assert (= (and b!210929 c!10377) b!210926))

(assert (= (and b!210929 (not c!10377)) b!210920))

(assert (= (and b!210929 res!177109) b!210919))

(assert (= (or b!210921 b!210918) bm!3318))

(assert (= (and d!71379 res!177111) b!210917))

(assert (= (and b!210917 res!177106) b!210928))

(assert (= (and b!210928 res!177112) b!210924))

(assert (= (and b!210924 res!177102) b!210922))

(assert (= (and b!210922 res!177110) b!210925))

(assert (= (and b!210922 res!177103) b!210927))

(declare-fun m!324843 () Bool)

(assert (=> b!210916 m!324843))

(assert (=> b!210916 m!324425))

(declare-fun m!324845 () Bool)

(assert (=> b!210931 m!324845))

(assert (=> b!210931 m!324845))

(declare-fun m!324847 () Bool)

(assert (=> b!210931 m!324847))

(declare-fun m!324849 () Bool)

(assert (=> bm!3318 m!324849))

(declare-fun m!324851 () Bool)

(assert (=> b!210929 m!324851))

(declare-fun m!324853 () Bool)

(assert (=> b!210929 m!324853))

(declare-fun m!324855 () Bool)

(assert (=> b!210929 m!324855))

(declare-fun m!324857 () Bool)

(assert (=> b!210929 m!324857))

(assert (=> b!210929 m!324425))

(declare-fun m!324859 () Bool)

(assert (=> b!210929 m!324859))

(declare-fun m!324861 () Bool)

(assert (=> b!210929 m!324861))

(declare-fun m!324863 () Bool)

(assert (=> b!210929 m!324863))

(declare-fun m!324865 () Bool)

(assert (=> b!210929 m!324865))

(declare-fun m!324867 () Bool)

(assert (=> b!210929 m!324867))

(declare-fun m!324869 () Bool)

(assert (=> b!210929 m!324869))

(declare-fun m!324871 () Bool)

(assert (=> b!210929 m!324871))

(assert (=> b!210929 m!324865))

(declare-fun m!324873 () Bool)

(assert (=> b!210929 m!324873))

(declare-fun m!324875 () Bool)

(assert (=> b!210929 m!324875))

(declare-fun m!324877 () Bool)

(assert (=> b!210929 m!324877))

(declare-fun m!324879 () Bool)

(assert (=> b!210929 m!324879))

(declare-fun m!324881 () Bool)

(assert (=> b!210929 m!324881))

(declare-fun m!324883 () Bool)

(assert (=> b!210929 m!324883))

(declare-fun m!324885 () Bool)

(assert (=> b!210929 m!324885))

(declare-fun m!324887 () Bool)

(assert (=> b!210929 m!324887))

(declare-fun m!324889 () Bool)

(assert (=> b!210929 m!324889))

(declare-fun m!324891 () Bool)

(assert (=> b!210929 m!324891))

(declare-fun m!324893 () Bool)

(assert (=> b!210929 m!324893))

(declare-fun m!324895 () Bool)

(assert (=> b!210929 m!324895))

(declare-fun m!324897 () Bool)

(assert (=> b!210929 m!324897))

(declare-fun m!324899 () Bool)

(assert (=> b!210929 m!324899))

(declare-fun m!324901 () Bool)

(assert (=> b!210929 m!324901))

(declare-fun m!324903 () Bool)

(assert (=> b!210929 m!324903))

(declare-fun m!324905 () Bool)

(assert (=> b!210929 m!324905))

(declare-fun m!324907 () Bool)

(assert (=> b!210929 m!324907))

(declare-fun m!324909 () Bool)

(assert (=> b!210929 m!324909))

(declare-fun m!324911 () Bool)

(assert (=> b!210929 m!324911))

(declare-fun m!324913 () Bool)

(assert (=> b!210929 m!324913))

(declare-fun m!324915 () Bool)

(assert (=> b!210929 m!324915))

(declare-fun m!324917 () Bool)

(assert (=> b!210930 m!324917))

(assert (=> b!210930 m!324843))

(assert (=> b!210921 m!324705))

(declare-fun m!324919 () Bool)

(assert (=> b!210924 m!324919))

(declare-fun m!324921 () Bool)

(assert (=> d!71379 m!324921))

(declare-fun m!324923 () Bool)

(assert (=> b!210925 m!324923))

(declare-fun m!324925 () Bool)

(assert (=> b!210922 m!324925))

(declare-fun m!324927 () Bool)

(assert (=> b!210922 m!324927))

(assert (=> b!210922 m!324893))

(declare-fun m!324929 () Bool)

(assert (=> b!210922 m!324929))

(declare-fun m!324931 () Bool)

(assert (=> b!210922 m!324931))

(assert (=> b!210922 m!324911))

(declare-fun m!324933 () Bool)

(assert (=> b!210928 m!324933))

(assert (=> b!210928 m!324425))

(assert (=> b!210674 d!71379))

(declare-fun d!71401 () Bool)

(declare-fun res!177115 () Bool)

(declare-fun e!143862 () Bool)

(assert (=> d!71401 (=> (not res!177115) (not e!143862))))

(assert (=> d!71401 (= res!177115 (= (size!4611 (buf!5131 thiss!1204)) (size!4611 (buf!5131 (_2!9682 lt!330826)))))))

(assert (=> d!71401 (= (isPrefixOf!0 thiss!1204 (_2!9682 lt!330826)) e!143862)))

(declare-fun b!210932 () Bool)

(declare-fun res!177114 () Bool)

(assert (=> b!210932 (=> (not res!177114) (not e!143862))))

(assert (=> b!210932 (= res!177114 (bvsle (bitIndex!0 (size!4611 (buf!5131 thiss!1204)) (currentByte!9679 thiss!1204) (currentBit!9674 thiss!1204)) (bitIndex!0 (size!4611 (buf!5131 (_2!9682 lt!330826))) (currentByte!9679 (_2!9682 lt!330826)) (currentBit!9674 (_2!9682 lt!330826)))))))

(declare-fun b!210933 () Bool)

(declare-fun e!143863 () Bool)

(assert (=> b!210933 (= e!143862 e!143863)))

(declare-fun res!177116 () Bool)

(assert (=> b!210933 (=> res!177116 e!143863)))

(assert (=> b!210933 (= res!177116 (= (size!4611 (buf!5131 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!210934 () Bool)

(assert (=> b!210934 (= e!143863 (arrayBitRangesEq!0 (buf!5131 thiss!1204) (buf!5131 (_2!9682 lt!330826)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4611 (buf!5131 thiss!1204)) (currentByte!9679 thiss!1204) (currentBit!9674 thiss!1204))))))

(assert (= (and d!71401 res!177115) b!210932))

(assert (= (and b!210932 res!177114) b!210933))

(assert (= (and b!210933 (not res!177116)) b!210934))

(assert (=> b!210932 m!324427))

(assert (=> b!210932 m!324425))

(assert (=> b!210934 m!324427))

(assert (=> b!210934 m!324427))

(declare-fun m!324935 () Bool)

(assert (=> b!210934 m!324935))

(assert (=> b!210664 d!71401))

(assert (=> b!210665 d!71273))

(assert (=> b!210665 d!71275))

(declare-fun d!71403 () Bool)

(declare-fun lt!331578 () tuple2!18060)

(declare-fun lt!331575 () tuple2!18060)

(assert (=> d!71403 (and (= (_2!9685 lt!331578) (_2!9685 lt!331575)) (= (_1!9685 lt!331578) (_1!9685 lt!331575)))))

(declare-fun lt!331577 () Unit!15011)

(declare-fun lt!331574 () Bool)

(declare-fun lt!331579 () BitStream!8330)

(declare-fun lt!331576 () (_ BitVec 64))

(declare-fun choose!56 (BitStream!8330 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!18060 tuple2!18060 BitStream!8330 (_ BitVec 64) Bool BitStream!8330 (_ BitVec 64) tuple2!18060 tuple2!18060 BitStream!8330 (_ BitVec 64)) Unit!15011)

(assert (=> d!71403 (= lt!331577 (choose!56 (_1!9684 lt!330812) nBits!348 i!590 lt!330839 lt!331578 (tuple2!18061 (_1!9685 lt!331578) (_2!9685 lt!331578)) (_1!9685 lt!331578) (_2!9685 lt!331578) lt!331574 lt!331579 lt!331576 lt!331575 (tuple2!18061 (_1!9685 lt!331575) (_2!9685 lt!331575)) (_1!9685 lt!331575) (_2!9685 lt!331575)))))

(assert (=> d!71403 (= lt!331575 (readNBitsLSBFirstsLoopPure!0 lt!331579 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!331576))))

(assert (=> d!71403 (= lt!331576 (bvor lt!330839 (ite lt!331574 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71403 (= lt!331579 (withMovedBitIndex!0 (_1!9684 lt!330812) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!71403 (= lt!331574 (_2!9683 (readBitPure!0 (_1!9684 lt!330812))))))

(assert (=> d!71403 (= lt!331578 (readNBitsLSBFirstsLoopPure!0 (_1!9684 lt!330812) nBits!348 i!590 lt!330839))))

(assert (=> d!71403 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9684 lt!330812) nBits!348 i!590 lt!330839) lt!331577)))

(declare-fun bs!17528 () Bool)

(assert (= bs!17528 d!71403))

(declare-fun m!324937 () Bool)

(assert (=> bs!17528 m!324937))

(assert (=> bs!17528 m!324461))

(declare-fun m!324939 () Bool)

(assert (=> bs!17528 m!324939))

(assert (=> bs!17528 m!324405))

(assert (=> bs!17528 m!324409))

(assert (=> b!210677 d!71403))

(declare-fun lt!331580 () tuple2!18068)

(declare-fun d!71405 () Bool)

(assert (=> d!71405 (= lt!331580 (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 (_1!9684 lt!330812) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!330819))))

(assert (=> d!71405 (= (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9684 lt!330812) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!330819) (tuple2!18061 (_2!9689 lt!331580) (_1!9689 lt!331580)))))

(declare-fun bs!17529 () Bool)

(assert (= bs!17529 d!71405))

(assert (=> bs!17529 m!324461))

(declare-fun m!324941 () Bool)

(assert (=> bs!17529 m!324941))

(assert (=> b!210677 d!71405))

(declare-fun d!71407 () Bool)

(declare-fun e!143864 () Bool)

(assert (=> d!71407 e!143864))

(declare-fun res!177117 () Bool)

(assert (=> d!71407 (=> (not res!177117) (not e!143864))))

(declare-fun lt!331582 () (_ BitVec 64))

(declare-fun lt!331581 () BitStream!8330)

(assert (=> d!71407 (= res!177117 (= (bvadd lt!331582 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4611 (buf!5131 lt!331581)) (currentByte!9679 lt!331581) (currentBit!9674 lt!331581))))))

(assert (=> d!71407 (or (not (= (bvand lt!331582 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!331582 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!331582 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71407 (= lt!331582 (bitIndex!0 (size!4611 (buf!5131 (_1!9684 lt!330812))) (currentByte!9679 (_1!9684 lt!330812)) (currentBit!9674 (_1!9684 lt!330812))))))

(assert (=> d!71407 (= lt!331581 (_2!9682 (moveBitIndex!0 (_1!9684 lt!330812) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!71407 (moveBitIndexPrecond!0 (_1!9684 lt!330812) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!71407 (= (withMovedBitIndex!0 (_1!9684 lt!330812) #b0000000000000000000000000000000000000000000000000000000000000001) lt!331581)))

(declare-fun b!210935 () Bool)

(assert (=> b!210935 (= e!143864 (= (size!4611 (buf!5131 (_1!9684 lt!330812))) (size!4611 (buf!5131 lt!331581))))))

(assert (= (and d!71407 res!177117) b!210935))

(declare-fun m!324943 () Bool)

(assert (=> d!71407 m!324943))

(declare-fun m!324945 () Bool)

(assert (=> d!71407 m!324945))

(declare-fun m!324947 () Bool)

(assert (=> d!71407 m!324947))

(declare-fun m!324949 () Bool)

(assert (=> d!71407 m!324949))

(assert (=> b!210677 d!71407))

(declare-fun d!71409 () Bool)

(assert (=> d!71409 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4611 (buf!5131 thiss!1204))) ((_ sign_extend 32) (currentByte!9679 thiss!1204)) ((_ sign_extend 32) (currentBit!9674 thiss!1204)) lt!330829) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4611 (buf!5131 thiss!1204))) ((_ sign_extend 32) (currentByte!9679 thiss!1204)) ((_ sign_extend 32) (currentBit!9674 thiss!1204))) lt!330829))))

(declare-fun bs!17530 () Bool)

(assert (= bs!17530 d!71409))

(assert (=> bs!17530 m!324499))

(assert (=> b!210666 d!71409))

(assert (=> b!210667 d!71401))

(declare-fun d!71411 () Bool)

(assert (=> d!71411 (= (invariant!0 (currentBit!9674 thiss!1204) (currentByte!9679 thiss!1204) (size!4611 (buf!5131 thiss!1204))) (and (bvsge (currentBit!9674 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9674 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9679 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9679 thiss!1204) (size!4611 (buf!5131 thiss!1204))) (and (= (currentBit!9674 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9679 thiss!1204) (size!4611 (buf!5131 thiss!1204)))))))))

(assert (=> b!210678 d!71411))

(declare-fun d!71413 () Bool)

(declare-fun e!143865 () Bool)

(assert (=> d!71413 e!143865))

(declare-fun res!177118 () Bool)

(assert (=> d!71413 (=> (not res!177118) (not e!143865))))

(declare-fun lt!331587 () (_ BitVec 64))

(declare-fun lt!331583 () (_ BitVec 64))

(declare-fun lt!331584 () (_ BitVec 64))

(assert (=> d!71413 (= res!177118 (= lt!331583 (bvsub lt!331587 lt!331584)))))

(assert (=> d!71413 (or (= (bvand lt!331587 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!331584 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!331587 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!331587 lt!331584) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!71413 (= lt!331584 (remainingBits!0 ((_ sign_extend 32) (size!4611 (buf!5131 (_1!9683 lt!330828)))) ((_ sign_extend 32) (currentByte!9679 (_1!9683 lt!330828))) ((_ sign_extend 32) (currentBit!9674 (_1!9683 lt!330828)))))))

(declare-fun lt!331588 () (_ BitVec 64))

(declare-fun lt!331586 () (_ BitVec 64))

(assert (=> d!71413 (= lt!331587 (bvmul lt!331588 lt!331586))))

(assert (=> d!71413 (or (= lt!331588 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!331586 (bvsdiv (bvmul lt!331588 lt!331586) lt!331588)))))

(assert (=> d!71413 (= lt!331586 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!71413 (= lt!331588 ((_ sign_extend 32) (size!4611 (buf!5131 (_1!9683 lt!330828)))))))

(assert (=> d!71413 (= lt!331583 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9679 (_1!9683 lt!330828))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9674 (_1!9683 lt!330828)))))))

(assert (=> d!71413 (invariant!0 (currentBit!9674 (_1!9683 lt!330828)) (currentByte!9679 (_1!9683 lt!330828)) (size!4611 (buf!5131 (_1!9683 lt!330828))))))

(assert (=> d!71413 (= (bitIndex!0 (size!4611 (buf!5131 (_1!9683 lt!330828))) (currentByte!9679 (_1!9683 lt!330828)) (currentBit!9674 (_1!9683 lt!330828))) lt!331583)))

(declare-fun b!210936 () Bool)

(declare-fun res!177119 () Bool)

(assert (=> b!210936 (=> (not res!177119) (not e!143865))))

(assert (=> b!210936 (= res!177119 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!331583))))

(declare-fun b!210937 () Bool)

(declare-fun lt!331585 () (_ BitVec 64))

(assert (=> b!210937 (= e!143865 (bvsle lt!331583 (bvmul lt!331585 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!210937 (or (= lt!331585 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!331585 #b0000000000000000000000000000000000000000000000000000000000001000) lt!331585)))))

(assert (=> b!210937 (= lt!331585 ((_ sign_extend 32) (size!4611 (buf!5131 (_1!9683 lt!330828)))))))

(assert (= (and d!71413 res!177118) b!210936))

(assert (= (and b!210936 res!177119) b!210937))

(declare-fun m!324951 () Bool)

(assert (=> d!71413 m!324951))

(declare-fun m!324953 () Bool)

(assert (=> d!71413 m!324953))

(assert (=> b!210668 d!71413))

(declare-fun d!71415 () Bool)

(assert (=> d!71415 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9674 thiss!1204) (currentByte!9679 thiss!1204) (size!4611 (buf!5131 thiss!1204))))))

(declare-fun bs!17531 () Bool)

(assert (= bs!17531 d!71415))

(assert (=> bs!17531 m!324453))

(assert (=> start!44206 d!71415))

(push 1)

(assert (not d!71277))

(assert (not b!210934))

(assert (not b!210797))

(assert (not d!71367))

(assert (not b!210769))

(assert (not b!210800))

(assert (not d!71415))

(assert (not d!71405))

(assert (not b!210810))

(assert (not d!71345))

(assert (not b!210809))

(assert (not b!210815))

(assert (not b!210756))

(assert (not d!71377))

(assert (not b!210916))

(assert (not b!210806))

(assert (not b!210745))

(assert (not d!71403))

(assert (not b!210928))

(assert (not b!210922))

(assert (not b!210796))

(assert (not d!71365))

(assert (not b!210929))

(assert (not d!71275))

(assert (not d!71273))

(assert (not d!71349))

(assert (not b!210932))

(assert (not d!71347))

(assert (not d!71295))

(assert (not b!210807))

(assert (not b!210924))

(assert (not d!71327))

(assert (not b!210930))

(assert (not bm!3318))

(assert (not d!71291))

(assert (not d!71373))

(assert (not b!210758))

(assert (not b!210921))

(assert (not b!210931))

(assert (not d!71353))

(assert (not d!71313))

(assert (not d!71351))

(assert (not b!210746))

(assert (not b!210925))

(assert (not d!71361))

(assert (not d!71363))

(assert (not b!210813))

(assert (not d!71379))

(assert (not d!71357))

(assert (not d!71409))

(assert (not b!210799))

(assert (not b!210747))

(assert (not b!210744))

(assert (not d!71413))

(assert (not d!71355))

(assert (not d!71325))

(assert (not d!71407))

(assert (not d!71271))

(check-sat)

(pop 1)

(push 1)

(check-sat)

