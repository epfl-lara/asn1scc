; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3644 () Bool)

(assert start!3644)

(declare-fun b!15795 () Bool)

(declare-fun res!14672 () Bool)

(declare-fun e!9855 () Bool)

(assert (=> b!15795 (=> (not res!14672) (not e!9855))))

(declare-datatypes ((array!949 0))(
  ( (array!950 (arr!831 (Array (_ BitVec 32) (_ BitVec 8))) (size!402 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!764 0))(
  ( (BitStream!765 (buf!765 array!949) (currentByte!1934 (_ BitVec 32)) (currentBit!1929 (_ BitVec 32))) )
))
(declare-fun thiss!1073 () BitStream!764)

(declare-datatypes ((Unit!1297 0))(
  ( (Unit!1298) )
))
(declare-datatypes ((tuple2!1896 0))(
  ( (tuple2!1897 (_1!1009 Unit!1297) (_2!1009 BitStream!764)) )
))
(declare-fun lt!24145 () tuple2!1896)

(declare-fun isPrefixOf!0 (BitStream!764 BitStream!764) Bool)

(assert (=> b!15795 (= res!14672 (isPrefixOf!0 thiss!1073 (_2!1009 lt!24145)))))

(declare-fun b!15796 () Bool)

(declare-fun res!14673 () Bool)

(declare-fun e!9857 () Bool)

(assert (=> b!15796 (=> (not res!14673) (not e!9857))))

(declare-fun nBits!313 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!15796 (= res!14673 (validate_offset_bits!1 ((_ sign_extend 32) (size!402 (buf!765 thiss!1073))) ((_ sign_extend 32) (currentByte!1934 thiss!1073)) ((_ sign_extend 32) (currentBit!1929 thiss!1073)) nBits!313))))

(declare-fun b!15797 () Bool)

(declare-fun res!14674 () Bool)

(assert (=> b!15797 (=> (not res!14674) (not e!9855))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!15797 (= res!14674 (= (bitIndex!0 (size!402 (buf!765 (_2!1009 lt!24145))) (currentByte!1934 (_2!1009 lt!24145)) (currentBit!1929 (_2!1009 lt!24145))) (bvadd (bitIndex!0 (size!402 (buf!765 thiss!1073)) (currentByte!1934 thiss!1073) (currentBit!1929 thiss!1073)) nBits!313)))))

(declare-fun b!15798 () Bool)

(assert (=> b!15798 (= e!9857 (not true))))

(declare-datatypes ((tuple2!1898 0))(
  ( (tuple2!1899 (_1!1010 BitStream!764) (_2!1010 BitStream!764)) )
))
(declare-fun lt!24147 () tuple2!1898)

(declare-fun reader!0 (BitStream!764 BitStream!764) tuple2!1898)

(assert (=> b!15798 (= lt!24147 (reader!0 thiss!1073 (_2!1009 lt!24145)))))

(declare-fun lt!24146 () Bool)

(assert (=> b!15798 (= lt!24146 (isPrefixOf!0 thiss!1073 (_2!1009 lt!24145)))))

(declare-fun lt!24141 () (_ BitVec 64))

(assert (=> b!15798 (= lt!24141 (bitIndex!0 (size!402 (buf!765 (_2!1009 lt!24145))) (currentByte!1934 (_2!1009 lt!24145)) (currentBit!1929 (_2!1009 lt!24145))))))

(declare-fun lt!24148 () (_ BitVec 64))

(assert (=> b!15798 (= lt!24148 (bitIndex!0 (size!402 (buf!765 thiss!1073)) (currentByte!1934 thiss!1073) (currentBit!1929 thiss!1073)))))

(assert (=> b!15798 e!9855))

(declare-fun res!14671 () Bool)

(assert (=> b!15798 (=> (not res!14671) (not e!9855))))

(assert (=> b!15798 (= res!14671 (= (size!402 (buf!765 thiss!1073)) (size!402 (buf!765 (_2!1009 lt!24145)))))))

(declare-fun appendNBits!0 (BitStream!764 (_ BitVec 64) Bool) tuple2!1896)

(assert (=> b!15798 (= lt!24145 (appendNBits!0 thiss!1073 nBits!313 true))))

(declare-fun res!14675 () Bool)

(assert (=> start!3644 (=> (not res!14675) (not e!9857))))

(assert (=> start!3644 (= res!14675 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!3644 e!9857))

(assert (=> start!3644 true))

(declare-fun e!9856 () Bool)

(declare-fun inv!12 (BitStream!764) Bool)

(assert (=> start!3644 (and (inv!12 thiss!1073) e!9856)))

(declare-fun b!15799 () Bool)

(declare-datatypes ((tuple2!1900 0))(
  ( (tuple2!1901 (_1!1011 BitStream!764) (_2!1011 Bool)) )
))
(declare-fun lt!24142 () tuple2!1900)

(declare-fun lt!24143 () tuple2!1898)

(assert (=> b!15799 (= e!9855 (not (or (not (_2!1011 lt!24142)) (not (= (_1!1011 lt!24142) (_2!1010 lt!24143))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!764 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1900)

(assert (=> b!15799 (= lt!24142 (checkBitsLoopPure!0 (_1!1010 lt!24143) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!15799 (validate_offset_bits!1 ((_ sign_extend 32) (size!402 (buf!765 (_2!1009 lt!24145)))) ((_ sign_extend 32) (currentByte!1934 thiss!1073)) ((_ sign_extend 32) (currentBit!1929 thiss!1073)) nBits!313)))

(declare-fun lt!24144 () Unit!1297)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!764 array!949 (_ BitVec 64)) Unit!1297)

(assert (=> b!15799 (= lt!24144 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!765 (_2!1009 lt!24145)) nBits!313))))

(assert (=> b!15799 (= lt!24143 (reader!0 thiss!1073 (_2!1009 lt!24145)))))

(declare-fun b!15800 () Bool)

(declare-fun array_inv!391 (array!949) Bool)

(assert (=> b!15800 (= e!9856 (array_inv!391 (buf!765 thiss!1073)))))

(assert (= (and start!3644 res!14675) b!15796))

(assert (= (and b!15796 res!14673) b!15798))

(assert (= (and b!15798 res!14671) b!15797))

(assert (= (and b!15797 res!14674) b!15795))

(assert (= (and b!15795 res!14672) b!15799))

(assert (= start!3644 b!15800))

(declare-fun m!22535 () Bool)

(assert (=> b!15799 m!22535))

(declare-fun m!22537 () Bool)

(assert (=> b!15799 m!22537))

(declare-fun m!22539 () Bool)

(assert (=> b!15799 m!22539))

(declare-fun m!22541 () Bool)

(assert (=> b!15799 m!22541))

(declare-fun m!22543 () Bool)

(assert (=> b!15797 m!22543))

(declare-fun m!22545 () Bool)

(assert (=> b!15797 m!22545))

(declare-fun m!22547 () Bool)

(assert (=> b!15800 m!22547))

(declare-fun m!22549 () Bool)

(assert (=> b!15796 m!22549))

(declare-fun m!22551 () Bool)

(assert (=> start!3644 m!22551))

(assert (=> b!15798 m!22545))

(assert (=> b!15798 m!22541))

(assert (=> b!15798 m!22543))

(declare-fun m!22553 () Bool)

(assert (=> b!15798 m!22553))

(declare-fun m!22555 () Bool)

(assert (=> b!15798 m!22555))

(assert (=> b!15795 m!22553))

(push 1)

