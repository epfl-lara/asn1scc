; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40194 () Bool)

(assert start!40194)

(declare-fun b!183783 () Bool)

(declare-fun e!127379 () Bool)

(declare-datatypes ((array!9762 0))(
  ( (array!9763 (arr!5235 (Array (_ BitVec 32) (_ BitVec 8))) (size!4305 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7718 0))(
  ( (BitStream!7719 (buf!4760 array!9762) (currentByte!8994 (_ BitVec 32)) (currentBit!8989 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7718)

(declare-fun array_inv!4046 (array!9762) Bool)

(assert (=> b!183783 (= e!127379 (array_inv!4046 (buf!4760 thiss!1204)))))

(declare-fun b!183784 () Bool)

(declare-fun e!127388 () Bool)

(declare-fun e!127390 () Bool)

(assert (=> b!183784 (= e!127388 e!127390)))

(declare-fun res!152829 () Bool)

(assert (=> b!183784 (=> res!152829 e!127390)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!282790 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((tuple2!15876 0))(
  ( (tuple2!15877 (_1!8583 BitStream!7718) (_2!8583 BitStream!7718)) )
))
(declare-fun lt!282785 () tuple2!15876)

(declare-datatypes ((tuple2!15878 0))(
  ( (tuple2!15879 (_1!8584 BitStream!7718) (_2!8584 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7718 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15878)

(assert (=> b!183784 (= res!152829 (not (= (_1!8584 (readNBitsLSBFirstsLoopPure!0 (_1!8583 lt!282785) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!282790)) (_2!8583 lt!282785))))))

(declare-datatypes ((Unit!13185 0))(
  ( (Unit!13186) )
))
(declare-datatypes ((tuple2!15880 0))(
  ( (tuple2!15881 (_1!8585 Unit!13185) (_2!8585 BitStream!7718)) )
))
(declare-fun lt!282800 () tuple2!15880)

(declare-fun lt!282784 () tuple2!15880)

(declare-fun lt!282792 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!183784 (validate_offset_bits!1 ((_ sign_extend 32) (size!4305 (buf!4760 (_2!8585 lt!282800)))) ((_ sign_extend 32) (currentByte!8994 (_2!8585 lt!282784))) ((_ sign_extend 32) (currentBit!8989 (_2!8585 lt!282784))) lt!282792)))

(declare-fun lt!282794 () Unit!13185)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7718 array!9762 (_ BitVec 64)) Unit!13185)

(assert (=> b!183784 (= lt!282794 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8585 lt!282784) (buf!4760 (_2!8585 lt!282800)) lt!282792))))

(assert (=> b!183784 (= lt!282792 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!15882 0))(
  ( (tuple2!15883 (_1!8586 BitStream!7718) (_2!8586 Bool)) )
))
(declare-fun lt!282787 () tuple2!15882)

(declare-fun lt!282780 () (_ BitVec 64))

(declare-fun lt!282781 () (_ BitVec 64))

(assert (=> b!183784 (= lt!282790 (bvor lt!282780 (ite (_2!8586 lt!282787) lt!282781 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!282789 () tuple2!15878)

(declare-fun lt!282799 () tuple2!15876)

(assert (=> b!183784 (= lt!282789 (readNBitsLSBFirstsLoopPure!0 (_1!8583 lt!282799) nBits!348 i!590 lt!282780))))

(declare-fun lt!282795 () (_ BitVec 64))

(assert (=> b!183784 (validate_offset_bits!1 ((_ sign_extend 32) (size!4305 (buf!4760 (_2!8585 lt!282800)))) ((_ sign_extend 32) (currentByte!8994 thiss!1204)) ((_ sign_extend 32) (currentBit!8989 thiss!1204)) lt!282795)))

(declare-fun lt!282775 () Unit!13185)

(assert (=> b!183784 (= lt!282775 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4760 (_2!8585 lt!282800)) lt!282795))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!183784 (= lt!282780 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!282776 () Bool)

(assert (=> b!183784 (= (_2!8586 lt!282787) lt!282776)))

(declare-fun readBitPure!0 (BitStream!7718) tuple2!15882)

(assert (=> b!183784 (= lt!282787 (readBitPure!0 (_1!8583 lt!282799)))))

(declare-fun reader!0 (BitStream!7718 BitStream!7718) tuple2!15876)

(assert (=> b!183784 (= lt!282785 (reader!0 (_2!8585 lt!282784) (_2!8585 lt!282800)))))

(assert (=> b!183784 (= lt!282799 (reader!0 thiss!1204 (_2!8585 lt!282800)))))

(declare-fun e!127382 () Bool)

(assert (=> b!183784 e!127382))

(declare-fun res!152841 () Bool)

(assert (=> b!183784 (=> (not res!152841) (not e!127382))))

(declare-fun lt!282793 () tuple2!15882)

(declare-fun lt!282786 () tuple2!15882)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!183784 (= res!152841 (= (bitIndex!0 (size!4305 (buf!4760 (_1!8586 lt!282793))) (currentByte!8994 (_1!8586 lt!282793)) (currentBit!8989 (_1!8586 lt!282793))) (bitIndex!0 (size!4305 (buf!4760 (_1!8586 lt!282786))) (currentByte!8994 (_1!8586 lt!282786)) (currentBit!8989 (_1!8586 lt!282786)))))))

(declare-fun lt!282778 () Unit!13185)

(declare-fun lt!282788 () BitStream!7718)

(declare-fun readBitPrefixLemma!0 (BitStream!7718 BitStream!7718) Unit!13185)

(assert (=> b!183784 (= lt!282778 (readBitPrefixLemma!0 lt!282788 (_2!8585 lt!282800)))))

(assert (=> b!183784 (= lt!282786 (readBitPure!0 (BitStream!7719 (buf!4760 (_2!8585 lt!282800)) (currentByte!8994 thiss!1204) (currentBit!8989 thiss!1204))))))

(assert (=> b!183784 (= lt!282793 (readBitPure!0 lt!282788))))

(declare-fun e!127386 () Bool)

(assert (=> b!183784 e!127386))

(declare-fun res!152826 () Bool)

(assert (=> b!183784 (=> (not res!152826) (not e!127386))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!183784 (= res!152826 (invariant!0 (currentBit!8989 thiss!1204) (currentByte!8994 thiss!1204) (size!4305 (buf!4760 (_2!8585 lt!282784)))))))

(assert (=> b!183784 (= lt!282788 (BitStream!7719 (buf!4760 (_2!8585 lt!282784)) (currentByte!8994 thiss!1204) (currentBit!8989 thiss!1204)))))

(declare-fun b!183785 () Bool)

(declare-fun e!127381 () Bool)

(declare-fun e!127383 () Bool)

(assert (=> b!183785 (= e!127381 e!127383)))

(declare-fun res!152824 () Bool)

(assert (=> b!183785 (=> (not res!152824) (not e!127383))))

(assert (=> b!183785 (= res!152824 (validate_offset_bits!1 ((_ sign_extend 32) (size!4305 (buf!4760 thiss!1204))) ((_ sign_extend 32) (currentByte!8994 thiss!1204)) ((_ sign_extend 32) (currentBit!8989 thiss!1204)) lt!282795))))

(assert (=> b!183785 (= lt!282795 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!183786 () Bool)

(assert (=> b!183786 (= e!127390 true)))

(declare-fun lt!282777 () tuple2!15878)

(declare-fun withMovedBitIndex!0 (BitStream!7718 (_ BitVec 64)) BitStream!7718)

(assert (=> b!183786 (= lt!282777 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8583 lt!282799) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!282790))))

(declare-fun b!183787 () Bool)

(declare-fun e!127389 () Bool)

(assert (=> b!183787 (= e!127389 e!127388)))

(declare-fun res!152837 () Bool)

(assert (=> b!183787 (=> res!152837 e!127388)))

(declare-fun lt!282782 () (_ BitVec 64))

(declare-fun lt!282791 () (_ BitVec 64))

(assert (=> b!183787 (= res!152837 (not (= lt!282791 (bvsub (bvsub (bvadd lt!282782 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!183787 (= lt!282791 (bitIndex!0 (size!4305 (buf!4760 (_2!8585 lt!282800))) (currentByte!8994 (_2!8585 lt!282800)) (currentBit!8989 (_2!8585 lt!282800))))))

(declare-fun isPrefixOf!0 (BitStream!7718 BitStream!7718) Bool)

(assert (=> b!183787 (isPrefixOf!0 thiss!1204 (_2!8585 lt!282800))))

(declare-fun lt!282797 () Unit!13185)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7718 BitStream!7718 BitStream!7718) Unit!13185)

(assert (=> b!183787 (= lt!282797 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8585 lt!282784) (_2!8585 lt!282800)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7718 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15880)

(assert (=> b!183787 (= lt!282800 (appendBitsLSBFirstLoopTR!0 (_2!8585 lt!282784) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!183788 () Bool)

(assert (=> b!183788 (= e!127383 (not e!127389))))

(declare-fun res!152830 () Bool)

(assert (=> b!183788 (=> res!152830 e!127389)))

(declare-fun lt!282783 () (_ BitVec 64))

(assert (=> b!183788 (= res!152830 (not (= lt!282782 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!282783))))))

(assert (=> b!183788 (= lt!282782 (bitIndex!0 (size!4305 (buf!4760 (_2!8585 lt!282784))) (currentByte!8994 (_2!8585 lt!282784)) (currentBit!8989 (_2!8585 lt!282784))))))

(assert (=> b!183788 (= lt!282783 (bitIndex!0 (size!4305 (buf!4760 thiss!1204)) (currentByte!8994 thiss!1204) (currentBit!8989 thiss!1204)))))

(declare-fun e!127380 () Bool)

(assert (=> b!183788 e!127380))

(declare-fun res!152842 () Bool)

(assert (=> b!183788 (=> (not res!152842) (not e!127380))))

(assert (=> b!183788 (= res!152842 (= (size!4305 (buf!4760 thiss!1204)) (size!4305 (buf!4760 (_2!8585 lt!282784)))))))

(declare-fun appendBit!0 (BitStream!7718 Bool) tuple2!15880)

(assert (=> b!183788 (= lt!282784 (appendBit!0 thiss!1204 lt!282776))))

(assert (=> b!183788 (= lt!282776 (not (= (bvand v!189 lt!282781) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!183788 (= lt!282781 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun res!152828 () Bool)

(assert (=> start!40194 (=> (not res!152828) (not e!127381))))

(assert (=> start!40194 (= res!152828 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40194 e!127381))

(assert (=> start!40194 true))

(declare-fun inv!12 (BitStream!7718) Bool)

(assert (=> start!40194 (and (inv!12 thiss!1204) e!127379)))

(declare-fun b!183789 () Bool)

(declare-fun e!127387 () Bool)

(declare-fun e!127384 () Bool)

(assert (=> b!183789 (= e!127387 e!127384)))

(declare-fun res!152827 () Bool)

(assert (=> b!183789 (=> (not res!152827) (not e!127384))))

(declare-fun lt!282779 () tuple2!15882)

(assert (=> b!183789 (= res!152827 (and (= (_2!8586 lt!282779) lt!282776) (= (_1!8586 lt!282779) (_2!8585 lt!282784))))))

(declare-fun readerFrom!0 (BitStream!7718 (_ BitVec 32) (_ BitVec 32)) BitStream!7718)

(assert (=> b!183789 (= lt!282779 (readBitPure!0 (readerFrom!0 (_2!8585 lt!282784) (currentBit!8989 thiss!1204) (currentByte!8994 thiss!1204))))))

(declare-fun b!183790 () Bool)

(declare-fun res!152825 () Bool)

(assert (=> b!183790 (=> res!152825 e!127390)))

(assert (=> b!183790 (= res!152825 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4305 (buf!4760 (_1!8583 lt!282799)))) ((_ sign_extend 32) (currentByte!8994 (_1!8583 lt!282799))) ((_ sign_extend 32) (currentBit!8989 (_1!8583 lt!282799))) lt!282795)))))

(declare-fun b!183791 () Bool)

(declare-fun res!152843 () Bool)

(assert (=> b!183791 (=> res!152843 e!127388)))

(assert (=> b!183791 (= res!152843 (not (isPrefixOf!0 thiss!1204 (_2!8585 lt!282784))))))

(declare-fun b!183792 () Bool)

(declare-fun lt!282796 () (_ BitVec 64))

(assert (=> b!183792 (= e!127384 (= (bitIndex!0 (size!4305 (buf!4760 (_1!8586 lt!282779))) (currentByte!8994 (_1!8586 lt!282779)) (currentBit!8989 (_1!8586 lt!282779))) lt!282796))))

(declare-fun b!183793 () Bool)

(declare-fun res!152838 () Bool)

(assert (=> b!183793 (=> (not res!152838) (not e!127387))))

(assert (=> b!183793 (= res!152838 (isPrefixOf!0 thiss!1204 (_2!8585 lt!282784)))))

(declare-fun b!183794 () Bool)

(declare-fun res!152839 () Bool)

(assert (=> b!183794 (=> (not res!152839) (not e!127383))))

(assert (=> b!183794 (= res!152839 (not (= i!590 nBits!348)))))

(declare-fun b!183795 () Bool)

(declare-fun res!152844 () Bool)

(assert (=> b!183795 (=> res!152844 e!127388)))

(assert (=> b!183795 (= res!152844 (not (invariant!0 (currentBit!8989 (_2!8585 lt!282800)) (currentByte!8994 (_2!8585 lt!282800)) (size!4305 (buf!4760 (_2!8585 lt!282800))))))))

(declare-fun b!183796 () Bool)

(assert (=> b!183796 (= e!127382 (= (_2!8586 lt!282793) (_2!8586 lt!282786)))))

(declare-fun b!183797 () Bool)

(declare-fun res!152840 () Bool)

(assert (=> b!183797 (=> res!152840 e!127390)))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!183797 (= res!152840 (not (= (bvand lt!282780 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!183798 () Bool)

(declare-fun res!152835 () Bool)

(assert (=> b!183798 (=> res!152835 e!127388)))

(assert (=> b!183798 (= res!152835 (or (not (= (size!4305 (buf!4760 (_2!8585 lt!282800))) (size!4305 (buf!4760 thiss!1204)))) (not (= lt!282791 (bvsub (bvadd lt!282783 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!183799 () Bool)

(declare-fun res!152831 () Bool)

(assert (=> b!183799 (=> res!152831 e!127388)))

(assert (=> b!183799 (= res!152831 (not (isPrefixOf!0 (_2!8585 lt!282784) (_2!8585 lt!282800))))))

(declare-fun b!183800 () Bool)

(declare-fun res!152834 () Bool)

(assert (=> b!183800 (=> res!152834 e!127390)))

(assert (=> b!183800 (= res!152834 (bvsge i!590 nBits!348))))

(declare-fun b!183801 () Bool)

(assert (=> b!183801 (= e!127386 (invariant!0 (currentBit!8989 thiss!1204) (currentByte!8994 thiss!1204) (size!4305 (buf!4760 (_2!8585 lt!282800)))))))

(declare-fun b!183802 () Bool)

(assert (=> b!183802 (= e!127380 e!127387)))

(declare-fun res!152832 () Bool)

(assert (=> b!183802 (=> (not res!152832) (not e!127387))))

(declare-fun lt!282798 () (_ BitVec 64))

(assert (=> b!183802 (= res!152832 (= lt!282796 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!282798)))))

(assert (=> b!183802 (= lt!282796 (bitIndex!0 (size!4305 (buf!4760 (_2!8585 lt!282784))) (currentByte!8994 (_2!8585 lt!282784)) (currentBit!8989 (_2!8585 lt!282784))))))

(assert (=> b!183802 (= lt!282798 (bitIndex!0 (size!4305 (buf!4760 thiss!1204)) (currentByte!8994 thiss!1204) (currentBit!8989 thiss!1204)))))

(declare-fun b!183803 () Bool)

(declare-fun res!152836 () Bool)

(assert (=> b!183803 (=> (not res!152836) (not e!127383))))

(assert (=> b!183803 (= res!152836 (invariant!0 (currentBit!8989 thiss!1204) (currentByte!8994 thiss!1204) (size!4305 (buf!4760 thiss!1204))))))

(declare-fun b!183804 () Bool)

(declare-fun res!152833 () Bool)

(assert (=> b!183804 (=> res!152833 e!127390)))

(assert (=> b!183804 (= res!152833 (not (= (bvand lt!282780 #b1111111111111111111111111111111111111111111111111111111111111111) lt!282780)))))

(assert (= (and start!40194 res!152828) b!183785))

(assert (= (and b!183785 res!152824) b!183803))

(assert (= (and b!183803 res!152836) b!183794))

(assert (= (and b!183794 res!152839) b!183788))

(assert (= (and b!183788 res!152842) b!183802))

(assert (= (and b!183802 res!152832) b!183793))

(assert (= (and b!183793 res!152838) b!183789))

(assert (= (and b!183789 res!152827) b!183792))

(assert (= (and b!183788 (not res!152830)) b!183787))

(assert (= (and b!183787 (not res!152837)) b!183795))

(assert (= (and b!183795 (not res!152844)) b!183798))

(assert (= (and b!183798 (not res!152835)) b!183799))

(assert (= (and b!183799 (not res!152831)) b!183791))

(assert (= (and b!183791 (not res!152843)) b!183784))

(assert (= (and b!183784 res!152826) b!183801))

(assert (= (and b!183784 res!152841) b!183796))

(assert (= (and b!183784 (not res!152829)) b!183800))

(assert (= (and b!183800 (not res!152834)) b!183790))

(assert (= (and b!183790 (not res!152825)) b!183797))

(assert (= (and b!183797 (not res!152840)) b!183804))

(assert (= (and b!183804 (not res!152833)) b!183786))

(assert (= start!40194 b!183783))

(declare-fun m!285753 () Bool)

(assert (=> b!183784 m!285753))

(declare-fun m!285755 () Bool)

(assert (=> b!183784 m!285755))

(declare-fun m!285757 () Bool)

(assert (=> b!183784 m!285757))

(declare-fun m!285759 () Bool)

(assert (=> b!183784 m!285759))

(declare-fun m!285761 () Bool)

(assert (=> b!183784 m!285761))

(declare-fun m!285763 () Bool)

(assert (=> b!183784 m!285763))

(declare-fun m!285765 () Bool)

(assert (=> b!183784 m!285765))

(declare-fun m!285767 () Bool)

(assert (=> b!183784 m!285767))

(declare-fun m!285769 () Bool)

(assert (=> b!183784 m!285769))

(declare-fun m!285771 () Bool)

(assert (=> b!183784 m!285771))

(declare-fun m!285773 () Bool)

(assert (=> b!183784 m!285773))

(declare-fun m!285775 () Bool)

(assert (=> b!183784 m!285775))

(declare-fun m!285777 () Bool)

(assert (=> b!183784 m!285777))

(declare-fun m!285779 () Bool)

(assert (=> b!183784 m!285779))

(declare-fun m!285781 () Bool)

(assert (=> b!183784 m!285781))

(declare-fun m!285783 () Bool)

(assert (=> b!183784 m!285783))

(declare-fun m!285785 () Bool)

(assert (=> b!183792 m!285785))

(declare-fun m!285787 () Bool)

(assert (=> b!183783 m!285787))

(declare-fun m!285789 () Bool)

(assert (=> b!183795 m!285789))

(declare-fun m!285791 () Bool)

(assert (=> b!183789 m!285791))

(assert (=> b!183789 m!285791))

(declare-fun m!285793 () Bool)

(assert (=> b!183789 m!285793))

(declare-fun m!285795 () Bool)

(assert (=> b!183788 m!285795))

(declare-fun m!285797 () Bool)

(assert (=> b!183788 m!285797))

(declare-fun m!285799 () Bool)

(assert (=> b!183788 m!285799))

(declare-fun m!285801 () Bool)

(assert (=> start!40194 m!285801))

(declare-fun m!285803 () Bool)

(assert (=> b!183797 m!285803))

(declare-fun m!285805 () Bool)

(assert (=> b!183791 m!285805))

(assert (=> b!183802 m!285795))

(assert (=> b!183802 m!285797))

(declare-fun m!285807 () Bool)

(assert (=> b!183799 m!285807))

(assert (=> b!183793 m!285805))

(declare-fun m!285809 () Bool)

(assert (=> b!183787 m!285809))

(declare-fun m!285811 () Bool)

(assert (=> b!183787 m!285811))

(declare-fun m!285813 () Bool)

(assert (=> b!183787 m!285813))

(declare-fun m!285815 () Bool)

(assert (=> b!183787 m!285815))

(declare-fun m!285817 () Bool)

(assert (=> b!183801 m!285817))

(declare-fun m!285819 () Bool)

(assert (=> b!183785 m!285819))

(declare-fun m!285821 () Bool)

(assert (=> b!183803 m!285821))

(declare-fun m!285823 () Bool)

(assert (=> b!183790 m!285823))

(declare-fun m!285825 () Bool)

(assert (=> b!183786 m!285825))

(assert (=> b!183786 m!285825))

(declare-fun m!285827 () Bool)

(assert (=> b!183786 m!285827))

(push 1)

