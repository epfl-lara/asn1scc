; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3642 () Bool)

(assert start!3642)

(declare-fun res!14660 () Bool)

(declare-fun e!9843 () Bool)

(assert (=> start!3642 (=> (not res!14660) (not e!9843))))

(declare-fun nBits!313 () (_ BitVec 64))

(assert (=> start!3642 (= res!14660 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!3642 e!9843))

(assert (=> start!3642 true))

(declare-datatypes ((array!947 0))(
  ( (array!948 (arr!830 (Array (_ BitVec 32) (_ BitVec 8))) (size!401 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!762 0))(
  ( (BitStream!763 (buf!764 array!947) (currentByte!1933 (_ BitVec 32)) (currentBit!1928 (_ BitVec 32))) )
))
(declare-fun thiss!1073 () BitStream!762)

(declare-fun e!9845 () Bool)

(declare-fun inv!12 (BitStream!762) Bool)

(assert (=> start!3642 (and (inv!12 thiss!1073) e!9845)))

(declare-fun b!15777 () Bool)

(declare-fun res!14657 () Bool)

(assert (=> b!15777 (=> (not res!14657) (not e!9843))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!15777 (= res!14657 (validate_offset_bits!1 ((_ sign_extend 32) (size!401 (buf!764 thiss!1073))) ((_ sign_extend 32) (currentByte!1933 thiss!1073)) ((_ sign_extend 32) (currentBit!1928 thiss!1073)) nBits!313))))

(declare-fun b!15778 () Bool)

(declare-fun res!14656 () Bool)

(declare-fun e!9844 () Bool)

(assert (=> b!15778 (=> (not res!14656) (not e!9844))))

(declare-datatypes ((Unit!1295 0))(
  ( (Unit!1296) )
))
(declare-datatypes ((tuple2!1890 0))(
  ( (tuple2!1891 (_1!1006 Unit!1295) (_2!1006 BitStream!762)) )
))
(declare-fun lt!24124 () tuple2!1890)

(declare-fun isPrefixOf!0 (BitStream!762 BitStream!762) Bool)

(assert (=> b!15778 (= res!14656 (isPrefixOf!0 thiss!1073 (_2!1006 lt!24124)))))

(declare-fun b!15779 () Bool)

(assert (=> b!15779 (= e!9843 (not true))))

(declare-datatypes ((tuple2!1892 0))(
  ( (tuple2!1893 (_1!1007 BitStream!762) (_2!1007 BitStream!762)) )
))
(declare-fun lt!24123 () tuple2!1892)

(declare-fun reader!0 (BitStream!762 BitStream!762) tuple2!1892)

(assert (=> b!15779 (= lt!24123 (reader!0 thiss!1073 (_2!1006 lt!24124)))))

(declare-fun lt!24117 () Bool)

(assert (=> b!15779 (= lt!24117 (isPrefixOf!0 thiss!1073 (_2!1006 lt!24124)))))

(declare-fun lt!24121 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!15779 (= lt!24121 (bitIndex!0 (size!401 (buf!764 (_2!1006 lt!24124))) (currentByte!1933 (_2!1006 lt!24124)) (currentBit!1928 (_2!1006 lt!24124))))))

(declare-fun lt!24119 () (_ BitVec 64))

(assert (=> b!15779 (= lt!24119 (bitIndex!0 (size!401 (buf!764 thiss!1073)) (currentByte!1933 thiss!1073) (currentBit!1928 thiss!1073)))))

(assert (=> b!15779 e!9844))

(declare-fun res!14659 () Bool)

(assert (=> b!15779 (=> (not res!14659) (not e!9844))))

(assert (=> b!15779 (= res!14659 (= (size!401 (buf!764 thiss!1073)) (size!401 (buf!764 (_2!1006 lt!24124)))))))

(declare-fun appendNBits!0 (BitStream!762 (_ BitVec 64) Bool) tuple2!1890)

(assert (=> b!15779 (= lt!24124 (appendNBits!0 thiss!1073 nBits!313 true))))

(declare-fun b!15780 () Bool)

(declare-fun array_inv!390 (array!947) Bool)

(assert (=> b!15780 (= e!9845 (array_inv!390 (buf!764 thiss!1073)))))

(declare-fun b!15781 () Bool)

(declare-datatypes ((tuple2!1894 0))(
  ( (tuple2!1895 (_1!1008 BitStream!762) (_2!1008 Bool)) )
))
(declare-fun lt!24120 () tuple2!1894)

(declare-fun lt!24118 () tuple2!1892)

(assert (=> b!15781 (= e!9844 (not (or (not (_2!1008 lt!24120)) (not (= (_1!1008 lt!24120) (_2!1007 lt!24118))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!762 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1894)

(assert (=> b!15781 (= lt!24120 (checkBitsLoopPure!0 (_1!1007 lt!24118) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!15781 (validate_offset_bits!1 ((_ sign_extend 32) (size!401 (buf!764 (_2!1006 lt!24124)))) ((_ sign_extend 32) (currentByte!1933 thiss!1073)) ((_ sign_extend 32) (currentBit!1928 thiss!1073)) nBits!313)))

(declare-fun lt!24122 () Unit!1295)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!762 array!947 (_ BitVec 64)) Unit!1295)

(assert (=> b!15781 (= lt!24122 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!764 (_2!1006 lt!24124)) nBits!313))))

(assert (=> b!15781 (= lt!24118 (reader!0 thiss!1073 (_2!1006 lt!24124)))))

(declare-fun b!15782 () Bool)

(declare-fun res!14658 () Bool)

(assert (=> b!15782 (=> (not res!14658) (not e!9844))))

(assert (=> b!15782 (= res!14658 (= (bitIndex!0 (size!401 (buf!764 (_2!1006 lt!24124))) (currentByte!1933 (_2!1006 lt!24124)) (currentBit!1928 (_2!1006 lt!24124))) (bvadd (bitIndex!0 (size!401 (buf!764 thiss!1073)) (currentByte!1933 thiss!1073) (currentBit!1928 thiss!1073)) nBits!313)))))

(assert (= (and start!3642 res!14660) b!15777))

(assert (= (and b!15777 res!14657) b!15779))

(assert (= (and b!15779 res!14659) b!15782))

(assert (= (and b!15782 res!14658) b!15778))

(assert (= (and b!15778 res!14656) b!15781))

(assert (= start!3642 b!15780))

(declare-fun m!22513 () Bool)

(assert (=> start!3642 m!22513))

(declare-fun m!22515 () Bool)

(assert (=> b!15781 m!22515))

(declare-fun m!22517 () Bool)

(assert (=> b!15781 m!22517))

(declare-fun m!22519 () Bool)

(assert (=> b!15781 m!22519))

(declare-fun m!22521 () Bool)

(assert (=> b!15781 m!22521))

(declare-fun m!22523 () Bool)

(assert (=> b!15778 m!22523))

(declare-fun m!22525 () Bool)

(assert (=> b!15779 m!22525))

(assert (=> b!15779 m!22521))

(assert (=> b!15779 m!22523))

(declare-fun m!22527 () Bool)

(assert (=> b!15779 m!22527))

(declare-fun m!22529 () Bool)

(assert (=> b!15779 m!22529))

(assert (=> b!15782 m!22529))

(assert (=> b!15782 m!22525))

(declare-fun m!22531 () Bool)

(assert (=> b!15777 m!22531))

(declare-fun m!22533 () Bool)

(assert (=> b!15780 m!22533))

(check-sat (not b!15781) (not b!15782) (not start!3642) (not b!15780) (not b!15779) (not b!15778) (not b!15777))
